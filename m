Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430630;
	b=hN5OnYyOSJ2mmgc+Lmj5iUdJGWaN11yQmmecC/7fnmBjbenrGDU8CoTO2gPS25z8a+TV
	 5Gr/C7JiHJldfEEqf3woB2OTZNN8n88qAPCd023mgFEkls8rNarKz3VbheluBMD8ZqQUg
	 RzyHUumc1MakYQKjfMQ027zS56B9beKLt+hRVKzXM1gmdy66DfuFqxL17ppg4V7CHOqlf
	 GQ3pRLPemrTVLcCQGzlhkz8N7iP2EpGhQFdVOXMB5iLZXrmUJ+88UZDKGKWruMDLBUwA/
	 r0DZu11yU0cQW19ZEP5d3jsRyrEcKo5nJpPxjejZkUSWaBnjPlSUPx+Nvy3HE/Ap18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KL5nf67OreigSBLqsP1umRh0wKkl5hp6rCpn8ix4CKw=;
	b=ET4JU8QEyXC6ZgSwCUy2EnOXesK1gM3cQIaoSG5McGCOZxe2eKVtWjQoYsLBIfSzZuK/
	 +jwytkAL2Fr5VeUQZ2eE/dq7652C1tFZJTdO8HnrhkcCiNBx6Y63FX1aCE3SG890vr2T+
	 RzEYfBEMwYzHbR1qZZMFIZWDORqu9tSdM7N2/Wd8YeYvK+AKJFX3oeSMgpbTfr0GVmmXE
	 3o1w92O8Ymidci2YyjbkBmke8JvZSrX9Ly6NxWC1DAuuy/FeKHkBSeJxG4Caz1oj9twnt
	 mMLKYAn6ZvZgIpdgNTzzI4tve0khs5ZwcmgOjNRjv8JLzbeu1+C8VpucIty7lUUB/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YO7Tdg4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77826606A326
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YO7Tdg4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B461D1F000C1;
	Sat, 31 Oct 2026 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793430630;
	bh=KL5nf67OreigSBLqsP1umRh0wKkl5hp6rCpn8ix4CKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YO7Tdg4dAJNb+0kvOAL4ZyAy2PyHVupjt1pBiETPyFCSGNwIklsJ88rNn4NNOyhPc
	 W910QyKMPqvq4kse+UDYBr7NqKCpjpCq1pqdo1vfs8W2Tq7Uqc8xs06YG4Ujg3vQ1i
	 lnioXNptTw6mQiPEljAMzPz2IAy3JrFfySL8TXX7yq5mY93Y0ax/xDDDylFn8YsEvc
	 adZCXlnUdriFP6bGgOqfC5yG4keFroI11v3wb6ahSZagim6jPQT+IBjsJ6O4u0sb9l
	 R0lx6mzekeVhSW8pQLESmA/HFk+udvAUdPUja+rLdtxh9VxFsVv6zLGnJh94JGNjsg
	 Q2uYeLgwfysRw==
Message-ID: <sashiko-outbox-191793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm8750: describe two of the
 three CCI I2C controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <74cccd474e7955f3d79f57059bca68ae0df7a005.1793427041.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
 <74cccd474e7955f3d79f57059bca68ae0df7a005.1793427041.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 07:10:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm8750: wrong GPIOs in cci1_1_default and cci1_1=
_sleep
- [Medium] arm64: dts: qcom: sm8750: cci0_i2c1 and cci1_i2c1 marked disable=
d while claiming pins
- [Low] arm64: dts: qcom: sm8750: CCI pinctrl nodes out of alphabetical ord=
er in tlmm
--

commit b3f712e6e2f5234e147c4011ed9b421298ff1e50
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750: describe two of the three CCI I2C controllers

