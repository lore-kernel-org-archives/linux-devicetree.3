Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F953CFF73
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963156; cv=none; b=h1z3gZ3ZYjOaOZQ/qkPHDdXKoySESbuU4kBqeJj8jNf+KcdS/b+dPd3Wu1abAKiO2zOasY/NJyOwBQM5oQZI8RWsU8G8IJ75ALRI7XEPBubuUUQqdeqOe0J78jxrcHh5qF94NaRtuS+LACAawPfOT6LYzcRJBnCk4e6H53BXkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963156; c=relaxed/simple;
	bh=nPPphUGJMySlbZYjIX4/3XycocEqMiq4+semPsx0pAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xwt+FlXKp1CV1YBvAKCdmW+boIa99ZagqNA2VPGUCDcq5NUvMhpExBLrSSin2rCA91Hv7J+g5GP4bmC8zoE+4KmGKV4TDEz4AiVFWK/pPIeISd+JluuH04z1YoM6qBnyBTt84VvS9NEC16uHLmJYpgBJwoT9ZiFmrhgKNN0QcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uej1nNoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uej1nNoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505551F000E9;
	Wed,  5 Aug 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785963154;
	bh=uGeQiEWJVqi3jkXPn5lEdKuPqEjAXPkX5815WHrmsIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uej1nNoAjCpvGmOIqrUAdHcPdOqeJStvFXaz60eM1ywSiAZOCpYwqrYzel3w/ygjC
	 Yv4V9VqdDzGZx1Ee6EzFfnFyKCf7AHluCwsrap/NdSg0CUeFGtapwkL3v69LIAB2/k
	 qRj6SC0B3dvKJE6X6Z2b4yhFUhWVmhq4qLf8MkjddzOPuJLdlTkFQn5ioNp2uFtTCa
	 uIWi8yzTTP2VSRtXwakyjTmQS8iE0VVodgDitQTAyRPk7f0YAjMbQIm1RbD2o9CxTF
	 M+bgvoUSyTx6hZvkXfpXjZV3T7gQeOgt5tYNkiFuKkw7DFihZnt5emjQM/XBWlfEky
	 gE+EU3dym5mwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/10] of: hold a reference on of_aliases during
 alias path resolution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:52:33 +0000
Message-Id: <20260805205234.505551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling of_node_put() while holding devtree_lock (a raw spinlock) =
can cause a sleep in atomic context.
--

--- Patch [2]: [PATCH v6 02/10] of: hold a reference on of_aliases during a=
lias path resolution ---
commit 0b9ece03ae6938d97128143d8a080acc486d86ce
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: hold a reference on of_aliases during alias path resolution

The commit modifies of_find_node_opts_by_path() to take a reference on
of_aliases while iterating over its properties for alias resolution. It also
adds validation via of_alias_value_ok() to ensure the alias property points
to a valid absolute path, preventing crashes from malformed FDTs.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 477017ed6f49b..eca1f55eee872 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(con=
st char *path, const char **opt
>  			p =3D separator;
>  		len =3D p - path;
> =20
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> +		/* the load pairs with writers that retire the node */
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
> +		aliases =3D of_node_get(of_aliases);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +		if (!aliases)
>  			return NULL;
> =20
> -		for_each_property_of_node(of_aliases, pp) {
> -			if (strlen(pp->name) =3D=3D len && !strncmp(pp->name, path, len)) {
> -				np =3D of_find_node_by_path(pp->value);
> +		for_each_property_of_node(aliases, pp) {
> +			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
> +				if (of_alias_value_ok(pp))
> +					value =3D pp->value;
>  				break;
>  			}
>  		}
> +		/* the reference on @aliases keeps @value alive */
> +		if (value)
> +			np =3D of_find_node_by_path(value);
> +		of_node_put(aliases);
>  		if (!np)
>  			return NULL;
>  		path =3D p;

[Severity: High]
This isn't a bug introduced by this patch, but does the code just below this
block safely handle reference drops while holding a raw spinlock?

In of_find_node_opts_by_path(), shortly after this diff, we do:

	raw_spin_lock_irqsave(&devtree_lock, flags);
	if (!np)
		np =3D of_node_get(of_root);
	np =3D __of_find_node_by_full_path(np, path);
	raw_spin_unlock_irqrestore(&devtree_lock, flags);

Inside __of_find_node_by_full_path(), there is a call to of_node_put():

		node =3D __of_find_node_by_path(node, path);
		of_node_put(tmp);

If this node was dynamically detached (e.g., via overlay removal), could th=
is
of_node_put() call be dropping the final reference?

If the refcount drops to zero here, of_node_put() calls of_node_release().
This then calls fwnode_links_purge() which acquires fwnode_link_lock.

Since fwnode_link_lock is a sleepable mutex, can acquiring it while holding
devtree_lock (a raw spinlock with interrupts disabled) result in a sleep in
atomic context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-nh-of-alia=
s-overlay-v6-0-74f21d440819@nexthop.ai?part=3D2
