Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8E175A80
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781979115; cv=none; b=DVtBJda4IqmCmvjTGh1PiZaPLR75LHqi9BMh6uk3Ew1V77pgwLqdDpg4fo4iGAunxEak4NrI/wWVx2WgschTv5Ts79iolKIYnhRmm0V0s+TWeyLqvkZtqI/FAtzDrLGj306EZOo3LxHxDLl4jI40DdgSUSvQQWS7g/VzZGZIvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781979115; c=relaxed/simple;
	bh=XfxcKTRVsyVzNykx5duP9hxSYvdoF0joiSMoF9atB+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXD3hS2u1nWGzUCoKfzrTDFSkPk9QPd6plP9zpnX1JtsQxlNJRHMUskL+jKTjdmns+mF1dxfWK3mmoxr5THXUqMbhrRef72RBJ+HSvZQMRJW8yyXxYkS69NgGLW6WXt6re/TLJtecJm6gmdRpAEjOTh+giGYClnGu36gGlS/lkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rifr1314; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rifr1314"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806A71F000E9;
	Sat, 20 Jun 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781979113;
	bh=N88guNxdcPRjk7EgmxKKMu7/Ke6ITk/xgSnFZFK3Lps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rifr1314m3q6R4oFkSZUPE50223qux6+7KzTXgehRM0x+St7LnDBgLb+FfjCxy635
	 u2f87EWgVWHGoK/E5n4VbfRZ/4Alkt6011U5jhM5oIhZczPtgaqx9KSlNjTFCGaSfM
	 2aelLxftseSp19floFer+eGH3beWU6AOtwj2s7uvmJfknd+20fAH0OOaq9NguHTlYp
	 oajbvjojVqu0AQcx0H+zBQq6YQiGBi8kRhoy3qMfmPkzVnckOumfuORNoYdgRfBioc
	 6GtGAU8GJv6QgWLI/BMaZkwykwtU3GmQ+yrcKBKwDXPLNOJGmRDPCeReyEe4Js0toI
	 3GEfv4mtZcWmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260620175210.19563-4-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
 <20260620175210.19563-4-mail@etehtsea.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 18:11:53 +0000
Message-Id: <20260620181153.806A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing SBU routing and multiplexers for DisplayPort Alternate Mod=
e over USB-C.
- [High] Missing DisplayPort and HDMI audio routing in the sound card.
- [High] Duplicate audio routing for Right Woofer and Right Tweeter breaks =
channel separation.
- [Medium] QMP DP PHY output directly connected to hdmi-connector without a=
n HDMI bridge.
- [Low] Invalid `vddl-supply` property in generic `hid-over-i2c` nodes.
- [Low] Invalid property placement: `dr_mode =3D "host"` placed on DWC3 wra=
pper instead of core.
--

commit c44972cad74464a55d079d27d560d3a648a72db6
Author: Konstantin Shabanov <mail@etehtsea.me>

arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree

Introduce support for the HONOR MagicBook Art 14 laptop. This version
is based on initial work by Kirill A. Korinsky and Valentin Manea.

Link: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
Link: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.=
19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/755

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts=
 b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> new file mode 100644
> index 0000000000000..c472d844429b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts

[ ... ]

> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		pinctrl-0 =3D <&hdmi_hpd_default>;
> +		pinctrl-names =3D "default";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint =3D <&usb_1_ss2_qmpphy_out_dp>;
> +			};
> +		};
> +	};

[Severity: Medium]
The QMP combo PHY natively outputs DisplayPort signaling, but this
hdmi-connector node strictly expects TMDS signaling.

Since the X1E80100 DP blocks lack DP++ support, does this direct connection
violate DRM DT graph bindings by omitting the active DP-to-HDMI bridge
needed to convert the signal?

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +
> +		/* Left-side port, closer to the screen */
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {

[Severity: High]
Is it possible that the SBU routing is missing here?

The commit claims support for DisplayPort over USB-C, but this configuration
omits port@2 for the SBU endpoints, and there are no SBU multiplexers or
retimers defined.

Will this prevent the UCSI Alt Mode driver from routing SBU and break
DisplayPort Alternate Mode?

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-HONOR-MagicBook-Art-14-Snapdragon";

[Severity: High]
The commit mentions support for HDMI and DP over USB-C, but this sound node
omits the displayport-X-dai-link blocks.

Without these DAI links, won't audio routing to external monitors over
DisplayPort and HDMI fail?

> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",

[Severity: High]
Does mapping both WooferRight and TweeterRight to WSA2 WSA_SPK2 OUT
accidentally leave the WSA2 WSA_SPK1 OUT widget unused?

If the first channel of the WSA2 macro is never powered on, could this
break channel separation or cause the right woofer to fail?

[ ... ]

> +	touchpad@5d {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x5d>;
> +
> +		hid-descr-addr =3D <0x1>;
> +		interrupts-extended =3D <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply =3D <&vreg_misc_3p3>;
> +		vddl-supply =3D <&vreg_l12b_1p2>;

[Severity: Low]
According to the hid-over-i2c dt-bindings, the driver parses vddio-supply
rather than vddl-supply.

Will this trigger dtbs_check errors and cause the upstream i2c-hid-of
driver to ignore the supply? Should this be renamed to vddio-supply?

[ ... ]

> +	keyboard@3a {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x3a>;
> +
> +		hid-descr-addr =3D <0x1>;
> +		interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply =3D <&vreg_misc_3p3>;
> +		vddl-supply =3D <&vreg_l12b_1p2>;

[Severity: Low]
Similarly, should vddl-supply be renamed to vddio-supply here for the keybo=
ard
to conform to the hid-over-i2c dt-bindings?

[ ... ]

> +&usb_1_ss0 {
> +	dr_mode =3D "host";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
The dr_mode property is placed on the DWC3 wrapper node rather than the
core node (e.g., usb_1_ss0_dwc3).

Since the core DWC3 driver parses dr_mode exclusively from its own node,
won't this be ignored and cause the core to fall back to OTG mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620175210.1956=
3-1-mail@etehtsea.me?part=3D3
