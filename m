Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609581;
	b=Z+iQ507CgDKvOOZY5+ROT7mSKErPcjd54A5YFh0GzC0ale6M9rQ5ZNLVltCVuw96qEkF
	 Iuau1UBo2DWHm3eMW2pNBRiLHNIkzQ5nTTo6CAijMOv1aRUOadW3Mzu08U+xv3aaLZuVP
	 tyUVpAIUH14MaL4EHeKOCmrCBBTtN9UNUZIt3cYZoq38mRXFJcIrALgx34stjG38gIKxX
	 Q+n3D0zY+iOQth6CVolws7cPpfPhd50qB4OKNDLeCCY+8K4S3wlvS3S3PZTW5KrtE9lw9
	 cFunBR7X1GQHAz39EnHFLnf/Z9B/um1mAPxQacOk3TSCq3zmIB7O5DAQdwGBMR3ljjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=olhcOgpyJpdj24/zWw8LbBmaXBNaz23qSWupiGvbEe8=;
	b=KEcEYSoKksgv8oZ5LyiwL1GRPAuq/qmAk4VrwSLIFYMgA3yVduMEjMmTe5yUSKoRG6qt
	 gLX5ErDds9vvHs6b4+BBs7n90U6VOoj6sVey+N1uv/yQ27i4dLUc3lG/3rJKf2nTI/bhH
	 e4PXjk8oHUFBxJysuqiMM5D6Zfs9NwDJKNwgInCKmpPXprs57V7HXO8IEtWYMNgBvLcWX
	 OK5giAU+H9fGk+DHDy10mt1/dYBxk73sAmdHfKoyvFvUr18RINlAdRt9gF9KTa9jNVUxu
	 BGH+071pgo6RuEYXwPSFkqx1hDM5Znl1Ib1nwFoeCLFCuZ3q/WoAWrj3IbY7ueS194Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ocgb2Ngv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC300606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ocgb2Ngv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E872D1F000C1;
	Mon,  2 Nov 2026 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793609580;
	bh=olhcOgpyJpdj24/zWw8LbBmaXBNaz23qSWupiGvbEe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ocgb2NgvVsAzYNc+ObwrBJdeK6M3bi183ETVmMipp3Af28CFJHPrETnvBPrGnOCly
	 QaaHA0bAcE8P/xI6w1ypFh0gGuGcdHX0gAvHTYQo2VjAFkxPt2SnmC1SLbAUyEek3S
	 6wAeCNMi8v3Am+imnkcVhTQ12dOd6E9vC4QmkW8lbrKbsCXWBdfftZ7Igssg10QjKg
	 Wt8toXbdD8ltcmGebsLvdTNQ4vHRdscbMEXdI94PczoRjQNJVmZjvmNT6K+XCTQidl
	 aOhcfqHSpQkaomNh6La2Q9SbBW+gcTTclp5Uvz+duqNWaEQQeE+3WUXDcdwXNSDb2D
	 iP6e0VnXD3AfA==
Message-ID: <sashiko-outbox-193139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: cix: add Sky1 USB/DP combo PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102082112.2306326-4-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261102082112.2306326-4-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:52:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] phy: cix: link rate unit mismatch and PLL disable in udphy_dp_phy_=
set_rate()
- [High] phy: cix: unclocked MMIO and lane check in udphy_dp_phy_configure()
- [High] phy: cix: clock leak and skipped re-init in cix_usbdp_phy_power_on=
()
- [Medium] phy: cix: per-lane voltages ignored in udphy_dp_phy_set_voltages=
()
- [Medium] dt-bindings: phy: cix,sky1-usbdp-phy: missing OF graph port prop=
erties
--

commit ffe7df98ad72d8c1a7362fd9f434e85648138040
Author: Gary Yang <gary.yang@cixtech.com>

arm64: dts: cix: add Sky1 USB/DP combo PHY

