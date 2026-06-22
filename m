Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953D3B14D9
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134002; cv=none; b=rKoGseNx48vdRt/hWenRHXPSPNXLTZ++bietUViJKwtDMbKwJ2wTL87P5OxJ43xMsaKHzpupFmUVZ6eYBBOw2nGcNTb6H909UowZ3q0LDFD84VcCcATTIRxaFfxVqHjMwagC1yIyvT0sZEp5M7Mlw4maw+XemU9FO4vV3vXnCmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134002; c=relaxed/simple;
	bh=XcEOJh31PWonfR0DQ8W+3Ki764YdjB5fZsLG4UFUAQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHpl1IIcdWKkd7smzpa3VzYnfcDFSPg0Z3I/DVcY6XoI1mjXC/lrLwBaH2cPaSFmC6rP5HntqgiYIrE8HxDw3Z7TN0SZNcdk57OR00ZEPVCfwYQFB4M6/ePb4JERC0pvYyoz1H1sPAMAT1z7fZo4JEdLYySfj/ggZzJhNCXGJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c074ac8adaaso523755166b.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134000; x=1782738800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cPiOkbmgHnl7iVDXe5O/aM/qhQ7nF1KGFxDUd/gPMA=;
        b=sKPj4adOqN2Aq53OAHpm/LqYyeZaxhQuWSvZGYlM0jc0gh6dkxKctCkwBOiueUnPyR
         9usMee7vE7tqsuUDNRjbcSav5iTtXEdF6HM11mGEsgcUhA1jYvCQvKETPSVtnCTQudx5
         XstngqRM2dgoV/1AJuo6Sf7nfjx6E2CdFEodlJPTXkAKBTV+3teIZrQXbhS4rnAI3YBO
         mIwxi5o3NMGa+3R4gj1SQKRdIh3B9UGvsC/kdx3ylHSmK1OetsCFGdhwAKmrwh3wA+oU
         9/EdOYE9m7Uk4Hr6EZ2rJj8dt6wq6if9LJKd2dHsM78hld4I+FvHFvXWoCqVmajNAhjl
         6VkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lTp7g8S87sPGWbmepYWocE+p/vE7Z8OJcNN9DWUtPzykvWEahIkmMAsTR6Zu1jYAQLajqCIyGepX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqx7b5MDWC80R4enN6AOnFShDwswXQ33aAVGwHoxC4O99Y8vw2
	/sj/3V/XmuGpHK7MUokz9wKvDNrZnd2bnsqC7b9yzHn5O6rWh3Yes6qzEb/2/keJqkU=
X-Gm-Gg: AfdE7ck9fA9OD0I68890Fat7wnnOPANM+/OLwtAB0s7Ltl1Yhjf9NO74mdGl+RQU0Ly
	Pn4/FKTNU2wWyjgCscpc/GgCB2/C2RVbW3t0bc3eQZpMX0dmdyjdkFerLdI5pISekXZ4v7TZ1jU
	3ttOXBz51UWZpKZx3f83mjbZO+ebYMW1o76cRRYFL25P8BnFQRXWAbTxOIehH1YqU3s2J+/0HJI
	WmkUCFv6KZK838O7ElkJ7BxkY4CjW9o/oqH5tFz3b/eJ4292zsAbLiRwbL8n3HtCZrlT15DYvC7
	hiivRLKr7asgA7dJ9Q1Vdo7su2R8FHRzNPV/bM14W6IEehocgaiFZ/sDNBHehVA/I4i0pE66R6F
	ar2lJMYRumEj1hw1O8KEwaUTs5dJr8HKDTuHAHbfJxGqPfSuwd2pw4zOEZfjQvjE9iVmp8O3JtA
	bLbV9V3HvKvMIxKv/4PpSjijs7h6fHRM1Wj0EgAllZnvYKSU4+2vFv7NByzewD
X-Received: by 2002:a17:907:78e:b0:bb8:b593:edba with SMTP id a640c23a62f3a-c097ccc02eemr734934766b.38.1782133999871;
        Mon, 22 Jun 2026 06:13:19 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac92c6sm359910066b.41.2026.06.22.06.13.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:13:17 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6974f511dd3so4186271a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9A3pGojW1PPykeDeU+5Hdix6z6st4kiQ99JNFbtbtD/E3WnWZ0im5uwv/rrDOr0ge/HzFXkieHmHqW@vger.kernel.org
X-Received: by 2002:a05:6402:3547:b0:697:ce0e:9243 with SMTP id
 4fb4d7f45d1cf-697ce0e9559mr540539a12.13.1782133996242; Mon, 22 Jun 2026
 06:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
X-Gm-Features: AVVi8CcUH8u1TOdYYuE-qFfJh-2q3W4LZYrwKknGe4DqOfHPr71m4gxhWY1vJh4
Message-ID: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

> +       rate_millihz = mul_u32_u32(req->rate, MILLI);

The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
be larger than u32 on 64-bit) is valid, but I believe it can't happen
in practice.  Still, would be good to fix it in a subsequent patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
