Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5C3C81AF
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670874; cv=pass; b=A/tjj4lgkgDSMeZ7TGuPyEZKqrWTjIGftXn1B6RgT+vQI2d4M4fWGb1MymARm6NMd5Cq/6D59pLWRPo8+ndrAPDk4Jqxa/ZpsZFvUwaU6uFJlXcooFWESOPCHbrpwcaJY/5Ay5zsoI/AdyTSlQym81GlOIpi1NJsJVFZI+eakR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670874; c=relaxed/simple;
	bh=wTtqfla7t4frqqNGoHQFYc3eEfTem+rU1Jgc0zBxbkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Af1RHdxmq6oQWM0RL93VRHCoqkhWxYDfRroYbCX+q8jN7z4ON02ymTlilsxEYlFZZvw/Upp78dweavhrMMuI0BjtM32O4NO4OFDCzvmuvCmFxwg8PZhrCZ/HUitf0DpAK5lYE56JHCIJcq7vgQ4HSxyI+uZyEkGO9GwgXE+9U3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRGtQ9PL; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRGtQ9PL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b014810feeso62601e87.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 01:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783670870; cv=none;
        d=google.com; s=arc-20260327;
        b=TRa4OurRE0nLT1ABaelDh6FzquLpwNV/JmxUYDnT3v8W2SYp0eAjTY+Gldxh8X2+3x
         bVj1Vp2mC2qH4Qpb29LKVAGYoU1LeTDCsX3YU6UapP8PAoW9eAAqjvXdtt/N1AqV0n4c
         XN65RqxxZLT2bsdLPNQMNJrt4ADDYRLqYiC8RiXPGSptN9LvFapnCkuUWFCTpuYYgAjJ
         J61EFflcVJCrbBAqaZYA9PdhdGyb3HLdKIIYtCDH/MQSWN0CNGxInUAoSKQAGmwszWI/
         aNOld+zLp8YUEofM5drZin3NOEPRUiMPI7Q/nNfSQWsMvVHLFuTDIAUNI/LgrJhWAgDN
         vrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        fh=KFyZ6JMd6yG8jUmIxmZ6MXeampLYGaBLlkJ/1seblQI=;
        b=DewXulwjOZWAHN60GvtGshDBNQxJBO7TRAnv0H/mnt/YW0LB0iwH0ap5Vjx9emuHEq
         vfN72pq9xgWdxcjOcENQh/00E4nLDK0S9/CIGbpJT4vN5J0P0PcmQ/KhXJbNIn3fb/A9
         zd9dQHAxrj2Nu4YxSBHc7Qt4DQDyx2iDkGCJ+d2AJQfQZwjpotUAq0IpQRAp9IhHpSVd
         DDQziLYJHu5CDfYYcTnuhOU6QI18vBhvasHP/i+8Dxe2Wqka/tCsR7qO+T2IzV9QRACX
         kvXx8RVwr6YIkpiNImIMeGnpftTqUA990Pc0QGzmzaJJdghrK8xGcmQlovnTLbkdWbe8
         9gMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670870; x=1784275670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=WRGtQ9PL1WS/8tTHocCZhYfzB8e3iHI/v+2VtpCDLWs4o+4wxTMGe4b/1VPlVC//sY
         SjhzHC96XSV+Tv/xVNibQ+LtvMUH5aV4BJbv9r2e2VDBxNlgmiPxf60TA7PW0oyR8MwM
         tv87m2EZae7hAGA3KygPamA2osmOgY/5E4ma3u1Ffe9qNjlGnrlTfQojs0XeHCTBVgHd
         wmpOkw6HIAkgiA0q1rU/++RL+S2n3o45AW25VG9LPvXcH8xTovqQW97DJNhIBfAPBtgM
         Rau0Br7dTS/pAcFKu0/t6Yb9ig09mkMTIptraE+/kakBbM13Nw+lSpsjMqkiodw5zG07
         WBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670870; x=1784275670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=bumoIX4IZDBLhtoD3a2wco6jM+aXbGucc2wPHTDrabkaatNCIuD4r5baThF2lk/SSK
         lgz99ulHDjhfLzPpycCIZcD81k7VQRJEvnkjuNEHrCyN7h5xAEk6NxFWtS/v2Q0pBSEK
         TLLkcISCQeWpkBcP18KKQkcMrgccqnZwDo/46btAypYDITcRXLBktLvHTEJLMLe4I2Kx
         Jh9FpIbLsEqWaf7T7DCtWwc/OaYXWEzYqlPBf/ki6pQ1Q2/iQ8w/U4DPOY0twp1lwdIP
         XlC5RNpa2yrJhiPjDqp9sDvrgHhAmTzIntNzEk/jEtm2XefhVFpsw8NVscAYcoQRFQEa
         TQBg==
