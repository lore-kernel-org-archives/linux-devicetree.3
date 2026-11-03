Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696255;
	b=5smoRsl+MDEzMuAb3DJXYnlGLFs8fVJ6t1ugFhBJ8iHt9VymSj8tTASh6x1tQG+Jq845
	 puUAvo8S77d2IBcRb1c6pSpqS7hkU7bvZWnojr72TGiKy4507kKSJKexncaAT/U5Qa1gy
	 EokSNsIlZZt+wS/YEY2oQAUdvtuBd2augJPr+LR9v4dnimuNjjLVrnbnadV1FClcb7FfH
	 P5QIWfX+rStQLSlXq5UPQru9w220XNHv+42npTAxKhoNYAJwxYr1RKTUG5Qp9drEXHY9S
	 lrWuceWZEaAGdobPZDPFKJqdjUXzkqr+bPDn5RXoe1feK+pofcMDzsbavbWoDzcTbMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ccFs+Qdhg65sUY9mmUI3I9G0eVk2Px5pnH9ytZa1mW8=;
	b=FLlJcYej3SReHfT9Vo+IQhHI6Fa4Bw9dBh/BmASarTzVD5h53XURyO+DjHhWq8ejoroy
	 9KmR1/jOUPlZ1DjSooWeFuFdCQgzDeEm/4gxNhQKxsWIYV8fRhy4Ji5hpM3dhsgI2kvFO
	 pMf8BGnYPwKHHR2pIScsJyIjW958zhpJCpIqotJhwhFPWiACWLGDVu87O9Q9KhxXzepg1
	 0/NLGvuLPOOdaycu79hJLBgzWV0lFVYcQymf5PdbD868PNjnjvFwYFboVajKB6c5AcgaI
	 w1LjmPeQoytlZ9jrYFR4AmCJDNERuPvr7ByBTWZvZJd2Snbyulzu2syZatqMRwhQezQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrlPDcda;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8661606A333
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8661606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrlPDcda
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535a54bed9so5844518eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696254; cv=none;
        d=google.com; s=arc-20260327;
        b=JspbT2pF2GFMKnjhObbRg6ltRGfoSp8fQddjiQp3kYngz49CfAl7wohdvEnCxLGdv8
         PfvRiKsiT1qT6wV+z8PbBFLw2VJ6CoqspXAJJNCj97sB9T1WONiHh290iRXtSzC5uvG2
         kK2wEdOAFiQKF7pN5k40y3cK0Nsar2s7B2mO1tgbED6oM65fIWUX0ZMQMDlMWr/XcXPo
         Xy6oNe3KO80g6L1Jey79331Y4K+Nbk1lA++LhI4kT4vO05uH7ce2HeciYBuP46uaEOKb
         6ZGt4Wh/xTcL61bH2SeT7WNP4h4w7sYDUyWx8HFDaG1Bcd+xdmhlUcz9dnEbrlQA0FK6
         7Usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ccFs+Qdhg65sUY9mmUI3I9G0eVk2Px5pnH9ytZa1mW8=;
        fh=lVIEAM1A48I7J0ns51gs1puCjF3FUTFbdj2h9Pvt948=;
        b=k/9eINn1nzKjpUUT8sjWZ6NVlRnsGW4RIEc95pskdpctCqNSLqhgYUeN2jn2mF58oG
         hfWhrkx3yPCHIH4qDMYMBkVdxd2tsRz599oHcoZQMmnSlRZwAxa94U0F0wkHiqkfnpUQ
         xBY7iuSQ3Zmt++V96fx8k1dC/Fx1t6ju2rw1aUrXWhsi8ZrEYWyRtlYmXAGSMp8qtmZN
         r6Ab9gyf2v0YuexsDdNCyXl3r27Q44CVYzVJ3nAc+DwMUroAMZ1SRDbpplDEo2tTaup+
         YH2ii4k9SoXJdrXJ5lOHKVa0R/G8mVM1ZgsIF6gaToEmgsxTzx5BuMhdopexCGVY42q6
         XqmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696254; x=1794301054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ccFs+Qdhg65sUY9mmUI3I9G0eVk2Px5pnH9ytZa1mW8=;
        b=MrlPDcda+zwu1Vc9FoGOqz2y8m0X/TknRqQ5nvel4bTDm+A2Oh0T1+hU8uMbV5Xyl2
         ZVqTgAMhhT1WvYbYBvbS6DWYwF9P+1iexV+V/gKEOcB3qP6a3yipczNhBEzgjaXbuXIk
         TzIBH4kFhs4yatnsdU+vme1Yza+CGTENo6Sa5X0RtqcxMEdobavydPpnM1YnD8Ql4hwu
         5076ozAtYpmTIqe9y6kC8RCGfrEOU13+g3vP9VGVXaJjKHZ+zHyx39ZNuM3LQnMdgLX5
         Eos3k0m1DjuwE10/qV1b7cR0s41EHmLu7zBrw/TOSds5SFoqTSguIemsYfKAsjfQjymJ
         Abww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696254; x=1794301054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccFs+Qdhg65sUY9mmUI3I9G0eVk2Px5pnH9ytZa1mW8=;
        b=AdTF+MLKMWZAytWNk3zVuj2d6qWHoRxs+23/xP3QLeSE6I+IQdfXYuLnlikmwiT7p/
         2MIJRepyiAt+fjgSMEJUIKw62RK1jnm/IQzfrqWXgDpG2dMfdRGb4B63ddqxDTSOgjyF
         CG6i8gfYET5pFJVLxw+0/uzLTZkVta0MO9Dns8TNgW729VVLs+rqbDCAZF+p0RqGxYfR
         uZ1doQrd5a7xvnG+VvZfOVdG+TXxc1fn25tH2kJdBl0maX9oO7PIzq47SrUSokLfTRkq
         EEKWoDfWqFqUNKFTgzaonMHYCklLmQfW9M4MsjpYEVq+YrREmMEY/LRHc0eCYNrfn4hI
         JO5A==
