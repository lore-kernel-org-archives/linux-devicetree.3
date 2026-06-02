Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FF25228C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437999; cv=none; b=Dd3h7IXkGizDk//y0fpIeYwxDwV2UylczKq9WdW1v0PFG7UVBe/l0yCA2GD1Yoq6M4vBXRIVMlY11szUG916GUc7KUKslB4+bSf2ZG7RbTAJdupnwg+bUU4Qou5NAXUFiLWwDJf+oMYY6g/LxmBOjWhR5xNO5F/oAekh4X1CcTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437999; c=relaxed/simple;
	bh=sU0j/qKTGNy7mFx3pTa6I/UWYnUlQPKGcYUskhvVJf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQGWbd2M8/CqGBZuRNht//lgdJpBJHqT38+ihBtP+CNRCTOXiU+4NE/wNbTqhe6FaMKxUbvR8ZJKf/U11x9bD8Y4dZQaUMIEfooUJ+8sxnQ26zm2EkYt3IjHykNA9s4YlddINjhl26iR76sodBrST90Xqp7TYpxTsKQs4rfcp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h94dpuEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h94dpuEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA331F00893;
	Tue,  2 Jun 2026 22:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780437997;
	bh=IIRZjKPLG2j0kM34I1bzdbyjrZCMHhLGCHDAD4iOg4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h94dpuEr/xC9DbjrrRwoqxzOvLP7uRQCxFhE9VlhtzsQUqzc1N1wjk6Rb7h5RrYhg
	 jvsL42rvQ6fum37Xt0ZxjWQbGfqz1jH3mPLyJf3OuaxMwrv755vXyk/UgMjYCJLKiE
	 t2SRTXbwdrxTkGHgHqXtStFYZ/mjf2dAYS1+V1eA6OobIPwZV/OX4VHYmhr/ynHm+T
	 DKz6fkay2Ia/a5bTEWfIQpkqPuoFXhl3Z1HlOhrN9qUs2e6l/SMRke/jLqknXRTa/s
	 2K0tJSMd1QziYOEkfswjeC+BM9N4Wn6tdvQcFbWx/1t+rBwu0GOk/3iImOz9x2ndTP
	 7DXOikG3QUE8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602212512.418166-7-macroalpha82@gmail.com>
References: <20260602212512.418166-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 22:06:37 +0000
Message-Id: <20260602220637.8FA331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware Description Mismatch for Bluetooth Controller
- [Medium] Incomplete Device Tree description for SPI Joysticks
- [Medium] Contradictory Suspend States for PMIC Regulators
--

commit 79a0a3133515f64c6cd7697921d2b225d5dc8aa8
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This commit adds the device tree for the Anbernic RG Vita-Pro handset,
based on the Rockchip RK3576 SoC. It includes initial hardware descriptions
for the display, audio, buttons, networking, and power management.

>  - RTL8852BE WiFi/Bluetooth combo

[Severity: High]
The commit message mentions an RTL8852BE combo chip, but the device tree
configures the Bluetooth controller using the realtek,rtl8822cs-bt compatib=
le
over a UART bus below.

Is this compatible string correct for this hardware? The RTL8852BE typically
interfaces its Bluetooth module via USB rather than UART. If the hardware is
indeed RTL8822CS, should the commit message be updated to reflect the corre=
ct
chipset?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> index 0000000000000..344ba18705338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> @@ -0,0 +1,1327 @@

[ ... ]

> +			vdd_cpu_lit_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-name =3D "vdd_cpu_lit_s0";
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;
> +				};
> +			};

[Severity: Medium]
Is it intentional to set both regulator-off-in-suspend and
regulator-suspend-microvolt here?

These properties appear to contradict each other, as turning the regulator =
off
would make the target suspend voltage meaningless. Would it be better to use
regulator-on-in-suspend if the voltage needs to be maintained during sleep?

[ ... ]

> +			vdd_gpu_s0: dcdc-reg5 {
> +				regulator-boot-on;
> +				regulator-enable-ramp-delay =3D <400>;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <900000>;
> +				regulator-name =3D "vdd_gpu_s0";
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <850000>;
> +				};
> +			};

[Severity: Medium]
Does this GPU regulator have the same contradictory suspend state issue as
vdd_cpu_lit_s0 above?

[ ... ]

> +&spi1 {
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi1m2_pins>, <&spi1m2_csn0>;
> +	status =3D "okay";
> +
> +	/* SPI controlled MCU for joystick and joystick LEDs. */
> +};

[Severity: Medium]
The commit message notes the analog joysticks are controlled via userspace.
Since there is no child node defined on this SPI bus, how does the kernel
instantiate the userspace interface?

Should there be a spidev node or another specific child device defined here
to allow userspace to communicate with the MCU?

[ ... ]

> +&uart6 {
> +	pinctrl-0 =3D <&uart6m1_xfer>, <&uart6m1_ctsn>, <&uart6m1_rtsn>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "realtek,rtl8822cs-bt";
> +		device-wake-gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		enable-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios =3D <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&bt_reset_gpio>, <&bt_wake_gpio>, <&bt_wake_host_irq>;
> +		pinctrl-names =3D "default";
> +	};
> +};

[Severity: High]
This is the UART bus configuration mentioned earlier where the bluetooth
controller is defined. Could you clarify if the RTL8852BE mentioned in the
commit message is accurate, or if this rtl8822cs-bt compatible string is
the correct hardware description?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602212512.4181=
66-1-macroalpha82@gmail.com?part=3D6
