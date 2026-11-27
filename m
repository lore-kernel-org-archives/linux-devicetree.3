Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777712;
	b=EyUTscqMfUlgmPqksAD8DJAPI1SWQ7e4S4IYWIZnI4BcKpWN1GHMkBtFWPIrGbRK4qys
	 41osHHBgrZTC25GtLYZBGouqzP07vYXzwxag/ZApmRZ63NPS9sv26p7ZN3qpn6KvJE4q9
	 yNTPf5GhAJsObqiTIOJyf1/X01PjcEFdEWirS6+PlpudYvM+aMRe0sl+5n+soo8GJ4kvy
	 /YwywvIEoNIuhsn8XAJDFQeHjiaxrQtPjhHOoy9mB2fFMVJfaPrGyfEAfxe2+MSt0k0rf
	 dDfmxG11lnxr4mu7Pkh3d0Fm89hFnfy7v1FU7KhjYfdO9JH3ZJo31uHhL6lO5id0aUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777712;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IcOhzy+KAxIj0eQLWWAKn0mUdWKxRE0xqk05Cf3y8WA=;
	b=JrU+oWc8m3tvjh5mwDSREbMIGVPChOGVWaqO804xmEnzXNuWMezxfO8VcqbVS9dYB9kY
	 jw7R5Eo3HrvGLXP3SRQFyuIOK2RAmOPs8kqWT7ewZbTYd/DHv+UbAdDhMcTDi8nQU4JPw
	 iAkwOk2nYHa5Nz0tPpR/x7Hn1tiWvF3ldsPncc4Ccnr0DcfnCBTRLpswClodyJkYlAeDt
	 iUUFzmQiWLlOo64Qi94zftU+tHkO5Z/FQ+Dl/2G3XzTGf4v0IuAbTggZTgl7BZb3YqMkO
	 HxdRU3Q2ev45dV9US6ZXW5F/XKau68wODxiNmmeZ5UGTFUfqvejPqkDXfFFHX4yUinw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNVK3na1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A9606A31E;
	Fri, 27 Nov 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNVK3na1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3624E1F00899;
	Fri, 27 Nov 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777712;
	bh=IcOhzy+KAxIj0eQLWWAKn0mUdWKxRE0xqk05Cf3y8WA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oNVK3na1LZXfISqAjR2czLPPe9+c7dfWodNtiL3oukDwK0W/Tk8Cxk+POL4y9OUSq
	 EYTQc5mN8Vul1b6TNRv1lRkZyQli5sx+o9dK1a979QxD/WCvUGvK9lm+mNcH5PPvI1
	 sfRM47lW7Gtjjiq+++SUXx5k6x7i4yDmw4Nptol1+DhCAArkCFaTL52M894SkNYhi4
	 5SuOEb84MlBA4yzDjbzIRGtI/i9UhYIvj6kXpbA83yhsXncNctA4kbYsaH0FCSII17
	 nDk9Gt3L5ad3Uwll4ST8AGuuygg3oaBcO6VtGu50yPwGZHpqe1ap6FoSFCUQQzawi4
	 BLnjvjJjjM7IQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] phy: cix: add Sky1 USB/DP combo PHY driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>, 
 Luo Liu <Luo.Liu@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117083434.3414417-3-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
 <20261117083434.3414417-3-gary.yang@cixtech.com>
