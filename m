Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00729346F
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115247; cv=none; b=kKKjU9IbtKJHDVTarp8tBKfkzNPR59bCULZhmLTngl8B1p4pZ16sarxAUN0XNfL2Hh/IDGSYYxM0Bz2Au8RnuGHhENTb4ehxZ9fkCjBsu5zggoSdkB395VBh4xqdi8IoBOBgGAh0cLBoNxT43oPbeIJNEwyp24s6SfazVuEtG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115247; c=relaxed/simple;
	bh=Bng3RcR9g1tPQxp632lA6SH6v3CbL4x4QY9YwK7Jobg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tbTeVnDZuE7lAH3R/E1HKKIJ08SS1YrOihLPUV3xSdZFguFXGm+VHcARX9LDPB0h+qE5dlCao5O46osBYB1SQrm2KcBtdBmyRX5HG5wHnZH1sd/xdWFZ3Qafm5UBQCp2KQLAUBPsLDeQkIacX99PdRoWu7Rvv8z2hxjEkl5qWRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHeRSTPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHeRSTPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE840C2BCB7;
	Mon, 18 May 2026 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115247;
	bh=Bng3RcR9g1tPQxp632lA6SH6v3CbL4x4QY9YwK7Jobg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KHeRSTPq04L0K/bP+m3HYfPrurHkSszlgtrfchLlBJtFKlytl3xxL3ZnmpHB+/Ger
	 gsNSx+rgY/IvBJKPyY/Y7UOOeOV509EnW4wE/NVRw382LQJ2hBWH9/hN+3h67EhTLJ
	 D0MDWcfWWCj79q9ViaVdmvCHGz5Uv4+MEbvcBfkz33bL62PK+WgiwLowEylsvr5wkf
	 FLRuOcK/Si3wYr9drHp5eCLOHX9h7Vd5YKQ6xnlgPhF+OK6juJ/V0ux4wyKz6rz9MN
	 jtq6VMk/j/1dWyyzcHRrhfvowD5pdgCyN1t/X2KN5deiZBnJKnT4G7THN9vMfxyFgt
	 rqnVUJlpEM4DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: econet: Add EcoNet USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260518141343.401555-3-cjd@cjdns.fr>
References: <20260518141343.401555-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 14:40:46 +0000
Message-Id: <20260518144046.EE840C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Race condition on shared Frequency Meter registers during concurre=
nt PHY initialization.
- [High] Hardware state machine race due to polling data register instead o=
f valid bit.
- [High] Devres lifecycle bug caused by attaching memory and regmap resourc=
es to the child PHY device.
- [Medium] Iteration over disabled Device Tree nodes accesses unpowered har=
dware.
- [Medium] Missing bounds check on dynamically calculated slew rate configu=
ration exposes hardware to silent bit truncation.
- [Low] Pointer signedness mismatch in `regmap_read_poll_timeout` causes co=
mpiler warnings and violates type safety.
--

commit ab614fd3da75925164048ae81b01b59ec760d67e
Author: Caleb James DeLisle <cjd@cjdns.fr>

phy: econet: Add EcoNet USB PHY

This commit adds support for the USB PHY found on EcoNet EN751221, EN751627,
and EN7528 based SoCs. It implements the setup and tuning rituals for both
USB 2.0 and USB 3.0 PHY blocks.

Link: https://github.com/openwrt/openwrt/pull/23264#issuecomment-4415906568

> diff --git a/drivers/phy/phy-econet-usb.c b/drivers/phy/phy-econet-usb.c
> new file mode 100644
> index 0000000000000..e8fa2e80eb130
> --- /dev/null
> +++ b/drivers/phy/phy-econet-usb.c

[ ... ]

