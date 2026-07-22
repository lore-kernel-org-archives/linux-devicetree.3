Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984A25A321
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682973; cv=none; b=Yq1gVaRtrRVmAY2fNi5ZxK7GM59sOsp9PyQ0uNaVRlNfMnnFYdxNuEs4Z52mrLsHS2mvtUCoYVxFPHw91oOSKCwUMaf6EWHAicEMYZKhqpei36UmdwhalutAI8AP8cGvcRUZga0rK3O0z9cUgfRpiXIxQlqr9q6cJWZ7HEDJiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682973; c=relaxed/simple;
	bh=8OMsY3vhnfR5EFhv8wafzAtnF8RFj3x3N7tFwR82FPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6IpjTimy/ObqOLCI93GAQqSolPR8skUDmyBAxJtX0/zZfnh6eL5OouavbKINX7SV7b5YP0glgBxCR3RixF6ukgyAEDQiEw8xslSsQHcpaxoNc2ohwRSiBOMjIUDkCBRBy+rsCKdplzLF8/sEqmed5uXNAMgung5ktPheo8cvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohQE/6cu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohQE/6cu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAD31F000E9;
	Wed, 22 Jul 2026 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784682971;
	bh=CiAqffpyYoigiQys2N8p1fjwA+d411GgUcyfMsYuYWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ohQE/6cuPlZh5uRMS8ddw8hiF95hANjxISyP+EJF9pMR9ssR+wMzuEhdJiXiS+iQn
	 FmzVmBtn04ElqprHvzkzuKXSQMHoU6hiHV2FLtcgt1LHigZCy8izOyzFSSkQE0iaGq
	 25sW1PPFFxuzG8mPL+Qocn9OLwubBfOTMTwGl2Ua1YC8+LixCw/bHFSnYIZ4VzIE+O
	 ZPbo5XPD3mCm+XRsl+KpWD38l2Bbby1JGLr97UQ0ESyHLvKL8NxsJAoDENuC+Xd/l8
	 tTMIpT98mlcLCtYLjYzRHLv7UNkjyGPtiNUlzMXI7njCADcB1xEu4CFadJ6iP3W3eW
	 3d6pyYEHkNzvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] of/overlay: rewrite /aliases path values to
 live-tree paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v4-5-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-5-8ad097e31e36@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:16:11 +0000
Message-Id: <20260722011611.6AAD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Valid absolute alias paths matching an overlay fragment name are s=
ilently corrupted in dup_and_fixup_symbol_prop().

Pre-existing issues:
- [High] Double free on add_changeset_property() error path for newly creat=
ed nodes.
--

--- Patch [5]: [PATCH v4 5/6] of/overlay: rewrite /aliases path values to l=
ive-tree paths ---
commit b11eb3214c77837761c517184661f83716f7e731
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: rewrite /aliases path values to live-tree paths

The commit rewrites overlay-internal alias values in /aliases to their
live-tree paths using dup_and_fixup_symbol_prop(). This ensures that
alias paths are resolvable after the overlay is applied.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index ad4e504825157..2a37b5260ba7a 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -356,6 +356,19 @@ static int add_changeset_property(struct overlay_cha=
ngeset *ovcs,
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
>  		if (IS_ERR(new_prop))
>  			return PTR_ERR(new_prop);
> +	} else if (!is_pseudo_property(overlay_prop->name) &&
> +		   of_node_is_aliases(target->np)) {
> +		/* rewrite overlay-internal alias values to live-tree paths */
> +		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);

[Severity: High]
Can valid absolute alias paths be silently corrupted if they happen to matc=
h an
overlay fragment name?

When a user defines an absolute live-tree path in /aliases (e.g.,
serial0 =3D "/soc/serial_port@1234"), the path starts with "/soc".
dup_and_fixup_symbol_prop() calls __of_find_node_by_path(), which stops
matching at the first '/' delimiter.

If the overlay contains a fragment whose name matches this first component
(e.g. a hand-named fragment "soc"), __of_find_node_by_path() returns that
fragment node. Since the fragment contains an __overlay__ child, the functi=
on
assumes it's an overlay-internal path and computes an overlay_name_len
(e.g., 16 for "/soc/__overlay__"). It then blindly slices the string at that
offset, yielding "port@1234", and concatenates it with the fragment's
target_path.

Could this transform a valid absolute live-tree alias into a corrupted path?

> +		if (new_prop =3D=3D ERR_PTR(-ENOMEM))
> +			return -ENOMEM;
> +		if (IS_ERR(new_prop)) {
> +			if (new_prop =3D=3D ERR_PTR(-EINVAL))
> +				pr_warn("%pOF/%s is not a valid string; alias will be inert\n",
> +					target->np, overlay_prop->name);
> +			/* not overlay-internal: copy verbatim, consumers validate */
> +			new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
> +		}
>  	} else {
>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	}

[Severity: High]
This is a pre-existing issue, but is there a double free on this error path
for newly created nodes?

Looking at the code just below this in add_changeset_property():

	if (!prop) {
		if (!target->in_livetree) {
			new_prop->next =3D target->np->deadprops;
			target->np->deadprops =3D new_prop;
		}
		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
						new_prop);
	}
   =20
	[ ... ]

	if (ret)
		__of_prop_free(new_prop);

If the target node is newly created (!target->in_livetree), new_prop is
prepended to target->np->deadprops. If of_changeset_add_property() fails
(e.g. -ENOMEM), __of_prop_free() is called here.

However, new_prop remains linked in the node's deadprops list. When the
error propagates, the overlay application aborts and rolls back. The rollba=
ck
destroys the target node attachment, and of_node_release() calls
property_list_free() on the node's deadprops list, freeing new_prop a second
time.

Will this result in a double-free during node destruction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v4-0-8ad097e31e36@nexthop.ai?part=3D5
