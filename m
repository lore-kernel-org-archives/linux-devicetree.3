Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C79F386566
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462368; cv=none; b=S5kGT/b6VjiLFYbWPpIDZo2uvRdnTjlddms/ro9h4GiGnJdSFRr/lAxtL8ajVtPI9aMxhLxvBXcfUwg0LdDvQB3nu4yCLflgI7kA/DFOnCqVycApCiDHKQ1uRGetA1LZ5HLwGYwKD4HqhzFUM8EhZIlrLCOAMA9Vn6LFFKgC8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462368; c=relaxed/simple;
	bh=GQd283GbRHcL1eMa5GJkNHY5pKpECh6vPQSJWAlvGH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSZ+ScS58rthBRYwM1TGg9cbjWfIMYDXNYEpDKIG78oG1GbT7PFrpajZEnNWV/jJA+Q7Lvqm2oh1Q/3fS3NCyH2c6k+QRMBjzGlhkuYEMO2YBrnCIC0VUpb8p+g2jF5oTghhtoOu8uCGHsp44cqK9m7mP5WqGobru8a0ZrwbeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso4537694e0c.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462366; x=1778067166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4uRNs5kbsz3D4/C3TCXfPmMeHwT6iVUCZwC9U3W8vY=;
        b=Wq/gSPXuUC1Aytiw4Gatvzn4zdgpsEdcbv1m+r29+ZaJxmAPg5EHcMukoEQoKNNZ4m
         RYzrVgn0wPCa8Uds7xKNMyI1x3JkaOlONhhTRUlA5U7FmY0UgzV6x5QE5YwVxvZCg3IS
         ItZk0+7URUZzuaa0lXdi6hX+uRzXw1/kOOF97D9LDr4SLToW8qSU8n3lirJetl7/xA3w
         piLTE28sYykXyCI4NcOkYEwci0baWaKEN77qIQeuctvb+T2bD/XZ2yTxlN9qo1iFVfoJ
         r9XqHPKXG/Uup+NJqybjSBiT/9I71qzyI/7CPI/flSd41S7K9SOXuICjiMtx8RtjXuqJ
         VlGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1xA4NRvd4MsYKia6oGhkUUBWxvPndh5VWx/NrgTPmNPb7RS+Aekoltbv0pxHe2rJMg5xsGasWTArc@vger.kernel.org
X-Gm-Message-State: AOJu0YwGyF47b9XudTAyzhjWAG4k86IzapWxoCqG197qNCJ3LfkQlj96
	Eg1FNFrCVchJCr94V5y7+Xo59Us7buG6VjinDPUKEUGeFGYb7JA8C/OeAv70sA==
X-Gm-Gg: AeBDievpuRYbowstQQO3XM5eahWkxZQAENkofJ4SAv/an1v2voaV5QdonVF6u6t+4Gm
	BKt92WDFJMfdgkDyCLkdR0ZIdXFSHv8yz2TVaAqF0ZZ8AQ+kBc6a1ng0bFS5eTzInefD0SzOr7S
	t4HDqe+b5d5r9MNnl/gb+XLI2mjbQPWxgZ9PwrMn4PB1khRorAKR3hyyaX2S60Q1SeIfuEpSs9p
	xlI1Lvsmk3TNYkgJaPkzDjgm8HeNct6qwCcC+eZsjO6VimIQW2lk/HuSPF909VqCao4Hdv6Fx/9
	MDCrAFrBwUjzlXVO3NWeHIORd4l63OaMPufmusxCaUBV33LWuXZNML+ttEO3TAJg2H/ZRKuOd73
	G38yy0eX82DmH6ISu2houDhYB1YTMdomAS9ggbXFLhWxMV3/WKlGLkLhc1L4M6/U6YJPMAFkALa
	4TMKNsJYzc0FWScDyuMSCGNnNrxuxn7LJoPEn/JRqnEaVcPSOnI0zVlLzcYwWltVf6qowVVos0z
	2oldTTtKgM0Rg==
X-Received: by 2002:a05:6122:3111:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-573a55255f9mr3604810e0c.2.1777462365920;
        Wed, 29 Apr 2026 04:32:45 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb77bfca0sm757082241.11.2026.04.29.04.32.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so3811336e0c.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yVDB6HQtEOsYXt49HoP/2ifOn9dvBcsNgtvsjlCCUjDET25AOXdETbPuh/+JOw/+jwo5GHAouDSxu@vger.kernel.org
X-Received: by 2002:a05:6122:1814:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-573a566e6camr3723066e0c.9.1777462361508; Wed, 29 Apr 2026
 04:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:32:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
X-Gm-Features: AVHnY4LCd6eTq9wcyp22X0zMAv4PuhD2Uo4vLw9bsPU9plD7Rc1VJGY_TMU-X5Y
Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -11,14 +11,18 @@ maintainers:
>
>  description: |
>    The CS2000-CP is an extremely versatile system clocking device that
> -  utilizes a programmable phase lock loop.
> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
> +  drop-in replacement for CP2000-CP.

While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
there is just "CP2500"[2].

>
>    Link: https://www.cirrus.com/products/cs2000/
>
>  properties:
>    compatible:
> -    enum:
> -      - cirrus,cs2000-cp
> +    oneOf:
> +      - items:
> +          - const: cirrus,cs2500-cp

cirrus,cs2500

> +          - const: cirrus,cs2000-cp
> +      - const: cirrus,cs2000-cp
>
>    clocks:
>      description:


[1] ttps://www.cirrus.com/products/cs2500

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