> +static void u2_slew_rate_calibration(struct econet_usb_phy_priv *priv,
> +				     struct econet_phy_instance *instance)
> +{
> +	struct regmap *com =3D instance->regmap;
> +	struct regmap *regmap =3D priv->regmap;
> +	int fm_out =3D 0;

Does this pointer type cause compiler warnings?

regmap_read_poll_timeout() passes the address of fm_out to regmap_read(),
which expects an unsigned int pointer. Using a signed int can lead to
incompatible pointer type warnings.

> +	u32 srctrl;
> +
> +	/* Enable HS TX SR calibration */
> +	regmap_set_bits(com, U2PHY_COM + USBPHYACR0, RG_HSTX_SRCAL_EN);
> +
> +	usleep_range(1000, 1500);
> +
> +	/* Enable Free run clock */
> +	regmap_set_bits(regmap, FMREG + FMMONR1, RG_FRCK_EN);
> +
> +	/* Select Monitor Clock */
> +	regmap_update_bits(regmap, FMREG + FMCR0, RG_MONCLK_SEL,
> +			   FIELD_PREP(RG_MONCLK_SEL, instance->port_id));

Is it possible for multiple PHY ports to race when accessing these shared
FMREG registers?

The Linux PHY core serializes phy_init() only per-PHY instance, meaning
multiple ports could potentially initialize at the same time. If two
threads run this calibration concurrently, could one overwrite the active
port selection or prematurely clear the frequency detection enable bit
while the other is still polling?

Might this require a driver-level mutex to serialize access to the FMREG
hardware block?

> +
> +	/* Set cyclecnt */
> +	regmap_update_bits(regmap, FMREG + FMCR0, RG_CYCLECNT,
> +			   FIELD_PREP_CONST(RG_CYCLECNT,
> +					    ECONET_USB_PHY_U2_FM_DET_CYCLE_CNT));
> +
> +	/* Enable Frequency meter */
> +	regmap_set_bits(regmap, FMREG + FMCR0, RG_FREQDET_EN);
> +
> +	/* Timeout can happen and we will apply workaround at the end */
> +	regmap_read_poll_timeout(regmap, FMREG + FMMONR0, fm_out,
> +				 fm_out, ECONET_USB_PHY_FREQDET_SLEEP,
> +				 ECONET_USB_PHY_FREQDET_TIMEOUT);

Could this loop prematurely succeed by reading a stale value?

FMMONR0 holds the result of the calibration. If this function is called
a second time for another port, polling for fm_out !=3D 0 might instantly
succeed using the previous run's result.

Would it be more robust to poll the FMMONR1 register for the RG_FM_VALID
flag before reading the result from FMMONR0?

[ ... ]

> +	} else {
> +		/* (1024 / FM_OUT) * REF_CK * U2_SR_COEF (round to nearest) */
> +		srctrl =3D ECONET_USB_PHY_REF_CK * ECONET_USB_PHY_U2_SR_COEF;
> +		srctrl =3D (srctrl * ECONET_USB_PHY_U2_FM_DET_CYCLE_CNT) / fm_out;
> +		srctrl =3D DIV_ROUND_CLOSEST(srctrl,
> +					   ECONET_USB_PHY_U2_SR_COEF_DIVISOR);
> +		dev_info(&instance->phy->dev,
> +			 "frequency meter result 0x%x, set slew rate 0x%x\n",
> +			 fm_out, srctrl);
> +	}
> +
> +	/* Set slew rate */
> +	regmap_update_bits(com, U2PHY_COM + USBPHYACR0, RG_HSTX_SRCTRL,
> +			   FIELD_PREP(RG_HSTX_SRCTRL, srctrl));

Is there a risk of silent bit truncation here?

The target field RG_HSTX_SRCTRL is only 3 bits wide. If the frequency meter
provides a low output value (for instance, due to a stale read), the divisi=
on
above could yield a value much larger than 7.

Since FIELD_PREP masks runtime values without error, could this write
an unintended configuration to the hardware? Should the calculated srctrl
value be clamped before applying it?

[ ... ]

> +static int econet_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;

[ ... ]

> +	phy_n =3D 0;
> +	for_each_child_of_node_scoped(np, child_np) {

Does this loop interact with disabled hardware blocks?

Using for_each_child_of_node_scoped() will iterate over all child nodes,
including those with status =3D "disabled" in the device tree.

This results in the driver mapping memory, initializing regmaps, and
calling econet_usb_phy_exit() to write to registers on unpowered or
unclocked hardware, which can sometimes cause system hangs.

Would it be safer to use for_each_available_child_of_node_scoped()?

> +		struct econet_phy_instance *instance;
> +		void __iomem *phy_base;
> +		struct device *subdev;
> +		struct resource res;
> +		int retval;

[ ... ]

> +		instance->phy =3D devm_phy_create(dev, child_np, &econet_phy);
> +		if (IS_ERR(instance->phy))
> +			return dev_err_probe(dev, PTR_ERR(instance->phy),
> +					     "failed to create phy\n");
> +
> +		subdev =3D &instance->phy->dev;
> +		retval =3D of_address_to_resource(child_np, 0, &res);
> +		if (retval)
> +			return dev_err_probe(subdev, retval,
> +					     "getting reg for phy %d\n",
> +					     phy_n);
> +
> +		phy_base =3D devm_ioremap_resource(subdev, &res);

Can using the child PHY device for resource allocations cause memory leaks
and probe failures?

The subdev pointer belongs to the child PHY device created by
devm_phy_create(). Devres resources are tied to the device's reference
count reaching zero.

If userspace holds an active sysfs file descriptor for the PHY device when
the parent platform driver unbinds, the subdev kobject stays alive and
the memory region is not freed.

If the platform driver is re-probed, it might fail with -EBUSY when
requesting the same memory region. Should devm_ioremap_resource and
devm_regmap_init_mmio be associated with the parent platform device instead?

> +		if (IS_ERR(phy_base))
> +			return dev_err_probe(subdev, PTR_ERR(phy_base),
> +					     "remapping reg for phy %d\n",
> +					     phy_n);
> +
> +		instance->regmap =3D
> +			devm_regmap_init_mmio(subdev, phy_base,
> +					      &econet_usb_phy_regmap_config);
> +		if (IS_ERR(instance->regmap))
> +			return dev_err_probe(subdev, PTR_ERR(instance->regmap),
> +					     "making regmap for phy %d\n",
> +					     phy_n);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518141343.4015=
55-1-cjd@cjdns.fr?part=3D2
