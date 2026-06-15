Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB073F8223
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532825; cv=pass; b=a3UjaZIEfMMD+VFHzu2IJBuVgXMGwuWzMVgrcrL6B7a851nC9b7oMMGQN7scCrYDdMIqX1cSWoajkZqwzU4GAturwUQticTAJZz6VaxscCD9P0hx4wJiMmErrhoKjkExYuQErQ0Vh8RpQYCBb4P8TlF5W25xjNMxNGhEsPZycNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532825; c=relaxed/simple;
	bh=cVelw7fcNjmAbQTMBjtUEr4ud5VagRi5XfNiWdZvSlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJYRuBNzCY3urdG3qve8VB+G61nKkf9ili2qYT8dESISg1oNMMs7pRNOD8gcb5cm/YDwGkhpJ5Ji9jiHEBP+VyaU3POBXn7X/gQ2SxshbGxKhRN51XN/+X8F0CAsuuOW+z6RSCO3PUbAYEfg9k7lVybXkE+RQMwWSZ3w/OWELNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvrG+l4L; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvrG+l4L"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660323f7b27so3117027d50.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532822; cv=none;
        d=google.com; s=arc-20240605;
        b=f1/L1FmIEcBxX3oS+t6BCvOthGyzdiGya4w/4ETLOIX4OrJijxRw5l+dbXQximqFVL
         aKvLnI4IUhduZuCzJDOZbXNVNIMKDJ1SEYGw5mXJ2FVA/8rlTEkFB+AT6kEzt3Ox9eEg
         c4mrtfMxF2xGmkP2WGRUHTXcffyboEYbV7OuHIEhZdw5adX//SCd6GtNh8l3aeKdw7AG
         A11yxEhS8oXNUf83fXfhZs4oxJ+KU8BlHMN+YXvTOr3Ufc6W15M8agJ9NdU2sqi66tde
         4ZdtrgAflZtPB5RdPLhvf6pI0ZjRWeCV88UU9ovhc3OTxxQxDtZ5FA8OxfUyO+0zS8qR
         7DoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        fh=U/m/JV07PZLFj+qhZoMXXOVF4+BoPW/ffEIu7xfiKok=;
        b=dnnyrd+d0BzftogSCXdjXE8qBur8jXz3BD8FUFgM2O+Hnm5jbW8oEGW44mkGcHUsI+
         bdHImKULQgj61qnKLGOgPSad29g/YU4OOCuLu/FzkMDgHshbCNa/IzBbAnfgy5me/ran
         XyFk2AKLC0k8rpbQVu7fmsL59pc1SpLEJzGxXVoSdatNzInvCjjzF5GwlZPl4QKtp0ka
         Qtr15a4tWkXLlNnze+gcOmQSVRn73Pz5zjh+Sdeel5H06qMDzuma8ivXPuHiKyX9nxvM
         zPVMONfzWQg6XQdKYLe2Ys/XiwMU2Kk53VeyiLn4vqCbl6+s4txBdMVqKI263EdxwZsY
         cRwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532822; x=1782137622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        b=fvrG+l4LybUAP+NH2wNKvMg8Sg3NVKs1RXo59McBBmd7sJCblnUV9eBr0PVKMrz3xb
         gwP+CtUvoQiET0OSEN2oeO9i4JoHvp5YPQS60eydxc3cEjoDm+kCNqgYfmQsxa9/2iIO
         YeHFoSZnBLvGpLkbdAStUmIoV43eikXJFmOu22Fk5pX+W1iDioASm0ajya+kHTgb87Qk
         y9M9sIPEaXeVW/k2dnv8fx3pFegXi41KEf9kI/TBYCgPJAm/+VNZ2D0A4uVWPKQU4eXj
         4G6ZtS79WeJTWrTlpmouxudWoJZcFynu6TKEehRSnyF0mfjqcAJDvynEEzfXQoV7/Nw7
         nJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532822; x=1782137622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        b=h8kolzlea4Z0xbOYFUsLRUBrW2oUpC6AvaSiPwvoLB6Y9N8FOaOxkijnppM+poNFVB
         vtn01otrx9L3oZura9o72n+Gd6HQqweMa4LQLAfoIHZKM9ylkKOmwoGlPpDfcbJGJcN4
         yhIPxre1ekmNTA3WCTxZ/RwEqyukJX3u+4wExWyoG9FWHWaMuzyqvtpGO2yztzIY3k8x
         PKRxp0vzzJk0d70N4uogUMk3NkQC5FDJAGP6zzlvbcrHZzcuP9TNz01ZuU4dLrjU9GtA
         jDQ8Mwgqydd/UIp0YUraJvVw2ZOQUx1rgmsC/N4CbYQB5cCAAYyg76Pc+/bGjGWLUcU0
         FUow==
X-Forwarded-Encrypted: i=1; AFNElJ8WRrqyz3wL7ShdB64UO0ePw+4IiBj+RDCfdJjCWYXVIHKFFTA0nZmDXCIaLCrmnBfoFiLnXkxVXRMu@vger.kernel.org
X-Gm-Message-State: AOJu0YzshQiCtBkSUea/cGe3+P21NusRFKy3FT30rhvSSeyBD5r3scQb
	gpE8H9dXZKZIOb3VfsmElcT/KB8vaPf9d+hSAJWP1chXMPAH3u4foav+UHPMl15kUX8JRmtUsFV
	3bfwcQjyRZVrO3Er1pzBzRJ0dCXWDdn0=
