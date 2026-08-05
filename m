Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C93F9294
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926251; cv=none; b=LrGmJmNmoJWFSNmHWer6v+O+G8Yu8he2o1Jzyzv+a5RhpCzcfcPumuh+Zr6qH+LvJO/G8EosA1kK8SodSOot1LMAprCEM4n6g/HDaDHxPfdSqHjBu2/pHZnlKLlCHJu1cztOxf5nrEdZsXlxUCh605dcfQK34RJydobW3Rc8aUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926251; c=relaxed/simple;
	bh=dGVxECQsr2QA3MERJioY2OUW5S3HwyuZLFMhXVAVIWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q+Q9Mu6oZR0LcVZje4GtLObu2lnWqeqCpy/h8FJVUZHLvlXwebQz4GsJDJyvNw1sAU+6r9rXli7+U9uSZucm8PpRYl/Y2VzrH/xE3r2cTLRBgY6tFx7trYMhxsQIEewJq7UzjQKmz0C1X5AmBcB9Xp1KOXlomvP5uvtpngl+nwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faDPyxLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faDPyxLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5482A1F00A3A;
	Wed,  5 Aug 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785926249;
	bh=yEFpFPoGnshV9TDJGI0hDL2UqoOZTWVxrrbhcOknNVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faDPyxLnsO4HxIFR5BLdDMOvlUOJXIar+bLqeZtpiY+nxgBXD/oKIkCIpMGBIMbGF
	 7cbaB/akVngYCw8NEesLd1bhUxz8wxnsj7wzggnORueLmfcofiE3YOQx/U8AVLGJ6O
	 LxCSRDLSG77YkqzNZVbcAZumHWHsoKVkyMlmM+pEU7qzi3u71AyjHZJBhvF2ncabH3
	 tDK5KZ0SJFxqtzUS38Noa9brory6vZTdyBa2tp4ywo674/lpkxOgrcfVJWJYjoX5VT
	 O4KCC5LnxjmhIBP1uykEvnQJF5u1iUz2qPJdemvi/BBKSczG29ebUdQVIzncrgMkLx
	 ELfBKIZ8kAZSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanjie Yang" <yuanjie.yang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-hamoa-come-v3-v3-2-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-2-20463c43eae1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:37:28 +0000
Message-Id: <20260805103729.5482A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing existing device tree board compatible strings breaks back=
ward compatibility with bootloaders and userspace.
--

--- Patch [2]: [PATCH v3 2/4] arm64: dts: qcom: fix PURWA/HAMOA IOT SOM com=
patibles ---
commit 13bd2c46e7d398444043412a0d95ccdf1938980f
Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

arm64: dts: qcom: fix PURWA/HAMOA IOT SOM compatibles

This commit updates the compatible strings for Hamoa and Purwa IoT SOMs to
match their official IQ product names. It removes the undocumented
hamoa-iot-som and purwa-iot-som strings from the DTS files.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438ec..b807079a5ee22 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
[ ... ]
> @@ -6,12 +6,12 @@
>  /dts-v1/;
> =20
>  #include <dt-bindings/leds/common.h>
> -#include "hamoa-iot-som.dtsi"
> +#include "iq-x7181-evk-som.dtsi"
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> =20
>  / {
>  	model =3D "Qualcomm Technologies, Inc. Hamoa IoT EVK";
> -	compatible =3D "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e801=
00";
> +	compatible =3D "qcom,hamoa-iot-evk", "qcom,iq-x7181-evk-som", "qcom,x1e=
80100";

[Severity: High]
Does removing the qcom,hamoa-iot-som compatible string break backward
compatibility for existing bootloaders or userspace tools?

Since device tree bindings are generally considered a stable ABI once
released, older bootloaders and userspace scripts (like fwupd or systemd)
identifying the board via qcom,hamoa-iot-som might fail to recognize the
hardware after this update.

Should the new IQ product string be added while keeping the old string
as a fallback?

>  	chassis-type =3D "embedded";
> =20
>  	aliases {

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot=
/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d..d2963af1d762d 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
[ ... ]
> @@ -6,12 +6,12 @@
>  /dts-v1/;
> =20
>  #include <dt-bindings/leds/common.h>
> -#include "purwa-iot-som.dtsi"
> +#include "iq-x5121-evk-som.dtsi"
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> =20
>  / {
>  	model =3D "Qualcomm Technologies, Inc. Purwa IoT EVK";
> -	compatible =3D "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p421=
00";
> +	compatible =3D "qcom,purwa-iot-evk", "qcom,iq-x5121-evk-som", "qcom,x1p=
42100";

[Severity: High]
Similarly, does the complete removal of qcom,purwa-iot-som here violate
the stable device tree ABI policy?

Bootloaders and userspace tools relying on the previous string will no long=
er
recognize the board.

>  	chassis-type =3D "embedded";
> =20
>  	aliases {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-hamoa-come=
-v3-v3-0-20463c43eae1@oss.qualcomm.com?part=3D2