X-Forwarded-Encrypted: i=1; AKwUvByZPjKB1sGhN4l4sjHaGTtPchU9ltACkChj1xqmoGkl/M1H7LVha+gIwb5QX019WF7K9xZXHfti0Vcm@vger.kernel.org
X-Gm-Message-State: APuU4Z9bJwJ0R8xV2FKwiAKexYPtZpQBN0xUU0C7sPPi4lPmEE3v/akr
	QDliGTsM4U+QJYJ4YN1RWtT5kHLahw9/pFhL16RnsjK2CzKiGfsD2Ld3HFj5dDufOcOrGoJeVQC
	5Ya3ZvlEew5YWpZp6aV3CYi118mQtDLo=
X-Gm-Gg: AYBFou1yS0u8lMvlmjiNqnCP5uLjUVgztdDTLuXVudl0q9b114nslcLY3tfaAfZj+hK
	bMHmjvAY7qv7IW2g1YJ2iONVrcgSGJL7GcB78Rqerq/3GdbB4G83Bma748sX076E0Rb/q/Efjhr
	l7TiOKSbndoq6UvyDlSuiTiM9rjExQeBx/4euF5B5ZJliX6dg7UONxHyaOrakNOY5GHl41W/sEk
	D+BFsbThgg+QZcuMDNsJJTNCnT3ryCdWLGYb4St5Ur6ffEHCELml2VHc/TyG2z/c+KDqsSxWHia
	d/CGUcuL24Wdfmki8ej0qv9exRtDreM+ydd1vbqx5qDtKO9eW0jUE14cLFI9H5u9RwR6JH48WIx
	Flu2f7tHu3EygugFU0gOZZk/VFvRV8iCSzh7Dpxnx6YpZcj8ZbJWBQDYTqi+vRssClG0I/A==
X-Received: by 2002:a05:7300:e9c5:10b0:367:3d68:8480 with SMTP id
 5a478bee46e88-36a4206d82emr19944922eec.0.1793696253664; Tue, 03 Nov 2026
 00:57:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-12-clamor95@gmail.com>
 <weWUeY3nRGCfNVcl2RuY5g@nvidia.com>
