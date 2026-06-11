Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF03CC310
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176354; cv=none; b=VxfG6byhhe0kkn6liB9v3Xp5nEA5bin+fJtypcp663CJNGe9HCQ34wTTfAX5qD98hw+zZrgbjP3+OdiEDv7vABfBxpk/T4v82qA13eCWHhXsNq2XYXXWcEK0hLEumHeNh5jlFZt+o3TEwrNvHH3D6FCZoZu7iZ/5Qr5/iNS4Ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176354; c=relaxed/simple;
	bh=6Q8XEYowDamKhZEJl1jMbYPm2S4QcVljOltNzK66F3o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NgzRXxtKPxi8C/G4emvvdg831uuUr+AOkiNfwvbQZZYhJX2bU7aLbIOJiHoh9VQZIuu4CTTTcSqOf8S9j9pDU4DC7syp4ibdBEinNnEcDyGu2TkwHD3sNwk3Ai/ap43JC7/iOs2bSgBy2BmUiA3Xj/y1xHBz0xSjHmBoPKQYRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrxOlRpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrxOlRpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6541F00893;
	Thu, 11 Jun 2026 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781176353;
	bh=+Jwtc9egn3Vbr52qdphzeoow9rIKy5nNtZ/ihusrREg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrxOlRpeIdRngj1JyKErAXp1JK4crs3KNnW1TGT7geIJQSCsw41DuNJVket6PoKTu
	 3UDcn0gXOtK8VN8DEEcu0Fpda7sFdhVs7JiyYJjCOQRSADEfyxD7SxTREu+5TPCeLt
	 52omDYsKeJER0Yu1TWcV4CbUht3P0OzJJEBvDq1Eumx1uXG0drZgxUXtDBjkBRiyk/
	 j+dCi6s24fRjs4zkoELW2TvCRTi/g0uYPvZIHLujZo7p7Tt1Neg0ohp+dP3vv6wlwn
	 jgnV6PWjLW7V5pe6ltc/Wwd34RIAftBQW0ZrRUDmfn5LruenQmVKWogGJsF3KQc9L/
	 Z+2RS0goy3oxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 11:12:32 +0000
Message-Id: <20260611111232.EF6541F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding `qcom,pmk7750-gpio` to the standalone enum list without u=
pdating the corresponding `allOf` conditional blocks causes a schema valida=
tion hole. When used standalone, the compatible string bypasses generation-=
specific constraints (such as `gpio-line-names` and `gpio-reserved-ranges`)=
 that apply to the PMK8550 generation it claims to be compatible with.
--

commit c696fcf54d49ee1cd5093d304f55dcf2aa2358e3
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yam=
l b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 386c31e9c52b8..f656c836896f5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -15,79 +15,85 @@ description:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
[ ... ]
> +    oneOf:
> +      - items:
> +          - enum:
[ ... ]
> +              - qcom,pmiv0104-gpio
> +              - qcom,pmk8350-gpio
> +              - qcom,pmk7750-gpio

[Severity: Medium]
Since qcom,pmk7750-gpio is added here to the standalone enum list, won't
standalone usage bypass the generation-specific constraints (such as the
gpio-line-names limit) defined in the allOf conditional block for the
PMK8550 generation?

Should qcom,pmk7750-gpio also be added to the allOf conditional block
containing qcom,pmk8550-gpio, or should it be removed from this standalone
enum list if the fallback is always expected?

> +              - qcom,pmk8550-gpio
> +              - qcom,pmk8850-gpio
[ ... ]
> +      - items:
> +          - enum:
> +              - qcom,pmk7750-gpio
> +          - const: qcom,pmk8550-gpio
> +          - const: qcom,spmi-gpio
> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611110708.6923=
4-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
