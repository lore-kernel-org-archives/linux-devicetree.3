Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD43D669F
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781350629; cv=none; b=tfJjV90sTewpybgpXMsEGFU/siyLM6H+iFMid5W6LzvYUrMtJOrsh1dHq1WJJ+4Q+4GhEHn15NKb/QqHkOd651IlqRr8lYbVmrPJg15B171yTdXHZCKedYXzTSMOW2ZemxUaop9nih3t0OKL/o4w8czaBZIu6XFCvuOaELaDTXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781350629; c=relaxed/simple;
	bh=wlS7xKgyO+XyXN6dNATrd0asFAwdvMwxkQainFP9a4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsNnWieBx/rwdd6+UtL4S7m7BYp2TJ8Cm/gJjL2wKwQ2YMowjxP89LMzrfTD8GFdsp6/s62E/HlU+IAUBREkadlDoQiKPpuftftXX0M667ZubGnMFk1VdUJpQH+89vWkrPKh6ESwKBvmSdNwr07pehglZOfuKG13r8ZpbhLRtiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=absvLViK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="absvLViK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49222fb062bso5135565e9.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781350627; x=1781955427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=absvLViKKCQdYpmN4gX7HC7PrrRpRyY0+8L28FXUnGjKYg272Augc4WKsKs6Ypx9ez
         OjpiBFTiMvZJldSHV11rLu/F5zbejhrRIf4V+eCwfsAP6tzQ8AtcvwpK7HVQGrOkD6yk
         0029mC10yvqMrE+mDrdZ1fBi6GtOZum4XJwH4PPJ3nvuxxjM2DKKtRLMgZicCRPtqmRE
         SnWctHkgMVnTcmuUIQgJ5yFQ109Qqfc0ST0pEYZ7TTp4EInWfAF2V9Yy9NzgvsUhZ7e/
         OUFVEI0uC3tUbGLGHyECpZADY2SH4my1gMUOxxDGnFu36H7EfyJrS/nR7W2kwNamMW2G
         MoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781350627; x=1781955427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=phXtCKDPzIHT6s9YnPib3i8IOSlMxKb5AQj3sfC5/qSM+IwD3xt1jvpL6EGJxBHNb1
         LOCCMQeK95Jrq2UQFXwNNZSJproSGoi4MAQ7OaV/4zQ2JKWWim0xjUnkUEAMVNCKvmaa
         ZNFTdGMzIdoklj91kjakd0ZMydkzAauW1PVvwOpEVEz9qwxl5+vbiq3DJrTg29WjxrRq
         YdwIagY4fE3CdUXgLDAN0j1nIgICaakCxLxDKzcJlBZPLJbpdJR0QeW+ExhcLZJ7W44V
         Pm/IAGSsJLBGaPcFsGRjsjb1ld41+Iuo1LzMb0fB9We8XRG50kV4iIQDVy3l6aDVX0UN
         Jd/A==
X-Gm-Message-State: AOJu0Yz5Cy9aQqrsRzUyIEE1TuQvQWCG0OPYnsvwa3BihdM5qMOTKs2M
	OenEJMqeIFFMMlX2ixTkb6XTnWCXjJZgam9gqsBDYpReLZOwtYcDOg58
X-Gm-Gg: Acq92OGBdjbsPbMZRRj3FYfMW1v44O8vEX8bVRmU5BbFqgHeZ3LjwQ/n93Hh3/f55c5
	yiB4YV6RXbAX/dLkR3tqC3W7EjyMR3gPejC7sZRb9GB8/N2OjZOeDoHZYuj4WgrNFm1kuLRjEoC
	CuKDm1J8eCX6EOdVnr9qgZvt6FW7Buv4B1XaOkU75ZGWswERXM2wXJqxBxRpyQGwkcOkSJxZiAr
	+zkyTJoR6w3pEoYM4oqgTJqG+VINx7cLeaeWZNkL5bzCXBsbbDRPRnSbzhBlypCo0xWkdJycxJs
	br95uZTaCMAHdEWdhq1Wqdv5QqhpSxRnpu8IWgFebc7wJQV7zYs6wHzSuFzu20H8fJEgpmeCNn5
	iLSyuDNrfYNZHRYEev18MK/SFDgFTdWw3JAs1blExAJRewZNQlio5ZPe9LgovxfZLqNtlXjPSJm
	fFg7DHDPsm7iGEnIomkmIXzncqVSTfLx7K8fu9ECVbUhEK
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr50171305e9.36.1781350626544;
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm67812295e9.8.2026.06.13.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, enzo.adriano.code@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
Date: Sat, 13 Jun 2026 13:37:04 +0200
Message-ID: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
References:
 <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das je =
Enzo Adriano via B4 Relay napisal(a):
> From: Enzo Adriano <enzo.adriano.code@gmail.com>
>=20
> Add the Radxa Cubie A7S board description with serial console and SD card
> boot support.
>=20
> Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> MDIO, PHY reset, PHY power, and link behavior are proven.
>=20
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d116864b6c2b..824cc35152db 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35=
xx-2024.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..453761a96323
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +/ {
> +	model =3D "Radxa Cubie A7S";
> +	compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		mmc0 =3D &mmc0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	no-mmc;
> +	no-sdio;
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> +		pins =3D "PB9", "PB10";
> +		function =3D "uart0";
> +	};

Besides sashiko bot comments, these pins should go to main A733 DTSI,
like it's done for other SoCs.

In any case, it's a bit early for DT. At least clocks should land before.

Best regards,
Jernej

> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> +	status =3D "okay";
> +};
>=20
>=20