Date: Fri, 27 Nov 2026 16:38:23 +0530
Message-Id: <179577770311.3421.6446368011498200273.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10292; i=mani@kernel.org;
 h=from:subject:message-id; bh=qXdkNkbfxD3YzEXsjb2ttdV0FBI6w7N9TpN9umhcQmY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWSqkuwqnXFeGCx5ifR9925Gj5aix8tk6Qn5m
 FPXjfuKAvmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlkqgAKCRBVnxHm/pHO
 9WVuCAClYoSc5NAgMGmCuyLjTMRyuY15cp6LJ9cRYp4bL+uAtZOD5tcZgSmBBZgqcZgIpi6vK73
 V1wveNVy+m+duJHPrsF5/Eae2vPLodBZK0n9CB2nb/DvSrmtwsMiUA5aiEEpt5AHraegAgspdLW
 ZRC560htNJl86Jeb5gQL3mYbrcpDF32c/Ur4+rT9KNr220+yYWcFOGKQA7QQh0MyvhDJcvnNshi
 hwvu9UpHENRxT+GtDf6JeMbPfpVUzjQZFdm+nEnbA9t859p+UDdg/KskT8wT6MD2NFuNJF8ar2I
 wJM4Pv1vCyUwUP8fHwKZ6R6+/8/4Jioai9qLIsSRrEJ5sEM+
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-17 16:34 +0800, Gary Yang wrote:
> Add a driver for the USB/DP combo PHY found on the CIX Sky1 SoC. A
> single PHY instance drives one SuperSpeedPlus USB lane and up to four
> DisplayPort lanes of a USB Type-C port, and exposes them as two PHYs
> selected by PHY_TYPE_USB3 and PHY_TYPE_DP, so that the USB and DP
> controllers can bind to them independently.
> 
> The PHY supports Type-C plug orientation switching, which is driven
> through the S5 system controller, and muxing of the PHY lanes between
> USB and DP, which is programmed in the PHY registers. It registers a
> Type-C switch and mux with the Type-C class, so the orientation and
> mode decisions are taken by the connector driver instead of the PHY.
> 
> The shared PHY is programmed once per mode combination: the driver
> tracks the current and requested USB/DP mode as well as the plug
> orientation, and reprograms the PHY on the next power-on only when the
> mode combination or the orientation has changed.
> 
> Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  MAINTAINERS                     |    4 +-
>  drivers/phy/cix/Kconfig         |   16 +
>  drivers/phy/cix/Makefile        |    1 +
>  drivers/phy/cix/phy-cix-usbdp.c | 1422 +++++++++++++++++++++++++++++++
>  drivers/phy/cix/phy-cix-usbdp.h |  257 ++++++
>  5 files changed, 1699 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

[...]

> +static inline void udphy_write(struct cix_udphy *udphy, u32 reg, u32 val)

No 'inline' keyword in .c files please. Compilers will decide when to inline a
function. Same comment applies to other helpers.

Besides, this function doesn't add any value. So drop it please.

