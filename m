Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795784921;
	b=Pw+LMUiy5cWuztnsDDZ5ZTBYsorirDDypxdfl7ShThEiXTA2BcJ0F5g0FQVTRay/vqcy
	 Wm15uj5W7fu3SB5o6PDja11XwuDYlDxORItjiEVPixsNj7OdzfFxBjVK1I81Y4FBoxZr6
	 Bi+0uNlWSweo9gOq0VTFC3xJKj4proSc5L2kP1uc58q+J5GM4ZcmIz/J5kbZVxII0v/HF
	 +jys7IgZ+aeN39XONyfLpTnrF1r5dYTsaHj1F3DoGtl2VmFIwOX8zwdCBrhpaEJFXNxeR
	 Hnb6xEs/b2CmgUCBM8Wc3vFtMvlrGcCVCvynB1OVeKOWte/+avFYd/W7OCOfSsEIrvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
	b=W5JclhYrKUNa5Ymoxs0FBMg1C1fv+nGrIHPsn2bz9ZMmR54XBG+nCsFnJ2E94/DLVd6p
	 zMtm2fB9RD4HiqjfF2U0Ai2A41MDYph+zRAUwjwHy75hdkT+FKN5j5YR/cYz9cXFQhlCT
	 RwM1ls4SC2YjGw0xfINQNSKgrgHTtnhtQSGwOIqgS5PabYHKANf1fN87uD5uAPaP1k6ZI
	 4wV9JvKamkwVXAECnq9clkrTU4Fhi0+eAG6I14ipOEM19enqwLuZb0uw60R/yBoPBKXOX
	 Eit8o+1WromrbffzFOEnxfadR+YEDfxCVWjF5zxlYbyCXRhUdNVWHben3mXAz/ENC5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C2606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chi5MtYr
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so11361000eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795784920; cv=none;
        d=google.com; s=arc-20260327;
        b=oyoBOBmQiIqzUJtQRTkGm8AzhkibOEwmd4imDZX2vbNatG8ZfdMFKKTfdKFiA4yhNM
         b2mxljRuyMFuogtr+PWC2RuPhJPKSzkH1gI2rcOzo6X5ScQD0idDXMjHqltLOfslGOsT
         muP66nAfBwHOXSQNeI+77b6sQ+mcBfgh9O7E3mmfyULLvJidKf3HcoipfVSSf777y0py
         xnftakbVoLHlJOWC0Pwzzv+1YTdQZ90/hV/T0NPzns8B7NHpVxn/7d2pAZ+ZZH3+vtBg
         LfZxKp7XjoPu7/+VHQIVm7Bm5AhbljNrFVvSf2UN5J7h6dWryOSHy8TmFDuIin6SpDGr
         4aSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        fh=hYrUnh3yyo+PLPuNfeqp0mYvRTvtLT3kf8U/0+9jooc=;
        b=OZQYrmuQ+SJ9yk9Bl9wVTD3kkYm1LrVtmEpAsWcEIWEvnHMjMuW6QUA9xWU/EKVCIv
         yZjSqSZMJVYERxwbPqGY4yoQXsxBsAo+wjn6gunZhi9gBd3lq14y6OMEQ3b17MEtpe8d
         3pRoXRikrJxNgaIFfr/HWY5sc+QwMjB5EFpxn+N701AOHG3MPEgCrlcm2ddqTE2dXHSW
         ViJQMqEwq9OMuy8nxITJeQIFJy0afhqaujL+HGVNKBh4N2ZpboDA0qjbPA3jiwFYZFoZ
         c7bnQcVvIAydeXsAwrwY+FgfMtIt+xDPmm+Z8IvJSnALDVxD6sQShQx1buE/NomUKwbY
         7xAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784920; x=1796389720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=chi5MtYr3koVFYMUEYFb/9Z33Tg5jvqNFv7PQiVYP6JtHQogg71xigG6+9IKUkLflg
         5tqXonZxZKCkPH7LxzxdtM6eT0IjqnV1tNiKt6S/wqjgcVPvklq2RPIPm10uVPKTjS5f
         vgBQ7ihJ6JxXsHRy+TG14neqjBL/5CWUhbW5dnzciv0/SQgdXH4jHo8+3ZbhVgTe3jnC
         NGdYvemtb1U5RQDiqiCJ+0iIM2aQt4Z1YzhvIOx4MfLGYD6OpXoUM34mXC80iizWZ01X
         xw7wTF8k91xdsblalCvkUSKdLNlC7qGCgU8XGuwGjwXJVM+S1N8o+VXIpSGYS0oveZcu
         NOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784920; x=1796389720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0gaW0T//VOtwOuwTFVY9WwABc2rEZBaWTGdLWhFohw=;
        b=GawqwAe6LmhchkVe/AAvyGDZVnzvp3ovape+IRqaM/X2F4WDJ+VPWQ0kM1r8+Js5cg
         qIrhZICOWOg4M1NOwoxDs17aFUz1BPAshFL4K148Q6yWqbyakahUD0mhrO6a+P127KrG
         8GBR9Q69pGcBTuHUVEXvNmzuVo2ATdcs1A5HkFNdnvvt32HCBzbAiY3fMKi/LX0mk2Ys
         G3pipFgTxZTKOerKoGUNwagM01sBfCYHv1lBifSjtI/6KR+D/GU/1a+OPngNJ3eERzXV
         P6OT1/g30f8BaRHdglb6htPimRfTlMXvrUPhd4FeYqFKwtu1YxPd1njktVTLAb1by/9P
         4+og==
