Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706876;
	b=n4iQl8X9ofWJE6GoXyrAdEhvn61T4J79KwZ2DGlpfhnkmfaeFRm1FNE6DEO7oF4ki1w/
	 bb7n6y1EErrvrVhnBtiLEwWjrwtacf2SuQjVtVsenaXb0ZVkhDwkDUg0oYgvt/H+Ld0zU
	 K/3aRZMH1pyrb+OPAFjpCL3bzNeaRjkOhLXN5hbdo2DTiNcETLr56Hr4H5dtgqapVl9v+
	 5IBOaPau7Nuhz2s/kYec3k04nuW6yVZLYEFfBmDgh4sLmg96oBcQBVDFY7EZkVuzTjtbW
	 NIbItoZb+ZWx/YB+T9sPKvOBrTi/Bto19xV5h+FANo7N510q5109fGHx8QEFzVjetiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
	b=YBbIHBUekyZ+ewC+OU14Elm8cD6BCaVg00r/HXJ6XcN3o8vy1PtvIyI0ww+/uGQWgn5p
	 s4EeeEOB05r2BWWNZDrsn/k121DQLg+LtAgiyetHZLDIY7q31NGPgAKeEaEE6+bz4U45e
	 q4ao63Be2CauenZn9LGiklc9yc8xgq7xz77/zKEQ4KEtF96XcnqXgmRdUMXv1KN9Ofavb
	 fA4ZzjfQa56lj+6ZEmkE5ONBMMJ1zFGQ97QEFgkccoRn4JlZ9tn3IlPtxio1vA9p9vUax
	 56dJFVapb7aSQ4rX9myPu3UZWKEbmzAnJLzO+z26jfbC81Ak+YgKVgiGEi390+PvI9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qQm/Q4zd";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F8606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQm/Q4zd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a18fc7a38so7737978eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706875; cv=none;
        d=google.com; s=arc-20260327;
        b=LCJM7ci3uwUwu20Lg++hzCDOzUvZFFvpvFdjPBV3dXs1iWPaYawDlqecn331zCRetZ
         Mz7wukkiBcclzArrsw1P6qGoGQcd1+aylCoqFkDHLxUbfY/jk5n1lvS3F0/8EDH8yoFg
         QyU/DGrsJspvSB6bxe2imsFi7J54PwdbAugUZ0NzTLxLqK7nIpyOlu4nvHo6GXJe0TOa
         j31ubH+G+mJbPDx2OPYwFP1xNcpPPXDPYYIy+GOpBfeiClS94xQiUX8xZwS7N68+wIK2
         sVHs0E8/PheTb7dDDNczZCAstp62tKMcpvKmFT6ShRCfsVfft41oFlinB0Dvi33kjDtH
         bgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        fh=hlKlOB4BjNj9pKOZIG6uhdDTe9eySPmGORpAZ1W7B2E=;
        b=Po7WKNN3rD32BdD9/MsiTks+D5jmXVLOpS34XyN/gc7gLuYpx2/dXgshJnCdQHM/D9
         QHE+FYhn2cSfPGZAvRrCOA5Ls60YVPjoLc54o6lz6OJqc/gPyr6kAYKZu0V7phMTkUgQ
         aAoTZZNrcy5hnjBFrlG94FXgkPdoKHyP7TT66pWiGSmHBe333/g3huXMHgXI2211+Myj
         +TSyLgeimqjc+Hjs/Lcw1rTzuHC+ecYjj5zHkCtASeFHb5JsawDynyT6knV0iPzOQRFE
         QRo7iyc1oViL5O2qmgV83Y6yGgPruPJAzMTNUZtZqKvX4amRr+osR7f+4yvUWDhpSBMy
         LYCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706875; x=1794311675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=qQm/Q4zdJbAlItC8UuvQ+8FfXaJFfm/NaZyW2t8V7HiPJEKXbovYvJ8FlSKOYPQzug
         TMQwR+l+fPsCp3XP1Op2y+Qv0iA/q15TknDuAj/NpPmvPkR4N+AV3cQfzpEYsH+JrxUy
         bFS5wTy51SMkeVcDuCWAodPmxGIZStcEj84qOUhHRPfMiRphAe3I+LQSjW8sqo3Ygqb3
         uoAeQpSBP9Om9O0c7AT0NOhUHnYfWIBPyRrlE+wOA6ZtwackoIwwbqMj1iFXJGD8b3UR
         NnV18AIBEP7qZVCP+Pbc12ueclU7V6Z+P0gOUZEVIbgkJ/jZG785JkwfYy3WdWnQl4Gh
         /Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706875; x=1794311675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=18sLWQJApFk7V15MKl1n99IzmcR4dg2aDx8om7iDU+v5Vvg1BryFdhC0Ddzt8QEuV4
         B7ImxJajiGaa2JEOpYWBMtbPEfsfHGP0tCqADkwBjJzh3BxU9ws5xHCiXReyQGOSPfYJ
         ptKTakzrxg14iswZENM0+grFBMFensH1nz9Qzlb4NI7NmDl9U4N3nMR3TkoQahUoZKuR
         QX5xeMT8aKzynCDSWykcEf0RzKX5WoUgVIVZIZdp0gO/F3rr3lixgWmtKReXxTi+Lniy
         +uJlvxofpGJuKAl0dlD4MO3843aXcw/a7vAIvcow7919bW2V+I5SJvR159+VRQCnHuW9
         GopQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL8II2f0TwvkUBMtUlMjRKWq5tRpHuuzdxB2/N/0VBQq8OeJdo2rBxtzs3qsJ4vgOom9ID3jDt4LfG@vger.kernel.org
