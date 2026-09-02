Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE6326D4C3
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336413; cv=pass; b=mERT3QarC7gxPApMu6G2T/POZlY1+PNYx8GBTnr1nEESRDe+dNNkoIophOtAVUv/MKH/hQ4Ou8YZ+Qk1upOQ4wDB2ZEFEH62tPMnEcIPuXLLegSiJy+UlAKMbkfqULjBE/GG0WIpWgLh59D/z+5WZ8zNX6hZQ5qHWvCRRQHXemM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336413; c=relaxed/simple;
	bh=hQga2uJk4te2JdiP7ZPrmbvnNE5x3B3S932BjonzqXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSMz/WP684z6yx8iPCpvQLQa1uFkrFKOb2o4kZxENLxyPCRjBw8cQqU0ESAcQW2MWJAEhEYA2PVGehuJwVejr0wLC9hmoZlqJoGGemib49Ixg9wZsSN0pwB60zWLvVlxQethmzjY720bFMhWjdoANk8dwlCUH5bfelkZk9G0ERk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5Tl8QHC; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5Tl8QHC"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96723c7151eso218650241.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788336411; cv=none;
        d=google.com; s=arc-20260327;
        b=bHCNrVypNLQzW8j5lCCAv4PuVMUUWkPxqIlh/suM8byDOsD6WTbRIgKyUbwY17+kBW
         rwZ2gFHhwyaUsGryA033wwZmBsDK0HH/U86zxo+RU+lUPQWASL+Zcr0JXtpng0EntRVF
         GOSt3ySxBfst1Xsa+WP8DV0tz9NeTwZpFldcmFcv8A/RgaeQ5dmpVypTsRaevo4/Plha
         gBWDhM1FeR2ddarvTYaVb3RcCSeBHeAEYFrQhvNzLOdOLiKLT/bGF6g1/ciFqqWBDpe6
         +z5KFZPEU7Qm/hrKfRoL1dt+5yQV2V5l0yfRX5fddtzH8RgupXi+olTRVrBXYqhPrs2V
         AFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        fh=SgUgNlVwcyKCK1U+gIm/anRTdlid47frypksKXHFg7Y=;
        b=sJjVcmC+nCV00wPOOsuG8Sw3hNRvnqTkfZk9NcPJPeF6X1twjaL6DZm9+mBIQ/65C0
         +rEgzECg3cuwxnnDVYQLIZg1uiD4tmB45F88WQsyhz4DW+IOcgCTrD+Hrw1rMcrvzYUY
         xQaDMLA9hOquHzSdAi5rgTqMGKlenAkPm1Fijqy+jXhjsYFi3PE2NJCBwP5Vwt8nji6a
         aLN1Gj/q90lo6OxBZAkOBHDAkSg5fzFZ4XnrEDPN54owr85GgjIpdDbiMGPqefMLgA3i
         uhPWfM0wC62j/BGY52CsK8jsOjYzVxqUUkbFWaeY08bQt+TscLlLrAGyGKg/eIlEvn0O
         LQAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788336411; x=1788941211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        b=i5Tl8QHCZf1pglXCX+tPA0PO8ONqYreDwvkjACK1VqF+mjvFWwUBOHuBSqzJNKBzvv
         OTL7Y68vtNnUC7Qi/0JES8cMmNckaTZKiRuwPzaaJXcORHYmBSfGIfcCqcf0dqSTbRP+
         QCaCGLehcL7tO9IoSxe1Yu8uwfy60YDStMnjUXM/u9mWgZT4mx68KjEqik/vexo6QYiu
         OmLosRLDFgT9NC58xQQSX1f3W89mFl31OQppUs9KDP9Yb0MBMNUG/GtOEu1L1JYf4IH/
         ddK7nmZxxsI2JNcyZZW6/12ECcdABksOBdQfampOD3el5V3w/V1+5pirDK0SDlgxJtad
         rIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336411; x=1788941211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        b=NIi8VZ+mH57hFYN3JpT5VyHaM1HDPXfSg7mdFf2VDH2ZRxQyNvHSK1h6HJCKwwE+H0
         s8amlG74qqzXs5RsI1gltLHItkTnEcg7LuG8CXlV+Le0e3hbW2zrCnLNFWINbQc3m1Gl
         PTVdCzS2+vbOHRX9qa/OKRaEpGCjMqzDgd2/ny5B2pD8upWKsbGM1EhtBJyCB+8aVQ5h
         91VPB84cK8Rn2YALHcAz+RtHFogo4TfVFskoNHQLWFOHGJ9jUACRFyQXmBznsFVmgmDR
         JgSCeCqjMoptZEqtHkXDZ9nI1xwQiNqhmV6MA/CYauOZLCvVT6Xv/iI8kIzy+nUhiWZQ
         p0/A==
