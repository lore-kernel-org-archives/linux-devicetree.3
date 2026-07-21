Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B8347BC6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603176; cv=none; b=nPmBLbHRv+Q5mkVhzZ1SBMeqOhHJ6h8pDpAFLk6Qq51lCYi91x8cpx7duaH3dD8KAZWIyCaVWXCVdKGP7hL0883BcW0x2K+7vLXBudyPaWIXdjxT4QtIPisfIgA0zTbtsOVOzQHbc7Wr8ngnYnvq0X9Kt5K7jJTLE5QGl6Jx7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603176; c=relaxed/simple;
	bh=mzGSbJduFnFAuOG0nEZvRgXJphKz43vGQ0vj12plKws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XSLiRzGbQc+UieGVG8LWAI4JKBJPgcY0C1tcF4R89eQGgDmzo7RWJQNjdsCee8P091SgqbGxb9z4N5lw5/9BRQwjqwb0WN/wo1qpqmkOu+Mo2F1w8DCgD9bKsN4XQ7m1WOxaKGzt2qBLFxYHTkTAhYa2tVCoNphgm8eIxPoZees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFfSbQkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFfSbQkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177161F000E9;
	Tue, 21 Jul 2026 03:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784603174;
	bh=0A4YEwozOeoSVLPSVSZIIvGbOw5B6FVMJ674VOCvYhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFfSbQkXdg5m/jXTL74GCofclDkUkakHioSklVdlzFxQkz5Y1ydk7E1/fTyW5R4M+
	 60mbqUBJ45/H+Wwg8f4ddRdM35oZ29W/Fk/StSmfiwwfyBqRZMC8cqa9Cma0g7fb+X
	 aG8JKT9h2BFXTemeL1xyKXWG0Z50bbPlF73GsJ0hq+6HY84ZgK8bG/WjNWFDwuinKd
	 DiekQhkHhysIvcmGqE9WL3QqPx7KXOUJVySgDvT6RFtd8PydpWxotc/vWWUwqKch3R
	 CpqdNZNvMTAECRZYh0qxzlyi2z+DAtISQ11OO3mw9QrshztnDoM4Ed7ht6x36NXslL
	 PNNMqY8HhPdPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-3-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-3-27da6848dd84@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 03:06:13 +0000
Message-Id: <20260721030614.177161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] A structural validation failure in `dup_and_fixup_symbol_prop()`=
 is incorrectly masked as a memory allocation failure.

Pre-existing issues:
- [High] The `__of_prop_dup` fallback permits non-null-terminated alias str=
ings to enter the live tree, causing a Slab Out-Of-Bounds Read.
- [High] Double Free / Use-After-Free of `new_prop` on memory allocation fa=
ilure.
- [High] Memory leak of successfully processed device nodes on early exit i=
n `init_overlay_changeset()`.
--

--- Patch [3]: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to =
live-tree paths ---
commit ac88ca3a222d2b48e52178c676efb92de0cef66b
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: of/overlay: rewrite /aliases path values to live-tree paths

The commit rewrites /aliases entries added by an overlay to use live-tree
paths instead of overlay-internal fragment paths. It checks if the alias
value starts with /fragment@ and uses dup_and_fixup_symbol_prop() to fix
it up. Other alias values fall through to __of_prop_dup().

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 654a70d5cb075..69358811a7f94 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -350,6 +350,33 @@ static int add_changeset_property(struct overlay_cha=
ngeset *ovcs,
>  		if (prop)
>  			return -EINVAL;
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +	} else if (target->np->parent &&
> +		   of_node_is_root(target->np->parent) &&
> +		   of_node_name_eq(target->np, "aliases") &&
> +		   overlay_prop->length >=3D sizeof("/fragment@") &&
> +		   overlay_prop->value &&
> +		   strnlen(overlay_prop->value, overlay_prop->length) <
> +			overlay_prop->length &&
> +		   !strncmp(overlay_prop->value, "/fragment@",
> +			    strlen("/fragment@"))) {

[Severity: High]
This isn't a bug introduced by this patch, but does this logic still allow
non-null-terminated strings to enter the live tree?

If an overlay provides an /aliases property with a non-null-terminated
string that does not start with /fragment@ (e.g., ttyS0 missing a null byte=
),
the else if condition evaluates to false.

Execution falls through to the else block:

drivers/of/overlay.c:add_changeset_property() {
    ...
	} else {
		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
	}
    ...
}

