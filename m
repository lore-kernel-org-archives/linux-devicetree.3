Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190836CDF8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508082; cv=none; b=Nbb+T+4EsP8qUAGsveQBwtQDrgm9o54xFgf99cDv2TsJN+DFiBBbtXtO4mYd6FYY49yNJpmc7nHFLTqROV3ZbqET2XoLj5RZ0PppvJEjP+YvX7uqrSRI75ol2QylIfgFaSJ+/YqOjdz796CoWZj2+1r0j6aoAp8wRP8uPHoCPNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508082; c=relaxed/simple;
	bh=Q2otRxarUYSJ0/Hoq04XVThaws7kV3jcPa3Zj8ll0mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZKh6ozGlhYOCt9O8uMMccptC6tsXotcO5E6+kpSR9ktQ4dgkU8ukaeh7TmB0E+Rw+AtOTy4oTTnBirp6jcE3c/Oc7DksglHc+GYO7IkvM17Qjq2Yb3JrdfpYc6z3H5MAZ3NvDwIjwOcSb5A++/j8jbwvI7N1FUGnWSf/aOlfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4fUmHg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4fUmHg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875391F00A3F;
	Fri,  4 Sep 2026 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508080;
	bh=bqtcl7q7s/cCuGQJOUMSbh2jL0ff6ED0GW7ONnnH454=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4fUmHg7bk63W//NreQ+/Fpo85WH/6mAtHs/RMVjIxT/9ax1BKYx4eSJk63L79zc+
	 rmPI2ABYqEzR9oTmO3miwMdHbyC0dQz2ivfFF061GvpZoGfT5cYTYIaIBVtSGHBYoz
	 1w2EChLVVgo8wPIJyMpTPD1a8cA6YOaZTH+CfEUi6e0ctg5IfH+Uz1d0ov8vxvFIxC
	 nnoxdGg+KCeDgu8KY7iZGl81U3kXAt+c+YKjGajs63fTIL+2AvUivtCfTAE44kN8XR
	 S+mx+rut9P1lSfJKURBbFE03TmwDgnuUyq3YAjXPUcfpqSv5GDhPFTr5LuEYw1IaOu
	 TLBH8xIHh2Gkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in
 of_check_msi_parent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904073424.3855365-1-fuad.tabba@linux.dev>
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:48:00 +0000
Message-Id: <20260904074800.875391F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] of_msi_xlate() fails to traverse the device hierarchy when msi_np =
is NULL, completely breaking MSI ID mapping for callers such as the fsl-mc =
subsystem.
- [High] msi_node reference is leaked on error path in its_v5_pci_msi_prepa=
re()
- [High] of_msi_xlate() incorrectly handles 'msi-parent' by continuing tree=
 traversal when it mismatches.
--

commit b8991c82a3994d7ebf04943226ad5d1d9490a8d4
Author: Fuad Tabba <fuad.tabba@linux.dev>

of/irq: Fix device node refcount leak in of_check_msi_parent()

The patch fixes a device node refcount leak in of_check_msi_parent(). It
ensures that if the node was not matched in a 1:1 mapping, the reference is
released correctly before returning.

Link: https://lore.kernel.org/all/20260826113604.010C01F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index ec035367c9500..109c54f346479 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -785,7 +785,7 @@ static int of_check_msi_parent(struct device_node *de=
v_node, struct device_node
>  	if ((*msi_node && *msi_node !=3D msi_spec.np) || msi_spec.args_count !=
=3D 0)
>  		ret =3D -EINVAL;
> =20
> -	if (!ret) {
> +	if (!ret && !*msi_node) {
>  		/* Return with a node reference held */
>  		*msi_node =3D msi_spec.np;
>  		return 0;

[Severity: High]
This isn't a bug introduced by this patch, but of_msi_xlate() seems to
incorrectly handle msi-parent mismatches.

If a device specifies an msi-parent that does not match the msi_np filter,
of_check_msi_parent() returns -EINVAL.

drivers/of/irq.c:of_msi_xlate() {
		/* -ENODEV: msi-map absent -> check for msi-parent */
		if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
			break;
}

The condition !of_check_msi_parent() evaluates to false, skipping the break
statement and allowing traversal to continue. Will this erroneously allow
traversal up the tree, potentially inheriting an incorrect msi-map from a
parent bus?

[Severity: High]
This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
device hierarchy when msi_np is NULL?

When of_map_msi_id() (which calls of_map_id()) processes an absent map
property while filter_np is NULL, it returns 0 instead of an error:

drivers/of/base.c:of_map_id() {
	...
	map =3D of_get_property(np, map_name, &map_bytes);
	if (!map) {
		if (filter_np)
			return -ENODEV;
		/* Otherwise, no map implies no translation */
		arg->args[0] =3D id;
		arg->args_count =3D 1;
		return 0;
	}
	...
}

In of_msi_xlate(), this return value of 0 triggers a break:

drivers/of/irq.c:of_msi_xlate() {
		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
			...
			/* msi-map present but no match -> stop walking */
			break;
		}
}

Because of_map_id() returns 0 when the map is absent, wouldn't this early
break erroneously abort the parent traversal loop on the first iteration,
breaking MSI ID mapping for callers passing a NULL msi_np?

[Severity: High]
This isn't a bug introduced by this patch, but is there a fwnode reference
leak on the error path in its_v5_pci_msi_prepare()?

drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
	rid =3D pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
	if (!msi_node)
		return -ENODEV;

	ret =3D its_translate_frame_address(msi_node, &pa);
	if (ret)
		return -ENODEV;

	fwnode_handle_put(msi_node);
	...
}

If its_translate_frame_address() fails, it returns -ENODEV without dropping
the acquired msi_node reference. Can this leak the fwnode_handle if the
frame address translation fails repeatedly during driver bind or unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904073424.3855=
365-1-fuad.tabba@linux.dev?part=3D1
