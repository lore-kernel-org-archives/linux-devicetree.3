Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE4376A19
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759335; cv=pass; b=FGAu0cfYE7fhBb2MH+Ip+svc/xha5V+lgY678IxN2+jpXvHmRrDVgHsr9/Lj0PIaM//wH3S+f+SXlu3mL2SapjsP8+P7WN87vJrvtWHcJ5OubTssmlklvk3tOHOFYyiToeuqmT242+PH5+SrQUrYx+ixV+fcvLIRTQSNBUOJ1oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759335; c=relaxed/simple;
	bh=K5OhWACTMzhR2anM039XHIir0uVqO+wNNsG17y8h6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGfzexICnLJWSCWF0kTtnDOMZNePrY4UVLGbF5B6x5ynnJBmh0HxaYFFQQYUGogYEhYdfKrWTk5bPUxX4+PQfVMgLVcRqmcygxko2qC3LXOe7RhN78uU+McWDuEPws3WCsWnZbX14uY0xVvxJHJohxoDiUwK7YxM//OtIWlL8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R86uMiQs; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R86uMiQs"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so1387029eec.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759333; cv=none;
        d=google.com; s=arc-20260327;
        b=mEn0qPAtw2OPsgSoVBSvvkAeMfmO6wM/CFDZuvvrg0ofcAPxjMz1h834wJDH3/cpuT
         kN3mxICx1F9JWu4ZKeUpSDWemq7m48q2b+NMR+xv9+ucBMby5Hb+j2YdOTMtbKpKxrfZ
         PSoM2WVoGetdxySzJBZtwKVCMNqhxtfT+9M89jEiyk95bJbXox/ThugsgPDgiIFTnfVi
         8O/6cvdx9CFqVfeH5YemUDX2BIwTKKRgyziVGGpPXH/g6OTsKUgVQT+1EM6LNnRzFes1
         fi7yj5ojHj8DGgGCF4v0879z9lSEFOOLZkx4rIz9MGQzgTur1sgyKqKugfzWTXM74JUg
         roMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        fh=Rp6UVcGRkdak4FQV2Dm7fwivzNMliTcpjSZz9bHP0uk=;
        b=Cf7lNfzWAoUcbvGgYiWDXEcrInRqaVG8vGbPzYLsd6ffs8fLuLpOgbRzP0drIO+RAe
         w78y4Ukis+/saHYWPaGYXXpRWFABU/gl4j9iXkRcOTf/Q6Ok0B5P76TH8yYnoJhWUG8j
         kIceydbIsXAMh4dKT74CQYVusQFjrOCsYj2R+0Rg0D6km5aZUDYzLjQ3QHusSH9bJMud
         5HVQnn2seYEmOv1CuOroZCrzp3IO0NHHQHE13i3jIREIog8JrvLLlpaGmCQ4/jXGhD9f
         2cGA+jCxqiC3ZhG9RgUoUk57DYCSWK1SFV3b2C5dc0UqsIcHBY2n3g4ci7agtlQKb7gm
         s6UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759333; x=1791364133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        b=R86uMiQsOTDuvLYaGHCaMW3eJXOvD5j3DU00FIZtW36Ks/W6LgLNfS+wSQ7Rawlt1J
         GINX7hVqpdPSVCbkABBbnbvWvMY4XLxRAIFYrhlNnYfOaiObbGuUzfYu/8nDQMrveawi
         /yuU+Z4YdITgmic0LfznezZTnwF9iVtOLbIWmEtVp90KmVHgLEwkomAEZt3W0OfhXBwc
         EeDmf9vzFIphZ+FB/lALjYs51Zzas/v66PEytcz9klmK2pyCuQjiSQ/3D2t9vYO5p750
         6qvUsBmescVzYlgrJ40vp+XX88Yr7Fb5Q+37Mufd0rUN96d6IDfyXIAUpg+Rg+pmmSBm
         cP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759333; x=1791364133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        b=F7zMzaw53pFToxzbeueOvBNs3c5Uq6/ezJkWPow4nJUlt3aO2wZue8xF4PK4eN+WDj
         qkrbTKwwvvSVd4rSf2P5YEVudMXTLWIlVpFst1Eh4c7GF1Dp/WTo/zix+suXINOTnuwe
         Y3iu5CybOoQZRNj6PizALQc4vzGsvkk89mRg9Mf8UXBv1UtaOhCgQS7WLi6DJfZjZIXf
         1RRC50buIm5KEhTEWNP4AAsPMMU3WCmt2mZaFZx3FwOznaiF8NlBmmqKK+6qStVxrXuw
         aUsj9jRYWKBik0N4Ds5TBjrOMRuvjUAlph4schSont5Tcxp7830npKUBbcNqplg4xLTQ
         QbgQ==