X-Gm-Gg: Acq92OFzFOnuT73SsIxsgAXQksuodROjbYd+kNp4T/LxGYRW+/0JCOX/FKrfZgsgXpu
	02JBZd4lFDkmumdrACpFuuax1JkM3+9O1O7hTTKPkOm77fwtRsVPFLKU68bUzFf+avI0r5rr8+5
	6RHJsQB0RZLjtydk21KRK20I+i/DvWukhjiSvc2HryPhglvPmSGdYtxPXpaYwOY0dlxyNCyRZhZ
	VI8RccJymqBqS3loZbuYIuZp8HhcZ38ZTXGQT3roQbn+hjsQe2wN+1HHLG11OJ8o2QmOjpCOMrt
	FhCrc7v9UQ==
X-Received: by 2002:a05:690e:4842:b0:662:5e4d:2bd1 with SMTP id
 956f58d0204a3-66284f1afe6mr6617333d50.23.1781532821853; Mon, 15 Jun 2026
 07:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610160816.2828713-4-tmaimon77@gmail.com> <20260610162318.E468D1F00893@smtp.kernel.org>
In-Reply-To: <20260610162318.E468D1F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jun 2026 17:13:30 +0300
X-Gm-Features: AVVi8CccHflQp_WEDPFT1deDFtEHQhAGFJXoGfxTiW93gE5Hb4eEw-ozhco4FAI
Message-ID: <CAP6Zq1g9s0JVKu0X7AT2CkK-v5xmnq3tp3UTCP8gh2Ysh7cdpw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, 10 Jun 2026 at 19:23, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Missing `/bits/ 8` for `fan-tach-ch` and `cooling-levels` causes=
 incorrect 32-bit integer array emission, corrupting the thermal fan driver=
 state.
> - [High] The `tip_reserved` memory node lacks the `no-map` directive, cau=
sing speculative external aborts.
> - [Medium] Incorrect Device Tree property name `spix-mode` prevents the F=
IU controller from enabling SPIX mode.
> --
>
> commit 011b4946d76e73a81f86b002033d53a6d052bd40
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> Enable peripheral support for the NPCM845 evaluation board by wiring up
> the SoC controller nodes to the board design.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 5edf5d13342da..ea92888d9b9e2 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
>
> [ ... ]
>
> > @@ -26,12 +62,389 @@ refclk: refclk-25mhz {
> >               clock-frequency =3D <25000000>;
> >               #clock-cells =3D <0>;
> >       };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             tip_reserved: tip@0 {
> > +                     reg =3D <0x0 0x0 0x0 0x6200000>;
>
> [Severity: High]
> Does this reserved memory region need the no-map directive?
No, the kernel shouldn't use this memory
>
> Without no-map, the kernel establishes a direct, cacheable linear mapping
> over this region. Since this block is isolated by hardware firewalls for =
the
> Trusted Information Processing firmware, could speculative execution or
> prefetching by the CPU into this linear mapping trigger fatal synchronous
> external aborts or SErrors?
>
> > +             };
> > +     };
>
> [ ... ]
>
> > +&fiux {
> > +     spix-mode;
>
> [Severity: Medium]
> Is this property missing the vendor prefix?
Would be changed in V5
>
> The SPI driver for the NPCM FIU (drivers/spi/spi-npcm-fiu.c) appears to
> check specifically for the "nuvoton,spix-mode" property. If it is only na=
med
> "spix-mode" here, will the driver fail to detect it and silently fall bac=
k
> to standard mode?
>
> > +};
>
> [ ... ]
>
> > +&pwm_fan {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pwm0_pins &pwm1_pins
> > +             &pwm2_pins &pwm3_pins
> > +             &pwm4_pins &pwm5_pins
> > +             &pwm6_pins &pwm7_pins
> > +             &fanin0_pins &fanin1_pins
> > +             &fanin2_pins &fanin3_pins
> > +             &fanin4_pins &fanin5_pins
> > +             &fanin6_pins &fanin7_pins>;
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     fan@0 {
> > +             reg =3D <0x00>;
> > +             fan-tach-ch =3D <0x0 0x1>;
> > +             cooling-levels =3D <127 255>;
>
> [Severity: High]
> Should these arrays be explicitly sized using /bits/ 8?
Could be used 32 bits.
>
> The Device Tree compiler natively emits 32-bit big-endian integers for th=
is
> syntax. However, if the driver (npcm750-pwm-fan.c) explicitly reads both
> properties using of_property_read_u8_array(), an 8-byte payload like
> <127 255> would be read as 8 individual u8 elements:
> 0, 0, 0, 127, 0, 0, 0, 255.
>
> Does this result in registering intermediate thermal cooling states with =
a 0
> duty cycle, inadvertently turning the fan off during active cooling reque=
sts?
>
> > +     };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.28=
28713-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
