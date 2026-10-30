Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793377984;
	b=SeHhOqHtQ/Ws6nEm/mhj3/WBPkKS6ftN3uXyxcsn+vrkuR15aKa6IIfCZLXj4VLY7auF
	 KYNVhF50s6+50KdQZ1NR6h4DwtCAHIu4ewITOrRZauGUZcBiZ81kKnGts9A/aClDPI3s7
	 +376VWlJjEPOQWrC74zOf8EpWZ4glzm1at/UemQnux5tS7zTyZjgWVBzV+rrXUsS9Vobl
	 mOLkdvu/+yXruq2+91jiOZdXAX2nDw53xKGqeetuNnCgyfteY2Tum9Jx/GOQFV4YEuYwJ
	 TA9jEDQg1f5eLt9xDRoBH7Go39UUybRd8rVCEg6hmKwO4rNlCe3Gl+vI06wGOwddXbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
	b=dWHqtxR2tQmfqGvZeREGDdzNjtXjhuRV3EdnpgE+Mq/U+NHz3/O1UZ/zqmDxQGEpRkMZ
	 zg3IhC5UbOohy0qeG10jZDchrGwkRxkdixUD++s4mfH6qicCXA/GoIYYWwnG2xhoiPBE9
	 Xh8BhLEc6Lx1d+g+/YdTBfjXkSU1XA+ZcZ5bXa+6iKob4/0B0b43VzCy/CUCsseadR32S
	 OQl/BN4f+KJ4ojYv1xDInmH8LfyzWp65U/xad7GNJNr+SWjXh0Ko/tUno+kJviRbi7j9K
	 bI16GVHpwnh8vhGCEVDzoBG4EaZ9HodmTvBaWrGfk8cp0Eod4AkZyCz/vkOd/2+IByw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ELhIbo32;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575E606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2575E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ELhIbo32
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso251494241.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793377983; cv=none;
        d=google.com; s=arc-20260327;
        b=pPflbO0OW1TgUN9fISI7eqZVUxR4gYhhfPVYnNpAmUyYu4Bh3l0InX+mmma0Px2sKq
         5jeG/xxGG95H6anR6BJvGNEW5uGKzO88LFJwh/iz3gjG8uldLWeaILSgTkLtC/m12c/Z
         qsyDhqwB2GJH0+N3iF6hUVTVLfGJ8iQXzNqRhVsXFVxEl4LgQ/C3Cyg780hYh77h5FvD
         Ou8khJY0JYMJ0eZWyx+pNRUI50mGIBeLT1/p4sVR4IX9oymw+3hUSIh8QqI5VR8ZmseK
         WagBPrc6u8q7ARmfxSa/HkaX8eWFrVPlVbPENNPkG7VxMi5K2AJE5R6V7Lo7excjgoCV
         +IVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        fh=VTJ2ZuiUOPDNI0QHPn2HAyKQZvZFvDzcnfWExnbq7rE=;
        b=MrLQFDbUT4bgqhxlpRfejtupY44ZrvQ88VgjrK0Psb0Rd7eiCxDAM678XxnupDFUwR
         9JUH5h09JRuSDh0mD7gJVSw/yny37zKa3IMdp+flTiMWG0z9J843uu2/WSvuc1mdqnJb
         xV9ohG1bBMmciCteIgXRZuQOCQhxnUlUtLl4qLCb2LD/0icbyj376v59lM6XB9BGWY5B
         5ENhPrdGHNm38spc+rtD3k10XmpRep4FBWNUhWJRoWdaVVP25By8NjhNpSkRJTAxz87A
         SDq3xA3ALuO/Q2stXaR2dto9x7tTgTFUUv7fUV6F1pfyW7SeMIqa5h2Bo06fXNGfsU+H
         EE0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377983; x=1793982783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=ELhIbo32xPOJqXn+rMnAbW7H61IOW7btHzv+iRpnqkVRYrJEFIbXLqqkuG7tTqvCSq
         x4qBHsp5RFAyDzeYNth7aUf0OQs0StVo8H+QOgczebKyfPy1ShJBEBT971dNHTUW5zWy
         PZSs8BQDDgHkVWfy2wZUpxQjtezgbhekOVaw9l0ib5HI0RdIVS7pJxWzPI0yHt0Uwn0f
         Dw/oFgZXUf3rGYQVteTRA0R5lWzBm2teyhwy1eOvLMtgkQwE+FDdkXAZClhEYNF1PVvP
         lwkm2aWwBTVqQrYglj0uHyoXb9aZ6uHH393OQJak3o7HSgcbZXIiM60YsYtI0PTDvnpQ
         lWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377983; x=1793982783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=wXy+vfAV/vE4VPHaxf/daCHTnObw5wDpNw9fPUJfdnl51zvYPMsJx2fvR3eGClW7wr
         /jtYnqRMxpMzwLuLZSqRlqoGKQIfsWzv1J+gYQ/cQK1Eb7in+gGsjJira6r9V1dRC3WT
         QoWUeXxAiw7eroqSUqWqFetjmlB5+APbbaCmcJgr8brP0q1/LieP/6+njdw/s2eLgKhJ
         XZFGGgwTRHjNbA1LYBAWnWzdZwsfLMkIu1NczGUKxoJUL+b94RRPeBpJ1+h+e5tdSv1y
         lNtCtSZup39W3K6dMlZ+yzR3Hf+d6GKx7eB3s251dp7tSF/A65/T1ZJHPbN6wTtzVu8B
         xo2A==