X-Gm-Message-State: APuU4Z9FGWSEQ6oBZM5xzG30KcN6YXkol6jLPcI31uEs85p/fn7iwUKL
	3WpVtCWVqbluwJQg+VG8yvuibKclFalPpI0BzA1QGlhnmLBDuruyVRFGigtQSBqruaEoIYeyYjw
	dWnRrez8jX4qmZzaxPBOzyABw4sBlM7s=
X-Gm-Gg: AZFdTZd/MZJ3pTLO0/qtKVKl7eENYlvr3nBnODl3cWBcHEG0kAsTqJDnMfePpZslUUM
	poQMJGcleUaP6gPXq7tUNApLkDDxr+uLLMBMRAQV6iFlQDvpki84nBfYfJlsbgnNWimSYOmHzOg
	+ZYvkDIy5Gp3gIm0zCA3hS1UGhkYfRm4Mbujj/Cnj6SI2M+JBP0kMlFVlEBakRQTRrEX/oQIQ7m
	kPxmalZ/vcfWKKHX+5qWn7Wg+JzA/Aj+9TAjb0zI1+zJ+S1vdoyc72iHfsjmptHx+A1tYTxPiQb
	PXjfq2x9fRtY+pc9yhApdM0ZumFj93i79jImzwWa3i54fayzgbWHQedEo7jYdJns8Gvf875x6ui
	2pVZqLMQ62iwhmyiaEqOFR/CKBEIQIgzNPYjO/9FkNHBhsYA6KpukgfLVP4ZSHju2iH7CdPBvaD
	enpEoj+rvkob2TtHGl92855zNjyg0eilM=
X-Received: by 2002:a05:7301:10c4:b0:386:d310:4c1c with SMTP id
 5a478bee46e88-386d3104c52mr9700616eec.21.1795784919819; Fri, 27 Nov 2026
 05:08:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
 <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com> <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