This series adds the device tree binding, driver, and device tree nodes for
the CIX Sky1 USB/DP combo PHY, supporting SuperSpeedPlus USB and DisplayPort
lane muxing and Type-C orientation switching via the S5 system controller.

> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yam=
l b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
> new file mode 100644
> index 0000000000000..a5b6943f84ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
> @@ -0,0 +1,150 @@

[ ... ]

> +  orientation-switch:
> +    description:
> +      The PHY handles Type-C plug orientation switching.
> +    type: boolean
> +
> +  mode-switch:
> +    description:
> +      The PHY handles multiplexing of the USB and DisplayPort lanes.
> +    type: boolean

[Severity: Medium]
When a board device tree connects a usb-c-connector node to this PHY for
Type-C orientation and mode switching, the connector links to the provider
via OF graph port or ports endpoints (matched by fwnode_graph_devcon_matche=
s()
in typec_switch_match() and typec_mux_match()).

Because this schema specifies additionalProperties: false without defining
port or ports properties, won't board device trees that wire a Type-C
connector to a cix,sky1-usbdp-phy node fail dtbs_check validation?

[ ... ]

> diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-us=
bdp.c
> new file mode 100644
> index 0000000000000..d596e89c74f76
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usbdp.c
> @@ -0,0 +1,1477 @@

[ ... ]

> +static int sky1_udphy_init(struct cix_udphy *udphy)
> +{
> +	int ret;
> +	u32 value;
> +	const struct cix_udphy_con_dir *con_dir =3D &udphy->cfg->con_dir[udphy-=
>id];
> +
> +	regmap_update_bits(udphy->usbphy_syscon, con_dir->offset,
> +			   GENMASK(con_dir->bit, con_dir->bit),
> +			   udphy->flip << con_dir->bit);
> +
> +	usleep_range(10, 20);
> +
> +	regmap_read(udphy->usbphy_syscon, con_dir->offset, &value);
> +
> +	/* usb rcsu reset is default deassert */
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +
> +	ret =3D sky1_udphy_clk_enable(udphy->apb_clk);
> +	if (ret) {
> +		dev_err(udphy->dev, "Failed to prepare_enable udphy apb clock\n");
> +		return ret;
> +	}

[ ... ]

> +static int udphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct cix_udphy *udphy =3D typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&udphy->mutex);
> +
> +	if (orien =3D=3D TYPEC_ORIENTATION_NONE)
> +		goto unlock_ret;
> +
> +	udphy->flip =3D (orien =3D=3D TYPEC_ORIENTATION_REVERSE) ? true : false;
> +
> +unlock_ret:
> +	mutex_unlock(&udphy->mutex);
> +	return 0;
> +}

[ ... ]

