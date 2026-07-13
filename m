Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C630567D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958055; cv=none; b=n/emyZzKlaYjfoMNe3X5sMWdotTR1keIiyfHysBAKkpGZmhIZml5joYS4Z98aFNB4DWsJlxPbBMlq234d6pW8qb5v9BfJEtZV8Ql2PEkCE6hLDPF9V+/jGZCBM+ytD3QSsjJ57RAu4JyR3U2dMUvh7eUc8Vwxm35MtWbu+erdtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958055; c=relaxed/simple;
	bh=m2bCXYj8AWrMF/1laWCVCT5bKqmKjFJ215Tf8K6H5u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWVvq9efJtKASRbJnoDWVNhL9YeVfatNZp3VG00TXG8QS3z1bUcNIV+0hnBP6EBfDVAzTfjNHm3JGW1j4IfpBa8ZHSYTj7HJDDBxMvfCxobtxXrODSgq/TXZhfzPYntReV+atZem1aJHh6ilycOin0G00qpfi6se1h4UNihqC7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso9953e0c.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958053; x=1784562853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzEerLqOaw9Z3GkpXKkc+Ohu/zTEKX/5jHpFuADj7Ho=;
        b=ansSnYSYpWWHmGJBq+3hYShgmSHfh4jsXFiDjowN9rPJA5IsbhA5k3sqx3gqsQfJX8
         8b1WyCV1d+4y6AWNOUah2yL38QsU+qtsZMn/5w2LlviUheKjjIdaKu0HWJxN+/BmXbUu
         RzuNGh4zLTMS17o+V1FZLeNtJfqmoy3Teq/5MpuHReKe+afUhMK573XfNG+mQ4RidWAz
         q5H/akN+xrrtRNvQ6Ev/euXj8ATWzOQez1qpXBd4bnw2V2djSv6iK3Z8CkR2v7NfFFmw
         07yVxutmR2Uy1wr3ApQcUexwJtXPDMm/wXVbZfb0SjkcNfF6Tt3XhwVvQNNw0c/ngqFx
         UTXg==
X-Forwarded-Encrypted: i=1; AHgh+RqQc7BTKgspt9N7NYyJVp0ZD/sMrAWf/sjy58fEui0g8ZvSeLuXWodxdW/MPzp2ZETZ99F0jOPVmKDY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvre7iKVEDIDaRriQdMX06MkWAxyHkBxKneYQmcVbqx0dtxIOJ
	MB9fvBpNJH2KSOjFnO4UYtvK/gKdJRUxO+hmZJhtAcfGb/xRveBSho72MOg0bf4uMVo=
X-Gm-Gg: AfdE7cnFBghyq5WxeUnf09LS0TccC5msFgfmx6fm9A1CNOgWrr9xXgfoBRPuPyBxvem
	PmKw417f+Q1jnOchNjZ/DGw2BH2qToZtY4WokSOKDTfjjaHsNKnGu9vuwDmFribY/+pDaPy2aIf
	UQNqQO77i7QfT9kyowuB2jnyRcsEILh1sJKv4C+NYN11ZlngeT5ZDtZymuoMsQ/Us99fdCPo+VD
	9X4L68xoe0i3hh6iyvN9ftnG9wpGDDbXRnhaRIbjWJd/b1SNxRsS6cCr8EnkDrIGYEX5tueXPzv
	JbU0o4W1c8oMnMPQHC/utRBhIRw8a/HvNg10KGcdpezkHAKbI+uJChlE98wLZEwPxrk1Myr/b6N
	SVsZJgBgmAUDgkAA7Drt17dPYFzwdWCq/Eyy/uetRYoP/qMbuc4h92SNjQYwvffz7K2ngdD4ly3
	PDfL5bYyz1+mg7Oc5/bzfyHvY3od391G1Ia9mlwG0F3haW1GwSJw==
X-Received: by 2002:a05:6122:8b17:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5bfc1dbda0emr5287277e0c.0.1783958052920;
        Mon, 13 Jul 2026 08:54:12 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfd0b319cesm3270844e0c.11.2026.07.13.08.54.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:54:09 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73a8ac9cd52so23065137.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRiild94j/80RE/Da9XPD9nkS1936oJiOOk8RBjdzKI2dQHh0EatNf3yF3E2r5etjW6DOAZF01uYRz@vger.kernel.org
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7450cb34f7dmr6282037137.18.1783958048566; Mon, 13 Jul 2026
 08:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
X-Gm-Features: AUfX_mxFOjb_ZRaEJnQ5ujkHKlta3EMpWEatCZQZcSke1bOSWzSUjDpkmkvLviw
Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as child
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x0000 ... 0x0008:
> +       case 0x1000 ... 0x1164:
> +       case 0x2000 ... 0x2024:
> +       case 0x2030 ... 0x2054:
> +       case 0x2060:
> +       case 0x3000 ... 0x300C:
> +       case 0x3100 ... 0x310C:
> +       case 0x4100:
> +       case 0x4200:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x000C:
> +       case 0x0034 ... 0x0038:
> +       case 0x0048 ... 0x007C:
> +       case 0x0100 ... 0x017C:
> +       case 0x0200 ... 0x027C:
> +       case 0x0308 ... 0x030C:
> +       case 0x0320 ... 0x037C:
> +       case 0x0480 ... 0x0484:
> +       case 0x0580 ... 0x0584:
> +       case 0x0680 ... 0x0684:
> +       case 0x0780 ... 0x0784:
> +       case 0x0880:
> +       case 0x0980 ... 0x098C:
> +       case 0x1100 ... 0x1118:
> +       case 0x1200 ... 0x1204:
> +       case 0x1400 ... 0x1484:
> +       case 0x1500 ... 0x1584:
> +       case 0x1600 ... 0x1680:
> +       case 0x1700 ... 0x1780:
> +       case 0x1800 ... 0x1884:
> +       case 0x1900 ... 0x1984:
> +       case 0x1A00 ... 0x1A84:
> +       case 0x1B00 ... 0x1B8C:
> +       case 0x1C00 ... 0x1C8C:
> +       case 0x1D00 ... 0x1D8C:
> +       case 0x3000:
> +       case 0x3010:
> +       case 0x3020:
> +       case 0x3030:
> +       case 0x4000:
> +       case 0x5008 ... 0x500C:
> +       case 0x5020 ... 0x503C:
> +       case 0x5100 ... 0x5114:
> +       case 0x6000:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}

This exposes a lot of dangerous registers.  Aren't they also exported
to userspace through drivers/base/regmap/regmap-debugfs.c?

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -178,6 +178,7 @@ struct cpg_mssr_info {
>
>         /* Callbacks */
>         int (*init)(struct device *dev);
> +       int (*sysc_init)(struct device *dev);

I would rather call it "late_init" or "post_init", as it might become
useful for other purposes, too.

>         struct clk *(*cpg_clk_register)(struct device *dev,
>                                         const struct cpg_core_clk *core,
>                                         const struct cpg_mssr_info *info,
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
