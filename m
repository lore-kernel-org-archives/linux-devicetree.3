Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51D4D599C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405922; cv=none; b=VcIYdWgMeoXonl6Ktd9BOBTswzAjhdxySB/y91fXR0sQlyITrVZKXhpGo36yl+uuOmWuVSr2ZLa/gj3mbeFnX0b8O4Wqkn12foCWBZ1TrlS9A8JS3fvjV6U+zlXvu6ElkRSX7LybkAHCE73Ye3KVU02Jlmp7+Wgnpqv32ZgDmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405922; c=relaxed/simple;
	bh=uefN6EBMUSzi+85BkUHzKvWmaAjuiUcnmOiDMtuy4BI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WwGPgCAcys9LPURPN9q+g5NGp+qsTCbL4Tlx6kkwiItykaQ+zYT8gOKp3DzonvkEoo6/BQHyEdnafnv6ipW1xtjPrcD4Te73QEirYdQc/QOp0Lz7eAg7F1FMRhfZpEuSGOW/arkRiZTzOfCHPZTYfojFH5ziVWuqLZGJXQZY37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivsNozIW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivsNozIW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEB81F000C5;
	Mon, 19 Oct 2026 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792405920;
	bh=DiTjFIHjZ6vKemtcsuLK/LW1ci/dx5xaoFYs/CQcltI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivsNozIWW+ElVFurs7MvJjooI31r8pBjtAvtog2U613OKXNCHFSBZxQOtfan5+aDw
	 u6iOEwn8UlrLvxVVu1nbALnNi8uW6vgYx/YrpZme4RySihWHJn05CmLxcIGh8ONDmN
	 zKbIPnZBpHrkW/HQfKesPM8EOj/9WJNwFspwwK/zSp0d5Mc5XUxyvK8R434NJjBR6T
	 +5VIl70JdKXIUs2ZCisZcjZwj/MfaIKhR5tK7H5H6O+veeuxMtyPVnO+1RsRJKesO6
	 jQp6QpuToOYglJFhvsTPrYhl1mZf/KUs31P2kDkdakEcxH0Qr0nYvUeS7VYDsxD+17
	 AnQFEWjuXrQRg==
Message-ID: <sashiko-outbox-176992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Watch FE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-for-next-lucky7-v2-5-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
 <20261019-for-next-lucky7-v2-5-c4ecab4b1c4c@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:32:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: exynos: missing Makefile entry for exynos5515-lucky7=
.dtb
- [Medium] arm64: dts: exynos: undocumented and unsupported samsung,exynos5=
515-wdt enabled
--

commit 0d8def366a8d338fb8397be7ac629d0ddc3e5c1d
Author: Aiden Isik <aidenisik@member.fsf.org>

arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE

This commit adds the initial device tree source for the Samsung Galaxy
Watch FE (SM-R861/SM-R866, codenamed lucky7) based on the Exynos5515 SoC,
with support for memory, reserved memory regions, and the bootloader
framebuffer.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/arm6=
4/boot/dts/exynos/exynos5515-lucky7.dts
> new file mode 100644
> index 0000000000000..e80a0f0948cb7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Watch FE (lucky7/SM-R861/SM-R866) device tree source
> + *
> + * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos5515.dtsi"
> +
> +/ {
> +	compatible =3D "samsung,lucky7", "samsung,exynos5515";
> +	chassis-type =3D "watch";
> +	model =3D "Samsung Galaxy Watch FE (SM-R861/SM-R866)";

[Severity: Medium]
Should arch/arm64/boot/dts/exynos/Makefile also be updated to include
exynos5515-lucky7.dtb under dtb-$(CONFIG_ARCH_EXYNOS):

arch/arm64/boot/dts/exynos/Makefile:
dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
	exynos2200-g0s.dtb		\
	exynos5433-tm2.dtb		\
	exynos5433-tm2e.dtb		\
	exynos7-espresso.dtb		\

Without an entry in arch/arm64/boot/dts/exynos/Makefile,
exynos5515-lucky7.dts will not be compiled into exynos5515-lucky7.dtb during
make dtbs, and both exynos5515-lucky7.dts and exynos5515.dtsi will be
skipped during make dtbs_check schema validation.

[ ... ]

> +&oscclk {
> +	clock-frequency =3D <26000000>;
> +};
> +
> +&watchdog {
> +	status =3D "okay";
> +};

[Severity: Medium]
Will enabling the watchdog node here pass dtbs_check or bind to a driver at
runtime?

In arch/arm64/boot/dts/exynos/exynos5515.dtsi, the watchdog node is defined
with no fallback compatible string:

		watchdog: watchdog@10050000 {
			compatible =3D "samsung,exynos5515-wdt";
			reg =3D <0x10050000 0x100>;
			clocks =3D <&cmu_peri CLK_GOUT_PERI_WDT0_PCLK>,
				 <&oscclk>;
			clock-names =3D "watchdog",
				      "watchdog_src";
			interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
			samsung,syscon-phandle =3D <&pmu_system_controller>;

			status =3D "disabled";
		};

However, "samsung,exynos5515-wdt" is not documented in
Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml, nor is it
present in s3c2410_wdt_match[] in drivers/watchdog/s3c2410_wdt.c:

static const struct of_device_id s3c2410_wdt_match[] =3D {
	{ .compatible =3D "google,gs101-wdt",
	  .data =3D &drv_data_gs101_cl0 },
	{ .compatible =3D "samsung,s3c6410-wdt",
	  .data =3D &drv_data_s3c6410 },
	{ .compatible =3D "samsung,exynos5250-wdt",
	  .data =3D &drv_data_exynos5250 },
	{ .compatible =3D "samsung,exynos5420-wdt",
	  .data =3D &drv_data_exynos5420 },
	{ .compatible =3D "samsung,exynos7-wdt",
	  .data =3D &drv_data_exynos7 },
	{ .compatible =3D "samsung,exynos850-wdt",
	  .data =3D &drv_data_exynos850_cl0 },

Additionally, if the hardware is compatible with an existing two-clock
variant such as "samsung,exynos850-wdt", both
Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml and
s3c2410_get_wdt_drv_data() in drivers/watchdog/s3c2410_wdt.c require the
samsung,cluster-index property, which is not present in watchdog@10050000.

Should the binding and driver support (or an appropriate fallback compatible
and samsung,cluster-index property) be in place before enabling &watchdog?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-for-next-l=
ucky7-v2-0-c4ecab4b1c4c@member.fsf.org?part=3D5
