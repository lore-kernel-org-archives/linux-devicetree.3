Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F423A3FDBE2
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926332; cv=none; b=B/p4jiL1KhRnzI9hzt64dL0kzk4XtWWCjEtkl5p6A72x3wPmw4o54/zyINNgOEcA5fXgoHqIh53a+FJCuERXjdvbciRHpftWpmtLiKqnr+4U3qpJru4eDEyXJsMdHMr2Izszur59FwtmMLP4VNTpxnT9Vvrjx9+XWONMrrLgrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926332; c=relaxed/simple;
	bh=CChB/wVrXrdoqOtyDL4lTy27YOi1TPtXtMZnmPESIQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ucHyyFIuSAPqCJHeIKc37uljzpAAdzCAefMK6yOA2Ij82YVkKopGlN+/x4Kr2dhMZCUYw39+lgreu3H4orXVZd70AS4T0HSLdw1Iexj+eEkqSOhj9YLEGlwMYOvJJaWb7wxEpEOgmcrIiEbCmYOgg6uhEpcm7jZ/pl+lTeUlqSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdzWLvlO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdzWLvlO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EFC1F000E9;
	Wed,  5 Aug 2026 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785926330;
	bh=JTcjtf11NmTpVTUSWpKDhAoAOqaEySFPuX+jw9MA7gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YdzWLvlOjDzWEeWhXG+swJuSiISK3WAUy3Bv5YDh5JLRhV/BnhTbFPKDdL7ILAXqs
	 eIBEygBNslttyU0D4u0KGJLVqkEtSbzY8/tETHBgYRMFUzPUcaMieybTZZaWZPF2wL
	 XGxRRM/x3OGAiiZZxNfQnELK2hGC1qgWjJHHGuvhKqu+SwQ9VZtBm85ETF4YmpS4BE
	 BWh2rYAKdLEprIZ6pn6jTZaUGZ7AE/VskTUYJ5T/wD01+WSTiZdFGPxJr0QCVhNZAy
	 vLSvWgoFdfzwldKLesE/jpyqd0L+NvfA1fMHR7jqlIBfh7M5fw5cIkBwrhSHA/zipi
	 pRdXj4hKNPBdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanjie Yang" <yuanjie.yang@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:38:49 +0000
Message-Id: <20260805103850.50EFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Renaming device tree compatible strings in the YAML schema wit=
hout updating the corresponding device tree (.dts) files breaks schema vali=
dation and ABI.
--

--- Patch [1]: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT S=
OM compatibles ---
commit 86746ff462577b3f827d2ec7f0eb293389e741dc
Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles

This commit updates the compatible strings for the Hamoa and Purwa IoT
SOM platforms in the device tree bindings. It renames hamoa-iot-som to
iq-x7181-evk-som and purwa-iot-som to iq-x5121-evk-som to match the
official hardware documentation.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862d..f244f547d5114 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1220,7 +1220,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,hamoa-iot-evk
> -          - const: qcom,hamoa-iot-som
> +          - const: qcom,iq-x7181-evk-som

[Severity: Critical]
Does replacing this compatible string break device tree schema validation f=
or
existing boards?

Since the corresponding device tree files still use the old compatible
string, running make dtbs_check will report that qcom,hamoa-iot-som is
undefined. For example, in arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts:

	compatible =3D "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";

Also, does removing a deployed compatible string without retaining backwards
compatibility break the device tree ABI for existing bootloaders?

>            - const: qcom,x1e80100
> =20
>        - items:

[ ... ]

> @@ -1235,7 +1235,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,purwa-iot-evk
> -          - const: qcom,purwa-iot-som
> +          - const: qcom,iq-x5121-evk-som

[Severity: Critical]
Will replacing this compatible string also break schema validation for the
Purwa IoT EVK board?

Similar to the Hamoa board, arch/arm64/boot/dts/qcom/purwa-iot-evk.dts still
uses the old string:

	compatible =3D "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";

>            - const: qcom,x1p42100

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-hamoa-come=
-v3-v3-0-20463c43eae1@oss.qualcomm.com?part=3D1
