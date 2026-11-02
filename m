Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608740;
	b=3nE3zz2ZzjZyuXLM7x5rjMHLXA/nOhw4fPlKj4uKZ8f6na7pq4X3vqM+WHPthnfXjSfA
	 m/QXagAuxRN48PnBcQEzBHdXoVER6qxtN4bpVUWgg0ZUvauq7G8Iw8gWRo5N4OTqpxnQT
	 0XfXAy3wXeF9FKE8XUITY3JwvAC2oBVjNLOkFhCTLkmfcNIu35RWRPLtJ8qsFzHKyFUOY
	 SBIfx57zVgEcCkxCR+obMF5gCZ2gmLu9C+k9O2bno4YgNbthbVKtdWGzSf3N2fvh84cbd
	 iVtmlay4KKgO2LfDEim9xxn8Z4KnJ0b0fCfLLoH4c9xzFXfkQATup1gUnLFGrOoMh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608740;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ujXPh5DWImCZX0JZvrqR6XdNCQ9pQMh1AAs5cuycDw=;
	b=1/ti5gcWkpFIXalD090ZGE/MQhN2kBNaEvUzTjliF9J3CJPFksNM8xuq8u3eaTIIRUnq
	 GJLmiOG7VsNPeDPIsgr0/LdcdXdBUBTce0/MSf1XAndD+hi6bvKJDqO+NepeFk+O5NDVg
	 dsaLyGqVRgqh7VZYVdN5RoNPKnvm3hlKISiKT+7TJtWHi1YOhYmEugFe1OBIqkDO7ARkn
	 Ne3pUg/MRlCpSda7cGfrYlba8HwcWayo3zmDLiKCFksI6BI9UJu3McXobbgA4tKvNnJRk
	 v0vydK+bwx4QVnSgiK0PqAuiyfZ134RVcodId28YptrvyLjCKJlp1KYlZgPpLpZZxAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIUlEg6q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7432606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIUlEg6q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F8E1F00A18;
	Mon,  2 Nov 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608739;
	bh=+ujXPh5DWImCZX0JZvrqR6XdNCQ9pQMh1AAs5cuycDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LIUlEg6qDTYcydeff3YbsDqdkgXDQNAYrO2VdNd68YqcYI76REarYWvHpdKAd7zEu
	 RUW1CzLuol4ymEUOkmAPONi9kywNAdix6xuHeKyfvjcY5oFfn3NciXMArVG41hLF4U
	 6BbZzFnJjFdDXZ2UmjVctL6uqNpQC7vT6OLz6HSOTrtaaZwxrU2l43m6CrENlzOjPV
	 WWNTEqFK2J+tXVkvmBaOj0HTNBw/HJw7zGotsV6rMh0+AGCWODJZSca2NojR9rgB/D
	 MID6RjyFxgstbSuXZ5PZrOluop7PH4wTyBffQscrDYY3JdU1TKi8mWgbxhsWOmJAMD
	 LO4DPi40v6UgQ==
Message-ID: <sashiko-outbox-193127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] phy: cix: add Sky1 USB/DP combo PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102082112.2306326-3-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261102082112.2306326-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:38:58 +0000
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
- [High] phy: cix: udphy_dp_phy_set_rate() checks DPCD codes instead of Mb/=
s link_rate
- [High] phy: cix: udphy_dp_phy_set_voltages() applies lane 0 settings to a=
ll lanes
- [High] phy: cix: mode tracking in cix_usbdp_phy_power_on() leaks clk and =
skips init
- [High] phy: cix: udphy_dp_phy_configure() accesses MMIO when DP PHY is un=
powered
- [High] phy: cix: udphy_dp_phy_verify_config() mishandles dp->lanes and dp=
->set_lanes
- [High] phy: cix: cix_u3phy_ops omits .init/.power_on and misuses .set_mode
- [Medium] phy: cix: cix_udphy_probe() resets PHY despite bootloader handov=
er claim
--

