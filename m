Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908E32FA18;
	Thu, 13 Aug 2026 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613048; cv=none; b=DOKSMI+QonDrrWvGaRQOYqNDUILercxzv2PdfXb3IVPimFy/yrQi3+ehgfn/OSWKWO04evo+d8aXatAl0VGeT6U65EoFgOvZKqiniVqS3J+VqGOOsrt8sUwMbw25wSoyDxH2tLBwznj/mVAGOreBG/PsyeMvkxLKvqNcrH6VjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613048; c=relaxed/simple;
	bh=IsY7b0zzvexHzw/KiMjjdFEGFxccluYG6hRzEIZ8WrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0sDNu/UwIDyzeazMSyr37BwPucNdjZoeqAxLjV0zNk9PQoVrIGolO0Ori0ycvtUZsP/LXvt6fYUSU9Hx5itZtRa4P7Lk4Q2e+KgIcoYmC/qs+GDZChVbxJ7rwWq6GYUAdpweDgB4FMBRsPHSEk1qQqzfwkR5IvQxjTqi6yqkVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE11HJYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE11HJYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE691F00A3D;
	Thu, 13 Aug 2026 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613046;
	bh=oh+ttAZGQTbA2HM9crNJkaTZwm2Ftb710NCI17YLxbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AE11HJYx8uZ9he+m2LlvlcT/r97ILYwQ8Fob6xvPRJdvCDxqIMoQhIaDHqdoipn33
	 LNhIQ9/6cBYO854grYmHG2sKTtpkMaAJkDS0Tlc28fJArf7KWpIE7ZmgcPQl4Cy0zZ
	 fqWXda5Euch8Tk4BC6BJySEA7B1p9NcVOEqn1NAs4k4FVhByuNXUzHeYzDpR/Si+bs
	 tnX6/9YLMSud5s9fga/9MMV0QGLldSJQSDcAywz/RFZnXMWSzWBAuxoMTIq7d4aHRG
	 HR2A+QivBc+0Q+1wNpECYoxCZ/agqYbgNr3y3zh+UE7nqxZigtXvfIJpda0maGQCNN
	 34eyQgip3tIyw==
Date: Thu, 13 Aug 2026 11:24:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
Message-ID: <20260813-private-brass-rhino-81d7a9@quoll>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-4-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808-rp-qcs8550-v1-4-a5a365ba3dc5@gmail.com>

On Sat, Aug 08, 2026 at 12:37:58PM -0500, Aaron Kling wrote:
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++++++++++
>  2 files changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 09b3c5b2d9dab..582805e89f4cb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-nova.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> new file mode 100644
> index 0000000000000..10dabb1d51f5a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "qcs8550-ayntec-common.dtsi"
> +
> +&{/} {
> +	model = "Retroid Pocket Nova";
> +	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm_backlight_default>;
> +
> +		status = "okay";
> +	};
> +
> +	vdd_disp_1v8: vdd-disp-1v8-regulator {

So foo-regulator?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_1v8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vdd_disp_2v8: vdd-disp-2v8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_2v8";
> +
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +
> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	ts_avdd_3v0: regulator-ts-avdd-3v0 {

Or regulator-foo?

Decide and also read:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml

Best regards,
Krzysztof

