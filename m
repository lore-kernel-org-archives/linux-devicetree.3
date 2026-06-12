Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB2317153
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255776; cv=none; b=H2m0VzpfEEPbwXWaD77uAUaERQqaZW0fLHRIwLdy16nN14RS8QbiTn4N/yVswo5rHIIU3c79Qvj8c1yUs0jzWs/mqhAurx0qQBx/QKwleN1sTG33wre8EsJaExeJDfLjIHxFpvZXKI8SZ1meAgjTv9+qqXdQZ5GSmOLuIme3TYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255776; c=relaxed/simple;
	bh=MB9DZZAaZWkRym+gxsvhHbmurddSv9+gCVRqxRGwnlo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F37EgwTQV3u2iIO8n1ZOIZ5aSEU+g8WTDD9n00zr/tv6hQa8bzBaRndnapJyhvrFLDQZFLsrZUssdJT1oHHl1Y/bn1igD03UpS0zSsufAVDEJpNXdxqxewdrH5fcjxLTKRoCsZZeGjY6t/yQrXl1vK9oZEyUvwrwPf01GD2whaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCVu0JCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCVu0JCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E963C1F00A3A;
	Fri, 12 Jun 2026 09:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781255775;
	bh=pYDYrXiAUH/HVRCUgg/cj1aGE3isuJIHiuZ5T/Nho2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCVu0JCac3emMbHn3BUvO6BnHvRFPD75Kn0ktxbck/H2BQjxxbNll53fxQk/ASJEW
	 TFu5RzhmotaLCG2IZ1GOBGAOa+jCDTxCsYBlFPwrXV225mfSTCHHmij5Uq3o8eJCeO
	 xMv4lc2W8MFiug66T13ubr7PSpJf179swUFlzeCg187bEy6zlwQtbFZN5uObKX24lm
	 8fTQ6/pLidVXjNdwq20UPPwrfzqXfcV1nLboSxj8kzYzBsoCrarL/LFa2tPC/IrvON
	 kTjI+pg5bCG2YgdjxWZs3x6dOp9NircdQuUMxBhT1nsC4eDJ/xAYwZ5IiBjbwRntAs
	 iQMfhgwFrdP7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260612090426.23403-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 09:16:14 +0000
Message-Id: <20260612091614.E963C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing Compatible String in Conditional Block for 'qcom,pmk7750-gp=
io'
- [Low] Missing PMK7750 PMIC parent node in MFD bindings
--

commit 4f1189e771b6e33f2285b6ec22e2635e18bc5718
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yam=
l b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 386c31e9c52b8..5ecf5da3d1000 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -15,79 +15,84 @@ description:
> =20
>  properties:
>    compatible:

[ ... ]

> +      - items:
> +          - enum:
> +              - qcom,pmk7750-gpio
> +          - const: qcom,pmk8550-gpio
> +          - const: qcom,spmi-gpio
> =20
>    reg:
>      maxItems: 1

[Severity: Low]
Does the allOf conditional block for qcom,pmk8550-gpio need to be updated
to explicitly include qcom,pmk7750-gpio?

Looking at the existing conditional blocks further down in the file:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,pm8018-gpio
              - qcom,pm8019-gpio
              - qcom,pm8550vs-gpio
              - qcom,pmk8550-gpio
    then:

Since qcom,pmk7750-gpio is compatible with qcom,pmk8550-gpio, should it also
be explicitly listed in these constraints to ensure schema validation remai=
ns
complete?

[Severity: Low]
Does the parent PMIC qcom,pmk7750 need to be added to the MFD bindings in
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml?

The MFD binding strictly enforces exactly a two-element array:

  compatible:
    items:
      - enum:
          - qcom,pm2250
          ...
          - qcom,pmk8550
          ...
      - const: qcom,spmi-pmic

Since qcom,pmk7750-gpio is added here, will device trees fail schema
validation for the parent PMIC node if qcom,pmk7750 is missing from the
enum in qcom,spmi-pmic.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612090426.2340=
3-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
