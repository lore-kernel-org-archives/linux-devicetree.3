Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4422E3F0
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338725; cv=none; b=joaMhxJvg5mtNfMxdLMHXB9gSjWP6/C3wJ7TuMvO9wRL1uja8hiR28AUu+Fit4iRuAKuPVK7lvZzjGAuiVPGmZnDjCO1pL1IMbWR/ORpzrMSF4ctPeII/a5YeEDfIqf4H2k12UVMSYOJzd9RS2dl2kOghuap+vM2aQ8Hf4i7RBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338725; c=relaxed/simple;
	bh=iw97sxzYbTybiupRkh21HPZzZwmlYlUMDF/3+oVXhEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdryWGcLYBDDWnr5xJnA/E3yytHDDI5vlPXbSaV7u/I0Lr0ed+URpm/zqXqk5m/EBNRxq6zl9+P+StQBIILf+ECmR0D+XTWZ54QFg0QXJLXFmmYUmMa4/X+LHcyDSrZh6SKUoxsOrcGufOZa1GfXGB27aS9DMkEfI3m44DugvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFFQlHZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFFQlHZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27731F00893;
	Mon,  1 Jun 2026 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780338723;
	bh=Q5mnRsW3BclITIBB0JIY4x/5VvTxRWEiKjD4vjhDr64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFFQlHZtQQVeSzcY7myaxgX6+UEEztgAEuovumvTfFUKLiGA7PHQu0NRdDP8OIECb
	 RfLAP1P5q/WgZecaFu7DuNtksyrw7Ls/6OTtAShe5pWSYOg0FN0U8V8+7G5O0SkkuA
	 +NZVUKfLr86gVk3ZijVw2SJuE9NX4C/YmmpYvVJOrBIQ55McDV07Gc/ADbWhLIKcRn
	 mzy6+VWI4B30QwfXn9q9ukfjFf3BwHyBk+DnW51o7iXipVPkF1VNc8COgp4UBYpvSt
	 DY46XA8r9UENPK4Buwr6fY/Ue+OtizLdYnw3sL61mZkB0prtQsCznW6mGqzMReJmk8
	 RiyJ/fewoPM7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-2-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-2-61c1ba3735e8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:32:03 +0000
Message-Id: <20260601183203.A27731F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding new items to the 'clocks' and 'clock-names' arrays without =
specifying a 'minItems' constraint breaks backward compatibility with exist=
ing device trees.
--

commit 85e4a2f46a61d48ee9c66caba34fbc7a3fa61a61
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
   =20
Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> --- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -25,8 +25,11 @@ properties:
>        - description: Board active-only XO source
>        - description: GPLL0 source from GCC
>        - description: GPLL0 div source from GCC
> -      - description: Byte clock from DSI PHY
> -      - description: Pixel clock from DSI PHY
> +      - description: Byte clock from DSI PHY0
> +      - description: Pixel clock from DSI PHY0
> +      - description: Byte clock from DSI PHY1
> +      - description: Pixel clock from DSI PHY1
> +      - description: Board sleep clock

[Severity: High]
Does adding these items to the clocks array without specifying a minItems
constraint cause a regression for backward compatibility with existing devi=
ce
trees?

The commit message states "This is an ABI extension", but in dt-schema,
specifying an items list for an array implicitly sets both minItems and
maxItems to the length of the list unless overridden. Expanding the clocks
list from 6 to 9 items without adding minItems: 6 will result in dtbs_check
errors for older device trees that only provide 6 clocks.

> =20
>    clock-names:
>      items:
> @@ -36,6 +39,9 @@ properties:
>        - const: gcc_disp_gpll0_div_clk_src
>        - const: dsi0_phy_pll_out_byteclk
>        - const: dsi0_phy_pll_out_dsiclk
> +      - const: dsi1_phy_pll_out_byteclk
> +      - const: dsi1_phy_pll_out_dsiclk
> +      - const: sleep_clk

[Severity: High]
Similarly, does the clock-names array also need a minItems: 6 constraint?

Without it, the schema will strictly enforce that all 9 clock names must be
present, which might break compatibility with existing device trees that on=
ly
provide 6 clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-dis=
pcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com?part=3D2
