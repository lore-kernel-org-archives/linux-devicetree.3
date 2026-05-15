Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE5540629F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834883; cv=none; b=ENZrgkof0fR3tkdXTj4t8IIfxaMt5pEuL3mz7yjixtVSdEIzvpP2DjDD8Fa35jy8F+Q5M633TvdRbeIIWPxbhOJdT6xRQPBww+b5XKlxzHsYaVMNyUE2E8UH9Faz76adkqkhwePMNzuQTHPq2p/Ut8VdG3LpqH1R0iVPrOBGnho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834883; c=relaxed/simple;
	bh=5yHoGKC4E/Rf7XOzxXWV+p/WVrFvuJccWmdeQGZVtoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdTvd2dmblhhsO8vUDc0VS8Orxxc9+B5311CgvWrpbAxHMPEzDF4MaG/JdETkGI8sJL4QuuLVJDuYvAdPHJkkVlvqSZW1zNFZD6KdpN15HlphRLc67bn0vdZkeyKewf/i8TxNwDuHC1cjlEIu6fX3h6o6hXn/f4imPca8HsUKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-631b313e3d0so2241629137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834878; x=1779439678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVgJPqzdVEsAMlVw8p1sldLEqlhvUsFX5k1afv6GStQ=;
        b=cja5QndmHrmAniUQpfWjwi6WYlbxYv0hcETTtJK0oOdqQ7KpzpJjY/FsTjyMfa4YOF
         VUL6j+3DKY112yfHdSRoWqPHGFE9u2Y+AFR9ceK0KFyXQ0ryY2qHg/ws2bJ4sTIQ22Ni
         WkszHQ9IcvN0O5SI10EviI+PRNxcXY6ZP382QtgqedfCvCvU60+CdNKhLYPEZOQHCJVs
         fUIBQKPMlosRRLpC4PtfooveE6Eyakq7lBrW4/Ybtko4tCbHLG6o8umq/NIzW77XlZ7i
         xpRxh6FUVsU0INs91hMXhn7WbSidNKufowrS7Ph7tzXHES/ElZy3RlwDmjDJ2pjokBaR
         OZMw==
X-Forwarded-Encrypted: i=1; AFNElJ+OGz7o8SD8yTYIIixkxS2Qkw87ak03ZMG3xSggkn3ASrtbrHb1O6Gxd+opSlJeSwCt/cylvy0lf+u1@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEi8WOhZFDD6G7Z8HjoRu8x4kVvmvpA0qGkCVGA557Kv/yY6k
	zmnEcUaDNn4tCaFot8eM1fkQyC6TDSDmrOfMn+vRh9dxdgqD+tBZJWC8tKH6VFBw
X-Gm-Gg: Acq92OGe7KHnP+/cI28q1INXvjRqBClez4esCvdhqSpLObnGVzQAwCoRX+rzK0I1xOc
	o5Pp+0lubgh/gf7ql3d9vz2XBNnD/8Ll5ENaq4yvuR1RZZRAE5sPI8BNi3hLn9WwgOIOOBXI7+i
	q6E5djXMV2vAN6dEfrUEIcIhCWTqh+YyGfoV1CjiTttApYeUfyUKvAN+vo1b58P1L0DU7RFPx/g
	Jg3gBTJz390ixpkr4K77vMf/r7HCRkw3mjhaLSIt7FFxTXal/OKE6QfH8coQJfPzy2Q41XZ2GIs
	oaF8iCE38Pc/S4eBl3GiKZdjWf6EybnW0P4MMRrPbLJiHQgkQhguWdyQdMe8GwoWTPzDvsYBggC
	atEr4NPk6XkGMxbw2/HDYR/PF5xKo3MIbjHX5dU8AYG3W649RwFmGypSrADk1sqQQZWSloOEV3I
	D1DdUGzbv+nWS8sOl65JGg8E4gJeJZTfLwMbkzQNgNWSDoF2vnH+VCbgZ3hdUYBlKK
X-Received: by 2002:a05:6102:fa6:b0:631:6953:f036 with SMTP id ada2fe7eead31-63a3c709cfdmr1514611137.1.1778834878435;
        Fri, 15 May 2026 01:47:58 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2f874easm692732241.9.2026.05.15.01.47.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:47:58 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso3239738e0c.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Blyf2L8EW4DCN7v/0GLkljhCxVcOyXg311QsgMybuNqUD3YbNorhyhh3ktLjhQMYJ29dIPmrtitm6@vger.kernel.org
X-Received: by 2002:a05:6102:358e:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-63a3ee86884mr1297663137.20.1778834878086; Fri, 15 May 2026
 01:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com> <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
 <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
In-Reply-To: <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
X-Gm-Features: AVHnY4JCOAjr3bsj3LmrYGms2JUgvp1AhIShwYqx91e-BUfZ61J5zvr2A9mA72E
Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
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

On Fri, 15 May 2026 at 10:17, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 11:05, Geert Uytterhoeven wrote:
> > On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> >>> On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> >>> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>>
> >>>> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >>>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >>>> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >>>> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >>>
> >>>> +
> >>>> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >>>> +                                  struct drm_atomic_state *state)
> >>>> +{
> >>>> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >>>> +
> >>>> +       WARN_ON(clk_prepare_enable(dsc->clk));
> >>
> >> Ah, just missed your comment and sent the v2.
> >>
> >>> Who don't you use pm_runtime_resume_and_get() instead, like
> >>> rcar_cmm.c? Then you don't need to get the clock at all, and the driver
> >>
> >> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> >> on Renesas?
> >
> > Runtime PM powers on the power domain (if present), and starts
> > the device by enabling its module clock.
> >
> >>> will keep on working if the DSC ever ends up in a power domain.
> >> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> >> driver that just needs to enable the clock when the video pipeline is
> >> enabled.
> >
> > Funny, I would say you are overcomplicating a dummy driver by adding
> > explicit clock control ;-)
> Well, now that I know the runtime PM does magics behind the scenes, you
> are right =).
>
> How's "module clock" defined? Is it the first clock in the clocks DT
> property?

It's the clock pointing to the cpg device node, and having "CPG_MOD"
as its first cell.  Usually it's the first clock.  Note that e.g. the
DU is special, as it' is represented by a single device node with
multiple module clocks (and multiple (but less) resets), due to the
tight integration between the individual channels.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
