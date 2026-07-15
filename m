Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C6446063
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142906; cv=none; b=HX/uNKMnqrFeLNpjkubXe65rdRBaYHiRxq1rOh99qafC1romZyN+Lmx2E3T7AUNn8eHRPlTt3DmK8IUxEDHXcfpdSEUaq2CMwhXxmaAVi8SstuDwYPp0ZyyCJaztvTO7g/nDdhklwpA5mDlEVaxS7UJEKh4f66xagubsuZ1nkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142906; c=relaxed/simple;
	bh=+b4R1lMFPUuXussciW1CrqqwM3l2NvgwvweG+ZZtLWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fBgWW3GA/DcYmHYVU4CtcpmRIdGCW7a0vXqc9tK99QGvrdP4oEK4ooaiez77xJF9FCPDxZJDiJsjsvStgOcu90EPIP6wJ3mNNH+UzWbWvyOCURqqPdwHNXzabMzdlZ1aVj63n/3cV0Uin/YoUS12B6MkYWsGBGdpVmNm+ekDUzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hd9XQRtx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hd9XQRtx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12521F00AC4;
	Wed, 15 Jul 2026 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142895;
	bh=UdFg3x0yUK5+4QXJZO8H+1qC1HPjufZ1s5epfSfkvHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hd9XQRtxiM1GcnIcSJ8XlsUgocSq3mbNfQhQpkHVSbN2MVE/K++bJAMucqr9ovA0K
	 Sli3VFN3LMm3Dh0c/jmTwTgNyEM5INC0rXx5L/tyxT6xLPll8FFkwn6IDMcKC0iT4x
	 o0sjLNZ3nlEdG1x8fRPR/xZIszKLe84kSOCM2R92IpEZpOXHaDdCrolulLenlXLwTK
	 LTrolsXXy5FA01RNIhSOomaNZJ1vqMMoj5xFgJ8W2/d1k4tbHzjGTFDIJ0RgzxdLmp
	 AhdoRXA01XQc+azZ+EKdCeP4+epZVoPIFP0EtgFusF0U5OUHWRDh0LFPu7VoGFytSe
	 TUUsTUs/5vXpQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260714191341.690906-8-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:54 +0000
Message-Id: <20260715191454.D12521F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Asymmetric MDIO read/write remapping for VEND2 control registers c=
orrupts port 0 and breaks configuration for ports 1-3.
- [High] Accessing the supplier device's `drvdata` without synchronization =
before establishing the device link causes a Use-After-Free race condition.
- [Medium] Clock `csr_clk` leaks if the device is removed while its runtime=
 PM state is active.
- [Medium] `xpcs_rk_create` extracts driver data from an arbitrary device n=
ode without validating its compatible string or bound driver, leading to ty=
pe confusion.
- [Low] The Makefile modifications incorrectly split the composite `pcs_xpc=
s` module into multiple independent modules, causing `modpost` build failur=
es.
- [Low] The `dev_pm_ops` structure is assigned unconditionally to the drive=
r's `.pm` field, causing dead code when `CONFIG_PM` is disabled.
--

--- Patch [7]: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platfo=
rm glue driver ---
commit c0159daf5cb4d2e6a0fbbe7a38525a8e230e6d93
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

The RK3568 SoC integrates a Synopsys DesignWare XPCS accessed via APB3
memory-mapped registers. This driver provides the glue logic to make the
XPCS accessible to the generic pcs-xpcs core.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf

> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b900..c809b7f942a51 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,10 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux PCS drivers
> =20
> -pcs_xpcs-$(CONFIG_PCS_XPCS)	:=3D pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> -
> -obj-$(CONFIG_PCS_XPCS)		+=3D pcs_xpcs.o
> +obj-$(CONFIG_PCS_XPCS) +=3D pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o

[Severity: Low]
Does this change cause build failures when CONFIG_PCS_XPCS=3Dm?

Replacing the composite module assignment (pcs_xpcs-y) with individual
object assignments causes Kbuild to build separate modules instead of one
composite module, which can lead to undefined references during modpost.

> +obj-$(CONFIG_PCS_XPCS_PLATFORM) +=3D pcs-xpcs-plat.o
> +obj-$(CONFIG_PCS_XPCS_ROCKCHIP) +=3D pcs-xpcs-rk.o