In-Reply-To: <weWUeY3nRGCfNVcl2RuY5g@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 10:57:22 +0200
X-Gm-Features: AclHuK-_Qy44itvsLtAY8W-Hu-87JGh2pMC3kbz9tjfLoOz9yXBI__YB-ZpjId4
Message-ID: <CAPVz0n0nz-k2p5N=OKd=0WRD40z+SUsz6g=yQ6sccp0gQ=C8pA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08:54=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, October 30, 2026 12:29=E2=80=AFAM Svyatoslav Ryhel wrote:
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
> >  drivers/gpu/drm/tegra/Makefile |   1 +
> >  drivers/gpu/drm/tegra/dbi.c    | 632 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/dc.c     |   4 +
> >  drivers/gpu/drm/tegra/dc.h     |   3 +
> >  4 files changed, 640 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/dbi.c
> >
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
> > index 0000000000000..e129be0f21da5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tegra/dbi.c
> > @@ -0,0 +1,632 @@
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
> > +
> > +#define TEGRA_DBI_DATA_PINS_MAX                      8
> > +#define TEGRA_DBI_INTERFACE_MAX                      2
> > +
> > +struct reg_entry {
> > +     u32 offset;
> > +     u32 value;
> > +};
> > +
> > +static const struct reg_entry com_pin_output[] =3D {
> > +     { DC_COM_PIN_OUTPUT_ENABLE(0),   0 },
> > +     { DC_COM_PIN_OUTPUT_ENABLE(1),   0 },
> > +     { DC_COM_PIN_OUTPUT_ENABLE(2),   0 },
> > +     { DC_COM_PIN_OUTPUT_ENABLE(3),   0 },
> > +     { DC_COM_PIN_OUTPUT_POLARITY(0), 0 },
> > +     { DC_COM_PIN_OUTPUT_POLARITY(1), 0 },
> > +     { DC_COM_PIN_OUTPUT_POLARITY(2), 0 },
> > +     { DC_COM_PIN_OUTPUT_POLARITY(3), 0 },
> > +     { DC_COM_PIN_OUTPUT_DATA(0),     0 },
> > +     { DC_COM_PIN_OUTPUT_DATA(1),     0 },
> > +     { DC_COM_PIN_OUTPUT_DATA(2),     0 },
> > +     { DC_COM_PIN_OUTPUT_DATA(3),     0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(0),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(1),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(2),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(3),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(4),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(5),   0 },
> > +     { DC_COM_PIN_OUTPUT_SELECT(6),   0 },
> > +};
>
> Instead of this table with unused repeated zero values, I think it would
> be cleaner to have just the register offsets:
>
>   static const u32 tegra_dbi_pin_regs[] =3D {
>         DC_COM_PIN_OUTPUT_ENABLE(0),
>         // ...
>   };
>

It has 2 components since I use memcpy in the probe, but I can switch
to using a loop to copy.

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
> > +     const struct tegra_dbi_interface *index;
>
> 'index' implies an integer, can you rename this to 'interface'.
>

Noted

> > +     struct reg_entry com_pin_backup[ARRAY_SIZE(com_pin_output)];
> > +
> > +     u32 bus_width;
> > +     u32 reg;
> > +     bool active;
> > +};
> > +
> > +struct pin {
> > +     u32 reg;
> > +     u32 pos;
> > +};
>
> Can you rename this to struct tegra_dbi_pin?
>

Sure

> > +
> > +struct tegra_dbi_interface {
> > +     struct pin dc;
> > +     struct pin rw;
> > +     struct pin cs;
> > +     struct pin data[TEGRA_DBI_DATA_PINS_MAX];
> > +};
> > +
> > +static const struct tegra_dbi_interface tegra_dbi_idx[TEGRA_DBI_INTERF=
ACE_MAX] =3D {
> > +     /* Nvidia Primary 8-bit CPU interface configuration */
> > +     {
> > +             .dc =3D { DC_COM_PIN_OUTPUT_DATA(3), PIN_LDC  },
> > +             .rw =3D { DC_COM_PIN_OUTPUT_DATA(1), PIN_LSC0 },
> > +             .cs =3D { DC_COM_PIN_OUTPUT_DATA(3), PIN_LCSN },
> > +             .data =3D {
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD0 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD1 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD2 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD3 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD4 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD5 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD6 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(0), PIN_LD7 },
> > +             },
> > +     },
> > +     /* Nvidia Secondary 8-bit CPU interface configuration */
> > +     {
> > +             .dc =3D { DC_COM_PIN_OUTPUT_DATA(2), PIN_LVP0 },
> > +             .rw =3D { DC_COM_PIN_OUTPUT_DATA(1), PIN_LSC1 },
> > +             .cs =3D { DC_COM_PIN_OUTPUT_DATA(2), PIN_LM0  },
> > +             .data =3D {
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LHP1 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LM1  },
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LDI  },
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LPP  },
> > +                     { DC_COM_PIN_OUTPUT_DATA(1), PIN_LPW0 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(1), PIN_LPW2 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LVP1 },
> > +                     { DC_COM_PIN_OUTPUT_DATA(2), PIN_LHP0 },
> > +             },
> > +     },
> > +};
>
> If we include the information needed by init_primary/init_secondary in
> the tegra_dbi_interface tables as well, we can get rid of the 'reg'
> field.
>

