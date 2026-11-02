Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600397;
	b=uXBoK3DYK1Ayhe4t42k8SpMEZX1phcMFUBf+1/ABK8UPsiTGpKgC8X9FkDcIZWhRNxfC
	 55x9l0SYbRymHncBipWr4SgNP0+a/bhegwFGBeLps9p/jc1sYvs623lDXnmDX2qos9ugt
	 PmqLnJEAYfXDefT0D7/7xPSEteGfI0PNM3EoBQZcIjwhM1St1ChOeJQ8sUX2TsgwFnmHk
	 AHyAMiLhv5cCdwP4/CWNQ8lR/LVrou7CQl2y+ze/WCzRN+Y/Fz8LYPzcooUPOjxMMJdB1
	 FwszVefJX5FgCmXQ1PuWNC+47Jop/A8VCo6iKNBGt2WHLLyZdamXjuPaCyKZzxL0ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kZxWrWLDc4YMgAhDECYz9pDQbNRb6VbZJ3ky8AtjslU=;
	b=J0b0CvujY5H2nuUoBrbwpsgrClztak0gYz2zmeyn9QLpNJ68ouRE11+LqiWPFaWANaz6
	 LxHEDd4BdCLfNdcE5ZFujRl7hLrtYBWTBFruSFrbRKW0CPHnyX/oUfvxocpurR7wwr3V6
	 4JADf/swaxVj5TXstjlMdGEhXO5hT/hycUpo0ezPKTR0EQcW79TsN6s6wmwXwmsO+ri6s
	 5Gc5ViP2xrB06zAG8A66bxrXCUPZeaCTa5Q0QP/aUCrmdGxf28720bKhgJQxzLhCTvEQc
	 uqwNIP9UsrY91jbLnPe9ShLlw1XdwJAphDahaHJo5HYUYJ5PLs8siZ2bJ2sqZ2LMwIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TywzDjqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A1D606A339
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TywzDjqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9697A1F0093A;
	Mon,  2 Nov 2026 06:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793600396;
	bh=kZxWrWLDc4YMgAhDECYz9pDQbNRb6VbZJ3ky8AtjslU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TywzDjqLhU3D7PBj7vTrJK4bAC8SIeYj75McBprA3Si4p3ZIAW2ezQ8Ic1UlrjHxP
	 IclR/SzV+DQd49/1NoW4Q8c6IYbZ1F+6toPfxSocmXFESRnvPvgpsT+jbEo7Y7jgqC
	 sizEx72rBijDzTGVqvdskrRGBOrAPb3nrvBpsOWPUQUCR6xzfI1c2z2UDuylSjxtvF
	 TQwHCFbSGSKE9HKorEb4PfU3iA8UtCtpx9I/0ocxi9cwjLx9Y6XPhe6kINy1gXwunU
	 EFOnSDg/5cD+M85nZ/j7y6w6qbng41MYWSA3B/ekE8qYfc7DTfLH9xKEW33SVb1YCd
	 XwwZ3RTfge0cA==
Message-ID: <sashiko-outbox-192950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: sm8750: describe two of the
 three CCI I2C controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 06:19:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: sm8750: omission of cci2 controller and pinctr=
l states
- [Medium] arm64: dts: qcom: sm8750: CCI sleep pinctrl states mux pins to g=
pio
--

commit a65c21663abcd66908e315d4a351c0c64b9975c6
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750: describe two of the three CCI I2C controllers

This commit adds device tree nodes and TLMM pinctrl states for the cci0 and
cci1 Camera Control Interface (CCI) I2C controllers on the Qualcomm SM8750
SoC, leaving the third controller (cci2) undescribed.

