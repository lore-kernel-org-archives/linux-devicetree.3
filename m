Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC63603EF
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601366; cv=none; b=kI9R5LYxZsZa8HS9Lqt9k/Xy7grStFyWJkFbbsytFIKWObYw2of/f5q30+sUOPOOuf18Z+bFuLANEJXx06JoqoImWMwgWrI3Y8wjb/GAxSbRwhPXRIjBcB7aNaWreUefDwpHLJUqO03DOBOFj6+2mZgbW6tqzWkSPXuReCQiWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601366; c=relaxed/simple;
	bh=74rvTNdE1gN+3wAtZnSCgNvp/IGJihHeLkPMRu3llZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=inbR4+v1A5pgYIqlwxNPicx9rgTrLqczzI/HC3PlnzkR/6Vc4v3nT6iTeAs8hS+w73RxpDU73qIuZw5W0J5n/tU9sZZTv9kFHw2WPcQeHtaPLofXxxo0Tsy7PsTZDzgpbwM10mUgaSv5ephOfnTGa6ddc6HYU6H2tYZ9IvgqFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wk6iwXJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wk6iwXJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0320B1F00A3D;
	Sat,  5 Sep 2026 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788601365;
	bh=9Cx5QYLtGYI2tx9y1neBZY8PgICg6VH36/waPZOrmBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wk6iwXJQDOYW2BW2+u+YlcbiaeWRcftf/Bew/lIGAYtlqAdaFiaakfPKUGiD6fAgY
	 qxKxKBVPTn//QtXs7Vob/I5RmhZeKIe20+VH1wv3Y5RHvCfrxBdFPHegKo9enIPT9s
	 Hfl2ynttOxo7n7a9CFtvhi8sq0EOYAEgQXhVFLfDoofubYYpZQrOBQlN5Bo1nVEjAU
	 PIUQ4PqG0DdI89133RGjJ8HJK2ng769D3WhbcVJeoecc6yvldMUY8zSkDVpS14HZQu
	 ew85axcNg1q3RPvUc+aBAR5k8Y/7QIejDveURbtUpuPsRJSH9Tk3/Lac9rHLFtYU8D
	 SJmArbOC2Bt5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 09:42:44 +0000
Message-Id: <20260905094245.0320B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The device tree leaves the `pmc8380_6_die_temp` ADC channel enab=
led despite physically removing the corresponding `pmc8380_6` PMIC.
- [Low] The patch inadvertently replaces the composite dtbs rule for `purwa=
-iot-evk-el2-dtbs` instead of adding the new board's rule alongside it, cau=
sing a build failure.
--

commit a1fbbf4379b4719283a1891d22cc069dc0b2dda9
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10

This patch adds the Purwa SKU of the Lenovo IdeaCentre Mini 01Q8X10. It
provides the Purwa SoC include, firmware paths, and removes the pmc8380_6
nodes that are not physically present on this board.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 6c2ac11133ca7..e6105e5790954 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -167,7 +167,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-sony-xperia-yosh=
ino-poplar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-xiaomi-sagit.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D purwa-iot-evk.dtb
> =20
> -purwa-iot-evk-el2-dtbs	:=3D purwa-iot-evk.dtb x1-el2.dtbo
> +purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs :=3D purwa-lenovo-ideacent=
re-mini-01q8x10.dtb x1-el2.dtbo

[Severity: Low]
Does this unintentionally remove the composite rule for the existing
purwa-iot-evk-el2 board?

Kbuild will fail with a 'No rule to make target' error when building because
dtb-$(CONFIG_ARCH_QCOM) +=3D purwa-iot-evk-el2.dtb remains slightly further=
 down
in this Makefile, but its underlying composite dtbs definition has been
overwritten here instead of being preserved.

> +dtb-$(CONFIG_ARCH_QCOM)	+=3D purwa-lenovo-ideacentre-mini-01q8x10.dtb pu=
rwa-lenovo-ideacentre-mini-01q8x10-el2.dtb
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D purwa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcm6490-fairphone-fp5.dtb
> diff --git a/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x1=
0.dts b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
> new file mode 100644
> index 0000000000000..9813a570cf690
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * Copyright (c) Jens Glathe
> + */
> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-lenovo-ideacentre-mini-01q8x10.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;

[Severity: Medium]
Since the physical pmc8380_6 PMIC is declared absent and its main nodes are
deleted, does the associated ADC channel pmc8380_6_die_temp also need to be
deleted here?

If the SPMI ADC driver (qcom-spmi-adc5) probes the pre-defined channel and
tries to configure it on a non-existent PMIC, it can lead to SPMI bus
communication timeouts and invalid hwmon reads. Should there be a
/delete-node/ &pmc8380_6_die_temp; added to this block?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-x1-ideacen=
tre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz?part=3D3