X-Gm-Message-State: APuU4Z+zJW15BqadrRsrODfQzZa4O884lYVcn9dAPHQkDHHuSLYx6QJw
	wszUftgXeOd/E6RK+6m2X4BsGmTiKr79PabrPNVBzenIpwVXEt9JM26i5C0YoTC972iAz9WIAU9
	CiVUFZAWb3ZZmlu5Cb/dayusPAO6gEjo=
X-Gm-Gg: AYBFou25Ff6V+k8l0wL09MuU6xRWIupokAY+yqinGHVZLGYSpP2wloNQ7rzSHZI0MqE
	24dI3WBGxaCyP5kZ1ZhdScHGlHrTzhfbXvozyIdrifnazdSpys7xkRwI9nMS36YSVbNB1BkX0pw
	B7BYylKX4/q7s/df54Uj1jtNsWmIOmHoo63nxG9XOXdkASdx6/VSpBJSM+dcfx8hiK+rq/Tmn/K
	+sZ1VpygiphyG6WXALSLxQ7zeuNT1d4dZCPxw+0WtBmjgDAeFuVCc2ORtSpjiWhFzgkpfSXxGGr
	qpa/yFhIDl5ppKQKYaRJ8K8j5s80hSCF+1Dl0w4QCHKsuBLCfOKLTXpvR7iBQA07VcfNYcNLCWX
	wwNSQk4Mm+MDOvTMvk0MR8fPDT55P2ggrW1fhxIix0iK6VTVvcgYkoO6nhcLxIIDCFbYmhg==
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id
 5a478bee46e88-36a42412f55mr21504309eec.29.1793706874612; Tue, 03 Nov 2026
 03:54:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-3-clamor95@gmail.com>
 <179249578293.1833288.15514260998480602004@kernel.org>