>     arm64: dts: qcom: sm8750: describe two of the three CCI I2C controlle=
rs
>    =20
>     The SM8750 has three CCI I2C controllers; this dtsi describes the two
>     that the Qualcomm camera subsystem binds to on this SoC. Each control=
ler
>     exposes two I2C buses; both buses are described and left available, as
>     on sm8550 and sm8650.
>    =20
>     The TLMM pad assignment is cci0 bus 0 on gpio113/114, cci0 bus 1 on
>     gpio115/116, cci1 bus 0 on gpio117/118 and cci1 bus 1 on gpio111/164,
>     the last two being the pads shared with cci_timer. The remaining CCI
>     pads, gpio112/153 and gpio119/120, belong to cci2, which is not
>     described here.
>    =20
>     The controller nodes are placed in unit-address order after
>     videocc@aaf0000, and the pinctrl states in alphabetical order inside
>     the TLMM node.
>    =20
>     Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index dd738d13df8e0..5f64912d55eac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3060,6 +3060,70 @@ videocc: clock-controller@aaf0000 {

[ ... ]

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
> +				reg =3D <1>;
> +				clock-frequency =3D <400000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};

[Severity: Medium]
Why is cci2 (along with its cci2_0 and cci2_1 pinctrl states in tlmm) omitt=
ed
from arch/arm64/boot/dts/qcom/sm8750.dtsi?

The commit message notes that this dtsi describes the two controllers that =
the
Qualcomm camera subsystem binds to, as on sm8550 and sm8650. However, the
camera subsystem driver (drivers/media/platform/qcom/camss/) does not bind =
to
CCI controllers directly; drivers/i2c/busses/i2c-qcom-cci.c binds to each C=
CI
node independently, and camera sensors on any CCI bus connect to CAMSS CSIP=
HY
ports via OF graph endpoints.

Furthermore, both arch/arm64/boot/dts/qcom/sm8550.dtsi and
arch/arm64/boot/dts/qcom/sm8650.dtsi describe all three CCI controllers
(cci0, cci1, and cci2) and their TLMM pinctrl states so that board device
trees can enable whichever buses they route.

Since include/dt-bindings/clock/qcom,sm8750-camcc.h and
drivers/clk/qcom/camcc-sm8750.c already provide CAM_CC_CCI_2_CLK, and
drivers/pinctrl/qcom/pinctrl-sm8750.c already defines the cci_i2c_sda and
cci_i2c_scl mux functions for gpio112/gpio153 and gpio119/gpio120, should c=
ci2
and its pinctrl states also be described here?

>  		mdss: display-subsystem@ae00000 {
>  			compatible =3D "qcom,sm8750-mdss";
>  			reg =3D <0x0 0x0ae00000 0x0 0x1000>;
> @@ -3633,6 +3697,98 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges =3D <&tlmm 0 0 216>;
>  			wakeup-parent =3D <&pdc>;
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
> +			cci1_1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins =3D "gpio111";
> +					function =3D "cci_i2c_sda";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins =3D "gpio164";
> +					function =3D "cci_i2c_scl";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_1_sleep: cci1-1-sleep-state {
> +				pins =3D "gpio111", "gpio164";
> +				function =3D "gpio";
> +				drive-strength =3D <2>;
> +				bias-pull-down;
> +			};

[Severity: Medium]
Should the cci0_0_sleep, cci0_1_sleep, cci1_0_sleep, and cci1_1_sleep states
keep the cci_i2c_sda and cci_i2c_scl functions in separate sda-pins and
scl-pins subnodes instead of switching function to "gpio"?

In other Qualcomm SoC device trees using split cci_i2c_sda and cci_i2c_scl
pinmux functions (such as arch/arm64/boot/dts/qcom/sm8550.dtsi,
arch/arm64/boot/dts/qcom/sm8650.dtsi, arch/arm64/boot/dts/qcom/milos.dtsi,
and arch/arm64/boot/dts/qcom/monaco.dtsi), the sleep states retain the
cci_i2c_sda and cci_i2c_scl mux functions and only switch the bias from
bias-pull-up to bias-pull-down:

arch/arm64/boot/dts/qcom/sm8650.dtsi:
			cci0_0_sleep: cci0-0-sleep-state {
				sda-pins {
					pins =3D "gpio101";
					function =3D "cci_i2c_sda";
					drive-strength =3D <2>;
					bias-pull-down;
				};

				scl-pins {
					pins =3D "gpio102";
					function =3D "cci_i2c_scl";
					drive-strength =3D <2>;
					bias-pull-down;
				};
			};

Switching the pins to function =3D "gpio" during runtime PM or system suspe=
nd
disconnects the pads from the CCI controller hardware block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060458.4613=
72-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
