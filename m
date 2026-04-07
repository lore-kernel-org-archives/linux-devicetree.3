Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F903A257F
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550066; cv=pass; b=XCdlQ9DqYdWzXTjtpTJKAiIw6ZoeZ81/eO3/qCHP2j5HRz2C7bDPTFxys4vJzLtB/eFZNNyXePE9jSuYpGUB3LI40oalVd7ivnUx8GUxflWHLD2LGPQZ+D/7J5ini06mLn0QWbmoHH0JuhAlt1mZ4hbZM81LSKLhLjyUvxtaCTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550066; c=relaxed/simple;
	bh=Qg1cBh282b3adVb2ppjf9AqleTOEcC98vfshrCTnT7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+dS84LcsvX2drjOQDxgzEPrqzFw1qx870nzOk0gv/pRPLjI/Udv9RSelfv/8UKajlbu3VsRDWvN5iM1bnqP2+U48k1ZvoZAgsLGsQEY4XzfrPWXLr1wLV1ioJhp31zC6EoL+1QyNfiGZYLbm6VFXrAEJYJLn8Ni99HbSv6bLJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhfzWEfN; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhfzWEfN"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a154cc6a48so61584806d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775550063; cv=none;
        d=google.com; s=arc-20240605;
        b=Bj4ue3nEyXTW0eZ8srnbij3O6GLzxobOvakseSAhu/ZhC7t2p22XufN3PbhzrKmgwv
         bZQqEZtzljBKriMoge5mZcn8awVvH7gjImHpIPpoH0J3ii/cOgAjr/306/nm+yS8feP6
         1+/jHytvx7zOp2IwqcPVt2T2AF6mT/7ZZpv/wyVM+m29sJmA/NPZgo7Z/lvw1AFK576w
         o9T0GPXguUYyCzCFsK1HBXZSQShAymrk6RzQA8HjuBY9+Uwhz2NNJSyup4YvuAGj7jzT
         u94ZObueMPFkvLME1JHJPt66RGKw9x9a//uCNI1H+t1W19yS91OI1tP4FS6n2Xrkphk2
         zz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/PLRkpetLF6qpK6ewdWqtNt7+OhKgQIPHRbLKcPeEY=;
        fh=3xD4KkX+O1s5vK+Uu+dKKC4qLjIHW9Au8PKtw2h3fcQ=;
        b=U7Q+3z/kS70hL9d+gZpYmEc7AnNaxnvmpX4npXJlG/YZhnh3Ls8MvboC5t7cRAza+J
         KD09z4xkLbhb0OnjqRigR0/wVMVN3/uKXvlr7h9ErwlfUIhi7vePBRtJTQLKUau9Azpl
         lMMdT0KU8DtBDCK9xRrHKVRIXTLqS2dN+M5OPJjqzovJkU2VexqQCZxYXj9gVaPBtV21
         8qWVRAvNHqvooSwUinTRFqfrl/3jMoqYChNMuaQcEsz507a5ZauICOaxLFl4pO5DEiWj
         VZ2SPSfHhyssbc/Dwk+Gm3LiX6M7mcRmh+YAa6FzO4vTAXsIy9TL7B4ZTJlqYCB4r0Rh
         lMtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550063; x=1776154863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/PLRkpetLF6qpK6ewdWqtNt7+OhKgQIPHRbLKcPeEY=;
        b=XhfzWEfNNlqaz4UUUZpR/e+7lsUNjcU5jSueh2ShYmzWNcs8l28I5f20qSZrO6ukfc
         Pgjfz5/bkgO2qljXfgCSUmuCsAUT/ZjtKAKLr6UXbGDs22p6MY34JvN4pR/zKrdxH/0m
         lcscGftcZTE8gSLZ+dZVQe+3S9nk28QI7IxAg2s6YQHPPSJl7Pm6YiJ+AFm/QTNRUqqy
         ONgshKVcOb0UWzO08ah+iD0Certh21y+fc9wk3mhpgBo0u62WlDuuFtxzGUd8PmvWczn
         QpN3glH9oX9L/r514KE88VFdTxbF88j5ZTPXT/AhOE4ynr3lHMfqx+eWBvesnwz7ijyK
         5BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550063; x=1776154863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/PLRkpetLF6qpK6ewdWqtNt7+OhKgQIPHRbLKcPeEY=;
        b=GpWpONbmQcXRJEWjUgJhWk6t7Kp5ydcYlt5WasqSkHfoD0l1r3SdJfAGYC4/xhXROt
         oPbkX7jQyYFGkHlo/K6qpN6Q0rsSLmzLMRG0YGnslSp65SdGiVpuM2CjYo9xfebP+gAT
         SNmCYLKdIjnnOexv75W6CPj6/emuHOHWKfe3uWZg1q0P/E+EdoEJUDx7kyrFqF3t11F3
         FSYl/D+8B0tXWEpQLNjVYeq4VzvQXPsesJYqWOKdq12tWkBKX0iLA7T/8M8brcXYVGEY
         4WUdRJK8+5mMk8WJllhmtXonpFZMYnAfs9TCAiD3Lu5sjXpTLA/a32HDqDC9bEe36I/f
         lBAw==
