Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961373;
	b=qENtr04z6uGytCGtxKQmg1YUxrqo++Z7qLzsRcsHoqRuhN4aIKgs9zp0cZbiOVxpsBKP
	 NVEKPS9p4EtlHVB8hwm1e9603oa+q/7wnDRpgx2G3vQ04Wx+ulm8xh51OKotA46HTX7f5
	 g7cLFy64LNn0bzDED8+mTKx2eTzqxcBwQlsh7Re1xymsVNCJJQ4AjFi/WeowQUyemLYNW
	 CUyBLA6Qv2sFTX73EgYvxI5lGxSFpqLU/S1MIdKDuAWt4HOAOSQTRFWUXZgQnzqO3gBqy
	 tSA0uUeMHPrQvciefInUIWQ+ei9PJ4MAJMX2VyiqubpDpJgWsN2QTYXNIZ68NqtPa5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961373;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CQuWkxxtYsZ+5vCEKyc6SiAP0zL/YpmQT9LDXpUc+YU=;
	b=Pv3T04iYLw72EwMverOkq1TtTP5pTYU5ihR1QrSJK6vE0HZhkNMnywTJmkjGQqj1eUhp
	 favABWu+TbRtqlSzKGr4ndvSjg60INXyuCNXTPxxMftDskaiYQTJXuLKKtwmHuuyGLxMc
	 GcP7qBhvkQa9YeRN6EX61yElpvV97oU3mPA4D0VgQTuNnZx77wiR/lEgb+q+f/XE8Ro7/
	 aOGczahfQXgitnCOFxWuysMwUHBo9q261qoeP0rEXMEq94wvliVVCIdVlmIKJmqETFEQl
	 AmA9Fai2iET2o6KW8wLT0boNynw9LBb3Qav3XrDZufiu+UsIYPVT5IWONH3UQZsMxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoyXiZRA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062ED606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoyXiZRA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555D01F008A2;
	Fri,  6 Nov 2026 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961372;
	bh=CQuWkxxtYsZ+5vCEKyc6SiAP0zL/YpmQT9LDXpUc+YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OoyXiZRAS3pEtSeYrpOndNc6WJY4hgfYRjTtIq0NNHXAfta8bY/Hv+Z2xdI/5QaiA
	 iI6GKHvC2DpNJtpevEiRjzDJ8EewPLpjkV1mHVWwTtn6nomJwHIhSQQ7BvnJc3raLl
	 pE/r7bX9kJ4FHResnU39CjLcUUHfkNldoOpxl2zIt1TLpdPyv6SZugzkmc7LkZ6D9L
	 87+G7KnsQ9NN9p2uR+MuxHucywOvzhyi+Ht+1mYDmBDq65MSh4lZ2QWi5AXtxdyEcR
	 tBgNKbpRMWgyopAkcVbsSLIZVLA/qU1EB6VJn/U0zuEGmPEwRSKrIZnQBxJNsWGiM4
	 w5oUUWWUhJS6A==
Message-ID: <sashiko-outbox-201224@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/11] arm64: dts: qcom: ipq5210: Enable the PWM
 block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-08-dts-v8-8-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
 <20261106-08-dts-v8-8-d91401955039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:36:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: qcom: ipq5210: pwm node enabled in SoC DTSI instead
  of board DTSI
--

commit 9b1049e040d5bbafe187118c25b0e6a3e6d556f6
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Enable the PWM block

This commit adds the PWM controller node to the IPQ5210 SoC device tree
and configures its pinmux on the RDP504 common board file.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/a=
rm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 422e2766478a9..b32daa7c1559e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -89,6 +89,11 @@ &pcie1_port0 {
>  	reset-gpios =3D <&tlmm 29 GPIO_ACTIVE_LOW>;
>  };
> =20
> +&pwm {
> +	pinctrl-0 =3D <&pwm_default_state>;
> +	pinctrl-names =3D "default";
> +};
> +
>  &qpic_nand {
>  	pinctrl-0 =3D <&qpic_snand_default_state>;
>  	pinctrl-names =3D "default";

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index de3504395c48d..e4a696a65e550 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -406,6 +406,16 @@ tcsr: syscon@1937000 {
>  			reg =3D <0x0 0x01937000 0x0 0x2b000>;
>  		};
> =20
> +		pwm: pwm@1941010 {
> +			compatible =3D "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
> +			reg =3D <0x0 0x01941010 0x0 0x20>;
> +			clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates =3D <100000000>;
> +			#pwm-cells =3D <3>;
> +			status =3D "okay";
> +		};

[Severity: Low]
Should pwm@1941010 set status =3D "disabled" in ipq5210.dtsi and move
status =3D "okay" to &pwm in ipq5210-rdp504-common.dtsi?

Because the PWM output requires board-specific pinmux configuration and
other peripherals in ipq5210.dtsi (along with pwm@1941010 in sibling IPQ
SoC files) default to disabled, enabling it at the SoC level causes any
IPQ5210 board that does not use PWM to probe ipq_pwm_probe(), which calls
devm_clk_get_enabled() and devm_clk_rate_exclusive_get() and keeps
GCC_ADSS_PWM_CLK enabled and locked at 100 MHz without consumers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-08-dts-v8-=
0-d91401955039@oss.qualcomm.com?part=3D8
