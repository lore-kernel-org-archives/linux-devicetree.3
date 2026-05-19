Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6F4F5E0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779167339; cv=pass; b=dBpy6Nyc43FFUXgSF4C/eWNCef9VsudYlpAxWrY2nWicnYRiDzULZe8k7GtAKlcRllZ4gfEto/9U9WPSNJM/C0WuT4wxBni3ahOcOhMPGdOpUoCn1ocwRjgEP354UY+x9lykiQiJV2NRI8nwN5bHgWzFP7I8/spLBkJfIgEz9KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779167339; c=relaxed/simple;
	bh=+ZLSLqfkqnYQ3MUXkYO21727YPQ2BrE8ABnk7Cb7E4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldBkCGH4Rz4F5ipvRqGUpHXSLqqAbD//mLNbHz9WkUCXwlv7wf3WecRpojUoc0MPTQNitjhMV0bh2i5Su4qY9L/YM/KmhI43DqDeMqzYjiAhdsgHXkoMidvoZRelEvjl08bVvj/Z/yKvaB8+DpgBMw98c8isJ6LyZb/px2H+5qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rm1FQjtI; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rm1FQjtI"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393925cb1baso37399331fa.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779167333; cv=none;
        d=google.com; s=arc-20240605;
        b=Lq6aynH5ZzBXYBfl/MKIJtNPoGQYRQn/Xa9zM11ZP/+BDFBZK/yvuBsK9dGYVTHm4N
         vYz09jt5mM7/WCSnW26zsmx7gdKlYJHXg0GatlWESAAtekAEzcEAjzmW382i4zjzrREN
         1/7jyGDBW8doT26XRqf+QZlzFPfEQ+llxev2zSWeST4d460D8M9PI+nMeYopikcChgT8
         oyS1BVL5VRoKSZVZFIRzLU05E2rWKv+BvJXHaYoOa6huTZXjzGqg+wkU3u2KZJWuNYUB
         HzDHdla1h+w03Lt+Px5hFRsKIjhhwkA3x5hh1hkGFz5IkCqmIxmPPMG2UQQwV4XdI0av
         IRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GfH0ZIrAufFfH/0V6M3CDoj9GxmN6MFg7zrk0ckrxM0=;
        fh=a5LF+IsWeyIYVeQnSpCdZdwES+8qUnj1BBi0dm2HIyM=;
        b=PYV/JV20WQBPMLxoC20ouWuN9TGjNv1NCB2XvdyBlzZBEu8H/17Txc0nXsl3SFoCAg
         v4noJ6SLz7wT7v8B+CALkeg1nVrWkeX89UJ+HvrHpoz38AgBq2e9Erit3mfqUQ5uFVSj
         yu1P6qfcPjRjkpgYlZqqcHYzjuqj3WvOTeLMQm0H3vM4j4IqN/7fhSXMSL0pDUAXjwyK
         ArjLeY9uxkYf0R/Us+Z7X+EHKu112dQrQ19VT8JkpiSo3AgBjBXDmRfw8x7FlIRusK5F
         DYv5DKJHiIl+FPd1UFhbG7P1jcthL3Mm+adZuCD+qnnYnYxz6TO7cTaYVj7TSPFXW+hp
         OBXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779167333; x=1779772133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfH0ZIrAufFfH/0V6M3CDoj9GxmN6MFg7zrk0ckrxM0=;
        b=rm1FQjtIJeKj8GjfDlMnHwI33bPkSCTRm/P+5apuBlkLBbS1o2hyEnPrWYtuspwbW+
         8UioQh+4jJGOvNBawAHN3JoVe/h727gi2RhX6JV23YefVycAnLNRU0cs/YILvwqnHber
         EsqY/O2q7gD9tokab/zYhTXFWIxEF8ChPTvWXY8f6HbUAQIirzjTW/gfu9b4amK2gTe9
         11hl+EmW+kXUBTiWCK6YGMY5aGg/YWImnJ2L4aEb6cKqAAi2NmfS/BawKyq75B7NZLZw
         inlInS6jVLNlTLrBvT+YwfqOyOHkr2NE0SecwZvGfo53nKq53LCdwGyK7MUSTBJRoFdh
         paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779167333; x=1779772133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfH0ZIrAufFfH/0V6M3CDoj9GxmN6MFg7zrk0ckrxM0=;
        b=skDOEgTj0r49Z026dU73tzAPIZGZurzb8L1cTfC+wqVJnZi6Ium3N2z2DsbxQ/MQxX
         lP7FNYhA0DxVc0i0ofqVEeopxi6kXNtbwQw1XOdNBJZMJJwofBu5oSGJeKsJbKdbreYF
         QcxFJPSE+cgPZlRoIZqiNfhyNlYYESDj1Ox2SXDtFHJTFlQypXDV8DmmUIBk66RiE/hN
         1FryCDfWHGR34eFK9oJ3vg/xweXoBxUnfdOxRUUez5upJcYJAiU4ASkQm0jn2xUWdGI5
         1CAAGfco1JvWZPo/ELNaKrY9dw37RqjaGV0g3JRkdeRIln4WgazHvBr3Jlo1Vl6GsXsG
         Lzzw==
