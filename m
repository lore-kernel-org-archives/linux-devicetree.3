Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980324248BB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770867; cv=pass; b=kJc/1djgOcMXlSn3WaXw8O6I2+oo2MR8nYJNw1Vxz33uxTCNI7u3AHnIhTcfclHPLxhy6O488PfU0So2Rk7OW22UUjuEh9kr2NUdN+gJna0Z/xf7CVeuJ6/utFyKivDVGywS5X2Cp8ozN5lhCK+9oEjkW8etlKV21aUfE6wvWu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770867; c=relaxed/simple;
	bh=KCb+AEWT222QOqqi/nfb/AJwudII8A22iwSuXfgeJ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuInL9bTXOfRWJxs6dDxC8ro9BvtyHRO5xgFQDPLQZOieFRZxhqoTjo1D+I9gd2CTd6eM+LgEvsjY7Ne1IX5tY7X0GEYA3fWY1c4LXvrybacqwlPgk3CdFlX+N/Duoq9Mog0gnGrYDP4kCPhqXTRmU8dGTqOwt8qQcJ9BNAn8O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=MaM3+GZ8; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="MaM3+GZ8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d9004f39d3so40793465ad.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770864; cv=none;
        d=google.com; s=arc-20260327;
        b=V9GQ3aDzO22wna8jH3HocABj375rYW/MoiGUpy7uWxo+UXsaE3WBAn2OQZzPN4qTnj
         XP7xnP6QLbRNdgr0VHS7nhk8diOuvJSlGhxq7uF0DK7ba2X3KTR7Vc/EWYSmF3xf8O7H
         S16aveWaeNig9hqtJal2tjiqOBvUSTAvQL3mj3KGDnYs+d5af3eQLPcAiSGngpTLfdYL
         6YrKbqY089mPXWorqV++L/LDAwa0BfT265uS+owKWA2UL7Ik6e6Z1omRt5IKC2OKNfO1
         NUdnTfeB8GYJ89YNViRKQP+Gngwd64X62jTyBqGFcmxVEP/edQz4qBmdOn/Uu7xHsx0p
         GgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        fh=+aJZbBhkTFLa4qslDzzefjso+jq2O80wNmq5vFQcdgs=;
        b=m5klv4V9nZsrSP7NA5hzDkHMJk829fLnJt+rG1PwUxlx8R6KHAPEm+SJ6l7PxBku9n
         g6noVsClnioyqcRKIyW/m0Xvr/Cl3Rf5X2g3whIESVqfIkamM0YibhVW9eYufmGOVGm5
         CbKVrlzbyN2FQmxbOWtXNEpN/gkqZpu354Ln6t87PkgTLzvZ7uYe9QgJtCANSNn5SZmp
         G94pIExTbeQCnUtVyBo2i4vatQEe4T6TKT1up9oWDzI8i6BnqmtA8digK7/ZTVWwb5I9
         X0gdfgl2P5pX0l0nCx1qH2AxESWXSXOSydcmAK4K4CJXt6MhXFZAaK3GaXYE6R7odfFU
         I2bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788770864; x=1789375664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=MaM3+GZ8CgUjDMCr9OVjhS62XoBR2OhkcGnUyOFxHL/yysmPcnJr88vUUdsA6fk3qg
         sDj0ihjZqfYbfEiOD17ky21fh4irAn67OgELzwnJyT7Bg1M3KCUd29T7R6QWvebfw5AZ
         ZiuCwC28nb6glW1Gh+RU3U26ITznkrlcXDQ7iEOhejEu2HaoBFvOw41UqG7uR81v8fae
         yYFkcoc76cF+70EvjsQNTvhIuHwOfFrf6LTi/zVfR+s9s9mi6U5LrZWGX9eTc8RWDc6I
         dymI4+kM/T1PEr1x+wXDI/sBiKhsn7shAgo0sxCgX3G1wSzyNonEbwG3eBWP+ZCZaSTD
         S1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770864; x=1789375664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=M4eZAM95qPhbCbymXKCO8h7Q0sJ7t1dI6cZqLxw/9qDkU/4Pm6TclaYE/ohiFFKGIh
         UPM1jsYOQ6Wnm9Wye1awVkUza9sspho/TVJHqj7EUMCTnpgvYhDm4h1GAikGPBtuX6Tl
         R2tbZeXU2IEp30qqIh7z/qLcxaGChO/ctglr5xsq8/zFQ+pnk30plhGAmkemmiGNtymI
         pnKAMVQAETCEJ6egT0wA+vtRt8duuxIUIiyST8fe7ajHvPnvgFzhC+zrzj3m10Gno9nd
         UaPivC9jLZLW5NRtuaM4e+/t+DDc+GtCsNlgt3dgULI0WFbExCOtZbM5SE335p5kd9NO
         pYtg==
