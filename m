Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7362D662F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781516; cv=none; b=Wh/9Omlc2T37bLCclPIowyNeRrFsl+oxl77i3nG9Y9iBtkmpEFkTfwN0BbjPCDh8x4oTnb3Ny8WZ3BeGeqh9sUfZ4PI5KUU8sbcKz/qvBO9KKqF9xXpCA6L8X0zC0OOTob8rpyjGKH6+hG9452aAxtk4XFJjWUCFn9uddqoJlJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781516; c=relaxed/simple;
	bh=C5SjIv33NEQnil/4xcE8qRCPzBQBO3VWXv0T95AMGtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IciroLLmM4dCHcDXBPus16xna6bfoaYRHUWXVxOFY1XzrmVxM0lwOtL04s/1ekglYZQbRW6a2QT/NWXuQi82ZOgupAwFdHvYQQ0Uu8Rd0AqJD0hW0QT9HwvYGXdbDays4w/c9iz8QiwUXRQcWl42RwHX0Zk57OIn/Yjkak3TX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moJ/z+qm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moJ/z+qm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DB81F00A3A;
	Mon,  7 Sep 2026 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781514;
	bh=MNlNc7r/7gTlRBFOrhHw9U4pcWEJEtv6+KDiUKQwnEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moJ/z+qm1IIHaZn2AbW3OhOgqZ9xhRk0drSjm2q/k2Jc3HDQzxbRj2FC0Xwbsr598
	 4m/J27hXNrLn4sb5txyWhFFI+bhlzyDKJs+QwnSQO++mxBMWIshpIOrlpczDHymfV2
	 1ttAEfMvzGsw/32qChpx9ZEWjxGtsmqCMaKsdHfax4Wy2oGgmkUSQcdFIfsSCxTytz
	 MKHZ1DqDZpcd0k1yNkZtkq/8G82Psspp1HPs7BXjqRJ/VLDee0hzAZMZgrUskXi1yD
	 ymzSQflsNCC5n28VeaGR5MUSPLcl0VR4d8arDEjX5W1BAY42p8HPEgHAw1a7EgX6By
	 nioGY0AY9EzGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] of/irq: Fix device node refcount leak in
 of_check_msi_parent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907112944.313618-2-fuad.tabba@linux.dev>
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
 <20260907112944.313618-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:45:13 +0000
Message-Id: <20260907114514.44DB81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] of_msi_xlate() prematurely aborts device tree hierarchy traversal =
when msi_np is NULL.
--

commit d227a3bc08eef0cbb22a6f227edca082ac29a9b8
Author: Fuad Tabba <fuad.tabba@linux.dev>
of/irq: Fix device node refcount leak in of_check_msi_parent()

This patch prevents a device node reference count leak in
of_check_msi_parent(). It ensures that the msi_node reference is
only kept when the incoming node pointer is NULL.

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
This isn't a regression introduced by this patch, but could the traversal
loop in of_msi_xlate() prematurely abort when msi_np is NULL?

If a driver calls of_msi_xlate(dev, NULL, id) and the direct parent lacks an
msi-map property, of_map_msi_id() passes the NULL msi_np to of_map_id()
as filter_np:

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

Because filter_np is NULL, it returns 0 instead of -ENODEV.

This translates to !of_map_msi_id(...) evaluating to true in the loop in
of_msi_xlate(), hitting the break statement:

drivers/of/irq.c:of_msi_xlate() {
	...
	for (parent_dev =3D dev; parent_dev; parent_dev =3D parent_dev->parent) {
		struct of_phandle_args msi_spec =3D {};

		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
			if (msi_spec.np) {
				...
			}
			/* msi-map present but no match =E2=86=92 stop walking */
			break;
		}
		...
	}
	...
}

Will this cause the function to incorrectly terminate the loop on the very
first node, conflating an absent msi-map with a present but unmatched
msi-map, and failing to find the MSI mapping in ancestor nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907112944.3136=
18-1-fuad.tabba@linux.dev?part=3D1