X-Forwarded-Encrypted: i=1; AFNElJ817IX2ipWOFg+QvO3TttBUQIsPYqH3XgJLZBbOxHseCvt5eDdYMOVublpk2dJzA1+lrIHhZqcNLE3y@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAFmpwhVyoi4uNde3NdT+twyfPq+Rq2LqVvnkpoOaB0FkY/50
	a4nepalReEH6QWCDEb8uc4iNaNCBCF+Sm1d7HgApv0YUt1H7JqBXB4vSDOhxnGmVxX25kgwoo0N
	MJt4BpmzzYxwpjqV5VLXVkhLO0n/PeIA=
X-Gm-Gg: Acq92OGWIsZ/NAbT03ltXh3ttqfkYmzaExGawEZ+B8PU0oo3gfpjiNaEPyM/Cdaesja
	JCgqmqmltknS1qd18soKhtaNgcs7UhCod5zoqjiA4T+baYIsqH9pa4Ky3x3eLzdcBRcg99TDyQe
	q7NtKLT6kqSMfiUacw4UfnXgy3wjKwjLlmurUdA6WzrGW/CFC4GmHGch/xNTbDTBurjaTYRkPII
	sTdboomqMXFCHvdI38NHHTw0opw9StJXusngy1S6IEHi/Jg+nSgJdkP/CiHnVCORAK+yYx6vISA
	bat9SHnQyzLBiukHM+gZ8HmXqLa9MIJfUe3YqsJd8FynhIu5KeBCJx1EaPo5Hg1iSWSo
X-Received: by 2002:a05:6512:1589:b0:5aa:b6a:738d with SMTP id
 2adb3069b0e04-5aa0e746c6amr5303590e87.43.1779167333119; Mon, 18 May 2026
 22:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-icna35xx-v3-0-c304f04c32c4@gmail.com>
 <20260514-icna35xx-v3-2-c304f04c32c4@gmail.com> <6dd8f137-a4df-4602-9536-b73abff5e7d1@linaro.org>