X-Forwarded-Encrypted: i=1; AJvYcCXRkjMkPck5KuIKDGjT+DVoobVH/fiZR7Ttv8oqQFCwJQbga246VGvC6wpIwHrmPJ0dzrd/uazbYSDh@vger.kernel.org
X-Gm-Message-State: AOJu0YxYHSO30F/2kMI2qnN2j8tdE2U2HcQDmtIC2HDgs7O3KAq8Ogqj
	9oyEh6TmrQkV80I0gBj6RrKhMZHTHB6zSnkQ1yVH5XcVk9DNI1Suko5kTvpSOM+VNPP4Uhzj85p
	LVT+0squRsytOlThutr61JodzQJYjbLg=
X-Gm-Gg: AeBDieu1PgekozO8IftwYftYXr1BRLsDmEwFPi+DqEPdbPKrgb3LTh+pVQw26qT0kRe
	E6DocCkFQPqwNe0B1O4tOZ3Fcm/JRDVyCF+KsoFlMT/ZNja48D4Yyyh2/KVHgCBMPXE38S9b/dA
	KxYesgayrDHRzk4LCssEssptsQekDO8tVjVB9HCIHXjRgCiLvE+A7GuqeaRDDBfZwrI/guANvfk
	NLc8u769qDPVBtlbuRdsDpScKXQ8FwdqPLc3DwtFKaDJvC2O0sClDzhGfWVv5M5KGbi436sf2yA
	WygPSQqRx9ciuOVQL/9LdexsrV9u++YQQwS1jw0=
X-Received: by 2002:a05:6214:2247:b0:899:ecd8:d266 with SMTP id
 6a1803df08f44-8a7028a94b4mr273928136d6.20.1775550063531; Tue, 07 Apr 2026
 01:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327114842.1300284-1-iansdannapel@gmail.com>
 <20260327114842.1300284-4-iansdannapel@gmail.com> <adSgQJa/8ZPlzPbO@yilunxu-OptiPlex-7050>
In-Reply-To: <adSgQJa/8ZPlzPbO@yilunxu-OptiPlex-7050>
From: Ian Dannapel <iansdannapel@gmail.com>
Date: Tue, 7 Apr 2026 10:20:51 +0200
X-Gm-Features: AQROBzCvZFmOBhNN1Ozi1tHPyAdgkPxiQnmrsvUxmnFBvR5Z3_2-fIjOS2_VhLw
Message-ID: <CAKrir7jWnoG4TXHOH5r658GaXL4fBcEP4BUMqHnFu4_ZVJ-o_Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] fpga-mgr: Add Efinix SPI programming driver
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-fpga@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mdf@kernel.org, yilun.xu@intel.com, 
	trix@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, heiko@sntech.de, marex@nabladev.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
