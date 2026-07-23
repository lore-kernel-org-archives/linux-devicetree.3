Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B084350285
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777958; cv=none; b=CV2l8vLsX0ImnsV5xZP0XaBYwBmW5UxwBjKMJYFg/J/aCgLLRl8aotpoMYz4IBRBIiyP+djzVdhUpmcViZP8Ahw1gBboopjggza94Y8/iLx26O5UU9K7N0mQ4QmoDcnFdZq6knotK/sC74tg5d3PoSb+opAnQvhNy4x+INwfAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777958; c=relaxed/simple;
	bh=wNAcD1REj4oFN9209azDI2+3PC9t+k/9i4TUMpc3180=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LOvMwplp9Io5jk+/0/F3PhRxOsjJAnVh6aDXePBh3P5KnU3YI1VkFgvCQg5z3dXUYBAX5iLSChBJBZtTDvJkzAwNHdmxbH1D4VGLab9RfvL9kLruXhyrBoZ+ZOaPuJ9/0KfI855Vszjbzj44xzAiDbZVZxOeBkbRlVKLNOJcjNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POGqGYgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POGqGYgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6A61F000E9;
	Thu, 23 Jul 2026 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784777956;
	bh=ISIwV1dfxKUcP447XAyrnY6EcJXlnvoGTSKi17RyAAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POGqGYgfkmcFWir3VDRbFY6CeoiAoOcBJLqJ8nYQnvsavgAHXFYBUAXJ67rFcHDNk
	 XD1ht/jFG8AmH1+El47NTEfZTnT191iV+upPIk39SpF3K3f5o3pRha2zwsnJ+ffnWP
	 kgkHnSSZ01gpAFDb6QDoeEAcx4CdWQok2BYuXifMnF3KzWZANthG5mu3WhQOVMPdXk
	 sHNXurOOIJ5LPlGjdo4Am8FQIOpwIEjzOkywHXZSowMHQke36zlMTIoj5EgUQ95lts
	 a2oMypIMZmfcnhlPU2PU49wjPVDO61kf7zSBiX4JV0CMVV1/lxbiVPFV3vXB358krr
	 AQTsct5O8iP4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs->id
 on idr_alloc() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
 <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 03:39:15 +0000
Message-Id: <20260723033916.6D6A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but callers of `of_o=
verlay_fdt_apply()` fail to call `of_overlay_remove()` when the application=
 fails, leading to a memory leak.
- [High] This problem wasn't introduced by this patch, but if `of_changeset=
_attach_node()` fails in `add_changeset_node()`, the newly allocated device=
 node `tchild` is permanently leaked.
- [High] This problem wasn't introduced by this patch, but if `init_overlay=
_changeset()` fails after successfully parsing one or more fragments, the O=
F node references for those initialized fragments are leaked.
--

--- Patch [5]: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs-=
>id on idr_alloc() failure ---
commit bdff881a51ac56990164b0a5479bf6e47e64305a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

    of/overlay: don't keep a negative id in ovcs->id on idr_alloc() failure

This commit fixes a bug where a negative return value from idr_alloc()
is stored in ovcs->id. On the error path, free_overlay_changeset() checks
if ovcs->id is non-zero, leading to idr_remove() being called with a
negative id and list_del() operating on an uninitialized list.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 284c9bc6c9cfc..f1aa8574069a6 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -1038,6 +1038,8 @@ int of_overlay_fdt_apply(const void *overlay_fdt, u=
32 overlay_fdt_size,
>  	ovcs->id =3D idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
>  	if (ovcs->id <=3D 0) {
>  		ret =3D ovcs->id;
> +		/* free_overlay_changeset() treats a set id as registered */
> +		ovcs->id =3D 0;
>  		goto err_free_ovcs;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but callers of
of_overlay_fdt_apply() fail to call of_overlay_remove() when the
application fails, leading to a memory leak.

If of_overlay_apply() fails inside of_overlay_fdt_apply(), the function
intentionally leaves the returned changeset ID set via the pointer,
expecting the caller to handle cleanup by calling of_overlay_remove().
However, callers simply return the error code upon failure without
calling of_overlay_remove().

For example, in tilcdc_panel_legacy_probe():

drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:tilcdc_panel_legacy_probe() {
    ...
	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
	if (ret)
		return ret;
    ...
}

And in lan966x_pci_probe():

drivers/misc/lan966x_pci.c:lan966x_pci_probe() {
    ...
	ret =3D lan966x_pci_load_overlay(data);
	if (ret)
		return ret;
    ...
}

The helper returns the result directly to lan966x_pci_probe(), which bails
on error without invoking the corresponding lan966x_pci_unload_overlay().

Can this result in a permanent memory and ID leak of the overlay changeset,
especially since probe functions can be repeatedly triggered via sysfs
bind/unbind or deferred probing?


[Severity: High]
This isn't a bug introduced by this patch, but if of_changeset_attach_node()
fails in add_changeset_node(), is the newly allocated device node
permanently leaked?

In add_changeset_node(), __of_node_dup() creates a new node (tchild) with a
reference count of 1:

drivers/of/overlay.c:add_changeset_node() {
    ...
		ret =3D of_changeset_attach_node(&ovcs->cset, tchild);
		if (ret)
			return ret;
    ...
}

If of_changeset_attach_node() fails, the function returns the error
immediately without dropping the reference to tchild via of_node_put().

Could this leak the device node structure and its associated name string?


[Severity: High]
This isn't a bug introduced by this patch, but if init_overlay_changeset()
fails after successfully parsing one or more fragments, are the OF node
references for those initialized fragments leaked?

In init_overlay_changeset(), the function iterates over overlay fragments
and acquires references via of_get_child_by_name() and find_target(). If
find_target() fails for a subsequent fragment, it jumps to err_out without
dropping the current overlay_node reference or updating ovcs->count:

drivers/of/overlay.c:init_overlay_changeset() {
    ...
		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(node);
			ret =3D -EINVAL;
			goto err_out;
		}
    ...
}

Because ovcs->count remains 0, free_overlay_changeset() skips the cleanup
loop entirely:

drivers/of/overlay.c:free_overlay_changeset() {
    ...
	for (i =3D 0; i < ovcs->count; i++) {
		of_node_put(ovcs->fragments[i].target);
		of_node_put(ovcs->fragments[i].overlay);
	}
    ...
}

Could this skip cleanup and leak the successfully acquired OF nodes from
previous iterations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v5-0-2abe2bb9cdbc@nexthop.ai?part=3D5
