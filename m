Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793976807;
	b=XQeHlbO5pMwC1GCw+FO6sxJF6tarF3NQaTxQss9hlBkrNlf5UqhKLDDLblpcMi8Wiu7w
	 4wvECwtWZLMBb9UW2LrW6ToRuD35PIspdbPKxgze7R/CLsopVrBm4XHLHvs97muTGSGUe
	 GtqAPy4qkz39H97tv72fsSFnRcaXuSmvvF0mN6c+cBHuts9hhekqtzOJxtQcyNmIVQhi/
	 EuZj1LFOvXi84TdcA0vZPMoVmVGlTwPAbeJW5QZZZhAo4Ytbe9I1kXKHEhQuVvFvwLNqm
	 f+1FvicGS9OJMKF7JLbMtRA562UPpkvsZ0CLjXbF2bniuvBR94zVq/RTgN7yEIjJznw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
	b=rcvHFkBffyYVxWQBJEDwu9a4aRKzrNbB5bevTGwrF6fqPRJ1lUKGnuXMsDgee1acm5ke
	 DLGViOWbP8vJpezSBzbBRrY3elS0oGl25FCNeGCC9LkhzPuB9UxeZ9IxP6znWecMMNWFT
	 evfco6QJ7dZZ6S6+63nEHAtqdR5EN6F/sHV8tQbeuFEX7Sr5OAGM85bFjoLdCySnQ4Vxx
	 wdba/XZg2rMds4NdYDwbw4dip+yoZyur3FBTzUkDkY18tn/ftCxKvuO+TyA+2R8RQ/qcW
	 sllTT8MSJRrCHUEmoIOYyAeUAblCznw5zcMjnuZyv92uSlW6lyUCR3Krl/YeCVp+3MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+w7wZXC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7A606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE7A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+w7wZXC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so810927eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793976805; cv=none;
        d=google.com; s=arc-20260327;
        b=d36zpsmGcjotIDvT9jF4ekTxLkeSfahHeUyfWAjryBsAI6Y/UH4usa4K7sBQ5c/r4p
         14orhkx78iffuSwJ0Wh96iB4J1vx7qFcHhR+228sOhRWBjqShpNIH8o2x0/+z5Ga5h1Z
         T73TESbdJD5saVOdsXNIEZ9ByN1MCenh9fn/FdoWrX1tFR9Jp3Dlj7dBI7TBXTUW4qfx
         nMgEKfdzCOEoXquwhqxRp2Pd95Pb8q+s0XzwI1OTkNsRMSDbi0prMoTBRRsgDOP/1+lm
         I6mEDJ8gx9h8cMSI8JcLAwpzOKFj9TgpaDKuANVfvr9SPdW7lsJ1G7z8qGVfFJTtZ+gl
         hA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        fh=3z3lebU5WsGp9nM1vkGB3FFm8dLJn6eqcm62L8YreEo=;
        b=Ap0fY48vJOmcNoCaGikU3uZfRNJKeUmnWzExA40/dFSB5RAs3K0VgQXlKMDzj+M8il
         fLytDXqEjEMgDe8ZBL3WxF0WKPLEvMsJ/dkld+6AgBYUb1P0UI8fJwtzuAVplxdt5KXn
         okh0YIPZXesYznIssbTsIV0zCjyUZuZ1/1IfC4p3L+mFhYfB2mDy2ApNqbmicQqFNzg1
         Rb4P+DCNlHvBXWeL9U/Qqa2lfoNzfnuvjsi7tQWRtYQV6hKmlANzxQdY4IRChBvzEqgU
         aOfDZGWq7lMwzHLWSIavlNeFGAj4QUPYjQwKTBFueFAie1wkijvnoSgqUb9i5uHgFKNu
         HWww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976805; x=1794581605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        b=N+w7wZXCsxVvKWIJVTDi6n1bveOkBws28vYgRbMt8yDzWAoKrcsLIVBa4arqN932UH
         zVvhyVZkkJ9ZtCO0LNFdgff6vAPcvp9s31PQpCEn963LMTDM+4smmssn5m+fAk2HWl0q
         DIg4Gfizspa4mPCfT+9DwDnFvBXw72kzepqPLTQAHcYNbdbb7g4E27KyHOyJyJ8uVXaS
         3lH3rq6nWGtfzV0zRSgdBXdGSHDKY9eNGGMjJ2MuPlxCnLTN902qR+zZ+PEep4lZxcfa
         D7tMs9DdGtnKf7g2belO/AiRqAKZwXoRqUbtBmZxnBy8X6w3EqO2AGnca0qi6kwJ55Ga
         36pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976805; x=1794581605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        b=pJFBaBCnnMvdfLT8No+jv+L1VPG7uu8/eu5XTrYGT1Wk8ABYpJ4dMEIFgcm97tOA2Q
         3IHD+OhcS/id3naJmqqmoWeQ3sXSNaPCqyT5pvtqQPKwv87x2vYX3Mswm6cWP4ig1A0S
         bRFuudv30cv4EaByDK+Fq/WQ0g+XO91B9Hvceo5H593aLK3WCgrBlvI9XASR5G9g1o/x
         Cz7c01Sa6ZidgU2O/Pk7KEqXHRpA816X9gElSAxwICRS1Ys7Alkj/piXLeL92/VfHIXe
         JuiDBQaq+dyetz5qusku4XvZ6sxVbUVaWT9wcITQa/sLDNre4yB/vgdYMrL+T/wRIWPa
         xc+A==
