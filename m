Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7637EFFB
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531751; cv=none; b=HaCSW1yRrTM0co9dK707MiId//NwJCrVOQeAGejTiq8SPAzQt/tr/RkiaxNK6duagMN/zILQwsrEhUeiVyYxwUaaKREKpOj0e6ooIhUnTI+QNhTMnIO0d+KEHO3F4vT8F7OsBW6MDLY0MJ2a1DD/H57EA1AO1D96h51hp42Km80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531751; c=relaxed/simple;
	bh=xyFsxVY6GSqW3eCWs9XmAb8qfdgf8g5jjo80T1TytXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j5VWJka5q8Ob4PJkTffTygoXBPkZ+PSPHzdK/4+z5n2OL2JUM0QIMKSa27gtDH7GcT+Og6hcVFCuEBZDO6WaSztwH4cJTqJN1G7nEzZEbJn3i58UOJmNOz5THJEgckWM3U8CRZXSRwZOJbDdTzFIU912mZlIkMIT9UbD/UGOo4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exIIcps1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exIIcps1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B951F000E9;
	Mon, 20 Jul 2026 07:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784531749;
	bh=/zXpJe3oAOTec0MBw4qwChQI5b835RZ/oy4xDtuddLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exIIcps1jehsBD1yj1MlTiPWNSy1HNJ8u+JXWYUS4XR+QJtYeJ6kvHByggcO4Q9x3
	 HJj/dYeOUcL2u5kO8e89xsd9pZi6ofIvpwCLsxp33BNhmcFzK7t5aHezEzReNhkzPE
	 sHkXiCH1uAmUPkTc8mAR3IvJ1iES72RUobtXHd4DJeU3T/o1NfT9hczGOIZd92pURY
	 qnyO3ryicdtgrd4cq+P/Fzx4TEEYn0kO9XaqRdcWWFnRQ8BfUtqhfk+NJhRSoZy4uY
	 ainZQ1X/5wSwP+aajLEf2Ax/AjLBVZJui28Nh61vNgGRuIaCcTvdrJ1gE9JP5BdTXl
	 iMzIw8hbz/t2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/4] of/overlay: look up absolute target-paths
 absolutely
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-2-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-2-f1e5d9889b30@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:15:48 +0000
Message-Id: <20260720071549.49B951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Overlay changeset fragments' target and overlay nodes are leaked o=
n the error paths in `init_overlay_changeset()`.
- [High] Calling `of_node_put()` under `devtree_lock` (a raw spinlock) can =
sleep in atomic context.
- [High] The `lan966x_pci` driver leaks overlay resources if `of_overlay_fd=
t_apply()` fails.
--

--- Patch [2]: [PATCH RFC 2/4] of/overlay: look up absolute target-paths ab=
solutely ---
commit 8125ed0b64def60707430d565ce13659fa3c53dc
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: of/overlay: look up absolute target-paths absolutely

This commit modifies find_target() to treat non-empty target-paths as
absolute when applying a device tree overlay. It allows overlays to modify
both a subtree under a base node and nodes at the device tree root.

>     Treat target-path as absolute whenever it is non-empty. An empty
>     target-path continues to mean "the target base itself", preserving
>     the existing shape used by drivers/misc/lan966x_pci.c and its dtso
>     (the only in-tree of_overlay_fdt_apply() caller today that passes a
>     non-NULL base).

[Severity: High]
This isn't a regression introduced by this patch, but does the lan966x_pci
driver leak overlay resources if of_overlay_fdt_apply() fails?

The API contract for of_overlay_fdt_apply() states that if it fails during
of_overlay_apply(), it intentionally skips freeing the changeset and instead
populates *ret_ovcs_id, delegating the cleanup to the caller.

However, if lan966x_pci_load_overlay() encounters a failure, it immediately
returns the error to lan966x_pci_probe():

drivers/misc/lan966x_pci.c:lan966x_pci_probe() {
	...
	ret =3D lan966x_pci_load_overlay(data);
	if (ret)
		return ret;
	...
}

