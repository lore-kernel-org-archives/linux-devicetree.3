Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864B432E86
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115659; cv=none; b=NL6Z4La1DGWYXumDylCRe0UqX0HVnnevW8WNlrwEj14hpfGbka7Efna4BP+kzyLfoTdXjvXcJnx9Y/Xku/eVIP/jJDeW4WzDaZuDjHg6MecLNz1FlZ0URYl+Uvm4I6toafDoDEm1wSzzyr/o5GQ4d4/O3nncZaZsTZMLoeyLZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115659; c=relaxed/simple;
	bh=QKZH5trVhSKWAXif72FqybKEWVn65IqnVfhoul/Jomk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLzoUbqJp8dGzjiAbvM3a7KDRBkGrzi4wIEMrABB2XUoGHtg1cvNsAwf+/FkoWveGsYmzEMOVYLTGA7S3SDXnq+sI/oBwLe07u0S8FMC9VhpyEPRJ3GrzG+nYXSONdwmt3Z+uy7DvVy2ie2L43FHE8K/zEPAy2rg+6QOE3wDTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKn5s5q2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKn5s5q2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so38166205e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784115655; x=1784720455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bte0VZC2iVWnsevsBDUvhXv3VfECX+p8ZU2vUJS74DY=;
        b=mKn5s5q2zouKj2xuwLkgpINMdbuPgyTbcIgFAaacOB38WtS5/nlLR0ouPJO7gMexMn
         AtH3caYmYvCCaMDIPuKqZxcZnjfnoVcOAFrJIoSOmws1pKRh9/wfJ+xF0lt0LSoxi6CB
         DyK7lsQljE8ZVk/E9fM9pHcqdpc1qOqktvcuz5jS5Q4yBvyhIc4TrHk7csJyI1y1cUGA
         o9q8vI4q1wKW3sotC16GHk28URGk35RlNvVB2T6RyAj6sG4jE97elqWkfBRnzMoKlyTz
         /+zCER6RyYquWP7ts07K5Zqepc9rBZOLTZW1ZmaKyG7tlJuuFv2bj/27o1FJmr7hzqK5
         UDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115655; x=1784720455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bte0VZC2iVWnsevsBDUvhXv3VfECX+p8ZU2vUJS74DY=;
        b=UQz7FwLNqRGbJy53YA0Y4ibu4YWApoJ9UFGwenRJSx+Mir2FZdGuLIt4BLMN5bE61J
         OtdTUwjjgDbZCzxhwNO4AM7szi76vPJiRgLVwdJMyT99JrVW6UaP+pRmaANjjIo0ibra
         zGhpK6crYqDNV1iaeeWFQnNebeIXUGZjs5Jy66cXos/PaAbtG3YUi6kNlDy8bVUL5+fO
         zTwZ7PLhub8++uCyQMar8KKwKZptTWeM1hEaGQfsepV1ETQLsi3SjSEd5zGB5UWA7Myw
         ExZuy7FzufvyzQldA3g6ny1ac2bMYONyYv0vFXHqJqwtAN7Ri3lyZ8LOT4A22eUqqbvl
         zeTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3UM0VNLeoGUmi7YZkjZqtmEjrMkVVV+96em7Eh6WgNKcNv7v7BovHPKJyobMr5Rp/n/vqS/shLke2@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrKlY0+8pMnuk4YZvNJr5+X6nKK+8FVPh8tyesoXm/ZsCq8cZ
	fia1edML22Uk0jNC62xrkF7iAyEeVADxiuwwWhIo38PAVE06qeVgGRqw
X-Gm-Gg: AfdE7cmQ8Jo5Cf3kNhobWurb6B2YND0JGaAjJlPYXzL5w7UEVJmF75YOXl3jf+CEHg2
	pcHpTgXv6GEfpcWzmvH1F+bZxXOGiZNt5EvRcwqPjBKxrFc2wNbYbquL6HU0eR4Yff0xFlC8U5I
	PyvANXYMSYRWwxnUhAEqPn2K4X44hDLjT/X5Lt2xeY2JgllQXYkveHKouFF7hepmQed1py8HUtk
	hkk2sw+OLh5za00dFC+ZXk8u0GZoKPDl3hz+TXwJ0g0iL3iiSUg+dfb/0xuxzirYDjIrF62Gk+Y
	ePWDjQJZrE7+Lk3tfNvzEh4NJQSJL5RhDIoz8tOTMmtn0u18PRwgnDcbQpktCfcw+O1MO63U3xy
	MP1KPcXgiBDGAEEVhcfGl4l00ajzT2u+/dO8BADQQpWk8imm/60Y9g0mGhbVlUUlbBdStU1ZP0I
	iprafUWsKKOOlzkIER3PjB1uLIZQEdyFsLcHxk6mH4fWYoUZfC/0NMQiYVxjHqMVlOEqagnpYpR
	3CF5ZqOnxaKsGeejOtmY4I/LnjG9ITcDfiC4DRi0cPlLyKkP9UoppJWyC64s65Ps8PU1Pt80iDw
	6nXNXPFGOF+lj3O6tEPTi/rQaIxsH3VDloSoCquPIIGbAUcS6jUX/K3VNr+DgA0nWO1Yn86SlCZ
	9Elswqwp/C1WpVhQ4qPaFS5K8ewcXZ9MsLg==
