Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4913D6CA2
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898814; cv=none; b=pqvLXQppurb+jCzr7OOctVpz9ZzSnFdH1QgHNzBbuxTEHwgX5t3SiClN40d11zwSpTgZKnZbc1u83h6UpXiHvVZTQeuLN80H0FGfjqZ/zb14sEFQwIzBD7QTbUnkYoqio1lNYDyZSJde7Yx7Ej2GhswAadHLufJx0k4J5Xkdz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898814; c=relaxed/simple;
	bh=mf48U3dZmpqt3p7RmvGUUMOB0UHyUtn3OAbikvFAdqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMSQUxnIkqk75kTjOINalz0JEz6u8GXg97nVZ9Mer9AAttse7iYCZPc4vERDuHQ6EjJePOPjTrz0nQc0v5C5SeOdazhz7KRqX3SLq+0eVTHZDmNZsNmXDIY6KQgosyJ7RrQBA4LJ5SBr4nwRnPPexYpdQFaQmylSGURjKHdB1is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-479d5ff103aso1819981b6e.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898807; x=1778503607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znJkm+yheaBiOtiXBHrScjCf5aNJhz18eCP9uLN0zvY=;
        b=UNtV0ua3T/LksTBQxerzx+Ujy/NPE57zmeHIGtWht6JNGP97OiXoq2brirPYF89Mj4
         9R4OEgOTFPZaI4Z2wYtgXO5IftRrZk/pddie+rzimjgCGAqcEQX37AZPLLKB+1u1Midc
         ZAlYtzftVhptVkgotA6uV8cwiFgS4KAC+iQyKK6r1iTjyAM7O6ALCUsYEPSl1lxxQzrt
         ykNDpf7e45qUQSD/gHO9zQGxItLOHRMburivz0DmtcQsnfpYUMChqskTD+2g6WCq0v6g
         EGlPifTqLytm8iL5CSPFWbiXXMnZyfgvRMvSP6m6HKQFK714NKJ+kNyGQGN/HY7+K90s
         kPhg==
X-Forwarded-Encrypted: i=1; AFNElJ+ogrAAdYcgGjux5xAGsHj5JWR4AKj5tPne3lZw2yie8ROnbyJlJwmBywtm8WUYnvFQfzfI6FbHurn6@vger.kernel.org
X-Gm-Message-State: AOJu0YwkO+uQlrAv34XSH5+uPnbkma5vvmK3tufTBUh/P4Rsnq2OqUP5
	WcLeW0Ky6z8pVnSPHjRubDnj/1HObrSC5N7z0QG6liz0Nb6/+MucRq5/UmrPYheL
X-Gm-Gg: AeBDietcrHkgh8HsuUiYeFoGvq4prrwvPQqsO3caIHvyqGHrDT9gQDFWs2ekRnmlLZK
	OnN/+O7OjKv/D5PWiwfQJOPnUDYZeqUioF78+5gefWrrasRAlzKxSWNy3V4LLEHVa6TIrwp+Hk8
	0d5kIjdYYc1ujrY7fK5mkLZS7WERVaOGiHevCmobJOxBPMX+szhr7tKOnE3zOMDouKdkppzjkbL
	sMInhDzLxar9q5E+/IOqw+kb1UoaJvGacdTfTF/Y0/NXR5GkMxaiy4usTgJYAszuC9wZSRdHkZI
	hppBAm3YmgDPTr3BLI9gSxszo/rGXCxthcoveOw+o0b4YOIbm3c3w/oy+bJdnpYgAQIMwIO8oxc
	ySgNLt9eMjgu6Wkz/CJFlnLvw4siDArq8NXVCKkQEPW+T9Nnhs/NLycEgZX3D8HkUUPMp/yKj7w
	KtBxsiLkVDMTX5yWMav6yEOIIx7opzprYp/US5qfWAGl3vN6Qp6czpngJOcIM75yaO5ak/5JY=
X-Received: by 2002:a05:6808:1709:b0:479:db65:8dbc with SMTP id 5614622812f47-47c8925e3ffmr4593118b6e.30.1777898807196;
        Mon, 04 May 2026 05:46:47 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454951a95sm10529375fac.7.2026.05.04.05.46.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:46:46 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4094b31a037so2428432fac.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 05:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qsbT3x16fwm8aXwIU3IjsQiy/QHJhvxG0IwwqXXvD6FYU3EC61v4NPA9PrLUHwDIh8VE2DCCCHi1S@vger.kernel.org
X-Received: by 2002:a05:6122:130a:b0:56c:da22:6921 with SMTP id
 71dfb90a1353d-5750c5281a9mr3577419e0c.5.1777898480344; Mon, 04 May 2026
 05:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 14:41:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
X-Gm-Features: AVHnY4LvtR9sYYwFkbyXTFSDx7n1q3qDBs-g1S0RCiV3vvmXtOpqt-05ZZXwFh0
Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Add support for DU and DSI on the Renesas RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:37, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
> interface found on the Renesas RZ/G3E SoC.
>
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
> of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
> and Display Unit (DU).
>
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks for your series!

> Tommaso Merciai (21):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

I have queued these in an immutable branch, targeted for renesas-clk
for v7.2, and for consumption by the DRM patch(es) that have a hard
dependency on the addition to include/linux/clk/renesas.h.

>   dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzg3e-plldsi-tag

for you to fetch changes up to 272a6e2ad164094045af520299b5df3ce1763061:

  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
(2026-05-04 14:03:08 +0200)

----------------------------------------------------------------
clk: renesas: rzg3e: Add support for DSI clocks

RZ/G3E Clock Pulse Generator PLLDSI limits, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Tommaso Merciai (8):
      clk: renesas: rzv2h: Add PLLDSI clk mux support
      clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
      clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
      clk: renesas: r9a09g047: Add support for DSI clocks and resets
      clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

 drivers/clk/renesas/r9a09g047-cpg.c |  84 +++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 181 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  12 +++
 include/linux/clk/renesas.h         |  20 ++++
 4 files changed, 297 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
