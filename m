Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18D30C354
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654368; cv=none; b=mt2JPPuXBSDGaB0VVzScNMKj0JjYI7zxsQcHQYndS6OGKX1W3YlGDXAOERahzxrZfpY5Lv/CsZq0DGc38onWRTSeuG7N67KkylXCe1ynHLo2CYDo107bI/Is7UrFe3rmAyWQ9U2NCO7otrgDCRG0P/RLxG5tWDuju9ED8r4Ki3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654368; c=relaxed/simple;
	bh=eDPl1BxiRe/fUMVm6v8nPkG76S8YwwEBsYa94mj/dvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJV5DlrvH4f/r69/6rcYdfe0lmqArQZXwWOxniL83+OqwLpttJsgQiQZON7aezVeqGex9f3+WIkAvK939jHpw65TnR/vpaf5w2Le4UBieaa2vWmOhJrNEps22hFi/GXBfB3edBFB6GG7WJyH/egD+mFwr/42jFxRBJJs0xSC/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so1878848e0c.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654366; x=1776259166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11iAo9dki9YzQOZbHMLoGuCa0VnV6ePIcYUznc5FWP8=;
        b=kMu2wWNe9hztR4aB6vUnT7zOn9slmqLmrNaJYwTSLAOZJG9z3lLeKjC77isPaMzbDK
         hUlFCAaxiVQ3ih6VX1KGj5T73TrwftV4Ws7T/PJD9loaltTRRLmbtg6K73KCnBFI/KFP
         iQM+7LUD7v9X+PjGunb4Id2d3A6EzywMjJ/qZX2n1TmcNNRGTcUmnjrbRiB7YZnVe3pb
         dtx8R3Op0LxiaXnN4ClUY5JYIwDytJqRHhcYwUsBg3wnwezrNMMuFyS87zXRKlMPbvA+
         l822wlFmTvwE4SGXpCCeRAsWQWgim7ixnuNdw/vj5/U9KoEqUgqrQNHFDPBTG7Dk3SHK
         +KXg==
X-Forwarded-Encrypted: i=1; AJvYcCWyJ+Nd6hutjCTdkE8HiMC3Qugkja3Txk1eIESKnY8G63RTPM4gprZmBmJQt/cTU7lqdHmxHv3vA1cD@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3J+Fnay5TLghmBNPvi0BMYrmhq8EV8FltQ5eYSEpzZ+wo8+P
	Q/kTmjYVZRNX3NMW/GtNJNVz+HDkrdDmyh1rlhdQ+iXVbCGLNNzW92YdVrJUOitn
X-Gm-Gg: AeBDieu2Um+a4DU9CnJeEG7/SQbwhixGSEmqiLYoixKnpm01gX5al1IL28v9Nx59zqy
	v3HfoJNeNIrtMe0aVPcQn8RHiA4QuZjROKzU+QanpmANVPrnxqhWD2oeAp+QWsL/gaDsWyKw0Qf
	Kb+bbmZ6aBl+U5xFzgLLHbqnc2MVQZVGv/wei62rYNFzSaXr+8l2dmANvGPxM9Vq7xoaQF58BSr
	1YZTf17FpNDmhe+47/JFd8s8hDAPVi3p5uIBaZVq9LWVVgMqfUZvFQsV8VBgRUp/pZcYk+ab1ld
	p1Q58Msea8P0WDBeGyoETXB92jbF/F5H8HKsjEyk800TBUEAY9bfhGAJz/hvK8pE3TS/WOcg1MA
	a7TujW9irytdCR9CHh2OX1afBUgmNPcBmwsJsVT/3dHFYwdkgcj9w5+j9+qknZh94D0GAdzh5/U
	DAIbzW+Bk2JP/n45jGgZMSWc2L8VEZX4o+VqEiVeMQPJTjS8r1x2q+pZE5ISZ4dj1g
X-Received: by 2002:a05:6122:e469:b0:56d:8646:2911 with SMTP id 71dfb90a1353d-56dab4e2ba4mr8072054e0c.0.1775654366493;
        Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm20119653e0c.7.2026.04.08.06.19.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1875127e0c.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWu4RpaF8rp4WcUnGHQtaUYj2FogxRUrVjry8T2RJmStZddTVt03uKroOgPuL0Rh7/DUWLI4olNL08M@vger.kernel.org
X-Received: by 2002:a05:6122:4b05:b0:56d:3b69:87d2 with SMTP id
 71dfb90a1353d-56dab9df26emr8767911e0c.11.1775654366102; Wed, 08 Apr 2026
 06:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
X-Gm-Features: AQROBzC36oVu26dy7QAue_JJJeRvfbuifO9CcFeX81T2keIzqU6JIH81ayIbX9M
Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
Subject: Re: [PATCH v6 01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 12:38, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> with different duty cycles:
>
> - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
>
> Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> allow the DRM driver to query and configure the appropriate clock path
> based on the required output duty cycle.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Fixed rzv2h_cpg_plldsi_smux_clk_register() removed u8 width, mask
>    variables and replaced with direct use of smux.width and clk_div_mask(smux.width).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