Noted

> > +
> > +static inline struct tegra_dbi_priv *mipi_dbi_to_tegra_dbi(struct mipi=
_dbi *dbi)
> > +{
> > +     return container_of(dbi, struct tegra_dbi_priv, dbi);
> > +}
> > +
> > +static inline struct tegra_dbi_priv *dbi_host_to_tegra_dbi(struct mipi=
_dbi_host *host)
> > +{
> > +     return container_of(host, struct tegra_dbi_priv, dbi_host);
> > +}
> > +
> > +static inline struct tegra_dbi_priv *bridge_to_tegra_dbi(struct drm_br=
idge *bridge)
> > +{
> > +     return container_of(bridge, struct tegra_dbi_priv, bridge);
> > +}
> > +
> > +static void tegra_dbi_pin_set(struct tegra_dc *dc, const struct pin *p=
in, bool value)
> > +{
> > +     u32 val =3D BIT(pin->pos + 1); /* unmask is 1 bit above position =
*/
> > +
> > +     if (value)
> > +             val |=3D BIT(pin->pos);
> > +
> > +     tegra_dc_writel(dc, val, pin->reg);
> > +}
> > +
> > +static void tegra_dbi_write(struct tegra_dbi_priv *priv,
> > +                         enum tegra_dbi_dc_signal signal, u8 value)
> > +{
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     const struct tegra_dbi_interface *idx =3D priv->index;
> > +
> > +     tegra_dbi_pin_set(dc, &idx->dc, signal);
> > +
> > +     tegra_dbi_pin_set(dc, &idx->cs, 0);
> > +     tegra_dbi_pin_set(dc, &idx->rw, 0);
> > +
> > +     for (int i =3D 0; i < TEGRA_DBI_DATA_PINS_MAX; i++)
> > +             tegra_dbi_pin_set(dc, &idx->data[i], field_get(BIT(i), va=
lue));
> > +
> > +     tegra_dbi_pin_set(dc, &idx->cs, 1);
> > +     tegra_dbi_pin_set(dc, &idx->rw, 1);
> > +
> > +     udelay(10);
> > +}
> > +
> > +static int tegra_dbi_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *pa=
ram, size_t num)
> > +{
> > +     struct tegra_dbi_priv *priv =3D mipi_dbi_to_tegra_dbi(dbi);
> > +     u8 command =3D *cmd;
> > +
> > +     /* Blocks all commands when interface is not active */
> > +     if (!priv->active)
> > +             return -ENODEV;
> > +
> > +     tegra_dbi_write(priv, TEGRA_DBI_COMMAND, command);
> > +
> > +     for (int i =3D 0; i < num; i++)
> > +             tegra_dbi_write(priv, TEGRA_DBI_DATA, param[i]);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tegra_dbi_host_attach(struct mipi_dbi_host *host, struct mi=
pi_dbi_device *dbidev)
> > +{
> > +     struct tegra_dbi_priv *priv =3D dbi_host_to_tegra_dbi(host);
> > +     struct device *dev =3D priv->dev;
> > +     struct drm_bridge *bridge;
> > +     struct device_node *ep;
> > +     int ret;
> > +
> > +     bridge =3D of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, -1)=
;
> > +     if (IS_ERR(bridge))
> > +             return PTR_ERR(bridge);
> > +
> > +     bridge->type =3D DRM_MODE_CONNECTOR_DPI;
> > +     priv->next_bridge =3D bridge;
> > +
> > +     /* get input ep (port0/endpoint0) */
> > +     ret =3D -EINVAL;
> > +     ep =3D of_graph_get_endpoint_by_regs(dev_of_node(dev), 0, 0);
> > +     if (ep) {
> > +             ret =3D of_property_read_u32(ep, "bus-width", &priv->bus_=
width);
> > +             of_node_put(ep);
> > +     }
> > +
> > +     if (ret)
> > +             priv->bus_width =3D 24;
>
> I think this would look a bit cleaner like ..
>
>   priv->bus_width =3D 24;
>
>   ep =3D of_graph_get_endpoint_by_regs(dev_of_node(dev), 0, 0);
>   if (ep) {
>     of_property_read_u32(ep, "bus-width", &priv->bus_width);
>     of_node_put(ep);
>   }
>

Yes, I have already adjusted in this way locally for v6. Thanks.

> > +
> > +     return devm_drm_bridge_add(dev, &priv->bridge);
> > +}
> > +
> > +static void tegra_dbi_host_detach(struct mipi_dbi_host *host, struct m=
ipi_dbi_device *dbidev)
> > +{
> > +     struct tegra_dbi_priv *priv =3D dbi_host_to_tegra_dbi(host);
> > +
> > +     drm_bridge_remove(&priv->bridge);
>
> The above calls devm_drm_bridge_add, so I believe drm_bridge_remove will
> happen automatically.
>

Yes, I have switched to devm_drm_bridge_add but forgot to remove the other =
part.

> > +     drm_bridge_put(priv->next_bridge);
> > +}
> > +
> > +static const struct mipi_dbi_host_ops tegra_dbi_host_ops =3D {
> > +     .attach =3D tegra_dbi_host_attach,
> > +     .detach =3D tegra_dbi_host_detach,
> > +};
> > +
> > +static void tegra_dbi_init_primary_interface(struct tegra_dbi_priv *pr=
iv)
> > +{
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     u32 value;
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_ENABLE(3));
> > +     value &=3D ~(BIT(PIN_LCSN) | BIT(PIN_LDC));
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_ENABLE(3));
> > +
> > +     /* Set LSC0/LCSN/LDC output polarity HIGH */
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_POLARITY(1));
> > +     value &=3D ~BIT(PIN_LSC0);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +     value &=3D ~(BIT(PIN_LCSN) | BIT(PIN_LDC));
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     value =3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD0) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD1) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD2) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD3) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD4) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD5) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD6) |
> > +             PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD7);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(0));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(3));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LSC0);
> > +     value |=3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LSC0);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(3));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LCSN);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDC);
> > +     value |=3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LCSN) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LDC);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
> > +}
> > +
> > +static void tegra_dbi_init_secondary_interface(struct tegra_dbi_priv *=
priv)
> > +{
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     u32 value;
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_ENABLE(2));
> > +     value &=3D ~(BIT(PIN_LDI) | BIT(PIN_LPP));
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_ENABLE(2));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(3));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPW0);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPW2);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LSC1);
> > +     value |=3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPW0) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPW2) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LSC1);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(3));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(4));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LHP0);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LHP1);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LVP0);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LVP1);
> > +     value |=3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LHP0) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LHP1) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LVP0) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LVP1);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(4));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(5));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LM0);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LM1);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDI);
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPP);
> > +     value |=3D PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LM0) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LM1) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LDI) |
> > +              PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPP);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(5));
> > +}
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
> > +      /* Init cycle 1: WRITE_MEMORY_START, set LCD_PCLK and COMMAND */
>
> Extra space here before '/*'
>