X-Forwarded-Encrypted: i=1; AKwUvByJIisVuTgEWrOoUs5HHagspS4FLskGu62vn9WhjOQa5fOBXyMJUCvtub8BfICZyxKz2ecX/tfVZuGr@vger.kernel.org
X-Gm-Message-State: AFq9FYK7JBV330bQvDsF5EHukxOUOiYyiXyb0pkK5PaolitX+tS3/odD
	IBQ2yw4qF6438gtV2iQ3UwmSDwIbrubBV4h1vYOLgqLDGSqBnTro5m2XUzMhgPFq2ccEnIrFcS5
	vxROzgCGX5tVCll6aPUB7n2pblh4OAaE=
X-Gm-Gg: AYBFou0hab8JsdGYCxCPDCshTz+38zalaSF8KuJCvJdP1F0zSHh1gNKhlu0avYTV6nu
	6daUJi/0Ge4cos9pCfvOpBZt+vtwx74HxbxWx/1eHe4Aqa4waEgaahOreCIU8NtygOjuYKo5B/0
	mpsialdeDy0Wiipb9pmcvf3ExNruiZhwkB+aOp+/ewe02Iq6Wt3M3OrbNCnUqZLwBG6kPY3fEmW
	ePlZF/pjdql9JVF+44z3IDEBx5uL+wCgLlAD4MZt7lPwu8Z9TQrK84pp0glbNUwQ+KgtAXEzVMX
	Z6ciYKuSpEPh/SDrZccUTSNeXUP5gKEt9MVpeUh2ppBpC3zIJY+Z6aifr4Be0CpygImmm7e/DPu
	Xb8FLtad4I0gQ
X-Received: by 2002:a05:7301:9a93:b0:341:fd68:89ce with SMTP id
 5a478bee46e88-34cdc6bd821mr1056387eec.23.1790759332923; Wed, 30 Sep 2026
 02:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome>
