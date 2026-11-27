Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770621;
	b=GNDfYplIQ0WjKCQeARGj4YQpXj3UwiIcZmvaTt7XKy38PSjgiPIo3YEdnbHW3ev1Xam3
	 WtrgndVTTTBOxFy+lfrgbCr5yR9sFvaKXD/zbd3K9PQTfYtFUNxPGK7CKdggEH0iHempV
	 FiJ92kMnqleuvweuEjqAOO0w9V8+ByAZ4zzy49XyzDfEaiTP6VlcCbEHoZX7smDflV7Hz
	 HhaD3rXxbuN4eLhabeHpHZe1wT/KoTYyErAsOs0xSrkYfFpd3q34Mt/n1Sk6Xp+7izfUb
	 nq8p4vx2CLSK8urWlxblnbH4jDRYYUT09fYMkanTAehznE8MeYAyWQ2CbjCLv+sTPWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
	b=tGHSWMcTjyaXbNmPJX3d78Jr5FvGs2BOgBsDL7EkindNRC2HEotgIDsWYxJ1CMEoidG/
	 T4sGtlrnTmTJxOiegr/aQExgdLeD7nTXHFFx/YRGiDlJuqz1RfCY7mXtesKYBACj86Uxq
	 AE1Rt3H2yZgTDzMdhCXBRXdCuUv7ptGc/NmMxCq08FI7gSC0iCFvKOl/S0wwksgIgi42F
	 0UXsIEQMlm/M3PDrNQT0drPRfiu6g4pe8wQ24DGW7owpuyxfF85y7eXhKnRXaJ6JVO0WY
	 K+RKUzbiZzcYgYIN29EpfP1S65vSEj/UlMpVwrbHTVKZx+sCRzpBzZgQNpIRPtKeYjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C413606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C413606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ASaesM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386c336eab8so4292976eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795770620; cv=none;
        d=google.com; s=arc-20260327;
        b=I8iOvb/1DovJWVtnvxWRBe/YpI4fuKaDRFkba0WdkcqcYgLcKPuySySyt9dgIfMASr
         BmlB97LZOBQRweLhlA0uO8ozwQEQjQ9pCJlci29d+ZO4hsIEnwTDmkwJhmJTmQRptbo8
         3e/39DmoM0HHtCqxkzP+BtTAbT80UjJ+q9I6yoqg9e2Nu6RPriIvpwWdUfuAGeay3wrg
         jcsrzEtVQdzj7cUMSE4hX0i1ZjZ5A+9Fa8JaQqO1eeu1dWVJr9t3lm7yuq9Z6Z3jPWvr
         0D9FqGShLo8Zv3pW1/vfB26HW0KimCRVJsHRJbW5l0piAtSmBCe545XT4pPRQ+TuHilm
         pclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        fh=W8NvV934U/LXs2PqZeH00RXxJo6WOjB0fU3bhR7KxGg=;
        b=LZ7L6qARpJa56EKunOfwX5V92nyV83ZN3Syt48oE9gHrP17Yg1fuw+B64BrmxgmtyZ
         A5FY7JcOFuAxjWfG/+/pENLMofJ3WaVSVik6vM5AJ6p+3FK+vh4f+1/6MYmMhtZAexxD
         VWSDzBGIrXdVZGLEB9rcO4R1Dr5jG+ETiU+lyYW15HtAuuemWjOq7eU0cye2uuPjMSVS
         qG5wj9hdvfeukykfFOEF1c5TjPXn0UDaOg106nqu68/DM+oEQ4oPR9cBkim4jdcOLRE1
         V7wX6qeL8cumN7pfMt7o10dQqEivARNHD8r0eLfR3G3+xoeZvRN7mTlmDl/zV0cQmmP7
         4dvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770620; x=1796375420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=C+ASaesMaG8sC0jROZY8oTB1Syewggehc0t3fKW5tvM8R64+d6YV47sO3dHY5oW1kl
         XmeOUkTGBKZui/vWZV3pw6PbSImO2oWhBZEoua95m+Uj6bEQwzQPfK8mAr+yJIc0nxIA
         3t+mqwlePrggszdszBfVx6kYjFYqhPHMvqp3WrF7mipWdQOKToVl38/P/eC5SB0a2H+s
         qHpTRinrzmxMuGEdNCM+EtuZEEezMPkKtWeDskKvbztNbro71czf1RFFs966BWSl+9aK
         bWoOCrQnR8zNwclhqV/m47MmEvmqBb5OpUgnZ+giN8gHGvcflJzmTip8+H+Dcrf2S+KS
         ZZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770620; x=1796375420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJZqyiXYJp/ORTQv62jnN7SBWTU5iRS+KZCY7pRd8ZI=;
        b=kzonh9eoND8tAWsmkRjA3qj4XQ14rzle/A0b74/PCyc13EVRrF8GyWtT+PRzgRP8Kz
         szkxsQSuL5f6oY9Bzr2iIdF0dK85kAexxXRuftzXSI9z7kyxWiiWwcSv+AGMfdmYeVcG
         gKWU3FHC+Ix0ji5TKfUZ3k9kLlgsW0dyV4cShT5RP2ljW8UX/IKNcJNNfIvwHdTYoL2S
         XSl1a1JwiZ+eNmzCE8MRw/OPhIg2yEdCGJwCLXDGQGQ6NANgKPHxw4D6qTwJaA16si8L
         FkLS1Lyjmo/MbnIU8mpqWpWxtOPIw66UPUpl+/UeXmJGTPQjUJYmpQZ97KhjJFslLexB
         +LyQ==