commit d4e0ce4573b0a846fb24af3d6c745c7798d8f7a9
Author: Gary Yang <gary.yang@cixtech.com>

phy: cix: add Sky1 USB/DP combo PHY driver

This commit adds a driver for the CIX Sky1 USB/DP combo PHY, exposing
separate child PHYs for the SuperSpeedPlus USB lane and DisplayPort lane
while registering a Type-C orientation switch and mode mux.

> diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-us=
bdp.c
> new file mode 100644
> index 0000000000000..d596e89c74f76
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usbdp.c

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
Can the mode tracking in cix_usbdp_phy_power_on() and udphy_dp_phy_power_on=
()
leak theudphy->apb_clk enable count or skip needed hardware re-initializati=
on?

First, sky1_udphy_init() unconditionally calls
sky1_udphy_clk_enable(udphy->apb_clk), whereas sky1_udphy_exit() only calls
clk_disable_unprepare(udphy->apb_clk) once when udphy->cur_mode reaches
UDPHY_MODE_NONE in cix_usbdp_phy_power_off(). If one child PHY is already
active (udphy->cur_mode !=3D UDPHY_MODE_NONE) and udphy->next_mode changes =
such
that cix_usbdp_phy_power_on() invokes sky1_udphy_init() a second time,
udphy->apb_clk is prepared and enabled again without a matching disable.

In addition, when udphy->next_mode =3D=3D UDPHY_MODE_DP, udphy_dp_phy_power=
_on()
overwrites udphy->cur_mode =3D UDPHY_MODE_DP instead of setting the bit with
|=3D UDPHY_MODE_DP. If UDPHY_MODE_USB was already set in udphy->cur_mode, t=
hat
bit is lost and a subsequent cix_u3phy_exit() returns early without powering
off the PHY or disabling udphy->apb_clk.

Second, cix_usbdp_phy_power_on() returns 0 without calling sky1_udphy_init()
when udphy->cur_mode =3D=3D UDPHY_MODE_DP and udphy->next_mode =3D=3D
UDPHY_MODE_DP_USB. If the PHY was initialized in 4-lane DP-only mode using
sky1_udphy_dp_conf (where PHY_PMA_LANE_MAP is 0x51D9 and no USB3 lane
registers are programmed) and then transitions to UDPHY_MODE_DP_USB, calling
cix_u3phy_init() skips sky1_udphy_init() and leaves the USB3 lanes
unconfigured.

Similarly, udphy_orien_sw_set() updates udphy->flip without updating
udphy->usbphy_syscon or forcing re-initialization, so if udphy->flip changes
while cix_usbdp_phy_power_on() takes one of the early return paths, the
syscon orientation bit and PMA lane configuration remain in the previous
orientation.

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

[Severity: High]
What happens in udphy_dp_phy_verify_config() when a DisplayPort consumer
calls phy_configure() with dp->lanes =3D=3D 4 while the PHY is in 2-lane co=
mbo
mode (UDPHY_MODE_DP_USB), or calls phy_configure() with dp->set_lanes =3D=
=3D 0?

Because udphy_dp_phy_verify_config() does not check that dp->lanes is within
udphy_dplane_get(udphy), passing dp->lanes =3D=3D 4 while in UDPHY_MODE_DP_=
USB
is accepted and causes udphy_dp_phy_set_rate() and
udphy_dp_phy_set_voltages() to overwrite the PMA registers for all 4 lanes,
clobbering the 2 lanes assigned to USB3.

Also, struct phy_configure_opts_dp gates lane reconfiguration on
dp->set_lanes, so callers updating only link rate or voltage levels with
dp->set_lanes =3D=3D 0 may leave dp->lanes unset and fail this check with
-EINVAL.

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
Should udphy_dp_phy_set_rate() match dp->link_rate against link rates in Mb=
/s
(1620, 2700, 5400, 8100) rather than raw DPCD link bandwidth codes (0x6,
0xa, 0x14, 0x1e)?

