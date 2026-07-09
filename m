Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB43F54DD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598284; cv=pass; b=roMIYLiHqG7fDDyUeksgF0INIi40aFfpHkLdnQKDmHsul7WhKFOpjbmG1AipPby2g73gTakwZ68utw9U2QQxbfT+QSlCpO9XXsX2sj3DS3TLBK5VfypKm+BMzjltOM/6hnTqIgUKiQGdg3yZLC+uwaqKrn3cUzMp+gI7WRjFMF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598284; c=relaxed/simple;
	bh=Zms1S65LsMRFGo2WadrcJ4wjEPu5Dm9PLijmLJn1DUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwK8JW1Uncadc9WeSZt+ySyqoruR6nu3cs5FZ8HsA2XXPhzXl6/tDHMndBCqMYgwZvUbps1VFgYUsTTSqKyzwDU2aNFZGUryVswwKLJFEL0xDfAKj4xVLd/j7KGh+5T2PVyzOMdAFDMn1Fi0iOZ7YPCHOTsGdxUxc1Nsl5WU6n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=v1KqSGyA; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="v1KqSGyA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so3435566a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 04:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783598279; cv=none;
        d=google.com; s=arc-20260327;
        b=p/S+GLYbk6FE9n4ogWMccI7HhFwW6KxOa8EAj41FZSz60zB9NKDhTWRtp0GnIwo55/
         /dY+z3ufUT71HpQeuCkznq1lxeLs3KPpBVUtKGBa1X4PeKq8OnVMbZ+18F6aLP9vFkUN
         WWtb5HmD8InZe0ivCEwyuuckunlBtL9brDWSpGqpMnfXtBoExYcly9q/wQLFiscTfdtt
         zCO/ZhYCkdC09mvpWpf/kFOL0WeDbAhUk9szhepxI3eFVegdzapuz6dRME2AWfCgINGu
         /upX5CEYmhE66nGRB6VUsAjwul0k5uhMC72oqrxpP+Er8yKgmw03zY+VXgJufJjX/AeF
         9gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=SEkaj9fot00JrEJnI0gPipnHU8gmyJIFrjtrPQF6QVOtv8HYcT1XHW3oi936S/i/Ye
         yJvorhmQHf/l606JoWNh4BuexAMwUy8mW6OK1Ka0NgZXKDndsndtnpL9f+ThHl2HOvcD
         rza5QJZFxD9gmtb7VjAUOfuT6UoosLpnUrW80iSQYT8gvVmP3FJOGI7oxfFdaRgemyOT
         qDi7t+VGVV/ttGI1QQRFl3JaEZfYqQWYThaOKuxD7a1Gu6lvX0SB1MOsyGnkVXSU8i9t
         sxZzEZZajUnrxgMYxAOdtwlBjWqSxcW8RCbBfD+HJOR2luowvIgdPKO2bQnk+Z0pnYFj
         nn/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783598279; x=1784203079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        b=v1KqSGyAm6aQGNl/TuPpTkto7AS+O++d0ZiUgFz7E+jTS5c68lRkUYM7dDmm+pp2YT
         oenklVa67KEltD7Cf8/XD87WuC+rPtlXTLfOIz9xq1cRtIqMPtMVwbl3BT+ef/zxIFs6
         sDIUP4qn7pQUUPTMbsUQM3RN8w7oeATUDFM77xH89u5mZaB8AP4haWl7Jx6/xFA7UtKM
         XxWDS2EjZocnHBu+zE7EqDYNwmhUnN/ldJ9B+Gb8+z8ILuuUs0wsiAnd6f88IRg0H8xv
         KugcDUcTrrB9kI5TOuh+CyQBUwDWYXpcbLnKr6PvQsUijI7BAhEQyw2sdEqPfE1pEU2v
         zjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598279; x=1784203079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        b=TKp/G1PwTmV4DWiuNeJMB+lMwGGySknd1ug4gXgWGjMg0EqR0B/oDILMxgHPF1Zgra
         Q/qwJeUA/GlBS1a/DznkIBNUodyGl2oPVTvUbQiWSCrGObwr4UX8F3YAxr7IH/A0N2g3
         cDcT3CFWKQFwulTt/k/sZLjk40LyOL3Xh5NO0hde8REJhO3XsbHPd94wbe5T2ytB9xMv
         NipFA65cg9o8wfmfbm+yqhyyXGyiCozORn4jv9wDxxwkACDhsL8jJ5gTGba0MYQkkbFx
         69Ot9GfKSRbp0KwnEvplwiQQlHDkAkIpBVZY1cvCHfLZB9NynvXzPbtxe9Q7QSr2LIOk
         tJ6g==
X-Gm-Message-State: AOJu0YxE8091P9IA0eLDNmL9WAB3N4benyr9wIF+1MxC9Ab4P7RLPDc2
	/GD7XS8OieeU8M9uBcLJgEtrQlYKYCBb/yfG+PVscez0hnPwwouCxn0ze4C7Ui11bzwQiUS4Bmr
	EKW+RKfSFQsHx7B3EnuFvfnElGNb7tw57pivEWLa5jErnIzub7rp0
