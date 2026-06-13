Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF893E7174
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781357378; cv=pass; b=X6B3H77sYb/ZdriYO6yA9/W3wpa4PydCb/L3kicgzCOheQ2I+eTdjdPm0oLK8LudcLg2CmVa/LUBvwLKf2Cdk4X8QzJ1QgDHvAa8tE8fhNn0cwTNL85dJ4P33/PwPYXFX+8V9DLhRh8gl2RnDeIU2FCadW8DMsoZ5RvhWE7jaw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781357378; c=relaxed/simple;
	bh=wsQQihnWIaC9bVsScBSqsXKP42m3O6jphB6W8rtbIis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wuti96K0JPQOuTlRNgAWyOSErBNUIRNnnmHqRAdT7v7cBnameVjifDKmaCs9A+XG0r2e6uIoVkstN0J4Q8MXnbRJbHAwDPAog+ut6AZhJtBpggiSuR8JSzxm/3F2Eb2iCL2wB1WUkqBkAU6CQcyKAXhZCnq1UPCvaCVtcB+FdL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mtes44qw; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mtes44qw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf125989f2so14365535ad.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 06:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781357374; cv=none;
        d=google.com; s=arc-20240605;
        b=hGrN5m9MGCLOObeS52FRX6sMmx/EtHnVt88mce75szqB/6q0W9TdeYTew4XiOwjLOw
         pHFCJI68CRHdx09EYynb6iQRGi4kRLz5PG/JhCQtxXfG2Fjs1yhrqo9tPIfAmE2Za3/B
         fPYenb4lBxxJqakM7K+gOojDo/XY1simRSihBnbpr0z78eFIsNjSsaz9r3lhbUCzkGDu
         jUoeUgwU+ftoHSbANvFRg3axoCdIHu1VObVjGeG+Oxig71VAni2C+lHO7pWo+S5kmCmp
         I6N9Rf0B6HhKdxiYTRL+hupSw5mpCm0hAEpR6Mp3sfA1Vwn7d68mWM7jOYfu+jqkh9Fh
         AfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        fh=N+CYhTw2MNK/aRRKiZr1QPTMssYdpiye5zFGEpbPXW4=;
        b=hqG2nFRuogRwExjKCmRNbWOcYC9AtlfKWsPbz7zfFUFi8p4WRlr8+R5W74yCGfYmGb
         HXphB5tn7/i9oi82+cbKDaC91GpXOE+VN/TDB8v5QKNyOD3qR2i2TxKWzZesb0pilwMJ
         gURMqfneRzvSq+HKRNIRTF/nfRlgtLZxp3SXIdguitKXQSTc/BCA+WOOTqwLYcY+4Xdt
         489EgZN1Vvhl1iNmxQHBaJOKOVdFVyVoEX7zrce0T+q85U8BiRxNG1kSiDuj6nNCUiuz
         8HENl69D9PTPX6G9hNjvxewyk+AW2L1w4TKHFXics3M5ZL66MjjvLAJCWIjTOOA/qVff
         Sywg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781357374; x=1781962174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=Mtes44qwrugkgCS6aRsvqfv6YZTHKg/jzMCd5taAipY/UHWh7JlupBvBJp6YXyW/Bt
         t5zJUSx5fOtZ/nR9Mv8Uu11JJdgVPK5VD96sn55UY2DDBX+U/7Sorp+rDneLEuVi4NII
         Fx3G9BXc9sHpJpXfYk5wUh+I4uNGnXP/Ss+mKdpsNy5r5pSBjBbJeAYpzCgbd4kNgFfH
         jJdV925cbJ98W/qBwghsdddVsr2Rm8OD/lhuLxP3xqykjLbs4CSdrw+1ef89TZgX7Hez
         otv2NFVhtlzQ5hQkB74vo3oAdqnLbYwVNlV5lX7DFf6n/2KT4G5SVjEubhFyTfdEzM3t
         7yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781357374; x=1781962174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=CaFA1lKK86wv29kkKnOUE6b5UXzDkpZAO9oieMsqt3AnKx9yu1xiNQUx1/KUqaRz7k
         fMyY7fSOMu0t4Ow9dByY/xQKue7j5Z4TJ6frKRoAu2WP+CJhXu7Nbk/1HQ5OjCZv+4IC
         spmWnT9HgdOSqRX3h05DXLOXHgtgAU2sHWa40yYX3ilFR87fC21MZMrOiWdsKZ4B4ENC
         vnb4/L8dFACP2zzHHgV9RJOmJOxdQbuTr9cuiz+2VwXcrS1YuWC+HUymEDogIQTDllw3
         O7ZndoRA74bFsuDfeicYytJgNJU/hXSWvRyC3tSUovZaQTi0RcahkNIB6OkPEevRloms
         Nu+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+xW8T5LklDO1OnUqjynguMUwP7Lnn4lI7sjj+qtw6esOKyArPWtgVQn2t6BqxFTHyxDHT7xoZpkojk@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnN1lZJGYIZ7zQpDJTkUafGnPrZPrUotVL6BYcXVHacWL+rCf
	5f0einwqm5zO1Xsf0wJMc+s1GQdSD2wm8UNgkep5kIO5GRGRE+RLN0OxG2810sOsDfF4GUaaKaD
	HG4CMSpdMvbuvV6aL+bL/ZNuxUfQ9LSQ=