> +{
> +	writel(val, udphy->base + reg * 4);
> +}
> +
> +static inline void udphy_update_bits(struct cix_udphy *udphy, u32 reg,
> +				     u32 mask, u32 val)
> +{
> +	void __iomem *addr = udphy->base + reg * 4;
> +	u32 tmp;
> +
> +	tmp = readl(addr);
> +	writel((tmp & ~mask) | (val & mask), addr);
> +}
> +
> +static inline void udphy_write_table(struct cix_udphy *udphy,
> +				     const struct reg_sequence *seq,
> +				     unsigned int num)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < num; i++)
> +		udphy_write(udphy, seq[i].reg, seq[i].def);
> +}
> +
> +/* Link rate change */
> +struct phy_link_cfg {
> +	const struct reg_sequence *seq;
> +	unsigned int num_seq;
> +	u32 hsclk_div;
> +	u32 clk_sel;
> +	u32 pll_intdiv;
> +	u32 pll_fracdivl;
> +	u32 pll_high_thr;
> +};
> +
> +static const struct phy_link_cfg link_cfg[] = {
> +	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
> +	  0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },  /* 1.62 Gbps */
> +	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
> +	  0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },  /* 2.70 Gbps */
> +	{ sky1_udphy_dp_partial_conf, ARRAY_SIZE(sky1_udphy_dp_partial_conf),
> +	  0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },  /* 5.40 Gbps */
> +	{ sky1_udphy_dp_8p1_conf, ARRAY_SIZE(sky1_udphy_dp_8p1_conf),
> +	  0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },  /* 8.10 Gbps */
> +};
> +
> +struct phy_voltage_conf {
> +	u32 tx_txcc_ctrl;
> +	u32 drv_diag_tx_drv;
> +	u32 tx_txcc_mgnfc_mult_000;
> +	u32 tx_txcc_cpost_mult_00;
> +};
> +
> +static const struct phy_voltage_conf volt_cfg[] = {
> +	{ 0x08a4, 0x0003, 0x0028, 0x0000 }, /* swing level == 0 */
> +	{ 0x08a4, 0x0003, 0x001f, 0x0014 },
> +	{ 0x08a4, 0x0003, 0x0012, 0x0020 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0027 },
> +	{ 0x08a4, 0x0003, 0x001f, 0x0000 }, /* swing level == 1 */
> +	{ 0x08a4, 0x0003, 0x0013, 0x0012 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08a4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08a4, 0x0003, 0x0013, 0x0000 }, /* swing level == 2 */
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 }, /* swing level == 3 */
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +};
> +
> +static int udphy_dplane_get(struct cix_udphy *udphy)
> +{
> +	int dp_lanes;
> +
> +	switch (udphy->next_mode) {
> +	case UDPHY_MODE_DP:
> +		dp_lanes = 4;
> +		break;
> +	case UDPHY_MODE_DP_USB:
> +		dp_lanes = 2;
> +		break;
> +	case UDPHY_MODE_USB:
> +		fallthrough;
> +	default:
> +		dp_lanes = 0;
> +		break;
> +	}
> +
> +	return dp_lanes;
> +}
> +
> +static int sky1_udphy_clk_enable(struct clk *clk)
> +{
> +	int i, ret = -EBUSY;

Why can't you return the actual error from clk_prepare_enable()?

> +
> +	/*
> +	 * If the clock could not enable 10 iterations,
> +	 * it considers this clock is broken.

Make use of full 80 columns for comments.

> +	 */
> +	for (i = 0; i < 10; i++) {
> +		ret = clk_prepare_enable(clk);
> +		if (!ret)
> +			return 0;
> +
> +		usleep_range(5000, 6000);
> +	}
> +
> +	return ret;
> +}
> +
> +static int sky1_udphy_exit(struct cix_udphy *udphy)
> +{
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +	clk_disable_unprepare(udphy->apb_clk);
> +	return 0;
> +}
> +
> +static void sky1_udphy_set_orientation(struct cix_udphy *udphy)
> +{
> +	const struct cix_udphy_con_dir *con_dir =
> +		&udphy->cfg->con_dir[udphy->id];
> +
> +	regmap_update_bits(udphy->usbphy_syscon, con_dir->offset,
> +			   GENMASK(con_dir->bit, con_dir->bit),
> +			   (u32)udphy->flip << con_dir->bit);
> +
> +	usleep_range(10, 20);
> +}
> +
> +static void sky1_udphy_write_mode_table(struct cix_udphy *udphy)
> +{
> +	if (udphy->next_mode == UDPHY_MODE_DP) {
> +		udphy_write_table(udphy, sky1_udphy_dp_conf,
> +				  ARRAY_SIZE(sky1_udphy_dp_conf));
> +	} else if (!udphy->flip) {
> +		udphy_write_table(udphy, sky1_udphy_usbdp_conf_normal,
> +				  ARRAY_SIZE(sky1_udphy_usbdp_conf_normal));
> +	} else {
> +		udphy_write_table(udphy, sky1_udphy_usbdp_conf_flip,
> +				  ARRAY_SIZE(sky1_udphy_usbdp_conf_flip));
> +	}
> +}
> +
> +/* Reprogram the PHY after the mode or the plug orientation has changed. */
> +static int sky1_udphy_reinit(struct cix_udphy *udphy)
> +{
> +	sky1_udphy_set_orientation(udphy);
> +
> +	/*
> +	 * The APB clock is still enabled, so the block can be reset without
> +	 * running the full power-on sequence again.
> +	 */
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +	reset_control_deassert(udphy->preset);
> +
> +	sky1_udphy_write_mode_table(udphy);
> +
> +	reset_control_deassert(udphy->reset);
> +
> +	return 0;
> +}
> +
> +static int sky1_udphy_init(struct cix_udphy *udphy)
> +{
> +	int ret;
> +
> +	sky1_udphy_set_orientation(udphy);
> +
> +	/* usb rcsu reset is default deassert */
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +
> +	ret = sky1_udphy_clk_enable(udphy->apb_clk);
> +	if (ret) {
> +		dev_err(udphy->dev, "failed to enable APB clock\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(udphy->preset);
> +
> +	sky1_udphy_write_mode_table(udphy);
> +
> +	reset_control_deassert(udphy->reset);
> +
> +	return 0;
> +}
> +
> +static const struct cix_udphy_cfg sky1_udphy_cfg = {
> +	.con_dir = sky1_udphy_con_dir,
> +	.udphy_init = sky1_udphy_init,
> +	.udphy_reinit = sky1_udphy_reinit,
> +	.udphy_exit = sky1_udphy_exit
> +};

Do you really need per-device callbacks? Do you really forsee different devices
using different callbacks in the future? If not, I'd suggest to drop it.

> +
> +static int udphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct cix_udphy *udphy = typec_switch_get_drvdata(sw);
> +	bool flip;
> +
> +	guard(mutex)(&udphy->mutex);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE)
> +		return 0;
> +
> +	flip = (orien == TYPEC_ORIENTATION_REVERSE);
> +	if (udphy->flip != flip) {
> +		dev_dbg(udphy->dev, "plug orientation changed, re-init required\n");
> +		udphy->needs_reinit = true;
> +	}
> +
> +	udphy->flip = flip;
> +
> +	return 0;
> +}