X-Forwarded-Encrypted: i=1; AKwUvBzA5AWDZJ4+MM6XflthKg8RZQbKlDiEFKmnz5n0e69+FEXP6JsWgLgzeLeJZsTujBzK0fbDxnd3U/xI@vger.kernel.org
X-Gm-Message-State: AFq9FYJiHch94YdZtTLBcw948foMWSJ2hC1q/BTxHCzwLnPtE5E9GzZy
	oycai6FtZ4c76quEwydYVQr+qvuGyyvSdWSRXt/uj8T3O2tEXCwDzOOVKgLJ7pNnzOMiKUDuW88
	4f8xuwNU5BcDsWFEetK0zF2y8AtYGZPg=
X-Gm-Gg: AYBFou0xVGf5E00KVQr6+/Tgzqynf0H9H/ZlvRCNkBUWxH7qlKwdRwFeT8EC5QLWnLu
	0Pz0Qz8AhOIZHCfUBOej0b04aQYAbbncqoI2Q6pxllXbhbqE9N6EtD9qMrq0/tAiqsIvOu+GyE2
	hS91Tok7G7zk+gIXRhk/5prLxobT+l+TNelYRwfS74c5nSxVlGO49r7XVBxxpjwu/xL08Jnimri
	9wR/IrNpVxTt5QEN5wp07jYAtw7kECpvB07dfDaMQRwCaNN7+Nd2G0Bp4qadPItqwzjPDyskOn/
	9CX2y2rHMtUVN3lD/zAPUmo2UKi7V5/HYFdRCA/o8JVVy/SlN++p8UZWLaDTKlL51A+pSDMva/x
	ASdEBtoL9E4HcvquQH/031EjuV4nXYUNWfESdvtDipm3zta3zLc/4iVaQHO+FRIa0kl2Hbybbwu
	N1cH5asBvCeJshZ+nRdUAzX8b4iTfEVGHL9jxFEC3IlG84glA8g/M++v2XHFgGHyzrsNgEiU7WA
	+4o5F7W9h+55s2uOdmS06iV7x773Q==
X-Received: by 2002:a05:6102:2c0f:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7d0725528eamr1573062137.6.1793377982874; Fri, 30 Oct 2026
 09:33:02 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
 <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com> <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