X-Forwarded-Encrypted: i=1; AL+hErGJXyBy7mC3pfBRQ+oMGTMrowiSSAHzpmZylfMkmSFXeLIp/egTQnBEKYGK1ZWDajnK3cWYw/17HYEP@vger.kernel.org
X-Gm-Message-State: APuU4Z/fCwyq+xNljge11RquZRjS3AHmu3tmoSUrwwoi/6z44tGVuWDP
	9Jzh2XnHdH8jdSfrmaQDZ7e6m+/OU0uBkzrvNYSXr7AvQdvfksEUKrnZAf6q7MWZwT2irJdKGGG
	J2QuQGX52adzUS0mVVZtv3fjE6ivNj3Q=
X-Gm-Gg: AYBFou04AzNwEWKJIknrT+4Y9heU0x8IFriK+UGIN6+TBih1V4o3b15KyqiajYH12CW
	JCuVTjQcyYTLVAQ02KVKIhM1gxhH9pOrhZIoaeHb8s3vTyT9eWtLCmTUo5Lzw42xJv5xUtHdhCC
	JcVWvrEC2fV652n3fJWsF7Cj0/v3hevj4QbIssRsSpWqSK9C4KnKJyN0tC/8j+yqiHTstGd/uph
	Yri99RkBnn6S3+PmS/IFpyREAQkelJryqEjjxvgzPsSqrit/vG5k/ivNYlekjt50BWHTLY9ai0G
	6L9gkjFXDA5GPt9YonFIglN8Omwx+neNg+xHgeFpAgQ0j8M6hGk6DhC3XId8pWvjiFHcXaHprd4
	ccI/dxR1IywvXE2QgkUn3rbNgNNIoSkrtXlLEmSkK1jvOFvhRPyl9zF3dC9A6Yt2h+vCSMlke5W
	oi3Z82S7EQhr6XVINGYK1fUvkTsmQdZA==
X-Received: by 2002:a05:693c:885b:b0:36e:53bc:467d with SMTP id
 5a478bee46e88-36f6f98f02amr4078732eec.0.1793976804968; Fri, 06 Nov 2026
 06:53:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-11-clamor95@gmail.com>
 <au3fy-xiCqgSTB49@orome>
