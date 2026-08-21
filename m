Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD5411F88
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293721; cv=pass; b=c+uDLSp7ZmDXAlqVEU4QhNcywTGo2SbGHuKieWYDDleHONuzYG+QdoHk1tk+Zl35KqNNT+7yvb/sQ03iLa4yDJj9T7r/tE6RNN1s9/JtqgnrCI9uUFmp6vrM3ex2NJ9L2O0jJ3mszQ1yGjoBPvqzMC0zQg819/x8WyyU9M7uYR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293721; c=relaxed/simple;
	bh=dpSB7kj5Mdvd2RHSlOhr/QI4/pc0C+Rmc0XdvK5aqA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJjrviBV8klzSCUSBF7l3xmHtboRJEbYlQ4PDEFZO5PC0ju6T1YjSuDePeprCix4uktkl5WqnbQRmcyWKP/uWRL/p6soLz2yEFv0eDxZ3UfwSigqr7ncNmPWbGEgxR29+unEL+3TXfBhqlAEhModnKNSh6tnJFma19nyg3S9sis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayCxAXts; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayCxAXts"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so649369e87.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 23:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787293718; cv=none;
        d=google.com; s=arc-20260327;
        b=auQQwb0nhF9xcRuAtBOpx9/2V3MEaNL+ZurfLbRfLqtEvbZXqUh3OO+C3lQUQFa8VE
         w5GfZGAHvvJR+4pjQS0j4vQZ0E5AdNaLsNi3UE/wnhOlJs/lwl7ef/fASUbiCYA25gh8
         G76QWoXQSVzTwBaYupCBENWGQ68lmTfQC8cHfimwATEf+G4DGUnFxY+q7Jwx5D0Fr+Ey
         COnd1DhDronsTT9kGPbZ1gsy12QWMXkrL2aFCCfzOncWdFw62myzvTTKhwtxYg5DgWEn
         48BbF4O/n4Iujo/ToL2DKbJsY04HfhdfRAWM7vfTelT4GfWlPlrM+tRWUNmjHaqrS33x
         a06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        fh=T9wnFl24PRYwIKV+A29qqQ1y+ijO6fey36Gsx6byNic=;
        b=pPq1EL0sN4C1eW8dD+XiyODKaLswDinLHj8O3kNfQ0722S++iKs7t/SSsCxLRGMINO
         u+zLJdR3Npng34avy34zclKR1GMNZedNzGIJJpJssA7WcaZPNV8fQIv2B7w+r9Djjtme
         CpgzKnvMajsWi0L4FRPa7IZNU7XZSACKB23yQx4wuZu7veKH0dAZb6IvjnkM+LqdWbh6
         u6ILrwJJ02pZvV9S2UvCVkhira+6a3V0E2t7ptacD7mJyTzvYe5QVPSZC28UCiVeT5/o
         DtoUPI4zF7vv8Z0YuKVAq6sB6tE4Lm7XI0RygQpf2lY/X5j3CW0wifYplrT3mTX5pun7
         FUrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787293718; x=1787898518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        b=ayCxAXtskzNk3Ll3ry0T3VgIWD1U7/J8L/QdNc/ZU/ux0E+HuVARu33GSTDibg43Y+
         uW/sYXP0ztXIFno3NTCpkyQM4iQP5ttIsn3BeqgQyuaTXDr7IiVgDqFl29Gp6/vBMTBG
         gY59GpPtDozE+W1lT0DYCG3LWQOMFr8YfAsIYRnOOsLIdM4AvlrnumTf7TAGePzea4Fs
         J44Rn3yKx7qYS42PTC6ukrG40sSBchMcRn9EGVbMSXsazA25076CFphNpby0yYQLCoI3
         NvhMiq8bbe3E1GLTgo3inGolWQzRqPuaevJyjmG0ra2HKUpPHFIj5lwO/wJdNIfYngWy
         dU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787293718; x=1787898518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B9pQd9t0eZEYhD64ciNA4BU0alMXlOocEuezOHCIMY=;
        b=XENJx2LStfFh610af0bpw6+5BVIt0Q2pOLU8qXHhL48jmB5DyYUZgYiFU6e+3549Vu
         zBzJ+Z529cKj5pM6As2H6lqeoxx0xHyN1xgdaBz19EQRY8DUSR8V1rNwpdH0/QkJuHGp
         bvepcR3pBsD60Mk5xFRVHL9oaf0gf9+h+yqY8MvhURBYyrj0Zt4foTqdmZdexDIFqLTX
         zWVNqT0YOtmHBSxOdF7ts0R41FjoSVoKAOo4j2b3MmmgoP5U4wsn0d4KoCZnDqnCF+sN
         2MDbeJIkABBfB8povjX7Fj/5ZRGnMKL+2a2ZEtaPVEX/xScM8k8GbR45Xe3shWpxbfYL
         BmYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpc8QT4p0KmnvzWzvVjSxBEAELDLAf24f/2Cd6z3QzzkBV3vDCEg4HGDc6zzzB/SfkIp5ik3IlG8qB9@vger.kernel.org