X-Forwarded-Encrypted: i=1; AHgh+RrUAqbB8UwwTqgibMoWGBk7lDNgq6ez0J6UMSxh/Wok1uXZrm6JDuiVl1vynajdcRpf7aaTFLESA4+K@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUXdK3taTpAnn/mSYyfNV0gs6wFQB39myiKYE7NAznhc/Ssoh
	iH0UoaKkmnsl9x5V9uvi6JINNy1njVEm9PDb3NmVZTwl/LaOyoiIg+xx/AlLH6DkAJbgijMR0hF
	UT62LvaS6FBEwAgdHwlDjdIsDER6ibEU=
X-Gm-Gg: AfdE7cmZ25c0A8jc82aBJQNtvZV0IiWSpfu/nJQ3SRMgVA9JLZhJ5UtmdkAZbbDB8MP
	612pTnaoX1wPvsWseygl+qp8moERNF5qiJgNP9w0xUASTgg1eWN22eVPjZch07hdvDoH5T4TO/3
	RLwBCzE7fzp6wYT61nK4Zzy6boOFxcsTaDbggLO31zPHuwtngOECKD5CJqr0VNUjdEytwMLBBRJ
	JD7DI7wI7+UQTy2+BMEWGM1+YcOf0zQdi1KBUkmh61teuXZd92Fel/n/VOeribt+8M21pbhytX0
	PeWn6udFM3gonLtW3XAkMR2bX+hqi+pvFF3aTc+hhIKZ8ACOogIzgAY=
X-Received: by 2002:a05:6512:12cd:b0:5ae:bce5:70f2 with SMTP id
 2adb3069b0e04-5b0115af09amr1512517e87.4.1783670869814; Fri, 10 Jul 2026
 01:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com> <akXbk7l9bZ_W0GLR@inochi.infowork>
 <akY0kY8yWAU_J3Eu@inochi.infowork>
In-Reply-To: <akY0kY8yWAU_J3Eu@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 10 Jul 2026 16:07:38 +0800
X-Gm-Features: AVVi8Ce9_hFv5Od1y6yR0G_uNpXufYnnP2SE-D2gTTyzsrjnIVfqX1AeuRABS8I
Message-ID: <CAKspUhKriysiFhu-Jk-e1u6+GBJjMV1A5a7WgiLjf=aTgTyA_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: unicorn_wang@outlook.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > IIRC the led is not controlled by the small core, so the node should
> > be described in the dts.
> ...
> So why not adding the porte?

You are right, adding the porte is the proper fix. In v3 I added the
PWR_GPIO controller node to cv180x.dtsi as a separate patch, and
restored the gpio-leds node in the board dts. Verified on the actual
board that the heartbeat LED works with the new node.

> Why you change this? Please do not touch unrelated things.

Sorry, the removal of the trailing newline was accidental. I have
dropped this unrelated change in v3.

> I guess a right copyright is needed for your code.

Fixed in v3. Since the file is derived from cv1800b-milkv-duo.dts, I
kept the original copyright and added my own.

v3 has been sent:
https://lore.kernel.org/r/20260710075917.159969-1-chenyou910331@gmail.com