In include/linux/phy/phy-dp.h, struct phy_configure_opts_dp specifies
link_rate in Mb/s. Standard DisplayPort controller drivers passing 1620,
2700, 5400, or 8100 Mb/s will hit the default case and fail with -EINVAL.

Additionally, because udphy_dp_phy_verify_config() does not validate
dp->link_rate before udphy_dp_phy_set_rate() clears BIT(1) in
PHY_PMA_PLL_CTRL, returning -EINVAL here (or on a regmap_multi_reg_write()
failure) leaves PLL1 disabled in hardware.

[ ... ]

> +static int udphy_dp_phy_set_voltages(struct cix_udphy *udphy,
> +				     struct phy_configure_opts_dp *dp)
> +{
> +	u32 index =3D dp->voltage[0] * 4 + dp->pre[0];
> +	const struct phy_voltage_conf *cfg =3D volt_cfg;

[Severity: High]
Why does udphy_dp_phy_set_voltages() compute index only from dp->voltage[0]
and dp->pre[0] and apply it to all lanes?

In udphy_dp_phy_verify_config(), dp->voltage[i] and dp->pre[i] are validated
for each lane i up to dp->lanes, but udphy_dp_phy_set_voltages() ignores
dp->voltage[1..3] and dp->pre[1..3] and programs lane 0's swing and
pre-emphasis settings into every active lane in the 2-lane and 4-lane cases.

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
Can udphy_dp_phy_configure() access PHY MMIO registers while udphy->apb_clk
is disabled and udphy->preset is asserted?

In cix_udphy_probe() and sky1_udphy_exit(), udphy->reset and udphy->preset
are asserted and udphy->apb_clk is disabled. If udphy_dp_phy_power_on() is
called when UDPHY_MODE_DP is not set in udphy->next_mode (for example, when
usbdp_typec_mux_set() sets udphy->next_mode =3D UDPHY_MODE_USB for
TYPEC_STATE_SAFE or USB-only mode), udphy_dp_phy_power_on() returns 0 witho=
ut
enabling udphy->apb_clk or deasserting udphy->preset.

If the DisplayPort controller then calls phy_configure() (or calls
phy_configure() before phy_power_on()), udphy_dp_phy_configure() does not
check whether udphy->cur_mode & UDPHY_MODE_DP is active before accessing
udphy->phy_regmap in udphy_dp_phy_set_rate() and udphy_dp_phy_set_voltages(=
).

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
Is it intentional that cix_u3phy_ops defines .exit =3D cix_u3phy_exit witho=
ut
.init, .power_on, or .power_off, and instead wires cix_u3phy_init() and
cix_u3phy_exit() into .set_mode?

Standard USB controller drivers (such as cdns3, dwc3, and xhci-plat) manage
the PHY lifecycle through phy_init(), phy_power_on(), phy_power_off(), and
phy_exit(). During system resume (for example in cdns3_controller_resume()),
calling phy_exit() followed by phy_init() and phy_power_on() without calling
phy_set_mode() will run cix_u3phy_exit() and leave the USB3 PHY powered off
because .init and .power_on are NULL.

[ ... ]

> +static void udphy_set_default_mode(struct cix_udphy *udphy)
> +{
> +	udphy->cur_mode =3D UDPHY_MODE_NONE;
> +}
> +
> +static int cix_udphy_probe(struct platform_device *pdev)
> +{

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

However, cix_udphy_probe() unconditionally asserts both udphy->reset and
udphy->preset, and udphy_set_default_mode() sets udphy->cur_mode =3D
UDPHY_MODE_NONE, so the first call to cix_usbdp_phy_power_on() will always
re-initialize the PHY. Does the probe path or commit message need to be
updated to match the intended bootloader handover behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102082112.2306=
326-1-gary.yang@cixtech.com?part=3D2
