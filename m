Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92046AA71
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648409; cv=none; b=sCmSIOU9H2GuXyEaSL7LslrnON33UgsjTThxgfO8FJOYz0Qtu+dSrMsjM0+wPdjYKvUAYxQnx+mBrGr+wGCd2314HpznTqtWEWviMU5Bx+73CLnjlTi1b+bD2bbLp0VhkfownP9esaRVX7o7RIEEU0QvRIA/cnSTbFvcaJ4epCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648409; c=relaxed/simple;
	bh=XG2i2yvhAIujrLoviqewBco8HMj8kggr94b3Mp6Wmqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dlcFYOa8x+/vMM+iHYrJnngwgkmTkSUdtcASI3nt2d2xhQ5N7MtPIURyyKpF/E1pzM70lGFAlMZ9L7rezj2gAHOfJ/DY97ZFb/5RVgbEO4QaD/WMn4JrS6Y/YnTcocQy71d1o/dGELT9dcRKrvX1YYMoao2v7qwDVzQpf1ND8aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRYxkaoM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRYxkaoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7321F00A3A;
	Tue, 21 Jul 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648408;
	bh=mjkNKqm71emq6pKvK/lBW/rVFPR1FhmW+TORw7+mysk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRYxkaoMD810KXS6sShFA1yVuuMpTmMRC4vNN8OwVLNWA89gL5QaCenfQx9V+cmGW
	 kQ1Tkpa+2r4xVQzofJH3bZFhBmzwZrckj7/f8YiXsC1wyRpiXNidiVPtX/2lFB/smu
	 vkUPtmOJI0sWCHVUE9dbPa26BFOs8FtQOD0U3bgFeTSdMlusk8Jis2Ou6jbiPGVqjb
	 WuNtMfcEUa9vUYz9//Nq4oWdzJIXyGvMSbBQfeCiuCJ2izfEhTWgCOphwJ2D34ZH/T
	 85oQv9EFqvxFmwoy8FcAJu41aAxfrViVHKZJWZQmCqXTSITGMtVaMIgSFJd/EHh5NL
	 2diXn5tbK3kjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] arm64: dts: qcom: pmk8550: add VADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-1-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-1-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:40:07 +0000
Message-Id: <20260721154008.0C7321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch includes a non-existent header file `"qcom-adc5-gen3.h"` =
and uses undefined function-like macros for device tree node registers, whi=
ch causes a fatal syntax error during device tree compilation.
--

--- Patch [1]: [PATCH v6 1/5] arm64: dts: qcom: pmk8550: add VADC node ---
commit 0e03aa4d4f8680856bf95a8ea645ca19c313f79d
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: pmk8550: add VADC node

This commit adds the VADC node and initial ADC channels for the pmk8550
device tree.

> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/=
qcom/pmk8550.dtsi
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"

[Severity: Low]
Is the qcom-adc5-gen3.h header missing from the tree? Including a file that
does not exist will cause a compilation error.

[ ... ]

> +		pmk8550_vadc: adc@9000 {
> +			compatible =3D "qcom,spmi-adc5-gen3";
> +			reg =3D <0x9000>, <0x9100>;
> +			interrupts-extended =3D <&spmi_bus 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +					      <&spmi_bus 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +			#thermal-sensor-cells =3D <1>;
> +
> +			channel@0 {
> +				reg =3D <ADC5_GEN3_REF_GND(0)>;

[Severity: Low]
Since the header is missing, will the preprocessor fail to expand the
ADC5_GEN3_REF_GND macro? This unexpanded text causes a syntax error when the
device tree compiler expects an integer value.

> +				label =3D "pmk8550_offset_ref";
> +				qcom,pre-scaling =3D <1 1>;
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm8x=
50-adc5-gen3-v6-0-a507f4a1e537@linaro.org?part=3D1
