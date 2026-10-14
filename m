Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E04360EC5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020467; cv=none; b=XoiH5lUZ24HjvPd+5VhzmAGfaiN2eSxu/mGC/kXPNWkXWObbE7gDVchjarbJaGlhFXg5+1XEVIuzzCRdcNKppOMsVJ+YOJWYUXinV7QL0n/4PdZBJ/rO6FxGRXVvyQd15IDFTTIx3WRxYKrH0CJMitZZ2udHLC/ZYo8W4efbbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020467; c=relaxed/simple;
	bh=Szww6CTCB0u669EcPIOLr1UC8jhFphaL9JG4Qwn5L4E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=POVM7J09lNXkQx4RcgrxGmvSkYoVcwees7VQsHvPwJGfKQs1mYSxz0NOHWQ8Whxu9jeQv2U8WLXjgexclHZDJx8S7zq47pdkvyZVa3wsqunnaFRz0/DZd4KuXqzFy0R+ktF84sUg4wBhZlOcSlWfyGjekdUuC+BdtO8cQAPW/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwYI7e8u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwYI7e8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0821F000C4;
	Wed, 14 Oct 2026 23:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792020465;
	bh=tfM7viAjRQJSEdFOGkPErrGXeOIiQBf3Ae8I9/aYOSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwYI7e8uSGOKFpQ5EskOESFHtPFTLprJmy4lCRKLYngkvspCAyjvRB5fe4vCwVVik
	 qcHjUYvTiOodyjtEtY3Plf7MXS9q15fVjgi353RGgrGyJOY6dIbNj4NLcT+7q2d0D4
	 cEojdg+wTLeMGZ2QNU0Yn5bE3iHxRfSDOWOpftxjJOsk/oU6sSF0d+TA4dcl1VuyFK
	 jnlI5Qx5clQ9GCe4fer8wckBfMwTNgVtRbUi/GCmY/OHaAVDeqgJUcqdz4LXwgihyV
	 q752hKIn/tMq6cIk6w0IcENaK9xVy20CXnMCb0wuBzacV4GHAjqmvCZvQR7EiJ2orD
	 uDIuJ7ZDoMqGQ==
Message-ID: <sashiko-outbox-172019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/6] of/overlay: rewrite /aliases path values to
 live-tree paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-nh-of-alias-overlay-v8-5-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261014-nh-of-alias-overlay-v8-5-0f74f05ac762@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 23:27:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: refcount underflow in dup_and_fixup_symbol_prop()
--

commit c5eaae3d3771753bc9d29f750410340abc26ee23
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: rewrite /aliases path values to live-tree paths

This commit rewrites overlay-internal path values in the /aliases node
to live-tree paths so they can be properly resolved. It uses the existing
dup_and_fixup_symbol_prop() helper to accomplish this.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c

[ ... ]

> @@ -370,6 +370,19 @@ static int add_changeset_property(struct overlay_cha=
ngeset *ovcs,
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
>  		if (IS_ERR(new_prop))
>  			return PTR_ERR(new_prop);
> +	} else if (!is_pseudo_property(overlay_prop->name) &&
> +		   of_node_is_aliases(target->np)) {
> +		/* rewrite overlay-internal alias values to live-tree paths */
> +		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);

[Severity: High]
Could this call to dup_and_fixup_symbol_prop() trigger a reference count
underflow?

Looking at dup_and_fixup_symbol_prop(), it retrieves nodes using
__of_find_node_by_path() but then explicitly drops references to them:

drivers/of/overlay.c:dup_and_fixup_symbol_prop() {
    ...
	fragment_node =3D __of_find_node_by_path(ovcs->overlay_root, path + 1);
	overlay_node =3D __of_find_node_by_path(fragment_node, "__overlay__/");
	of_node_put(fragment_node);
	of_node_put(overlay_node);
    ...
}

However, as documented in drivers/of/of_private.h, __of_find_node_by_path()
operates without taking node references:

drivers/of/of_private.h:
/*
 * All functions with two leading underscores operate
 * without taking node references, so you either have to
 * own the devtree lock or work on detached trees only.
 */
struct device_node *__of_find_node_by_path(const struct device_node *parent=
, ...);

Because the references were never initially acquired, calling of_node_put()
here will underflow the reference count. This drops the independent referen=
ces
held by the changeset fragments and could lead to premature freeing of the
nodes and a use-after-free during subsequent access.

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-nh-of-alia=
s-overlay-v8-0-0f74f05ac762@nexthop.ai?part=3D5
