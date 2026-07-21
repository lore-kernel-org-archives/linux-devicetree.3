Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210435C6B3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670742; cv=none; b=ZtoYUyea+6S2Fr+U44GLcGeXf0FVASzeMIkeiWPNSFHc2v4tVpzdrK2jt22K2kz3Rhhz6kQfuJSzFTxHRXIc7UtHS8avaUbXaVTxSYT/g26l106XBL+t0lgMwUtdBisEdEgke+4ru54XaRfOHci+uEqYuYpmc5U6eJGpNSXQdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670742; c=relaxed/simple;
	bh=4sHSxF3WGQl4U3sZwsf91kxAMxQLOt45n3ZpvInDCKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nsfRmUpqt7UvKQxR4IvNLXTMaz3F2jppx5AD1hS7VGwON7azZ6vYVRlVKgnPVHC8RYknI0tig6Xxe8OFIJqhi8f7D7pXATU1QZyeDrqOhOvM06yIQuJGXcXOPNxGPOWtWp+4qoa7LkNVyFDg/kQK4yscvEWAF16CE/DGY4ErtUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEAeWxnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEAeWxnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2381E1F00A3D;
	Tue, 21 Jul 2026 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784670741;
	bh=Bgx/ZtUAjjrwk/tt5vbKkF3tKy8Ak/4IzQQ5PzqRb/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SEAeWxnkFfCCjOPLEa0yVfb7J/9k1a801ORAIIhFx+cEnDdexAjCTlispixbcrOCl
	 Mz3eXYmrVe7p1htOptbcq26GdjhYA3ydlHScsag7gpaxNjYV+II0g2/9Y2aUHBaNGY
	 4hxX1m//WWG0jOuST+H+jeIrB+OIAu2QqKC7g6E+/tmjWcbUee1oIekj9BNSsenFok
	 7CXgFA1r3aC4iWvrZE4u87KBgUicfBXnHMfP1TN1Nnw61Auks8at2tQ5NHnn6C1/45
	 LEUym6FEd2LOuyJgb/6tEcremDlcuwwkQN4IhIGHeA3jYxXtOlhWUwyt2/hfgOhsWh
	 j7ya49GKN8FcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v3-3-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
 <20260721-nh-of-alias-overlay-v3-3-7001028fe2f5@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:52:20 +0000
Message-Id: <20260721215221.2381E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Pseudo-properties of newly created /aliases nodes are incorrectl=
y validated as C string paths, breaking valid overlays.

Pre-existing issues:
- [High] Use-After-Free and Double Free in add_changeset_property error pat=
h.
- [Medium] Memory leak of duplicated device node on error path in add_chang=
eset_node().
--

--- Patch [3]: [PATCH v3 3/4] of/overlay: rewrite /aliases path values to l=
ive-tree paths ---
commit a80ad646f2d2ec17e2e79fd9043171b15218e86b
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: rewrite /aliases path values to live-tree paths

This commit rewrites overlay-internal path strings for /aliases entries to
live-tree paths, similar to /__symbols__. It ensures that /aliases values
correctly reference nodes in the live tree.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index b6545905cf67d..9f85278c577ac 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -350,6 +350,21 @@ static int add_changeset_property(struct overlay_cha=
ngeset *ovcs,
>  		if (prop)
>  			return -EINVAL;
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +	} else if (target->np->parent &&
> +		   of_node_is_root(target->np->parent) &&
> +		   of_node_name_eq(target->np, "aliases")) {
> +		/* /aliases values are deref'd as C strings; reject malformed input */
> +		if (!overlay_prop->value || overlay_prop->length < 2 ||
> +		    strnlen(overlay_prop->value, overlay_prop->length) >=3D
> +			overlay_prop->length)
> +			return -EINVAL;

[Severity: Medium]
Does this code incorrectly reject pseudo-properties on newly created /alias=
es
nodes?

Since the is_pseudo_property() filter at the top of add_changeset_property()
only applies when target->in_livetree is true, pseudo-properties (like
"phandle") on a newly created /aliases node will fall through to this logic.

A "phandle" is a 32-bit integer, so it may lack a null byte. This causes
strnlen() >=3D length to evaluate to true, falsely returning -EINVAL and ab=
orting
valid overlay applications.

> +
> +		/* rewrite overlay-internal paths to live-tree paths */
> +		if (!strncmp(overlay_prop->value, "/fragment@",
> +			     strlen("/fragment@")))
> +			new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +		else
> +			new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	} else {
>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
add_changeset_property() cause a use-after-free or double-free?

If of_changeset_add_property() fails later in this function, we do this:

drivers/of/overlay.c:add_changeset_property() {
    ...
	if (!prop) {
		if (!target->in_livetree) {
			new_prop->next =3D target->np->deadprops;
			target->np->deadprops =3D new_prop;
		}
		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
						new_prop);
	} else {
    ...
	if (ret)
		__of_prop_free(new_prop);
	return ret;
}

Since new_prop is freed but left linked in target->np->deadprops, won't
of_node_release() later iterate over deadprops and double-free this same
property?


[Severity: Medium]
This isn't a bug introduced by this patch, but does the error path in
add_changeset_node() permanently leak the duplicated node tchild?

When attaching a newly duplicated child node fails, the function returns
immediately without freeing the node:

drivers/of/overlay.c:add_changeset_node() {
    ...
	if (!tchild) {
		tchild =3D __of_node_dup(NULL, node_kbasename);
        ...
		ret =3D of_changeset_attach_node(&ovcs->cset, tchild);
		if (ret)
			return ret;
    ...
}

Should there be an of_node_put(tchild) before returning the error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v3-0-7001028fe2f5@nexthop.ai?part=3D3
