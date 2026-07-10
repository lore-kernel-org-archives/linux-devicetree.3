Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4572DF3DA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696154; cv=none; b=ougTwOqLOjnZIkCCS7y8gczXKWDxZ+nH4na+vrBTwRhVTSsg5DKQsycXwX0a9pJRBS5eysYKfawqScieLfdl5ml0LWK7EpcxKEMR94YTKZXq0lP545XAIWG90Baf0IG6Nqp9zzu2DJq8TR3upeIS8JbS022DLEDVMdGZhNz8JYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696154; c=relaxed/simple;
	bh=RAKWW+0mDWUE3ur7EY7pYPpptmmwDDx0/g30+k3Flco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U2qYypYg8cX2hgP8yZDhB5A89OfezFOYg62wKTr+sGTcU3JSteECFnoHglQdhn28NKDUQp7zSfEv8lW7MghRjA8Q1Xac8eSiiDJxLXwA3P8brX+LU2HRa1sWDLjIerMIoVvJI6b3SVzwLhXmz9fwqr2odO3aitI/Xepam5GN6Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZlYfav3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZlYfav3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECE11F00A3A;
	Fri, 10 Jul 2026 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696151;
	bh=m67S19j3vt51GWgJg4qL7aklsSbHmqBjco9Om3oQXk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZlYfav3LVqNLVSnSaKjWtEeTx4phzgJKhZ1PusW4b4okVFXs5RGFl+f2IG6k0fVt
	 5AlB0WGWsWRxpWsFk8o2z/eRXX3UGepiSya3HUXkl5DlXiAuPb5Vj4mkdy1MgmL1N2
	 b9+L21D4XnWI1mI+iQJDn7aWi8RhMGjsMjb0GVrA2cewKxWUe4yMoJVS0HPJllK8N3
	 6zScgqDh/RW1tjmPXqz2YVXI9uxqK2igGYBZ7GANSeyqlKdN6SL56Y0CQW0oxSZYAJ
	 8uO+uF92VmCdeETBSl6FWihZ6w2yGpZX/MbbH5etyn05CTsSNrmqS9+PgUfAireypL
	 zQjYoNHMrO/Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/18] clk: mediatek: Add MT8189 scp clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-17-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-17-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:11 +0000
Message-Id: <20260710150911.8ECE11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect `sta_ofs` in `scp_cg_regs` causes clock state tracking f=
ailures.

Pre-existing issues:
- [High] Missing `of_clk_del_provider()` in the error path of `__mtk_clk_si=
mple_probe()` leads to a dangling clock provider and subsequent Use-After-F=
ree.
- [Medium] Memory leak of the `struct mtk_clk_gate` allocation in `mtk_clk_=
register_gate()`.
--

--- Patch [17]: [PATCH v2 17/18] clk: mediatek: Add MT8189 scp clock suppor=
t ---
commit 622c7d611c5de5d2297fc568f0bb3702456cb016
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 scp clock support

This commit adds support for the MT8189 scp clock controller. It provides
clock gate control for the System Control Processor by defining the necessa=
ry
gate clocks and registering them with the common clock framework.

> diff --git a/drivers/clk/mediatek/clk-mt8189-scp.c b/drivers/clk/mediatek=
/clk-mt8189-scp.c
> index 0000000000000..75197cd98b521
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-scp.c
> @@ -0,0 +1,77 @@
[ ... ]
> +static const struct mtk_gate_regs scp_cg_regs =3D {
> +	.set_ofs =3D 0x4,
> +	.clr_ofs =3D 0x8,
> +	.sta_ofs =3D 0x4,
> +};

[Severity: High]
Is this sta_ofs correct? Most other MediaTek clock drivers with differing s=
et
and clr registers use 0x0 for the sta register. If reading from offset 0x4
returns garbage or write-only trigger values, could this break the common c=
lock
framework's is_enabled checks and cause incorrect reference counting?

[ ... ]


This is a pre-existing issue, but there appears to be a dangling clock prov=
ider
in the error path of __mtk_clk_simple_probe():

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
	if (r)
		goto unregister_clks;

	platform_set_drvdata(pdev, clk_data);

	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
    ...
unregister_clks:
	if (mcd->clks)
		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
    ...
}

[Severity: High]
If mtk_register_reset_controller_with_dev() fails, we jump to unregister_cl=
ks,
which unregisters the clocks and frees clk_data. Does this leave the device
node registered as a clock provider pointing to freed memory, since
of_clk_del_provider(node) is never called in this error path? Could this le=
ad
to a use-after-free when another driver attempts to get a clock?


This is another pre-existing issue, but there appears to be a memory leak in
mtk_clk_register_gate():

drivers/clk/mediatek/clk-gate.c:mtk_clk_register_gate() {
    ...
	cg =3D kzalloc_obj(*cg);
	if (!cg)
		return ERR_PTR(-ENOMEM);

	init.name =3D gate->name;
	init.flags =3D gate->flags | CLK_SET_RATE_PARENT;
	init.parent_names =3D gate->parent_name ? &gate->parent_name : NULL;
	init.num_parents =3D gate->parent_name ? 1 : 0;
	init.ops =3D gate->ops;
	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv)
		return dev_err_ptr_probe(
			dev, -ENXIO,
			"regmap not found for hardware voter clocks\n");
    ...
}

[Severity: Medium]
If a clock gate requires a hardware voter regmap but none was found, the
function early-returns an error. Are we leaking the newly allocated cg=20
structure here by returning directly without freeing it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D17
