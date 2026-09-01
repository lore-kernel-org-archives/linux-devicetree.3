Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE4371076
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299821; cv=none; b=uUdBWpaZ5Ap5mcg53jJyPhaw9qfOThxOppkHcWULVqAtRGHmO3xIlI3ExMUJui642c7GIGa+IBeSOHo6VpE4oUNCkkJ4SLsdc898eFNv2Ti+tpojfA1/EhU02kNaga4BvNi0maIyL6TEdS4hEPpeF8eYPFy0EXAaZaWPSlU7X7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299821; c=relaxed/simple;
	bh=R5/D4KV1cX/e5wYPuqFVDLgFfncAOWu74yFSl7LCh1M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rxPwlk3ehgnlN66AGV84RyD1o/wNQjfRckgFKPYHtJTvi64GevS3gExHDrOr98pmf2UwplRhXkHI2BSBls99a8NFoQMGXWaxN/sFFT94qVofuuB6iZSui/qsvom8v5MosPWvErXAh92YzEBsEEXZ7pF90M/cBZi8Oq30SrfIbgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOfSyCQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOfSyCQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265961F000E9;
	Tue,  1 Sep 2026 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299819;
	bh=oO/xMlvpwQaDyExTK1D6rmaU8JpqebRxg+7yePZ0ixk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HOfSyCQ3MEoq0Yo3l6RiSU+VxpTFpAXIWXERSDURo9/hojcylgZYIibS+OiVd56sl
	 plKYvsDhVpr2cA6BC6uQ8XdYBh8Xs1tQju/q0MHivN2beqoMew2g0rCmAx9xIays4p
	 pGI5BWGEJXhpt2RZGL3msK6q7834loOftyO0Qy/nqqamCGtGIlqjj/qFz6+warBZb2
	 4N7wdP+VgRaUvRKGbGg7oMYSmicUc6l/05ULOSeYJeoYc4MpayZ166LxS6592IebJv
	 lOtapwxNTPcjvjuLBylkye6xY/geWKL+vEjtY6JsOMz2l413Ez9+rfEvprFRrelmKG
	 F8/lCy5afeaQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm: dts: omap: Add support for BeagleBone Black
 RevD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Nelson" <robertcnelson@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-2-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
 <20260901-v7-3-rc1-beaglebone-black-revd-v1-2-f521950b777a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:56:58 +0000
Message-Id: <20260901215659.265961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardware/Driver mismatch: The BeagleBone Black physically routes 1=
6-bit video data, but the DT and bridge driver are configured for a 24-bit =
bus, leading to severely corrupted video output.
- [Medium] The IT66122 bridge interrupt is incorrectly configured as edge-f=
alling instead of level-low, which can lead to missed interrupts.
- [Medium] The board compatible string is missing standard fallback identif=
iers, breaking userspace board detection.
- [Low] The new board compatible string 'beagle,am335x-bone-black-revd' is =
not documented in the Devicetree bindings.
- [Low] Stale gpio-line-names entry masks the HDMI reset pin (GPIO1_9) as '=
NC' (Not Connected).
- [Low] The lcdc endpoint node uses a unit address without a matching reg p=
roperty, causing dtc warnings.
- [Low] A stale comment incorrectly references the removed TDA19988 HDMI fr=
amer node.
--

commit d7b1924005badde2a155d4ba4a4cb12a5f9be451
Author: Robert Nelson <robertcnelson@gmail.com>

arm: dts: omap: Add support for BeagleBone Black RevD

The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI PHY =
to
replace the EOL NXP TDA19988. Additionally, these models include a larger e=
MMC
capacity to address the limited availability of 4GB modules.

> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-ite-hdmi.dtsi b/a=
rch/arm/boot/dts/ti/omap/am335x-boneblack-ite-hdmi.dtsi
> new file mode 100644
> index 0000000000000..77dd7d9aa57d9
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-ite-hdmi.dtsi
> @@ -0,0 +1,184 @@

[ ... ]

