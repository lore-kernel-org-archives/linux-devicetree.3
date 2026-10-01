Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702F528424
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868675; cv=none; b=R1su6nn5UvnnPzKeIb3p5t9WAhIu2CrKcZJ6CXznuJZkEerbDkQqkYNrweYRWrOXQpNN4fghPWp8Sclnn0qXhdWLB61l2dU3uje+EIAIdK1n01EBA3KQ+BJlx5zFykg2/wBh+EsTUljlXTbaXXevzpRACuMqqlUux+zcHQHEl18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868675; c=relaxed/simple;
	bh=TXWz1+49IQIW7P24LBP5WqsI5Q613P3nzvC2ZJ6ltek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QP75S2+HTYCxaxqgXYDu+eeJH+ggeLzxWcQK1Ju1gMtFHZB0D4H7COAq4tI7bQUWPBpT96NiZHChPzhm7uHY3PWojvtK0nh/Wj/sAqNTLteNDw4z8uZYOtKRgR8OupuQ45TpHgklcClrQbB37q0iTvh36IZCGe8Be/WikRTLdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEVI6vSI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEVI6vSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B131F000FF;
	Thu,  1 Oct 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790868674;
	bh=lRcsUhikLzDbhFCQGEzDgRLzP1vWcWPTtse/pMuixdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DEVI6vSIRz745posYwYpbWxPFx8canccWxhWJgBoZktu8U5MAxcnlRrm8gpYK4cz2
	 9MJfZVDz/ZzxwCAXa26YYT32xWXhnQc5KDPKry5t0kNa8D4LSjoCcW/T91ycQUhS0s
	 OHvZcZKEjnQZAq4U6W2LDb7+GDWe4DUlBQbOcoCu22C8+WMsEnXBPfdFhOfYCwP/p6
	 MyIqe8iLDwMkFS2lv1VBtarD1GohiaXqSGmKeYONguDxcof809CYr4g3dpPcHTEqQx
	 Sq9OnckCDJjLbxMMl2s15oiCqF78Edovm4evNcqdVaJXKpKYtit5Db1WOp7C87QHxu
	 4Y1a2p0Wg8J2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: BG9OXA <bg9oxa@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>
References: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
 <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:31:13 +0000
Message-Id: <20261001153113.E4B131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: gmac1 configuration contradicts commit message regarding RG=
MII delays
- [Medium] dts: invalid parallel DAPM routing for headphones bypasses the a=
mplifier
--

commit 797f222a3f5a732b55c8373821ac94a17d7cec1f
Author: BG9OXA <bg9oxa@163.com>

arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

This commit adds device tree support for the ALIENTEK QuarkPi-CA2 single
board computer, defining hardware interfaces including Gigabit Ethernet, US=
B,
HDMI, PCIe, and an ES8388 audio codec with a headphone amplifier.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	clock_in_out =3D "input";

[Severity: Medium]
The commit message states that the RK3588S RGMII delays are applied on the
MAC side using the tx_delay property. However, this node configures the PHY
to apply delays internally via rgmii-id and lacks a tx_delay property.

Does this configuration inadvertently apply delays on the PHY side instead?=
 If
the MAC driver uses a non-zero default delay when the property is missing,
could the TX delay be applied twice, potentially breaking Gigabit Ethernet
transmission?

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
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",

[Severity: Medium]
The ALSA DAPM routing defines parallel direct paths from the codec (LOUT1 a=
nd
ROUT1) to the Headphones widget, alongside the paths passing through the
headphone amplifier (Headphone Power OUTL and OUTR).

Could this parallel direct routing bypass the amplifier logically and confu=
se
DAPM power management into leaving the external amplifier powered down? DAPM
might see a complete, active path directly from the codec to the headphones,
which could result in no or distorted audio output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-b4-quarkpi=
-ca2-v5-0-e19296802978@163.com?part=3D2
