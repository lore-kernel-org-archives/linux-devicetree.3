Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75182390616
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650508; cv=none; b=h5o2KRUmjiJ234+J3pnupiWz3M9mQExlIDFQT0CLOKdXEcQKoxODcvMDIy6RA41B6cBb4BbOlCs4WaZifekgiyTbxUrQ+sUnhSg6M4xnMgP62X9zZ7/VGoUACIxQgMwiCuG0j45kWCIZTeqripK0ipehltPveGQ/UiGKumZgsYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650508; c=relaxed/simple;
	bh=m5Nx4HpcEeh1slTnHhYaP0H8wCSUulfRhhMs42YVixQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cl77BrbJjUx4X1us6DV9/0vrCmurpGA9t7Jga+8kaCzYqTAvzw/cJjSkOgyAGurwyJ9v1TWSCcZlLKes5PDnnwza/CwTVBy/9lNCnJ5xp7hRMrrjvLU0OiDteaWSdctxzCxcp0dmVELd9WdIU0+jLqxnb48jUFpQwMZI7mUpujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOiEuSWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOiEuSWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EE1C2BCB7;
	Wed, 13 May 2026 05:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778650508;
	bh=m5Nx4HpcEeh1slTnHhYaP0H8wCSUulfRhhMs42YVixQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bOiEuSWIAEMkgU5/s8mHAMDtQ/nBlho/ilJtiVJC7TcwC2NmMyZlIO3PS3A8deFqI
	 pWlwT6Sk3KsMzecNmXk1OMYMwTSSFxIVdg0GMSOzabC5C5h2xxPifdzKWiN+q3gE1b
	 P8Ngj6osfgckW2NTPC7wxZxJj7ShGNFxg2Z+Tpf5Y4DhJORiVo9HFWRZ/8kWVirlnA
	 MQAHbv84tZN9xAXnLL9l3n86Trvfllpx+i871X/4RfPlF/TXMKQBY04nYlwMqtFMeI
	 XoW/saTuHWowVvrOJf0gsjnRQU+iDHTzakLCT8INcI6jarWC1CJ1bdS4/HY2vrZoXE
	 OVymI/pcU+ajQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-add-airoha-an8801-support-v3-5-1edb34e363ae@collabora.com>
References: <20260512-add-airoha-an8801-support-v3-5-1edb34e363ae@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:35:07 +0000
Message-Id: <20260513053507.81EE1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Race condition and early return in PHY interrupt handler causes pe=
rmanently lost interrupts and stalled link state.
- [High] Uninitialized variable `ret` returned from `an8801r_of_init_leds()=
` can cause random probe failures.
- [Medium] LED blink duration calculation overflows `phy_write_mmd` 16-bit =
value, breaking hardware blink cycle.
- [Medium] Silent acceptance of unsupported LED triggers violates PHY LED o=
ffload API contract.
- [Medium] Link change interrupts are incorrectly left enabled during suspe=
nd if system wakeup is disabled.
--

commit 95666fa3cde2e5306e8a143ecfdca2c9d58dbf2d
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

net: phy: Introduce Airoha AN8801/R Gigabit Ethernet PHY driver

