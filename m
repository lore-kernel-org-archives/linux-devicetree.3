Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575285;
	b=2RGJVxvCY2SMHdiPU8F+f5gF0fo9QJMawnWUQymm5Mr77nzqT+50HfwM6Rqy3jtUz+ks
	 ynQvRP5u3LtC8PSXy7puyeoMcmgYO5jsYTGczfR6J3rMrDqaAzX398KGwKkc78nYPoms/
	 huaIBoU12ScpVUXLy+FTN4tGeGyebhfneYU/8z0KTZxg3/uatIYlmG8hnZBtoUbYqzGhF
	 gTMOtPwZU/4NWI/3ulOkrJs5z2rzg3G5JiooU/LIjOOZGtUom0A/r5S3ph41n3abjZtki
	 LGHg/jSDUy5HUlPUgq6UxIGsj5RNDBCKLfhsPagZRNEOCs15HJZBuMPdUGZKB+7X8gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
	b=j6KHMYkt0hRm5NrNGxtTvkl8JzNO8P/AACBRIbeRihu2p7T/NR7Z0xZrY2nrkS7mf9x7
	 iyW/j7xmY4vPjQTFqam3KgpSiyLSkHzqIQgjTI9YeYzpZby6g4aBK8qSOhL7FWnWG4tfP
	 RHMx1M6QS7qy4sSdXUIo3fuu6wGTXIxs/Bq0CXNgy7yVaLfIE3I2kW3D92AlR+u6ReCBA
	 XSXrUNvPoO/GIwHFH+gLgWTYYNyrP0FvluIWz2dl5SMp7Yc4zX7550RgK33t6gC4K50V9
	 ptu5PPpxsSoOU+vSN6QEYsYSZla4XCh9jPBmsK29KSwaNHWjW87XaAzkg41DIh6jELA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GGuniyf9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1B606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F1B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GGuniyf9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c450ab1483cso74285166b.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575282; cv=none;
        d=google.com; s=arc-20260327;
        b=VOBVtABGD2vxbLIolQUlnyoj8VlPnj6pJ0jC9eRqAgyg40YI+36n2VUrn4lDPimQcN
         BZlzOTsL8jC+RlU3HW8I3XrnehtVQnnHkdmplIVyiRFMbOSbkviUAgQyfOShvrHpQl0m
         H8FVYnvOMuDDXIB8dfZ2Q7RMpuGQ/C7Asp5saQQ7WYAKlPdDL+75B2XjVtWcEV7izCxu
         NV1S+PeM1BxDHqkwTEADVWuSJoaCiBHhj/ZDI4wn/obSDP2Gxuu04lGuLMOeqIPthVjF
         ZB+xbplfGSR6iKM3Al5wa2/F9rpVrqTUESTTIFMmU8MiSxo2BRyvyIQvnnXDEUE+trKc
         0K9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        fh=6SztXjpx6mzFE6zhk+kkk6Cl8d9LAGvMSXWycDy8J3U=;
        b=IutHcHgJI+MS+VjCUUyugOU/Npj/qNJKWtoAj5FXBm7EqJb8McO73pEABMG3vLdiut
         HofaKIlwglzJZw+YSTw0WtoB2KYrqTCEe7jhT1Ga8h3yw/c4Y9+I6WEDY1rj5+JVMyCm
         0J6HTzxA6dFAqH0nyaQL1Lzv3XzFZnffpaExIUqFh6+gOGmAPlSyjMeSZimAhtH0xr8h
         8qIf1W6l+pF4wPrAR2gll8y6/BxIOjhDcvBMQ/RLjFsyyp7xp7nAjZqH0RT3ycjaqtPK
         A15ML14JuG3sq89gJz057H63bDcRykRJWG4+BQWVGQTfe1RPCe1qFustfvnwBNiqSpHa
         Rcew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575282; x=1793180082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        b=GGuniyf97b3/3qf2kOw7zE1y9bg2q2YhKxuh/BgA0O7N2SlHc1Rf8Nk7HSRoXrqNtH
         9AUtTN7rq5Hhrvo4DNhwO1UgeQmIejhuWtgh1qXSprVMQXJqX1NmN21uwx3q8RrTnG/d
         K8xbvN8gX/CKKxmz1dvx8CA58V/LTi3yq5DW8gosiGfsRbh7mmr4WohpB2ijV51t40X/
         sPaFaiMRZk8I2d+aC3UgyncPydJ879Y9MOyc4GP1xaYND7R5hF2J8eY1s4xJ6sj942hw
         SeCswqFSEE5yRsEmd3yr2snuuJcqqC+Mm53kWbpWTGD9l7x7o4/2XACB8G8/O0mhl9Li
         hBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575282; x=1793180082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z399+Abl7xZhJXeuJLnTT/RJk86fuw0Er0XDukPBP/8=;
        b=Oonzuoa1H5yHD6TNGQ67poeSKYzwJ7cHRAc/W+re45jr1Ix2ykdLpYBelwsPST5l8m
         Eb8j6rdpeDWjWu2Qa1afn4uN5ryAP4bjq06QRk1fAsJFv3dx3pZXKmFiyP9vhGEBF7U9
         a+5uLqUq0OaxhnUemIDsUh0RV/eJfjcB9ENMe2YL4u22f+rdoEDw58qo2fumdt1CXKO7
         iDMdsKmexnbLqj3DSrrq9SAB2NMlqqA0l8dSeBPrgWjH5HrNAeRYtz62Fjpzeh5f0n5p
         +wxFdE5pr6vKwtOMtqQ0DXfz5JbXo7/FA/h4Ce1X9WhLkpZm54stY855wkYi5JdoIdDa
         RvQw==
