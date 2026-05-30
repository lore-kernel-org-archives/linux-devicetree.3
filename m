Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B71D54FA
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101939; cv=none; b=R0JNvv80ZPLLx4YrhbR598TocCSHQoqOaRNfW+q5HWRy+mbXAaX8tmX1/lcsLB7hoAG9daK/s/eBSJzsFN14Hghk3AAHENNkEUjw1pFC6HqtkArzyRZFC7FKX9XdqxJ4E03W1tX5OqxPu7tyS4cPsAGIU+iR1qh7XlrsGR0neVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101939; c=relaxed/simple;
	bh=vRAaoTpQ1B9ZMdCyO/GWYb24SKyZr8PFUlH5R63mnRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U0zqCo/gM944hiH33tkVVrfLNbdgA3CKs4iSX7WKcMZFdol0MQ2fpFEE7kMS2vtvhAlofvEyUK28ANbGm/CyNFFgS9Eh06l+Eqo4mYDPkDoNslLupboeoK8GSpVPOzRq3wjZP2KRDPdlO8FYpY7CjYlR+9P1niNwYz6uvNA0fNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRWnxuxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRWnxuxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B921F00898;
	Sat, 30 May 2026 00:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101938;
	bh=JxZOkkbREw6OIuhF6yh/ItAsBc4wc0ZMX8qKHBbdp/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eRWnxuxLHqHUZMSEYlXV+mkITrpe1PSdm9QcKiprKOqtP2OnkEm+PvOzRXVGm7Qy2
	 Vh6KDiqmY1K4Ykhgcb/ewQyd6t60uMclSkuevdj2NK8a5PTXfiYS9GbMswWtgyLHco
	 tR42oVMYO8hSvcQKnkUXyjkGJdf6jaovgQtowAcz6SnLmGZxaLfEM3w0DiD13VKCWj
	 RgspaNr0RhHfvTX0WBPb9y+62ogzFJP5AQzw0tTFKH8Js8iO4pPObAt6k7acSnu55N
	 rYMQRLi1MwyxeOm8OUyZmAVspfKjfhX59E1JTyD5XTHywk/FhAZOCLG0442lG9+Uim
	 dsriDQanO6y6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: Introduce Airoha AN8801R
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-add-airoha-an8801-support-v4-5-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-5-1e4837d30ef4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:37 +0000
Message-Id: <20260530004538.28B921F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unconditional clearing of all interrupt status bits causes TOCTOU =
races and lost interrupts.
- [High] Unconditional LED GPIO initialization overwrites and breaks the PH=
Y interrupt line.
- [Medium] Setting a solid LED brightness does not clear previously active =
hardware blink events.
- [Medium] The total blink duration can overflow the 16-bit hardware regist=
er LED_BLINK_DUR.
--

commit 54d90f97d5a09b09ae8c12ef66db44dd7f252412
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

net: phy: Introduce Airoha AN8801R Gigabit Ethernet PHY driver

Introduce a driver for the Airoha AN8801R Series Gigabit Ethernet
PHY; this currently supports setting up PHY LEDs, 10/100M, 1000M
speeds, and Wake on LAN and PHY interrupts.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> new file mode 100644
> index 0000000000000..73f94e84da07f
> --- /dev/null
> +++ b/drivers/net/phy/air_an8801.c

[ ... ]

