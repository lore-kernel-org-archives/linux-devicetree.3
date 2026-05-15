Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2683EFD27
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831763; cv=none; b=d3wJoBHDVi3A/LkMq9tHKTnHRZOcJLwY9q1/u4/1a+LcfmppkxyD/FZdGq6ik0pwOcRgisD17dOEFFtMDMzD76Rt1c6e9suXD3PspztsLOv3te6VqKeqaVYK4u7TYMBLw1HfnEU3Vp9U79Ckhlvfj8HS7l7EhvGKfpc5sZHF82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831763; c=relaxed/simple;
	bh=IF78aL4qhYcYFoQ/xoUYLUDn+1jiumlt7gMiBumVb88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnVjCw19mZGtP1OgmbZiqzXnns85jVPn45XQsE4D5DoIv8NK2ip8lQcc7bMZxe0LJt6yYlH/zqKDVc2rIMxQPTu//V3/joly4FGMAdqcDXChdQpu5402Nmg6KVE/MUnj5Vy6kAYuHTomx2ZiHSO/2Z7yDfdijvFnp1aINluC4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c80167f5716so3990004a12.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831761; x=1779436561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAZHu6XpvwN5l5f2FSQxtIsJfHFz80+bclBZd6bS4os=;
        b=aH1hbJvUUmIaM1ftUazO3v0pztDzS4acBawkBWDXhCQIenMEhPiLPVlx8q5WFA4YDI
         V4yWhv+zvBtmTCE46F15WAWBE8OnGzsLTFvmqD2gDhTv5YHp+0GskyQtYmDp9mQspswE
         RpYKa3vrd3tLTYFPc7+qIkTtucLt81OTmKTjUKzqWsMO9fe+AQeOIL2FSUQxIVyDAa7p
         /fJo7Z8X2v4SDeu5jfsZvVs0rp6xuK4ZOVR+3HiN/bQRRmXZSliYTz1kGgcprFmaxsw3
         cgfZbPfPUBPLXRJwlJgi54v3TeZ+IP2vGjDe50kn674KQWqk2SmJz6ULIbJBkHwifr5j
         0aRw==
X-Forwarded-Encrypted: i=1; AFNElJ/A08j4xMCbrk4oo/MjnXMRYULC3g/LW3EnfL3ZxB1/GcF46e2icvAgHllA3IOah1fu+i7HkfFmkJin@vger.kernel.org
X-Gm-Message-State: AOJu0YylLCCd1ERlz9fPV+SqM8gjObLwv1SzCDeV6v9RnXOPyZiFODAt
	y+PSU5+XFty+m8oSYA23MOLhOyawG5/YxmgN+ofp3FDDS/fEY+QE/81t1ALPZqFM
X-Gm-Gg: Acq92OElGMKZOkud9yTiSB4liJzYOYmW80ILJywCgqFh4H2eahA3gqUGxz7xE0IsPSR
	/VxDuwyc9U45oyPN8Gb1g3IiNd1uBB99xV03N0k26eRfSaV82ZUvTjSGpx4Ps/BvVPtthRaSV/M
	mAPe8Vo5KPhvkcmrRWKL6eZLJ2EXXOUXizcTDprUS1DhVdEilh8/XPNiiidnoOVTZWhIakQbAUp
	qCJFZOhium0F9fE8uccpqSRhcywmgEr1vaSlEDv22LoEq9y88mnJD36AJoTOE/xUjq+7maao2fC
	eteLX0zFBGKLs5gjiV2cdDI7qkU7s5b+mCtFZCUuVAL2kEKcEBzI/pm4jj1Cu2ZLbs9BvTh+3Z6
	Vr7ch3U7Ay0Fuc1IZh0Z0tEA3UeaA16RjODhXkV0vC28CpZteGWlaV7IeyEqarjTXHTLBYUX3oo
	ZRfzkHqTJxEePoLji40giTcPGGlEO0UtySk/DYmW1n4nzKVHVtYXJa1xGvqugWJQTl+aCLoA==
X-Received: by 2002:a05:6a20:a12b:b0:3a2:d0ed:f1f8 with SMTP id adf61e73a8af0-3b22ecf94damr2810128637.30.1778831761351;
        Fri, 15 May 2026 00:56:01 -0700 (PDT)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06268asm4382066a12.1.2026.05.15.00.56.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:56:01 -0700 (PDT)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-133466cf955so5100279c88.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8z+0i/97AFDAPZWMKfaOD8lRHKx0wc1GIlgggFeB4PWhSYIa+CpCLyDzx9ioN9NiaaFeBZQSGqa84G@vger.kernel.org
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id
 ada2fe7eead31-63a39a5f9e4mr1494077137.0.1778831365156; Fri, 15 May 2026
 00:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com> <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
X-Gm-Features: AVHnY4KQ6u1JetcDt3qGv1sa7SAF13W-c5qtL3drtJoKYhKLpQQVXnl4eLgch0w
Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +
> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)
> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(clk_prepare_enable(dsc->clk));

Who don't you use pm_runtime_resume_and_get() instead, like
rcar_cmm.c? Then you don't need to get the clock at all, and the driver
will keep on working if the DSC ever ends up in a power domain.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