Noted

> > +     tegra_dc_writel(dc, MIPI_DCS_WRITE_MEMORY_START, DC_DISP_SPI_INIT=
_SEQ_DATA_A);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_B);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_C);
> > +     tegra_dc_writel(dc, BIT(12) | BIT(14), DC_DISP_SPI_INIT_SEQ_DATA_=
D);
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
> > +     default:
>
> Why the default case? My assumption would be that if the bus width is
> not something that's expected, that's an error.
>

Makes sense.

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
> > +     for (int i =3D 0; i < ARRAY_SIZE(com_pin_output); i++)
> > +             priv->com_pin_backup[i].value =3D tegra_dc_readl(dc,
> > +                     priv->com_pin_backup[i].offset);
> > +
> > +     /* Unshadow to set up command and data pins */
> > +     tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
> > +
> > +     if (priv->reg)
> > +             tegra_dbi_init_secondary_interface(priv);
> > +     else
> > +             tegra_dbi_init_primary_interface(priv);
> > +
> > +     priv->active =3D true;
> > +
> > +     /*
> > +      * DBI requires that the next bridge be enabled here in order to
> > +      * send DCS commands, since the interface pins will subsequently =
be
> > +      * reconfigured for video data.
> > +      */
> > +     if (next_bridge->funcs && next_bridge->funcs->atomic_enable)
> > +             next_bridge->funcs->atomic_enable(next_bridge, state);
>
> Instead of hijacking the flow, could we move the panel init commands
> into the prepare callback, and deinit into the unprepare callback?
> Command mode would then stay active until this function (host-side
> atomic_enable) is called, and again become active at the end of
> atomic_disable. AFAICT that should allow for a normal lifecycle.
>