In-Reply-To: <au3fy-xiCqgSTB49@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:53:12 +0200
X-Gm-Features: AclHuK-yR8MI_xE6GVCmUnrGxNX3AB_Zl6JW9KYWDsB56-ZDI0Rnv_bCRe7tykM
Message-ID: <CAPVz0n2EwNnRFiJGXFFEnVO_TSoCg6D7E01Gitqs3nyeza78Qw@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] drm/tegra: Add support for 8-bit CPU interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:38=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:10PM +0200, Svyatoslav Ryhel wrote:
> > The display controller in Tegra20/30 SoCs features an 8-bit SPI interfa=
ce
> > that closely resembles the MIPI DBI Type B protocol and is referred to =
as
> > '8-bit CPU'. Each display controller provides two such interfaces, whic=
h
> > can be used to send MIPI DCS commands to initialize and control the pan=
el
> > while image data is transmitted via 16/18/24-line RGB.
> >
> > The '8-bit CPU', although being the DC interface, is modeled using a
> > bridge framework for flexibility and convenience. This implementation d=
oes
> > not change the existing codebase besides registering the bus.
> >
> > Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # DC command tran=
sfer
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/Kconfig  |   1 +
> >  drivers/gpu/drm/tegra/Makefile |   1 +
> >  drivers/gpu/drm/tegra/dbi.c    | 576 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/dc.c     |   4 +
> >  drivers/gpu/drm/tegra/dc.h     |   3 +
> >  5 files changed, 585 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/dbi.c
> >
> > diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kcon=
fig
> > index 8a3b16aac5d68..6f57fd3985edc 100644
> > --- a/drivers/gpu/drm/tegra/Kconfig
> > +++ b/drivers/gpu/drm/tegra/Kconfig
> > @@ -12,6 +12,7 @@ config DRM_TEGRA
> >       select DRM_BRIDGE_CONNECTOR
> >       select DRM_DISPLAY_DP_AUX_BUS
> >       select DRM_KMS_HELPER
> > +     select DRM_MIPI_DBI
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL
> >       select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> > diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Mak=
efile
> > index e399b40d64a1d..ae7fccb3d6421 100644
> > --- a/drivers/gpu/drm/tegra/Makefile
> > +++ b/drivers/gpu/drm/tegra/Makefile
> > @@ -18,6 +18,7 @@ tegra-drm-y :=3D \
> >       hdmi.o \
> >       mipi-phy.o \
> >       dsi.o \
> > +     dbi.o \
> >       sor.o \
> >       dpaux.o \
> >       gr2d.o \
> > diff --git a/drivers/gpu/drm/tegra/dbi.c b/drivers/gpu/drm/tegra/dbi.c
> > new file mode 100644
> > index 0000000000000..32d390f64ddbd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tegra/dbi.c
> > @@ -0,0 +1,576 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nvidia Tegra20/30 MIPI-DBI Type B host driver
> > + *
> > + * Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/string.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> > +#include <drm/drm_of.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include "dc.h"
> > +
> > +enum tegra_dbi_dc_signal {
> > +     TEGRA_DBI_COMMAND,
> > +     TEGRA_DBI_DATA
> > +};
>
> These look like register offsets for sending DBI commands, so maybe just
> use defines for them?
>

Check v5 and talk to Mikko!

