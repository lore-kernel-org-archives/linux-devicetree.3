Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAE3CAE93
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984799; cv=none; b=Bv2Bf1wAu17BpRqjwZT4+kTXskB9ydp/Uuv1IDqWM/bV1ipYyfbtSu7fU0wuY7jT2l48N1/JYAF9sg2ebXVfM4tp17y5ijRZMez9uapbGp/vyWqfHZ5EeUh1LBORWRGEUMk07rHLTOVxnoTtdi/udQ6q/COsyNQRDzO4uuq3wqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984799; c=relaxed/simple;
	bh=oaHVnd87z43W7j09tTxLlnmC4YG6JXhvjpcX3CpNAuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpGtVX1WcAK1UnNvqdCFVj/8Q8i3XW+u3yHNMxFFMsFHrL9XSYTFyu7+3xMHg/2atMPMgF0GQ+58r6PLr4Xl9/LPHI5RI5dhLP1m+FJnymT3PKJdY4gq1BlToyqkn8UTs+dodo0aTw+6hNnMvgjjfBF00F0WcjHO8Fwo7wD3Rao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1080833b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984797; x=1783589597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xiqnp7i51oc7KGFElhrnKuIK1In1osntTe68gEGmGg=;
        b=fkbdDIU+lMnBQwoBvCmLqLKP0WzsxtgkTk4LQUsmeAlVZwPowTKLRY5EHIGnctgR07
         //LWQcGTHiOsHnaZhQdhF5dOvXyswqAxrMrBXImHInbY/jFbgstvmGDCBJhfrXWEqct1
         SLfPifbU4Kkzw48Ow6sq4y5edy0zTAJ9YbHOFpcTd1mSFKlGlZcTRBTpz1W9Si5EqxIg
         O1+gQrOTz21ibZPVp9Y96zwJhQahnbLva2Y4FmjGBfDlla1YSf7rniqMZzM6cIp2eIik
         t8eBxN29AEI1+JRqucwBfg8Squke+ujzZSkk5XqJndQFU+1U0k7C7bnuJkcQQ0XVdQJp
         xQRA==
X-Forwarded-Encrypted: i=1; AFNElJ/bMQxaNtZrndtDFIh0ulEM0w6mL1TMOM1sIPlfWaEqFwGYUBjVsgHT30b40j69CgtxGPq7jSSc9b5k@vger.kernel.org
X-Gm-Message-State: AOJu0YxSexG8sEZ0VtOunjH6RFG5f2SyHs1DbkTlDxx2aAUDHt8rpYsd
	U6Z1tIOgTNhukaKaKxm7FDXLRSaQaNjmV5/MaKFp5y4kQVdU7mkb+KQkDKNktBz4gjk=
X-Gm-Gg: AfdE7clU3jdw6EPgIVOof7JTd8BXkIxyLVi9tzR4HNcAp9hl/2rvpWwTp1BIjR/JmpW
	cCwCxnCSpHchfWjJg5KbJCaorkrcno8EhV4z+mxzuJv3XbbFXHCK22hvj+UfJZDTHxA91pNJ3i4
	QiNJ16uaAVSE7iqzIJrp6EZcBcL9V1UvdDvjUn3W7RE/MTFDKFviZZDbQnnfVN6ILbM29GyK0fW
	zQE0NnsYyGR4SbuE3RXdZ//6KGas3PoxsY2vUyJujnik7pUc3z5TtOtQFJtSs50YpZPZKNaUBrB
	0dDDhumb31FK1jWmOwZCxRVxEB7Mg6iI5NddzcwTE1rtWlzWTt6WxKeUlliJXt3yGk1LJP80UWk
	h5RMQWCdSAjurxAZJPhE4WXkIPDWkY3dg/JkIDYDPRTSKqxeMkrGQWMQMMTtT58v4ZA7asK+o8e
	kIF+SlJcCLJN7R39Zpc5XP38OhTLpRJgfbUhNmqbmyDTL0TJ+e8bk1FA==
X-Received: by 2002:a05:6a00:cd2:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847c0988750mr5192854b3a.38.1782984797277;
        Thu, 02 Jul 2026 02:33:17 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb97d96fsm1089102b3a.40.2026.07.02.02.33.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:33:17 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so18561635ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:33:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpKajyxBpBz9SPiBOJ/tJyeEI+Y3BZ4VdPK+pP22nGmMDdmp2xlH/PI4aAbtyXdZcXW9hphXB3AnMhw@vger.kernel.org
X-Received: by 2002:a05:6102:dd4:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-73da8519caamr2375794137.2.1782984487236; Thu, 02 Jul 2026
 02:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:27:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
X-Gm-Features: AVVi8Ccj1J5pvkR0bSkeR64npr1GsYH8otXyCLdk_qEnm1EVAcQxHJFY-QII4Ko
Message-ID: <CAMuHMdUoR_dUG9gHKpaR_53EcS5gm68=gqF3UE3aNApBZ5Wd_g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
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

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s. Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
> +       .attach = rcar_dsc_attach,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,

As of commit 57acfbe5bbc16624 ("drm/atomic-state-helper: Remove
drm_atomic_helper_bridge_reset()") in drm-misc/for-linux-next, this
no longer builds:

-       .atomic_reset = drm_atomic_helper_bridge_reset,
+       .atomic_create_state = drm_atomic_helper_bridge_create_state,

> +       .atomic_enable = rcar_dsc_atomic_enable,
> +       .atomic_disable = rcar_dsc_atomic_disable,
> +       .mode_valid = rcar_dsc_bridge_mode_valid,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
