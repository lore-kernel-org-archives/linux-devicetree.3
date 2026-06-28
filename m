Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B57261A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668827; cv=none; b=PUwiVqzaYDjBnSdwkZPE/gNo6XCF9hTehPxNu0BVoGfCE2LpzEqkTnTy8oRQsiSFePO84a0/+vu81SmncXL0EwL9ctkWL8CnO7FVnheBM28RAQEgu5c2rdHhHzg0OIPx5+cwJzJ85iorMVdovhgPMWD2UhT0xiyTYPnulHXcXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668827; c=relaxed/simple;
	bh=BK6rlQTwWQNLjRyNS/okYmOKj14U/BjaCyZiXzKPt0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fb53Q1AC92F4HxZw5U2Ro5pfUNWJUxlf/jOSle32i6dRM/xnQREShDkno3+Bnm1HYqLdqBYPYkldTDjDfdLHiEc2ETVfPoNq7PtTYh7r5lAx7XK+LAoDbof3Mhw+8jET3h05HzLYzqv9E9QO3Xz6AlWrs9GSRpqbjxEGOvVbUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzWuTD+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzWuTD+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AC91F000E9;
	Sun, 28 Jun 2026 17:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782668826;
	bh=8riI1B7So4qOcmpaBpRO4ENB3yw17YChBiZylbSNaxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzWuTD+6AxZxQJuYaEI6BlSRykFz+4kLMjo/WtWwwjT2ZatiRCXJzeypRK99M9wFj
	 BeMlwYAHp+9SmIYJnCPOZ7nt3NO3bryaIfK7Ml3exAUp/I1NvkICOFaWZPYqUYVg2q
	 3nW7/xXfku9c8WLh9suORV8M+54AWFijOqP07IJaZldPcdZ+605mNZxw7R96n8HroX
	 mFy0rlwYIK/z16pMxJmw+0s5oguvUNiW9Egk/C9CIfazsUCR59hi65p18dglklEAQS
	 AnAlhyGiWf4Ua656pnAZIpsulnjvfYebqfvSvs4V62uAdb3BjIIfxUsIyBFXeCUyv5
	 QJdUxMXAdc7xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260628172640.23167-4-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
 <20260628172640.23167-4-mail@etehtsea.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 17:47:05 +0000
Message-Id: <20260628174705.B8AC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] DP Alt Mode over USB-C is claimed as supported but lacks SBU mux=
, pmic-glink SBU endpoints, and DP PHY connections.
- [Medium] The touchscreen reset line is configured in pinctrl but lacks an=
 active drive level, potentially leaving the device stuck in reset.
- [Medium] The pinctrl configuration for the touchpad interrupt incorrectly=
 targets gpio3 instead of the interrupt's actual GPIO (gpio24).
--

commit 6ee378ed5847ae927be3c89dca68d6810e9c3f3e
Author: Konstantin Shabanov <mail@etehtsea.me>

arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree

Introduce support for the HONOR MagicBook Art 14 laptop based on the initial
work by Kirill A. Korinsky and Valentin Manea. The commit adds device tree
configurations for hardware components including display, audio, and USB.

Link: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
Link: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.=
19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/755

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts=
 b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> new file mode 100644
> index 0000000000000..79e49ba55e4b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts

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

[Severity: Medium]
The commit message indicates DP over USB-C is supported, but does this
pmic-glink connector configuration omit the SBU endpoints needed for the
DisplayPort AUX channel?

A standard DP over USB-C implementation typically requires a port@2 mapping
to an SBU mux to handle link training.

Without the SBU routing, will DisplayPort Alt Mode fail to negotiate?

[ ... ]

> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchpad@5d {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x5d>;
> +
> +		hid-descr-addr =3D <0x1>;
> +		interrupts-extended =3D <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;

[Severity: Medium]
This sets the touchpad interrupt to GPIO 24, but the tpad_default pinctrl
state configured below targets GPIO 3 instead.

Is there a mismatch here that will leave GPIO 24 unconfigured and
potentially cause missing or spurious touchpad interrupts?

[ ... ]

> +&mdss_dp0 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> +};

[Severity: Medium]
The mdss_dp0 and mdss_dp1 outputs appear to be isolated here.

Should they include endpoint connections linking them to the QMP PHYs
(such as usb_1_ss0_qmpphy)? Without these remote-endpoint links, it seems t=
he
DisplayPort outputs are structurally disconnected.

[ ... ]

> +&tlmm {
> +	gpio-reserved-ranges =3D <34 2>, /* Unused */
> +			       <44 4>; /* SPI (TPM) */
> +
> +	tpad_default: tpad-default-state {
> +		pins =3D "gpio3";
> +		function =3D "gpio";
> +		bias-disable;
> +	};

[Severity: Medium]
Does this pinctrl state incorrectly target GPIO 3 instead of the touchpad's
actual interrupt line, which is declared as GPIO 24 in the touchpad@5d node
above?

[ ... ]

> +	ts0_default: ts0-default-state {
> +		reset-n-pins {
> +			pins =3D "gpio48";
> +			function =3D "gpio";
> +			drive-strength =3D <16>;
> +		};

[Severity: Medium]
Should this reset pin configuration include an output-high; or bias-pull-up;
property?

Since hid-over-i2c does not natively manage reset-gpios, relying entirely
on this pinctrl state without actively driving the line high might leave
the touchscreen stuck in reset.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628172640.2316=
7-1-mail@etehtsea.me?part=3D3
