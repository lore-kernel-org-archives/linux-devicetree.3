Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A608282F3F
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764480; cv=pass; b=QRoZSmfGhwuiCB8sF/NBapDWKsVQfXJDZL7mvgwax3W6ULlg5bcLFNEtffRtWLYcsgJ79GOgfM7AtPNKmz293Svw0P8iiFWddfRsorvJeDiFW4sDcpfC183FXe8MWHXT0g2yr2fAQISx4f5wffEwN+puYuTpEGTxfQdt+86yf4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764480; c=relaxed/simple;
	bh=luig+1o1M/fsF9vaNIsARo6CqC/xBHmV9/YvD0slYb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSBWNR3zb4Y6WC/Z9xEKgKdqQxXb8+IYZ6bfD/0pwpvCYiAShTkR6e1QzA9Stam4rU/rFLVzZl7FPsisLYtabhE09RBLslidr8yG13eNBMYVI+eJgr5a8eznGiORClACUeJgG8oGswC7A+yxDSCboDlhcLlX/moDwX+rHrRyZOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCuLR73K; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCuLR73K"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c25085f2426so13864566b.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789764477; cv=none;
        d=google.com; s=arc-20260327;
        b=BCpOVtukVOhWldnbizIbf0Q6ldiYOwWPQKEw77Mxtvwqi4q1xX8O0L+5x0UMj6IbOG
         p+UEXtp9+0UAgIXWlffV0NaQz//Fby62Z3NgnTnQajDZ63MGBZJ0FEx4BJEqWob/Wxbp
         jwYlL3K/mnBQsJsgigMm6mBRAlPMT7PZOQvme6+9U1lgjRDL5n1Pqd/nNGVyPdYIteER
         L27WnpAM9kMHOWH1LIAeN1k0xTMVqYWJ75y2hr5RAmWP4PLXXMzKbtKROfBbCJ9/w8vm
         SxsKLwhJoUXcA5U5LNlqfZeuj5uJZCEo1HM6DpOV75aaBJ/ME+oRjO8/+B1Wyhlt82M5
         j5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        fh=V08R0FY47F0Ewr9EIBAZsHO2s08GoRbS+oW8OvKRtrU=;
        b=DeQpoSK70a4DB90ih0onOhqjihUj/Yh60/OAwOKzpGKXgvw/dBVR9wMh32PrNiJW0s
         jGch+XEavlmt2VSvBX2ppM/Nxv/k6j6J/KKt1c5a0mD4wrSVVjteYd22juAoPx4DesSE
         Z0W/cjGmWjDpOiqpVmyit00WKyMiwyUT26bU1UNixc+boBWSy36M/X4I65ikn2yxWu/k
         K8y46GmmE3LvHs3dPb6OdAZxYm4eLdKrMEwrGu4sr5aly4lWZpHoQCNucjJldZcyQn3V
         5d4inSguBh0AuHEze7ijZxXNWYT5hsj0WtXDR1mt0MX8grUcx1HLQAL6mIu+sx4YXIX8
         R5TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789764477; x=1790369277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        b=cCuLR73KVHvbhj1BW3iKNszcb4aUB9qqdA4XGOijCaQ7fmhN8wUHGNRbcSx3Bh4706
         AzM2uzf+8D96oFgD73Mf4RfIYGfhYtNTv74ww5HbJbEHu2GrjCEV4ATmi5lfr+PntkeR
         m7h9JOYhiKT87Px/vkWr1mW5xevxUJ6uYiAJmeGfaIZX+vb7PYNWnFIMnWl9kGtDcuZD
         q1TWA+kD+9VfDtCUaE/yZrEi55siMcGJCHX6bxB6zDzZPOgMO45jDjUOZjEcvsscehe4
         wGWi/btP0ioFL6su9oVwG1NhJSljCaUdR9aRc8QPyvB1cDiTpwBRTA3g5HoxHdjl5X5X
         HxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764477; x=1790369277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        b=jOptz0jimhyKaepDitL7Rkai37htk81zGUVlZJqbTGQiA5eM9dNTKIqNZBPF2+G1Km
         HuXU+bkYzyc9oKNTq/sVjQmgUFkGtjteQ2TVpCC8e5GdExayuLuOAgg90j7pywKFvTYq
         X6Z00Xn0ahdHA7V/8Pe7GEAXsHr74+exv3K+zb/OEo5tBgxaV1Pot4nmm7NIDuf/skgF
         5wE80Zj1tfsWp0qama7WojVhTfgEAtSmFfOVJaBiztLu5dri/G4eRXfDOjqjEMXGJE7s
         BLvRxBtp9rifui23ydcBVSbfub57UZo8RBEEphiAXbk1zYOaboCSk488YpGaPJI2OV22
         Fm6A==
