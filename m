Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CF19CC14
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378069; cv=pass; b=iboY0kh9dNQZLGnZlBFkusCEpThe9AOjxGJ6AwN+njBKL19PqXg+3Iox7ocracUgz4ox4ZeK3LktSGMC6Cc7Ud0CH1U1690MgCiLm5S1aWW6FIKaThUAgS65biUU5HUNnzLh/flOUSXYteMj8SCGWTNnmmfIWrwRfW3o5PauuGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378069; c=relaxed/simple;
	bh=pqOdvBvUmWULW9jHLKVvyMcN+fzgMi4S9Wk/+nGyUPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhKpfrdViG+HH47Bx6UxfliTHEjJbyCnVD+scpmrms8BmK0VoLR4RxLdTfsjPGPOlwiED0/acC+eB6oCWnS/iUrA5RsZvh9HSItEHx26ybaS2Vedw8TLcL+actoftxQScyajGrMcAcHwz3twIfewne4SK5Uus84If2YYUE7HQKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cx17tWVb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oP5KD0Pl; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cx17tWVb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oP5KD0Pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779378065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
	b=Cx17tWVbS0pidDc0uIq4rtqWdebMABWFerEC6/bFZgIOs8hwcvl8KNhyc53svoAeSjNMJn
	TZCEdeHMTbBaM79ls3a8C/L+C4n5SG9ym2+1bRsVw99scWkUZmdPk0828GU4IEHnX7m/xH
	22avQbjQsjUpKkHsRcil8YaWZGQr/V8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-AQMEKt0QMse3u0AXe2huVA-1; Thu, 21 May 2026 11:41:04 -0400
X-MC-Unique: AQMEKt0QMse3u0AXe2huVA-1
X-Mimecast-MFC-AGG-ID: AQMEKt0QMse3u0AXe2huVA_1779378063
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a87eff81fcso377191e87.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779378062; cv=none;
        d=google.com; s=arc-20240605;
        b=gZRfQbuMEIJ3J0QmnN+ADc0IyGtFdu4yTSc+MezxzpKcFGUaXfENSKSb0ck+8j8ZZP
         9uba5j9eqPHc3g6lHLYbHPy6txVqa1h310aGQHKiZ1KOzx6xr5fUkIc+3zRCZ4Cfx2do
         OSsAabE1FrcoJXf9nEvD+uzcb5RjrkuAIaw0GQdj4rrEGY65p+esxiyQWNgAdtC8dUyD
         DVOLWXnU71sLA4UPx4Ya4Fp4ClocBe3WOCY6f2Cw7ME9gnp+SsPiOg/Snh5FmbJQvmSa
         SMK5bDfbqaTpu2cJxKfWIU6ZP6cmTktqlhjuUHGu7q2KMAs8Nk5JFwn1ZKVabiHFRfvp
         QOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
        fh=3WHFJ5M2shxRWw41qGNpTlTf5aNDUn8BswDnSdbXHmw=;
        b=ayvo1HT68Z7szjPjR8LEIc2OC/sBqfvLS1h1rRO1XO7sFDUoU1U2SQFmkKAL543yd6
         3TY69dojCS9qReQTKE9u0frrDZKkXgvu4QMdOuJOSowU+iHAZzNKwUb0BdNjri1JD7cT
         /I2llRFrGd0ZWXkIzF0VLOpBNBgjkg9nCef+T3b5j3exzCLdeSZXn4+jK3/M5M/ZsjzS
         ufaKS/S1yqprjwJapJiVHmwm3vCTrt2csOSzwgdi1IhEkv3NgPrSvMkqzexP0vQzF7GU
         5OBCD7vQmBo5rG7EkFKanyAMTAEFDoS56QOgFxEN2kvWFg/iGq6yX4efZF/q8kMBNBTM
         OGmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779378062; x=1779982862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
        b=oP5KD0PljeF5BR26p9YQ7iz6bfkhCIhuMYWA7J9yw4mBodTtjBnQewGZKQ5k2Rm7re
         eFB5jsjittY7oCW9zCLVqfG0ckBXlRjs2BVwuv+XqM81GBy4QsLWIEy0iAeU8rFTkFGe
         ROqnHCE7A+ktJJrjE3tAJ0KXxfc51nXBtioRL3KZpCk0bZpr5ynMVOf7KYKc8FhpynbO
         zopOiuccTgfLr1NRjJpVU1e3j/nqUjXJyfhLb7I1QyOpq66IhViAEL5/5lqREpE3m0p+
         wEXa8B9zmN3K6MRVI7hAhJXLRuuhcmlGJEu19LdhkVH5Rj/KJzzK6+K2XrUQwgaSa0fH
         AVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378062; x=1779982862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
        b=hq227N8MG4JXhLijMDyyTDrE99b87uevN4WE/kSHvfTP8WLV3olSQkp6FoYxpi8NFu
         SKhCChTJxHgci1qhX9x1qovvetoZyrlxn13NZg9b/DC7l5iEMqdwEBD/oPxs33RL4lnC
         ZIxfiAN3OafpMs1n/oU0gchs5w6HS9rY8vpG9Tv0mOo3Rq77zoyozRyz3NNnbNZ1i4BP
         AYm2K+Ed+C/K4GRMSzUxKyKy559Z23NLeHEAyJTE+3YvJ1tCgkb+xK4wkp9vbx5jjQyZ
         +QTAnHwLsX9GGpSOazZPeAhodWpszxE+1/JbYoMDyEDiOoWIRiq/x+UbI6t6ZmjrgLZ4
         uE5A==
