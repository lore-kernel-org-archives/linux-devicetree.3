Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE04343F1;
	Wed, 22 Jul 2026 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705438; cv=none; b=ktR8MlQ6vjyKEE+uhypE0VpVhpGDgtscwF1r+hova4LGqGJVNFrWu4OX7xyzIajAREP601c5fBq1Nfg45j2/tw9CXuy/6EYNUvNkbRKh2APy3oxCs+roda3vEx7Lc4VbAi0YXbnHVqUPLpLJ5t8Z3jTiFKSEGI6vC59EyYGDFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705438; c=relaxed/simple;
	bh=lD8rUGDfTS2tFVvoNY87ynrfkOFQlinGJQaGXHXFzfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfPuifpSrHZUGDKzSmJaSPFEoSCYByh4EfLPiyuQOoQj+mWU8ikUdjHI8CKugNvmjTS4EoFHOBwe04P70157nFFHKrsj8mzttqMJhXAwbrfh09EOjemEV9/jyaX9DXR9atIYVBI3qoxvtaNbfJC5d1I1u6ynlw/VAtO+Q2b3yxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFcXJMX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFcXJMX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3F91F000E9;
	Wed, 22 Jul 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705435;
	bh=kwjI4SjsuxrugEIjGdIbPIvz16hb8YWNyfI/Ze73goI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFcXJMX8qYvSXG1u+NpMHNTxNGWR3E/FGPI2MOgVOuD0z6A6VwsnCFU7yi6XRcnDU
	 7zIuvR7FMhDfNhDnPs/bJI4u9ObH9lFsRfS9lI9hq+8AO+kDrm52oSoRCOhm6FROMc
	 kvno8YXo0vArG7YNlv5GOLF4mcnKnxlgCPdTnSEvYW0xnL21WXFr4nCAWOLfT1YHhp
	 b0ZUEN6DV3OnWjVIHBAM1oVt0WCrIm8PekZcP6mMUUnrFfsN++1+Oh7cUOTu1M9WWy
	 BAR/e5Tk6TyODCm7jZC/GCadEZ1bzLD2rhQsueSBNy1ZhOauG+v/6rnNbnt35UVWSK
	 /SeGsl7ZpnCBQ==
Date: Wed, 22 Jul 2026 09:30:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] of: resolve alias-prefixed paths under
 devtree_lock
Message-ID: <20260722-noisy-husky-of-security-6dd93c@quoll>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai>

On Tue, Jul 21, 2026 at 06:01:46PM -0700, Abdurrahman Hussain wrote:
> of_find_node_opts_by_path() resolves an alias-prefixed path by
> walking the property list of the of_aliases node with no lock held
> and no reference taken on the node. Property surgery on /aliases =E2=80=94
> of_add_property(), of_remove_property(), changeset apply/revert =E2=80=94
> mutates that list under devtree_lock, so the lockless walk can step
> into a property that is being unlinked. Nothing keeps the node itself
> alive across the walk either: detaching /aliases and dropping the
> last reference frees the node and its property list mid-iteration.
>=20
> The race has existed since the walk was introduced, but is hard to
> hit with a boot-FDT /aliases node that nothing ever detaches. The
> rest of this series makes /aliases dynamic =E2=80=94 overlays can add and
> remove properties, and create and destroy the node itself =E2=80=94 so cl=
ose
> it first: find the matching property under devtree_lock with a
> reference held on of_aliases, and keep that reference across the
> of_find_node_by_path() call that resolves the value. The reference is
> what keeps the value string valid outside the lock: a concurrently
> removed property moves to the node's deadprops list and is only freed
> when the node itself is released.
>=20
> While here, validate the value's shape before handing it to
> of_find_node_by_path(): /aliases contents can now come from overlays

Can it?

> and from raw changeset/of_add_property() callers, and only the
> overlay path validates at the producer. of_alias_value_ok() (shared
> with the alias tracking added later in this series) rejects values
> that are not non-empty C strings NUL-terminated within the property
> length, so the consumer no longer trusts any producer. This also
> covers the empty property (NULL value) that previously crashed in
> strchr().

All this looks like AI written.

>=20
> The name match is folded into one bounded strncmp plus a check of the
> terminating NUL instead of strlen + strncmp, halving the string
> traversal now done with interrupts disabled.
>=20
> Assisted-by: Claude:claude-fable-5 [Claude Code]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  drivers/of/base.c       | 26 ++++++++++++++++++--------
>  drivers/of/of_private.h |  7 +++++++
>  2 files changed, 25 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3..9c2770823889 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -995,6 +995,8 @@ struct device_node *of_find_node_opts_by_path(const c=
har *path, const char **opt
> =20
>  	/* The path could begin with an alias */
>  	if (*path !=3D '/') {
> +		struct device_node *aliases;
> +		const char *value =3D NULL;
>  		int len;
>  		const char *p =3D strchrnul(path, '/');
> =20
> @@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(con=
st char *path, const char **opt
>  			p =3D separator;
>  		len =3D p - path;
> =20
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> -			return NULL;
> -
> -		for_each_property_of_node(of_aliases, pp) {
> -			if (strlen(pp->name) =3D=3D len && !strncmp(pp->name, path, len)) {
> -				np =3D of_find_node_by_path(pp->value);
> -				break;
> +		raw_spin_lock_irqsave(&devtree_lock, flags);

Since when do we lock looping over for_each_property_of_node()?

Do I understand correctly your proposal: you want to add
raw_spin_lock_irqsave() over every piece of code having for_each_XXX
OF-loop?

Best regards,
Krzysztof