[ ... ]

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..ed969a38d544d
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PMAPMD:
> +		return ROCKCHIP_MMD_PMAPMD;
> +	case MDIO_MMD_VEND2:
> +		break;
> +	default:
> +		return -ENXIO;
> +	}
> +
> +	switch (addr) {
> +	case 0:
> +		return ROCKCHIP_MMD_MII;
> +	case 1:
> +		return ROCKCHIP_MMD_MII1;
[ ... ]
> +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PMAPMD:
> +		return ROCKCHIP_MMD_PMAPMD;
> +	case MDIO_MMD_VEND2:
> +		break;
> +	default:
> +		return -ENXIO;
> +	}
> +
> +	/* Writable only on MII */
> +	switch (reg) {
> +	case DW_VR_MII_AN_CTRL:
> +	case DW_VR_MII_AN_INTR_STS:
> +	case DW_VR_MII_EEE_MCTRL0:
> +	case DW_VR_MII_EEE_MCTRL1:
> +	case DW_VR_MII_DIG_CTRL2:
> +		return ROCKCHIP_MMD_MII;
> +	default:
> +		break;
> +	}

[Severity: High]
Can this asymmetric remapping between reads and writes cause configuration
corruption on port 0?

In xpcs_rk_mdio_write_remapping(), writes to these VEND2 registers are
unconditionally mapped to ROCKCHIP_MMD_MII (port 0). However,
xpcs_rk_mdio_read_remapping() lacks an equivalent redirect for reads.

Because the generic XPCS driver uses read-modify-write operations on VEND2
control registers for ports 1-3, this will result in reading from the target
port's MMD but overwriting port 0's configuration.

> +
> +	switch (addr) {
> +	case 0:

[ ... ]

> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +	int ret;
> +
> +	pxpcs->csr_clk =3D devm_clk_get(dev, "csr");
> +	if (IS_ERR(pxpcs->csr_clk))
> +		return dev_err_probe(dev, PTR_ERR(pxpcs->csr_clk),
> +					 "Failed to get CSR clock\n");
> +
> +	pm_runtime_set_suspended(dev);
> +	ret =3D devm_pm_runtime_enable(dev);

[Severity: Medium]
Will this leak the csr_clk if the device is removed while active?

The generic devm_pm_runtime_enable() runs pm_runtime_disable() on cleanup,
which cancels pending suspends but does not synchronously suspend an active
device.

Since this driver lacks a .remove callback to manually suspend the device,
xpcs_rk_pm_runtime_suspend() might never be invoked on unbind, leaving the
clock prepare and enable counts unbalanced.

> +	if (ret) {
> +		dev_err(dev, "Failed to enable runtime-PM\n");
> +		return ret;
> +	}

[ ... ]

> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
[ ... ]
> +	pdev =3D of_find_device_by_node(pcs_np);
> +	of_node_put(pcs_np);
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	pxpcs =3D platform_get_drvdata(pdev);

[Severity: Medium]
Could this blind cast lead to type confusion?

The code extracts driver data from the platform device associated with
pcs_np without validating if the device is actually compatible with
rockchip,rk3568-xpcs or bound to this driver.

If a misconfigured device tree points to a different type of device (like
an I2C controller), casting its drvdata to struct dw_xpcs_rk * and
dereferencing it could crash the system.

> +	if (!pxpcs || !pxpcs->bus) {

[Severity: High]
Is there a use-after-free race condition when accessing drvdata here?

This checks and dereferences pxpcs->bus before establishing a device link
to lock the supplier.

If a user concurrently unbinds the XPCS supplier driver (for example, via
sysfs), devres will free the dw_xpcs_rk structure and clear the drvdata.
The consumer driver might then dereference the freed pxpcs->bus before
device_link_add() is called.

> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);

[ ... ]

> +static struct platform_driver xpcs_rk_driver =3D {
> +	.probe =3D xpcs_rk_probe,
> +	.driver =3D {
> +		.name =3D "rk_xpcs-dwxpcs",
> +		.pm =3D &xpcs_rk_pm_ops,

[Severity: Low]
Will this assignment cause dead code when CONFIG_PM is disabled?

Assigning the dev_pm_ops structure unconditionally to the .pm field without
the pm_ptr() wrapper results in dead code and possible compiler warnings
when CONFIG_PM is not set, which violates the PM subsystem guidelines.

> +		.of_match_table =3D xpcs_rk_of_ids,
> +	},
> +};
> +module_platform_driver(xpcs_rk_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D7