Here __of_prop_dup() blindly copies the non-null-terminated bytes directly
into the live device tree. When a caller such as of_find_node_opts_by_path()
attempts to resolve the alias, it passes pp->value to of_find_node_by_path(=
),
which uses standard C string functions (strncmp, strchr) on the buffer,
reading past the end.

> +		/*
> +		 * /aliases property values that reference a labeled node
> +		 * inside this overlay are rendered by dtc as string paths
> +		 * "/fragment@N/__overlay__/..." =E2=80=94 the overlay's internal
> +		 * layout rather than where the node lives after apply.
> +		 * Reuse dup_and_fixup_symbol_prop() (which already handles
> +		 * this rewrite for /__symbols__) so of_alias_get_id() can
> +		 * resolve the value in the live tree.
> +		 *
> +		 * The property-value shape (non-empty, null-terminated
> +		 * within pp->length, prefix "/fragment@") is validated
> +		 * above so a NULL return from dup_and_fixup_symbol_prop()
> +		 * here means -ENOMEM, not "not our shape"; let the shared
> +		 * -ENOMEM check below handle it rather than falling back
> +		 * to a raw dup that would inject an unresolvable path
> +		 * into the live tree.
> +		 */
> +		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);

[Severity: Medium]
Does this incorrectly mask a structural validation failure as a memory
allocation failure?

When an overlay provides a structurally valid /aliases property that starts
with /fragment@ and is null-terminated, but references a non-existent
overlay fragment, dup_and_fixup_symbol_prop() will legitimately return NULL:

drivers/of/overlay.c:dup_and_fixup_symbol_prop() {
    ...
	if (k >=3D ovcs->count)
		return NULL;
    ...
}

The shared error handler below then incorrectly converts this structural
failure into a memory exhaustion error (-ENOMEM).

>  	} else {
>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a double free
of new_prop on memory allocation failure?

If !target->in_livetree, new_prop is linked into target->np->deadprops:

drivers/of/overlay.c:add_changeset_property() {
    ...
	if (!prop) {
		if (!target->in_livetree) {
			new_prop->next =3D target->np->deadprops;
			target->np->deadprops =3D new_prop;
		}
		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
						new_prop);
	}
    ...
}

If of_changeset_add_property() returns an error, the function explicitly
calls __of_prop_free(new_prop):

drivers/of/overlay.c:add_changeset_property() {
    ...
	if (ret)
		__of_prop_free(new_prop);
	return ret;
}

Since new_prop was not unlinked from the deadprops list, when the overlay
application aborts and of_node_release() iterates over deadprops, will it
call __of_prop_free() again on the already-freed pointer?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is there a memory leak of
successfully processed device nodes on early exit in
init_overlay_changeset()?

When applying a multi-fragment device tree overlay, if an intermediate
fragment fails find_target() (e.g., due to an invalid target-path), the
code jumps to err_out:

drivers/of/overlay.c:init_overlay_changeset() {
    ...
		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(fragment->overlay);
			ret =3D -EINVAL;
			of_node_put(node);
			goto err_out;
		}
    ...
}

As the function iterates over the fragments, it increments the reference
counts for both the overlay and target device nodes, storing them in the
fragments array. When find_target() fails for a subsequent fragment, the
function exits with an error without updating ovcs->count (which remains 0).

The cleanup function free_overlay_changeset() relies on ovcs->count to loop
through and release the node references. Because the count is 0, the cleanup
loop is skipped entirely, causing a permanent leak of the successfully
processed node references from the prior fragments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-27da6848dd84@nexthop.ai?part=3D3