X-Received: by 2002:a05:600c:524c:b0:493:e890:9e0b with SMTP id 5b1f17b1804b1-4953c27e9c3mr28946715e9.26.1784115655256;
        Wed, 15 Jul 2026 04:40:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm149543755e9.2.2026.07.15.04.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:40:55 -0700 (PDT)
Date: Wed, 15 Jul 2026 13:40:53 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Martin
 Kepplinger" <martink@posteo.de>, "Sean Nyekjaer" <sean@geanix.com>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Martin
 Kepplinger" <martin.kepplinger@theobroma-systems.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Message-ID: <20260715134053.000012d4@gmail.com>
In-Reply-To: <87pl0oo5iq.fsf@geanix.com>
References: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
	<20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
	<PLKuTyVcES-o-CEsU7WA3Ir7-phI9WLM9PJ5UErJeahWgus8heVF4GPky0SC-EpaHLv54lZya37ivhub3W9kNQ==@protonmail.internalid>
	<20260715104542.0000433d@gmail.com>
	<87pl0oo5iq.fsf@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 13:29:17 +0200
Esben Haabendal <esben@geanix.com> wrote:

...

> >> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> >> index 7d683686dd9d..a20c02ce0b9c 100644
> >> --- a/drivers/iio/accel/mma8452.c
> >> +++ b/drivers/iio/accel/mma8452.c
> >> @@ -81,6 +81,8 @@
> >>  #define  MMA8452_CTRL_REG2_RST			BIT(6)
> >>  #define  MMA8452_CTRL_REG2_MODS_SHIFT		3
> >>  #define  MMA8452_CTRL_REG2_MODS_MASK		0x1b
> >> +#define MMA8452_CTRL_REG3			0x2c
> >> +#define  MMA8452_CTRL_REG3_PP_OD		BIT(0)  
> >
> > I know that the defines are completely incorrectly aligned, but please
> > ensure that at least all the defines in this block are aligned.
> >
> > Also, consider sending a patch which aligns all the other defines.  
> 
> How are they incorrectly aligned?
> The all look perfectly fine here (visual tabs space set to 8).
> Should I convert all the tabs used for alignment to spaces?
> 
> AFAICS, I have added the defines with same alignment as the other
> defines in that block. I believe the misalignment is only a visual
> artifact caused by the diff format.

Ah, I meant it as currently the defines look like this:

#define MMA8452_WHO_AM_I			0x0d
#define MMA8452_DATA_CFG			0x0e
#define  MMA8452_DATA_CFG_FS_MASK		GENMASK(1, 0)
#define  MMA8452_DATA_CFG_FS_2G			0

but instead should look like this:

#define MMA8452_WHO_AM_I			0x0d
#define MMA8452_DATA_CFG			0x0e
#define MMA8452_DATA_CFG_FS_MASK		GENMASK(1, 0)
#define MMA8452_DATA_CFG_FS_2G			0

I'm not sure if this was intentional or not in the original implementation.

...

> After reordering member fields, I get this:
> 
> struct mma8452_data {
>         struct i2c_client *        client;               /*     0     8 */
>         struct mutex               lock __attribute__((__aligned__(8))); /*     8    24 */
>         struct iio_mount_matrix    orientation;          /*    32    72 */
>         /* --- cacheline 1 boundary (64 bytes) was 40 bytes ago --- */
>         const struct mma_chip_info  * chip_info;         /*   104     8 */
>         struct regulator *         vdd_reg;              /*   112     8 */
>         struct regulator *         vddio_reg;            /*   120     8 */
>         /* --- cacheline 2 boundary (128 bytes) --- */
>         struct {
>                 __be16             channels[3];          /*   128     6 */
> 
>                 /* XXX 2 bytes hole, try to pack */
> 
>                 __s64              ts __attribute__((__aligned__(8))); /*   136     8 */
>         } __attribute__((__aligned__(8))) buffer __attribute__((__aligned__(8)));        /*   128    16 */
> 
>         /* XXX last struct has 1 hole */
> 
>         int                        sleep_val;            /*   144     4 */
>         u8                         ctrl_reg1;            /*   148     1 */
>         u8                         data_cfg;             /*   149     1 */
>         bool                       open_drain;           /*   150     1 */
> 
>         /* size: 152, cachelines: 3, members: 11 */
>         /* padding: 1 */
>         /* member types with holes: 1, total: 1 */
>         /* forced alignments: 2 */
>         /* last cacheline: 24 bytes */
> } __attribute__((__aligned__(8)));

This looks great!

-- 
Kind regards

CJD
