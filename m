Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34872FFFB5
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689888; cv=none; b=DQDq7IHyTTLcDsUf8V2Ja8OoA1jrKW63nymZC7ETEPZqeenZ/Wwald15X/yxCCc4j9Td97JSzVpBJafC/0jfOUZI8yLGJdqucI815XeBPe+5jYt+oGnD947P8yjxPnbzNtEPhRdz3A8x1fsDZq+6TcQrbmDkvFiRaq8JBubyIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689888; c=relaxed/simple;
	bh=jP5ExbFfsnARbi1hQgzABvYQm048KE6u4XKnezIt6f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfZnU9Ev53FC6vBGxBKXjJuU1EN21YOPplLlqSigG5awQLgC9sMsR5w5JBKJRAx9m673FSHlaWkID9NobxccbwD1eOe6bZoEK6nVHwdOCNUhxxdveEnJ1iraBh6GiEqk1Z2bvXMNPsnQcYbnLyoEsQc+V5mn2K7ebNyrVYKVioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ebb89109aso3786617e0c.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689886; x=1782294686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHipzLKixYX8/nI/Atoa1w9c10s6+nrRqAvRxdIc4Bo=;
        b=d4ZWg3vbOE6Vit9ywVdbnsnolGLMiK1XoPm2whmV216EB8x04W+g8rjOmUKywkkiXu
         /W/I8D+6HH3miRCT0huZYugQbIWU4+GyMGs9K2+u1IHuoajBdUs79k9B04x3UPeC4ZPV
         j9p3MIpbIb/UwMbgEpOuYXfeLQmLMkWVKv3KGzLX9hXOHq5nivp6+Ka9mmwOa3ZmRS9M
         GHwtcag86paPNaPel9zH4Nie7o2fzOiEIA1rzNzibqgH0cqUeZe3rgyBF64KBszAD4iv
         fOPrfNQbpeXozj/CXMlCTgxoDo2bX3NzWuI8ofqzmGe+BatdTPGhfxMBWJReLwmOMn6d
         WHpw==
X-Forwarded-Encrypted: i=1; AFNElJ+n4UISOzMYvU83lQD9B4y2yrJ1NxEdA5yGivnq1xSXA28nsXgWzK+AldhDlbYHO4Bm/lQVfk9/8Lqf@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLSjsdwlXLSxVjLyrezunsQVib1ii4qXswfB7VEkr7jGeLo6g
	xAXisztFAWqRLtUYmbNlQ6IBxgokGkN451aBBfnmq2STFiUeSVP/ykQEb2ir1uFv
X-Gm-Gg: AfdE7clNPalp1J2vqNcxEFPEojGWahbjxOD9JGjT0Ohc2OvUbr3/GQiy9OolWZi9PIc
	M2KnHNYrzzrwE0iGCFEV5b8w/VIIdICXuUPWSJrx7J/7EiRBgNKtKNi/iyEyelz2r7+GYgp9TjO
	A2rXftk6RjSUpJPPFCNILqTtDwcjNUy6R2nJx613silphHmHl9fSMY+vo75xvRwT9P0l/Mro+Bt
	/GNp6Cof83FIdbXnOq34m/86t0mOgHz+kcBPO9wLvHPd+U7X0gqhSHaCDZx7v3NmDtbgmcLEko5
	57KrrpU9JsLTBkM+Z32+afn4JeJw8FPp9LVqZGicV7vZS6xFylcSSG+FFsXPzngY0zTQ0W5PZx+
	aVk20jemOMpUyJ0U6LGlIRAOkYN+haaNlssdNwkoV2lGicqUHLlfb0R+UMBi4ZpLGvEQ2pwEz9w
	zeRYZDk8s2M/0ORA/yoEn+r/d77SQSCDu8BcugyY+B9ZN+hx/07w==
X-Received: by 2002:a05:6122:2045:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5bbc5297b57mr311305e0c.14.1781689885933;
        Wed, 17 Jun 2026 02:51:25 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb90016c6csm8163011e0c.8.2026.06.17.02.51.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:51:25 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso433685241.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:51:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CgSKiAjSUbzTt5F/uir4OHkVkiEchbki8SO+k/H3ANYyTiqvenUEfKNJeBFFUuzIrijinDLRsTFaH@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:6c1:85f8:29b3 with SMTP id
 ada2fe7eead31-7245d206e3dmr1531191137.6.1781689885289; Wed, 17 Jun 2026
 02:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyHqrRZRx_CVpL2JiiRrjJWpJK494TwcetUu3aOvWoejYL7P2mBGPpsc4
Message-ID: <CAMuHMdX9FpBQ+o+XVq3WbkWt9ikgHSwVC7EFm7pcQtBJ4NpqGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in a branch shared by renesas-clk and renesas-dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
