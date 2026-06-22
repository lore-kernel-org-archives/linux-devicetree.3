Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC23AFD19
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133341; cv=none; b=meBUMVFtZ8Qf7Aep2ue783gg8MjrJKEd4yzzfMljDORCWELAX/cWo+RpdYxvgV3VBVAU4fiRnB5UDR1Ws+QV2Z5irw1eZ/iFF86NzxvIT7MqYIfbmAAsI0IwWniONvPC02rMVHQeUYZZZyQhm9ck0YmUYK2vWYfLSVA3mzLx92Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133341; c=relaxed/simple;
	bh=qK7VD9LHBp2iojTMkcS+j1VMY8DyxZEPJu9ua8on/To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhscXYzJ+y7MHG52nho1TTAI4cEkaXXvZK5FwKcqpW9y1AV3ZEmCQrRP0H7C8403G/5j1WCvKKyedmqPzT3qkwN3ldmp6EZ6OOJKNPP9umRFIpIrOZHr0a9Ml4UkZkSJoJMJEbNHFQakoRDXMGuxVpQpF/dETN8C68ibMe9+lnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbc6c99b5cso1226150e0c.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133338; x=1782738138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjMojdBNG/o8SIjkI26rWpitqIrtyyRQlAlt+FrtOZU=;
        b=HGBLXzqMEGxUuc1l0JhzhUPzIKrb8ICQUCZImOHbbg8DDiUPMe8w+sqN9MkWGl6lQq
         S+1I4FWQJB3zagfwOJ3sbFN3zLPu+zLmCI0M2F1Sv0D7sy76OMwgXS7ezJpmNdgmJ8WZ
         w0/zEE2L8EJRpWXe9FO25kGI9DKMpJzyGWr6GZm7rVf6onaMZMdCmUEAzZfJN14ssn6V
         FqYGlMJtIRgIx8m0MopGxmT7Gsee1BFWqvQ7Q3IfaaIYmEnAeyT9kjgHxJCDRwS05r44
         mh4YDFT+xMOZXUKicY1mKU6JQnJOOyjSkzGQB18xxK6vRSw7W6LUpWi4lsAgO54tOsPA
         sN7w==
X-Forwarded-Encrypted: i=1; AFNElJ9EPJaphnOrLHU6yqatgb50AGY2pK7aSAYMZNGFEFDKP0luR5yD786+B3wLypFFWQAB1kenp3IisglV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MrBl5vdJW4FG3pcGSpHQvNvK1KsYyYwtemNGmN3lnme3x+Jf
	B9MBofu+qXi5bhpnXefGS6NpBieLBTcGi0CBYUyxRAlObJD0DM5SfyhT/hlVL19L
X-Gm-Gg: AfdE7ckStVcLVUYvSXwPTULEkaz6n3BfDDcSJ4AHrcEaADGAukEqqhIJLXNnT8bRM2V
	hVRTcXr/QxarUG99aFqSjQqR8z31tQ6IkGg/7hvum/5t7haOUj+d5F3E6B8LISIuqbIaR9L3UYQ
	HswP0+nqsZ/XF0rtp6VK81nSPrHDhmG7bxEfvGqY1A241QDobLQcNV/RhVkxgv+iSM0HJFzC7FI
	AVQdXHRWo0twp5R7Du7nAxGuF1eloYgM17cgQALdFvgC66t4Rrqs3RoWzIfeZMLzl1iPw8pJIfQ
	ibu/gIy9b1yITX2ycbfQKdKbn0Ifz5VBSrbjd6f9oqfgIMPkMCVyZ/EKeYiepeWPpVyB8/44VV9
	SsHKFs/MuOEEvnuXB62m9HDcuccx5XR37sySWW5GRTihvyNcWeUOWHsn4BiBWpw9eXaZVpBZdKY
	rNHqym0VsprjlaSD4ttgOULJO0xQovt1MI10ptHCVH5s416Og4fw==
X-Received: by 2002:a05:6122:1805:b0:59e:6c31:5aae with SMTP id 71dfb90a1353d-5bbebb786dfmr6527306e0c.5.1782133326219;
        Mon, 22 Jun 2026 06:02:06 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d1167sm6556304e0c.3.2026.06.22.06.02.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:02:03 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966df39a092so1417433241.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80xtSDJiXZqKftiMwRz8HQj+RiiZ8+r3RknACygze9XP3vm+2YCv6x+EKe9qys/ZqwpM1tm/zFoa2+@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:631:4cda:3e86 with SMTP id
 ada2fe7eead31-72a042b0725mr7252805137.24.1782133278319; Mon, 22 Jun 2026
 06:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:01:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
X-Gm-Features: AVVi8Ce07vFTcANCkm8814EiCsqaHjcIMGnkhkhtKVp2ly41YzdV-ZwpiC2NPxE
Message-ID: <CAMuHMdXOLk+zsaxyiGKvW=kY51QiqSC7osrgEd=v6gxiSoE-8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - No change

No need to resend queued patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