This commit adds the device tree nodes and TLMM pinctrl states for the
cci0 and cci1 I2C controllers and their child I2C buses on SM8750.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..9649af7f6fcd5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3060,6 +3060,72 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		cci0: cci@ac7b000 {
> +			compatible =3D "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg =3D <0x0 0x0ac7b000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names =3D "ahb", "cci";
> +			assigned-clocks =3D <&camcc CAM_CC_CCI_0_CLK>;
> +			assigned-clock-rates =3D <37500000>;
> +			pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				status =3D "disabled";
> +				reg =3D <1>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac7c000 {
> +			compatible =3D "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg =3D <0x0 0x0ac7c000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names =3D "ahb", "cci";
> +			assigned-clocks =3D <&camcc CAM_CC_CCI_1_CLK>;
> +			assigned-clock-rates =3D <37500000>;
> +			pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
> +			pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				status =3D "disabled";
> +				reg =3D <1>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};

[Severity: Medium]
Should status =3D "disabled" be dropped from cci0_i2c1 and cci1_i2c1?

The commit message notes that both buses are described and left available, =
as
on sm8550 and sm8650, and the parent cci0 and cci1 nodes unconditionally
claim the pinctrl states for both bus 0 and bus 1 in pinctrl-0 and pinctrl-=
1.

However, because cci0_i2c1 and cci1_i2c1 have status =3D "disabled", when a
board DTS enables cci0 or cci1, the driver core claims the bus 1 pins while
cci_probe() in drivers/i2c/busses/i2c-qcom-cci.c skips registering the bus 1
adapter:

drivers/i2c/busses/i2c-qcom-cci.c:cci_probe() {
	...
	for_each_available_child_of_node_scoped(dev->of_node, child) {
	...
}

> @@ -4090,6 +4156,98 @@ qup_uart15_default: qup-uart15-default-state {
>  				bias-pull-up;
>  			};
> =20
> +			cci0_0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins =3D "gpio113";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins =3D "gpio114";
> +					function =3D "cci_i2c_scl";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_0_sleep: cci0-0-sleep-state {
> +				pins =3D "gpio113", "gpio114";
> +				function =3D "gpio";
> +				drive-strength =3D <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_0_default: cci1-0-default-state {
> +				sda-pins {
> +					pins =3D "gpio117";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins =3D "gpio118";
> +					function =3D "cci_i2c_scl";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_0_sleep: cci1-0-sleep-state {
> +				pins =3D "gpio117", "gpio118";
> +				function =3D "gpio";
> +				drive-strength =3D <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci0_1_default: cci0-1-default-state {
> +				sda-pins {
> +					pins =3D "gpio115";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins =3D "gpio116";
> +					function =3D "cci_i2c_scl";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_1_sleep: cci0-1-sleep-state {
> +				pins =3D "gpio115", "gpio116";
> +				function =3D "gpio";
> +				drive-strength =3D <2>;
> +				bias-pull-down;
> +			};

[Severity: Low]
This isn't a bug, but child pinctrl state nodes under tlmm in
arch/arm64/boot/dts/qcom/sm8750.dtsi are ordered alphabetically by node name
(hub-i2c0-data-clk-state, pcie0-default-state, qup-i2c*, qup-spi*, qup-uart=
*,
sdc2-sleep-state).

Should the cci* pinctrl nodes be placed before hub-i2c0-data-clk-state, with
cci0-1-default-state and cci0-1-sleep-state ordered before
cci1-0-default-state and cci1-0-sleep-state?

> +
> +			cci1_1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins =3D "gpio119";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins =3D "gpio120";
> +					function =3D "cci_i2c_scl";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_1_sleep: cci1-1-sleep-state {
> +				pins =3D "gpio119", "gpio120";
> +				function =3D "gpio";
> +				drive-strength =3D <2>;
> +				bias-pull-down;
> +			};

[Severity: High]
Are gpio119 and gpio120 the right pins for cci1_1_default and cci1_1_sleep?

In drivers/pinctrl/qcom/pinctrl-sm8750.c (sm8750_groups), the six CCI I2C p=
in
pairs across the three CCI controllers are:
- gpio113 / gpio114 (cci0_0)
- gpio115 / gpio116 (cci0_1)
- gpio117 / gpio118 (cci1_0)
- gpio111 / gpio164 (cci1_1, multiplexed with cci_timer)
- gpio112 / gpio153 (cci2_0)
- gpio119 / gpio120 (cci2_1)

As seen in arch/arm64/boot/dts/qcom/sm8650.dtsi (cci2_1_default) and sibling
TLMM drivers that retain numbered function names cci_i2c0..cci_i2c5 (such as
drivers/pinctrl/qcom/pinctrl-hawi.c and drivers/pinctrl/qcom/pinctrl-maili.=
c),
gpio119 and gpio120 belong to cci2 bus 1 (cci2_1 / cci_i2c5), whereas cci1
bus 1 (cci1_1 / cci_i2c3) is routed to gpio111 (SDA) and gpio164 (SCL).

Does enabling cci1 mux the cci2_1 pads (gpio119/gpio120) while leaving cci1
bus 1 (gpio111/gpio164) unmuxed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793427040.gi=
t.xiaqinghuan@mail.ustc.edu.cn?part=3D3