[...]

> +static int cix_udphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct phy_provider *phy_provider;
> +	struct cix_udphy *udphy;
> +	u32 id;
> +	int ret;
> +
> +	udphy = devm_kzalloc(dev, sizeof(*udphy), GFP_KERNEL);
> +	if (!udphy)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, udphy);
> +	udphy->dev = dev;
> +	udphy_set_default_mode(udphy);
> +
> +	udphy->usbphy_syscon =
> +		syscon_regmap_lookup_by_phandle_args(np, "cix,usbphy-syscon", 1,
> +						     &id);
> +	if (IS_ERR(udphy->usbphy_syscon))
> +		return dev_err_probe(dev, PTR_ERR(udphy->usbphy_syscon),
> +				     "failed to get usbphy syscon\n");
> +
> +	if (id >= ARRAY_SIZE(sky1_udphy_con_dir))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid usbphy syscon id\n");
> +
> +	udphy->id = id;
> +
> +	udphy->cfg = device_get_match_data(dev);
> +	if (!udphy->cfg)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "failed to get match data\n");
> +
> +	udphy->reset = devm_reset_control_get_exclusive(dev, "core");
> +	if (IS_ERR(udphy->reset))
> +		return dev_err_probe(dev, PTR_ERR(udphy->reset),
> +				     "failed to get reset\n");
> +
> +	udphy->preset = devm_reset_control_get_exclusive(dev, "apb");
> +	if (IS_ERR(udphy->preset))
> +		return dev_err_probe(dev, PTR_ERR(udphy->preset),
> +				     "failed to get preset\n");
> +
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +
> +	udphy->apb_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(udphy->apb_clk))
> +		return dev_err_probe(dev, PTR_ERR(udphy->apb_clk),
> +				     "failed to get APB clock\n");
> +
> +	udphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(udphy->base))
> +		return dev_err_probe(dev, PTR_ERR(udphy->base),
> +				     "failed to remap registers\n");
> +
> +	mutex_init(&udphy->mutex);

devm_mutex_init()?

- Mani


