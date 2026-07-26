Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4EC2BB13
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090567; cv=none; b=SpK/X5UJqN3y28NDAGvpSB56LxLQYiU1VTYZJZEDtp0xKUTXRq1qUv3kvFjQmsydrZtImqsXV/TKUT1ZBOTOD/ERoyJZzK34FKvseNjzg9WZyDFCVHS4t2RnKFsucF+ts604my5OiKoU4sO/92o63UrVKthsMwy/Yb6KsBK245k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090567; c=relaxed/simple;
	bh=W4JjimOIIvZWwWLGdsNri56ChAb/aHeRBBzIODCtxDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uc6RkPY3x4zGq8ph9ZooeRbrfvQOGlUGe/QGJHijFoqBx/m3lUPWS/IzdkN7VHZYEKqW5Xq62aCIKoy+7m5EScYhmiOxc2xYS0QlXegE6BWcrTnKTRusifreWxH/MqqKkLos5xrPHe6Kf7zhfE7YUMpHztDtT+trHWHcEBU6BZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDrU2XCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDrU2XCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3911F000E9;
	Sun, 26 Jul 2026 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785090566;
	bh=l7897oFI/T/BGh2oKyI/gu+emz9tY2bJBzeD7LFTcP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDrU2XCeNQ80vyf/hQxzTFyD1QVrhIp6yaBtfwtBngB3h7Hsld8s+cCOsrk6+4fwt
	 EceNaM2hGAdJsz/ztvD+EPzOYAWTP2CItB+Cu9IsoJaH0RGkNTVQiaVQW4/rhWHGTJ
	 IV8NpZuP21eY9w8cyEmPTIdtyM9qkfE5W+KflQaYfC/lkWXhfJGRql+XWqXGokIh+e
	 HtZIwWanfAPEUWhk9zPnNP1ezXlZHnxj/ZJuQMlxPPTJ7xxUEyU/3r0tvlUxQ+7FW/
	 +n/Wjdl8xqdyuss0xaVGFbwRngaPe8k03OKJtkSExx5S9FNqx5vp0zgjIZVUwkzjWB
	 irt7Qb0tanpIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726182158.249449-4-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
 <20260726182158.249449-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 18:29:25 +0000
Message-Id: <20260726182926.0C3911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware pin multiplexing conflict on GPIOX_16 between the SDIO po=
wer sequence reset and the 32kHz PWM clock.
- [Low] The new DTB entry in the Makefile is inserted out of alphabetical o=
rder.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora=
 P1 ---
commit b7b88d4be9916c5079a86c04ae237d1db4d39b9b
Author: Alberto Robazza <robazza.alberto@proton.me>

arm64: dts: amlogic: add support for Orbbec Zora P1

This patch adds device tree support for the Orbbec Zora P1 board, an A311D
(Meson G12B) based board. It builds upon the ODROID-N2 device tree, adding
specific configurations for the AP6256 Wi-Fi/Bluetooth module and modifying
the LED settings.

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/a=
mlogic/Makefile
> index 57bc440fa55cc..95e9071e0885c 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-odroid-go-ultr=
a.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-odroid-n2-plus.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-odroid-n2.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-odroid-n2l.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-zora-p1.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-radxa-zero2.dtb

[Severity: Low]
Is this inserted out of alphabetical order? The list appears to be sorted
alphabetically, so should "meson-g12b-zora-p1.dtb" be placed at the end of
the meson-g12b block?

>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-s922x-bananapi-m2s.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-g12b-s922x-khadas-vim3.dtb

[ ... ]

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 0000000000000..fe20d39a82072
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> @@ -0,0 +1,103 @@

[ ... ]

> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks =3D <&wifi32k>;
> +		clock-names =3D "ext_clock";
> +	};

[ ... ]

> +&pwm_ef {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&pwm_e_pins>;

[Severity: High]
Will this cause a pin multiplexing conflict?

The sdio_pwrseq node requests GPIOX_16 as a standard GPIO for reset-gpios,
but the pwm_ef node claims pwm_e_pins, which strictly multiplexes the exact
same GPIOX_16 pin for hardware PWM.=20

When the second driver attempts to request the pin during boot, won't it
receive a -EBUSY error and fail to probe, breaking the Wi-Fi functionality?

> +	pinctrl-names =3D "default";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726182158.2494=
49-1-robazzalberto@gmail.com?part=3D3
