Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9E37A831
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863470; cv=none; b=vAXF5v83q7MRv7FWZrAItAq/9CN8r5HlO02wPkvgUxxaiu2EO6QU92snjfPsaOjKwWbLnbms6Z0Wdy2eXfMJYrubWIbfjD2IgYpuf87I191/dE/iVz5UC/n78JYkJAQRdfy9GK23SfLDz3UqQUMAxXoBiPlJTbYtAuJYKg1qmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863470; c=relaxed/simple;
	bh=3Bi1MpIhmapHJU0CKcWH2mwMMmICXvWAf6OasHa8+WA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bfvmQBCKGA/HqpbdgVVCrGY4z5Bie09M33m6QC846VAITfktx91Q8hCDJSk2IJ2kW+F/sgUzTS9/Dbr3XSHih6Bxv45SvKJkF1iYY8MVdInkG3vX7TfBmixVMxqOcJBD/UPVDC8gBbvdbPm/6Cxc46DQt4zXyVSEwZk6GNspvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCAcA0Fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCAcA0Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1710C1F000FF;
	Thu,  1 Oct 2026 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790863469;
	bh=DrCvDtDAOQAX/WemgQtMHKuNeUUWlAk7aSIWmrWHY+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCAcA0FvtNhauCwwUW/AEQrJSuOnupgnzPqUh0mxDCb/AisNVhR/R/Fe3Yy/7Krxq
	 3uV4ux67PLYkq6P66gzPTvUvzVPBTS3dCzseW26ZAeTNigmahWGIoetPbe8uMkGn1N
	 GyYksGIdhzikwAKdRT5lJz9ylhjTUwqaWV+rsDfcYHnDFcqRilu79JFRfIocvMm+Tn
	 Gj3gNhl+4Aw2wmQbCb+p+0O0WCzJj3lFio4QDVoykQx20tmGzVHnrG3MdFzdI3xov3
	 8uzHXuA9TQ5jOwdsND69bsMMjyNJLlpMJ8MzLgeSd8fr/Uh7GoAzaP7cam83TeNZhI
	 BHPnNy0NmeAtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: BG9OXA <bg9oxa@163.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <179086266668.29834.5300530518863942845@163.com>
References: <179086264917.29834.5543033479795788817@163.com>
 <179086266668.29834.5300530518863942845@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 14:04:28 +0000
Message-Id: <20261001140429.1710C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: type-c dual data-role contradicts usb controller host mode
- [Medium] dts: parallel dapm routing bypasses headphone amplifier
--

commit 9f35004d471e8daa3f6d6ace7fb6441749b6b25d
Author: BG9OXA <bg9oxa@163.com>

arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the RK3588S-based ALIENTEK QuarkPi-CA2
board. It configures memory, networking, video outputs, and USB interfaces.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..d9d679d99266f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +	husb311: typec-port@4e {
> +		compatible =3D "hynetek,husb311", "richtek,rt1711h";
> +		reg =3D <0x4e>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usbc0_int>;
> +		vbus-supply =3D <&vbus5v0_typec>;
> +
> +		usb_con: connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			power-role =3D "dual";
> +			data-role =3D "dual";

[Severity: Medium]
Does this type-C connector configuration contradict the USB controller mode?

This connector advertises dual data-role capability to the Type-C subsystem,
which might negotiate device mode with a connected partner. However, looking
at usb_host0_xhci later in this file, the underlying controller is hardcoded
to host mode (dr_mode =3D "host") and lacks a usb-role-switch property.

If device mode is negotiated here, will this cause the USB link to fail
completely since the controller cannot switch modes?

> +			try-power-role =3D "sink";
> +			source-pdos =3D <0x401912c>;
> +			sink-pdos =3D <0x4019064>;

[ ... ]

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det &hp_con>;
> +		simple-audio-card,name =3D "QuarkPi-CA2 ES8388";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&sound_cpu>;
> +		simple-audio-card,frame-master =3D <&sound_cpu>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,aux-devs =3D <&hp_amp>;
> +		simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,pin-switches =3D "Headphones";
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic",
> +			"Microphone", "Main Mic";
> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",

[Severity: Medium]
Does this DAPM audio graph routing logically bypass the headphone amplifier?

This configuration connects the raw codec output (LOUT1/ROUT1) directly to
Headphones, simultaneously with the headphone amplifier's output (Headphone
Power OUTL/OUTR) on the lines immediately following this.

Will this contradictory parallel routing allow the DAPM subsystem to bypass
the amplifier entirely during playback, potentially leaving the amplifier
powered off and resulting in no or faint audio?

> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",

[ ... ]

> +&usb_host0_xhci {
> +	dr_mode =3D "host";
> +	status =3D "okay";

[Severity: Medium]
As mentioned above for the usb_con node, the USB controller is forced into
host-only mode here and lacks a usb-role-switch property. Does this need
to support dual-role to match the connector's data-role capability?

> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179086266302.29834.=
11881496781543805639@163.com?part=3D2
