Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CAA431A4A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559173; cv=none; b=oJ1tYDvwWZ53IxxrQHLDbmNB3d74WA2lD8Jb7RqqlWOItxZqlNrQo6DbLeGKKWB9kAz4idoiBxltwLkGLiHNafPTy16c8oJiFNaevCx3sTiNeZLiGOtAAf7x5d47MOyPBkTRRcx/SDEIESBEaN5H3yioM8rqsf3vwJSrX4Cp5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559173; c=relaxed/simple;
	bh=PfWOtqj8AHBnjYSK3ENBps7Edr/2RgN+VEflZL8/rBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwSCKyPXbi0+lfa/armFz1r4AzOQuyfjwnlJLIHinr8dI46g21MtcygRlK21EV3C9ueUCfUJfctvmIyg7LgKr8cEfeAL96xbGhW8W7LxaFeSW7nO5DTu3X8P7mxc72PPD5BZMp/VSFhM0COZ4Pn7KKksvxkDKCMdzje3RcmV/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+htM/Gs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+htM/Gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C516E1F00ACF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559171;
	bh=+pGDrgeFeDV7+He3HTwkGJqRY0fAdjYZIXRzs0KnYec=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=f+htM/GsUqvKGk8zsLVhvDKC9SVMxVykcSfsvwmFNk2SUHBEB4ww25N/ky9CbSmmL
	 UQCpAfdCKMZfmadSXi2J9z7kwVWfCS7GytgUJWX9X08hi4HpHe+mlv5a/em1m0QFze
	 PaXmLZL4P8WhlXKnEX5kf9dnux6h/LRDYyZcDyY00GM/pbR2edYtiYNp/j5pa1hUl6
	 Y4jBGY7Z2t1WLL+P/dBRykPuOtwI/slPOiKaUNt8/iQ4neFNFxVQD0cqyu94FiMzm6
	 NeGVS2NTxu6D9vuHdO06myXUqpI1uwog2S5y7NrKrep7vRdYQxXRvhC+t+azwIThy/
	 DC6O8PjErJyvw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c9452243cso65832601fa.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RreCQZX5lY4COxN2EaSnm++8ewZHyn76JXTrnIJTQYlyI6nvsB//WqmiaYTCfUqmijX+9Bvi+5OUSQD@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4rHgI7d2gSfOgdZVYQIsCK3hF7YW2O7SkE50c8PrPgRZFUXT
	qLx4BPRUd1yOufY5L2Db+t5VVjZ+zLZi5pL0NUQy3oSEgPPgkvt9MGUc9Y7EjScrs8XPDP800F5
	fT3Phozr7gb+gJZtus+Kf3XyILY1unU4=
X-Received: by 2002:a05:651c:441a:20b0:39c:a346:8a45 with SMTP id
 38308e7fff4ca-39eb287aafcmr22180091fa.39.1784559170141; Mon, 20 Jul 2026
 07:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com> <20260720-axp318-regulator-v5-2-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-2-a1afa7ee24f9@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:52:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v65CeArZ6yRSL8noy+FNnVuE8iUzKNhsA6tmB5RQH=Aa5A@mail.gmail.com>
X-Gm-Features: AUfX_mwzbQbs2mfDK-z_8sSfumhBpDGB-q3RHEjMQirhOgk9lqChrZwuBwSWGJc
Message-ID: <CAGb2v65CeArZ6yRSL8noy+FNnVuE8iUzKNhsA6tmB5RQH=Aa5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] mfd: axp20x-i2c: Fix i2c instantiation
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 7:20=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> Apparently this device never really supported i2c instantiation via
> sysfs, because the driver does not even look at the i2c driver, which are

                                                      i2c device data?

> not set. It would only probe if the device matched through DT.
>
> Fix that for correctness, even-though it is probably useless.
> Add the missing AXP323 while at it.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel=
.org
> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loa=
ding")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

As you said this is correct but mostly useless, as it is unlucky that
just happens to have a spare PMIC on a breakout board for the I2C
connection. And it's also useless if you can't describe all the other
connections.

> ---
>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>  drivers/mfd/axp20x-rsb.c   |  1 +
>  drivers/mfd/axp20x.c       |  1 -
>  include/linux/mfd/axp20x.h |  3 +--
>  4 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 5c93136f977e..a76bec5604c4 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>         axp20x->irq =3D i2c->irq;
>         dev_set_drvdata(axp20x->dev, axp20x);
>
> +       axp20x->variant =3D (kernel_ulong_t)i2c_get_match_data(i2c);
>         ret =3D axp20x_match_device(axp20x);
>         if (ret)
>                 return ret;
> @@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>  #endif
>
>  static const struct i2c_device_id axp20x_i2c_id[] =3D {
> -       { "axp152" },
> -       { "axp192" },
> -       { "axp202" },
> -       { "axp209" },
> -       { "axp221" },
> -       { "axp223" },
> -       { "axp313a" },
> -       { "axp717" },
> -       { "axp803" },
> -       { "axp806" },
> -       { "axp15060" },
> +       { .name =3D "axp152",     .driver_data =3D AXP152_ID },
> +       { .name =3D "axp192",     .driver_data =3D AXP192_ID },
> +       { .name =3D "axp202",     .driver_data =3D AXP202_ID },
> +       { .name =3D "axp209",     .driver_data =3D AXP209_ID },
> +       { .name =3D "axp221",     .driver_data =3D AXP221_ID },
> +       { .name =3D "axp223",     .driver_data =3D AXP223_ID },
> +       { .name =3D "axp313a",    .driver_data =3D AXP313A_ID },
> +       { .name =3D "axp323",     .driver_data =3D AXP323_ID },
> +       { .name =3D "axp717",     .driver_data =3D AXP717_ID },
> +       { .name =3D "axp803",     .driver_data =3D AXP803_ID },
> +       { .name =3D "axp806",     .driver_data =3D AXP806_ID },
> +       { .name =3D "axp15060",   .driver_data =3D AXP15060_ID },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index 059656f2a1bd..8fdc870c1fe4 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rd=
ev)
>         axp20x->irq =3D rdev->irq;
>         dev_set_drvdata(&rdev->dev, axp20x);
>
> +       axp20x->variant =3D (kernel_ulong_t)device_get_match_data(axp20x-=
>dev);
>         ret =3D axp20x_match_device(axp20x);
>         if (ret)
>                 return ret;
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 22baab6e10fa..84839d4aa1ca 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>         const struct mfd_cell *cells_no_irq =3D NULL;
>         int nr_cells_no_irq =3D 0;
>
> -       axp20x->variant =3D (long)device_get_match_data(dev);
>         switch (axp20x->variant) {
>         case AXP152_ID:
>                 axp20x->nr_cells =3D ARRAY_SIZE(axp152_cells);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index b352661d99a1..1badb4868d17 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct r=
egmap *regmap,
>  /**
>   * axp20x_match_device(): Setup axp20x variant related fields
>   *
> - * @axp20x: axp20x device to setup (.dev field must be set)
> - * @dev: device associated with this axp20x device
> + * @axp20x: axp20x device to setup (.dev and variant fields must be set)
>   *
>   * This lets the axp20x core configure the mfd cells and register maps
>   * for later use.
>
> --
> 2.47.3
>