> > +
> > +enum tegra_dbi_iface {
> > +     TEGRA_DBI_INTERFACE_PRIMARY,
> > +     TEGRA_DBI_INTERFACE_SECONDARY,
> > +     TEGRA_DBI_INTERFACE_MAX
> > +};
>
> The only place where this seems to be used is in the definition of the
> two interfaces. But in those cases PRIMARY and SECONDARY match the index
> into the array and MAX is the size of the array, which can be determined
> dynamically. Drop this.
>
> > +
> > +#define TEGRA_DBI_DATA_PINS_MAX                      8
> > +#define TEGRA_DBI_DEFAULT_BUS_WIDTH          24
> > +
> > +struct reg_entry {
> > +     u32 offset;
> > +     u32 value;
> > +};
> > +
> > +static const u32 tegra_dbi_pin_regs[] =3D {
> > +     DC_COM_PIN_OUTPUT_ENABLE(0),
> > +     DC_COM_PIN_OUTPUT_ENABLE(1),
> > +     DC_COM_PIN_OUTPUT_ENABLE(2),
> > +     DC_COM_PIN_OUTPUT_ENABLE(3),
> > +     DC_COM_PIN_OUTPUT_POLARITY(0),
> > +     DC_COM_PIN_OUTPUT_POLARITY(1),
> > +     DC_COM_PIN_OUTPUT_POLARITY(2),
> > +     DC_COM_PIN_OUTPUT_POLARITY(3),
> > +     DC_COM_PIN_OUTPUT_DATA(0),
> > +     DC_COM_PIN_OUTPUT_DATA(1),
> > +     DC_COM_PIN_OUTPUT_DATA(2),
> > +     DC_COM_PIN_OUTPUT_DATA(3),
> > +     DC_COM_PIN_OUTPUT_SELECT(0),
> > +     DC_COM_PIN_OUTPUT_SELECT(1),
> > +     DC_COM_PIN_OUTPUT_SELECT(2),
> > +     DC_COM_PIN_OUTPUT_SELECT(3),
> > +     DC_COM_PIN_OUTPUT_SELECT(4),
> > +     DC_COM_PIN_OUTPUT_SELECT(5),
> > +     DC_COM_PIN_OUTPUT_SELECT(6),
> > +};
> > +
> > +struct tegra_dbi_priv {
> > +     struct device *dev;
> > +     struct tegra_dc *dc;
> > +
> > +     struct mipi_dbi dbi;
> > +     struct mipi_dbi_host dbi_host;
> > +
> > +     struct drm_bridge bridge;
> > +     struct drm_bridge *next_bridge;
> > +
> > +     const struct tegra_dbi_interface *interface;
> > +     struct reg_entry com_pin_backup[ARRAY_SIZE(tegra_dbi_pin_regs)];
>
> You can just make this a u32 array since you're always iterating over
> that tegra_dbi_pin_regs array anyway and can get the offset from there.
> No need to duplicate that data into another set of variables.
>

Actually, decent.

> [...]
> > +static void tegra_dbi_pin_set(struct tegra_dc *dc, const struct tegra_=
dbi_pin *pin, bool value)
> > +{
> > +     u32 val =3D BIT(pin->pos + 1); /* unmask is 1 bit above position =
*/
> > +
> > +     if (value)
> > +             val |=3D BIT(pin->pos);
> > +
> > +     tegra_dc_writel(dc, val, pin->reg);
> > +}
>
> So the PIN_UNMASK exists for all registers. In that case, the definition
> should probably not be intermixed like it was in that header "refactor
> and expand" patch.
>
> > +
> > +static void tegra_dbi_write(struct tegra_dbi_priv *priv,
> > +                         enum tegra_dbi_dc_signal signal, u8 value)
> > +{
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     const struct tegra_dbi_interface *interface =3D priv->interface;
> > +
> > +     tegra_dbi_pin_set(dc, &interface->dc, signal);
> > +
> > +     tegra_dbi_pin_set(dc, &interface->cs, 0);
> > +     tegra_dbi_pin_set(dc, &interface->rw, 0);
> > +
> > +     for (int i =3D 0; i < TEGRA_DBI_DATA_PINS_MAX; i++)
> > +             tegra_dbi_pin_set(dc, &interface->data[i], field_get(BIT(=
i), value));
> > +
> > +     tegra_dbi_pin_set(dc, &interface->cs, 1);
> > +     tegra_dbi_pin_set(dc, &interface->rw, 1);
> > +
> > +     udelay(10);
>
> Umpf... I guess we're effectively bit-banging here, but a udelay() here
> is potentially a lot of spinning time. If I recall correctly this can
> end up being called a lot, on the order of 100 or so times during panel
> initialization.
>

Aaaaaaaaaand? What you propose?

> > +
> > +static void tegra_dbi_atomic_enable(struct drm_bridge *bridge,
> > +                                 struct drm_atomic_commit *state)
> > +{
> > +     struct tegra_dbi_priv *priv =3D bridge_to_tegra_dbi(bridge);
> > +     struct drm_bridge *next_bridge =3D priv->next_bridge;
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     u32 value;
> > +
> > +     value =3D tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
> > +     value &=3D ~DISP_CTRL_MODE_MASK;
> > +     tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
> > +
> > +     /* Disable all options except cursor if enabled */
> > +     value =3D tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
> > +     value &=3D CURSOR_ENABLE;
> > +     tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
> > +
> > +     tegra_dc_commit(dc);
> > +
> > +     tegra_dc_writel(dc, V_PULSE1_ENABLE, DC_DISP_DISP_SIGNAL_OPTIONS0=
);
> > +     tegra_dc_writel(dc, PULSE_POLARITY_LOW, DC_DISP_V_PULSE1_CONTROL)=
;
> > +
> > +     tegra_dc_writel(dc, PULSE_END(1), DC_DISP_V_PULSE1_POSITION_A);
> > +     tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_B);
> > +     tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_C);
> > +
> > +     value =3D 1 << FRAME_INIT_SEQ_CYCLES_SHIFT |
> > +             DC_SIGNAL_VPULSE1 << INIT_SEQ_DC_SIGNAL_SHIFT |
> > +             INIT_SEQUENCE_MODE_PLCD | SEND_INIT_SEQUENCE;
> > +     tegra_dc_writel(dc, value, DC_DISP_INIT_SEQ_CONTROL);
> > +
> > +     /* Init cycle 1: WRITE_MEMORY_START, set LCD_PCLK and COMMAND */
> > +     tegra_dc_writel(dc, MIPI_DCS_WRITE_MEMORY_START, DC_DISP_SPI_INIT=
_SEQ_DATA_A);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_B);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_C);
> > +     tegra_dc_writel(dc, BIT(12) | BIT(14), DC_DISP_SPI_INIT_SEQ_DATA_=
D);
> > +
> > +     /* Set LDC pin to V Pulse 1 */
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDC);
> > +     value |=3D PIN_OUTPUT_SELECT_F4(PIN_OUTPUT_SELECT_LDC);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
> > +
> > +     value =3D SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +             SC0_V_QUALIFIER(SC_V_QUALIFIER_VACTIVE) |
> > +             SC0_H_QUALIFIER(SC_H_QUALIFIER_HACTIVE);
> > +     tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> > +
> > +     value =3D tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
> > +     value &=3D ~BASE_COLOR_SIZE_MASK;
> > +
> > +     switch (priv->bus_width) {
> > +     case 16:
> > +             value |=3D BASE_COLOR_SIZE_565;
> > +             break;
> > +     case 18:
> > +             value |=3D BASE_COLOR_SIZE_666;
> > +             break;
> > +     case 24:
> > +             value |=3D BASE_COLOR_SIZE_888;
> > +             break;
> > +     default:
> > +             WARN(1, "%u bus width not supported\n", priv->bus_width);
> > +             value |=3D BASE_COLOR_SIZE_888;
> > +             break;
> > +     }
> > +
> > +     tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
> > +
> > +     /*
> > +      * Backup registers before unshadowing since actual register valu=
es
> > +      * may differ and their state backed up now is the correct one.
> > +      */
> > +     for (int i =3D 0; i < ARRAY_SIZE(tegra_dbi_pin_regs); i++)
> > +             priv->com_pin_backup[i].value =3D tegra_dc_readl(dc,
> > +                     priv->com_pin_backup[i].offset);
> > +
> > +     /* Unshadow to set up command and data pins */
> > +     tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
> > +
> > +     if (priv->interface->interface)
> > +             tegra_dbi_init_secondary_interface(priv);
> > +     else
> > +             tegra_dbi_init_primary_interface(priv);
>
> Maybe hook this into priv->interface directly using a .init() callback.
> That way you don't need to branch based on interface index here.
>