> +&lcdc {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&nxp_hdmi_bonelt_pins>;
> +
> +	/* If you want to get 24 bit RGB and 16 BGR mode instead of
> +	 * current 16 bit RGB and 24 BGR modes, set the propety
> +	 * below to "crossed" and uncomment the video-ports -property
> +	 * in tda19988 node.
> +	 */

[Severity: Low]
Is this comment still accurate? The comment instructs to uncomment a proper=
ty
in the tda19988 node, but the Rev D board replaced this chip with the IT661=
22.

> +	blue-and-red-wiring =3D "straight";
> +
> +	port {
> +		lcdc_0: endpoint@0 {

[Severity: Low]
Does this node need a matching reg property? The node uses a unit address
(endpoint@0) but lacks a corresponding reg =3D <0>; property, which can
trigger devicetree compiler unit_address_vs_reg warnings.

> +			remote-endpoint =3D <&it66122_in>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	it66122: bridge-hdmi@4c {
> +		compatible =3D "ite,it66122";
> +		reg =3D <0x4c>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hdmi_gpio_pins_default>;
> +		vcn33-supply =3D <&vmmcsd_fixed>;
> +		vcn18-supply =3D <&it66122_vcn18_fixed>;
> +		vrf12-supply =3D <&it66122_vcn12_fixed>;
> +		reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
Should this interrupt trigger type be level-low instead of edge-falling?

I2C bridge chips like the IT66122 use active-low, open-drain interrupts.
If configured as edge-falling, a second interrupt condition occurring while
the line is already low won't generate a new falling edge. Because the kern=
el
uses a threaded interrupt handler for this device, this can race with the
clearing of the first event and lead to missed interrupts.

> +		#sound-dai-cells =3D <0>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				it66122_in: endpoint {
> +					bus-width =3D <24>;

[Severity: High]
Does this bus-width configuration mismatch the physical hardware?

The BeagleBone Black routes only 16 LCD data pins (LCD_DATA0 to LCD_DATA15)
for the display, as pins 16-23 are reserved for eMMC. This can be seen in
the pinmux setup in nxp_hdmi_bonelt_pins.

However, configuring the IT66122 endpoint for a 24-bit bus causes the
bridge driver to request a 24-bit input format. The bridge will then read
floating or eMMC data on its upper 8 bits, which leads to severely corrupted
video output on HDMI.

> +					remote-endpoint =3D <&lcdc_0>;
> +				};
> +			};

[ ... ]

> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dts b/arch/a=
rm/boot/dts/ti/omap/am335x-boneblack-revd.dts
> new file mode 100644
> index 0000000000000..fe9536d5f55ea
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dts
> @@ -0,0 +1,166 @@

[ ... ]

> +/ {
> +	model =3D "TI AM335x BeagleBone Black Rev D";
> +	compatible =3D "beagle,am335x-bone-black-revd", "ti,am33xx";

[Severity: Medium]
Are the standard BeagleBone fallback identifiers intentionally omitted?

This compatible string omits standard fallbacks like "ti,am335x-bone-black"
and "ti,am335x-bone" used by all other variants. Without them, existing
userspace tools, cape managers, and distributions will fail to detect the
board and apply BeagleBone-specific quirks.

[Severity: Low]
Also, has the new board compatible string "beagle,am335x-bone-black-revd"
been documented in the Devicetree bindings? Omitting it from the bindings
will produce validation warnings during devicetree checks.

> +};
> +
> +&gpio0 {

[ ... ]

> +&gpio1 {
> +	gpio-line-names =3D
> +		"P8_25 [mmc1_dat0]",
> +		"[mmc1_dat1]",
> +		"P8_5 [mmc1_dat2]",
> +		"P8_6 [mmc1_dat3]",
> +		"P8_23 [mmc1_dat4]",
> +		"P8_22 [mmc1_dat5]",
> +		"P8_3 [mmc1_dat6]",
> +		"P8_4 [mmc1_dat7]",
> +		"NC",
> +		"NC",

[Severity: Low]
Is this "NC" label accurate for GPIO1_9?

The am335x-boneblack-ite-hdmi.dtsi file routes the IT66122 bridge's
active-low reset to GPIO1_9. Retaining the old "NC" (Not Connected)
label masks the HDMI reset pin from userspace tools like libgpiod.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-v7-3-rc1-b=
eaglebone-black-revd-v1-0-f521950b777a@gmail.com?part=3D2
