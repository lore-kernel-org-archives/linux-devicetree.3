Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E648424E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 22:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374030; cv=none; b=r1bkQxFGhonwWXsPtzrJfm/kPXKGvtk1vz98D60FCJ4bqiPyJfv0uIKUmGBse0aPRRaLwpdnMupJbXYfIK/qKgtzXWn/Q0aoSiRXZb/dUzgZfE+4ZFZ2z4VmEtwZmz33ZXPCRrmHKYrst2yR/lAcro2GAWcu0N7LKxNgtLIsNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374030; c=relaxed/simple;
	bh=4d3/MaTCZmuolgXwPQWgJgaPtm7d0v4kyZtx638GHHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IjVQEV4btK9UtJZNMBIkT1FLKTKdVfWmx/Kh9frPvESmcsYzrJTBtpzyoGizp/VRywzI1+dilm12TU9CXSfTaCk2SAZv6sk4y0U7EmZahUbsGS9lXc/rwS0W2FZ7Hd0Ve8OQwaVVOcsmGYFbI1E0ZKcjXS5e3OTYTnuZ7rwhUNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXjl2Bkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXjl2Bkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CD91F000FF;
	Fri, 25 Sep 2026 22:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374028;
	bh=UGfboVPi/cFBWYqs6ChCusbvKm9xXUHA4+7XYYroM0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mXjl2Bkxtl5q7lK9yrsN4AfOe45VfO0SRCnI6JrfQ7EZy4EmSJWiA39x05O8foJEg
	 eTXqpVGBKK8R7webrMlJZrMRx8YnJlTqbOsftagywlDzMdE4jOqxjv4q+y3fgznJXZ
	 5JDPYN54OItq137a6JcDw6VZmd+i9+UaPzorjkMymlbbM7kSJp/OPu4j+biYDbxmzc
	 6pliv75HEfMvTZsmNjwjeoUtgSmwzDHF8rAVQtcjiDSTZx/ARHLCF3Yngj2jfCguji
	 Og9Zi8PzHDoseKaKC2uKbOQjckrJD6etrRkKtDLbA1lfJlarJwA8zyQwXp2bvBqZ8I
	 Z1cub0oR59FUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: Clover <alex@ironrobin.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260925215358.33417-4-alex@ironrobin.net>
References: <20260925215358.33417-1-alex@ironrobin.net>
 <20260925215358.33417-4-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 22:07:08 +0000
Message-Id: <20260925220708.97CD91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dts: missing pinctrl configuration for i2c8 bus
- [Low] dts: i2c8 node is inserted out of numerical order
- [Low] dts: pinctrl nodes in tlmm are out of alphabetical order
--

commit e4a47547cc8af70376ce1a7b8590d0f5c4ae2ab8
Author: Clover <alex@ironrobin.net>

arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

This commit enables the embedded controller at address 0x28 on the i2c8 bus
for the Lenovo ThinkPad X13s. It configures the falling-edge event interrupt
on GPIO103 and the active-high power-state output on GPIO176.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 218573a97785b..e0eb415ef9b42 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
[ ... ]
> @@ -885,6 +885,21 @@ vreg_l7q: ldo7 {
>  	};
>  };
> =20
> +&i2c8 {

[Severity: Low]
Does this i2c8 node violate the standard convention of sorting referenced
bus nodes numerically? It appears to be inserted after &i2c11 and before
&i2c21.

> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

[Severity: Medium]
Will enabling the &i2c8 bus without specifying pinctrl-names and pinctrl-0
cause silent I2C communication failures? It looks like omitting explicit
multiplexing for the SDA and SCL pins means the bus will rely on bootloader
leftover state, which is fragile if the pins are reset or misconfigured by
power management.

> +
> +	embedded-controller@28 {
[ ... ]
> @@ -1540,6 +1555,21 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>  	gpio-reserved-ranges =3D <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;
> =20
> +	ec_power_state: ec-power-state {

[Severity: Low]
Are the ec_power_state and ec_int_n child nodes inserted out of alphabetical
order within the &tlmm block? They are placed at the top before bt_default,
and ec_power_state is placed before ec_int_n.

> +		pins =3D "gpio176";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;


I also noticed a few issues in the corresponding platform driver code in
drivers/platform/arm64/lenovo-thinkpad-x13s.c:

drivers/platform/arm64/lenovo-thinkpad-x13s.c:x13s_probe() {
	...
	ec->power_state =3D devm_gpiod_get(dev, "power-state", GPIOD_OUT_HIGH);
	if (IS_ERR(ec->power_state))
		return dev_err_probe(dev, PTR_ERR(ec->power_state),
				     "Failed to acquire power-state GPIO high\n");

	ec->led.name =3D "platform::kbd_backlight";
	ec->led.max_brightness =3D 2;
	ec->led.flags =3D LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
	ec->led.brightness_get =3D x13s_brightness_get;
	ec->led.brightness_set_blocking =3D x13s_brightness_set;
	ret =3D devm_led_classdev_register(dev, &ec->led);
	...
}

[Severity: Medium]
This is a pre-existing issue, but does x13s_probe() skip the mandatory 10ms
settling delay and the 0xaa I2C exit command after driving the power-state
GPIO high? It looks like devm_led_classdev_register() synchronously queries
the backlight state over I2C immediately after, which could fail or timeout
if the EC is still in a low-power state.

drivers/platform/arm64/lenovo-thinkpad-x13s.c:x13s_suspend() {
	...
	/* Capture hardware state before firmware can reset the backlight. */
	ret =3D x13s_brightness(ec);
	if (ret < 0) {
		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
		goto out;
	}
	...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does returning this
non-critical I2C read failure unconditionally abort the entire system suspe=
nd?
If a transient bus error occurs while reading the keyboard backlight
brightness, the power management core will abort the transition and the
laptop will fail to sleep.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925215358.3341=
7-1-alex@ironrobin.net?part=3D3
