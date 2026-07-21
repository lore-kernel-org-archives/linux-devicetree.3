Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527B4D90C0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646854; cv=none; b=uCNVSXgqWCWSG6d6B1JA4p+xUAhXpbJ8TLNkGeA6d9I8GlQUpPNvj/RSdtde+qzxE/inHGnjtA1LX/g4w5CyWftQVcoM16g8F1y4Kn5T8nR4xwh9vtRORaZGy+rQyVBDmjPbspZv8Gr4AVk9ABp6Pt8pZs43d5u0WWZcw3iKM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646854; c=relaxed/simple;
	bh=BGKQRLr/NyUSozzGysxHZCmHHIvI78X6TSJmv+S9Yyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UN4lBd/k5dZBGDyxhRgmPcB25e1DI2aaJYMPFvJanDel7pn8lbiZUz2XpQaxk398osmE45vooVKGrgSb4xMUGdD0JOzMTvbJvZqkvYw2MZ+CoPJYIBVhY+oXuo8mKMGxeFdY3+xCROxXmc84VJfgbT8SKzluRJkBMvWhX1LfBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZEfxMog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZEfxMog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882471F00A3E;
	Tue, 21 Jul 2026 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784646852;
	bh=T3dgHVHmxu4dH/rfO105IWjU/FYlpJdJhFzPE4XgAjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QZEfxMogKYN5gAO3ITQd11aWJFSh0jnwDU9rDcswq+FjA7OcEBsriUNkl0Rtpriqp
	 jpG/mSvnOo2K/fP9WYUoyAYLrr0/tnHLl/PAIN9QOHEvrmIuHk5HQxmNy6/A1LE8jx
	 ymHVnCkaLoYiLjIpzN+J/YYfEpSKnD3GafV8BpGkEAti2cIIlSlujnMD/3/TtOVAnu
	 SfaqOLIw4kSRPJQJBRpmG3qDX4pz8/fuUiPI2sfjvpZwAAhXxqPs8BFVagryd7XURX
	 9vVXTGWPpm1T1/a4lCWLXn4hyNRO8CXmQ4o2GQpSZdYiePpX5e7cYpGIB0AL6Rz6Vm
	 UVGiJd7jU0O5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721145822.1278-1-code_0002@163.com>
References: <20260721144557.1455-1-code_0002@163.com>
 <20260721145822.1278-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:14:12 +0000
Message-Id: <20260721151412.882471F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Adding GPIO_OPEN_DRAIN to shared reset-gpios does not bypass the g=
piolib exclusive request check, causing subsequent codec probes to fail wit=
h -EBUSY.
- [High] The reset-gpios for cs35l43 codecs use GPIO_ACTIVE_HIGH, which inv=
erts the required active-low reset polarity.
- [High] Invalid compatible string `kinetic,ktz8866a` prevents the backligh=
t driver from probing.
- [High] Missing pinctrl configurations for critical interrupt and reset GP=
IOs, which may leave inputs floating.
- [Medium] The commit violates the kernel's Developer Certificate of Origin=
 (DCO) and Submitting Patches guidelines regarding identity and chain of cu=
stody.
- [Medium] The `output-high` properties were incorrectly applied to hardwar=
e-muxed pins in `i2s1_default` and were not removed as claimed in the chang=
elog.
--

--- Patch [1]: [PATCH v4] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit 67dc6a3d188573154b653dea21a66bad2811a5b2
Author: map220v <map220v300@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)

Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> Author: map220v <map220v300@gmail.com>
[ ... ]
> Signed-off-by: code002-2 <hiez832670@gmail.com>

[Severity: Medium]
Do these identities meet the kernel's Developer Certificate of Origin (DCO)
requirements? Both the Author and the Signed-off-by tags appear to use
pseudonyms.

Furthermore, the Author's identity is missing from the Signed-off-by chain,
which breaks the custody tracking.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
[ ... ]
> +&i2c1 {
> +	status =3D "okay";
> +
> +	backlight: backlight@11 {
> +		compatible =3D "kinetic,ktz8866a";

[Severity: High]
Does the upstream Kinetic KTZ8866 backlight driver recognize the 'a' suffix?

The driver in drivers/video/backlight/ktz8866.c and its bindings seem to on=
ly
support "kinetic,ktz8866". Without a fallback, could this silently fail to
probe and leave the display unlit?

[ ... ]
> +&i2c5 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";
> +		reg =3D <0x40>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&tlmm 90 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

[Severity: High]
Does adding GPIO_OPEN_DRAIN bypass the gpiolib exclusive request check?

Since all six cs35l43 codec nodes share this exact reset GPIO, gpiolib will
likely return -EBUSY for all subsequent codec probes after the first one
succeeds.

[Severity: High]
Also, does (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN) invert the intended active-=
low
reset polarity?

By specifying GPIO_ACTIVE_HIGH, gpiolib will translate a driver's logical 0
into a physical LOW, which might hold the codecs in reset permanently.

[ ... ]
> +&spi4 {
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		compatible =3D "novatek,NVT-ts-spi";
> +		reg =3D <0>;
> +
> +		spi-max-frequency =3D <19200000>;
> +		novatek,irq-gpio =3D <&tlmm 25 GPIO_ACTIVE_LOW>;

[Severity: High]
Is a pinctrl configuration missing for this interrupt pin?

The device tree relies on interrupt pins like gpio25 for the touchscreen,
gpio62 for the MCU, codec interrupts, and the shared reset pin gpio90, but
fails to define and attach pinctrl states for them.

Leaving interrupt pins floating without explicit biases risks spurious
interrupt storms, and unconfigured outputs risk failing to reset hardware
correctly.

[ ... ]
> +	i2s1_default: i2s1-default-state {
> +		sck-pins {
> +			pins =3D "gpio121";
> +			function =3D "i2s1_sck";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +			output-high;
> +		};
> +
> +		data0-pins {
> +			pins =3D "gpio122";
> +			function =3D "i2s1_data0";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +		};
> +
> +		ws-pins {
> +			pins =3D "gpio123";
> +			function =3D "i2s1_ws";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +			output-high;
> +		};
> +
> +		data1-pins {
> +			pins =3D "gpio124";
> +			function =3D "i2s1_data1";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +			output-high;
> +		};
> +	};

[Severity: Medium]
Are these output-high properties correctly applied to hardware-muxed pins?

In Qualcomm pinctrl, static output states should typically only be configur=
ed
when function =3D "gpio". Applying output-high to hardware-driven pins can
conflict with the hardware controller block.

The commit message also mentions removing output-low/output-high from TLMM
pinctrls, but they appear to still be present here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721145822.1278=
-1-code_0002@163.com?part=3D1
