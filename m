Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0E39D6FA
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832356; cv=none; b=UtabumGrBO5N5wvE+l5jwfzQgi4JAKDDbWqjCMNE88bl/oRnzFtxxzI/C1sEVyssTGs51wXz4ZOXas2vrQn7wEFiLuRgEKG1podykTTvPU+fBjhz4ezyjPSNG8vyQifxx+1k8ZT97/CKjmBotAoEs0g+jai+uLFQAvrem5u0VMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832356; c=relaxed/simple;
	bh=JnpkHgeRaLIklyrr/tYaJR4akkRsVCzKpHaRqDOKORg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyFsaE9RxdxTLEAe1sr7cC4xUlPXNr0Ve97Pra1MPBeZU7Ss5+EhDqV+ahd5MeppHDA4R2kojBHXrwAwIanwV03lIWqMycQrC2jRk1fxdZruk/YPj77Wde99ofGMrELQTEWRpvN57Khx0HocckoOpBN1Od/7vwtx6Olkn5L+86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2414247137.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832354; x=1779437154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTMs9H2zcG/hkZo7rCavYzdXjSvd0E+3ghPib3tFoJI=;
        b=E6LlfbGcl0dY02RuvY3PYrqaqz0934/PMDjZD4drVXGPSthcwoTerCrhYYl24oaVfg
         4Uw65DwiX74gnZtbLKpIGbRLIakKA0DplXEYbErXFO8B09i7/QzkmAFfk5lWqrrj9XKq
         53oy/XU7U8cuAWuwbijoCp9EIrvJO/USx9R1yUw5sUu6n3vXYC4gERyH05h1E8gnS7u1
         rW4SllSVYDynIJU4MkNIw0XJAek/+LH8yZiqIh4XKT6TzG3aDIVIDOFAinDnk3RHd2cV
         B8A2VFLdXZiNalGIOQvh3d8mt9PPCFUOmH01BTbifkol7wnl877Z+QiIsj8tBJJpUpGb
         SzQw==
X-Forwarded-Encrypted: i=1; AFNElJ9Knb9/lHZmiARW1oOpg0ZyNvLOlImfyVxWMnr4i9Pc4xuPlNDgBJXlunP9+DXTlrCPQhWg9j5vHQLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4m66fK3vct0dzN/c+zDwhyS/NCv0MDl7tpzsWeXh+fObru3o
	aRGqc6yHQTg5PJzaSZsSRK+6U+lby20WWrxf4YY48oZcKP5gHyykW6zmviovp4zT
X-Gm-Gg: Acq92OFV6+yuDABYUt8zKa7yjyX4uFKmWVx8ohCHmYtWSw5IgqgtZQGlWVDoIOZ/Vbk
	0LjDAYoHZfdGOBQ+Xg17AO21blgYsckefavYhH0YOJLIPRdSC37cR4ZkaLGMNXX/pFNz8pyovkc
	5MiBMROE2vV6Tu0zYC8uRz7bT57EJmR5ij8L1tywCBjCyC/bEdls5FdVSkw1KHi0mmdcVDf6wDk
	HqHiIqN1Gbw6BRv7CzHzoJ/MrcNK/c7vaq79tdytl4JxvLW9cbRQ/zOSvdLZ8c2q5I+nHMKGE0U
	5OBKq0DIj/hBKT/5xljsU3jOWrSKqRVnPBUt/lgx3ezahGNTzBWc//Fb9dCPvT2NaV4FQADaCOf
	Fj5G+B2NCj4xhph8ExKgZzV94fnKYRayVaaPHib3fEU6yaDMPviWfUOwFmYamY/xRlDQlttdk9a
	Gp+7Zh/42OKmxa6dtpVFmhybdVbxWXDZzeDrcCtrQHDUTFoo9U7a7K/DUvCZ+l
X-Received: by 2002:a05:6102:8025:b0:635:1bc8:3563 with SMTP id ada2fe7eead31-63a3f698157mr1161223137.20.1778832354449;
        Fri, 15 May 2026 01:05:54 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2d324a6sm676107241.7.2026.05.15.01.05.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:05:52 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2414233137.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/urrW06MwGfz2GRnZB+mCH32oqxA4N5+WJyNYPSoC7ntf328wiatgN4vGo+eXg25W5dI11D90CGDM@vger.kernel.org
X-Received: by 2002:a05:6102:f94:b0:631:5ef5:8325 with SMTP id
 ada2fe7eead31-63a3d93b73cmr1247586137.8.1778832352115; Fri, 15 May 2026
 01:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
In-Reply-To: <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:05:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
X-Gm-Features: AVHnY4IeYtwx3NtqULFNQ1UNiQVfhuhx7vVBY8D7FKyQ3HU9Ed8VUzHO4jOvKfs
Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> > On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>
> >> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >
> >> +
> >> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >> +                                  struct drm_atomic_state *state)
> >> +{
> >> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >> +
> >> +       WARN_ON(clk_prepare_enable(dsc->clk));
>
> Ah, just missed your comment and sent the v2.
>
> > Who don't you use pm_runtime_resume_and_get() instead, like
> > rcar_cmm.c? Then you don't need to get the clock at all, and the driver
>
> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> on Renesas?

Runtime PM powers on the power domain (if present), and starts
the device by enabling its module clock.

> > will keep on working if the DSC ever ends up in a power domain.
> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> driver that just needs to enable the clock when the video pipeline is
> enabled.

Funny, I would say you are overcomplicating a dummy driver by adding
explicit clock control ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