X-Gm-Gg: AfdE7cnmWyePnARaoGOT1/18LrGfIiJ0TYp7cLffButvLHtabNeZi21c0WA2Tq1mJLt
	iOQyAhcHjhGGBAaHXMpzz60ggTg2ntb0Fy1yt8E6SPBnsTfQUEhqFeKRBepGCTuEanzdgsG5wkS
	mZGYiBxC9n1Ld6VpKuQHUdWgqKEEsGnCK4MYw7fU9pW4SaFtamMYr8p3X3+C7pf4u0OzNFMWvCH
	CjZ0Oxd4TlS9SW6LO/mPjgiiLMjb6Z8cqGyoDrjpViiq9GtO30ar+BmJRacetXfQDTzpY4+gtH1
	S+lL9JrVo0C8LperYCqDABW6WiKDfTrcU6nG/e6/8QaWFBfy+0k=
X-Received: by 2002:a17:906:8d8d:b0:c15:cd54:e026 with SMTP id
 a640c23a62f3a-c15ce144f5cmr335284266b.31.1783598278968; Thu, 09 Jul 2026
 04:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-6-robert.marko@sartura.hr> <20260709115011.D920B1F000E9@smtp.kernel.org>
In-Reply-To: <20260709115011.D920B1F000E9@smtp.kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 9 Jul 2026 13:57:46 +0200
X-Gm-Features: AUfX_myDvdrO3OyQghqyuoWYPe5PO0-J0F84lshRH-WnbjqKgWEOiROjSluu8z4
Message-ID: <CA+HBbNF2t4GKEJCDRHh5wMxRTK4hXugPcoX0P-Utt1N34E6j4A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `qspi2` node is missing `dmas` and `dma-names` properties =
(unlike `qspi0`), which degrades performance to PIO mode and causes the atm=
el-quadspi driver to log a spurious error during probe.
> --
>
> --- Patch [5]: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI no=
des ---
> commit 297e92dccc7e525621a995eb1402956ad591b3bf
> Author: Robert Marko <robert.marko@sartura.hr>
>
> arm64: dts: microchip: lan969x: add QSPI nodes
>
> This commit adds device tree nodes for both QSPI controllers on the Micro=
chip
> LAN969x SoC. It configures base addresses, interrupts, and clocks for the
> controllers.
>
> > diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/bo=
ot/dts/microchip/lan9691.dtsi
> > index ed997d87dd09f..a8541c6a098d1 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
>
> [ ... ]
>
> > @@ -396,6 +396,39 @@ clks: clock-controller@e00c00b4 {
> >                       clock-names =3D "cpu", "ddr", "sys";
> >               };
> >
> > +             qspi0: spi@e0804000 {
> > +                     compatible =3D "microchip,lan9691-qspi";
>
> [ ... ]
>
> > +                     dmas =3D <&dma AT91_XDMAC_DT_PERID(1)>,
> > +                            <&dma AT91_XDMAC_DT_PERID(0)>;
> > +                     dma-names =3D "tx", "rx";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             qspi2: spi@e0834000 {
> > +                     compatible =3D "microchip,lan9691-qspi";
> > +                     reg =3D <0xe0834000 0x00000100>,
> > +                           <0x30000000 0x04000000>;
> > +                     reg-names =3D "qspi_base", "qspi_mmap";
> > +                     interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&fabric_clk>, <&clks GCK_ID_QSPI2>;
> > +                     clock-names =3D "pclk", "gclk";
> > +                     assigned-clocks =3D <&clks GCK_ID_QSPI2>;
> > +                     assigned-clock-rates =3D <100000000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: Medium]
> Is it intentional that qspi2 is missing the dmas and dma-names properties=
?
>
> During probe, the atmel-quadspi driver unconditionally checks for dma sin=
ce
> aq->caps->has_dma is true for LAN969x compatible strings, and then calls
> atmel_qspi_dma_init().
>
> Without the dmas property present here, devm_dma_request_chan() returns
> -ENODEV. The driver handles this with dev_err_probe(), which emits a
> kernel error log ('error -ENODEV: RX DMA channel is not available') becau=
se
> it is not -EPROBE_DEFER.
>
> The controller will then fall back to pio mode, degrading performance.
>
> If the hardware supports dma for qspi2, should these properties be added?
> If it does not, should the driver be updated to avoid unconditionally set=
ting
> has_dma to true for all instances?

The datasheet is quite conflicting for QSPI2, as it sometimes
references QSPI0 and QSPI2,
but then sometimes references QPSI0 and QSPI1.

DMA lists channels 17 and 18 for QSPI2, but it also lists 15 and 16
for QSPI1, which does not exist.
So, I will drop QSPI2 node in v3 until its clear which DMA channels are cor=
rect.

Regards,
Robert
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.39=
0742-1-robert.marko@sartura.hr?part=3D5



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