Thanks for the review,
Chen-Yu

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=882=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jul 02, 2026 at 11:38:09AM +0800, Inochi Amaoto wrote:
> > On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> > > The Milk-V Duo 256M is a small form factor development board based on
> > > the Sophgo SG2002 SoC.
> > >
> > > This patch adds basic device tree support for the board, including:
> > > - UART console
> > > - SD/MMC controller
> > > - USB host
> > > - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> > >
> >
> > > Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> > > heartbeat LED functionality.
> > >
> >
> > IIRC the led is not controlled by the small core, so the node should
> > be described in the dts.
> >
> > I see the Sashiko does provide some good question, please check.
> >
> > > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > > ---
> > > Changes since v1:
> > > - Removed the leds node because &porte is not yet supported in cv180x=
.dtsi,
> > >   which would cause a dtc compilation error.
> > > - Retained the &usb node because it is already defined in cv180x.dtsi=
.
> > > - Cleaned up the trailing blank line in the Makefile.
> > >
>
>
> So why not adding the porte?
>
> Regards,
> Inochi
>
> > >  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
> > >  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++=
++
> > >  2 files changed, 110 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.d=
ts
> > >
> > > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dt=
s/sophgo/Makefile
> > > index 6f65526d4193..f9415c30a2c5 100644
> > > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > > @@ -2,7 +2,8 @@
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
> > > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-milkv-duo256m.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> > >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v2.dtb
> > > -dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> > > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> > > \ No newline at end of file
> >
> >
> > Why you change this? Please do not touch unrelated things.
> >
> > > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/ar=
ch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > > new file mode 100644
> > > index 000000000000..4cf441ab3790
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > > @@ -0,0 +1,108 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >
> > I guess a right copyright is needed for your code.
> >
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sg2002.dtsi"
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +   model =3D "Milk-V Duo 256M";
> > > +   compatible =3D "milkv,duo256m", "sophgo,sg2002";
> > > +
> > > +   aliases {
> > > +           serial0 =3D &uart0;
> > > +           serial1 =3D &uart1;
> > > +           serial2 =3D &uart2;
> > > +           serial3 =3D &uart3;
> > > +           serial4 =3D &uart4;
> > > +   };
> > > +
> > > +   chosen {
> > > +           stdout-path =3D "serial0:115200n8";
> > > +   };
> > > +
> > > +   reserved-memory {
> > > +           #address-cells =3D <1>;
> > > +           #size-cells =3D <1>;
> > > +           ranges;
> > > +
> > > +           coprocessor_rtos: region@83f40000 {
> > > +                   reg =3D <0x83f40000 0xc0000>;
> > > +                   no-map;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +&osc {
> > > +   clock-frequency =3D <25000000>;
> > > +};
> > > +
> > > +&pinctrl {
> > > +   uart0_cfg: uart0-cfg {
> > > +           uart0-pins {
> > > +                   pinmux =3D <PINMUX(PIN_UART0_TX, 0)>,
> > > +                            <PINMUX(PIN_UART0_RX, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +   };
> > > +
> > > +   sdhci0_cfg: sdhci0-cfg {
> > > +           sdhci0-clk-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CLK, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <16100>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-cmd-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CMD, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-data-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_D0, 0)>,
> > > +                            <PINMUX(PIN_SD0_D1, 0)>,
> > > +                            <PINMUX(PIN_SD0_D2, 0)>,
> > > +                            <PINMUX(PIN_SD0_D3, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +
> > > +           sdhci0-cd-pins {
> > > +                   pinmux =3D <PINMUX(PIN_SD0_CD, 0)>;
> > > +                   bias-pull-up;
> > > +                   drive-strength-microamp =3D <10800>;
> > > +                   power-source =3D <3300>;
> > > +           };
> > > +   };
> > > +};
> > > +
> > > +&sdhci0 {
> > > +   pinctrl-0 =3D <&sdhci0_cfg>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +   bus-width =3D <4>;
> > > +   no-1-8-v;
> > > +   no-mmc;
> > > +   no-sdio;
> > > +   disable-wp;
> > > +};
> > > +
> > > +&uart0 {
> > > +   pinctrl-0 =3D <&uart0_cfg>;
> > > +   pinctrl-names =3D "default";
> > > +   status =3D "okay";
> > > +};
> > > +
> > > +&usb {
> > > +   dr_mode =3D "host";
> > > +   status =3D "okay";
> > > +};
> > > --
> > > 2.43.0
> > >
