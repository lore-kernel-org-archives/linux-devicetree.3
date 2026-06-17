Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7473FD131
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701369; cv=none; b=g9e2AK+EeoU4kajEUU+n+7lvg3Trq9xU4hdGbUS20yC6XRLo7MasXJfh3lXfiSLYl7qgFBvjrtxRsYJsY3CRmkIM88heb/lrIDldVvBYq9V1Dm1kkn6bVxUeL86oobNTGIQmgph3UaU7e03YjVY4ZGO0BYs49nRRJFEHG2grC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701369; c=relaxed/simple;
	bh=9+dzI2dN9emuFI2pax5DYoZgXEDqCf7HE8WznzHpk2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iTRkRhLTswsw1/CJas+sEmbxpZwC/57PXOIOKDT/cFZaRMNLbZUjVhr8a7OxCYzqZfpQZup7IhXrLzHyToLwGClICX9kZlQmMgTvGx8ZyE1ZpyhCXLZr8YbiimblaXiXC21StIIKJA2g5wJyYaQvPQDe+lF6bjrL590iHhhz6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9Q+1BoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9Q+1BoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B571F00A3A;
	Wed, 17 Jun 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781701366;
	bh=GAiBvawRB02ddy9R83CA5ZZluym5rHGQPF5fxEoW2KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9Q+1BoJRiZy0C8ePygJ6fcBWjb0eyNyYebd5OU0rFwIgTUgZf6A5EUK0fiBj1r68
	 FWBWsIa/80YjWongGW77n1C2SzyM8hgIBr9klRgUZkyVi3aL3VNoVXWc/W4XTDMSti
	 rixVZsUpEiSt+l4WqJCsyDtKxSLIR3OkS3wqW6M8p7HsS9oiA/xA4UF7xomwHJziE8
	 HN7eK8KEbblvH/EjPKoqz4gZqqIfqNIOL/iT0nDJI1K4Eim7rWJ00BnYO7qtDNRl0T
	 cEv/M7pxhrTl12bPb4HbrsYIc85Nf83z0z0u2OuZuk2arr134E0NmmheCoPSnMbxmD
	 6UhwSkliyv2PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: pmk8550: add VADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 13:02:45 +0000
Message-Id: <20260617130246.65B571F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch includes a nonexistent header file `"qcom-adc5-gen3.h"` a=
nd uses undefined parameterized macros, breaking Device Tree compilation.
--

commit 9db08ecceaa2afc05462ac83976c923d21f78ce1
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: pmk8550: add VADC node

This commit adds the VADC node and the initial pmk8550 adc channels.

> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/=
qcom/pmk8550.dtsi
> index 3049eb6b46d7a..639c0b1e0c33a 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"

[Severity: Low]
Is this header missing from the patch? It doesn't appear to be present in
the tree, which causes the C preprocessor to fail with a 'No such file or
directory' error during Device Tree compilation.

[ ... ]

> +		pmk8550_vadc: adc@9000 {
> +			compatible =3D "qcom,spmi-adc5-gen3";
> +			reg =3D <0x9000>, <0x9100>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			interrupts =3D <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells =3D <1>;
> +			#thermal-sensor-cells =3D <1>;
> +
> +			channel@0 {
> +				reg =3D <ADC5_GEN3_REF_GND(0)>;

[Severity: Low]
Because the qcom-adc5-gen3.h header is missing, parameterized macros like
ADC5_GEN3_REF_GND remain undefined. Does this lead to dtc syntax errors
when attempting to parse these channel properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-topic-sm8x=
50-adc5-gen3-v4-0-4af9251731f1@linaro.org?part=3D1
