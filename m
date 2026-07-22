Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA193E49E7
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705118; cv=none; b=drm0JUIx0abLfcO4pnFGC8kVdIBpTZ5+3G4ddzmukxJjiY6/V/IOw31JAkb3OElgomyL1Uff9Rq/RsT7oDRmm9Y3CzZnsh+qq7n7x9KYlBbiVoMQ2NofGXu59XZbp0e8MhJQgrnehNSXFu4j/84HkqvcF/CbZfFp08cIJERmm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705118; c=relaxed/simple;
	bh=dW6KP+MZXFIlT4k5GXTfOoDus6wLev4d6K2AqLjRz10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AhPSVYvoigKCtFzR90/QOVas6S04AvkGYcAtN0FUnyhZzyH8sFx6paQwEehkkbJmnLPLbpgGcuqKk/cNtDnWbt1VKU5jt6hgAkSzD7MyhIs+dikajYCY+Orcan1R2hGO5pBVAW/KTIlWYcal0fyOppNv3/7KKu0ZO2HF+6cTN+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKXmVPZj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKXmVPZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30A21F000E9;
	Wed, 22 Jul 2026 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705111;
	bh=JuLw7V04M8Heeq9a66vmx1dbp42EVOeIwjuLGuNQIOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKXmVPZjn4vVIqqRaoFBzljZTRx3PtW81kc3+pnpZeZfElHSzfHHFV4kzU1ZL6SlX
	 JG3seerSKkUJF2gRd46QpCi+GJtnkfznN9FuBKqiRVnbHvzSBu4dLPROa3zDOemTRy
	 +FTao3Beg47CyAcKd3nXxTrRJBy3lfIRa/B+QOmc/QxpAOW0KHDrI5pk2ElN+IRER9
	 TXYl6b/L1b7acPtZ8HOAFHSPZVmENFZA/47rKzXmJkVsWoBR+nmPLBQFezgOxOJr/L
	 c1Z13VksaqUQpnxod7bko+qz+GZhwq4T7qp9YTYc1Db+SM3T3dK/l+UXd0+FHE5auP
	 RP2Z4OG1oZVgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] of/overlay: look up absolute target-paths
 absolutely
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v4-3-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
 <20260722-nh-of-alias-overlay-v4-3-fc96a40d2761@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:25:10 +0000
Message-Id: <20260722072510.C30A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `of_changeset_add_property()` fails for a node not in the live =
tree, the property is freed but left dangling in the node's `deadprops` lis=
t, leading to a double-free.
- [Medium] If `init_overlay_changeset()` fails while processing a fragment,=
 previously processed fragments permanently leak their `target` and `overla=
y` node references.
--

--- Patch [3]: [PATCH v4 3/7] of/overlay: look up absolute target-paths abs=
olutely ---
commit 5db785cdd32bffe13f8bf6c96fc2b8d806812e93
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: look up absolute target-paths absolutely

When of_overlay_fdt_apply() is called with a non-NULL target base,
find_target() currently concatenates the base's full path with every
fragment's target-path. That makes it impossible for a two-fragment overlay
to modify one subtree under the base and one node at the DT root. Treat
target-path as absolute whenever it is non-empty, while preserving the
existing behavior for empty target-paths.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 08d5351746be6..74aea704835ac 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -737,7 +731,9 @@ static struct device_node *find_target(const struct d=
evice_node *info_node,
>  /**
>   * init_overlay_changeset() - initialize overlay changeset from overlay =
tree
>   * @ovcs:		Overlay changeset to build
> - * @target_base:	Point to the target node to apply overlay
> + * @target_base:	Target for fragments with an empty "target-path";
> + *			fragments with a non-empty "target-path" resolve
> + *			absolutely and ignore @target_base
>   *
>   * Initialize @ovcs.  Populate @ovcs->fragments with node information fr=
om

[Severity: Medium]
This is a pre-existing issue, but if init_overlay_changeset() fails while
processing a fragment, do previously processed fragments permanently leak
their target and overlay node references?

When find_target() fails, the code jumps to err_out:

drivers/of/overlay.c:init_overlay_changeset() {
    ...
		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(fragment->overlay);
			ret =3D -EINVAL;
			of_node_put(node);
			goto err_out;
		}

		cnt++;
    ...
err_out:
	pr_err("%s() failed, ret =3D %d\n", __func__, ret);

	return ret;
}

Because ovcs->count is not updated with cnt before jumping to err_out, it
remains 0.

The cleanup function relies on ovcs->count to free fragment nodes:

drivers/of/overlay.c:free_overlay_changeset() {
    ...
	for (i =3D 0; i < ovcs->count; i++) {
		of_node_put(ovcs->fragments[i].target);
		of_node_put(ovcs->fragments[i].overlay);
	}
    ...
}

Does this completely bypass successfully processed fragments, preventing th=
eir
device node refcounts from ever being freed?

[ ... ]

> @@ -982,7 +978,9 @@ static int of_overlay_apply(struct overlay_changeset =
*ovcs,
>   * @overlay_fdt:	pointer to overlay FDT
>   * @overlay_fdt_size:	number of bytes in @overlay_fdt
>   * @ret_ovcs_id:	pointer for returning created changeset id
> - * @base:		pointer for the target node to apply overlay
> + * @base:		target for fragments with an empty "target-path";
> + *			fragments with a non-empty "target-path" resolve
> + *			absolutely and ignore @base
>   *
>   * Creates and applies an overlay changeset.
>   *

[Severity: High]
This is a pre-existing issue, but if of_changeset_add_property() fails
for a node not in the live tree, does the property remain linked as a
dangling pointer in deadprops?

In drivers/of/overlay.c:add_changeset_property():

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

When adding to the changeset fails, new_prop is immediately freed via
__of_prop_free(), but it is never unlinked from target->np->deadprops.

If the changeset application is aborted and cleaned up via
free_overlay_changeset(), of_node_release() will eventually iterate over
deadprops and call property_list_free():

drivers/of/dynamic.c:of_node_release() {
    ...
	property_list_free(node->deadprops);
    ...
}

Will this execute a double-free on the dangling pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v4-0-fc96a40d2761@nexthop.ai?part=3D3
