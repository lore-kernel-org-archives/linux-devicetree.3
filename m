Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3A2FDC3C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802041; cv=none; b=M9ueRchKQX6aTU4LrxkwP/T9R8a4J/bFFpBkCgUQWGMu1309+m8yfaWfQAMMYCDHVoTwxD5cDc7lAUFPIJUDtt6xndUcrll2mpMz6wFEsSOET7zQhAl7Zr2t9n/oatt6vbqAuEXKpyVO0wNFmTlHdR9qs54Yyg0RpzNqxvMViuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802041; c=relaxed/simple;
	bh=/mutgZL9lgn7/Kt30wwqo3XImwb5c0U6/NKTa9jeqqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jokv4iz+7dAOxmEJkzbh0yj4pLhT23ubgloHnLe0MO0+9LxmRXehc17IFPZwi442Oy8Cxr9MHhExPtDPth7qwg7ElzOCJOQyLbR8RvLpu1ANwsymSybBbX8MQCacZ9Ps8FW2XtfbAvp1jljYbf7qXg7rvjG9iyTQvXEbDd9ciys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y+mULUnx; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+mULUnx"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59ecd51117dso979287e0c.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781802039; x=1782406839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcqBl9MGo5keDsaGunZf7Kbn8uQHXFUIROLGD7+Cdxs=;
        b=Y+mULUnxzaCXQpwtpntDnlem3giltkHwA4Q3s9skYRmhQ7yDwOjMBP+Aqk64dheDrO
         1tVMBhf2QS/ThrlxKr1+ofMbP8eMlQI1la6CtbgJwiavqPZ/VNeEAdpQg7qhHjd26Y60
         hor/H5UjIaXDrmxwiRMkTKE9bvmofGCqSAOVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802039; x=1782406839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcqBl9MGo5keDsaGunZf7Kbn8uQHXFUIROLGD7+Cdxs=;
        b=OeEA1+l13MkOgfcYOXcyW7pmC1tzcFt08QH54WNxkk58GRNTcGZreM6gtVUj1V6Zfe
         X7wfR8c43YUbkvIqDoduRFrZ/7vK96lboB+z3+NsGNYEE2esZTiYib3JsZ1AcnmMQRge
         KegqhEOvv+68GFYyuG5nJuIs09XbJ+yAupUeGVzfZkw2H6U+C1Mv5u7B6GGSFq1WRt/v
         tbsNO5okOdWzAjGj8fNZMKV8pUwW0w3MqduwYecOXpRyjGO5a1UlnjSL9J+7F9tLNNA9
         TOKyLjeL/YB8N0kOz1IYf1DmRdaWUkCl2rnWfDuiLdq7+svMpU7vLdGW+qEKNL5dR2yQ
         f4fw==
X-Forwarded-Encrypted: i=1; AFNElJ+B9qLJh0l5usFT+nK28+8LCynIFoPt1QHJf2O53vAaouRiR7NUNybOdgbSlf2SNziUEWBzcsI1V32I@vger.kernel.org
X-Gm-Message-State: AOJu0YyzypOv2DnmGBF7CfAtTyiWnDToXQQA0v3JAysQJ1SbtpgeyIDr
	k8luAbqTY4wDtiYnCXo8heKH7d0H1Anktp17L3A1d3cCpbbei16V7z+4vf7XJdIph3sN0uPShvm
	coF0=
X-Gm-Gg: AfdE7ck41Ioz+D+IM0n4RLnV8tSWwccb4ylCcT4NfXiL2jd/+w9uZtxz6IqMxBjk43m
	o8XajLPfumA9/DQsZSMGz6XhyJMu4MPJP6h60wiMQHLljh1SQSu0Tg0f2+2ju+ynEVNUfm1LkZR
	ygMleH22z6hcv0cfcsvyoMPsJqobbdHNoSnrSpPQPznzS47eslGAQegKWk6Ch1h/5vd0wHvUuyx
	ygbJa76ZGKDy/4KLO8dp060dikqUBG+xp0gpxVnq8nb/JTQK//RLPkhuR/8C4TEz3mVdcK0Lqm+
	ejZp4M4UZDJCs/EGMqWQ+jfuErAkx1cE67mu1tHeqz3mzWmWodW/GamUOWgv08eqPn00o1H1nel
	vPdrfl5qRBvfkvJfiqCaODTNef94MCfcHfCKihmg+njbeoxyVTm9CYNMW6sbcd44tRMHnQRpQJF
	4EXjaUTIjW5EhexLoJOysaam0mb5XQrGpKViaxoqbV5B9hcvqz9P+amEk=
X-Received: by 2002:a05:6122:e20e:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5bbd27276famr2102730e0c.0.1781802033160;
        Thu, 18 Jun 2026 10:00:33 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea3b46f6sm72052e0c.14.2026.06.18.10.00.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 10:00:31 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bbe617d624so267602e0c.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8k7MHwl+KcrIf6neBh3BSooXfHEDB02PhhG6xg9y/ekh2d08eJyUEhN3+espT+dUTKxKKeXcAXxUMU@vger.kernel.org
X-Received: by 2002:a05:6122:630c:10b0:5a2:497:328e with SMTP id
 71dfb90a1353d-5bbd2b3cf4bmr1469561e0c.6.1781802030784; Thu, 18 Jun 2026
 10:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
 <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jun 2026 10:00:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5FgXGznH1+SA74WOfAUXaAggaJi=ds8udqZ69K3i=Ow@mail.gmail.com>
X-Gm-Features: AVVi8Ce_ut-32lQvTeJIIrgccY3EJcV-YqwYkYCDQTO3z8hfvNAAO1n3hS3X_Xs
Message-ID: <CAD=FV=W5FgXGznH1+SA74WOfAUXaAggaJi=ds8udqZ69K3i=Ow@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 5, 2026 at 7:51=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> From: KancyJoe <kancy2333@outlook.com>
>
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>