In-Reply-To: <arzNgbx465QIKYdX@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:08:41 +0300
X-Gm-Features: AclHuK_GrgB1ybpXzB5TqGoO9XwCnkq9EQsObVGEae8urTG4uQ6PfBurcWJJG5Q
Message-ID: <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:02 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> > Add a driver for panels used in LG Optimus 2X P990. Both panels are 4"
> > WVGA MIPI DBI Type B linked to DRM encoder via RGB to DBI bridge.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |  14 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 396 ++++++++++++++++++
> >  3 files changed, 411 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 747f47347521a..47962197a9c76 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -273,6 +273,20 @@ config DRM_PANEL_HIMAX_HX8394
> >
> >         If M is selected the module will be called panel-himax-hx8394.
> >
> > +config DRM_PANEL_HITACHI_TX10D07VM0BAA
> > +     tristate "Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI panels"
> > +     depends on OF
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_MIPI_DBI
> > +     select VIDEOMODE_HELPERS
> > +     help
> > +       Say Y here if you want to enable support for the HITACHI
> > +       TX10D07VM0BAA and LG LH400WV3 MIPI DBI panels found in the
> > +       LG Optimus 2X P990 smartphone.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called panel-hitachi-tx10d07vm0baa.
> > +
> >  config DRM_PANEL_HYDIS_HV101HD1
> >       tristate "Hydis HV101HD1 panel"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index f2c9c80a218f0..414267a49d922 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) +=3D panel-him=
ax-hx83112a.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) +=3D panel-himax-hx83112b.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) +=3D panel-himax-hx83121a.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) +=3D panel-himax-hx8394.o
> > +obj-$(CONFIG_DRM_PANEL_HITACHI_TX10D07VM0BAA) +=3D panel-hitachi-tx10d=
07vm0baa.o
> >  obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) +=3D panel-hydis-hv101hd1.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) +=3D panel-ilitek-ili7807s.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7836A) +=3D panel-ilitek-ili7836a.o
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > new file mode 100644
> > index 0000000000000..d2c3b63649288
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +enum panel_dbi_id {
> > +     PANEL_DBI_NONE,
> > +     PANEL_DBI_TX10D07VM0BAA,
> > +     PANEL_DBI_LH400WV3,
> > +};
> > +
> > +static const struct regulator_bulk_data panel_dbi_supplies[] =3D {
> > +     { .supply =3D "avci" }, { .supply =3D "iovcc" },
> > +};
> > +
> > +struct panel_dbi {
> > +     struct drm_panel panel;
> > +     struct mipi_dbi *dbi;
> > +
> > +     struct regulator_bulk_data *supplies;
> > +     struct gpio_desc *reset_gpio;
> > +};
> > +
> > +static inline struct panel_dbi *to_panel_dbi(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct panel_dbi, panel);
> > +}
> > +
> > +#define panel_dbi_command(priv, cmd, seq...) \
> > +({ \
> > +     const u8 d[] =3D { seq }; \
> > +     struct drm_panel *panel =3D &(priv)->panel; \
> > +     struct device *dev =3D panel->dev; \
> > +     int ret; \
> > +     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     if (ret) \
> > +             dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> > +     ret; \
> > +})
> > +
>
> [...]
> > +static int panel_dbi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     const struct drm_panel_funcs *panel_dbi_funcs;
> > +     struct panel_dbi *priv;
> > +     enum panel_dbi_id id;
> > +     int ret;
> > +
> > +     id =3D (uintptr_t)of_device_get_match_data(dev);
> > +
> > +     switch (id) {
> > +     case PANEL_DBI_TX10D07VM0BAA:
> > +             panel_dbi_funcs =3D &hitachi_tx10d07vm0baa_panel_funcs;
> > +             break;
> > +
> > +     case PANEL_DBI_LH400WV3:
> > +             panel_dbi_funcs =3D &lg_lh400wv3_panel_funcs;
> > +             break;
> > +
> > +     default:
> > +             return dev_err_probe(dev, -ENODEV, "Unknown device %d\n",=
 id);
> > +     }
>
> This is a bit pointless. The only reason you need that default here is
> because you have an enum that is "none" but that PANEL_DBI_NONE is never
> even used.
>
> > +
> > +     priv =3D devm_drm_panel_alloc(dev, struct panel_dbi, panel,
> > +                                 panel_dbi_funcs, DRM_MODE_CONNECTOR_D=
PI);
> > +     if (IS_ERR(priv))
> > +             return PTR_ERR(priv);
> > +
> > +     ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(panel_dbi_s=
upplies),
> > +                                         panel_dbi_supplies, &priv->su=
pplies);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get supplies\n"=
);
> > +
> > +     priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_=
OUT_HIGH);
> > +     if (IS_ERR(priv->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +                                  "Failed to get reset gpio\n");
> > +
> > +     ret =3D drm_panel_of_backlight(&priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > +
> > +     ret =3D devm_drm_panel_add(dev, &priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to add panel\n");
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)PANEL_DB=
I_TX10D07VM0BAA },
> > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)PANEL_DBI=
_LH400WV3 },
>
> Why the detour through that PANEL_DB_* enum? You could just pass the
> panel funcs pointers directly via .data here.
>

Passing API/OPS via .data is discouraged.

> Also, looking at the enable/disable sequences these are in fact two
> different drivers, with the only commonality being that they happen to
> be used in the same device. Rolling them both into one driver seems a
> bit odd.

I did this to simplify maintainance. Both panels are used in the LG
Optimus 2X. My assumption is that LG switched one to another at some
point, hence they share same timings, controls and supplies, but
differ in en/disable sequence. Additionally, these are the the only
DBI Type B-only panels in the kernel, from what I can see.

> If you really want to avoid duplication, maybe they should go
> into some kind of "simple" or "generic" DBI driver.

DBI Type B is not well supported in the kernel.

>
> Thierry