X-Forwarded-Encrypted: i=1; AKwUvBy/KQiAidUIg/6obpd0tsNfQDbah2PGTD+Huk3Pk+xeHq/OypE7dE2tnevaJWYDMA25UvcaHNj3xc2H@vger.kernel.org
X-Gm-Message-State: AFuF++k8PJGXCZMs7e0s8MpNCQa7MJxQeKBbSegIWOEXuMDRLXcx7Tzj
	IT2CmlQJLffDrLz+ro+knq+1WkliTRXqRc5jyjXsjrRARZDlM8ed9y5ayBikv/TzzpfCsLD9H5N
	37576rm7ENRc7R2Mn8XHPoN8KQUdVLoc=
X-Gm-Gg: AYBFou0a0GVg4ZnQf/RSVICcGH59ljxcbOJa9WWjQchDzV2zegSkn4Lch/Woq7nYCZL
	szDWqxYwjircKMDuVYelJa/EX+LrXEB8s67KzAjV4CLnTcBWedxE4wg1EG6ofkL6o/IR6USxHCK
	EjtLUyfRKqhPWmt01ItZ7W5/jYMHOGaEzelAeGfj1Sqz9y8qUmnQWJ5RN61WHP6l48LNJY2AnRw
	0KVUm5a7Cylwv0uIUK7n8wVptTRlE/kMOopLW/CS7mxKdALKOKowW6xRC2v17IjrkaJ2tewjH1l
	GyBzt8mT5VYeVpQm0mTXdLofUQVJhjsw1QQOC/qit6t/oZo=
X-Received: by 2002:a05:6102:38c6:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a1f1c3849mr1045866137.4.1788336410616; Wed, 02 Sep 2026
 01:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-1-0bd71d2e0105@gmail.com> <20260901123044.80C4D1F000E9@smtp.kernel.org>
In-Reply-To: <20260901123044.80C4D1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 2 Sep 2026 16:06:39 +0800
X-Gm-Features: AcwNN1V45jvtUIUPmkklS3A0YD1HKbVBaiVqSEvsVzc8mt2Z165gyW50PQxffjs
Message-ID: <CAPBH0A_OpB22HEa9=ZSUyWF4F6LUcvQNrak_4d=pYrRv03gyRg@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The board compatible string was silently changed from "faceb=
ook,anacapa-bmc" to "facebook,anacapa", breaking dt-bindings and backward c=
ompatibility.
> - [Low] The /dts-v1/ directive is improperly placed inside a .dtsi includ=
e file instead of the top-level .dts file.
>
> Pre-existing issues:
> - [High] Multiple consumer nodes request GPIO pins and interrupts from sg=
piom0 that strictly exceed its defined maximum limit of 128.
> --
>
> commit aa5900d50b8d457379595fa4812e97d97a192959
> Author: Colin Huang <u8813345@gmail.com>
> Subject: ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper=
 to it