In-Reply-To: <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 10:32:51 -0600
X-Gm-Features: AclHuK9dYwyBnU9vyC-IBxpz7TsWhpjTcY4ZwN-3UTn5urI74GWhcbY5yqJONhY
Message-ID: <CADvTj4on8Kx2bW05sSp5uHCT=LCL1L1Jmh_cOo2TEnNdx-mU9w@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:15=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 29 Oct 2026, James Hilliard wrote:
>
> > The A523 UART integration, also used by A527 and T527, has 64-byte FIFO=
s
> > on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller rep=
orts
> > its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> > offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> >
> > Read this field in the sunxi setup callback when platform data does not
> > provide a fixed FIFO size. A fixed size takes precedence, so H616 retai=
ns
> > its 256-byte configuration without accessing FCC. The probe has already
> > enabled the clocks and deasserted reset before invoking the callback.
> > Leave the FIFO clock-control bits untouched.
> >
> > Validate the depth before generating the RX trigger table or setting th=
e
> > transmit load. The quarter-full threshold must be positive and the
> > FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
> > trigger API. Report an invalid depth and fail probe instead of generati=
ng
> > zero or truncated thresholds.
> >
> > Select this setup for the A523 compatible. Derive the transmit load and
> > RX threshold table from the discovered depth using the common sunxi
> > helpers. This handles the different FIFO sizes with one compatible and
> > one receive-trigger mapping.
> >
> > Like H616, this integration has Allwinner-specific debug-divisor and
> > RS485 registers overlapping the generic DesignWare feature probes. Use
> > the common sunxi PIO setup, BUSY-safe integer divisor programming and
> > software RS485 handling. Keep the APB clock gate enabled during termios
> > updates with SKIP_SET_RATE.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 3bc6735fc253..2ab91f479fc6 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > +#include <linux/limits.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -45,6 +46,10 @@
> >  #define RZN1_UART_xDMACR_8_WORD_BURST        (2 << 1)
> >  #define RZN1_UART_xDMACR_BLK_SZ(x)   ((x) << 3)
> >
> > +/* Allwinner FIFO Clock Control register */
> > +#define SUNXI_UART_FCC                       0xf0
> > +#define SUNXI_UART_FCC_FIFO_DEPTH            GENMASK(31, 8)
> > +
> >  /* Quirks */
> >  #define DW_UART_QUIRK_OCTEON         BIT(0)
> >  #define DW_UART_QUIRK_ARMADA_38X     BIT(1)
> > @@ -64,6 +69,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Fixed sunxi FIFO depth; zero selects discovery through FCC */
> >       unsigned int fifo_size;
> >       unsigned int quirks;
> >       int (*setup)(struct uart_port *p);
> > @@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
> >       p->type =3D PORT_16550A;
> >       p->flags |=3D UPF_FIXED_TYPE;
> >       p->fifosize =3D data->pdata->fifo_size;
> > +     if (!p->fifosize) {
> > +             u32 fcc =3D dw8250_readl_ext(p, SUNXI_UART_FCC);
> > +
> > +             p->fifosize =3D FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc)=
;
> > +     }
> > +     /* The RX trigger table must contain positive, byte-sized thresho=
lds */
> > +     if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
>
> One additional comment.
>
> What is the reason for this "byte-sized" limit? Is it Allwinner specific
> or perhaps the use of unsigned char in 8250 driver to store them?

It comes from the current 8250 software interface, not an Allwinner
hardware restriction. The per-port u8 threshold table is introduced by
this series, but the existing set_rxtrig() callback takes unsigned char
byte counts, and rx_trig_bytes sysfs writes are parsed with kstrtou8().
The existing per-UART-type threshold tables also use unsigned char.

> In the DW databook the CPR given fifosizes go all the way up to 2k. I'm
> not sure how large actual UARTs make them but applying the FCR formulas
> one could get > U8_MAX thresholds.

I haven't found an Allwinner UART documented as having a FIFO larger
than 256 bytes in the vendor manuals reviewed, and the BSP configurations
checked also stay within that size. With the Allwinner mapping, the
largest threshold for those depths is 254 bytes, so the current types
cover the hardware identified so far.

A larger FIFO could exceed that representation: a 512-byte FIFO would
need a 510-byte threshold, which would truncate to 254 in our u8 table.
The check prevents that truncation. It is a software limitation, not a
claim that Allwinner hardware cannot implement larger FIFOs.

> If it's just 8250 drivers type limitation, I think the comment should
> make that obvious the type could be changed as needed.

The comment should identify this as a limitation of the current
byte-count representation. Supporting larger thresholds would require
widening the new table and shared conversion helper, together with the
existing setter argument and sysfs input parsing. Widening just our
table would not allow those thresholds to be requested through the
current interface.


>
> --
>  i.
>
> > +             return dev_err_probe(p->dev, -EINVAL,
> > +                                  "invalid FIFO size %u\n", p->fifosiz=
e);
> > +
> >       up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> >
> >       dw8250_sunxi_setup_rxtrig(p);
> > @@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h6=
16_data =3D {
> >       .setup =3D dw8250_sunxi_setup,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_a523_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_t=
da54 =3D {
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> >       { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> > +     { .compatible =3D "allwinner,sun55i-a523-uart", .data =3D &dw8250=
_a523_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>