X-Forwarded-Encrypted: i=1; AL+hErGePOA2LNkKahN4vjHtF8yN2sJ1ymwlpPe3Wn7TZxD4o7suLshKthlZpTWCIJ6xSyih9hwXVfin9Mth@vger.kernel.org
X-Gm-Message-State: APuU4Z/YcQ+StupImbjUV7cH3trGBTVPhE4Fd34mWtaxx4swP5eN9BoO
	Teok3aXPzhjYY8+KhgvkxaRzyYTyKkayVaH7SKe031o1nP6WLTw+moswB7XwFhWiLFQFxTORnep
	Ng78JJ6oWQrAR7SwOA0nKNXzzUgoTme0=
X-Gm-Gg: AZFdTZf2V1LO9urryCtvoE9Jx1OLMstUyF0jIIFUgJeIg9Oa2lC3+9XNnoixpxmPc+l
	ACQhvuosQq0sPl84H9pPpKS362kvJkRFpALLT0A+4rfVkwBSFtjbAAzfjCBqyvZ2rlmbDFISuJc
	+ncU7kslLJjYkbAUPGdgIRtc1b2BbHQ/Az8I1RNJYII1pItf3pXNseDLwBgOp/5+iGAtIiuBV0j
	5bawfVCvb0yC/hVk9feJm6E6yd7052suyo4B17y3/brVv8NoxeuhIVfhxm9KAs3yhQ/r3RyqzHv
	tcxTkY/UoLbMYJLdyqoQj9kc+k/ZYCZBmxKNebrWdKmazC4g4hJr82BwJX3KkV5P46ZdIFh4L3E
	6fz6+4SR9QioyiKT0WY42ZjKJ6jWJIdQ2GpVXFqS2pS6/26+o8o+KwGgbgxEf2xLWtxysVGSVIw
	ngZK/QnymHnSk1MeWwIwCPVkULr+pvJD521skvllKY4Fn7hVoD9PU=
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id
 5a478bee46e88-386668523cfmr22742277eec.12.1795770620255; Fri, 27 Nov 2026
 01:10:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-3-clamor95@gmail.com>
 <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
In-Reply-To: <hlO8KiQKSi62yShZAIyhpw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:10:08 +0200
X-Gm-Features: Aa3M54rkyrHWlpK4-CIwvCUcDLkbHyRjNHzHood9SyBQos7xlCctA1vsn6y0klI
Message-ID: <CAPVz0n0Qyekm7qUyCVFMTDSuVSw=1my4x-rgiafp3+mQ_sgk3Q@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] drm/panel: panel-hitachi-tx10d07vm0baa: Convert
 to use MIPI DBI bus
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:2=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI Type B
> > driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..318ece68b7806 100644
> > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -14,6 +14,7 @@
> >  #include <video/mipi_display.h>
> >
> >  #include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
>
> You should now be able to get rid of includes of of_platform.h
> (replacing with of.h) and platform_device.h. Agent says drm_of.h and
> property.h are also unused.
>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbidev;
> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -40,9 +41,10 @@ static inline struct hitachi_tx10d07vm0baa *to_hitac=
hi_tx10d07vm0baa(struct drm_
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> >       struct drm_panel *panel =3D &(priv)->panel; \
> > +     struct mipi_dbi_device *dbidev =3D (priv)->dbidev; \
> >       struct device *dev =3D panel->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +56,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
panel *panel)
> >       struct device *dev =3D panel->dev;
> >       int ret;
> >
> > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > -     if (!priv->dbi)
> > -             return -ENODEV;
> > -
> >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> >
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_su=
pplies), priv->supplies);
> > @@ -243,9 +241,9 @@ static const struct drm_panel_funcs hitachi_tx10d07=
vm0baa_panel_funcs =3D {
> >       .get_modes =3D hitachi_tx10d07vm0baa_get_modes,
> >  };
>
> Unnecessary semicolon here.
>
> >
> > -static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
> > +static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbidev)
> >  {
> > -     struct device *dev =3D &pdev->dev;
> > +     struct device *dev =3D &dbidev->dev;
> >       struct hitachi_tx10d07vm0baa *priv;
> >       int ret;
> >
> > @@ -264,6 +262,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> >                                    "Failed to get reset gpio\n");
> >
> > +     priv->dbidev =3D dbidev;
> > +     mipi_dbi_set_drvdata(dbidev, priv);
> > +
> >       ret =3D drm_panel_of_backlight(&priv->panel);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > @@ -272,9 +273,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platf=
orm_device *pdev)
> >       if (ret)
> >               return dev_err_probe(dev, ret, "Failed to add panel\n");
> >
> > -     platform_set_drvdata(pdev, priv);
> > -
> > -     return 0;
> > +     return devm_mipi_dbi_attach(dev, dbidev);
> >  }
> >
> >  static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] =3D =
{
> > @@ -283,14 +282,14 @@ static const struct of_device_id hitachi_tx10d07v=
m0baa_of_match[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
> >
> > -static struct platform_driver hitachi_tx10d07vm0baa_driver =3D {
> > +static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver =3D {
> >       .driver =3D {
> >               .name =3D "panel-hitachi-tx10d07vm0baa",
> >               .of_match_table =3D hitachi_tx10d07vm0baa_of_match,
> >       },
> >       .probe =3D hitachi_tx10d07vm0baa_probe,
> >  };
> > -module_platform_driver(hitachi_tx10d07vm0baa_driver);
> > +module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
> >
> >  MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> >  MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver=
");
> > --
> > 2.53.0
> >
> >

I agree that your suggestions are ok, but they are out of scope of
this patch. They would require either dedicated commits or can be sent
as followups later on since they do not cause bugs.
