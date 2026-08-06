Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84C3DDAE4
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006729; cv=none; b=XSt2fAJMA1Ie/Fdq95tgXf+0a2rT0au7BG/lOExFIoLin7FyKJC10k2Wf/Jor6jLw3BJcllXpVhVxteng/yIxGhiJILl3Ar/wupueekboeQhBBtx0AhqCcgws5hUXJAiLi1KyVjMpxF/uyrr7yRom5NIz5sEhmTX2tOjXKdPpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006729; c=relaxed/simple;
	bh=Wp5Awetz8x1lkJd7iV42zxvDh1yQD5wNbmheE5eZ5No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnLMsCR5lihv0JZfKDPxlQROw10udFS9lamxG6LMzsTu/b8sOeBp+kJvtC+SD3FgwRNf00Rlv6drq67gFZcJVhhz+qApec0539yQrwVqDvR0OYMfBQbHLowdhAyksvWTg8FGMoTFDt0myFNtlJ7f1Zx4ayqJAeuWYPbYHKgqshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74ace427b29so516752137.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006726; x=1786611526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/Tg3lEpqdaiPRfyjPgi2cmAvw9BxKYOOcBoKp4sZn8=;
        b=D3KF1TBz8peES3Ic5LYhVmz1XLwZA3sjpFga0StZJl2LphtTFZAuVzwqty2YL1x7mv
         oYh0EGIA7jg33Z9B/vwmeJ6dCif62mdQdkWGSbDiJnH+VH/UHU0B//Mng8CNrROraD0z
         qeMlz/4lpmQwjKuHPZKgXuWqb+DViVscmCDkrMIIm8t1XciYf7niI5DTWM7VbaFmKRxc
         SgNvYsYfxSyxs1HR8ZtOpnsnSoxumDLHyNvncGxFsQluqp0t1yGegZ4BhyRpLkrjF0lm
         cSXtsEZbwMFbAXVeMet5ARkuaGdMUNefJapc4OjeoSilSimJr4dB8RtQQpdYXAhDKq8c
         GQyg==
X-Forwarded-Encrypted: i=1; AHgh+RoQYrEpv3fXLZhVVM3ukUIGWZ89W11cSZ0DjwfkH4plniVe7F8KQZKJqM8T9MPxPfoWdouL92b49fOf@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9rvqPkRuYgeN7vceTDdpceGu4VfLByePICMrodxVDI4J+jvV
	UndmfVPMQ/79tIw03ELDp4H9EkELmYMKqozJx+HOlQelWoLiQkBb8mzsx7Ie4pe2
X-Gm-Gg: AR+sD11Wl6k9Lx9vaK54K4kjwAfCzJzG5S4usRJYKHmAdbFKCcMFq7gjAyAM9YW5H6x
	iM2iAU/LffBGF9PUYcmxI174RtJCtJEJmSrr7Xc00bd0a0FlMQWpouTHAMgumCYUTXoxtY5uYSp
	k68iz0D8uHVEX05BU0GbHl+ke2IS8nS2DXKX8GtxgEDYVMf7USlyLSocQITXMhutASz2HV/f49w
	Srp7Cxg7cotLV7Mkur39c7TrUVgqZnQK3RGADNfxGJ1BxlDswD7tm2BUCjQK7zvvnDc7Dzcj+az
	gRlmtj+lcxtUj7glvUM+vKUg4U0N56W9BFkzsbSRxXgonV+HCvK0sXznx2qxhiw2QjSYuceBFVV
	G5EpTXPDB1rZ9A5nrSIl0FLkpAhmAElDy0d05Nq4oF4AnZCI4bn3EYc2h53Pf301Qya5jhynxJw
	2Mi+H2sWRD0HUX+xZ1McACksOaVzed+dATEOCWq8zJ4zt0OsHProBdieeUGQqyy9HLQLJYCVJz2
	ougqDIKJQ2nP0L50Nt+PizdlA==
X-Received: by 2002:a05:6102:2b83:b0:745:31e9:f3d9 with SMTP id ada2fe7eead31-760e6acb0eamr3229995137.1.1786006725824;
        Thu, 06 Aug 2026 01:58:45 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7604555edc4sm3421386137.6.2026.08.06.01.58.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 01:58:45 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-75e2905c09aso290416137.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpoER2y1O2uS2+SYtepbd2rMZjoB7Fubx42EXdgZfOL8tCiyHAlr6HILAZ2uieB2kJ/0/BoGxEb/YVd@vger.kernel.org
X-Received: by 2002:a05:6102:374e:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-760e3698c49mr3173857137.0.1786006724650; Thu, 06 Aug 2026
 01:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
In-Reply-To: <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 10:58:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
X-Gm-Features: AUfX_mwUZKZac7nMaa-VOsxeMPj2DizVJUU-sXiHc_DXR1wX8yJ0IgF-oPKqM3c
Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Thu, 6 Aug 2026 at 10:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2026-08-05 at 17:20 +0200, Geert Uytterhoeven wrote:
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> > For now this just supports the always-on power domains, and dummy module
> > clocks and resets for the serial console (which is enabled by the boot
> > loader).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >
> > v2:
> >   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
> >     driver",
> >   - Add default support not using SCMI,
> >   - Drop all SCMI remapping support,
> >   - Document use of -1 as a sentinel,
> >   - Rename struct r8a78000_mdlc_info to mdlc_info,
> >   - Print HW IDs in hexadecimal,
> >   - Reduce log level for unsupported MDLC instances from warn to dbg,
> > ---
> >  drivers/pmdomain/renesas/Kconfig         |   4 +
> >  drivers/pmdomain/renesas/Makefile        |   1 +
> >  drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
> >  drivers/soc/renesas/Kconfig              |   1 +
> >  4 files changed, 336 insertions(+)
> >  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
> >
> > diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > new file mode 100644
> > index 0000000000000000..5c8acead7cff9bdd
> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > @@ -0,0 +1,330 @@
> [...]
> > +#define DEFINE_MDLC_RESET_WRAPPER(op)                                            \
> > +     static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
> > +                                     unsigned long id)                   \
> > +     {                                                                   \
> > +             struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);     \
> > +                                                                         \
> > +             dev_dbg(priv->dev, "%s: Ignoring\n", __func__);             \
> > +             return 0;                                                   \
> > +     }
> > +
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
>
> Are .reset and .status needed by any consumers?
> I'd leave them -ENOTSUPP otherwise.

.reset is used by a variety of R-Car drivers.
.status is used by the R-Car I2C and PCIe drivers.

So both will be used later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