X-Forwarded-Encrypted: i=1; AKwUvBy0uwqGIPgjHZXvyrBaXwL6QVD/viXBE/WaAXvSxrvhlH7YuOv8P3whX9CuItaY8G8XSrUwaICRSW65@vger.kernel.org
X-Gm-Message-State: AFuF++kf3BUmj8ItXG2Mo4VIH8edc9kkeTDKaXTv1yX18hS3VTf5CtT7
	/Uotct1FYFKMeGHgmMLppg93IhgWEPs5JibveQDVb8R4sGaGERrhZ+WOSk0NRISYUP4e445PVz6
	CoPpNA1RNK5vvMZ662/jDqvmjLUIMUhA=
X-Gm-Gg: AYBFou1uPj6TGwiJzjLXmVrPKJ6GTdEzhRpt2nqmyX2vKjL6d7mXTAN1l2Apki1s4Q0
	DICzhMym5CqV0QKEKEYnsgl3KR88152XWGVX2YVyPHdH34J6h1X4CDNnJLNCKUol5r9Mbwm+q0O
	wsc5X1IIeShHbIXjb+dNsklnZR3WRVR9769IN2zpCfrRPWv3kafRyPYEYxlaaWAbUbpSPIZMT2M
	mDnro7hbdDZ/Abt+9tdAr2z+OIB0g1Oz+JmFvgDA5zsX0KqSb4vHzSpLw9pnbOLzq8WYnmEBUlG
	t4rfbfxa5AmfIK+r1zMRh1rbjgjUoHfSPJ6+cYXC4xaItbu4aS/4kEH5wnsp2fn/sAl8vTHRbVV
	T9AWlItfetjnE
X-Received: by 2002:a17:907:d02:b0:c25:3ccf:bd9c with SMTP id
 a640c23a62f3a-c2a1a8e09e8mr331776566b.2.1789764477295; Fri, 18 Sep 2026
 13:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
 <20260916-ti-dra7-omap-sham-fix-v2-2-4eadb60081e5@gmail.com> <20260918144224.4dfb8515@kemnade.info>
In-Reply-To: <20260918144224.4dfb8515@kemnade.info>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:17:44 +0530
X-Gm-Features: AcwNN1WKvA-fdN2xNZdCXGZd1cxpuLrv71RZ7MqA3wlpHyScvRfY20wc8pzPN-Q
Message-ID: <CAOWyW_5GU__FE25POrjKH=CmOHaeBRJPw4xS2cdodePm3LydhA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: ti: omap: dra7: Remove clocks from
 crypto nodes
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:12=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Wed, 16 Sep 2026 02:29:39 +0530
> Bhargav Joshi <j.bhargav.u@gmail.com> wrote:
>
> > The omap-sham, omap4-des and omap2-aes crypto drivers do not use
> > "clocks" and "clock-names" properties. Clock management is handled by
> > the ti-sysc interconnect parent wrapper. The dt-bindings for
> > ti,omap-sham and ti,omap-aes don't define these clock properties. Havin=
g
> > them in the child nodes causes dtbs_check warnings.
> >
> > Remove the "clocks" and "clock-names" properties from the sham, des and
> > aes nodes.
> >
> > Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> I was a bit too fast here, clocks here are different from what is
> used in the ti-sysc block. So some more thought and argumenting is needed=
.
Clocking is handled by ti-sysc parent block, furthermore other dtsi
such as omap5,
omap4, am4372 which uses the same hardware doesn't define any clock in
the child node.
parent block defines a clock with clock-name: fck
clocks =3D <&l4sec_clkctrl DRA7_L4SEC_AES2_CLKCTRL 0>;
clock-names =3D "fck";
and child main part as
clocks =3D <&l3_iclk_div>;
clock-names =3D "fck";
If child node needs this separate clock  in child node then binding
for aes and sham needs
to be updated to allow clocks and clock-names leaving des binding as it is.

Best Regards,
Bhargav
>
> Regards,
> Andreas
>
> > ---
> >  arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 --
> >  arch/arm/boot/dts/ti/omap/dra7.dtsi    | 8 --------
> >  2 files changed, 10 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts=
/ti/omap/dra7-l4.dtsi
> > index a595745afe59..bca035fd7e62 100644
> > --- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> > @@ -2086,8 +2086,6 @@ des: des@0 {
> >                               interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&sdma_xbar 117>, <&sdma_xbar 11=
6>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti=
/omap/dra7.dtsi
> > index 711ce4c31bb1..0784c6d9cbe4 100644
> > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > @@ -1012,8 +1012,6 @@ aes1: aes@0 {
> >                               interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 111 0>, <&edma_xbar =
110 0>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1043,8 +1041,6 @@ aes2: aes@0 {
> >                               interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 114 0>, <&edma_xbar =
113 0>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1073,8 +1069,6 @@ sham1: sham@0 {
> >                               interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 119 0>;
> >                               dma-names =3D "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1103,8 +1097,6 @@ sham2: sham@0 {
> >                               interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVE=
L_HIGH>;
> >                               dmas =3D <&edma_xbar 165 0>;
> >                               dma-names =3D "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> >
>
