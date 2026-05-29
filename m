Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC0F3C8731
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056332; cv=none; b=tOnuwdjUkyyxUlQA2OWWseM0E6TABz87PSN7uXvb333bSPZ6iaK+jT4wRHedixVWnGf7EIQ63uvu+ggP91Q0QLUD5Xo6hg77nS4LOcNE8BtG/yrISEiPTL17F3EU4ANPkhJJovVwqrS6AZu3Tv6t6qWv7ibEjUhSD+ujKl+ByvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056332; c=relaxed/simple;
	bh=r6FrM1W4SpqAjwuFPfgTdnYMQZe9dulHckvJpx/ID8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUiffeVw/YnKMrI+eJrNC+N50UwXWF2prKS1I+HegK32HB2joN2kdpmIMxOSGPnjqGm+B2QOV5Ei1AOLcIxAsJuNqnDUqj/l31N+268/pJ1P6pl2HPMY62hvGnPpy6M2Rc7WZmrTlomAod/AxCCIuRGV0abs+SZ5k5P5qGVap/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59b24523cbeso90767e0c.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056330; x=1780661130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OX8XoUF7IFu/te1KTNA1tAU1bbe6/Z6QcoLJKS7O78=;
        b=YKJ42Eye2s80o6LY5VwG+po6gc2N5ni294dFhb4jTabhchpqOicy/9hxqaSSnBk2fi
         BVKvlTbrVPsh5Wc/LUbDGUa7G1oLQ0GlcZ1+2VRR4ozlCUUZzZfTUbyvHKuqhD6VUXJS
         TwmF0YDhlUcuv8nGAMVWxBsY3tAylybsQ/wARf0kZiXUvlnKzeWqq4dnf72KmtMO9o+9
         KTI7zKJ4fef2uLkJia+b1bScvdwjK1MrYmfZTT3inU4jDBvW8KuT4CVhD+W06iBVu4+2
         zUyM/4eDT4lkmYwiGQ0uqjXjUM/r5HKGhyDMi4dw4p4fKxihUORDhC63+8GrC0hviRnR
         eOJw==
X-Forwarded-Encrypted: i=1; AFNElJ/BD0EfiSnYz+GQlrAXX0vV4Ld5rkJ3FbF0zpjJYmkfKQGCxDQmdGmbp+YFoSNsfHatWVmyUntajRmu@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrfPAQzhRHW1xUgvK71axTihboHeRrKmBb4lhaA9+Ytc4zwA7
	KS2lKeecKoZL57/NnExu4raQZfoXJHjgQ2S6oc3eJJvlRdcdeJXB08BUtRtStvKD10I=
X-Gm-Gg: Acq92OEpJCUL4TOs8a/Vo3hzVW/5W6wOGBsbj8/BsN7ck9871oRCVntKbgEaegnwJH/
	0dAHiGn8bGVibLIsl3BfECWEGU+40EmH2py9YMC5rnyqAYkLxE/9OzA6NscVAwZELd0JGtw2qao
	dzdHAYSh4y4u/4GK6zdFea2KnyP9fDCRF9pCvcAWKIOoKmfb/An7m2107yEoeSKmHXxTkDdAXJI
	bmDmKnupfgetT28bYFKCzpfUBIJgTgWs5G3YqAf9gWJyeAsAkqvHJhVy8c7X13BxtDCdWZETq7W
	MnTKJy8R6zpVD1Wh7laHS8kzeMG7vC2xzmWJFIpR2tgm6fNAbRg43wkFnuZ4eAMjbMf1CAHx8tC
	vDUE1dFo9z2fUlVvfQOT+/DTCBUh47pdhSwQQJ7D21YwtpRTcKsBMnqFos4QfrzF/4BEjgtvVDZ
	fwLGkBnV5HZ8WzGrateb2GCWXAgKlGeeypvl9GAjIGxxmghYBz98Tb9yh2C7hMkS9JIVgrPWyNc
	eQ=
X-Received: by 2002:a05:6122:a22:b0:57f:a2f8:d2a with SMTP id 71dfb90a1353d-599f8ff144dmr773821e0c.11.1780056330286;
        Fri, 29 May 2026 05:05:30 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abe5dcfasm664715241.10.2026.05.29.05.05.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:05:29 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so9861501e0c.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4zeEHPJpEfSStXHTqaoN5fzPpwy8Fv7XqPFtWncacJS7+U6Vr/vNyTIw9EBcn3pSVtjcvgHp9mJ+p@vger.kernel.org
X-Received: by 2002:a05:6122:4d85:b0:56c:ca03:b668 with SMTP id
 71dfb90a1353d-599f53537c8mr819640e0c.3.1780056329661; Fri, 29 May 2026
 05:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <46547aaff3cdb8ea6e17cf1fdec699d83a1cd71b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113358.GE1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113358.GE1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
X-Gm-Features: AVHnY4JwL8_eHuTqhLIZ-49xr1MV4gGX3lGZE_rNlXQ8x2vrv47pvQNALVqlDj0
Message-ID: <CAMuHMdV5xfpj6_5o4Ed+KMLg5MMDuaNUjsUBucrC3nCkkG9vaw@mail.gmail.com>
Subject: Re: [PATCH v6 19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 13:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:04PM +0200, Tommaso Merciai wrote:
> > Add vspd{0,1} nodes to RZ/G3E SoC DTSI.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