Introduce a driver for the Airoha AN8801R Series Gigabit Ethernet PHY.
This supports setting up PHY LEDs, 10/100M, 1000M speeds, Wake on LAN
and PHY interrupts.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> new file mode 100644
> index 0000000000000..a0f164cbf92bc
> --- /dev/null
> +++ b/drivers/net/phy/air_an8801.c
[ ... ]
> +static int an8801r_led_blink_set(struct phy_device *phydev, u8 index,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
> +	u32 hw_delay_on, hw_delay_off;
> +	bool blink;
> +	int ret;
[ ... ]
> +	if (blink) {
> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_BLINK_DUR,
> +				    hw_delay_on + hw_delay_off);

Is it possible for the sum of hw_delay_on and hw_delay_off to overflow here?

Looking at an8801r_led_blink_ms_to_hw(), the delays can be up to 65521.
If their sum is greater than 65535, it will be silently truncated since
phy_write_mmd() takes a u16 for the value argument.=20

Because LED_ON_DUR is then written as the non-truncated hw_delay_on, could
this result in the ON duration exceeding the total blink period and breaking
the hardware blink cycle?

> +		if (ret)
> +			goto error;
> +
> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_ON_DUR,
> +				    hw_delay_on);
> +		if (ret)
> +			goto error;
> +	}
[ ... ]
> +static int an8801r_led_trig_to_hw(unsigned long rules, u16 *on, u16 *bli=
nk)
> +{
[ ... ]
> +	if (test_bit(TRIGGER_NETDEV_TX, &rules)) {
> +		*blink |=3D LED_BLINK_EVT_10M_TX;
> +		*blink |=3D LED_BLINK_EVT_100M_TX;
> +		*blink |=3D LED_BLINK_EVT_1000M_TX;
> +	}
> +
> +	if (test_bit(TRIGGER_NETDEV_RX_ERR, &rules))
> +		*blink |=3D LED_BLINK_EVT_RX_CRC_ERR;
> +
> +	if (rules && !*on && !*blink)
> +		return -EOPNOTSUPP;

Does this correctly reject unsupported LED triggers when mixed with support=
ed
ones?

If the requested rules contain a combination of supported triggers and
unsupported triggers, *on or *blink will be non-zero. The condition will
evaluate to false and the function will return 0.=20

Does this silently drop the unsupported portion of the rules while falsely
reporting to the LED subsystem that the entire offload combination is
supported?

> +
> +	return 0;
> +}
[ ... ]
> +static int an8801r_of_init_leds(struct phy_device *phydev, u8 *led_cfg)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *leds;
> +	u32 function_enum_idx;
> +	int ret;
> +
> +	if (!np)
> +		return 0;
> +
> +	/* If devicetree is present, leds configuration is required */
> +	leds =3D of_get_child_by_name(np, "leds");
> +	if (!leds)
> +		return 0;
> +
> +	for_each_available_child_of_node_scoped(leds, led) {
> +		u32 led_idx;
> +
> +		ret =3D of_property_read_u32(led, "reg", &led_idx);
[ ... ]
> +		led_cfg[led_idx] =3D function_enum_idx;
> +	}
> +out:
> +	of_node_put(leds);
> +	return ret;

Can ret be returned uninitialized here?

If a leds node exists in the device tree but has no available children, the
for_each_available_child_of_node_scoped loop body will never be executed.

The function would then jump to the out label and return the uninitialized
stack value of ret, which could cause random probe failures.

> +}
[ ... ]
> +static irqreturn_t an8801r_handle_interrupt(struct phy_device *phydev)
> +{
> +	u32 irq_status =3D 0;
> +	int ret;
> +
> +	ret =3D an8801_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKE_IRQ_STS,
> +				       &irq_status);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret =3D an8801r_ack_interrupt(phydev);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (irq_status & AN8801_IRQ_WAKE_MAGICPKT) {
> +		pm_wakeup_event(&phydev->mdio.dev, 0);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (irq_status & AN8801_IRQ_WAKE_LNKCHG) {
> +		phy_trigger_machine(phydev);
> +		return IRQ_HANDLED;
> +	}

Can this lead to permanently lost link change interrupts?

The an8801r_ack_interrupt() function unconditionally writes
AN8801_IRQ_WAKE_ALL to clear all pending PHY interrupts in hardware.

If irq_status has both AN8801_IRQ_WAKE_MAGICPKT and AN8801_IRQ_WAKE_LNKCHG
set, the function returns IRQ_HANDLED early for the magic packet.

Since the link change event would be skipped here but was already globally
cleared in hardware, it seems phy_trigger_machine() will never run,
potentially stalling the PHY link state.

> +
> +	return IRQ_NONE;
> +}
[ ... ]
> +static int an8801r_suspend(struct phy_device *phydev)
> +{
> +	struct an8801r_priv *priv =3D phydev->priv;
> +	int ret;
> +
> +	/* If the PHY may wake up by a wake-on-line event, disable the link
> +	 * interrupt to only keep the  WOL magic interrupt enabled
> +	 */
> +	if (device_may_wakeup(&phydev->mdio.dev)) {
> +		priv->wake_lnkchg_enabled =3D false;
> +
> +		if (phydev->interrupts =3D=3D PHY_INTERRUPT_ENABLED) {
> +			ret =3D an8801_buckpbus_reg_clear_bits(phydev,
> +							     AN8801_BPBUS_REG_WAKE_IRQ_EN,
> +							     AN8801_IRQ_WAKE_LNKCHG);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		/* Reset Wol status */
> +		ret =3D an8801r_reset_wake(phydev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!phydev->wol_enabled)
> +		return genphy_suspend(phydev);

Are link change interrupts incorrectly left enabled during suspend if system
wakeup is disabled?

If wake-on-LAN is enabled via ethtool (wol_enabled is true) but system
wakeup is disabled via sysfs (device_may_wakeup is false), the block
disabling the LNKCHG interrupt is skipped. Since wol_enabled is true,
genphy_suspend is also skipped.

Will this leave the PHY awake with the link change interrupt remaining
active, potentially causing spurious IRQs or interrupt storms if the link
changes while the system is suspending?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-add-airoha=
-an8801-support-v3-0-1edb34e363ae@collabora.com?part=3D5
