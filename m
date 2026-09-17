Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BF28C840
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609570; cv=pass; b=oGKkO9KJjyzf1gs592neW9fv8kAMqjDE6vuLQShNV9l3zXlAZvxKx0ggXdVWwL/aXPE/LDsoSXGWRSKZHd6MbWPcnH5iATFB/IBJWSo+y1YVrf0862h/w9TGsMPEfPCs4RfAjz5VGZgRO2MY0NukifnxckUtD2q5qeEwg91Dzz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609570; c=relaxed/simple;
	bh=8yEfCc1ysbNDO6qZwUjKMh0QEM3wOq/1SDDsejiZu1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSEE3Zahzu8lkChCFV130D9177f58SYNlVvWJmlXYIADWNaNHazG1oPAHm6alAyUJBux+g0DV3qjRhgJtrbuoBvrF8Xmi/BjArj1KQv1G/FOfFWpHqD4KZHr8nv2xxe9v/3IIF72fxfzXiW5w/e8JNoL23xrmgAg/9qojSl507M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8tkI5SX; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8tkI5SX"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso229574d50.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789609567; cv=none;
        d=google.com; s=arc-20260327;
        b=WPQXL1JWxB0J2+k/ubjQYeMneXioUqjpOh+HCR1z+Bbl0NfrNOr/H5MxBzekcmQ0EP
         rnhWe3s+HnHeZA8lOZjm1cPAsryBkuoN4GuqIDnCmnCHw02VwuYjaTy0YSIL8l0JkiVx
         7f0kZwTMnh3bkXPDlqVrP6adUQcWF/zI8ru94cDd7eQixt40LvSWKhwnzMIl/Zjj//Da
         A7jx0FmL4Lh2BVmQNWTKUeN1kvY/j8K9ZiD6p4hApn08KjXtt5+6LpQnBmEdyGx1uJK1
         tK78Elqv8f2zzScA2LQMf8R3ntC2L+iQfRlZw8ldHZmEP3pqxpBk8k0dE4fBBR+U7bL8
         FJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        fh=CsH5u2xcve0rFYdyF88eP4oNaDj3kcbd/DIA3LUsx8k=;
        b=jOg+n7OHDLK9PHZSziGAGkhdPPCAVOJNxpjlz0JGv9jca0Z9X2FbvZ7dLYT/ruk2ti
         UmKCQ3n9wyYi16rJ9oRvNNj7wG0OnDRyWkR16D9nmmZhuLmQi2/2Jv1+jqjhf1ge9JFW
         qpyFlfKrvY8JlkWGdxsdN6W0XAveER0fkieR9zmShKPeDTU7tRZYa4iu9AbW5NxDHVaG
         N1LCNKfvq8QispnQrXpSt5BoS4qDNsCNrSyGo/Eq+V6JCgsU4+37ETqGl2gCRIxe/9Wp
         5nKpzAqAUuUQN89pOWvi3IXFMcMiJRbPKlyDnsTrq0j/S+ojx4xHBl7MSiqHstNCPfP8
         jaJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609567; x=1790214367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        b=d8tkI5SXPW4TUXlgmiusms9oZ2X070jEhhEtlFz21Dw7t5+iVRvtxjuXUmJKdaCldk
         PZfDXKVIrwKQfyEFeMrN+kBrji4DcY1FxMbireoLJQ5WG96vMQg5pMvGh2YM4UnVFcB5
         z31GBKc1Fexa5wWPVTmXU5IlDsSU4lpOyA0e5wgrqDDYPAkWTvLuzZ4Ho5mp56rJWMR8
         ZWn5bb6t1qofYTTymP9ua82cNCS5xzjIY6rxq1b61nQO/9kUoxL7+s8sAx2kE1muHDB7
         vqhfAFqjOQVpxYjogojnUUHYDLQRRvNdlcekJEiH7MRocWkmaDW0G854nuEeSKtxxl2Q
         noLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609567; x=1790214367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/oI6OE+gqvIMbXOYDHCCFZTXA+5DVoFDE03BakR8Jk=;
        b=R3PgbdMGxFW2SRiiXr0DQRHimxrU/m4+ArvhO4G7mTIFhO0RCI7c0Ya2BVk7mAuu8w
         ZIMwWAk9VmfeS+zZWfaMjaMLxkilyj8AFU+SGS6/zKnxCL91hsvQyJk+OHC8xY7Uowr8
         WBnTZAO8e9+bvXnRk2m2k8M5gbuuJifRxoyWAd/sW6O0ehk3ytzDX2IlykN6M4nEIJ7u
         Rzgef0VQZ9vwlafY+pCAI5LqC4PpUzzyPUC+Nj85bOSUqN4AQSTz8aMVuJcdmcc1Dnfb
         tM0ZFhZgngTchbtE0iBeHqCl7dV/WBcxvK/SQSU480oCXrLlwp3X1q1SwDM2siaXoPO+
         6Rag==