X-Gm-Message-State: AFuF++mzN2ZnoVuoOF47z+hPjMHxvePzSVdKLPisld1Im1zTWxHqz9oV
	/0summYrTrOFCv5Fi2UK6A5oyOZqa2nKTwGn7pZuIJPdAIdNd6uzLM4t3lPpkWPbmGdlXyU7uex
	tzXqsB5au+X/g7jTyZh8UzZDeOuRG0DE=
X-Gm-Gg: AR+sD10dzT/AKx4tZ5O4s4E6hSE0n+jgYCT8Yqk4620S+6VgM11MrxFluUjbSqAgjkd
	tc90AmXJu0ONiheKOD5KXus2pV40u3d+eADaCYwzUPgga3+Q7+8gJdpGwv6A8Dt5o316qZRENmy
	4tDvWCJQ3KVBxlYrDZzOXlATTK9PmAUoIaJ4rfT0mX6cNtZrMXzLwp8ZU9VAMAwQGnTnZMNIDi4
	xMcc9V9npqnzhzPqM5VbKUPvtvjwZiodnDJ0QNw6Chglbk5WlNNvEzCmDSQiQskMzFqqX8h6R+Z
	y78XsKk35c29Hkuny3+07IiifaQUG98fftEvjzU0XDTCtg==
X-Received: by 2002:a05:6512:3da0:b0:5ae:bcc4:c071 with SMTP id
 2adb3069b0e04-5b484090f50mr1322562e87.0.1787293717922; Thu, 20 Aug 2026
 23:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com> <178724902712.20555.7009712214570349708.b4-review@b4>
In-Reply-To: <178724902712.20555.7009712214570349708.b4-review@b4>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 21 Aug 2026 14:31:41 +0800
X-Gm-Features: AcwNN1VHyDF2m_8gVrWdQPyCUbVvLps1cRKmYDiyS5eZ7IMCo5hpISGq-5CfFl0
Message-ID: <CAF7HswN1ZzwjfXjG2hV5tEkVZkZYp0CiVNSo_9A4m3tsqQp_Bg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks for the review.

