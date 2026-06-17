Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422A3BB110
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690240; cv=none; b=q2tkuYsctfYAEpYaIXkB0PAyRm6a5YB7LUAX5+wqFcH7odEL9TP2cxNcXLLPQTlPtval7jurMM8qr1jK0laQFyUjOMV4X/CcG01vOvxNBzcE0o8G7rQTbHyT5yvKwi/bJLxFZc2PoDl8QzyKyuttqqz2dGaNXfnKFyoocjPKyhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690240; c=relaxed/simple;
	bh=yosGDZRUqJOAqWGj+YSUg44nrce0K/K5QUaTYJIYSEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLAPqOl9zosAl0uDvAhzHtWxU2GaeEE4DrwhHKuXbsH26kiCc5IRMI4Av0myrU3bB+i8CkOh2kr/0C+eBYCQB3kiC9JLCBeJQUcYy9DHnc6jUZhTwFW7JANablDQE58ybdXNWbEjbuckHbplHAOnMoLY4ws7IZZVvFWeGAtulXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69d7aa0ac14so4004947eaf.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690238; x=1782295038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be9sl4KL53VG3jbIWtM67exzlHhIMuOa3JPJ5DmV4OE=;
        b=eog97QUmBJ3Cp5Ti2JEV2eZg3IshK2EdKKEJxAXpO9Y4PCHZIkJpWjAznQ99qOOR0H
         pB6HyyGWmCZzfMEUCwG7SWgXJuzt9rrF4iRWxUJNr4R5cFmtx/R23OWlZZJ0m+YOzNGb
         G7h2xUaDkvWGdsLmesIJDeO6YtNrA/qzs7BaQx1TZwwaVUUYdsIqRU+aXGLnUwNEFBFi
         ppzKB2X+PCyAqW/Iol6SQHd1QRW5BehBMRM2fAgXWKtdeNaVMpw41Bvsmfx4w16l4yNG
         s522w4QNNtKDA+oVGdGHfh9Aknkr1ldG/xr4qSXfAygfUFF0DIgkCn0q7HWCcRWSanp9
         Fd6A==
X-Forwarded-Encrypted: i=1; AFNElJ+XWAHso6QJnnvKQYXlQKOJivCL/dRZYJo2dk3pA1itT42Ok3SWmJC0ZEFwbhUbWSecZQ8LlUQy5oxk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxqa1/ATTeJPeDrY9OtKykFxviG/MCZh5hnfuo3UxfJQURHrI6
	KXtNKvj71FJts09T2K+/696F+qggP8JQSUQf4VDY9s8Sd2IZMOHcRcipl8vpeVA/
X-Gm-Gg: Acq92OEugg7vnLprq6w8h/cteUuVLc2o/rfnP5Vn18CnjPdK6xBq+WTvANR/umxEmh2
	PP6eF4mMke8QPkaolsbGxRDDghu6jy/mpflzozYtUQ0ZUrvllcFp6ZD2sgz8oyKAzyHpnqQ6Hfa
	2os2O3NJm3JHjebFBaY7Izwjue30OH9X8jj9xrbZSIiXmlgOhWsnZ2f63qoSs0gntsmZmzRo1Jy
	bD6z4di1s2EhhcF4vEAZ7RODThBJefFADaQ+2tVusrzp02gDCk3NmaFwEbLzzs2tkYhw+sG1Q9D
	LahWSsgh0dzP/y1Yye5mVWN/hA4dv+crtAt6ANEqgec1by3fjel2CqHuJR1q6lWQ/BuJLrvFZhI
	82G37v6pwWx0dvF6youFe8GHBzJhOfnxpIw/V5Ew1F24SP4b/N68De1HVq+dQpfr0cFx0aCVNEE
	pC7ALunkvRKuPCr2lxWwGekFdawRhOFSPr7mX60FNchszleFvmXA==
X-Received: by 2002:a05:6820:1807:b0:69e:461a:d845 with SMTP id 006d021491bc7-6a0b5e87137mr2234923eaf.21.1781690237953;
        Wed, 17 Jun 2026 02:57:17 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00ed708esm6853612eaf.9.2026.06.17.02.57.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:57:17 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-446c53679cbso212080fac.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9R25UNUl4/oLfsox2xshU85F4HeM1Iu03LJjvnhFTYuicfw8LDPu0hKPnOCuMxuLAfq+GTd95DW8jt@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:6cf:37fe:2cb with SMTP id
 ada2fe7eead31-7246d750087mr1351245137.27.1781689816544; Wed, 17 Jun 2026
 02:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:50:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
X-Gm-Features: AVVi8CcJp3e9kR75NVaDatbeWYVbp9xfJzSab3kpmDUcfOpvbSLyDp0yecrMJ4k
Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
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

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
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