X-Forwarded-Encrypted: i=1; AKwUvBwafCTuVku8yEM9amWdxUg6Mx1+uq6PyqDYuZ1SmTAzxBHN0wqS4kY7p7B+phxqrYmdRLy0fe2suODd@vger.kernel.org
X-Gm-Message-State: AFuF++lzTKPRCjNTgREesyvw3YorzNzmuHFVQUthJv/QaIG8lLd21yii
	P/j0X31I38B6AESngWJJmHa+uiGTXouJtbMk7kWM3Rq/MIsGBOPcT7FAjT8OXESpJ7FEJNNF/kN
	yRCiO9GsnreCldHvM4cd4lozkTuSQYWI=
X-Gm-Gg: AYBFou0MzMXhXbcecRlem3dQTuwF5Sj/CX08W4WJklpKoEPM12rvESVAJmISk94wBuW
	3ZpbgILroa8X6Uzwro3X7zCCL4sZ+GVAAnn0uhQIzIReYlAAsgXG0nuQDSk+79j6Kr3BaslLXw7
	A5JJDg2kkV+RVHtRSYVWnguRH1227TyyCiceK4GHAcyO2uwSj8irr9R3AskG6PQDInArGAwn3wB
	Qoe9Z6VQQ+vzwQyGz3rdlzCClvGRhTaga0PpUs1nBeGOuW/kL/Byd7uWrpftHCe89aCFMJTewGP
	O5ycEk9OhtWJjIN7DKrtKfRUvCUHymM61v42khgbqD9765ekRdY7uwlbdFXEjcRmxAIBeGvXx6E
	nRES0jc5I8OPkRA==
X-Received: by 2002:a05:690e:1448:b0:671:3b67:8a7a with SMTP id
 956f58d0204a3-6716f1503b4mr822727d50.42.1789609567316; Wed, 16 Sep 2026
 18:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com> <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
 <178954999459.14468.3220034594197550391.b4-review@b4>
In-Reply-To: <178954999459.14468.3220034594197550391.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 17 Sep 2026 07:15:56 +0530
X-Gm-Features: AcwNN1UdrXBNsGeffpdFdIkqCffMMWj64Hnt-znjfLcodjJc9sYsCQEWLc2Z4pg
Message-ID: <CAMFFDGircqrsDSOCPo+nzcpXoNi2Yu93BBQ+dkXw5rC4dWRjtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks for pointing this out. I had identified P3 from runtime GPIO
observations while exercising host power control, but after checking
the AST2600 pinctrl definitions I see that P0-P5 provide the
THRUIN/THRUOUT functions, so that observation alone was not sufficient
to establish the board-level signal mapping. I'll update this in the
next revision based on your schematic information.

Thanks,
Prasanth

