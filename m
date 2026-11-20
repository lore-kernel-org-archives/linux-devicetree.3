Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172429;
	b=emwBlJpUY6kZ1CKLXBZV/LW3mfZfen+xNBmN7QNl3mjsNVki2rhBz0VJ0dNsN+HyvuT5
	 PB3T7/EkcqGcXGawBKQplXyMUwOQjpXOmNOYihH7ndt4bghZle5Pg4hsWwbmofyzANLKl
	 QORr4ifdf37/XuK8X0LtKymAbGhWW0yfQ32SuIEPRcHKlV8H+0dp4QQ6kmcHOUWc7I1so
	 B89gplJ5/qKmN6l0RZ6/VYSHLZRjwKx5kASgA92Tbhfnu2PBg6CPE6sOBJjH47+fb6Gcu
	 /HHll6O1mUYX3Bo3Jz8RsOVkyRVuPbJkuEtIxBCO+hxL4Qec1klxXWdCxVWrkF85RGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172429;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
	b=Co3kNyJNt5GOWznxVVZERMyk7glq5G6pF/ncG0uzgw2k15NhJqSEaA6vBnsK9huAnVTa
	 sEi+o78Rg/Ozib7eCLe8odL7u4Xi9FNSQoECGeklIojHr2AMGB+tVUDWpT3w/7LLFC7KL
	 ti6cNLATKyhT+fR7tEiG+Ngynn495/WVBCTnnTA0LVdxk2A0zodk0As4dZYb4CrS6YTIk
	 /xspmmThhG9t+w4zaoTAQ0xA/rD1p+510BW2IuM23uGyW3KxtxhUMZAU2wAo/Tj64yjCw
	 2whnNd18I1/wCfp011ns05kSyo2yFJfvcJQw69AGf3zbsoLNBPImdPd8uKsqjozjulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD7606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AD7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so369892241.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172428; x=1795777228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LIOr8EpDe3/dYmsJbUDbEQoYb1h/0cU5uZHFxnrpj+U=;
        b=sSSNMdsnpPmpINwkQuN79RN58GjQieu5UnU2AGFY0Q6lf+oNJz4rcpf2+pFZeJulBl
         PIU036HR9qwXV6LnYNj09J4NeAOVeewdxKrTVt/Cvuw31dHh6l07tNky2pRIrK9sc2Hf
         pT4xtqcs26rpD3STW+6GPILXzalI8fgC/Mgx20NBiRKCSEJh4TuUm5B76sdx7f5ZNLAf
         Pits79e4LfeeoG0GZ/k/zV661PKX31l8nxoUDrlEdo3xTm8vDvccY+QOGfQuQTbk1cZ2
         Ne4CM+v3MTALz1QomckkgqpdPi2AWNKFCe3w11/Rb4XgeuPuqHe+fthMn+z5rQ5afald
         UXYQ==
X-Forwarded-Encrypted: i=1; AL+hErHqR1QI9bSmCA7qQtIagLx2knpG91nVW1Ai/Mdi5eWTJm24/p9wurccnc/I0KCqLVszp4PDr6nKAQit@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZUCU8b+tCRiAOX+74pWpMCC8wKwCBXjBu3Jzf6+sVV3BKIfme
	b8aTN9UZYwDndzLQPpmShBzmjxXkj7nSWqON8nntRbDW1w+kpbpetstRtBKitJcq
X-Gm-Gg: AZFdTZd066sBqi/XsgEPUEse8TUDDUu3I99fXpu3ixevcicZ6QRm0YmxihO5HA/wo4I
	wfxLusYbyNx0iG1Y8D5qvXViPbA43GXNpFVf8DR4xepqGopMTKzUuBXXrxsO129Ufg73YrWXGU3
	0a52kgoxmpVl7aeE1o5+j4MiuBBwQPQmRtrJM95VFdhngHrRxP7kIgdg/ObBGDuW4BT87EvT11N
	hbaQA/iCQ9TNCOhv+qKTz8cEuOpAxkGcZc3sXNvi/oHk+l3dOosvieYGZzqsN3mBiK1CEnYSySW
	Vf5oMA2m1aF5i73XxNRK5WBa9BAo6DfSwo0i1Yk8rpOHGRXmQkpebaCswfviJ6vriWA4r3FyJ0n
	WeUVegnxVZsILCIChsz7AjlTiA37qRKTnPb1o5f/UAeBremLM263tlMyginLovjTQ5VX1H4qd1K
	TgWSXDpaTisQjrCTTYZBDFe6KxgXjqMCka95TbcYDUcbhfD/d0jue+RvFidXPESzngguNpm2HX3
	9dkxIts1JW6Rd6xhMTPrUJhf7Su8snBRLGWPiuv0nbDwWI7tU46W3G8Mp1l29w1Sa/mV2imK8ee
	R/4IPwkmQ+AEqyf0P8daIH0/1FXK24Qu8pLeHA9GDdNEGgrvbYdfRBAYUT4KxosuTqca4U1uhyj
	nqSl0xYIxJChq
X-Received: by 2002:a05:6102:3593:b0:7d2:cf82:1a5f with SMTP id ada2fe7eead31-7d7395d2150mr946477137.24.1795172428272;
        Fri, 20 Nov 2026 03:00:28 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dd9fe41sm2798650241.0.2026.11.20.03.00.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:28 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso422568137.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:00:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGeau68ke8sYwUwnWx1MlrNXZ/13qj9PoAyOybcbJztitqgieQ6Icn4K3QUQnWIDhPMJR1djhnpBC7i@vger.kernel.org
X-Received: by 2002:a05:6102:6047:b0:7a1:f7d2:e82a with SMTP id
 ada2fe7eead31-7d7396a6eb9mr826644137.35.1795172426626; Fri, 20 Nov 2026
 03:00:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-1-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
X-Gm-Features: Aa3M54ok0nFqWrmNFE92MZcAAo9DF0uGdtmbDc1Y1AOqliGu_4a_ac6uIR0TZqI
Message-ID: <CAMuHMdWBB=tMDtssy-8r4=v_u=Pid51gFC1LOgzP3vbJQg5HHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add CANFD node
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the CANFD placeholder with the full node description:
> interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
> and three disabled channel sub-nodes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped fallback compatible based on bindings.
>  * Retained the tag as the change is trivial.

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
