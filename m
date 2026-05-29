Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2D32ED5C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046239; cv=none; b=QQSpEqpYb0QApXwD8s4xpwBBALbkLV0WkvLOA4yVAxpqqhCJBfNSasYV5eJUSzH+7GZg/57p9DLmmqhxwtiLoNzflCVc+6yOltGMOYu7c3z3ghfwDStCkOKkf28cZ1sBPyHo2NWv0pJzzWTero36RlwiVi8lPddyqXpILulEXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046239; c=relaxed/simple;
	bh=A7303nXP7mzkEH/OWAtRsm4hbLTXsrEjg9htPQcfPcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQa7NVt9ZSSnvljJ05k7HAayO+e+9g8HtFvg/+Pd1ZCOqZYe6rVQ2nBaF0V7oGHbFJZevJgWO9R/cf8w3s2znbeW0/R6CO3VGtwyGQUonqZbxZQ5mlfzACo2eyM9/6MAA3LTrUvvopdHGRiHo3Xif+1HIo/1AUwnAOQPjgWLwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63201e0d6b8so10838707137.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046238; x=1780651038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KsR+eTamR7CorXHidGBoOzlgDhPzd4vd0egbm1d2kE=;
        b=dUHQu8cCzEaeFlUk3EfzSx/I7hD1hSf6PsSSV/PLF4yZK0vyd/d0q6Ntw/LyR40WLI
         VPenYlCxjded4TQWngpMc5QRw0ArImEbkzDEn9AAMokEMxHlNBGu6Y4pp+JCu/LSWBxz
         /oqBGV/Awz4hnu+gvUivbcbwezrcqd51Vk6gRMkUnUglUHuhXW2ovElQzNDrEHHYq2st
         4aWgnWUIOOJySVl09ca6rnQNhw48I2wAEv1eSkHO0yAVpfboyCOA0/2pGHN/tb1LKfDt
         L+iIIxBUkRw1mJxNbFsvu7DC0HV6X1NRZAIx0XKIAPaDDJ+CwJ2zVAWpS7siOQGKtBg7
         RPbg==
X-Forwarded-Encrypted: i=1; AFNElJ/swNTzM50/2Jq45pzgguikLjEjenQo0ImN35LlK36bvC0G/6ZuqRNxHDp3CfuJJUnPMw0BXcL3oA9c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5c+rquDP3b6k3euOUlhsiK2BMi9GuKBHUFDiLaN5NIRCc8mq
	2p9ZI3LmarXF5B8+e+cZs660gjHLthhgPku0EFH2c0g0fO7Ur4PIE6YsqdD91N1dHAM=
X-Gm-Gg: Acq92OGrqJs+mL5mmNyxV2edcgY+yn1W7AdWHvIOR2AtJgvXQAi2jFDxIzO16+bbmsi
	oo+byIzq1f2bd4Rs85xtVAVJzVxTOf6PYqdwWC2RaCGNCfvmVTSM6AqC+sC1KdeZWd3GkiOt+6q
	i3jmQ0+3iPQ3OnDwxPbdlND3YFnt14u/PT1ZjBT6RI4jGHuxlgaAYKeLxCE+DEdkbh3QhdEXX8E
	O3wEl38zjpchbQSfip+C1+um+PsGaJ/kV2+h7w0gVr2at6+8M0oLzQX7EN1UU7S5bO4uN5kJ/H+
	vMvgYAC47P4zZZMI3s0P0FnSJAEgar82A/9vs9rIzmRaF+j+ysX1Gkk3RbPQAgemHgVLrxlNY5P
	BvMHBYMXGY/duUaOm2J4XNKepQ+u+I5JmwliqRbyYXnyn8VvyJNFjX5zn6M7tc18ex6Mwy8j3+A
	cH39Se6UAw4LsrVTUrt05gw7y2UrpSaC0L0+fDwf7M8w65VZKJgHMVq6/lnY7aZXzo69MH2Mw=
X-Received: by 2002:a05:6102:5541:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-6bedd951975mr679976137.18.1780046237789;
        Fri, 29 May 2026 02:17:17 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba249f0sm513498241.3.2026.05.29.02.17.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:17:16 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-636970cf66cso10240771137.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/e4oCX0njxQ0t0rIov7AZ+SEopqnCd1GKcvNPRRpyRNiRT1nbcXHXZFJJ1kpBc3y+YqrnVTpf/X5Mi@vger.kernel.org
X-Received: by 2002:a67:fac8:0:b0:600:3b3e:681a with SMTP id
 ada2fe7eead31-6bed960857dmr483889137.14.1780046235748; Fri, 29 May 2026
 02:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:17:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuvQ7sKbUh6kn4DPfYR7iYk5cK=EV-zJ=GbrKudY5Yag@mail.gmail.com>
X-Gm-Features: AVHnY4Js00YTQovdr1eCSGXVo4f2fAUcVUSkGdqR3jPyv1KLJgrEEvSe7UG5BL0
Message-ID: <CAMuHMdUuvQ7sKbUh6kn4DPfYR7iYk5cK=EV-zJ=GbrKudY5Yag@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 22:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.
>
> Configure the xSPI0 controller interface to 1-bit (x1) mode, even though
> the connected MX25LW51245 octal flash device supports octal mode. Add a
> corresponding inline hardware comment detailing this restriction;
> operating in octal mode causes the BootROM to fail loading the first-stage
> bootloader following a Watchdog Timer (WDT) reset.
>
> Configure the xSPI1 controller interface connected to the AT25SF128A
> flash device for 4-bit (x4) mode to utilize all available data lines.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped CKN pin
> - Added ECS pin configuration for T2H EVK
> - Added Switch settings for both T2H and N2H EVKs
> - Fixed partition address for xSPI0 flash device
> - Added spi-max-frequency property for both xSPI controllers
> - Dropped grouping the pinctrl into subnodes for XSPI1 and
>   for XSPI0 merged the ctrl and data pins into a single group

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
