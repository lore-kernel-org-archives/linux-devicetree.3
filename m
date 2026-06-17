Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CFC391825
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690780; cv=none; b=J4Q8K95Fh50cb+5LqdK9wrbWm8aYZNRIGYlREKo/fWggxNQtgJpG90zh74jOHlD07nfmkxRdzAfmeBYFuoY9tzYYHNwx9Zqr0pc5deZrG21mfMaO2AoaDgAs7R+HJukny8Zn6+imkjZZGtghhtkGV4SInESiCEFCSleTaFJpzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690780; c=relaxed/simple;
	bh=NBj1YiJugs3AlafyrUeHVh/u6KhoB/ett9CLqIWPL7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrThqceBJFeoc2br0KH7UDPuz/hO6gLRH7gIBCPFvs88NmVEGkPPlPiX+MWDOzTQN3IqjClMpSKho8EjmniChZjL5V/e4xtZnvZ794Mg/fiVy48XqY08TUaOFTPwQp9+PBT89wnvC1FL2FXJsbVxOsd/budz40NCZzdrCcpGrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ab03872a64so2715582e0c.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690778; x=1782295578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaeWQDm3vXVlskudp+NZaXeXqiWlY2esM7Su4qAUzM=;
        b=S5RCD+5c8VcvoREgCmNu//alxDR1qgfQiIcU4vk/9Y34nYXUyrOytIhg2ym3c8lkvf
         73J8DHLmqLNpij8fyFshQND+PpkIdOJrDy7hCPBTk+nF2sg6UXG08k5uGMcx69Ae7lW/
         sOXzcp/E/Tc/GrBvMweABLe4c9dppmnBa5Gxs36s513zPuq3a9NBs1HK/QR4ThkgIth6
         OtCxg+x3IoHcVJPiGUco4vJ3HqYSdunxzu59IM5c8zOR/hqnuh7oI6KiykK4Yvbu3hSJ
         1QZe+5841JMCHMEFU7Tjw6D+J7ki0SPHfm94oDPmDo0jav0R3rj0o5SkuFIyrc3Nry7f
         eP1w==
X-Forwarded-Encrypted: i=1; AFNElJ9VHqsq5jm1DDZs6hu++/C/pFAMX3RRF/pGQNBje7z19UVlOCY2IcVUGxjDRXrFxB7HcDYiFrdyn2kL@vger.kernel.org
X-Gm-Message-State: AOJu0YxbEmLIS4rfWJ0roLDKBqsgHytmPW9G8kE/kQ7eJ91/OAxFMnTR
	hmIuapszjHIOuiGZEvuT9MMKl5XXFdeong5Vg/V0ioo2V56X/eARJh3raEcwWM+H
X-Gm-Gg: AfdE7clAeVJPvPjTadmOeRLtvvm/SY58AzPJriV9WBRqwm/UrdbD1/Vxbf6qmbQzrnb
	5PGtD/g8x2Q80eyXkpgvWtYYGJg+9DIDTU7FaDoWBVrOCAbNtFgtQLLksXlspCOc6NCHk6FMZdU
	BvRojR6MvFzr6pdaOvKeGKwwWhD0W2qujWToqO8xTG5B8oO9VlZS320Vk8mMb6iQFmUAFSpFxRj
	lJirO72CWteLfQ7fdOmyaf8MN6ueTNWp4cXpvk+KovG8OOo7jBvUTTwCt/QYiVS5YyfWir4Uv/2
	YaWwG60vKio8cSMZMO52H52F8djuDE3KKlieHovh89pG0C8BA04AgomB3VivD667D7KfjJdjMFf
	BP8NMNMSH2DLrxVk8Mqbc1f27JLEy4IVHVBdRnKhmFTUk7+vS6dvnLNktP3xp9515jVqnKlHgLR
	kZn1AW5YbWZn2HL+tarEAGjq09bzgLXUnbwM54tLo+GRkjXijTDw==
X-Received: by 2002:a05:6122:829d:b0:575:56fe:574d with SMTP id 71dfb90a1353d-5bbbe67f9b4mr1227858e0c.12.1781690777922;
        Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb94f2ee64sm7195200e0c.11.2026.06.17.03.06.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6efdb6755f0so3124455137.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PAkfQn5q3hK+dBpx1/O79is9T079H7N/JcpLOJRMNVcdHwJY9uJTEtakV7dyELV+k4/LZpzdWxntb@vger.kernel.org
X-Received: by 2002:a05:6102:688f:b0:62f:3e1d:a55a with SMTP id
 ada2fe7eead31-7245cfe81c8mr1616278137.2.1781690777077; Wed, 17 Jun 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:06:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
X-Gm-Features: AVVi8Cets1-ArzRwsMw_T-p_ZzilvzmMs96iuC7Y-2iJnpSKywpmvUNNJpZxE04
Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
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

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> ---
> v2->v3:
> - In r9a09g077_cpg_lcdc_div_determine_rate() made use of
>   clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
