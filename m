Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED131197C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156393; cv=pass; b=nylX6xW77JDtFYAHdGmChouG6gpox9YGOd2i/6zN6rsdUu5ruyRcVreVfVinqgUAU2foSbE46w0H6qsmJ2H33du3zJ3IzXZvVZgDC5awQeuvkJbaCpa/hZ3nKRFdMMAtl8rndEy2XSFtF/o2avpa6JwKvXHxcvFsef8AkjrEQgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156393; c=relaxed/simple;
	bh=3UocOpmBwrZ362TUElSHHW/AoyCv9pOcBQlYYlhD8lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgqWELnuB39Pd9rwrGGn58gEHcoCegSX/L2nP79mRGZVq6ruXdD+3pPVxYxS4iPkUQSKzZt1mQiwyCZmJ++Ss0btiEYpeJgA7Og0WJDwV1zDqiG1bSjgKHJdQJ+HBM1yoQA/bOZHP4F14F2EpofHBW7sC51IZ8QYsFzRBPWRK/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCnFnGBS; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCnFnGBS"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3967738c801so63830141fa.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781156386; cv=none;
        d=google.com; s=arc-20240605;
        b=d4G5MVQKQWcufb8q8zl0BPu5iu9fzo4dFI1YhAZ9NYeMBJDK+42LyVkFfM8LwfkFXF
         2VaVTMQA753tkA3PfW3h1sJAMpl+W0C5qp1ZNy6h87t+B+HLf9Rg/5MKiSdch+68UUne
         MzzcAYxQhDWOnxxg3Kw1baXTJx17VM6j6CINkA7Jz4mYT5pU35/xzL8nKM7SfCLJwyIo
         Tg4Q5jNloo4f+c8ythfa9UMRfcUrP9LKXFbK4NhmoZDLhxH0SXS4qjANfeVGq5xz4qct
         +ZE9jgsXe/i3lA8Q7MKEjZJkY/QpGuZlqbntEL4h9f+7Cc6+YjIweZ2sVmXsHdBTWmvn
         7irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        fh=9alYueOgKM4sNNlosswxBdbNtWCWzr0q0GrXQLIJKw8=;
        b=eKJ93vO+lDNV4Xfz6kYO1w/55TN1tBT0QcXIIN8NuYXdN3pRo8J71PknBXrWCWiyfW
         tR7z/2XgWol+o9i+9pKeFbZOi2CK+CZ8zwQcOnqDUdXDnbXZ591uidwc0YVp4xAOpXW9
         5VRkSo2f6Rd4mPlEbf+VB6wkZncjsHsGOLenpqsDMeeLgU+7F9VFxKUCtfSIdZ6yYkMk
         Y8kDV3/zxbf0ko+aeakq/3P/yJKRYoznZh2Ni1p/LSfULzZH1x1LZYFbrZ+pL5sHMsL1
         335Ni45ao7Pkuz6k+kAVzdWWl4/APBBTGZA38SafUg74kk5R+ya1mspfVt7MznjZtB0V
         Pmeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781156386; x=1781761186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=jCnFnGBSKKQu7s+psp1rh9eLWfa+RVmBXn9ZE29hBi1w3GL40DjsaFy5T5hkZ9ZMoa
         NoSAjL2VVMpvKLEafPUM+w02TQZ+JJZVgMdXICOTYliw95RfD577I1cdQeByVaZkUUST
         1OkW5tm3OnB9Ty4XWxFT97JAXUyNYVGCNE8PKwER2c5o7QvvBdSoAl5c6SBCVMAWNKes
         Wff1E2WmSk0DFalWCDQJ7/R+5+c+GS/gUjq2CTx4YKWBbos1CfGhuCf+nQ4UiqX5P/Fs
         oPRDjdkibB/hou62DZnf9GG3xSnFRxKNzCUgIBPz9umeL8nU180m4CtuWCCj7WwaFChl
         n23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156386; x=1781761186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oB59fVMVK27SoPfM6pxgXOWQ6r4jMS+0G1YJm98FsA=;
        b=G3abhvE+ZUBaoKwa6o0lDLhqAp49zOzQfvdN504c4m1EgtN/6+HeOB1VDl+aCgn6n+
         VyF0zTuMMf9gXLQpqUyJfcz7yxgL4FqYexFpx338v3wbF23dBSXFYvouBpYW1Zeo/esS
         BXYTc9lkcjc1juy43u/lu8419UUSvbK0UqM4zzLY09vlohExXdX668IHdSWvsmUOBE/5
         pTwyLM23qKZiYFen0KzbXYTKywiDDeBGEZyp+JZZEfIThtDJ8BeMgqrJ/TH/eHbf99kb
         H4jNSFm3SoIUVLMXaLnRCtZ0OLF83Lz4bBRopgVB1M2EbY7gtObc7/5/7zgqNT2I1VIF
         4uqg==