I notice "Kancy Joe" has a space in the source files, but not in the
signoff. I guess Signed-off-by isn't necessarily required to be real
names these days, but still seems odd...


> +/*
> + * Helper to switch between DSI links, so we share a single dsi_ctx
> + * for both links, so in case of an error all writes & sleep for
> + * both links are ignored.
> + */
> +static inline void dsi_link_switch(struct renesas_r63419_panel *ctx,
> +                                  struct mipi_dsi_multi_context *dsi_ctx=
,
> +                                  unsigned int link)
> +{
> +       dsi_ctx->dsi =3D ctx->dsi[link];
> +}
> +
> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +       /* Panel registers are loaded from DDIC Non Volatile Memory */
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);

Instead of dsi_link_switch(), can't you use the mipi_dsi_dual()
function? I think it would be:

mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi, dsi_ctx,
ctx->dsi[0], ctx->dsi[1]);


> +static int renesas_r63419_disable(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +       return dsi_ctx.accum_err;

I'm not sure we've been terribly consistent, but should the above be
"return 0"? I'm not actually sure there's any benefit to a panel's
disable() function returning an error to begin with.
drm_panel_disable() doesn't return an error, so all this does is skip
setting "panel->enabled" to false and make it harder for the system to
recover.


> +static int renesas_r63419_prepare(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vdd_suppl=
ies),
> +                                   ctx->vdd_supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(1000, 2000);
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vcc_suppl=
ies),
> +                                   ctx->vcc_supplies);
> +       if (ret < 0) {
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supp=
lies),
> +                                      ctx->vdd_supplies);
> +               return ret;
> +       }
> +
> +       usleep_range(1000, 2000);
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +       usleep_range(3000, 4000);
> +
> +       ret =3D renesas_r63419_on(ctx);
> +       if (ret < 0) {
> +               dev_err(panel->dev, "Failed to initialize panel: %d\n", r=
et);
> +
> +               /* Power off sequence from the r63419 datasheet */
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supp=
lies),
> +                                      ctx->vcc_supplies);
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supp=
lies),
> +                                      ctx->vdd_supplies);
> +
> +               gpiod_set_value_cansleep(ctx->reset_gpio, 1);

To make de-init opposite to init, shouldn't the reset come before you
turn the regulators off? Depending on the design of the panel, I'd
imagine this could prevent back-powering some logic?

I'd also expect vdd supplies to be turned off first?


> +static int renesas_r63419_unprepare(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +
> +       /* Power off sequence from the r63419 datasheet */
> +       regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), c=
tx->vcc_supplies);
> +       regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), c=
tx->vdd_supplies);
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);

Similar: shouldn't the reset come before the regulators to make
power-off the opposite of init.


> +static int renesas_r63419_get_modes(struct drm_panel *panel,
> +                                   struct drm_connector *connector)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       const struct drm_display_mode *mode =3D ctx->desc->mode;
> +
> +       drm_connector_set_panel_orientation(connector, ctx->orientation);

IIRC, the above was a workaround that caused a warning splat. Is your
panel used on a system that actually needs it? Could your DRM driver
be fixed rather than persisting this hack? For context, see commit
47bef230225b ("drm/panel: panel-edp: Implement .get_orientation
callback")


> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct mipi_dsi_device_info info =3D { };
> +       struct device *dev =3D &dsi->dev;
> +       struct renesas_r63419_panel *ctx;
> +       struct device_node *dsi1_node;
> +       struct mipi_dsi_host *dsi1_host;
> +       int ret, i;
> +
> +       ctx =3D devm_drm_panel_alloc(dev, struct renesas_r63419_panel, pa=
nel,
> +                                  &renesas_r63419_panel_funcs, DRM_MODE_=
CONNECTOR_DSI);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
> +
> +       ctx->desc =3D of_device_get_match_data(dev);
> +       if (!ctx->desc)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to get panel description\n")=
;
> +
> +       ret =3D devm_regulator_bulk_get_const(&dsi->dev,
> +                                           ARRAY_SIZE(renesas_r63419_vdd=
_supplies),
> +                                           renesas_r63419_vdd_supplies, =
&ctx->vdd_supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D devm_regulator_bulk_get_const(&dsi->dev,
> +                                           ARRAY_SIZE(renesas_r63419_vcc=
_supplies),
> +                                           renesas_r63419_vcc_supplies, =
&ctx->vcc_supplies);
> +       if (ret < 0)
> +               return ret;

It seems like both sets of supplies are always enabled / disabled
together with no delay between them. Do you truly need two lists, or
can this be combined to one list of regulators. That would simplify a
bunch of logic.


> +       ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ctx->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +                                    "Failed to get reset gpio\n");
> +
> +       /* Get second DSI host */
> +       dsi1_node =3D of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +       if (!dsi1_node)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to get remote node for secon=
d DSI\n");
> +
> +       dsi1_host =3D of_find_mipi_dsi_host_by_node(dsi1_node);
> +       of_node_put(dsi1_node);
> +       if (!dsi1_host)
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "Failed to find second DSI host\n");
> +
> +       /* Copy current DSI info, do not provide OF node since no driver =
needs to be attached */
> +       strscpy(info.type, dsi->name, sizeof(info.type));

Can't you use the two-argument form of strscpy()?

FWIW, I also notice that the Sashiko AI bot had some comments. Did you
already look all of those over and decide they don't need fixing? I
have a vague recollection that there's no need to worry about someone
calling disable() and then enable() without going through the
unprepare() / prepare(). If my memory is correct, I guess that would
be nice to document... I didn't analyze some of the other claims that
the AI bot had.


-Doug
