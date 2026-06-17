Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA763AFCFA
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680190; cv=none; b=MMWttxJnla7ey/TDNcc20B1EGmy7ioK0R5t1rk0acxQGZEQUb02IiwDF3a1kVTpkuLPwsgIQSBos5bui/VzJ8kzJe03e0wRFGx99y/MdeuHS4E+s2ukFAl1Pt/jBsYTbNNmpW3FZnsusEWVM242AmL+MKlb8w3Gg9Ow3i6vnIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680190; c=relaxed/simple;
	bh=iVrtPWbggK31kf+NMVcxt/bIB/zBj/D8Klfi+iYlymo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7olN4SOcK0S1xL1JQrFPzLTQknZ7zph9z7trykVwmwzvwQJ/KwU0S2jUo8/pxIuGff4hmNtKjhQVCRXLzImrPWVUGrEkBQVBTRCjlZEFPly6N+BtWBu0nkQAJL/tm+T5Ypb/LRotEXRx9cwcvDrKXdBizpktSf4pJEeyE29Y9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso1618950241.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680187; x=1782284987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdX/1r/VC5gVdSWCvpldxzdbyoom7W8WRGEDFlCTq6c=;
        b=AlKHuP0eOWoMZT+QupUumjo0y+u09rKe6neaA8lrpKCLFz1rPqLQ4sF8OR8TjnrPyH
         uDOSITgvxFUGy6eY1oPlAfHJPe4pamK73cWoHjwkj014iyNzJa3B0/A9gGjhEd3xVgEU
         9ZSBusCootNAiJV9GSeORMvIRx5qkL1F6jMel9RfuyEgnfKS5+N/ZIG/7xduoBMyW4Vs
         x8trj/pSY4WYPEttVvQfxNJAuQUWU6CZ9TkYuj5Cep+/yDzrmSnMtocSbrhLCXLkvRCY
         aNHy+ipVswI5bqhPMeJAGbBp6m6WP5BIu+hoxXHw2msHd3NEbBZBdiWvLfwT/gViJE5A
         cebw==
X-Forwarded-Encrypted: i=1; AFNElJ8xnKcwOcdRHe1oof4CPBw7NtxLlUaAEuB45yrnrkm2R9XMhN+KvKgy8UphPNX5nmvWkaEBag7LqJX8@vger.kernel.org
X-Gm-Message-State: AOJu0YwaREj+HXok4KY8n1S1VMFxQs1EqnTswJMOlOVgaew8xtBInHqU
	MRCiiNgwIARdRkNFkUWmBhYthrLGReEByNBlk55Nsr0WHlZ8qViA5f6V8mwmzHSX
X-Gm-Gg: Acq92OGX5x5scJzUdZIev1M+x6CHdUahSZdxpFk/uTi3jnftXm7JzpM/gI9OiGRy24l
	Y+uoOLpmt8OMAoEhOPuhl5d0dofUtGfqc2eg/M3od3fro3iUpsHhugEManvc3c7TIXUgsKDfwP9
	cZeAzvZpYgVwOjLOxX+uNbsLrxKJa82YodnlJhWSIDf5oCX+sScrmKMQiN2pbQplDKbk63Z0g2G
	vmRyXlDNsXviNt7Pzr65uAjr4CYWGupXodRs+a07jsZ/S+hNyURnWZAnDGnS/dAjpbZ3D98IUGl
	3bZd5mSnJypUiHMt8SsFi4SS2MkXyRg//w+YQIeU/jpQzUULIE54y3blg/Lg5TK1nekXzrN1bdz
	6mKmjEppp0wmYa2YtqPtGi9QKq2T2cjkxMq3+mkaNOKoeOJiStJMoYz5t0Q9jRWwHlRUB7GSihx
	vv1whCVX+m2FMzBFkV+g4U1YVltjD5VJRorHkHWuaSD9ClfBPI+A==
X-Received: by 2002:a05:6122:2094:b0:5a0:c38e:61a6 with SMTP id 71dfb90a1353d-5bbbe62518amr1334338e0c.8.1781680187189;
        Wed, 17 Jun 2026 00:09:47 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901f2d7bsm7763620e0c.17.2026.06.17.00.09.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:09:46 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c7e8c9f612so1672953137.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:09:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9zq6WwG7WPDomH3f9V5YiDqp77o0psSww6uD5C6lfgaf0faE0kcBgaiMQIWJjvqIf/mYl3RfK1u+zo@vger.kernel.org
X-Received: by 2002:a05:6102:8386:20b0:631:e729:4575 with SMTP id
 ada2fe7eead31-7245cec45e5mr949237137.5.1781680186567; Wed, 17 Jun 2026
 00:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org> <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:09:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4irFbaHbMK6oTTjowYmtlzx-ojJFWgXAHjFGSCYVJj8Ydp7M37Z78yvQ
Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> common for many ARM GICv3 implementations. Therefore, add an extra
> of_machine_is_compatible() check.
>
> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>         return true;
>  }
>
> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
> +{
> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
> +           !of_machine_is_compatible("renesas,r8a779g0") &&
> +           !of_machine_is_compatible("renesas,r8a779h0"))

of_machine_compatible_match() with an array of strings might generate
smaller code (I didn't check if 3 entries is enough to trip the balance).

> +               return false;
> +
> +       gfp_flags_quirk |= GFP_DMA32;
> +
> +       return true;
> +}
> +
>  static const struct gic_quirk its_quirks[] = {
>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
