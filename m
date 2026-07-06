Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF73126D9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369002; cv=none; b=FJ6VgQcPk48kk2woa+ZnmXwpNoM9qJ4Hb6y5rz1GugCeSn5FoSlYNMb5VUTvcskXBpKYxsPWuHESe21WV8DeEucS6v1DxfWLfyohiFBIedmEL+u10KicVvKWXdwLu72np/UA6lefdFAcety7zgdwSwd3kYvIcILZaFiUXJDocJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369002; c=relaxed/simple;
	bh=7GqTJNhN5uI2OIwOWNSQNH2Cfu5w4Hp2miYMv97AFnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twAC12os3niGJm/6qFcFQOZuQAkfkyW8V5FW1KVj5u4GJ39QJemWfxTFj5t9DNKF6jIgKkN/Dq8ZNgRQcjQdYguVG6tWTojnnBmo0ItAL6rwMZhJeJUa4AEhO2988mSfTRZ4TDEJOcnun4tgfulquz72dc57vPjvM0H5PI8LT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZhn+BOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZhn+BOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1CE1F000E9;
	Mon,  6 Jul 2026 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783369001;
	bh=0DWdG6qm2QnkTt1ETKOS9RZXqYtVTIwqDmrPtZjg0iE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZhn+BOzD1t5xHy+m355Vf/jBBaPls6MQ3Kly2PFRcEDYt5MD5ebaa3usm8jvvdHc
	 0xHIBt5AtQ5CpSdQU8HaqsMVl4J4gP+XX4GCMKhaVx0m6drGDwjiv3rkskFpIFwo/y
	 1LvfL58+7v5sZhcF33Msx3S8+K8E56p1bHdSNvgt1m6yw99n+PH6pA/OF2Ac5GXPfd
	 o0igAFJLbgyfQeKQhJ1+3yvK8TdzbRPCeuoTpq7hbmhZKr2O7hnr1bzMZhTquv9111
	 aEe20TE1frAWPgpzdh05t3GTbDDowgm6y6yT5kL8B6LXFhZS3c55hvYBZtCBFotiQr
	 dRwmnHjeQcOIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/12] dt-bindings: serial: snps-dw-apb-uart: Add RV1106
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706195818.3906949-7-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-7-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 20:16:40 +0000
Message-Id: <20260706201640.CF1CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Invalid IOMUX register offsets for GPIO2 C and D pins cause memory=
 corruption of GPIO1 A IOMUX settings.
- [Medium] The GRF MMC phase clock driver bypasses the syscon regmap, perfo=
rming un-synchronized direct MMIO writes to the GRF.
--

commit 9eb9c18d0c1a4005a3ce42ce1798290561f0777d
Author: Simon Glass <sjg@chromium.org>

dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
   =20
Add the compatible for the UARTs of the Rockchip RV1106, which are
compatible with the Synopsys DesignWare APB UART.

> diff --git a/drivers/clk/rockchip/clk-rv1106.c b/drivers/clk/rockchip/clk=
-rv1106.c
> new file mode 100644
> index 0000000000000..88f043f34c233
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-rv1106.c
[ ... ]
> +static struct rockchip_clk_branch rv1106_grf_clk_branches[] __initdata =
=3D {
> +	MMC(SCLK_EMMC_DRV, "emmc_drv", "cclk_src_emmc", RV1106_EMMC_CON0, 1),
> +	MMC(SCLK_EMMC_SAMPLE, "emmc_sample", "cclk_src_emmc", RV1106_EMMC_CON1,=
 1),

[Severity: Medium]
Could this cause a regression by bypassing the syscon regmap and using dire=
ct
MMIO writes instead?

Registering phase clocks using the MMC macro rather than MMC_GRF passes a r=
aw
MMIO pointer and a NULL regmap. While hardware-level data corruption might =
be
avoided due to the Rockchip GRF utilizing HIWORD_UPDATE bit masks, this
bypasses the syscon locking primitives and creates duplicate I/O mappings.

[ ... ]
> +static void __init rv1106_grf_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	struct device_node *parent_np;
> +	unsigned long clk_nr;
> +	void __iomem *reg_base;
> +
> +	clk_nr =3D rockchip_clk_find_max_clk_id(rv1106_grf_clk_branches,
> +					      ARRAY_SIZE(rv1106_grf_clk_branches)) + 1;
> +	parent_np =3D of_get_parent(np);
> +	reg_base =3D of_iomap(parent_np, 0);
> +	of_node_put(parent_np);

[Severity: Medium]
Is it safe to directly map the shared parent GRF syscon device here?

Mapping with of_iomap() circumvents the syscon regmap API instead of retrie=
ving
its regmap via syscon_node_to_regmap(). This skips the expected synchroniza=
tion
and creates duplicate I/O mappings.

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
-rockchip.c
> index 7e0fcd45fd265..f9cbcb955853c 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
[ ... ]
> +static struct rockchip_pin_bank rv1106_pin_banks[] =3D {
> +	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0, 0x08, 0x10, 0x18),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x10020, 0x10028, 0, 0),

[Severity: High]
Does explicitly setting 0 as the offset for parts C and D cause memory
corruption of GPIO1 A IOMUX settings?

The gpio2 bank has 32 pins, but provides 0 as the explicit IOMUX offset for
parts C and D. During probe, this code evaluates iom->offset >=3D 0 (where =
0 >=3D 0
is true):

drivers/pinctrl/pinctrl-rockchip.c:rockchip_pinctrl_get_soc_data() {
    ...
			/* preset iomux offset value, set new start value */
			if (iom->offset >=3D 0) {
    ...
}

This retains 0 as the offset for these pins rather than calculating them
sequentially. Since offset 0 of the IOC regmap is physically the IOMUX regi=
ster
for GPIO1 A, any device tree configuration or runtime mux change for a GPIO=
2 C
or D pin will silently write to offset 0, corrupting the hardware IOMUX sta=
te
of GPIO1 A and B.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706195818.3906=
949-1-sjg@chromium.org?part=3D6
