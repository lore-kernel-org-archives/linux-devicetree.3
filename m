Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1C334681
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 23:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782601702; cv=none; b=iHG+rvoWZCK4bRJGZfUQpPBP2fhDeZTb/bSArY4AtSLX6kzOaocUTsOK9o1uRLF0wFnPm4h8U9F2Xgvp7OfRZ4yAaGHeqvA0FdNOYB/0+bpZvNWipU/kVuQrbMyrUKF1H4OSCUWHf4aM7tDVfkfn6HNpyf0uggOp/PYU5F64vak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782601702; c=relaxed/simple;
	bh=bYQjAsH2p6L64KkEBBwrlucAnzDGDEYqkuDyR4Z3P+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7/8UTwsrzdyD7bJzdSydnRdcpGQeNnKgyxuu6qJZq3/IUzQ+AVABxYlB4V7l7Odk3yPumP1SA0OqTJCPbkru5IdV7Lf9LvPuTJhf3MEo/yPwx1pLlkq7k+5K7gXtnH0cc0/Nd0iwsROIVu4gikd0ppikMSjC8w2n0yYmXH7thA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYNwfnfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYNwfnfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6AA1F000E9;
	Sat, 27 Jun 2026 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782601700;
	bh=fYIjqcyrqNfiBrJWD68tl3GQOzFbK7JvWYTITHTo0f8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lYNwfnfDCzZIc6HQkaG7EtTv9QN4JMfmIBUnsEb9Bvbd2/4tqVaukOjJoIzaSs+/Q
	 F5OKp5c3ymnEOJxAeDA9nGMsJhcSqxJQg5A1eB5CkiDJ7q0RFQL6zrwB11mXR5rn4b
	 QtAAXjkYeCDEV5Tj35obuFKyMqf8AOVJP6hTrditAl6+AnSb3eHSPfWof8KEcCAmhf
	 Ndb6G9mvWzoSTshxB7s3f5hLh34RewGMD3BRzu7AiHntj/Kej6x8ZOTZfWt0iMqgkm
	 5JjFrCRgBqWyHqQdbl402yEkm7j5Zdl1eTlViIuqyQVWFLKOOvU+wlz5QQ3idUefCm
	 DrqINBaBEYVTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260627225755.1710837-6-coiaprant@gmail.com>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
 <20260627225755.1710837-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 23:08:20 +0000
Message-Id: <20260627230820.8C6AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Incorrect `press-threshold-microvolt` values in `adc-keys` use b=
oundary midpoints instead of nominal voltages, causing the MENU button to m=
isregister as ESC.
- [Medium] The WiFi SDIO interface specifies `keep-power-in-suspend`, but i=
ts I/O voltage supply (`vcc_1v8`) is configured to turn off in suspend, bre=
aking Wake-on-WLAN.
- [Medium] The AP6356S Bluetooth UART is missing hardware flow control prop=
erties and the required Bluetooth child node.
- [Low] The deprecated `gpio` property is used instead of `gpios` in fixed =
regulator nodes.
--

commit 13181564cb78799e1d57eb0995588d8e839f22a5
Author: Coia Prant <coiaprant@gmail.com>
arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

This patch introduces the device tree for the Graperain G3568 v2, an RK3568
based development board. It configures the hardware peripherals including
ethernet, storage, wireless, and power regulators.

Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6dadd=
ec9e400458816dd4c57ba807fc3.pdf
Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-fla=
sh.html

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b=
/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> new file mode 100644
> index 0000000000000..221992d6c6003
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> @@ -0,0 +1,894 @@

[ ... ]

> +	adc-keys {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 0>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <1800000>;
> +		poll-interval =3D <100>;
> +
> +		button-esc {
> +			label =3D "esc";
> +			linux,code =3D <KEY_ESC>;
> +			press-threshold-microvolt =3D <1250000>;
> +		};
> +
> +		button-menu {
> +			label =3D "menu";
> +			linux,code =3D <KEY_MENU>;
> +			press-threshold-microvolt =3D <1600000>;

[Severity: Medium]
Will this cause the menu button to misregister as esc?

The adc-keys driver uses a nearest-neighbor algorithm to match the ADC
reading to the button. Since the commit message indicates the nominal
voltages are 1.1V for ESC and 1.4V for MENU, an ADC reading of 1.4V from
pressing MENU is closer to the ESC threshold of 1.25V (0.15V difference)
than the MENU threshold of 1.6V (0.2V difference).

Could we use the exact expected nominal voltages here instead of the
boundary midpoints?

[ ... ]

> +	vcc5v0_usb_host: regulator-vcc5v0-usb-host {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Is this using the deprecated gpio property?=20

The standard regulator-fixed binding expects gpios instead of gpio, which
can cause device tree schema validation warnings.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc5v0_usb_host_en>;
> +		regulator-name =3D "vcc5v0_usb_host";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc5v0_usb>;
> +	};
> +
> +	vcc5v0_usb_otg: regulator-vcc5v0-usb-otg {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Would it be better to use the gpios property here as well to match the
regulator-fixed device tree binding schema?

[ ... ]

> +/* used for AP6356S WiFi */
> +&sdmmc2 {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	non-removable;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc3v3_sys>;
> +	vqmmc-supply =3D <&vcc_1v8>;

[Severity: Medium]
Will this configuration break Wake-on-WLAN and SDIO communication on resume?

This node specifies keep-power-in-suspend, but the vqmmc-supply is set to
vcc_1v8. Looking at the vcc_1v8 regulator definition (DCDC_REG5) earlier in
the file, it is configured with regulator-off-in-suspend.

Cutting power to the SDIO I/O domain during suspend violates the power
sequencing for keep-power-in-suspend and prevents out-of-band wake interrup=
ts
from signaling the host.

[ ... ]

> +/* used for WiFi/BT AP6356S */
> +&uart8 {
> +	pinctrl-0 =3D <&uart8m0_xfer &uart8m0_ctsn>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Does this Bluetooth UART configuration need hardware flow control and a
device child node?

High-speed Bluetooth modules like the AP6356S generally rely on RTS/CTS to
prevent buffer overflows, but the uart-has-rtscts property and the
uart8m0_rtsn pin configuration are missing here.

Additionally, without a bluetooth child node (such as compatible =3D
"brcm,bcm4345c5"), the kernel's HCI UART driver might not be able to probe
and initialize the module automatically.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627225755.1710=
837-2-coiaprant@gmail.com?part=3D3