>
> This commit introduces an EVT1 development-phase devicetree for the
> Facebook Anacapa BMC. It updates the top-level wrapper DTS to include
> the EVT1 hardware revision file and pushes down several configurations.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.=
dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> > new file mode 100644
> > index 0000000000000..017700920cb1d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> > @@ -0,0 +1,1128 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-g6.dtsi"
>
> [Severity: Low]
> Is it standard practice to place the /dts-v1/ directive inside a .dtsi
> include file instead of the top-level .dts file?
I will put "/dts-v1/" into aspeed-bmc-facebook-anacapa.dts
>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +
> > +/ {
> > +     compatible =3D "facebook,anacapa", "aspeed,ast2600";
>
> [Severity: Critical]
> Does changing the board compatible string from "facebook,anacapa-bmc" to
> "facebook,anacapa" break dt-bindings and backward compatibility?
>
I will fix it. thanks.

> Userspace applications and bootloaders often rely on the exact string in
> /proc/device-tree/compatible to identify the board. Could this modificati=
on
> cause them to fail unconditionally on boot?
>
> [ ... ]
> > +             i2c8mux0ch0: i2c@0 {
> > +                     reg =3D <0>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     adc@1f {
> > +                             compatible =3D "ti,adc128d818";
> > +                             reg =3D <0x1f>;
> > +                             ti,mode =3D /bits/ 8 <1>;
> > +                     };
> > +
> > +                     gpio@22 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x22>;
> > +                             #gpio-cells =3D <2>;
> > +                             gpio-controller;
> [ ... ]
> > +                             interrupt-parent =3D <&sgpiom0>;
> > +
> > +                             interrupts =3D <174 IRQ_TYPE_LEVEL_LOW>;
> > +                     };
>
> [Severity: High]
> This is a pre-existing issue, but does requesting IRQ line 174 from the
> sgpiom0 controller exceed its defined maximum limit of 128?

This's not an issue.

For ASPEED SGPIO, ngpios in DT is the number of SGPIO pins, while the GPIO
consumer index space is twice that size because each SGPIO pin is exposed a=
s an
input/output pair.

Evidence in tree:

Binding explicitly states each SGPIO is represented as an input/output pair=
:
aspeed,sgpio.yaml:39
Driver registers total GPIO lines as nr_gpios * 2:
gpio-aspeed-sgpio.c:676


>
> The gpiolib and IRQ domain could reject this out-of-bounds request, causi=
ng
> the driver to fail probing with -EINVAL.
>
> [ ... ]
> > +             i2c13mux0ch7: i2c@7 {
> > +                     reg =3D <7>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     nfc@28 {
> > +                             compatible =3D "nxp,nxp-nci-i2c";
> > +                             reg =3D <0x28>;
> > +
> > +                             enable-gpios =3D <&sgpiom0 241 GPIO_ACTIV=
E_HIGH>;
> > +                             interrupt-parent =3D <&sgpiom0>;
> > +
> > +                             interrupts =3D <156 IRQ_TYPE_LEVEL_HIGH>;
> > +                     };
>
> [Severity: High]
> This is a pre-existing issue, but does requesting GPIO 241 and IRQ 156 fr=
om
> sgpiom0 completely overshoot the 128-pin cap?
>
> Since the controller restricts its capacity, the out-of-bounds requests c=
ould
> lead to probe failures unconditionally during driver initialization.
>
This's not an issue.

For ASPEED SGPIO, ngpios in DT is the number of SGPIO pins, while the GPIO
consumer index space is twice that size because each SGPIO pin is exposed a=
s an
input/output pair.

Evidence in tree:

Binding explicitly states each SGPIO is represented as an input/output pair=
:
aspeed,sgpio.yaml:39
Driver registers total GPIO lines as nr_gpios * 2:
gpio-aspeed-sgpio.c:676

> [ ... ]
> > +&sgpiom0 {
> > +     bus-frequency =3D <2000000>;
> [ ... ]
> > +     ngpios =3D <128>;
> > +
> > +     status =3D "okay";
> > +};
>
> [ ... ]
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > index 1fddf3a5d1383..724f4d312de4d 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > @@ -1,1079 +1,3 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> >
> > -/dts-v1/;
> > -#include "aspeed-g6.dtsi"
>
> [Severity: Low]
> Does stripping the /dts-v1/ directive from the top-level .dts file violat=
e
> style and architecture practices for Device Trees?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-=
devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D1