thanks for the quick review.

On Tue, Apr 7, 2026 at 8:33=E2=80=AFAM Xu Yilun <yilun.xu@linux.intel.com> =
wrote:
>
> > diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> > index aeb89bb13517..21eb0ef1fc2e 100644
> > --- a/drivers/fpga/Makefile
> > +++ b/drivers/fpga/Makefile
> > @@ -24,6 +24,7 @@ obj-$(CONFIG_FPGA_MGR_VERSAL_FPGA)  +=3D versal-fpga.=
o
> >  obj-$(CONFIG_FPGA_MGR_MICROCHIP_SPI) +=3D microchip-spi.o
> >  obj-$(CONFIG_FPGA_MGR_LATTICE_SYSCONFIG)     +=3D lattice-sysconfig.o
> >  obj-$(CONFIG_FPGA_MGR_LATTICE_SYSCONFIG_SPI) +=3D lattice-sysconfig-sp=
i.o
> > +obj-$(CONFIG_FPGA_MGR_EFINIX_SPI)    +=3D efinix-spi.o
> >  obj-$(CONFIG_ALTERA_PR_IP_CORE)              +=3D altera-pr-ip-core.o
> >  obj-$(CONFIG_ALTERA_PR_IP_CORE_PLAT) +=3D altera-pr-ip-core-plat.o
>
> This is the tail of "FPGA Manager Drivers", move it here.
All right
>
> ...
>
> > +static int efinix_spi_write_init(struct fpga_manager *mgr,
> > +                              struct fpga_image_info *info,
> > +                              const char *buf, size_t count)
> > +{
> > +     struct device *dev =3D &mgr->dev;
>
> Why do you make this change? This is just one-time usage, and in some
> other functions you don't make the same change. Please delete it.
Will revert it
>
> > +     struct efinix_spi_conf *conf =3D mgr->priv;
> > +     struct spi_transfer assert_cs =3D {
> > +             .cs_change =3D 1,
> > +     };
> > +     struct spi_message message;
> > +     int ret;
> > +
> > +     if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
> > +             dev_err(dev, "Partial reconfiguration not supported\n");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     /*
> > +      * Efinix passive SPI configuration requires chip select to stay
> > +      * asserted from reset until the bitstream is fully clocked in.
> > +      * Lock the SPI bus so no other device can toggle CS between the
> > +      * reset pulse and the write/complete transfers.
> > +      */
> > +     spi_bus_lock(conf->spi->controller);
> > +     spi_message_init_with_transfers(&message, &assert_cs, 1);
> > +     ret =3D spi_sync_locked(conf->spi, &message);
> > +     if (ret) {
> > +             spi_bus_unlock(conf->spi->controller);
> > +             return ret;
> > +     }
> > +
> > +     /* Reset with CS asserted */
> > +     efinix_spi_reset(conf);
> > +
> > +     return 0;
> > +}
> > +
> > +static int efinix_spi_write(struct fpga_manager *mgr, const char *buf,
> > +                         size_t count)
> > +{
> > +     struct device *dev =3D &mgr->dev;
>
> ditto.
>
> > +     struct spi_transfer write_xfer =3D {
> > +             .tx_buf =3D buf,
> > +             .len =3D count,
> > +             .cs_change =3D 1, /* Keep CS asserted */
>
> Move this comment to its first appearance.
>
> ...
>
> > +static const struct of_device_id efinix_spi_of_match[] =3D {
> > +     { .compatible =3D "efinix,trion-config", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, efinix_spi_of_match);
> > +
> > +static const struct spi_device_id efinix_ids[] =3D {
> > +     { "trion-config", 0 },
> > +     { "titanium-config", 0 },
> > +     { "topaz-config", 0 },
>
> Since you've trimmed of_match_table, any reason to keep 3
> spi_device_ids? IIUC you could keep them in sync.
I don't see any reason to have other IDs, will drop them.

I would also rename the file from efinix-spi.c to efinix-config.c to
match the dt bindings