In-Reply-To: <6dd8f137-a4df-4602-9536-b73abff5e7d1@linaro.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 19 May 2026 00:08:41 -0500
X-Gm-Features: AVHnY4LeYs98GBQqXFX7bSUsEAgNAPvBFfMuu-9EA7zAyAEFhRR8OktHYCDne-A
Message-ID: <CALHNRZ9rKs2cXHgyH15qc0=Tz_+tg9rp_c5gCJs00t8H4Ke71w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:29=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 5/14/26 23:29, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This adds support for the ICNA3512 and ICNA3520 DDICs used in both the
> > AYN Odin 2 Portal and Ayaneo Pocket DS top panel respectively and for
> > for both the AYN Odin 3 and the AYN Thor top panel respectively.
> >
> > These all have unique compatibles because the panels themselves are
> > likely unique hardware with only the ddic's and thus api and driver
> > handling shared.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                  |  11 +
> >   drivers/gpu/drm/panel/Makefile                 |   1 +
> >   drivers/gpu/drm/panel/panel-chipone-icna35xx.c | 619 ++++++++++++++++=
+++++++++
> >   3 files changed, 631 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 7450b27622a233..1368b5a0b6c912 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -105,6 +105,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
> >         Say Y here if you want to support for BOE TV101WUM-LL2
> >         WUXGA PANEL DSI Video Mode panel
> >
> > +config DRM_PANEL_CHIPONE_ICNA35XX
> > +     tristate "Chipone ICNA35XX panel driver"
> > +     depends on OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_DISPLAY_HELPER
> > +     help
> > +       Say Y here if you want to enable support for the panels built
> > +       around the Chipone ICNA3512 and ICNA3520 display controllers,
> > +       such as some Tianma panels used in AYN Odin2 Portal and Thor.
> > +
> >   config DRM_PANEL_CHIPWEALTH_CH13726A
> >       tristate "CHIPWEALTH CH13726A-based DSI panel"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index c2c5cf81711633..d39a8f82fa8c06 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TD4320) +=3D panel-boe-td432=
0.o
> >   obj-$(CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A) +=3D panel-boe-th101m=
b31ig002-28a.o
> >   obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_LL2) +=3D panel-boe-tv101wum-ll2.=
o
> >   obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) +=3D panel-boe-tv101wum-nl6.=
o
> > +obj-$(CONFIG_DRM_PANEL_CHIPONE_ICNA35XX) +=3D panel-chipone-icna35xx.o
> >   obj-$(CONFIG_DRM_PANEL_CHIPWEALTH_CH13726A) +=3D panel-chipwealth-ch1=
3726a.o
> >   obj-$(CONFIG_DRM_PANEL_DSI_CM) +=3D panel-dsi-cm.o
> >   obj-$(CONFIG_DRM_PANEL_LVDS) +=3D panel-lvds.o
> > diff --git a/drivers/gpu/drm/panel/panel-chipone-icna35xx.c b/drivers/g=
pu/drm/panel/panel-chipone-icna35xx.c
> > new file mode 100644
> > index 00000000000000..958f205a7f4f93
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-chipone-icna35xx.c
> > @@ -0,0 +1,619 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Chipone ICNA35XX Driver IC panels driver
> > + *
> > + * Copyright (c) 2025 Teguh Sobirin <teguh@sobir.in>
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/display/drm_dsc.h>
> > +#include <drm/display/drm_dsc_helper.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +struct panel_info {
> > +     struct drm_panel panel;
> > +     struct drm_connector *connector;
> > +     struct mipi_dsi_device *dsi;
> > +     struct panel_desc *desc;
> > +     enum drm_panel_orientation orientation;
> > +
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator_bulk_data *supplies;
> > +};
> > +
> > +struct panel_desc {
> > +     unsigned int width_mm;
> > +     unsigned int height_mm;
> > +
> > +     unsigned int bpc;
> > +     unsigned int lanes;
> > +     unsigned long mode_flags;
> > +     enum mipi_dsi_pixel_format format;
> > +
> > +     const struct drm_display_mode *modes;
> > +     unsigned int num_modes;
> > +     int (*init_sequence)(struct panel_info *pinfo);
> > +
> > +     struct drm_dsc_config dsc;
> > +};
> > +
> > +static const struct regulator_bulk_data panel_supplies[] =3D {
> > +     { .supply =3D "vdd" },
> > +     { .supply =3D "vddio" },
> > +     { .supply =3D "vci" },
> > +     { .supply =3D "disp" },
> > +     { .supply =3D "blvdd" },
> > +};
> > +
> > +static inline struct panel_info *to_panel_info(struct drm_panel *panel=
)
> > +{
> > +     return container_of(panel, struct panel_info, panel);
> > +}
> > +
> > +static int icna35xx_get_current_mode(struct panel_info *pinfo)
> > +{
> > +     struct drm_connector *connector =3D pinfo->connector;
> > +     struct drm_crtc_state *crtc_state;
> > +     int i;
> > +
> > +     /* Return the default (first) mode if no info available yet */
> > +     if (!connector->state || !connector->state->crtc)
> > +             return 0;
> > +
> > +     crtc_state =3D connector->state->crtc->state;
> > +
> > +     for (i =3D 0; i < pinfo->desc->num_modes; i++) {
> > +             if (drm_mode_match(&crtc_state->mode,
> > +                                &pinfo->desc->modes[i],
> > +                                DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATC=
H_CLOCK))
> > +                     return i;
> > +     }
> > +
> > +     return 0;
> > +}
>
> I'm uncertain about that, I think you should stick to a single mode for
> now until we properly add the atomic panel API variant.
>
> Please see https://lore.kernel.org/all/20260425001130.233935-1-val@packet=
t.cool/
> for a first version of that, but it may need more work to make it right.

