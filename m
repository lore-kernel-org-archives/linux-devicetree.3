Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25F3B6C16
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744785; cv=none; b=lqdbc89BBqj0a/WGlpKWBKtmmIx6JYIeT9P0NhE1lPZs8bkQjzDugGwPIAjGYAWs2xlc34OTchEn6NRC2uTZ+HOB6uHgs/XRO+6CGr62t0m8Wpfw5+qHJ7REsgauuTYAXByL5Vpde2z/dLPmD8TNnYkKvAyApVwqAw2KTvI4+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744785; c=relaxed/simple;
	bh=rsEyCYfaJXRIK/DP4ZF0hlH18mSArjU0HP0c7J5+gK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fP4FaIrs9OvSWK7rYoSNAB45po8fBZJi7sUCRsBrrDPY+xLZkgmCwb6zNvnSB7GpSeD+U3l0RL63B3vXup1UGhm1aBlXB3xutSegG3acDOiKwI9I5iHqTnxgvPtOXqCfmeLZ+OJ5qZv1SfjJbHK2fK9eTY7EjnQdGpYzoBK1wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9nIzljX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9nIzljX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BECA1F000E9;
	Wed, 26 Aug 2026 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787744783;
	bh=bsGNMvRxMjlQJ8o90+JyviLsHwnh2qQ1sDFr3+1wwZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9nIzljXkt3OT80fqNPzdgmOhnUrUI+H9hZiBJKeataTAilnn43lI5j9dufVmpWAy
	 WI1AjfFrFLMCjmPBfW0EqYhQkE7uHvnWRDpQhdIIB3BfsoZolddbmVUjQHqEJG/7uG
	 D0EBSF+b3YQhy8CiYby4hlHFrOSJFy0zzTtRIlWvxCDGrK+hPAFq7jgGNewzwRXnHl
	 7ljcycm8baEBrUVSQHjf2hAhlqF1oA3SZiI8LcFOnESOBqcAYCpYb5iQx6hGrzngp7
	 AzNyMQcObDzrvI3QibtQqejBfR4ueR4I3mSAHloHv402i6dyVTY8z46+Hxiyg8jhXn
	 mn1X7KSKPZJhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI
 support for eMMC via overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
 <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:46:22 +0000
Message-Id: <20260826114623.4BECA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The eMMC device tree overlay creates dummy fixed regulators instea=
d of referencing the existing PMIC RPMH regulators.
- [Low] Unused device tree binding includes in lemans-evk-emmc.dtso.
- [Low] Inconsistent indentation in clock and clock-names assignments.
--

commit 093f95690ab8c3394206ae0a37d52aa9b43fdb76
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding address space
and resources for eMMC.

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/b=
oot/dts/qcom/lemans-evk-emmc.dtso
> new file mode 100644
> index 0000000000000..52739d39a1ff8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-gcc.h>

[Severity: Low]
Are these include directives necessary? It looks like the definitions from
these headers are never used in this overlay, which might just add
unnecessary code clutter.

> +
> +/ {
> +	vmmc_sdc1: regulator-l8c {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg-sdc1";
> +
> +		regulator-min-microvolt =3D <2960000>;
> +		regulator-max-microvolt =3D <2960000>;
> +	};
> +
> +	vqmmc_sdc1: regulator-s4a {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vqmmc-sdc1";
> +
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +};
> +
> +&sdhc {
> +	vmmc-supply =3D <&vmmc_sdc1>;
> +	vqmmc-supply =3D <&vqmmc_sdc1>;

[Severity: High]
Does wiring the SDHC controller to these dummy fixed regulators prevent
actual hardware control?

By defining these fixed regulators instead of referencing the real PMIC RPMH
regulators (vreg_l8c and vreg_s4a which are already defined in the base
device tree), the kernel might not issue the actual RPMh commands to enable,
disable, or configure voltage for the eMMC.

Could this cause initialization failures if the bootloader has not
pre-configured them, or lead to power management regressions during
suspend/resume where the kernel incorrectly assumes the hardware is
powered down?

[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3acb..9f54d69c1be63 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
[ ... ]
> @@ -4311,9 +4313,11 @@ sdhc: mmc@87c4000 {
>  					  "pwr_irq";
> =20
>  			clocks =3D <&gcc GCC_SDCC1_AHB_CLK>,
> -				 <&gcc GCC_SDCC1_APPS_CLK>;
> +				<&gcc GCC_SDCC1_APPS_CLK>,
> +				<&rpmhcc RPMH_CXO_CLK>;

[Severity: Low]
This isn't a bug, but is the indentation on the newly added clock items
meant to align with the first item in the list? It looks like it is slightly
misaligned compared to the original styling in the block.

>  			clock-names =3D "iface",
> -				      "core";
> +				      "core",
> +				      "xo";
> =20
>  			interconnects =3D <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826113206.4889=
91-1-monish.chunara@oss.qualcomm.com?part=3D2
