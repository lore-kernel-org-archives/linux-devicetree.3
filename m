Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608271;
	b=aMY+hmevd1oqxNX9fF3gW1Yj/wpFpnrY/kgZ0UAIvU7KBwPWqaH2BuaUdZghbbveOPat
	 ecDhswgKxglK9zr/76aKpBVEwtKuNRXKspbQjZ0xiceU6jqJmqSss0+clMsjhwKmA01ib
	 SMGiuYeRBLkVfE9lxGbVjW0xIM6oPxJQq8cPIY5M23clmxmMrkfrbbL+eqV/FpE14kvm+
	 UPYGauhQl+eTnpHFWawLWD2dIZSn6GQGFySiY/MLvwXbWIqtRvJxqeVQo3UCk8o66lHXO
	 RVWpyGim3QhXjwyJpv+mWrF/H1quBt/AjV/s00oBs9082fFzLbH75DGwz6mRr0aFMiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QAzV5TO72cGFZEXPcWWzIfJualQR1RjeQFeYLg+uSyg=;
	b=neP01UKSdJX9RqMjiSsiXm4CrMD/90IR90ivV4ImD2QCvf/Zo4P4tjoc94UCznsb5zlI
	 syD/6QmjnHdUKyCy5vKvCy4a6ksdZsHnLLkTZfdWg+Fu9uu2kuzdCrHQ/tmaOeo3KPF++
	 TWdKRDqZF1Jh3U5ymq2Kt6Lz6VKNCHhgf5DEPZOByJ9lPr9PmgeXVA9Xfk3YCZFNR+t5t
	 OaNsmmEc+Z5qkeAB1ROW+qBLE5pKkTOgWDHrVgfISn4xHU6QXY6gHxbM97VXg2Os5Voec
	 JsDa3P6XAknlL81ElMUrIM54H8AsJpzsraGmRLCq4gXPdelHd9TWv/nTPVybXbjkfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crxT+tjy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64325606A33A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crxT+tjy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADDF1F000C1;
	Mon,  2 Nov 2026 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608271;
	bh=QAzV5TO72cGFZEXPcWWzIfJualQR1RjeQFeYLg+uSyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crxT+tjyN6SuqtN2/vaGLbDYFdOOxtdZwAxuYePJSdbEv6wrcH654ks3SiKVRhaJe
	 i1IUeW3vDX316RPNflgDXOQXcN8CIbj113j7gt4oeWioTjJvKEPsfLU5Nhm2nxnPH1
	 o2477smMU4i79ng7Jvvehzxz1eGHRTuRWaNw4inXw8FLtYLf5HJ1XihLggegxrD5i3
	 IiWYpBofrwsGfOEGzmhZTil/EFP3eV7RRkHtKfeyMuAEPj6yMec59lRm4x6VoH9gkv
	 ARcHTfplKPa9Nm9jC8D//F0P1MHv9JfIP9I813xoMzoFr1mBP61kNEeoDJAp5KYX3T
	 WlmNQ4ZXcpSXw==
Message-ID: <sashiko-outbox-193112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] phy: cix: add Sky1 USB/DP combo PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102081532.2305142-3-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
 <20261102081532.2305142-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:31:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] phy: cix: wrong link_rate units and early PLL disable in udphy_dp_=
phy_set_rate()
- [High] phy: cix: lane 0 voltage and pre-emphasis applied to all lanes in =
udphy_dp_phy_set_voltages()
- [High] phy: cix: missing .init callback in cix_u3phy_ops alongside .exit
- [High] phy: cix: clock enable leak and broken mode/orientation state in c=
ix_usbdp_phy_power_on()
- [High] phy: cix: unclocked MMIO access and missing lane bound in udphy_dp=
_phy_configure()
- [Medium] phy: cix: missing SVID check for DisplayPort states in usbdp_typ=
ec_mux_set()
- [Medium] phy: cix: probe resets PHY despite bootloader handover claim and=
 dead macros
--

commit ba3650ed160ebad8a4d82ef366b4d21f8c1a0ce7
Author: Gary Yang <gary.yang@cixtech.com>

phy: cix: add Sky1 USB/DP combo PHY driver

This commit adds a Generic PHY driver for the CIX Sky1 USB3/DisplayPort com=
bo
PHY, exposing separate USB and DP child PHYs and registering a Type-C
orientation switch and mode mux.

> diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-us=
bdp.c
> new file mode 100644
> index 0000000000000..d596e89c74f76
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usbdp.c
> @@ -0,0 +1,1477 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy driver for cdn_sd0804_t7g_typec
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#include "phy-cix-usbdp.h"
> +
> +enum {
> +	UDPHY_MODE_NONE		=3D 0,
> +	UDPHY_MODE_USB		=3D BIT(0),
> +	UDPHY_MODE_DP		=3D BIT(1),
> +	UDPHY_MODE_DP_USB	=3D BIT(1) | BIT(0),
> +};
> +
> +#define PHY_LANE_MUX_USB			0
> +#define PHY_LANE_MUX_DP				1

[ ... ]

> +static int sky1_udphy_exit(struct cix_udphy *udphy)
> +{
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +	clk_disable_unprepare(udphy->apb_clk);
> +	return 0;
> +}
> +
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

> +static int usbdp_typec_mux_set(struct typec_mux_dev *mux,
> +			       struct typec_mux_state *state)
> +{
> +	struct cix_udphy *udphy =3D typec_mux_get_drvdata(mux);
> +
> +	mutex_lock(&udphy->mutex);
> +
> +	switch (state->mode) {
> +	case TYPEC_DP_STATE_C:
> +		fallthrough;
> +	case TYPEC_DP_STATE_E:
> +		udphy->next_mode =3D UDPHY_MODE_DP;
> +		break;
> +	case TYPEC_DP_STATE_D:
> +		udphy->next_mode =3D UDPHY_MODE_DP_USB;
> +		break;
> +	case TYPEC_STATE_SAFE:
> +		udphy->next_mode =3D UDPHY_MODE_USB;
> +		break;
> +	default:
> +		/* usb only handle as usb+dp mode */
> +		udphy->next_mode =3D UDPHY_MODE_USB;
> +		break;
> +	}
> +
> +	/* TODO: check whether the HPD state needs software */
> +	mutex_unlock(&udphy->mutex);
> +
> +	return 0;
> +}

[Severity: Medium]
In drivers/phy/cix/phy-cix-usbdp.c, usbdp_typec_mux_set() switches directly
on state->mode without checking state->alt.

In include/linux/usb/typec_altmode.h and include/linux/usb/typec_dp.h, both
connector modal states (TYPEC_MODE_USB2 =3D 2, TYPEC_MODE_USB3 =3D 3,
TYPEC_MODE_USB4 =3D 4, TYPEC_MODE_AUDIO =3D 5, TYPEC_MODE_DEBUG =3D 6) and
DisplayPort pin assignment states (TYPEC_DP_STATE_A =3D 2 through
TYPEC_DP_STATE_F =3D 7) start at TYPEC_STATE_MODAL.

If the Type-C mux is called with a non-DisplayPort modal state such as
TYPEC_MODE_USB4, TYPEC_MODE_AUDIO, TYPEC_MODE_DEBUG, or another alternate
mode SVID, won't usbdp_typec_mux_set() match TYPEC_DP_STATE_C,
TYPEC_DP_STATE_D, or TYPEC_DP_STATE_E and misconfigure udphy->next_mode for
DisplayPort unless it first verifies state->alt && state->alt->svid =3D=3D
USB_TYPEC_DP_SID?

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
> +
> +static int cix_usbdp_phy_power_off(struct cix_udphy *udphy)
> +{
> +	const struct cix_udphy_cfg *phy_cfgs =3D udphy->cfg;
> +	int ret;
> +
> +	if (phy_cfgs->udphy_exit) {
> +		ret =3D phy_cfgs->udphy_exit(udphy);
> +		if (ret) {
> +			dev_err(udphy->dev, "failed to exit udphy\n");
> +			return ret;
> +		}
> +	}
> +
> +	udphy->cur_mode =3D UDPHY_MODE_NONE;
> +	return 0;
> +}
> +
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
How does udphy->cur_mode track both the active sub-PHYs and the programmed
hardware configuration in drivers/phy/cix/phy-cix-usbdp.c?

First, sky1_udphy_init() unconditionally calls
sky1_udphy_clk_enable(udphy->apb_clk), which calls clk_prepare_enable(), wh=
ile
sky1_udphy_exit() calls clk_disable_unprepare(udphy->apb_clk) only once when
udphy->cur_mode reaches UDPHY_MODE_NONE. If one child PHY is already active
(for example, cix_u3phy_init() set udphy->cur_mode =3D UDPHY_MODE_USB) and =
the
mux switches to udphy->next_mode =3D UDPHY_MODE_DP before
udphy_dp_phy_power_on() runs, cix_usbdp_phy_power_on() calls sky1_udphy_ini=
t()
a second time and leaks an enable reference on udphy->apb_clk. In that same
path, udphy_dp_phy_power_on() then assigns udphy->cur_mode =3D UDPHY_MODE_D=
P,
clearing UDPHY_MODE_USB so that a later cix_u3phy_exit() becomes a no-op.

