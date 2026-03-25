Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE993B27F0
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433823; cv=none; b=E/xtMqw6Ptz+8WaGkc2PP6XaXLg8sIrMTkPLZyh0iwJvc3FY2Uv2n3ZxUO+yuHEWIcquiSsUU4OZzxPT1yX9qLOIkqMjaIysDonWB1rtul4b5QJeIO+XuvJ+cph2Fi/ZH+wRm8MWJIvIuJLm+75t7aW7RDBt6VO8cV3TFezhnCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433823; c=relaxed/simple;
	bh=62igCHF5603h2cDAAalhEN5a09CaNNC/4Ln4C74bl7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukQqhMPylbmLr+X/R8wwARTjYV4cjDoMbC7TH9IAj0m9wyGpkAeTTVAhdCUiaKGGgqoZ+SizxLAnJ3KvdPhZTSjbPnZpWg8gErdQpwr0NJh2EsUCDuOvFwI2mrjG3nRX9Y7DMjDnUWjCFMQ5Y9H8R3j9RHu93EIoXxWpg6e9sII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffa277c115so4166577137.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433821; x=1775038621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTLtnGl1M6udnRP5yuu+s9KqbRSTNVgcMGsOu4/hFHA=;
        b=PIhjJKlR10Q0ROIiqbF6JGWiV/vrEM6RGUtwM0lPrVZNDUhs9frXsffAiMqzKoxlWc
         +ZyXLY9Z9y3OWTjzAxUEaVgV9GtaVWJmHfc+YOCfZesIbSv14F7M9UK10AQMbpaVcgnZ
         bc+1gy4BpbIOmGdPhEEMSStxkRdDnc011/ky+MJtWMaFKGarX5AsFHL+Zyce265wcktM
         fVGooDbo6KkXD+BVSvkuwDVXem83OYY9Kz0uO6SmUWAJYugYT/7qIR9Fpn3XjQcO4CBU
         3NKDkXMUMeqYi+d0C3PL25IZ6lH/xATlVDF4eJasWVcr8vWlwtR9U4MK91OjDAjtkxKN
         sI1A==
X-Forwarded-Encrypted: i=1; AJvYcCXE4pt6kx4pbu12KgjmU7rYtw1hWHavFSUwhobfKUPFdKp/3jB0zOvIz2HcXwirStpInsi1ttSy/MBT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8dvjyrlTCaxVo9uIPZk6Jxirv19J8SgbneR0h0DNmE5KVJw+W
	IfLfUuVD2QFDo021vl/7N865hfBy/74tXGdlmLTU2QHR2BzMgnypniu1JcHI1ObZAUQ=
X-Gm-Gg: ATEYQzytKBPDk7qTGOjfhz5VAoD2/vrNyq48a53rAvo9ZutoyYZIOdQnayAoWScJcMd
	QUvn2+6GGbN3lC9AwKQ9SmQLA9JXEWIoLxZjQOqhJRoalCxlyl0krBmjFrYtLm7xmJlKIB/ZCJM
	w8M9lT+KNw+ZaW3dQr2OH3VckDlSOJYsC6YZ+9EsFERtMPSwMSKLGDZkWlcLdZdapNC5tX5001v
	jk4cVVLr5e4wsvazvLNzSK329amef0SFGEpJTHMxmfsU6ynOleyNKRtbauCiIivMqX5W7Mo1Pip
	L1rdhOkNG+B4rUDNb/HloWeI6NMjuyG4eve/wJuniS5VRMpFEKmtBBavL7jtIQyDo7fpD3LQv4w
	wQ1ME6IkjYwwAkqcH/LIqcdRBWEtuMBjAJ+Rf9LeIvT/Yk23nUXpZfpdfcMiT9BcRDNhN0mszL2
	Mnn+Iaua4QfyHN/KWL0Y9B4p62893Eflf9PtHd9MwZTiU8SZHf8VgDjsE9oLWE
X-Received: by 2002:a05:6102:8557:10b0:5f9:39eb:590a with SMTP id ada2fe7eead31-60379044000mr931545137.9.1774433821023;
        Wed, 25 Mar 2026 03:17:01 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb00179sm13177037137.9.2026.03.25.03.17.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-950c41532e1so3438749241.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdyykgijSaX153c7V/XwLFTE349u5A75m3kwalodVGZ5csYEzjU7dHUuCohULZgW2Oz54ns3V3JeIp@vger.kernel.org
X-Received: by 2002:a67:e705:0:b0:5ff:b684:f7c5 with SMTP id
 ada2fe7eead31-60378fe5973mr1555537137.8.1774433820077; Wed, 25 Mar 2026
 03:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
X-Gm-Features: AQROBzDiB3ZNSpBoCH-0zzZh64dFUliOdmHE4q1JciSR7WAkrsj16jKQbjIuw6U
Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
