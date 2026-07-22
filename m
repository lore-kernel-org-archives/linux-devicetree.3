Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2844353A85
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683165; cv=none; b=VcDY6d0QeeaIa0ZmpAGRiht8d1bcQwd7Act6r75ukat7KOgEJkX5l7oDennZ64XMd44maX0gIBr905OFb114Ep7Fwnr5h9b4ZqRFbMWEPwl5mOC/iFw8GaVvaLSxIrP4t+ocRwOGfvLTBEiNldAb7pVqQR7tc1Tv+9I+0k48PhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683165; c=relaxed/simple;
	bh=TPp0uS2e/PrzJoMOs0DNVSf9HNWTvZoGRQ6rBy4FNwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uQhtwbktf8A6qKtV5IqqYS8jDDA7nUwOVVQ97yxubytFar6Qy+og9JOtVxVgEJf4f+hp5s/mbMMAl3GvQ9VN5/owvuYG6qDSNIi8qZZHxrMSpkAHozuhLbEveZzGil2CGOogriFWVsGuIdBtL/8d8mZ0pzkJb6wUyOM62YofNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuUuvaxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuUuvaxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5F61F000E9;
	Wed, 22 Jul 2026 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784683164;
	bh=hSBiogSaMFEw5McBKyuWxr3sSc2GH1iRDn29l77Y2gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nuUuvaxK3B7m1u1N9Zb+rtKhTnINddcn1CukQLaexuy5CYcBtDywZQnUImgfatCSt
	 EivbK26W45+NA4BUGWoIZQbrNcYbubWh2Mt+FM+geT9T4ZIuy9pEIiFmrhCre4Uwwe
	 Nb6fBHScm//iDrSVXO8KiUHgIouRMJjp43cNZEDku79aS2VRhB0NBKyeX65s+pJI3m
	 HEne+bJiAZyoNt6slJW/YNVi9POpifCPyaI1QrmUQR+F8TIM7qlXgMb/mn6ApC2VPs
	 t1ovHVbEKpGvCE1p6Sn/7+Rh/RDXSnEsFNjokFIXgsjSCZMWAp9HAThFDq4pwMv2d4
	 Gam8nEixJMUlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] of: resolve alias-prefixed paths under
 devtree_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:19:23 +0000
Message-Id: <20260722011924.3F5F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing absolute path validation in alias resolution allows in=
finite recursion, leading to kernel stack exhaustion.
- [High] `of_node_put()` called under `devtree_lock` can trigger a sleep, c=
ausing a 'scheduling while atomic' panic.
--

--- Patch [1]: [PATCH v4 1/6] of: resolve alias-prefixed paths under devtre=
e_lock ---
commit e85eedcd70255867d1859375b7ffdb99b3c4d887
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: resolve alias-prefixed paths under devtree_lock

This commit fixes a lockless walk issue in of_find_node_opts_by_path() by
finding the alias property under devtree_lock and holding a reference to the
of_aliases node. It also introduces of_alias_value_ok() to ensure the alias
value is a properly NUL-terminated string before use, preventing potential
crashes.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6e7a42dedad3f..9c27708238897 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c

[ ... ]

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
> +		aliases =3D of_node_get(of_aliases);
> +		if (aliases) {
> +			for_each_property_of_node(aliases, pp) {
> +				if (!strncmp(pp->name, path, len) &&
> +				    !pp->name[len]) {
> +					if (of_alias_value_ok(pp))
> +						value =3D pp->value;
> +					break;
> +				}
>  			}
>  		}
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +		/* the reference on @aliases keeps @value alive */
> +		if (value)
> +			np =3D of_find_node_by_path(value);
> +		of_node_put(aliases);
>  		if (!np)
>  			return NULL;
>  		path =3D p;

[Severity: High]
This isn't a bug introduced by this patch, but does the code further down in
of_find_node_opts_by_path() trigger a "scheduling while atomic" panic?

Immediately following this block, the function acquires the raw spinlock
again and calls __of_find_node_by_full_path():

	raw_spin_lock_irqsave(&devtree_lock, flags);
	if (!np)
		np =3D of_node_get(of_root);
	np =3D __of_find_node_by_full_path(np, path);
	raw_spin_unlock_irqrestore(&devtree_lock, flags);

Inside the path traversal loop of __of_find_node_by_full_path(),
of_node_put() drops the reference on the traversed node. If this is the last
reference (e.g. if the node was concurrently detached by an overlay removal=
),
of_node_release() is triggered.

of_node_release() calls fwnode_links_purge(), which acquires
fwnode_link_lock, a mutex. Attempting to lock a mutex while holding a raw
spinlock causes a panic. With dynamic /aliases overlay support, concurrent
node detachment becomes more likely.

> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 0ae16da066e2c..792756389691d 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -215,6 +215,13 @@ static inline bool is_pseudo_property(const char *pr=
op_name)
>  		!of_prop_cmp(prop_name, "linux,phandle");
>  }
> =20
> +/* alias values are deref'd as C strings; they must terminate within len=
gth */
> +static inline bool of_alias_value_ok(const struct property *pp)
> +{
> +	return pp->value && pp->length >=3D 2 &&
> +	       strnlen(pp->value, pp->length) < pp->length;
> +}

[Severity: Critical]
This is a pre-existing issue, but can this allow infinite recursion leading
to kernel stack exhaustion?

While this validation function ensures the alias is a properly null-termina=
ted
string, it doesn't verify that the value is an absolute path (i.e., starts
with '/').

If an overlay provides an alias pointing to a relative path (e.g.,
loop =3D "loop"), of_find_node_opts_by_path() extracts this value and calls
of_find_node_by_path(value) recursively. Since the value doesn't start with
'/', the function treats it as another alias and repeats the process
infinitely.

Should this also validate that the first character is '/'?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v4-0-8ad097e31e36@nexthop.ai?part=3D1