X-Forwarded-Encrypted: i=1; AKwUvByrWJFCnLG6VGlm2hmHE0YcXMYQlaA3uBdB9T3tXdaxlTRtyB/Od/L0yQwljQE/MDwrGHanZ/6F1kxN@vger.kernel.org
X-Gm-Message-State: AFq9FYK9cWeZ0kn0EAfC3f4nm1YFeX9k/zig5MmuYat19TpWaBGXjRdz
	w3wZQLWCQZliQKDqHfgo/aU3n3T9YdYtOVHFJLMYdWOdhNUGPaB56OfZv+MaxSpFzeY/gHeSiwo
	/lpOpfl9/yX38zZd5kRcrMdPDbmgP8pdHsevpSZZjxKSK
X-Gm-Gg: AYBFou3/2yTqxZdeCw/Pkebjb0O06x1B+iPLbhPUVhQZmhu1X7VzXARj5jeqfCwT29l
	+FQmDFbyOTwo+Hy289JFJHnHV3ceg2OCKLkTplQctWi5+S7Ws9cg4EiTAeANqY8QCKpiL1mLTD2
	y0d55KTx7V6+qiv4Ixs5/272JFAAihzZt6dO0l/CIbRYubIFufr9PpLiugP67m89xUtHzZQEJrh
	T+nwKFVDkeX8H+HgU8Id8ZPrPfoA1un8p1yeBnes0MlnjjotVhFOnRqktS/eS5x4cYmkUW709rF
	4g0PruGr0xaZ07KjbyIaV2JGLR8UBEqCGxWt85ESudBUrGwQBUDjCxr4VcRQZOAuagMrmCrDsrh
	seyBWBs54j5MGSXucDrS0ayD14HeS7lFNipq63Rk=
X-Received: by 2002:a17:907:60cf:b0:c3f:d8f2:f08e with SMTP id
 a640c23a62f3a-c46799f0243mr132517566b.44.1792575282090; Wed, 21 Oct 2026
 02:34:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791535540.git.zhoubinbin@loongson.cn> <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
 <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
