Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B90441600
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422008; cv=none; b=nh3IwPGb7xI7KGdW+kLA+J+OG77HoJVHggJ8W8gp094acX82kyrswAW4NBVx0Yh6dJha3c0Ad/fAuxXxUwTXkMa/3IAnXDGrc+t4NUggFmHEjPdDcwhF4PzFkrn+nadf94eDNhKcoigEhR/XIieRiH6j4g5URydRnCj1AcB6vgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422008; c=relaxed/simple;
	bh=53dUPOGtMTdKmDexw5aAa5qqfcFZRfWYTJMbXsvu+mQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kbDWIX3y9CTF2nES0Hu7bqJ3VtglHrLbWDIz+GpGF4qIpQy1bytopSl1lM74elQozO15W07Ie8ycV06scG4RapiwGIBxyVuiEDjo/YYCsuqAICJZZ6q6/MVyQ7X3vKs2HioU9sHOHPctr0ZWhzyy1Xycy1I/KvlC0cmD44emVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChklVWRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChklVWRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368671F000E9;
	Thu, 30 Jul 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422006;
	bh=jDGqA9OLIzwP/f6D/7b6USQ0/qeaV30b9h4d0Wxh8N0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChklVWRHIVvAl+fMRxnmcnvPQ0TWZqkx29afSnNgJgD0c5WieZ1PFwBZAGHbrgzrN
	 IkyD8r66xQhaL5+GXlwvjuIa+kHQ6lQQl4JH/DLvfESh/HoXhoB7b96j1ENRabrXtv
	 3zVedvoTvBu7rirq+F6iIvPfbzrIJBUnhOUHawJikIJucL7fhKThHA7zBZIs97gKpp
	 RbMtyNggLKz9w6fFC/ToiaZr1E8VGt0Vo4AJu2p1Q+RQQpPXXG5CJMHTz6iYUrfw9X
	 O0ivppxz022oyiggvJbJoAh6PNhvL10EoxR8GLV1cmMyNCDKHUA5xQ0hGNOQcvkbWD
	 skWmBM1fcFdKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260730-topic-usb4phy-v3-1-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-1-ccf0f7ea98b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:33:25 +0000
Message-Id: <20260730143326.368671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `clock-names` definition for `qcom,x1e80100-qmp-usb3-dp-phy` i=
mplicitly makes the 5th clock mandatory, breaking validation for existing d=
evice trees.
- [Medium] The `p2rr2p_pipe` clock is artificially restricted to the X1E So=
C, preventing other USB4-capable SoCs in the same binding from modeling the=
ir hardware correctly.
--

--- Patch [1]: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1=
E description for USB4 ---
commit 86283e120a292e73e741d8fc0d233382e691770a
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4

This commit extends the X1E USB3/DP PHY bindings to support USB4 mode by
allowing an additional clock (P2RR2P). It adds conditionals to handle the
differences in clock requirements between earlier generations and X1E.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> index 4eff92343ce4f..18930eb96bdfe 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml

[ ... ]

> @@ -187,21 +182,59 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,sc7180-qmp-usb3-dp-phy
> -            - qcom,sdm845-qmp-usb3-dp-phy
> +          contains:
> +            enum:
> +              - qcom,x1e80100-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:
>            maxItems: 5
>          clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: p2rr2p_pipe

[Severity: High]
Will this break device tree validation for existing x1e80100 device trees
that only provide 4 clocks? Since minItems is not explicitly set in this
local subschema, dt-schema will automatically set minItems to 5 to match
the length of the items array. Should minItems: 4 be added to this block to
preserve backward compatibility?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-qmp-usb3-dp-phy
> +              - qcom,sdm845-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        clocks:
>            maxItems: 5
> -    else:
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: cfg_ahb
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,x1e80100-qmp-usb3-dp-phy
> +                - qcom,sc7180-qmp-usb3-dp-phy
> +                - qcom,sdm845-qmp-usb3-dp-phy

[Severity: Medium]
Does this artificial restriction to maxItems: 4 for all other compatibles
prevent other USB4-capable SoCs (like sc8280xp) from correctly modeling
their hardware?

If they share the same USB43DP hardware capabilities and available clock
lines, they will fail validation if a developer attempts to add the
p2rr2p_pipe clock to them in the future.

Could this be structured to allow the 5th clock on other identical hardware
variants?

> +    then:
>        properties:
>          clocks:
>            maxItems: 4
>          clock-names:
> -          maxItems: 4
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-topic-usb4=
phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com?part=3D1