This returns without invoking of_overlay_remove() on the returned ID, which
would permanently leak the overlay changeset structure, unflattened FDT
memory, and partially applied device tree nodes. Should lan966x_pci_probe()
clean up the overlay if it fails?

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 08d5351746be6..654a70d5cb075 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c

[ ... ]

> @@ -709,23 +708,22 @@ static struct device_node *find_target(const struct=
 device_node *info_node,
> =20
>  	ret =3D of_property_read_string(info_node, "target-path", &path);
>  	if (!ret) {
> -		if (target_base) {
> -			target_path =3D kasprintf(GFP_KERNEL, "%pOF%s", target_base, path);
> -			if (!target_path)
> -				return NULL;
> -			node =3D of_find_node_by_path(target_path);
> -			if (!node) {
> -				pr_err("find target, node: %pOF, path '%s' not found\n",
> -				       info_node, target_path);
> -			}
> -			kfree(target_path);
> -		} else {
> -			node =3D  of_find_node_by_path(path);
> -			if (!node) {
> -				pr_err("find target, node: %pOF, path '%s' not found\n",
> -				       info_node, path);
> -			}
> -		}
> +		/*
> +		 * With a non-NULL @target_base, an empty target-path means
> +		 * "the target base itself" =E2=80=94 this is the common
> +		 * of_overlay_fdt_apply(..., base) form used by e.g. the
> +		 * LAN966x PCI overlay. Any other target-path is looked up
> +		 * absolutely, so overlays that also need to reach the DT
> +		 * root (e.g. to add /aliases entries alongside a base-
> +		 * relative fragment) can do so with target-path=3D"/aliases".
> +		 */
> +		if (target_base && path[0] =3D=3D '\0')
> +			return of_node_get((struct device_node *)target_base);
> +
> +		node =3D of_find_node_by_path(path);
> +		if (!node)
> +			pr_err("find target, node: %pOF, path '%s' not found\n",
> +			       info_node, path);
>  		return node;
>  	}

[Severity: High]
This is a pre-existing issue, but I noticed a memory leak when find_target()
returns NULL.

In init_overlay_changeset(), ovcs->count is only updated to the final fragm=
ent
count (cnt) at the end of the function. If find_target() returns NULL, the
function jumps to the error path err_out without updating ovcs->count, leav=
ing
it at 0:

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

When the caller subsequently cleans up by calling free_overlay_changeset(),=
 it
uses ovcs->count to iterate over the fragments and release their target and
overlay nodes:

drivers/of/overlay.c:free_overlay_changeset() {
	...
	for (i =3D 0; i < ovcs->count; i++) {
		of_node_put(ovcs->fragments[i].target);
		of_node_put(ovcs->fragments[i].overlay);
	}
	...
}

Since ovcs->count is 0, none of the previously processed fragments have the=
ir
node references released. Can we ensure ovcs->count is updated incrementally
or handle the cleanup of already-processed fragments on the error path?

[Severity: High]
I also noticed another pre-existing issue unrelated to this patch, but can=
=20
calling of_node_put() under devtree_lock cause a sleep in atomic context?

The devtree_lock is a raw spinlock. Several OF node iterators, such as
__of_get_next_child(), call of_node_put(prev) while holding this lock:

drivers/of/base.c:of_get_next_child() {
	...
	raw_spin_lock_irqsave(&devtree_lock, flags);
	next =3D __of_get_next_child(node, prev);
	raw_spin_unlock_irqrestore(&devtree_lock, flags);
	...
}

drivers/of/base.c:__of_get_next_child() {
	...
	of_node_put(prev);
	return next;
}

If the node being put is a dynamic device node (e.g., from an overlay) and
this is its final reference, of_node_put() calls kobject_release(), which
invokes of_node_release(). Inside of_node_release(), the code calls
fwnode_links_purge(), which acquires the fwnode_link_lock mutex. Taking a
mutex while holding a raw spinlock and with interrupts disabled is a fatal
scheduling-while-atomic bug.

Could this lead to deadlocks or system crashes when an overlay is detached
concurrently with device tree iteration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-f1e5d9889b30@nexthop.ai?part=3D2