Losing the extra modes feels ugh, when they work as expected, but ack.
I hope the new handling doesn't get stuck in limbo for too long.

> > +
> > +static int icna3512_init_sequence(struct panel_info *pinfo)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->dsi }=
;
> > +     struct drm_dsc_picture_parameter_set pps;
> > +
> > +     int cur_mode =3D icna35xx_get_current_mode(pinfo);
> > +     int cur_vrefresh =3D drm_mode_vrefresh(&pinfo->desc->modes[cur_mo=
de]);
> > +
> > +     pinfo->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9C, 0xA5, 0xA5);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xFD, 0x5A, 0x5A);
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x53, 0xE0);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x0F);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCE, 0x22);
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x01);
> > +     if (cur_vrefresh =3D=3D 165) {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x20);
> > +     } else if (cur_vrefresh =3D=3D 144) {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xE0, 0xA0, 0x10, 0xC8, 0x00, 0x02, 0x83,
> > +                     0x00, 0x10, 0x14, 0x00, 0x00, 0xC3, 0x00, 0x10,
> > +                     0x14, 0x00, 0x00, 0xE0, 0x00, 0x10, 0x14, 0x00,
> > +                     0x00, 0xE0, 0xA0, 0x10, 0xC8, 0x22, 0x18, 0x18,
> > +                     0x18, 0x18, 0x18);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x07);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB5,
> > +                     0x04, 0x0A, 0x08, 0x0A, 0x04, 0x00, 0xC4);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xD9,
> > +                     0x66, 0xE4, 0xE4, 0x66, 0xE4, 0xE4, 0x00, 0xC4,
> > +                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCE,
> > +                     0x01, 0x01, 0x01, 0x01, 0x04, 0x07, 0xA4);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x30);
> > +     } else if (cur_vrefresh =3D=3D 120) {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xE0, 0xA0, 0x10, 0xC8, 0x00, 0x02, 0x83,
> > +                     0x00, 0x10, 0x14, 0x00, 0x00, 0xC3, 0x00, 0x10,
> > +                     0x14, 0x00, 0x00, 0xE0, 0x10, 0x10, 0x9C, 0x00,
> > +                     0x00, 0xE0, 0xA0, 0x10, 0xC8, 0x22, 0x18, 0x18,
> > +                     0x18, 0x18, 0x18);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x07);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB5,
> > +                     0x04, 0x0C, 0x08, 0x0C, 0x04, 0x00, 0xC4);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xD9,
> > +                     0x88, 0x40, 0x40, 0x88, 0x40, 0x40, 0x00, 0xEB,
> > +                     0x11, 0xFF);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCE,
> > +                     0x01, 0x01, 0x01, 0x01, 0x04, 0x09, 0x2C);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x30);
> > +     } else if (cur_vrefresh =3D=3D 90) {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xE0, 0x40, 0x10, 0xA8, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x07);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2,
> > +                     0x04, 0x10, 0x08, 0x0C, 0x04, 0x00, 0xC4);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xD3,
> > +                     0x55, 0x80, 0x80, 0x55, 0x80, 0xB0, 0x00, 0x9C,
> > +                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCB,
> > +                     0x01, 0x01, 0x01, 0x01, 0x04, 0x06, 0x1C);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x00);
> > +     } else {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xE0, 0xA0, 0x10, 0xC8, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x07);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2,
> > +                     0x04, 0x18, 0x08, 0x0C, 0x02, 0x00, 0xC4);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xD3,
> > +                     0x88, 0x4A, 0x4A, 0x88, 0x4A, 0x4A, 0x00, 0xEB,
> > +                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xCB,
> > +                     0x01, 0x01, 0x01, 0x01, 0x04, 0x2C);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x00);
> > +     }
> > +
> > +     drm_dsc_pps_payload_pack(&pps, &pinfo->desc->dsc);
> > +     mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int icna3520_init_sequence(struct panel_info *pinfo)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->dsi }=
;
> > +     struct drm_dsc_picture_parameter_set pps;
> > +
> > +     int cur_mode =3D icna35xx_get_current_mode(pinfo);
> > +     int cur_vrefresh =3D drm_mode_vrefresh(&pinfo->desc->modes[cur_mo=
de]);
> > +
> > +     pinfo->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9C, 0xA5, 0xA5);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xFD, 0x5A, 0x5A);
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x53, 0xE0);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     if (cur_vrefresh =3D=3D 120) {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xD8, 0x00, 0x1C, 0x00, 0x4C);
> > +     } else {
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x48, 0x10);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x00);
> > +             mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB3,
> > +                     0x00, 0xDB, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x00,
> > +                     0xDB, 0x00, 0x1C, 0x07, 0xD6, 0x00);
> > +     }
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x01);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x00);
> > +
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9F, 0x0D);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x27);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB6, 0x03);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xBB, 0x01);
> > +     mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xB2, 0x24);
> > +
> > +     drm_dsc_pps_payload_pack(&pps, &pinfo->desc->dsc);
> > +     mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static const struct drm_display_mode odin2portal_modes[] =3D {
> > +     {
> > +             /* 165Hz */
> > +             .clock =3D (1080 + 98 + 1 + 23) * (1920 + 20 + 1 + 15) * =
165 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 98,
> > +             .hsync_end =3D 1080 + 98 + 1,
> > +             .htotal =3D 1080 + 98 + 1 + 23,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 20,
> > +             .vsync_end =3D 1920 + 20 + 1,
> > +             .vtotal =3D 1920 + 20 + 1 + 15,
> > +     },
> > +     {
> > +             /* 144Hz */
> > +             .clock =3D (1080 + 156 + 1 + 23) * (1920 + 20 + 1 + 15) *=
 144 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 156,
> > +             .hsync_end =3D 1080 + 156 + 1,
> > +             .htotal =3D 1080 + 156 + 1 + 23,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 20,
> > +             .vsync_end =3D 1920 + 20 + 1,
> > +             .vtotal =3D 1920 + 20 + 1 + 15,
> > +     },
> > +     {
> > +             /* 120Hz */
> > +             .clock =3D (1080 + 156 + 1 + 23) * (1920 + 412 + 1 + 15) =
* 120 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 156,
> > +             .hsync_end =3D 1080 + 156 + 1,
> > +             .htotal =3D 1080 + 156 + 1 + 23,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 412,
> > +             .vsync_end =3D 1920 + 412 + 1,
> > +             .vtotal =3D 1920 + 412 + 1 + 15,
> > +     },
> > +     {
> > +             /* 90Hz */
> > +             .clock =3D (1080 + 156 + 1 + 23) * (1920 + 1192 + 1 + 15)=
 * 90 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 156,
> > +             .hsync_end =3D 1080 + 156 + 1,
> > +             .htotal =3D 1080 + 156 + 1 + 23,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 1192,
> > +             .vsync_end =3D 1920 + 1192 + 1,
> > +             .vtotal =3D 1920 + 1192 + 1 + 15,
> > +     },
> > +     {
> > +             /* 60Hz */
> > +             .clock =3D (1080 + 156 + 1 + 23) * (1920 + 2760 + 1 + 15)=
 * 60 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 156,
> > +             .hsync_end =3D 1080 + 156 + 1,
> > +             .htotal =3D 1080 + 156 + 1 + 23,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 2760,
> > +             .vsync_end =3D 1920 + 2760 + 1,
> > +             .vtotal =3D 1920 + 2760 + 1 + 15,
> > +     }
> > +};
> > +
> > +static const struct drm_display_mode thor_top_modes[] =3D {
> > +     {
> > +             /* 120Hz */
> > +             .clock =3D (1080 + 24 + 1 + 24) * (1920 + 28 + 1 + 28) * =
120 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 24,
> > +             .hsync_end =3D 1080 + 24 + 1,
> > +             .htotal =3D 1080 + 24 + 1 + 24,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 28,
> > +             .vsync_end =3D 1920 + 28 + 1,
> > +             .vtotal =3D 1920 + 28 + 1 + 28,
> > +     },
> > +     {
> > +             /* 60Hz */
> > +             .clock =3D (1080 + 24 + 1 + 24) * (1920 + 2006 + 1 + 28) =
* 60 / 1000,
> > +             .hdisplay =3D 1080,
> > +             .hsync_start =3D 1080 + 24,
> > +             .hsync_end =3D 1080 + 24 + 1,
> > +             .htotal =3D 1080 + 24 + 1 + 24,
> > +             .vdisplay =3D 1920,
> > +             .vsync_start =3D 1920 + 2006,
> > +             .vsync_end =3D 1920 + 2006 + 1,
> > +             .vtotal =3D 1920 + 2006 + 1 + 28,
> > +     }
> > +};
> > +
> > +static struct panel_desc odin2portal_desc =3D {
> > +     .modes =3D odin2portal_modes,
> > +     .num_modes =3D ARRAY_SIZE(odin2portal_modes),
> > +     .width_mm =3D 160,
> > +     .height_mm =3D 89,
> > +     .bpc =3D 8,
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_=
CONTINUOUS |
> > +                     MIPI_DSI_MODE_LPM,
> > +     .init_sequence =3D icna3512_init_sequence,
> > +     .dsc =3D {
> > +             .dsc_version_major =3D 0x1,
> > +             .dsc_version_minor =3D 0x1,
> > +             .slice_height =3D 20,
> > +             .slice_width =3D 540,
> > +             .slice_count =3D 2,
> > +             .bits_per_component =3D 8,
> > +             .bits_per_pixel =3D 8 << 4,
> > +             .block_pred_enable =3D true,
> > +     },
> > +};
> > +
> > +static struct panel_desc thor_top_desc =3D {
> > +     .modes =3D thor_top_modes,
> > +     .num_modes =3D ARRAY_SIZE(thor_top_modes),
> > +     .width_mm =3D 136,
> > +     .height_mm =3D 68,
> > +     .bpc =3D 8,
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON=
_CONTINUOUS |
> > +                     MIPI_DSI_MODE_LPM,
> > +     .init_sequence =3D icna3520_init_sequence,
> > +     .dsc =3D {
> > +             .dsc_version_major =3D 0x1,
> > +             .dsc_version_minor =3D 0x1,
> > +             .slice_height =3D 12,
> > +             .slice_width =3D 540,
> > +             .slice_count =3D 2,
> > +             .bits_per_component =3D 8,
> > +             .bits_per_pixel =3D 8 << 4,
> > +             .block_pred_enable =3D true,
> > +     },
> > +};
> > +
> > +static void icna35xx_reset(struct panel_info *pinfo)
> > +{
> > +     gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> > +     usleep_range(20000, 21000);
> > +     gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> > +     usleep_range(20000, 21000);
> > +     gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> > +     usleep_range(20000, 21000);
> > +}
> > +
> > +static int icna35xx_prepare(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo =3D to_panel_info(panel);
> > +     int ret;
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(panel_supplies), pinfo->=
supplies);
> > +     if (ret < 0) {
> > +             dev_err(panel->dev, "failed to enable regulators: %d\n", =
ret);
> > +             return ret;
> > +     }
> > +
> > +     icna35xx_reset(pinfo);
> > +
> > +     ret =3D pinfo->desc->init_sequence(pinfo);
> > +     if (ret < 0) {
> > +             regulator_bulk_disable(ARRAY_SIZE(panel_supplies), pinfo-=
>supplies);
> > +             dev_err(panel->dev, "failed to initialize panel: %d\n", r=
et);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int icna35xx_disable(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo =3D to_panel_info(panel);
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->dsi }=
;
> > +
> > +     pinfo->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 50);
> > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int icna35xx_unprepare(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo =3D to_panel_info(panel);
> > +
> > +     gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> > +     regulator_bulk_disable(ARRAY_SIZE(panel_supplies), pinfo->supplie=
s);
> > +
> > +     return 0;
> > +}
> > +
> > +static void icna35xx_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct panel_info *pinfo =3D mipi_dsi_get_drvdata(dsi);
> > +     int ret;
> > +
> > +     ret =3D mipi_dsi_detach(pinfo->dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "failed to detach from DSI host: %d\n"=
, ret);
> > +
> > +     drm_panel_remove(&pinfo->panel);
> > +}
>
> Weird place for remove, anyway you can drop this when using the devm_ pro=
be calls.