X-Forwarded-Encrypted: i=1; AFNElJ89kbXHcpvEdh/OzHS3zYrm5Z1ZuL062ujys7BbQL2xabExjIpZ3v41E5MBcuzKWqW9meNcPtJ+s9sR@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiN6//FwCjK2WTlW4+6mbdvRh2HAVpvWGgVfJEEsKrNg5qQ3c
	7L4NSPI3Bt5lfD9AtxJ8eIowbx8cYfm2xeNhAWe3tPlxcG5fQZpCps00+YBa+ilgN6rPFws9Shu
	FbBm88IrqXxpvOUIIzfKffn2ujXq1Z7g=
X-Gm-Gg: Acq92OFQQRDV79s9/qWEedTV2F7W2cY5KxSKyu+2LZaaF0FFveHrkLqfrD8BKVBT/zp
	RPrJg1zcj5b3ASwoFt3xInSm5d/uC5FOFflMB7vJ+03dXP7RrxL+3ishEVsW1SaHdsmCcI/v0VS
	SKJXYAmLN6sM6hNTwFmy3J/zhhtA7DmgPaX1u5FzYiFVmDkbHlonbyNYcoU9rzmN9GT2kHequ1n
	oNawbnRC4nTL5W0Ei2LSOPPjU8RJmnCfK4vbfy+OnblTDkUFevu4fOjU4j09Wnxm3yqeeHc6YIo
	ZkKtPQjSfjaFSDl2Q9g=
X-Received: by 2002:a2e:a107:0:b0:393:975b:5635 with SMTP id
 38308e7fff4ca-39919fb6857mr2532671fa.12.1781156385590; Wed, 10 Jun 2026
 22:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
 <20260608-ventura2_initial_dts-v5-2-37ee5bcf58b6@gmail.com> <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