In-Reply-To: <179249578293.1833288.15514260998480602004@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 13:54:22 +0200
X-Gm-Features: AclHuK9k-JPaNaa2w2wyQuHafuZvZgRRQXAbt-BGJRbzly4wj0XcizvF3rWabus
Message-ID: <CAPVz0n0kKRpOsUNxvUKiTPSY7bF3h+ruV05B+9jSvs9NOxthkg@mail.gmail.com>
Subject: Re: [PATCH v12 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:43=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (4 issues) ---
> Line 607: WARNING: DT compatible string "asus,sl101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 610: WARNING: DT compatible string "asus,tf101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 613: WARNING: DT compatible string "asus,tf201-ec-pad" appears un-do=
cumented -- check ./Documentation/devicetree/bindings/
> Line 616: WARNING: DT compatible string "asus,tf600t-ec-pad" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > detection and common operations for EC's functions.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/Kconfig                     |  16 +
> >  drivers/mfd/Makefile                    |   1 +
> >  drivers/mfd/asus-transformer-ec.c       | 569 ++++++++++++++++++++++++
> >  include/linux/mfd/asus-transformer-ec.h | 100 +++++
> >  4 files changed, 686 insertions(+)
> >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> [...]
>
> > +static int asus_ec_reset(struct asus_ec_data *ddata)
> > +{
> > +     int retry, ret;
> > +
> > +     guard(mutex)(&ddata->ecreq_lock);
> > +
> > +     for (retry =3D 0; retry < ASUSEC_RETRY_MAX; retry++) {
>
> As mentioned on v8, 'for (int retry =3D 0; ...)' is generally preferred f=
or
> throw-away loop variables.
>

I must have overlooked this, appologies.

> > +             ret =3D i2c_smbus_write_word_data(ddata->client, ASUSEC_W=
RITE_BUF,
> > +                                             ASUSEC_RESET);
> > +             if (!ret)
> > +                     return 0;
> > +
> > +             msleep(ASUSEC_ACCESS_TIMEOUT);
> > +     }
> > +
> > +     return ret;
> > +}
>
> [...]
>
> > +static int asus_ec_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct asus_ec_data *ddata;
> > +     const struct mfd_cell *cells;
> > +     unsigned int num_cells;
> > +     unsigned long irqflags;
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_=
BLOCK))
> > +             return dev_err_probe(dev, -ENXIO,
> > +                     "I2C bus is missing required SMBus block mode sup=
port\n");
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->info =3D device_get_match_data(dev);
> > +     if (!ddata->info)
> > +             return -ENODEV;
> > +
> > +     switch (ddata->info->variant) {
> > +     case ASUSEC_SL101_DOCK:
> > +             cells =3D asus_ec_sl101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF101_DOCK:
> > +             cells =3D asus_ec_tf101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF201_PAD:
> > +             cells =3D asus_ec_tf201_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF600T_PAD:
> > +             cells =3D asus_ec_tf600t_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices);
> > +             break;
> > +     default:
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "unknown device variant %d\n",
> > +                                  ddata->info->variant);
> > +     }
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +     ddata->client =3D client;
> > +
> > +     ddata->ec.dockram =3D devm_asus_dockram_get(dev);
> > +     if (IS_ERR(ddata->ec.dockram))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ec.dockram),
> > +                                  "failed to get dockram\n");
> > +
> > +     ddata->ecreq_gpio =3D devm_gpiod_get(dev, "request", GPIOD_OUT_LO=
W);
> > +     if (IS_ERR(ddata->ecreq_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ecreq_gpio),
> > +                                  "failed to get EC request GPIO\n");
> > +
> > +     BLOCKING_INIT_NOTIFIER_HEAD(&ddata->ec.notify_list);
> > +     mutex_init(&ddata->ecreq_lock);
> > +
> > +     asus_ec_signal_request(ddata);
> > +
> > +     ret =3D asus_ec_detect(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to detect EC versi=
on\n");
> > +
> > +     ret =3D asus_ec_init(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to init EC\n");
> > +
> > +     /*
> > +      * Systems using device tree should set up interrupt via DTS,
> > +      * the rest will use the default low interrupt.
> > +      */
> > +     irqflags =3D dev->of_node ? 0 : IRQF_TRIGGER_LOW;
> > +
> > +     ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +                                     &asus_ec_interrupt,
> > +                                     IRQF_ONESHOT | irqflags,
> > +                                     client->name, ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register IRQ\n"=
);
> > +
> > +     /* Parent I2C controller uses DMA, ASUS EC and child devices do n=
ot */
> > +     client->dev.coherent_dma_mask =3D 0;
> > +     client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> > +
> > +     return devm_mfd_add_devices(dev, 0, cells, num_cells, NULL, 0, NU=
LL);
>
> Why not use 'PLATFORM_DEVID_NONE' or 'PLATFORM_DEVID_AUTO' here instead o=
f a raw
> '0' and hard-coded cell IDs in 'asus_ec_tf101_dock_mfd_devices'?
>

There can be more then 1 EC in the tablet. PLATFORM_DEVID_NONE will
not work in this case and PLATFORM_DEVID_AUTO should work, but one of
EC is detachable (dock one) so devices there may need a fixed id. I
can test if PLATFORM_DEVID_AUTO works, but may this be sent as a
followup?

> > +}
>
> --
> Lee Jones