In-Reply-To: <atEHYLnJ5GTr1-ae@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 21 Oct 2026 17:34:29 +0800
X-Gm-Features: AclHuK-aRj06NVXLuWOmMZkBnwYL_mNbl22DV3t6IfO159KFky0fZBZvqpjeCuQ
Message-ID: <CAMpQs4Ke44d=ijRPbmZM5FZ0YReRH1U4jFMA=RPKU1VNLsNv+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Fri, Oct 16, 2026 at 1:03=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 09, 2026 at 05:19:34PM +0800, Binbin Zhou wrote:
> > The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> > implemented as a set of routing fields in the chip global configuration
> > registers CHIP_CTRL13/14/15, which select which physical channel of the
> > on-chip CMC DMA controller handles each peripheral DMA request.
> >
> > Add a driver that exposes these routing fields as an OF DMA router. The
> > router's allocation callback validates the <request> <channel> <flags>
> > specifier, programs the corresponding CHIP_CTRL register field, and the=
n
> > rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> > controller's xlate is used.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  drivers/dma/loongson/Makefile               |   1 +
> >  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
> >  3 files changed, 400 insertions(+)
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 78622b255f88..0b0c6ea41c64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15355,6 +15355,7 @@ F:    Documentation/devicetree/bindings/dma/loo=
ngson,ls2k0300-dmamux.yaml
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > +F:   drivers/dma/loongson/loongson2-apb-dmamux.c
> >  F:   include/dt-bindings/dma/loongson,ls2k-dmamux.h
> >
> >  LOONGSON LS2X I2C DRIVER
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > index 48c19781e729..271fd38fa8f2 100644
> > --- a/drivers/dma/loongson/Makefile
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -2,3 +2,4 @@
> >  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-dmamux.o
> > diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/=
loongson/loongson2-apb-dmamux.c
> > new file mode 100644
> > index 000000000000..01bd3ce4ca25
> > --- /dev/null
> > +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> > @@ -0,0 +1,398 @@
> ...
> > +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u3=
2 request, u32 channel)
> > +{
> > +     const struct loongson2_dmamux_map *map;
> > +     u32 reg_val, route_val, high_val =3D 0;
> > +
> > +     if (request >=3D mux->config->num_maps)
> > +             return -EINVAL;
> > +
> > +     if (channel > mux->config->max_channel)
> > +             return -EINVAL;
> > +
> > +     map =3D &mux->config->maps[request];
> > +
> > +     switch (map->type) {
> > +     case LOONGSON_DMAMUX_PAIR:
> > +             route_val =3D channel / 2;
> > +             break;
> > +     case LOONGSON_DMAMUX_SINGLE:
> > +             route_val =3D channel;
> > +             if (map->high_reg)
> > +                     high_val =3D (channel >> 2) & 0x1;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     guard(spinlock_irqsave)(&mux->lock);
> > +
> > +     /* Write the primary register field */
> > +     reg_val =3D loongson2_dmamux_read(mux, map->reg);
> > +     reg_val &=3D ~map->mask;
> > +     reg_val |=3D field_prep(map->mask, route_val);
> > +     loongson2_dmamux_write(mux, map->reg, reg_val);
> > +
> > +     /* Write the extension register field if present */
> > +     if (map->high_reg) {
> > +             reg_val =3D loongson2_dmamux_read(mux, map->high_reg);
> > +             reg_val &=3D ~BIT(map->high_shift);
> > +             reg_val |=3D high_val << map->high_shift;
>
> assign_bit(map->high_shift, &reg_val, high_val);

I think `assign_bit()` here is not quite suitable, reg_val is a u32
(returned by loongson2_dmamux_read()), but assign_bit() expects a
`volatile unsigned long *`.

How about adding a helper function:

static void loongson2_dmamux_assign_bits(struct loongson2_dmamux *priv,
                                         unsigned int reg, u32 mask, u32 va=
l)
{
        u32 reg_val;

        reg_val =3D loongson2_dmamux_read(priv, reg);
        reg_val &=3D ~mask;
        reg_val |=3D val & mask;
        loongson2_dmamux_write(priv, reg, reg_val);
}

Then we can call this function:

/* Primary register field */
loongson2_dmamux_assign_bits(priv, map->reg, map->mask,
                             field_prep(map->mask, route_val));

/* Extension register bit if present */
if (map->high_reg)
        loongson2_dmamux_assign_bits(priv, map->high_reg,
                                     BIT(map->high_shift),
                                     high_val ? BIT(map->high_shift) : 0);

>
> other looks good
>
> Frank
> > +             loongson2_dmamux_write(mux, map->high_reg, reg_val);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> > + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> > + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to o=
ur
> > + *            struct dma_router embedded in struct loongson2_dmamux.
> > + *
> > + * Return: NULL as route_data (nothing to free), or an ERR_PTR on fail=
ure.
> > + */
> > +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *d=
ma_spec,
> > +                                          struct of_dma *ofdma)
> > +{
> > +     struct loongson2_dmamux *mux;
> > +     u32 request, channel, flags;
> > +     int ret;
> > +
> > +     if (!ofdma->dma_router)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     mux =3D container_of(ofdma->dma_router, struct loongson2_dmamux, =
dma_router);
> > +
> > +     if (dma_spec->args_count !=3D 3)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     request =3D dma_spec->args[0];
> > +     channel =3D dma_spec->args[1];
> > +     flags =3D dma_spec->args[2];
> > +
> > +     if (request >=3D mux->config->num_maps ||
> > +         channel > mux->config->max_channel)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* Program the SoC-specific route register */
> > +     ret =3D loongson2_dmamux_set_route(mux, request, channel);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     /* The of_node_put() will be done in of_dma_router_xlate function=
 */
> > +     dma_spec->np =3D of_parse_phandle(ofdma->of_node, "dma-masters", =
0);
> > +     if (!dma_spec->np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dma_spec->args[0] =3D channel;
> > +     dma_spec->args[1] =3D flags;
> > +     dma_spec->args_count =3D mux->config->parent_args_count;
> > +
> > +     return NULL;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_free() - DMA router free callback
> > + * @dev: Back pointer to the router's device
> > + * @route_data: Router-specific data returned by route_allocate
> > + *
> > + * The driver does not allocate any per-route resources, so this callb=
ack
> > + * is intentionally empty. It must still be provided because the OF DM=
A
> > + * core calls it unconditionally on some error paths (e.g. -EPROBE_DEF=
ER)
> > + * without checking for a NULL pointer.
> > + */
> > +static void loongson2_dmamux_route_free(struct device *dev, void *rout=
e_data)
> > +{
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_unregister_of_dma() - devm action to unregister th=
e router
> > + * @data: Pointer to struct loongson2_dmamux
> > + *
> > + * Called automatically by the device-managed resource framework both =
on
> > + * probe failure and on driver removal, ensuring the OF DMA router is
> > + * always unregistered.
> > + */
> > +static void loongson2_dmamux_unregister_of_dma(void *data)
> > +{
> > +     struct loongson2_dmamux *mux =3D data;
> > +
> > +     of_dma_router_free(mux->dma_router.dev->of_node);
> > +}
> > +
> > +static int loongson2_dmamux_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct loongson2_dmamux *mux;
> > +     u32 dma_requests;
> > +     int ret;
> > +
> > +     mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> > +     if (!mux)
> > +             return -ENOMEM;
> > +
> > +     mux->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mux->base))
> > +             return PTR_ERR(mux->base);
> > +
> > +     spin_lock_init(&mux->lock);
> > +     mux->config =3D &ls2k0300_dmamux_config;
> > +
> > +     ret =3D of_property_read_u32(dev->of_node, "dma-requests", &dma_r=
equests);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "missing dma-requests prop=
erty\n");
> > +
> > +     if (dma_requests !=3D mux->config->num_maps)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "dma-requests=3D%u mismatches driver=
 num_maps=3D%u",
> > +                                  dma_requests, mux->config->num_maps)=
;
> > +
> > +     mux->dma_router.dev =3D dev;
> > +     mux->dma_router.route_free =3D loongson2_dmamux_route_free;
> > +
> > +     platform_set_drvdata(pdev, mux);
> > +
> > +     ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_rou=
te_allocate,
> > +                                  &mux->dma_router);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to register DMA router");
> > +
> > +     ret =3D devm_add_action_or_reset(dev, loongson2_dmamux_unregister=
_of_dma, mux);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dev_info(dev,
> > +              "Loongson2 DMA Mux Controller registered (max_channel=3D=
%u, requests=3D%u)",
> > +              mux->config->max_channel, mux->config->num_maps);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id loongson2_dmamux_of_match[] =3D {
> > +     { .compatible =3D "loongson,ls2k0300-dmamux" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> > +
> > +static struct platform_driver loongson2_dmamux_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "loongson2-dmamux",
> > +             .of_match_table =3D loongson2_dmamux_of_match,
> > +     },
> > +     .probe =3D loongson2_dmamux_probe,
> > +};
> > +module_platform_driver(loongson2_dmamux_driver);
> > +
> > +MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
