Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21893B7767
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532020; cv=none; b=NIi0LYJHjPPYcnmvUI7B4xXWuFcG8B3pt0Sxa+ABznC4k+88g9+RL3gfHgt0neAsuwbtKiPxzJ2tUppxr4P8VaSnG7zAT7F40sEkQ2HxycwR/P+RpRCiCG4awk1f4/iuf9Px53mJI9ZGagKGh7Z2LOaUP+TTSf3R3p5ypl/sUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532020; c=relaxed/simple;
	bh=T2OyYCoWCyGFgL6UNJbaBPCvUZjy90vbI4RROyxMsE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bo/9b7KA1DQKsFIKQ21akbZ2PZBIoDRPPOzSBKwGeBujYKsAX3DfVHh0VYC2GRQhHvuC+TbY05xt4EMCboYCL0nAaxodHy7Huuxkvyxhli/iw8jvjlPdggBMNZc2mOdPV9pH2qFhg6RdFyhCCf1tZtDGa/72n/Jm+aVbydpUeoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJmvCThm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJmvCThm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40481F000E9;
	Mon, 20 Jul 2026 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784532015;
	bh=nAaq6HoexbRu7p4IJBZ0pApz2LsB8omGewT0hqfF+3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJmvCThmd3L9MK1LhRmF3XvuQDdoGZCTnmNxR92nLw6aXnlGiDoplj7Qsu6kNOQZl
	 ldpghYt307WTo1OitCo9z21ehAmsLTbVFESeRTS8rriZgsMKRuFYyIkmOwY2RbsnJR
	 5cDa0L4Ql3czHuzddgQ3CdWplfY6Qs9I2hoeBQ3iP+rk50k7z2KJWHBpf/+LSvoQ0d
	 jEhlftGZ9ZuqF50la5yBMZv01KGoPlEMieGdgq+4qGPhkClCFwO2SNQo6Jfy933Cxg
	 12+w0h2XrvcPQgiTzhWsKFXWzfObb3q3CAu+x3qSoNqST+f0rsQyh2InUhhTJPb2+K
	 VAfmsI6cFsdTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-3-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-3-f1e5d9889b30@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:20:14 +0000
Message-Id: <20260720072014.E40481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Fallback to `__of_prop_dup()` for `/aliases` masks ENOMEM errors a=
nd bypasses null-termination safety checks, causing silent corruption and p=
otential OOB reads.

Pre-existing issues:
- [Critical] Dangling pointer in target->np->deadprops leads to use-after-f=
ree and double-free if of_changeset_add_property() fails.
--

--- Patch [3]: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to =
live-tree paths ---
commit 8741f5ffd2983da599c7be77cbf8c1af8325d4be
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: rewrite /aliases path values to live-tree paths

/aliases entries added by an overlay reference labeled nodes inside
the overlay via '&label' in the .dtso. dtc renders those references
as string paths at compile time, but the paths encode the overlay's
internal fragment layout (e.g. "/fragment@1/__overlay__/fpga@0/i2c@40000")
rather than the location where the node will live after apply.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 654a70d5cb075..338786cef17ab 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -350,6 +350,19 @@ static int add_changeset_property(struct overlay_cha=
ngeset *ovcs,
>  		if (prop)
>  			return -EINVAL;
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +	} else if (target->np->parent &&
> +		   of_node_is_root(target->np->parent) &&
> +		   of_node_name_eq(target->np, "aliases")) {
> +		/*
> +		 * /aliases property values are string paths in the same
> +		 * "/fragment@N/__overlay__/..." form as /__symbols__.
> +		 * Rewrite them to live-tree paths so of_alias_get_id() can
> +		 * resolve them; fall back to a raw dup for non-fragment
> +		 * values (e.g. legacy string aliases like "ttyS0").
> +		 */
> +		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +		if (!new_prop)
> +			new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);

[Severity: High]
If dup_and_fixup_symbol_prop() fails because the string is not
null-terminated, does this fallback to __of_prop_dup() end up copying the
malformed string?

Because dup_and_fixup_symbol_prop() can return NULL for both memory
allocation failures and structural errors like non-null-terminated strings,
falling back to a raw duplicate here preserves the non-null-terminated
string.

Later, the reconfig notifier can trigger of_alias_create() which attempts to
read the property:

drivers/of/base.c:of_alias_create() {
    ...
	if (owned)
		np =3D of_find_node_by_path(pp->value);
    ...
}

Could this lead to an out-of-bounds read when of_find_node_by_path() treats
the non-null-terminated property value as a C string?

Additionally, does this mask memory allocation failures from
dup_and_fixup_symbol_prop() by falling back to a raw duplicate, injecting
unresolved paths directly into the live tree instead of failing the overlay
application?

>  	} else {
>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	}

[Severity: Critical]
This is a pre-existing issue, but while reviewing add_changeset_property(),=
 I
noticed a problem further down in the same function.

When a property is added to a newly created node, it is linked into the
node's deadprops list before the changeset operation:

drivers/of/overlay.c:add_changeset_property() {
    ...
	if (!prop) {
		if (!target->in_livetree) {
			new_prop->next =3D target->np->deadprops;
			target->np->deadprops =3D new_prop;
		}
		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
						new_prop);
    ...
	if (ret)
		__of_prop_free(new_prop);
	return ret;
}

If of_changeset_add_property() fails, perhaps due to an allocation error,
__of_prop_free() is called on new_prop, but new_prop is not unlinked from
target->np->deadprops.

Will this leave a dangling pointer in the deadprops list, causing a double
free later when the changeset is aborted and of_node_release() calls
property_list_free() on node->deadprops?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-f1e5d9889b30@nexthop.ai?part=3D3
