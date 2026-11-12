Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496163;
	b=cOOttXawXjTdtKiPgQmBl8YCnicN0YAaskwwmOa38XX5kF/e5Tcvp8mnVMr9DPFI4heD
	 00HBIVYPvoCDb78DiClMwG+Xq+WQGVX25C5YmlpkhRxQDhH5uFjh54TDBKuciDAThTZGm
	 Num7+4fECbO6Vhq0QSmsa6zklBAo//ccw8rSK7GCSqQhEjvOobH/UfDRKSEq9QIdVb1vC
	 Z1VRFm2duiTcF6Cab7YjffWCTJ7ekUM568tg26tLx/Gp2TRhM9p+J8/PCkZRhUasqGIRx
	 Kv0u099+oS4tLSlk+9UZG5CQECDtwoN2dYUwbmD8Hel5o+ivAd4ezlWje31MbfhmELQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496163;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
	b=obP51rTruaJPt+QIl5gvyl7vpyqO/4x7pOXne2Ch4hru8EpC8/szOnG+SDnnEeEMTx9k
	 mdXcFQye4Mfx24phsPY5TG8lhB7bOILUuS6IliIw4QTuksONvMvOmql4zU9DF3OpB5rmx
	 X6vuWM0PLtzvKLZAgFMVO7UQNcuAtrjW4fipHl5ULrlNzmF9HE4Xz6XI9X87CD3Be7lGW
	 rWQ2a6GeondjmIQO1M4bQdx5GfaAQuXvZiGWAY3tKgt1D8X2nM9LhYL7/mBp+pLzo7Vfm
	 OHdv+Vri9Plbvu+F7P9HuKKMjki/Rl+9s13kVSnNMTALuQD0T3POihZGAPhHTkwzUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8E606A897
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E8E606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so1059099241.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496162; x=1795100962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2HclZgC7BHSQ1+tdHxuenXtHwqaRuALZpayUv998n0=;
        b=uOTdJxep5jtmz8+2H4Jl3CIrjh7iP9XmT3It2JScy68izrNk4BNgqKOo1r7egQQWpp
         CUhIsMxPmGMQB9TM7b0IH4Ism+ITbTDC0YuGcpTvjl2It0iggUy419Iek5qOCxwhQ+IG
         Uefqux5zuHswsSfU0I1QWklJDg0hx3Oudy+b0DYBOg1i3tjdV48UJ576fgaS8qucy7eH
         3nBbyvRWqdNH6OrVlgvDn5yP2thA565pdA3yYZWDE79aCYS7OUCyJoBOrJ+2GzTli4yQ
         ZNcJ3OIQ8OfO0YY/RCwmcI+p+2fLadJY2u6l9TEQR2BIRRd43GcJ7PPvcgX8N5osuxAs
         yvLA==
X-Forwarded-Encrypted: i=1; AL+hErE866u8uMmP0Fy7+I9H59+k9yfwRaZMtdBfkw/474TrdrjI75VhjRCDNYUsEDxQzrxUXL7kpdUoN5zP@vger.kernel.org
X-Gm-Message-State: APuU4Z/lc5UBhsUUoywGUuPk+pBQzo2BMwpi9SJ2UVQxA+asdC/pL9vL
	trhLdj2FQ3NF27LOJPZwjZ6MBu356ohEEvZDdjW3mWHjRMVBUn9m+Uvf0j+jiPVNygM=
X-Gm-Gg: AYBFou0FGcahMphyIKLP+c49Lq/jbgOUcbeHAIBZIOx4KRdTjoCkyKQyDpzLEHNGwtI
	Sfhbv9sHRyBIOKYXL3yAWOEAEOp0vYHuBS8+YhlM8PUpgfM3lksyNspngkkKlUebrhfyXKaG27O
	cew2ga3WdIxj9Cz9OJZsYQzbwj6EiiRPGSumf13sWH26crTVAt8HDA3FNYNdhJ/+zRLzNlsU4kj
	n4sMg5Y9gIZrtr3NBpLyaExb/fB736JIDbrEyzV1z2z3Z04hcKqSmV7Guz+jPl/1TVMR/BGrFEg
	a7LIwJ9PFUfBFsL0oqKdmbSixg6Q5F+rme6JUPGmwEuhzwIZwoWhlua0IsEgBwLjz+WFsZK6zYN
	t2dlx1wr65NC7Ft6rkDlqexVLi767erkY7/ZkFgoulaL2i1vkLaCgxI+TwzQkW1k13hdgjiHgWZ
	O17LsFA2dTvlZaryuzq+DzTMAFVukOphusA2rXNVFyLXWsCQeOSEt14Tc/Z8xGzdCGY/QDlsMOM
	9l5rOtxk/5NryUEOYv+86osaYx4bfMr08l+8hTIXjnEsd/+siwRC4a1qwMJKfwCTXWt/51lZFmZ
	pvafShIjFASrVk7KuUeU4AO6+AGwjBoEbDBiSN7OXZWcVGLPnQdfylsZwm/iUDx1vpqXC5w=
X-Received: by 2002:a05:6122:398e:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5ee1c49891cmr2336140e0c.21.1794496161893;
        Thu, 12 Nov 2026 07:09:21 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm6117693241.11.2026.11.12.07.09.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:09:20 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so288346e0c.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:09:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPGlzDUBRptC5Sq53V3GEGIe0n8DbO12qCcCBj0CudI46UiXQ88GDtzUHLWYpiS1+GE9WHBvACatqL@vger.kernel.org
X-Received: by 2002:a05:6122:54b:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee1c298abdmr2507584e0c.2.1794496158519; Thu, 12 Nov 2026
 07:09:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-11-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 16:09:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
X-Gm-Features: AclHuK9Zmur2PVIdNvv46swJ-VbufJjxD1dvyJf5R-d3EopJYyWzLSJYUjPuDQE
Message-ID: <CAMuHMdUBEjh6YSazKAyBv8xAq1+oFG-dfEf=O58otP1wB9gRvA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] dt-bindings: Increase Renesas X5H MDLC PD
 specifier bit width
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> In the Renesas R-Car X5H, the module controller's power domain specifier
> cell's bit width has been increased. Update the bindings documentation
> to reflect this.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> I'm guessing that the maximum number is now 512 but I can't find
> definite proof of this.

As the Module System Reset Registers are at offset 0x900 + l * 4,
and the Module System Reset Status Registers at offset 0x960 + l * 4,
there is room for 24 registers holding bitfields for 16 modules each,
thus maximum 384 modules.

> --- a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description:
>    Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
>    Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
> -  to 256 modules in the Power Domain of each Module hierarchy.
> +  to 256 modules in the Power Domain of each Module hierarchy. Recent hardware
> +  versions have increased the number of supported modules.

Just change 256 to 384?

>
>  properties:
>    compatible:
> @@ -32,14 +33,14 @@ properties:
>          are always on, and for which there are no MPDG bits to control them.
>
>        - The second power domain specifier cell is the module standby part, and
> -        must be the module number (0x00-0xff), composed of the Module System
> +        must be the module number (0x00-0x1ff), composed of the Module System

0x17f

>          Reset (MSRES) register index in the high nibble, and the Module Reset
>          Destination bitfield index in the low nibble.
>      const: 2
>
>    '#reset-cells':
>      description:
> -      The single reset specifier cell must be the module number (0x00-0xff),
> +      The single reset specifier cell must be the module number (0x00-0x1ff),

0x17f

>        and thus identical to the second power domain specifier cell.
>      const: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