X-Forwarded-Encrypted: i=1; AFNElJ8JvYNHEtI5TfB9/Gl4c2dmRWTpvviWE6rYBDGo1lNpw3M+ZT0u6kcihldSyml3CcwRnP6lQ1yQQYB5@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkQYwmtnmhAznM+jIcUCgxNyyATR1HXd95EndksJ/C+wJubUY
	SfDekSWl2g1tbPX23b5u9XjiRIvt3wwqmDjVHu8h21AS7eEfGbjsIWQ18/PfhA9Ir65dBuUEJ9C
	4qR1p4w/B1Eu/Qtx+khgLQ0A4hLr3kwy4We7fJolKS4Ea9hP2K5UtOWloJOdZ17nJix/aafrKQJ
	FOeHpkocSx6CG8LF+IwKZCbl0eT/D0H4QjwEtvGQ==
X-Gm-Gg: Acq92OGv786SB1qPTe3LiBNc7qFlLbBXtGw6vWYJaRvM0cu/rzJI+c6XgCY4+MAIiV2
	MkBeHIgIYg5crXl8oaDWW9X2AHMo+SLz/0tqiSh/ePvIaD2hkjX0Mw5djuIZeTplgNDXct2PcS1
	3K2gr/UeqDZm2j9Xtf2GJVki9zzWWWxpV0kM8JA2g+LreD/KhVkL3yhBX7eCtaw1aKYgaT3Lh/Y
	UgtmBOW0BcX9z2m
X-Received: by 2002:a05:651c:1446:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-395ca54c9bfmr4697021fa.7.1779378062355;
        Thu, 21 May 2026 08:41:02 -0700 (PDT)
X-Received: by 2002:a05:651c:1446:b0:393:9d8c:73d2 with SMTP id
 38308e7fff4ca-395ca54c9bfmr4696981fa.7.1779378061760; Thu, 21 May 2026
 08:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com> <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 21 May 2026 17:40:48 +0200
X-Gm-Features: AVHnY4KYrQdua7SpnLaqwynqHAGj2zpwe2dqjB0Og4OT8dAOLINb_3mUW5_zlqw
Message-ID: <CALE0LRtZ625eHwsmk-sJhLd-QUPvu+yxKAaWCnHqbJvpTwXcMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for
 S32G platforms
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

Thank you to apply my reviews.

On Wed, May 20, 2026 at 5:10=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add the usbphynop node and the usbotg pinctrl
> support for the S32G2 and S32G3 SoCs.
>
> This enables the USB controller to reference the
> generic PHY and use the required pinmux for USB OTG ops.
>

I tried testing the patches, but unfortunately, they didn't work for
me on top of the current mainline. Any idea what could be wrong?

[   40.019850] usb_phy_generic usbphynop: dummy supplies not allowed
for exclusive requests (id=3Dvbus)
[   40.268467] imx_usb 44064000.usb: No over current polarity defined
[   40.293272] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus numb=
er 1
[   40.308834] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[   40.309475] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[   40.309485] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[   40.309492] usb usb1: Product: EHCI Host Controller
[   40.309498] usb usb1: Manufacturer: Linux 7.1.0-rc4+ ehci_hcd
[   40.309503] usb usb1: SerialNumber: ci_hdrc.0
[   40.311051] hub 1-0:1.0: USB hub found
[   40.748830] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   46.038582] usb 1-1: new full-speed USB device number 3 using ci_hdrc
[   61.347813] usb 1-1: device descriptor read/64, error -110
[   76.707030] usb 1-1: device descriptor read/64, error -110
[   76.817100] usb usb1-port1: attempt power cycle
[   77.256992] usb 1-1: new full-speed USB device number 4 using ci_hdrc
[   87.826466] usb 1-1: device not accepting address 4, error -110
[   87.956454] usb 1-1: new full-speed USB device number 5 using ci_hdrc
[   98.545933] usb 1-1: device not accepting address 5, error -110
[   98.546070] usb usb1-port1: unable to enumerate USB device

It looks like a problem with the ULPI communication because I cannot
read the ULPI registers.

Thanks,
   Enric


> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
>  4 files changed, 102 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..a35bb284270e 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -108,6 +108,11 @@ psci {
>                 };
>         };
>
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +
>         soc@0 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..b980e5f2b059 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -165,6 +165,11 @@ scmi_shmem: shm@d0000000 {
>                 };
>         };
>
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +
>         soc@0 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..26009c1e90dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg-pins {
> +               usbotg-grp0 {
> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg-grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -304,3 +337,14 @@ &spi5 {
>         pinctrl-names =3D "default";
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       phys =3D <&usbphynop>;
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index 979868f6d2c5..a8abb10b0e7a 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -199,6 +199,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg-pins {
> +               usbotg-grp0 {
> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg-grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -257,3 +290,14 @@ &i2c4 {
>         pinctrl-1 =3D <&i2c4_gpio_pins>;
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       phys =3D <&usbphynop>;
> +       status =3D "okay";
> +};
> --
> 2.34.1
>

