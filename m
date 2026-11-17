Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906966;
	b=Q5m1dKyLwbUaLXLwAG/iItlmtDfjxhB3rQGtvV3l1lAXCxwZp0wbxHIYHUNZIpd/1Uhv
	 rWirD5y5G7RcT2piisptO219HgZ/zy466pThuRbx6XEZ5aRKiHI3ScmSuv49Cguor08r8
	 D0/TxMiCMb1QGG9f7JwK56UdA53NXoZ/DRh4kSNm73WxaiRx6UiQZBzy1JuqCsPmW4Lmj
	 ZsdkpQ2YpE67gyW8hi5v2m8Up8K2m3EspfYkZMm7k6J8Ix4+Fu1VgAOh50mDMJf4UvTN1
	 u8/NBMEbiXUS60g1lat52uPpyW0/TE9oNBTh7BU/fUsVm18+DpTN0t/O1P25aVbC2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906966;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x2tR5I6lzWi85cWp8M/zZZjx0d2YB+x9XqWs0cDbTog=;
	b=Nl3VLPITR2TEhLZOP0PMEuHnXqdaWkcB3hXZflC5mXMsjukMlMySzL7VsEarYOBi0L1r
	 73zcdRiUoCE9wK0DEQHDNO7A0Rzp+WZ5J4k2V0cx6zh/hUeDuNHQW+uumdKonP9Cr76mm
	 4XEDSqead54Qqr4/XIhAZTXmVHfuZviO8A/knfXP9/uhaOkUssWXpwcaoD+x6Vi1MoMZz
	 UR/gNV/GjvvVbklMBH6UEJR6I0y4qhPXbEtnTgcilz8eO22eOC9igNDdERqckUBwMoly/
	 OQJGRVYOvwfNYmanMYAvt2Es53QPkMb4OSC0mSYLSKIiUDsosPS7IdVxYd+dfE7M2dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcvKnoH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E3606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcvKnoH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BB91F000C7;
	Tue, 17 Nov 2026 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906966;
	bh=x2tR5I6lzWi85cWp8M/zZZjx0d2YB+x9XqWs0cDbTog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcvKnoH+0kHp9jqIR9P736tEju+xDAXK4VGin18wIplP/NPK6FvM3T9hk3xG5vUZW
	 /020H0q2MuueB7fhw9yqKi633eTjOgqa2ZItDnUCvW9OJZSveIXd1+NEgqQGA/SqLl
	 LB+WHC93B/rjQQJIqO6TL3v6NyYHBFOO2Xnz7vmetdVK2J48q01X3gbhisIa9oy3ds
	 JsLOW8Sa8zep07nY17gJuvynzPehxPCUWAFAjZr2LFReBR0NVy8akKh4iu5hf6NZ0Y
	 RaRXLSsZsPBFVWtwVu2eFpH/vOdWwDT0pyhoI7hbuSuTUgnH2ZVMJ3QbJ95IfqPYgJ
	 77eSL+daj2myg==
Message-ID: <sashiko-outbox-218467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord
 bus clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-2-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
 <20261117-qcom-nord-ahb2phy-clk-v3-2-ce5ee1073208@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:16:05 +0000
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
- [Low] dt-bindings: phy: qcom,snps-eusb2-phy: duplicated Nord if-then
  conditionals
--

commit 13c4e9b2c7f49f0e94267a2da3fb8460b96d9170
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock

This commit drops the qcom,sm8550-snps-eusb2-phy fallback for
qcom,nord-snps-eusb2-phy and requires a second "bus" clock for the Nord
AHB2PHY bridge while keeping a single "ref" clock for other compatibles.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.ya=
ml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index 931cd0e7d297e..40c0b8b42182d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml

[ ... ]

> @@ -77,6 +82,24 @@ allOf:
>        required:
>          - resets
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,nord-snps-eusb2-phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:

[Severity: Low]
This isn't a bug, but now that qcom,nord-snps-eusb2-phy no longer falls
back to qcom,sm8550-snps-eusb2-phy and differs in both clocks and required
resets, could it be split into a separate binding schema or at least have
both allOf conditionals for qcom,nord-snps-eusb2-phy combined by moving
required resets into this else branch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-qcom-nord-=
ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com?part=3D2