On Wed, Sep 16, 2026 at 2:43=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console,
> > GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> > connected to an RTL8211F Ethernet PHY.
> >
> > Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> >
> > Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> dt-check-style --mode strict reports issues:
>
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:8: [property-o=
rder] property 'compatible' out of canonical order (should sort before 'mod=
el')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:26: [property-=
order] property 'ranges' out of canonical order (should sort before '#size-=
cells')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:30: [property-=
order] property 'alignment' out of canonical order (should sort before 'siz=
e')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:31: [property-=
order] property 'compatible' out of canonical order (should sort before 'al=
ignment')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:39: [property-=
order] property 'memory-region' out of canonical order (should sort before =
'status')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:70: [property-=
order] property 'spi-max-frequency' out of canonical order (should sort bef=
ore 'm25p,fast-read')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:72: [required-=
blank-lines] "status" must be preceded by a blank line
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:80: [property-=
order] property 'phy-mode' out of canonical order (should sort before 'stat=
us')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:81: [property-=
order] property 'phy-handle' out of canonical order (should sort before 'ph=
y-mode')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:83: [property-=
order] property 'pinctrl-0' out of canonical order (should sort before 'pin=
ctrl-names')
>     arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:85: [property-=
order] property 'nvmem-cells' out of canonical order (should sort before 'p=
inctrl-0')
>
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 6b68671f9379..b109491d5c8f 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-ampere-mtmitchell.dtb \
> >       aspeed-bmc-arm-stardragon4800-rep2.dtb \
> >       aspeed-bmc-asrock-altrad8.dtb \
> > +     aspeed-bmc-asrock-b650d4u.dtb \
> >       aspeed-bmc-asrock-e3c246d4i.dtb \
> >       aspeed-bmc-asrock-e3c256d4i.dtb \
> >       aspeed-bmc-asrock-paul-ipmi-card.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..6585bda56a4c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             gfx_memory: framebuffer {
> > +                     size =3D <0x01000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +     };
> > +};
> > +
> > +&gfx {
> > +     status =3D "okay";
> > +     memory-region =3D <&gfx_memory>;
> > +};
> > +
> > +&gpio0 {
> > +     gpio-line-names =3D
> > +             /* A0-A7 */     "","","","","","","","",
> > +             /* B0-B7 */     "","","","","","","","",
> > +             /* C0-C7 */     "","","","","","","","",
> > +             /* D0-D7 */     "","","","","","","","",
> > +             /* E0-E7 */     "","","","","","","","",
> > +             /* F0-F7 */     "","","","","","button-reset-n","","",
>
> How did you confirm this? According to the schematic it should be P0 (P0-=
P5
> have GPIO passthrough functionality).
>
> > +             /* G0-G7 */     "","","","","","","","",
> > +             /* H0-H7 */     "","","","","","","","",
> > +             /* I0-I7 */     "","","","","","","","",
> > +             /* J0-J7 */     "","","","","","","","",
> > +             /* K0-K7 */     "","","","","","","","",
> > +             /* L0-L7 */     "","","","","","","","",
> > +             /* M0-M7 */     "","","","","","","","",
> > +             /* N0-N7 */     "","","","","","","","",
> > +             /* O0-O7 */     "","","","","","","","",
> > +             /* P0-P3 */     "","","","control-power-n";
>
> Personally, I'm not a fan when `gpio-line-names` doesn't match with the a=
mount
> of defined `ngpios`, but that doesn't mean it's wrong. Maybe Andrew Jeffr=
ey has
> a different opinion on that.
>
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             label =3D "bmc";
> > +             m25p,fast-read;
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-rx-bus-width =3D <4>;
> > +             status =3D "okay";
> > +
> > +#include "openbmc-flash-layout-64.dtsi"
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> > +
> > +     nvmem-cells =3D <&eth0_macaddress>;
> > +     nvmem-cell-names =3D "mac-address";
> > +};
> > +
> > +&mdio0 {
> > +     status =3D "okay";
> > +
> > +     ethphy0: ethernet-phy@0 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0>;
> > +     };
> > +};
> > +
> > +&uart5 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c7 {
>
> Please sort your nodes, as per the device-tree style guideline [0].
>
> [0] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> Tan
>
> --
> Tan Siewert <tan.siewert@9elements.com>