> +static int an8801r_led_blink_set(struct phy_device *phydev, u8 index,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{

[ ... ]

> +	if (delay_on && delay_off) {
> +		blink =3D true;
> +
> +		if (*delay_on =3D=3D 0 || *delay_off =3D=3D 0) {
> +			*delay_on =3D 64;
> +			*delay_off =3D 64;
> +		}
> +
> +		hw_delay_on =3D an8801r_led_blink_ms_to_hw(*delay_on);
> +		hw_delay_off =3D an8801r_led_blink_ms_to_hw(*delay_off);
> +	} else {
> +		blink =3D false;
> +	}
> +
> +	if (blink) {
> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_BLINK_DUR,
> +				    (hw_delay_on + hw_delay_off) &
> +				    LED_BLINK_DUR_MASK);

[Severity: Medium]
Could the combined hw_delay_on and hw_delay_off durations overflow the 16-b=
it
LED_BLINK_DUR register?

The an8801r_led_blink_ms_to_hw function clamps individual delay values to
2147ms (about 65521 in hardware units). However, the sum can reach roughly
131042, exceeding the 65535 limit. When truncated by LED_BLINK_DUR_MASK,
the resulting cycle duration may be smaller than the LED_ON_DUR value.
Programming an ON duration longer than the total cycle could place the
hardware in an invalid state.

> +		if (ret)
> +			goto error;
> +
> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_ON_DUR,
> +				    hw_delay_on);

[ ... ]

> +static int an8801r_led_brightness_set(struct phy_device *phydev, u8 inde=
x,
> +				      enum led_brightness value)
> +{
> +	int ret;
> +
> +	if (index >=3D AN8801R_NUM_LEDS)
> +		return -EINVAL;
> +
> +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
> +			     LED_ON_EVT_MASK,
> +			     (value =3D=3D LED_OFF) ? 0 : LED_ON_EVT_FORCE);
> +	if (ret)
> +		return ret;
> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
> +			      LED_ON_EN, (value =3D=3D LED_OFF) ? 0 : LED_ON_EN);
> +}

[Severity: Medium]
Is there a chance the LED might continue blinking if a solid brightness is
requested after a blink state?

This function configures LED_ON_CTRL but leaves the LED_BLINK_EVT_MASK bits
in LED_BLINK_CTRL unchanged. If hardware triggers or software blinking were
previously active, those blink events appear to remain set in the hardware.

[ ... ]

> +static int an8801r_led_init(struct phy_device *phydev, u8 *led_cfg)
> +{
> +	int led_id, ret;
> +
> +	/* Set LED BCR Enable */
> +	ret =3D phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, LED_BCR,
> +			       LED_BCR_EXT_CTRL | LED_BCR_CLK_EN);
> +	if (ret)
> +		return ret;
> +
> +	for (led_id =3D 0; led_id < AN8801R_NUM_LEDS; led_id++) {
> +		unsigned long led_trigger =3D 0;
> +		u32 led_gpio =3D led_id + 1;
> +
[ ... ]
> +		ret =3D an8801_buckpbus_reg_set_bits(phydev,
> +						   AN8801_BPBUS_REG_LED_GPIO,
> +						   BIT(led_gpio));

[Severity: High]
Does unconditionally configuring these GPIOs for LED usage conflict with the
PHY interrupt line?

This loop configures GPIOs 1 to 3 as LED outputs by setting the LED_GPIO
register and clearing GPIO_MODE, even if the LED is not requested in the
device tree. At the same time, an8801r_config_intr() hardcodes the PHY
interrupt to use GPIO 1. It looks like the LED initialization will override
the interrupt multiplexing and break the PHY interrupt.

> +		if (ret)
> +			return ret;
> +

[ ... ]

> +static int an8801r_ack_interrupt(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* Reset wake status */
> +	ret =3D an8801r_reset_wake(phydev);
> +	if (ret)
> +		return ret;
> +
> +	/* Clear the interrupts by writing the reg */
> +	return an8801_buckpbus_reg_write(phydev, AN8801_BPBUS_REG_WAKE_IRQ_STS,
> +					 AN8801_IRQ_WAKE_ALL);
> +}

[Severity: High]
Is it safe to unconditionally clear all interrupt bits here?

In an8801r_handle_interrupt(), the WAKE_IRQ_STS register is read into
irq_status, and then this function unconditionally clears all bits using
AN8801_IRQ_WAKE_ALL.

This can cause a race condition where an interrupt triggered right after the
read is permanently lost. Additionally, if irq_status is 0 (which can happen
on a shared interrupt line), it still clears the PHY interrupts. It might be
safer to only write back the specific bits that were read in irq_status.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-add-airoha=
-an8801-support-v4-0-1e4837d30ef4@collabora.com?part=3D5