In-Reply-To: <3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:41:15 +0800
X-Gm-Features: AVVi8Ccm0DC9rSjRQJdBWLuBDknFZNLKxN-D90VWvba6LpRXnzFxGYFIhU7-HJk
Message-ID: <CAF7HswNYvs73zoCDdVq_E11H82Djy=2OY-k8=zq+G6EGrV_6Qg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:15=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Mon, 2026-06-08 at 10:42 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
>
> This is redundant as it is evident from the patch itself. Can you
> please remove it?
>
> > The system use an AT2600 BMC.
> > This node is named "ventura2".
>
> Can you provide some more detail about the platform in the commit
> message? What's it's purpose? Can you describe some interesting
> features or details about its design?
>
Hi Andrew,

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile                  |    1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2888 ++++++++++++=
++++++++
> >  2 files changed, 2889 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 9adf9278dc94..6b96997629d4 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-facebook-minipack.dtb \
> >       aspeed-bmc-facebook-santabarbara.dtb \
> >       aspeed-bmc-facebook-tiogapass.dtb \
> > +     aspeed-bmc-facebook-ventura2.dtb \
> >       aspeed-bmc-facebook-wedge40.dtb \
> >       aspeed-bmc-facebook-wedge100.dtb \
> >       aspeed-bmc-facebook-wedge400-data64.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > new file mode 100644
> > index 000000000000..9bf7d6e52e40
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > @@ -0,0 +1,2888 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2023 Facebook Inc.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     model =3D "Facebook Ventura2 RMC";
> > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> >
>
> ...
>
> > +};
> > +
>
> ...
>
> > +&gpio1 {
> > +     gpio-line-names =3D
> > +     /*18A0-18A7*/   "","","","","","","","",
> > +     /*18B0-18B7*/   "","","","",
> > +                     "FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_REV_ID1",
> > +                     "FM_BOARD_BMC_REV_ID2","",
> > +     /*18C0-18C7*/   "SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","","","",
> > +     /*18D0-18D7*/   "","","","","","","","",
> > +     /*18E0-18E3*/   "FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     i2c-mux@77 {
> > +             compatible =3D "nxp,pca9548";
> > +             reg =3D <0x77>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             i2c-mux-idle-disconnect;
> > +
> > +             i2c0mux0ch0: i2c@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0>;
> > +             };
> > +
> > +             i2c0mux0ch1: i2c@1 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <1>;
> > +             };
> > +
> > +             i2c0mux0ch2: i2c@2 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <2>;
> > +             };
> > +
> > +             i2c0mux0ch3: i2c@3 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <3>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch4: i2c@4 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <4>;
> > +                     status =3D "okay";
> > +             };
> > +
> > +             i2c0mux0ch5: i2c@5 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <5>;
> > +                     status =3D "okay";
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch6: i2c@6 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <6>;
> > +
> > +                     eeprom@56 {
> > +                             compatible =3D "atmel,24c128";
> > +                             reg =3D <0x56>;
> > +                     };
> > +
> > +                     fan_io_expander0: gpio@20 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x20>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     fan_io_expander1: gpio@21 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x21>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                     };
> > +
> > +                     adc@1d {
> > +                             compatible =3D "ti,adc128d818";
> > +                             reg =3D <0x1d>;
> > +                             ti,mode =3D /bits/ 8 <1>;
> > +                     };
> > +
> > +                     adc@35 {
> > +                             compatible =3D "maxim,max11617";
> > +                             reg =3D <0x35>;
> > +                     };
> > +             };
> > +
> > +             i2c0mux0ch7: i2c@7 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <7>;
> > +
> > +                     fanctl0: fan-controller@20 {
> > +                             compatible =3D "maxim,max31790";
> > +                             reg =3D <0x20>;
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +                             channel@2 {
>
> Can you make sure that you consistently use a blank line to separate
> child nodes from each other and from properties in their parent?
>
> Please fix throughout.

I will recheck the whole file to satisfy the rule in the next patch v7, tha=
nks.
>
> > +                                     reg =3D <2>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                             channel@5 {
> > +                                     reg =3D <5>;
> > +                                     sensor-type =3D "TACH";
> > +                             };
> > +                     };
> > +
> > +                     fanctl1: fan-controller@23 {
> > +                             compatible =3D "nuvoton,nct7363";
> > +                             reg =3D <0x23>;
> > +                             #pwm-cells =3D <2>;
> > +
> > +                             fan-9 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x09>;
> > +                             };
> > +
> > +                             fan-11 {
> > +                                     pwms =3D <&fanctl1 0 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0B>;
> > +                             };
> > +
> > +                             fan-10 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0A>;
> > +                             };
> > +
> > +                             fan-13 {
> > +                                     pwms =3D <&fanctl1 4 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0D>;
> > +                             };
> > +
> > +                             fan-15 {
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x0F>;
> > +                             };
> > +
> > +                             fan-1 {
>
> Can you please sort the fan nodes in ascending order?
I will reorder the fan node in next patch v7.
>
> > +                                     pwms =3D <&fanctl1 6 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x01>;
> > +                             };
> > +
> > +                             fan-0 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x00>;
> > +                             };
> > +
> > +                             fan-3 {
> > +                                     pwms =3D <&fanctl1 10 20000>;
> > +                                     tach-ch =3D /bits/ 8 <0x03>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> >
>
> ...
>
> > +
> > +     // Marvell 88E6393X EEPROM
>
> Please try to be consistent with the comment style (prefer /* */).
I will fix this in the next patch v7, thanks for your suggestion.
>
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
> > +
> > +     rtc@51 {
> > +             compatible =3D "nxp,pcf8563";
> > +             reg =3D <0x51>;
> > +     };
> > +};
> > +