Current framework does this panel prepare() > bridge pre_enable() >
bridge enable() > panel enable(). Bridge must set up DBI before panel
is prep or enabled and then reconfigure to RGB afterward. Only
possible quirk to do so is to use  prepare_prev_first flag in the
panel but this is not a panel issue this is a bridge quirk and it
should not be addressed in the panel making it potentially
incompatible with other DBI bridges.

> > +
> > +     tegra_dbi_pin_set(dc, &priv->index->cs, 0);
> > +
> > +     priv->active =3D false;
> > +
> > +     tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
> > +
> > +     for (int i =3D 0; i <  ARRAY_SIZE(com_pin_output); i++)
> > +             tegra_dc_writel(dc, priv->com_pin_backup[i].value,
> > +                             priv->com_pin_backup[i].offset);
> > +
> > +     tegra_dc_commit(dc);
> > +
> > +     /* Set LDC pin to V Pulse 1 */
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
> > +     value |=3D PIN_OUTPUT_SELECT_F4(PIN_OUTPUT_SELECT_LDC);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
> > +
> > +     value =3D tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
> > +     value &=3D ~DISP_CTRL_MODE_MASK;
> > +     value |=3D DISP_CTRL_MODE_C_DISPLAY;
> > +     tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
> > +}
> > +
> > +static void tegra_dbi_atomic_disable(struct drm_bridge *bridge,
> > +                                  struct drm_atomic_commit *state)
> > +{
> > +     struct tegra_dbi_priv *priv =3D bridge_to_tegra_dbi(bridge);
> > +     struct drm_bridge *next_bridge =3D priv->next_bridge;
> > +     struct tegra_dc *dc =3D priv->dc;
> > +
> > +     for (int i =3D 0; i < ARRAY_SIZE(com_pin_output); i++)
> > +             priv->com_pin_backup[i].value =3D tegra_dc_readl(dc,
> > +                     priv->com_pin_backup[i].offset);
> > +
> > +     tegra_dc_writel(dc, WRITE_MUX, DC_CMD_STATE_ACCESS);
> > +
> > +     if (priv->reg)
> > +             tegra_dbi_init_secondary_interface(priv);
> > +     else
> > +             tegra_dbi_init_primary_interface(priv);
> > +
> > +     priv->active =3D true;
> > +
> > +     /*
> > +      * DBI requires that the next bridge be disabled here in order to
> > +      * send DCS commands, since the interface pins will subsequently =
be
> > +      * reconfigured for video data.
> > +      */
> > +     if (next_bridge->funcs && next_bridge->funcs->atomic_disable)
> > +             next_bridge->funcs->atomic_disable(next_bridge, state);
> > +
> > +     priv->active =3D false;
> > +
> > +     tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
> > +
> > +     for (int i =3D 0; i <  ARRAY_SIZE(com_pin_output); i++)
> > +             tegra_dc_writel(dc, priv->com_pin_backup[i].value,
> > +                             priv->com_pin_backup[i].offset);
> > +
> > +     tegra_dc_commit(dc);
> > +}
> > +
> > +static int tegra_dbi_atomic_check(struct drm_bridge *bridge,
> > +                               struct drm_bridge_state *bridge_state,
> > +                               struct drm_crtc_state *crtc_state,
> > +                               struct drm_connector_state *conn_state)
> > +{
> > +     struct drm_display_mode *adjusted_mode =3D &crtc_state->adjusted_=
mode;
> > +
> > +     /* Set safe default bus flags if panel does not specify them */
> > +     if (!bridge_state->input_bus_cfg.flags)
> > +             bridge_state->input_bus_cfg.flags =3D bridge->timings->in=
put_bus_flags;
> > +
> > +     /* Default to positive sync */
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PHSYNC;
> > +
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PVSYNC;
> > +
> > +     return 0;
> > +}
> > +
> > +static int tegra_dbi_attach(struct drm_bridge *bridge,
> > +                         struct drm_encoder *encoder,
> > +                         enum drm_bridge_attach_flags flags)
> > +{
> > +     struct tegra_dbi_priv *priv =3D bridge_to_tegra_dbi(bridge);
> > +     struct device *dev =3D priv->dev;
> > +
> > +     priv->dc =3D dev_get_drvdata(dev->parent);
> > +     if (!priv->dc)
> > +             return -ENODEV;
> > +
> > +     return drm_bridge_attach(bridge->encoder, priv->next_bridge, brid=
ge,
> > +                              flags);
> > +}
> > +
> > +static enum drm_mode_status tegra_dbi_mode_valid(struct drm_bridge *br=
idge,
> > +                                              const struct drm_display=
_info *info,
> > +                                              const struct drm_display=
_mode *mode)
> > +{
> > +     if (mode->hdisplay > 800)
> > +             return MODE_H_ILLEGAL;
> > +
> > +     if (mode->vdisplay > 800)
> > +             return MODE_V_ILLEGAL;
>
> Is there a source for the 800x800 limit?
>

This is more a sane assumption.

Tegra TRM and MIPI DBI Standard do not provide limitations, but a
480x800 panel would require approx 768 KB of on-die SRAM and
integrating it into display module would be too costly. If this is not
desirable, I can remove mode check.

> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs tegra_dbi_funcs =3D {
> > +     .attach =3D tegra_dbi_attach,
> > +     .mode_valid =3D tegra_dbi_mode_valid,
> > +
> > +     .atomic_enable =3D tegra_dbi_atomic_enable,
> > +     .atomic_disable =3D tegra_dbi_atomic_disable,
> > +     .atomic_check =3D tegra_dbi_atomic_check,
> > +
> > +     .atomic_create_state =3D drm_atomic_helper_bridge_create_state,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +};
> > +
> > +static const struct drm_bridge_timings default_tegra_dbi_timings =3D {
> > +     .input_bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> > +                        DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
> > +                        DRM_BUS_FLAG_DE_HIGH,
> > +};
> > +
> > +static int tegra_dbi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct mipi_dbi_device *dbidev;
> > +     struct tegra_dbi_priv *priv;
> > +     struct device_node *np;
> > +     int ret;
> > +
> > +     priv =3D devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge=
,
> > +                                  &tegra_dbi_funcs);
> > +     if (IS_ERR(priv))
> > +             return PTR_ERR(priv);
> > +
> > +     priv->dev =3D dev;
> > +
> > +     /* Default to primaty */
>
> The comment seems unnecessary now, as the code below will error out
> (correctly) if the property is not present.
>