Second, if udphy_dp_phy_power_on() initializes the PHY with udphy->next_mode
=3D=3D UDPHY_MODE_DP, sky1_udphy_init() programs sky1_udphy_dp_conf (4-lane
DP-only mode) and sets udphy->cur_mode =3D UDPHY_MODE_DP. If the mux later
switches udphy->next_mode to UDPHY_MODE_DP_USB and cix_u3phy_init() calls
cix_usbdp_phy_power_on(), the check:

	if ((udphy->cur_mode =3D=3D UDPHY_MODE_USB || udphy->cur_mode =3D=3D UDPHY=
_MODE_DP) &&
	    udphy->next_mode =3D=3D UDPHY_MODE_DP_USB)
		return 0;

returns early without calling sky1_udphy_init(), leaving the hardware in
4-lane DP-only mode with the USB3 lanes unconfigured.

Third, udphy_orien_sw_set() updates udphy->flip without marking the PHY as
needing re-initialization. If udphy->flip changes after one sub-PHY has
already initialized in UDPHY_MODE_DP_USB, won't cix_usbdp_phy_power_on() sk=
ip
sky1_udphy_init(), leaving the syscon orientation bit and lane configuration
tables in the old orientation while udphy_dp_phy_set_rate() and
udphy_dp_phy_set_voltages() program the flipped PMA lanes?

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
> +
> +	/*
> +	 * If changing voltages is required, check swing and pre-emphasis
> +	 * levels, per-lane.
> +	 */
> +	if (dp->set_voltages) {
> +		for (i =3D 0; i < dp->lanes; i++) {
> +			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
> +				return -EINVAL;
> +
> +			/*
> +			 * Sum of voltage swing and pre-emphasis levels cannot
> +			 * exceed 3.
> +			 */
> +			if (dp->voltage[i] + dp->pre[i] > 3)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
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
In drivers/phy/cix/phy-cix-usbdp.c, udphy_dp_phy_set_rate() switches on
dp->link_rate using DPCD bandwidth code values (0x6, 0xa, 0x14, 0x1e).

According to include/linux/phy/phy-dp.h, struct phy_configure_opts_dp
defines link_rate in Mb/s (1620, 2700, 5400, 8100). When a standard
DisplayPort bridge or controller driver calls phy_configure() ->
udphy_dp_phy_configure() -> udphy_dp_phy_set_rate() with dp->set_rate =3D 1=
 and
dp->link_rate in Mb/s, won't it always hit the default case and fail with
-EINVAL?

Also, because udphy_dp_phy_verify_config() does not validate dp->link_rate =
and
udphy_dp_phy_set_rate() clears BIT(1) of PHY_PMA_PLL_CTRL before the switch
statement, returning -EINVAL on an unsupported rate leaves PLL1 disabled.

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
> +
> +	switch (dp->lanes) {
> +	case 1:
> +		if (!udphy->flip) { /* lane 2 */
> +			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
> +					   BIT(0), 0x1);
> +			regmap_write(udphy->phy_regmap, TX_TXCC_CTRL_LANE2,
> +				     cfg[index].tx_txcc_ctrl);
> +			regmap_write(udphy->phy_regmap, DRV_DIAG_TX_DRV_LANE2,
> +				     cfg[index].drv_diag_tx_drv);
> +			regmap_write(udphy->phy_regmap, TX_TXCC_MGNFS_MULT_000_LANE2,
> +				     cfg[index].tx_txcc_mgnfc_mult_000);
> +			regmap_write(udphy->phy_regmap, TX_TXCC_CPOST_MULT_00_LANE2,
> +				     cfg[index].tx_txcc_cpost_mult_00);
> +			regmap_update_bits(udphy->phy_regmap, TX_DIAG_ACYA_LANE2,
> +					   BIT(0), 0x0);

[Severity: High]
In drivers/phy/cix/phy-cix-usbdp.c, udphy_dp_phy_verify_config() validates
dp->voltage[i] and dp->pre[i] for each lane up to dp->lanes, but
udphy_dp_phy_set_voltages() computes index solely from dp->voltage[0] and
dp->pre[0] and writes cfg[index] to all active lanes in the 2-lane and 4-la=
ne
cases.

During DisplayPort link training on a 2-lane or 4-lane link, if the sink
requests different voltage swing or pre-emphasis levels across lanes, won't
lanes 1..3 be programmed with lane 0's settings instead of dp->voltage[i] a=
nd
dp->pre[i]?

Could this also use a per-lane helper instead of duplicating the 6-register
programming sequence across all branches?

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
> +
> +	if (opts->dp.set_voltages) {
> +		ret =3D udphy_dp_phy_set_voltages(udphy, &opts->dp);
> +		if (ret) {
> +			dev_err(udphy->dev, "dp_phy_set_voltages failed\n");
> +			goto unlock;
> +		}
> +	}
> +	mutex_unlock(&udphy->mutex);
> +	return 0;
> +
> +unlock:
> +	mutex_unlock(&udphy->mutex);
> +	return ret;
> +}

[Severity: High]
What happens if udphy_dp_phy_configure() in drivers/phy/cix/phy-cix-usbdp.c=
 is
called before udphy_dp_phy_power_on(), or after udphy_dp_phy_power_on()
returned 0 early because !(udphy->next_mode & UDPHY_MODE_DP)?

In both cases, udphy->apb_clk is disabled and udphy->preset is asserted (fr=
om
cix_udphy_probe() or sky1_udphy_exit()), yet udphy_dp_phy_configure() proce=
eds
to call udphy_dp_phy_set_rate() and udphy_dp_phy_set_voltages(), performing
MMIO reads and writes on udphy->base without checking (udphy->cur_mode &
UDPHY_MODE_DP). Won't accessing those registers with the APB clock gated and
reset asserted cause a bus abort or hang?

Additionally, udphy_dp_phy_verify_config() allows dp->lanes =3D=3D 4 even w=
hen
udphy->next_mode is UDPHY_MODE_DP_USB (where udphy_dplane_get(udphy) is 2),
which causes udphy_dp_phy_set_rate() and udphy_dp_phy_set_voltages() to
overwrite the PMA registers of the active USB3 lanes.

[ ... ]

> +static int cix_u3phy_set_mode(struct phy *phy, enum phy_mode mode, int s=
ubmode)
> +{
> +	if (mode =3D=3D PHY_MODE_INVALID)
> +		return cix_u3phy_exit(phy);
> +
> +	return cix_u3phy_init(phy);
> +}
> +
> +static const struct phy_ops cix_u3phy_ops =3D {
> +	.set_mode       =3D cix_u3phy_set_mode,
> +	.exit		=3D cix_u3phy_exit,
> +	.owner		=3D THIS_MODULE,
> +};

[Severity: High]
In drivers/phy/cix/phy-cix-usbdp.c, cix_u3phy_ops defines .exit =3D
cix_u3phy_exit, but omits .init =3D cix_u3phy_init and only invokes
cix_u3phy_init() from cix_u3phy_set_mode().

When a USB controller driver calls phy_init() during probe before
phy_set_mode(), or calls phy_exit() followed by phy_init() across suspend a=
nd
resume without calling phy_set_mode(), won't phy_init() be a no-op that lea=
ves
the USB3 PHY uninitialized and in reset?

[ ... ]

> +static void udphy_set_default_mode(struct cix_udphy *udphy)
> +{
> +	udphy->cur_mode =3D UDPHY_MODE_NONE;
> +}
> +
> +static int cix_udphy_probe(struct platform_device *pdev)
> +{
> +	struct cix_udphy *udphy;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct device_node *np =3D dev->of_node;
> +	u32 id;
> +	int ret =3D 0;

[ ... ]

> +	ret =3D device_property_read_u8(dev, "cix,default-conf", &udphy->next_m=
ode);
> +	if (ret)
> +		udphy->next_mode =3D UDPHY_MODE_DP_USB;
> +
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);

[ ... ]

> +	udphy_set_default_mode(udphy);

[Severity: Medium]
The commit message states:

  The bootloader may hand over the port already initialized; in that
  case the first power_on calls skip the re-initialization.

However, in drivers/phy/cix/phy-cix-usbdp.c, cix_udphy_probe() unconditiona=
lly
calls reset_control_assert() on udphy->reset and udphy->preset, and
udphy_set_default_mode() unconditionally sets udphy->cur_mode =3D
UDPHY_MODE_NONE. As a result, any bootloader initialization is wiped out in
probe and the first power_on call never skips re-initialization. Should
cix_udphy_probe() and udphy_set_default_mode() be updated to match the comm=
it
description, or should the commit message be updated to match the code?

Also, PHY_LANE_MUX_USB and PHY_LANE_MUX_DP at the top of
drivers/phy/cix/phy-cix-usbdp.c are unused and can be removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102081532.2305=
142-1-gary.yang@cixtech.com?part=3D2