> +static int cix_usbdp_phy_power_on(struct cix_udphy *udphy)
> +{
> +	const struct cix_udphy_cfg *phy_cfgs =3D udphy->cfg;
> +	int ret;
> +
> +	if (udphy->cur_mode =3D=3D udphy->next_mode)
> +		return 0;
> +
> +	if ((udphy->cur_mode =3D=3D UDPHY_MODE_USB || udphy->cur_mode =3D=3D UD=
PHY_MODE_DP) &&
> +	    udphy->next_mode =3D=3D UDPHY_MODE_DP_USB)
> +		return 0;
> +
> +	if (phy_cfgs->udphy_init) {
> +		ret =3D phy_cfgs->udphy_init(udphy);
> +		if (ret) {
> +			dev_err(udphy->dev, "failed to init udphy\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int udphy_dp_phy_power_on(struct phy *phy)
> +{
> +	struct cix_udphy *udphy =3D phy_get_drvdata(phy);
> +	int ret =3D 0;
> +
> +	mutex_lock(&udphy->mutex);
> +	if (!(udphy->next_mode & UDPHY_MODE_DP))
> +		goto unlock;
> +
> +	ret =3D cix_usbdp_phy_power_on(udphy);
> +	if (ret)
> +		goto unlock;
> +
> +	phy_set_bus_width(phy, udphy_dplane_get(udphy));
> +	if (udphy->next_mode =3D=3D UDPHY_MODE_DP)
> +		udphy->cur_mode =3D UDPHY_MODE_DP;
> +	else
> +		udphy->cur_mode |=3D UDPHY_MODE_DP;
> +
> +unlock:
> +	mutex_unlock(&udphy->mutex);
> +	return ret;
> +}

[Severity: High]
How are udphy->apb_clk and the hardware lane configuration kept in sync when
transitioning between Type-C modes and orientations?

First, if USB powers on first (setting udphy->cur_mode =3D UDPHY_MODE_USB a=
nd
enabling udphy->apb_clk once in sky1_udphy_init()), and the Type-C mux then
selects 4-lane DP (udphy->next_mode =3D UDPHY_MODE_DP) followed by
udphy_dp_phy_power_on():

  udphy_dp_phy_power_on()
    cix_usbdp_phy_power_on()
      sky1_udphy_init()
        sky1_udphy_clk_enable(udphy->apb_clk);
    udphy->cur_mode =3D UDPHY_MODE_DP;

sky1_udphy_init() calls clk_prepare_enable(udphy->apb_clk) a second time, a=
nd
udphy_dp_phy_power_on() overwrites udphy->cur_mode =3D UDPHY_MODE_DP, dropp=
ing
UDPHY_MODE_USB. When the PHYs later power off, sky1_udphy_exit() runs at mo=
st
once, leaking a prepare/enable reference on udphy->apb_clk.

Second, if DP powers on first in 4-lane mode (udphy->cur_mode =3D UDPHY_MOD=
E_DP,
programmed with sky1_udphy_dp_conf) and udphy->next_mode later changes to
UDPHY_MODE_DP_USB, cix_usbdp_phy_power_on() hits the early return:

	if ((udphy->cur_mode =3D=3D UDPHY_MODE_USB || udphy->cur_mode =3D=3D UDPHY=
_MODE_DP) &&
	    udphy->next_mode =3D=3D UDPHY_MODE_DP_USB)
		return 0;

Doesn't that skip reprogramming the PHY from 4-lane DP to the USB+DP combo
configuration when cix_u3phy_init() is called?

Third, if udphy_orien_sw_set() updates udphy->flip while one sub-PHY is
already active in udphy->cur_mode, cix_usbdp_phy_power_on() also returns 0
without updating udphy->usbphy_syscon or loading the flipped register table
(sky1_udphy_usbdp_conf_flip), while subsequent calls to
udphy_dp_phy_set_rate() and udphy_dp_phy_set_voltages() program the flipped
lanes.

[ ... ]

> +static int udphy_dp_phy_verify_config(struct cix_udphy *udphy,
> +				      struct phy_configure_opts_dp *dp)
> +{
> +	int i;
> +
> +	switch (dp->lanes) {
> +	case 1:
> +	case 2:
> +	case 4:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

[ ... ]

> +static int udphy_dp_phy_set_rate(struct cix_udphy *udphy,
> +				 struct phy_configure_opts_dp *dp)
> +{
> +	int ret;
> +	const struct phy_link_cfg *conf =3D NULL;
> +
> +	dev_dbg(udphy->dev, "lane %d, rate %x\n", dp->lanes, dp->link_rate);
> +
> +	regmap_update_bits(udphy->phy_regmap, PHY_PMA_PLL_CTRL, BIT(1), 0x0);
> +	usleep_range(10, 20);
> +
> +	switch (dp->link_rate) {
> +	case 0x6:
> +		conf =3D &link_cfg[0];
> +		ret =3D regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partia=
l_conf,
> +					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
> +		break;
> +	case 0xa:
> +		conf =3D &link_cfg[1];
> +		ret =3D regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partia=
l_conf,
> +					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
> +		break;
> +	case 0x14:
> +		conf =3D &link_cfg[2];
> +		ret =3D regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_partia=
l_conf,
> +					     ARRAY_SIZE(sky1_udphy_dp_partial_conf));
> +		break;
> +	case 0x1e:
> +		conf =3D &link_cfg[3];
> +		ret =3D regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_8p1_co=
nf,
> +					     ARRAY_SIZE(sky1_udphy_dp_8p1_conf));
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

[Severity: High]
In include/linux/phy/phy-dp.h, struct phy_configure_opts_dp defines link_ra=
te
in Mb/s (1620, 2700, 5400, 8100), whereas udphy_dp_phy_set_rate() matches
dp->link_rate against raw DPCD bandwidth codes (0x6, 0xa, 0x14, 0x1e).

Won't standard DisplayPort controller drivers passing link_rate in Mb/s to
phy_configure() -> udphy_dp_phy_configure() -> udphy_dp_phy_set_rate() alwa=
ys
hit the default case and fail with -EINVAL, while also leaving BIT(1) of
PHY_PMA_PLL_CTRL cleared?

[ ... ]

> +static int udphy_dp_phy_set_voltages(struct cix_udphy *udphy,
> +				     struct phy_configure_opts_dp *dp)
> +{
> +	u32 index =3D dp->voltage[0] * 4 + dp->pre[0];
> +	const struct phy_voltage_conf *cfg =3D volt_cfg;
> +
> +	dev_dbg(udphy->dev, "lane %d, vs %d, pe %d\n", dp->lanes, dp->voltage[0=
],
> +		dp->pre[0]);

[Severity: Medium]
udphy_dp_phy_verify_config() validates dp->voltage[i] and dp->pre[i] for ea=
ch
lane i < dp->lanes, but udphy_dp_phy_set_voltages() computes index solely f=
rom
dp->voltage[0] and dp->pre[0] and writes that configuration to all active
lanes.

Should udphy_dp_phy_set_voltages() compute the volt_cfg index per lane using
each lane's own dp->voltage[i] and dp->pre[i] values so per-lane link train=
ing
adjustments are applied?

[ ... ]

> +static int udphy_dp_phy_configure(struct phy *phy,
> +				  union phy_configure_opts *opts)
> +{
> +	struct cix_udphy *udphy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	mutex_lock(&udphy->mutex);
> +	ret =3D udphy_dp_phy_verify_config(udphy, &opts->dp);
> +	if (ret)
> +		goto unlock;
> +
> +	if (opts->dp.set_rate) {
> +		ret =3D udphy_dp_phy_set_rate(udphy, &opts->dp);
> +		if (ret) {
> +			dev_err(udphy->dev, "failed to set DP link rate\n");
> +			goto unlock;
> +		}
> +	}

[Severity: High]
What happens if udphy_dp_phy_configure() is called when UDPHY_MODE_DP is not
active in udphy->cur_mode, or with more lanes than allocated to DP?

In udphy_dp_phy_power_on(), if !(udphy->next_mode & UDPHY_MODE_DP) (for
example when Type-C is in TYPEC_STATE_SAFE or USB-only mode, or when
cix,default-conf is 0 or 1), udphy_dp_phy_power_on() returns 0 without
enabling udphy->apb_clk or deasserting udphy->preset. A subsequent call to
udphy_dp_phy_configure() will then perform MMIO reads and writes through
udphy->phy_regmap while the APB clock is disabled and APB reset is asserted.

In addition, udphy_dp_phy_verify_config() accepts dp->lanes =3D=3D 4 without
checking against udphy_dplane_get(udphy), so a 4-lane DP configuration in
2-lane UDPHY_MODE_DP_USB mode will overwrite the active USB lane registers =
in
udphy_dp_phy_set_rate() and udphy_dp_phy_set_voltages().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102082112.2306=
326-1-gary.yang@cixtech.com?part=3D3
