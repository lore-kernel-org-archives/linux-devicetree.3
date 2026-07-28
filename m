Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F20241DDEC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233929; cv=none; b=M+/X4ZkYgdNE9jIRFS9+niuLDqrywoT2JLQUqeZInizx/aUyqQsTHyes7bgqxrcjvWuYCOgBFaHjDuc3cPkfW7SZxQLbfy5z1o3QggihB4D0uEnVhe1M+ITadnEZeKJ+7O/Vf2775rVad6okBqy8Ryln26RMTTuRo4WkNP5yZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233929; c=relaxed/simple;
	bh=FggYYw61Kz7uIM9UHFCnamEP8OQ/fDKAp5ENOQADg2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CgHlnt40WkZqXOlJ+0B4nIMBsv9mG1l0zo/ZABdoBW9CZNorQbdM8VB0drmv/Y+/wWLTDWHIhnxnF2mR+GgLZdEiN4hViZJY07DZ2vy22EcEkZTMnjGR5lbBLtT3mmLwVgU46J8scu6XCkT0Ush5H9g508UWi4cUYtBPTWZS/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/cxOxfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/cxOxfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A581D1F000E9;
	Tue, 28 Jul 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233928;
	bh=5v+IuzVrb1HoJs5cUntZRspFCkDkXzZfZPwaeHJlO7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/cxOxfmtYPz7+bMwBKQD6y8wWY51BsqRspJQ3BUTxBoFOkGPSuOEN/seVZ1w874B
	 fZdq/vNHxeqwz6STL6HlpKDnJD8pmbgtsnvhvQyu06S80GYXfnWxPEncedYn0Xhbfw
	 n1x6EFDUjikRy/EA6J3qMYrG/wqNsT/46MaRhlxQFji8Nu9o+Ab3L8lYBY7qnU04A1
	 TyAX9UqzSx5QLZ3tS1y1OkrOz4IE213IGxj6hjCDni8dg4T89WCBMqeexpXC/6OxeS
	 i4+tVUdIMj46RonnjS+mD+S4WuaoA1OCV+hAdt38rR6fURf3R1ZcA1rNzioC9trjk/
	 m5DtOspYpIeLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260728-topic-usb4phy-v2-1-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-1-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:18:47 +0000
Message-Id: <20260728101847.A581D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `maxItems: 4` constraint for `clock-names` in the fallback =
`not:` conditional block.
--

--- Patch [1]: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1=
E description for USB4 ---
commit 95918238514fdc86a985725a4371c68f557aeda3
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4

This commit extends the X1E USB43DP PHY binding to allow a fifth clock
(P2RR2P) required for USB4 mode. It updates the top-level clock-names
constraint and adds conditional blocks for specific compatible strings.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml

[ ... ]

> @@ -187,21 +182,59 @@ allOf:

[ ... ]

> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,x1e80100-qmp-usb3-dp-phy
> +                - qcom,sc7180-qmp-usb3-dp-phy
> +                - qcom,sdm845-qmp-usb3-dp-phy
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

[Severity: Low]
Does this omission of maxItems: 4 for clock-names allow an unconstrained
fifth clock name to silently pass validation?

Since the top-level clock-names property was updated to maxItems: 5, replac=
ing
maxItems: 4 with an items array in this fallback block without retaining
maxItems: 4 means the schema inherits the 5-item limit.

A device tree with 4 clocks but 5 clock-names for a non-X1E/SC7180/SDM845
variant would pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-usb4=
phy-v2-0-5d9dd5149ec7@oss.qualcomm.com?part=3D1
