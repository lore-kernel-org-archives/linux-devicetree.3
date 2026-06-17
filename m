Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB7F30B51E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691602; cv=none; b=HW1Q9YTeE48qRhPiPGVJPSEtXKsNxOeYzTumDzPi9M/jJdeLryDmYGwVqE7XoWFqiMaU0aktCBtBn8/5s54xnaLoEdT+FF3onDdX9vkwUBdmrRAD5Lrdg/s7a+C7N9zJZB0hd0w/Ic8SI+uIS6iQvxVJIs+KxS1U4wsMZm7h7C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691602; c=relaxed/simple;
	bh=fhhVqur+2oyADwXnCGlIiz3wYgJIfSyj6S2t50E6LsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ40+VKmYDvXm0Vp0SPExzg/YnHQFlTISQHl2DJ0T2zCa/v7MzjE7f3CE/qUfmmjAUzeJBdHZKl0kf6tJQi+uZYsIKi08NVTC2a10p0shT8ON4Lvr+ZpaHAsWR8A2OwTtlEyiIV7jmz3d/lsE1Oa/G58iDcBqdi27g+af8SLruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1399129241.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691594; x=1782296394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbhigZJZc2KejwaKau8dWpZN526FbWqjZpYcysnO3xI=;
        b=cLCKvaT9TH4wC//xD8Gylc8I+k3j4DHiDjzHkSO9JMVs/HzZaxVH7lvAN7nVPWr5cR
         YOilwGkZUH82XN1ENhcIqGctN2xM5LHjTLK2NDrJwLzE+8Rgc3CbyXbN5NYJo2UMSgKL
         TX9KmJ3OT3PR6XsdRJkkkVSQzaNW2oE4gqta6sLnlx+iIsVUEmWXCRiU76QxGRh1A9JR
         zy92uFiQ4zD9KVcj3dkcmyOJSGPL1TqSzmbB5sPtHTW4qgyy/QezYAZ/ulMVyH++AuAi
         OK2rKM3IY0/qe+SA7bPPBA2vUQnrUgqKSqclW9/Hbr/xOvEMOQnmOQy+hDVXUkgAU9lE
         3MmA==
X-Forwarded-Encrypted: i=1; AFNElJ/fkA61L6wDbMmfPHWVTkd6pRG1LV+Dc0POLn6602YrnEkK5FZH/28agT9ATH4hkObj1IvVEB/zsQ8q@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCm8U/oGyLljdpPJULAUAJ/mUqvhhz7j9F9c7TfZN0IxtQSJp
	68TcrT/J3ry4T69mHDYilR8fJ+IMXuN86T0UCrSe5SD2Cv9guRwxX27Qn/MI0n5u
X-Gm-Gg: AfdE7cnWa4sev8msfpZuW6Q8qIkN+QVLq0I4qoMqzJzTVgXRJwBN4Oyyac9DjEm3wim
	AuWuvf2eXpQ+vaPPC/cNE/6OXL3fp+s+cKcv0SsrHjNzI+cWu868T5nkzCG3djlJKUC4yqv9TPL
	JCrcmUT6SN4y0SlLJ8hJm4NmPyL7Y93HAgZuCFyqjfnt1q0Q0FhWp50E88ySXFbUdHZUdtDVACy
	taRJMcFdAFJIUrHZVIUf/fiY1OQWqaDdeOqu0miO+l8kRXYgAhgQw/7jE23Biydxyw2p9LjO2y2
	w8RVADEKUDASoKgIQYJxwwD13AMIzcWJF4dRiUzeSe+YCyvdGBSmhxTreG/jo2pT9STVBmR1B6u
	uXpgEMXXtWD2ArMtOnsw0PC+RWcA8XkLkS7A2M8ZpkTQfupwK8thGuiV3t9FVaUFkh0kuwfH8BP
	e4tyOYrir3RHnoRQeK9zlnbpAgbUNsI32YZNwyzdtkeCPhi26hbA==
X-Received: by 2002:a05:6102:15a9:b0:633:3040:ca5d with SMTP id ada2fe7eead31-7245da81133mr1417023137.9.1781691593900;
        Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ceca5f6fsm2456224241.1.2026.06.17.03.19.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so1210194241.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9I11JG8SElzl0CyM0tpNSkqNHLcmb0HZ6OCpi8x/FfQeUA4u0zfoTXz4RrOjU0R6Rjq5Av/UEjnXVw@vger.kernel.org
X-Received: by 2002:a05:6102:f95:b0:631:af51:7d8e with SMTP id
 ada2fe7eead31-7246c886ef2mr1476763137.17.1781691592901; Wed, 17 Jun 2026
 03:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:19:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
X-Gm-Features: AVVi8CdHxDV0xPCDU1TgXe-cGUQHmtLwiKcsibD6yTiuMTrRlEAumDcsx_2I-f4
Message-ID: <CAMuHMdXQ3S37L7JAJ42Bag0UPa15Q7n-nNCcbV9FXTtTs4aihQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC
 clock ID
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

Hi Prabhakar,

Thanks for your patch!

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
> on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Note that the LCDC_CLKD clock is utilized as the operating clock source

PCLKRTC

> for the RTC IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-dts
with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