X-Gm-Gg: Acq92OE5DQYUCI5s9nHIYjt+mPRDGVZ5+B9ebcHmvMB5aL5yzsMrtQOm2j6LcbnxHWH
	izDB60LG1rSuWqXYsYPQ5qygVNiz5MRHc4Y3dy296GMetRWAg9jVhcuh3WSAL7m/vxXHFAFf4KV
	fcMUIQDP7vD0q3UGvhJ1eJxK2J8uXD/U55R090ussvQzCR9eJkK+cZkASHDqubR4e43bkkWwKf4
	Rni6+ipa5IwKJfFd+u6SReV+dXVlZ1bor0x4tRC1YBOn12uzwtvRf9M64ca6RTyZZVsaxHexjIb
	1Uor
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id
 d9443c01a7336-2c413eb775cmr83686445ad.34.1781357373928; Sat, 13 Jun 2026
 06:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com> <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
From: Enzo <enzo.adriano.code@gmail.com>
Date: Sat, 13 Jun 2026 09:29:22 -0400
X-Gm-Features: AVVi8CdCVOnyKliNLOkMVxlnWD8AwCxre4GYBDVtf8SuvuvseqhhiKAPW8eLEzc
Message-ID: <CAHWUu5HKy6g5aFbrriBz1cC7dQkss7x5pTBQ1qXe2NA=H2aejw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

Thanks for taking a look.

> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.

Agreed on both points. I'll move the UART0 pin definition into the main
A733 DTSI for the next revision, following the other Allwinner SoCs.

I will also hold off on sending a v2 until the A733 clock prerequisites
are in a better state, unless maintainers prefer a different ordering.
For now I'll keep this series as a checkpoint and continue tracking/testing
the RTC, clock and pinctrl prerequisite work.

Best regards,
Enzo

On Sat, Jun 13, 2026 at 7:37=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das j=
e Enzo Adriano via B4 Relay napisal(a):
> > From: Enzo Adriano <enzo.adriano.code@gmail.com>
> >
> > Add the Radxa Cubie A7S board description with serial console and SD ca=
rd
> > boot support.
> >
> > Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> > MDIO, PHY reset, PHY power, and link behavior are proven.
> >
> > Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
> >  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++=
++++++++
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index d116864b6c2b..824cc35152db 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg=
35xx-2024.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/=
arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > new file mode 100644
> > index 000000000000..453761a96323
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "sun60i-a733.dtsi"
> > +
> > +/ {
> > +     model =3D "Radxa Cubie A7S";
> > +     compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             mmc0 =3D &mmc0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc3v3: vcc3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_vcc3v3>;
> > +     bus-width =3D <4>;
> > +     no-mmc;
> > +     no-sdio;
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> > +             pins =3D "PB9", "PB10";
> > +             function =3D "uart0";
> > +     };
>
> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.
>
> Best regards,
> Jernej
>
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> > +     status =3D "okay";
> > +};
> >
> >
>
>
>
>