Interesting idea.

> [...]
> > +int tegra_dc_dbi_probe(struct tegra_dc *dc)
> > +{
> > +     struct device *dev =3D dc->dev;
> > +     struct device_node *dbi_np __free(device_node) =3D
> > +             of_get_available_child_by_name(dev_of_node(dev), "dbi");
> > +     struct mipi_dbi_device *dbidev;
> > +     struct tegra_dbi_priv *priv;
> > +     struct device_node *np;
> > +     u32 reg;
> > +     int ret;
> > +
> > +     /* Missing node means that DBI is not used, continue DC probe */
> > +     if (!dbi_np)
> > +             return 0;
>
> Maybe this should have an extra check to see if dbi_np is available.
> That would help create this node in a DTSI file and just keep it
> disabled by default.
>

This is redundant. DBI is quite rare and does not need to be
specifically defined in dtsi

> > +
> > +     priv =3D devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge=
,
> > +                                  &tegra_dbi_funcs);
> > +     if (IS_ERR(priv))
> > +             return PTR_ERR(priv);
> > +
> > +     priv->dc =3D dc;
> > +     priv->dev =3D dev;
> > +
> > +     ret =3D of_property_read_u32(dbi_np, "reg", &reg);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get reg\n");
> > +
> > +     if (reg !=3D 0 && reg !=3D 1)
> > +             return dev_err_probe(dev, -EINVAL, "Wrong reg value: %d\n=
", reg);
>
> Maybe sort these before the call to devm_drm_bridge_alloc()?
>

Fair point.

> Thierry