On Fri, Aug 21, 2026 at 2:04=E2=80=AFAM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> Hi Kyle,
>
> > Ventura2 is a Rack Management Controller. It is a modular
> > device designed to manage liquid cooling systems and monitor hardware
> > states within an IT rack. The system uses an AST2600 BMC for management=
.
> >
> > RMCv2 serves several critical roles:
> > - Detects liquid leakage at both tray and rack levels.
> > - Communicates with and controls liquid cooling equipment.
> > - Manages leakage events and executes system recovery protocols.
> >
> > Key hardware features include:
> > - An extensive I2C and IO expander topology to support comprehensive
> >   sensor monitoring and backward compatibility with legacy trays.
> > - MCTP over I2C support for asynchronous device communications.
> > - A dual-flash design for BMC firmware redundancy.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> *snip*
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > new file mode 100644
> > index 000000000000..f1273ca31bf8
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> > @@ -0,0 +1,3005 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2023 Facebook Inc.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> > +     model =3D "Facebook Ventura2 RMC";
> > +
> > +     aliases {
> > +             /*
> > +             * Pre-allocate I2C bus aliases for userspace predictabili=
ty.
> > +             * Several I2C channels are intentionally left empty in th=
is
> > +             * DTS as they are strictly reserved for future hardware
> > +             * feature expansions and add-on boards that will interfac=
e
> > +             * with these busses.
> > +             */
> > +             /*
> > +             * i2c switch 0-0077, pca9548, 8 child channels assigned
> > +             * with bus number 16-23.
> > +             */
>
> This alignment is one of the things that seem to be a false-positive for
> dt-check-style in strict mode (value-whitespace). See [0] where Krzysztof=
 said
> that it may report false-positives, and "Review and investigate warnings =
from
> 'strict' mode, but do not fix them automatically without thinking".
>
> @Krzysztof wdyt about this one?

You're right, and this is a regression I introduced in v9. In v8 these comm=
ent
blocks used the standard kernel style. While running dt-check-style, I appl=
ied
the strict-mode output too mechanically and dropped the space before '*' in=
 all
38 comment blocks in the file. I will restore to the standard style in v10.

>
> > +             i2c16 =3D &i2c0mux0ch0;
> > +             i2c17 =3D &i2c0mux0ch1;
> > +             i2c18 =3D &i2c0mux0ch2;
> > +             i2c19 =3D &i2c0mux0ch3;
> > +             i2c20 =3D &i2c0mux0ch4;
> > +             i2c21 =3D &i2c0mux0ch5;
> > +             i2c22 =3D &i2c0mux0ch6;
> > +             i2c23 =3D &i2c0mux0ch7;
>
> *snip*
>
> > +     spi {
> > +             compatible =3D "spi-gpio";
> > +             #address-cells =3D <1>;
> > +             cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> > +             miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH=
>;
> > +             mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH=
>;
> > +             num-chipselects =3D <1>;
> > +             sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>=
;
> > +             #size-cells =3D <0>;
>
> Shouldn't #address-cells and #size-cells be ordered together? If reported=
 by
> dt-check-style as issue, then it might be a false-positive.

I will put the two properties back together in v10. Like the comment
alignment above, I'll list this as a strict-mode warning I'm not acting on.

>
> > +
> > +             tpm@0 {
> > +                     compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
> > +                     reg =3D <0>;
> > +                     spi-max-frequency =3D <33000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&adc0 {
> > +     pinctrl-0 =3D
> > +             <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> > +     pinctrl-names =3D "default";
> > +     vref-supply =3D <&p1v8_bmc_aux>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&adc1 {
> > +     pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc10_default>;
> > +     pinctrl-names =3D "default";
> > +     vref-supply =3D <&p2v5_bmc_aux>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             label =3D "bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +             m25p,fast-read;
> > +
> > +             status =3D "okay";
> > +             #include "openbmc-flash-layout-128.dtsi"
> > +     };
> > +
> > +     flash@1 {
> > +             label =3D "alt-bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +             m25p,fast-read;
> > +
> > +             status =3D "okay";
>
> Missing '#include "openbmc-flash-layout-128-alt.dtsi"'?

I will add it in v10.

>
> > +     };
> > +};
>
> *snip*
>
> > +&mac2 {
> > +     phy-mode =3D "rmii";
> > +     pinctrl-0 =3D <&pinctrl_rmii3_default>;
> > +     pinctrl-names =3D "default";
> > +
> > +     status =3D "okay";
> > +
> > +     /*
> > +     * The Marvell 88E6393X is initialized at boot via EEPROM
> > +     * configuration and hardware straps.
> > +     * The BMC connects via an RMII fixed-link; link parameters are fi=
xed
> > +     * by board design.
> > +     */
>
> This kind of writing gives me the suspicion that it was written with assi=
stance
> by an LLM, but I might be wrong.
>
> Either way, if you have used AI assistance for your series (or only for t=
his
> patch), even if you have only used it for the commit message, then you mu=
st
> declare it via the "Assisted-by" trailer [1][2].

You're right; I used an AI assistant to write this comment. I'll add the
Assisted-by trailer in v10.

>
> > +     fixed-link {
> > +             full-duplex;
> > +             speed =3D <100>;
> > +     };
> > +};
> > +
> > +&mac3 {
> > +     pinctrl-0 =3D <&pinctrl_rmii4_default>;
> > +     pinctrl-names =3D "default";
> > +     use-ncsi;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&peci0 {
> > +     status =3D "okay";
> > +};
>
> You mentioned that this is a rack management controller. Does it really r=
equire
> PECI?

It does. Ventura2 can be populated with a COM Express module, and &peci0,
&kcs3 and &lpc_ctrl describe that path, so I'd like to keep them. I will ad=
d
a comment in v10 explaining this, so it's clear from the DTS itself.

For the record, the v5 changelog claimed &peci0 had been removed. That was
incorrect; the node was never actually dropped. Apologies for the confusion
that may have caused when reading through the series.
>
> > +
> > +&sgpiom0 {
> > +     bus-frequency =3D <100000>;
> > +     gpio-line-names =3D
> > +     /*"input pin","output pin"*/
> > +     /*A0 - A7*/
> > +             "power-chassis-good","FM_PLD_HEARTBEAT_LVC3_R",
> > +             "host0-ready","R_BMC_PTH_RST_BTN_L",
> > +             "CONTROL_VT2_SUPPLY1_CLOSE","FM_MDIO_SW_SEL_PLD",
> > +             "CONTROL_VT2_SUPPLY2_CLOSE","FM_88E6393X_BIN_UPDATE_EN_N"=
,
> > +             "CONTROL_VT2_SUPPLY3_CLOSE","Sequence_TransFR_Alert",
>
> Why's "Sequence_TransFR_Alert" written in camelcase?

An oversight; it should be consistent with the surrounding names. I
will renamed to
"SEQUENCE_TRANSFR_ALERT" in v10.

Thanks again for the thorough review.

Kyle Hsieh
