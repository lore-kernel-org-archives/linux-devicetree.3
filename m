Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B793F4DC3
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691634; cv=none; b=kCD8Vka4Vfz9/yolW6jKXauX3/+Y/KTx27lbj6o3L2WsfScyNI4nqJDqqCvFcFfdGDVydFQaqs+Q0TTYpCyHV0TWkwVcBpF1FtQEyKGfXnCGp7Bo13JCsnID4u01u3oBA80bSDUfutFngBkpzMz761RfHLahJoxfHjB0DOfCoKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691634; c=relaxed/simple;
	bh=En+ahhOZBbXCaiFjFAYdFmkGS3nfp+aP8u8ut054atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaxNVpVswjUBsn+0IPrnr1MsU8LHmDJiXni5qfs1+jPoxP570XLxLo/D0GHYz9BRsqT0CN8b+upqT5oTJ+2FXmjhnEL0C4pdRqTYBQ+EBVNe8NdzQftybwNiqYrEGLXoxWDj/f2mgit5+hqvIjqmghQAlLku62vc3JzrLJbJ4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-72257ba51e3so669296137.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691627; x=1782296427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiX1JmAxtorWhZ6jPKmVMMl1atN7mp+BVTNS7cQc1aU=;
        b=JaFgNS1HGtD/q/BouMiipr+HhfR5hFnB5P5HusTKUozoDFzMj3w3+pThrE8n9QmbNj
         S2hC5ORfgEUovbpyciJcfiqZ7xBaM57uIfzTn1Q/YlbwKo7m04k3O8L3zm9DGGXcCUWv
         /VOrxOwUcN40z+q6OJQO4i28Gz2uVtYl4p9GWSVwhrNkUaaRAu2hKUlWwf7qEaY4iwtY
         gZ5t4TmpYdy/7WI6zPRsdV9Fn9qeaQFXKf6vcmBQ/a4ar9auPXgK0yyWfnsb8FOrV3Eo
         R+6WctiGoojvHVJS2cy1U3G86mQmsouwatp4e5kyKQL2sHgu1jpO6B2nO6fhme9ZcWbI
         3YGw==
X-Forwarded-Encrypted: i=1; AFNElJ8f5QQmE7x2jHzIJtAJJaJbFYvR0FTLwctOv+JF2tJedWkuaHtqCwGS1QPd0PyWEXPsjKQhmVnNHfIr@vger.kernel.org
X-Gm-Message-State: AOJu0YzbewMyLmhrE3zIbmbZtM/I6IPQ1ltRKe862OA6TCIsaviXwg/a
	HSLJczU0cDhPPLIdN8Papxrarc/G/Ssxz9TFjRC+UfJn9UYuxQTu1lWFKBEROTVk
X-Gm-Gg: AfdE7cn+x2nPA3ooMbFhKcZpxqUH4KwR+duuiuQ+reMTmNuVeEPoJhtjbjz2dn4X/nB
	QssVtoh7gQcdXCs+4vKHGlpXUNNlvUywibowTqmuznkQgP3VIBmvPkb57rCkYEsI1ykITAaG8F6
	5xkoZgkStO+zxnHlqOCjzHrBrJNOvdZkVxwYnVBV4mUOaCj0uo++ZmXlOZsIrjxRf7Huj36lk5u
	IMd1dQJNJPLRvr7G1718ClfN4onO+WOHPLixgdoZBW/rKnCfJvqwOtgvPdZzz383WZcRWKDZn4Q
	poaHgOb1P7bW5b/CQci5kaUnilh3CgeEy4GVO9w1iMZnHGd72ALSpQFA5tFjos+h4p7eO2A7epj
	M2CdJrQUOkyUx8EpPP/nALmcR1fUw9hi1rE9git6UVs7L7TT1Rvr+HDLTWjvTg1SNCQdrHlCJGa
	LpA3ThlTbT748H5wc6hIjCJdOMcqVk0tb0f9s1r7JYxPbYmJMDig==
X-Received: by 2002:a67:e8d8:0:b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-724f14c8dd7mr686478137.17.1781691626817;
        Wed, 17 Jun 2026 03:20:26 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966c5b6389asm2922361241.13.2026.06.17.03.20.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966db0b76daso292284241.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PaEdefM5qwoZ45lcZnAZZrgNM92ffAQlsw6B+qXxymlwLrKiyigPrHuD6zS2c/VHCtQaqF358cmG4@vger.kernel.org
X-Received: by 2002:a05:6102:82ed:b0:6d2:1633:1803 with SMTP id
 ada2fe7eead31-724f14e6aa2mr709969137.19.1781691625320; Wed, 17 Jun 2026
 03:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:20:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
X-Gm-Features: AVVi8CcyUMxm1Grgjsstg8ysHgy-x4YdUDopNzMau7jtRCWUtgAqkI2pm5pxbag
Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the core and module clock definitions for the Real-Time Clock (RTC)
> peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