X-Forwarded-Encrypted: i=1; AKwUvBzAhGIXmW6tcg+/Z/3CObF4V0ksyxdsiTq8WiQRfd/ofqAYBdwIfGsSwl7LRT8+4spofrGJHhBlRZQ8@vger.kernel.org
X-Gm-Message-State: AFuF++nBVFw2Gh7bOC0k/zkhgDaSwyzCK4xVG7j9ykQFeI4yeIH9dsDx
	1uQsft5NzoNpBuN8qVJj05WRNJ5kr+/R1b7CAGm2Z/zXevim6q/g9S57hKB2/QQh+HbMBQiMLRH
	PIOBMeMG3K4hfnIC03EWiiOPZVzbqmjA4UgPKHDso1g==
X-Gm-Gg: AYBFou1BZ1Q0395WmxhyUhxuBuVpeboFNjv4U9pHmtLNPKdV5lAtL6/HKSHBqFMk4bs
	FzhIuLjFQRlLLfuLgj35oHaiMVqSLkPSUxMbrFlQMHxVvUVDAbSyyXF/1ERrYvcpvfkadUD2gqz
	LOf22wBAW+JehSsFq4o+XaK8raBU52VG/4gFmyfNalRDfLxmA55tc6UqrcUyok6m1LtA0xzqSyD
	e7TgSuYuzp8zfv2ZWjI1/CnkozunGmt0vMmZz/hlartqX1Nv9qzp6Yn+gS3MKwwWD4tO1o2QqEM
	vWJO7HD+PCQGHgPVSEtWPNOL6PLwbpwPPbSQrborFXR/5DXhChaqg8wg4kmCkW/3tyLbDcA4OW2
	0aF6C0YkSDymn3xuC1VIA1nqf/Q==
X-Received: by 2002:a17:902:ba98:b0:2d6:fee6:65ae with SMTP id
 d9443c01a7336-2db1232e1c3mr208841035ad.4.1788770863774; Mon, 07 Sep 2026
 01:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
 <20260824110432.1074136-2-robert.marko@sartura.hr> <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
In-Reply-To: <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 7 Sep 2026 10:47:32 +0200
X-Gm-Features: AcwNN1UN3QTAaO3T5aX08ZJGRbzWUSCSQzk2RVV1wbUqXENm6k12pDenn8TnFIY
Message-ID: <CA+HBbNFdqjAJYduFukaZL4+EN12OrsT4qsso95tds828m_z0ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Aubin Constans <aubin.constans@microchip.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:14=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> On 24/08/2026 12:56, Robert Marko wrote:
> > Add nodes for both SDMMC controllers.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 +++++++++++++++++++++=
+
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/bo=
ot/dts/microchip/lan9691.dtsi
> > index a8541c6a098d..2d943ea75768 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > @@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
> >                          status =3D "disabled";
> >                  };
> >
> > +               sdmmc0: mmc@e0830000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0830000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC0>, <&clks GCK_ID=
_SDMMC0>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC0>;
> > +                       assigned-clock-rates =3D <100000000>;
>
> If always targeting an e.MMC, capped at the High Speed DDR mode, one migh=
t consider
> a multiple of 52 MHz here.

Hi Aubin,
The issue is that LAN969x cannot derive a 52MHz nor 104Mhz clock.
Requsting 104MHz would be around 111MHz, while with 100MHz the end
clock is 50MHz.

Regards,
Robert
>
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               sdmmc1: mmc@e0838000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0838000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC1>, <&clks GCK_ID=
_SDMMC1>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC1>;
> > +                       assigned-clock-rates =3D <45000000>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                  qspi2: spi@e0834000 {
> >                          compatible =3D "microchip,lan9691-qspi";
> >                          reg =3D <0xe0834000 0x00000100>,
> > --
> > 2.55.0
> >
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