Ack

>
> > +
> > +static int icna35xx_get_modes(struct drm_panel *panel,
> > +                            struct drm_connector *connector)
> > +{
> > +     struct panel_info *pinfo =3D to_panel_info(panel);
> > +     int i;
> > +
> > +     for (i =3D 0; i < pinfo->desc->num_modes; i++) {
> > +             const struct drm_display_mode *m =3D &pinfo->desc->modes[=
i];
> > +             struct drm_display_mode *mode;
> > +
> > +             mode =3D drm_mode_duplicate(connector->dev, m);
> > +             if (!mode) {
> > +                     dev_err(panel->dev, "failed to add mode %ux%u@%u\=
n",
> > +                             m->hdisplay, m->vdisplay, drm_mode_vrefre=
sh(m));
> > +                     return -ENOMEM;
> > +             }
> > +
> > +             mode->type =3D DRM_MODE_TYPE_DRIVER;
> > +             if (i =3D=3D 0)
> > +                     mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> > +
> > +             drm_mode_set_name(mode);
> > +             drm_mode_probed_add(connector, mode);
> > +     }
> > +
> > +     connector->display_info.width_mm =3D pinfo->desc->width_mm;
> > +     connector->display_info.height_mm =3D pinfo->desc->height_mm;
> > +     connector->display_info.bpc =3D pinfo->desc->bpc;
> > +     pinfo->connector =3D connector;
> > +
> > +     return pinfo->desc->num_modes;
> > +}
> > +
> > +static enum drm_panel_orientation icna35xx_get_orientation(struct drm_=
panel *panel)
> > +{
> > +     struct panel_info *pinfo =3D to_panel_info(panel);
> > +
> > +     return pinfo->orientation;
> > +}
> > +
> > +static const struct drm_panel_funcs icna35xx_panel_funcs =3D {
> > +     .disable =3D icna35xx_disable,
> > +     .prepare =3D icna35xx_prepare,
> > +     .unprepare =3D icna35xx_unprepare,
> > +     .get_modes =3D icna35xx_get_modes,
> > +     .get_orientation =3D icna35xx_get_orientation,
> > +};
> > +
> > +static int icna35xx_bl_update_status(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness =3D backlight_get_brightness(bl);
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> Add back MIPI_DSI_MODE_LPM even in dsi command error.

Ack

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int icna35xx_bl_get_brightness(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness;
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_get_display_brightness_large(dsi, &brightnes=
s);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> Add back MIPI_DSI_MODE_LPM even in dsi command error.

Ack

>
> > +
> > +     return brightness;
> > +}
> > +
> > +static const struct backlight_ops icna35xx_bl_ops =3D {
> > +     .update_status =3D icna35xx_bl_update_status,
> > +     .get_brightness =3D icna35xx_bl_get_brightness,
> > +};
> > +
> > +static struct backlight_device *icna35xx_create_backlight(struct mipi_=
dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     const struct backlight_properties props =3D {
> > +             .type =3D BACKLIGHT_RAW,
> > +             .brightness =3D 4096,
> > +             .max_brightness =3D 4096,
> > +     };
> > +
> > +     return devm_backlight_device_register(dev, dev_name(dev), dev, ds=
i,
> > +                                           &icna35xx_bl_ops, &props);
> > +}
> > +
> > +static int icna35xx_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     struct panel_info *pinfo;
> > +     int ret;
> > +
> > +     pinfo =3D devm_drm_panel_alloc(dev, __typeof(*pinfo), panel,
> > +                                  &icna35xx_panel_funcs,
> > +                                  DRM_MODE_CONNECTOR_DSI);
> > +     if (IS_ERR(pinfo))
> > +             return PTR_ERR(pinfo);
> > +
> > +     ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(panel_suppl=
ies),
> > +     panel_supplies, &pinfo->supplies);
>
> Align correctly this second line.