In-Reply-To: <uQ14beL2SOumMxaLqMFc4w@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:08:28 +0200
X-Gm-Features: Aa3M54qgDXor0Xf9K6XHdCJ3yIc8SRM3BWawDQskrGgi0w7vMixGfnu5GIJLqUQ
Message-ID: <CAPVz0n3hT2qGag=CzH6JimHpWVqTC-B1p=7n5U9SPP7UHyeGdA@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
0 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
06:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI Type =
B
> > > > driver.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++------=
----
> > > >  1 file changed, 12 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..318ece68b7806 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > >
> > > You should now be able to get rid of includes of of_platform.h
> > > (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> > > property.h are also unused.
> > >
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbidev;
> > > >
> > > >       struct regulator_bulk_data *supplies;
> > > >       struct gpio_desc *reset_gpio;
> > > > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_h=
itachi_tx10d07vm0baa(struct drm_
> > > >  ({ \
> > > >       const u8 d[] =3D { seq }; \
> > > >       struct drm_panel *panel =3D &(priv)->panel; \
> > > > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> > > >       struct device *dev =3D panel->dev; \
> > > >       int ret; \
> > > > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_=
SIZE(d)); \
> > > > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRA=
Y_SIZE(d)); \
> > > >       if (ret) \
> > > >               dev_err_ratelimited(dev, "error %d when sending comma=
nd %#02x\n", ret, cmd); \
> > > >       ret; \
> > > > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct =
drm_panel *panel)
> > > >       struct device *dev =3D panel->dev;
> > > >       int ret;
> > > >
> > > > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > > > -     if (!priv->dbi)
> > > > -             return -ENODEV;
> > > > -
> > > >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > > >
> > > >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0ba=
a_supplies), priv->supplies);
> > > > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx1=
0d07vm0baa_panel_funcs =3D {
> > > >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> > > >  };
> > >
> > > Unnecessary semicolon here.
> > >
> > > >
> > > > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pde=
v)
> > > > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbi=
dev)
> > > >  {
> > > > -     struct device *dev =3D &pdev->dev;
> > > > +     struct device *dev =3D &dbidev->dev;
> > > >       struct hitachi_tx10d07vm0baa *priv;
> > > >       int ret;
> > > >
> > > > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > > >                                    "Failed to get reset gpio\n");
> > > >
> > > > +     priv->dbidev =3D dbidev;
> > > > +     mipi_dbi_set_drvdata(dbidev, priv);
> > > > +
> > > >       ret =3D drm_panel_of_backlight(&priv->panel);
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to get backlig=
ht\n");
> > > > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct p=
latform_device *pdev)
> > > >       if (ret)
> > > >               return dev_err_probe(dev, ret, "Failed to add panel\n=
");
> > > >
> > > > -     platform_set_drvdata(pdev, priv);
> > > > -
> > > > -     return 0;
> > > > +     return devm_mipi_dbi_attach(dev, dbidev);
> > > >  }
> > > >
> > > >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =
=3D {
> > > > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10=
d07vm0baa_of_match[] =3D {
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> > > >
> > > > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > > > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> > > >       .driver =3D {
> > > >               .name =3D "panel-hitachi-tx10d07vm0baa",
> > > >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> > > >       },
> > > >       .probe =3D hitachi_tx10d07vm0baa_probe,
> > > >  };
> > > > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > > > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> > > >
> > > >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel dr=
iver");
> > > > --
> > > > 2.53.0
> > > >
> > > >
> >
> > I agree that your suggestions are ok, but they are out of scope of
> > this patch. They would require either dedicated commits or can be sent
> > as followups later on since they do not cause bugs.
>
> I don't see why the include changes are out of scope. The platform
> driver was including platform includes but now it's no longer a platform
> driver so it shouldn't include platform driver stuff. The rest are minor
> enough that I think they can be included as well.
>

I can remove headers, sure. Regarding semicolon, here is a bigger code frag=
ment

 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs =3D =
{
    .prepare =3D hitachi_tx10d07vm0baa_prepare,
    .enable =3D hitachi_tx10d07vm0baa_enable,
    .disable =3D hitachi_tx10d07vm0baa_disable,
    .unprepare =3D hitachi_tx10d07vm0baa_unprepare,
    .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
};

- static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+ static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
{
- struct device *dev =3D &pdev->dev;
+struct device *dev =3D &dbidev->dev;
struct hitachi_tx10d07vm0baa *priv;
int ret;


>
>