Noted

> > +     ret =3D device_property_read_u32(dev, "reg", &priv->reg);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get reg\n");
> > +
> > +     if (priv->reg !=3D 0 && priv->reg !=3D 1)
> > +             return dev_err_probe(dev, -EINVAL, "Wrong reg value: %d\n=
", priv->reg);
> > +
> > +     priv->index =3D &tegra_dbi_idx[priv->reg];
> > +     memcpy(priv->com_pin_backup, com_pin_output, sizeof(com_pin_outpu=
t));
> > +
> > +     /* Initialize MIPI DBI interface */
> > +     mutex_init(&priv->dbi.cmdlock);
> > +     priv->dbi.command =3D tegra_dbi_dbi_command;
> > +
> > +     priv->dbi_host.dev =3D dev;
> > +     priv->dbi_host.dbi =3D &priv->dbi;
> > +     priv->dbi_host.ops =3D &tegra_dbi_host_ops;
> > +
> > +     priv->bridge.of_node =3D dev_of_node(dev);
> > +     priv->bridge.timings =3D &default_tegra_dbi_timings;
> > +
> > +     np =3D of_graph_get_remote_node(dev_of_node(dev), 1, -1);
> > +     if (!np)
> > +             return -EINVAL;
> > +
> > +     dbidev =3D devm_mipi_dbi_device_register(dev, &priv->dbi_host, np=
);
> > +     of_node_put(np);
> > +     if (IS_ERR(dbidev))
> > +             return dev_err_probe(dev, PTR_ERR(dbidev),
> > +                                  "Failed to register DBI device\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver tegra_dbi_driver =3D {
> > +     .driver.name =3D "tegra-dbi",
> > +     .probe =3D tegra_dbi_probe,
> > +};
>
> I don't see the need for the separate driver and probe. You should be
> able to just use the tegra-dc platform device. If there's some issue,
> please point it out.
>

Ok, I will do my best to remove this.

> > +
> > +static void tegra_dbi_release(void *pdev)
> > +{
> > +     platform_device_unregister(pdev);
> > +     platform_driver_unregister(&tegra_dbi_driver);
> > +}
> > +
> > +int devm_tegra_dc_dbi_init(struct device *dev)
>
> No need to have the devm_ prefix, for driver internal initialization
> functions it's expected that they can set up devm actions on the device.
>

Ok, noted.

> > +{
> > +     struct device_node *dbi_np __free(device_node) =3D
> > +             of_get_available_child_by_name(dev_of_node(dev), "dbi");
> > +     struct platform_device_info dbi_info =3D { 0 };
> > +     struct platform_device *dbi;
> > +     int ret;
> > +
> > +     /* Missing node means that DBI is not used, continue */
> > +     if (!dbi_np)
> > +             return 0;
> > +
> > +     ret =3D platform_driver_register(&tegra_dbi_driver);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to register DBI driver\n");
> > +
> > +     dbi_info.parent =3D dev;
> > +     dbi_info.name =3D "tegra-dbi";
> > +     dbi_info.id =3D PLATFORM_DEVID_AUTO;
> > +     dbi_info.fwnode =3D of_fwnode_handle(dbi_np);
> > +     dbi_info.of_node_reused =3D true;
> > +
> > +     dbi =3D platform_device_register_full(&dbi_info);
> > +     if (IS_ERR(dbi)) {
> > +             platform_driver_unregister(&tegra_dbi_driver);
> > +             return dev_err_probe(dev, PTR_ERR(dbi),
> > +                                  "Failed to create DBI device\n");
> > +     }
> > +
> > +     ret =3D devm_add_action_or_reset(dev, tegra_dbi_release, dbi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 5bbf2c028edd8..768cf82776632 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -3382,6 +3382,10 @@ static int tegra_dc_probe(struct platform_device=
 *pdev)
> >               }
> >       }
> >
> > +     err =3D devm_tegra_dc_dbi_init(&pdev->dev);
> > +     if (err)
> > +             return dev_err_probe(&pdev->dev, err, "failed to init DBI=
\n");
> > +
> >       err =3D tegra_dc_rgb_probe(dc);
> >       if (err < 0 && err !=3D -ENODEV)
> >               return dev_err_probe(&pdev->dev, err,
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 2b87bb675d4cf..3df49422a2bd1 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -177,6 +177,9 @@ void tegra_dc_rgb_remove(struct tegra_dc *dc);
> >  int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc);
> >  int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >
> > +/* from dbi.c */
> > +int devm_tegra_dc_dbi_init(struct device *dev);
> > +
> >  #define DC_CMD_GENERAL_INCR_SYNCPT           0x000
> >
> >  #define DC_CMD_GENERAL_INCR_SYNCPT_CNTRL     0x001
> > --
> > 2.53.0
> >
> >
>
>
>
>