Oops, ack.

>
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to get regulators\=
n");
> > +
> > +     pinfo->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW)=
;
> > +     if (IS_ERR(pinfo->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "fa=
iled to get reset gpio\n");
> > +
> > +     pinfo->desc =3D (struct panel_desc *)of_device_get_match_data(dev=
);
> > +     if (!pinfo->desc)
> > +             return -ENODEV;
> > +
> > +     pinfo->dsi =3D dsi;
> > +     mipi_dsi_set_drvdata(dsi, pinfo);
> > +
> > +     ret =3D of_drm_get_panel_orientation(dev->of_node, &pinfo->orient=
ation);
> > +     if (ret < 0) {
> > +             dev_err(dev, "%pOF: failed to get orientation %d\n", dev-=
>of_node, ret);
> > +             return ret;
> > +     }
> > +
> > +     pinfo->panel.prepare_prev_first =3D true;
> > +
> > +     pinfo->panel.backlight =3D icna35xx_create_backlight(dsi);
> > +     if (IS_ERR(pinfo->panel.backlight))
> > +             return dev_err_probe(dev, PTR_ERR(pinfo->panel.backlight)=
,
> > +                                  "Failed to create backlight\n");
> > +
> > +     drm_panel_add(&pinfo->panel);
>
> devm_drm_panel_add()

Oh, that's new. Ack.

> > +
> > +     pinfo->dsi->lanes =3D pinfo->desc->lanes;
> > +     pinfo->dsi->format =3D pinfo->desc->format;
> > +     pinfo->dsi->mode_flags =3D pinfo->desc->mode_flags;
> > +     pinfo->dsi->dsc =3D &pinfo->desc->dsc;
> > +
> > +     ret =3D mipi_dsi_attach(pinfo->dsi);
>
> devm_mipi_dsi_attach()

Ack

> > +     if (ret < 0) {
> > +             dev_err_probe(dev, ret, "Failed to attach to DSI host\n")=
;
> > +             drm_panel_remove(&pinfo->panel);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id icna35xx_of_match[] =3D {
> > +     { .compatible =3D "ayaneo,pocketds-panel-top", .data =3D &odin2po=
rtal_desc },
> > +     { .compatible =3D "ayntec,odin2portal-panel", .data =3D &odin2por=
tal_desc },
> > +     { .compatible =3D "ayntec,odin3-panel", .data =3D &thor_top_desc =
},
> > +     { .compatible =3D "ayntec,thor-panel-top", .data =3D &thor_top_de=
sc },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, icna35xx_of_match);
> > +
> > +static struct mipi_dsi_driver icna35xx_driver =3D {
> > +     .probe =3D icna35xx_probe,
> > +     .remove =3D icna35xx_remove,
>
> Drop

Ack

>
> > +     .driver =3D {
> > +             .name =3D "panel-chipone-icna35xx",
> > +             .of_match_table =3D icna35xx_of_match,
> > +     },
> > +};
> > +module_mipi_dsi_driver(icna35xx_driver);
> > +
> > +MODULE_AUTHOR("Teguh Sobirin <teguh@sobir.in>");
> > +MODULE_DESCRIPTION("DRM driver for Chipone ICNA35XX based MIPI DSI pan=
els");
> > +MODULE_LICENSE("GPL");
> >
>
> Thanks,
> Neil

Aaron
