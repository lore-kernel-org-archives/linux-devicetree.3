Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F166733A717
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655105; cv=none; b=WB++TlGnE//thLtAdc2pEBMRwLlo0u/1Bd8r60QBDFeePZd+PgXhli8rLowsdYnsfLY0uI4MdKHo2giGf2vB0dmZKv67wL6DAmhVBlRMwKNrFbXKfQm22+VNOMvdwxiUnk77zKPLz19B+lGIWnCWxfZgQM+gT06cNWgxrN0SVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655105; c=relaxed/simple;
	bh=Esa6dVRyYOOr3vJIDSY5cJEBLjvkhKepH2lKClA4ih8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0fHrsTH+QE5UtiecQL2U5eSvAqWPW7v38f/MrfgvSB3OtsisibW3cn9yHFckFC2vL87osAmLMcFLp2dhU1dIrlY0Mruk/aT9vQQt3niSqJzKAjnXeYbWTLD5jhzSAIBkdylkFxk91BhAuh8avnKFf1qvNlTH9AAGGJXMH+e3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbca22dbfeso2281376a34.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775655102; x=1776259902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VHgesrf5StiprJKDytJNXvB7R5FJ2lBTM9ZJItFuhE=;
        b=jTmX7K/75WIz2yICwdnGYwl9IqaA6x/K2fr1HFsjBJoc/5nd+UmGW20OFWG4tgsjZe
         OjBtWr1DmBYfRB7x9lFGqsUHUElH+AwTaNcN4LPUiAyRFtwG0gQiUYfs5hNRYBxfIwkh
         jyTelLtXAvaK+JZppGax94k/O9RZTJSyXdGxNVmmaHigAsD8AJgidXfVsLQV2XBQpOre
         SdViIsRHRAenSQc/oR7tQK+JHXkgRdVgqkHzE3K03YNqdIX3Y743B4p5STY2/pKdYDG2
         sZKaTkm/Os1pRIjPiyQTRmZha0jwL9yAGHKhXA422WdEUuCM6diBW0yufWq2JKLR0Hkt
         yeaw==
X-Forwarded-Encrypted: i=1; AJvYcCXgAoryxL7EgWPp3/GU4PMLkQ88dPN3JbZqCPSbnneTfwoDruULIKjtSyAG+X8qHzkiTpVpsy/QeeIh@vger.kernel.org
X-Gm-Message-State: AOJu0YwyyTaYZ+xxVlawcaj0rwMRzEhTHB+VX4WR2/a7DLyuc5TR04me
	78FL+ovs+uxjpN25rv6CeO95Yhnqu5vqcprE7ppquYSwLd8Vz5XVSTgnIFcGDn8W
X-Gm-Gg: AeBDieuHXfGUftbkcRvlLkfCsQP3oAnSbBtd0FWUMkNAYO8d3oBa2D/gFJLbdwXOmzn
	1QjXcBn3g5mxahsu3s+r6r/dAWMXt0Plt9ySF2MIeZaqTUUm4tvoCCI4ng1emGu+OvmwwEizAR7
	pX3cyY4WPLZpnY76rcIfEzQBQ+6q7oylVG+MHsh+2Ot6O5VW17+n1PSSwOR0uVGArFTh71ALFWh
	l++OuYV+ZOyfH1R5IzvcGH3CEJR3adbeFseafqPypy+SJD9fxrrqMW5ETjlkv7xJXp2LIUBFgll
	IOx2eKpAEcwX1axvASL5faWjV2Gh5j3SYDVAnJR3Urq9NvcJuqViqUJYyqzfRYa1bJ+63fpfKWl
	snUX+T0Fw9eaREW8QG+yTGhKm1LXkbRG0DTsLkYqT96TyDTZCqulX7Pwg6V9iNPn2r27b3LChRJ
	p+9byY9c0d0LijdnB2jz2/Ksk+3Xt1uoT3NPuHWfAYNIU6OeSGxef3oU+fygFrlBEX
X-Received: by 2002:a05:6808:14cb:b0:46a:7718:c518 with SMTP id 5614622812f47-46ef73fd694mr10692435b6e.34.1775655101906;
        Wed, 08 Apr 2026 06:31:41 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b73e7e5sm159405141cf.17.2026.04.08.06.31.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:31:41 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b392f1846so87412981cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 06:31:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU08c8NWcZBfy8KByDruKXI0AUcbz2oH6ytOynY7ehTbZ5Cds9jGhLn8MyYqyYKg6GkvrOQrb0WzyJN@vger.kernel.org
X-Received: by 2002:a05:6122:3a03:b0:56f:1a26:563a with SMTP id
 71dfb90a1353d-56f1a265761mr1211064e0c.7.1775654605828; Wed, 08 Apr 2026
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9595f56ce8ab120477bfc11eaafb0f2b655d049a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
X-Gm-Features: AQROBzCAS3tdwS4I5i1ony0ZYqV2Tos82DINalsSZpND3OxFU3AJc31boq9f15A
Message-ID: <CAMuHMdXr_=E+WhCd0Tfrehn+2Mo3L+GUUUCWX5vc-gunYx_oTw@mail.gmail.com>
Subject: Re: [PATCH v6 06/21] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
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
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
