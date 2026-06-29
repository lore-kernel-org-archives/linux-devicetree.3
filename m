Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F690404BC0
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738206; cv=none; b=FE1wVMyVGiyH68YmGlLF/BPNYNkHsXl7nMFK7CpIm/VgF2okHgAMt8AeYCineRvaOTmjdn2pi3NoIeRkdTSps201jDjaq9EYIbFgg+rrI9RZH2XNuuAtJ2QspqHQ1koFfRlgOtu71zqtkNpbtVfdlfXXfS6IQpnU5R+gGhPONfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738206; c=relaxed/simple;
	bh=armCZ6kh6Mp+vil2b8961ACpmWrzy5c/C0CKvisFfuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRoSgkmLmr4YZEdWS1RaQTW2qa3sb1DFliTmqysWmwcOcb0u7gbWvT4l7BtDvKdhBJUlCOnlmn5r7Ngr9MwDnMH+327oXfwO8xzkLSKV11G0yx1rShg/cp068koyQHnvNIflXkQ18S4Z0b8fesSHP1eRZzIDnv5M+xQRW/KepAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so368041e0c.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738203; x=1783343003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da4qgY4Y4W5rhNhbnVcdDTNhOm56xWdt/s0F9hMNClU=;
        b=no2D4RB0aQFSr2uE5XZHo9iF2IkNx4i5AetjP+AXFnVQ3fiUReArD8AqwK870FSuTj
         WyJkZrdXb98xQRnz48n18dkDBWo8qCU4CXZBNaDVfJEX7Qair9WbshA/QIkwsQggAd0F
         fuos9bfh8cTbE4pvb19z3HB9pfVmNhjU10TEzJWBX12lt4F7Ws1F0BLMnCtHYeK3RAh7
         BwO35g1GxylPom8/ixrvIQduvpzDEHm3NrR+eJzCPghSxiO+Kw5DZ4secQ3hfibLgZF1
         MljfQgOedrfZYou2Z97LopNc6ViB0HNy2f8laeQlgGNnFzw4VXDqw21RkKe6U98oHsVt
         kkZA==
X-Forwarded-Encrypted: i=1; AHgh+RrmGrzNv7fsm1VyLdhFfZ+n40hiaOYK0MsXCGnC8SlHv+/u/k0uxtmG65NLgPGE9J151FnNdNqOox8n@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0SQAoHfD8pHkQ2b+sv+sOI9I75/+ImHI8AiSTgAgtUqZRND6
	3yEbuNHEKD8b9vvfEHkkUu+apZm17CgA5mkrD0J7BNaH+qR/+pLj4PC772RFGyDQ
X-Gm-Gg: AfdE7cmN3McMPhQOCqx1DCInjJBEksBTLO6wcw77ZZs2JJ1vHcIHXHrRNP8ouHb6SEv
	FK1j9A+Ifn7TI8lv0yyLKBVo90CUNBqZrc34FPMLpW8neSarpnmyZPAwn213em50YwNEn+fB9es
	mwMV19CwRGdyEr8jZ6LqoSfBxVWoRGee+f+UIIbCjxdj6lLOjTVIObzMD+dh6p6uXVDJ5TANxEr
	CXuOQPRkl6bJvuy2fpQVfWli1cvffKzPMaXmYLzDNiKIBxbtuxNEMnVtefqxcLrzr3STEOmIKKG
	hCwemOiG3gsU34XmZZv1i0N4M+8629L6HTb2UxaCFZh9oGSgn246t3YK5jjIsGQhMGUM5Yv1d2c
	uytolDfzvm1R6rr0PIMvREIdCMT3Juvw7ZOC0mqauFUQQUYAWF/PvqDUKG9LoX2nTl52HntGKBn
	PjDxT+GZ7KiqKXMWqCvKU9MdPEw+qL241hjs2sbaLJsadE4KOuqA==
X-Received: by 2002:a05:6122:d87:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-5bd69c31db8mr7775610e0c.2.1782738202980;
        Mon, 29 Jun 2026 06:03:22 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd933bd2e5sm3197047e0c.16.2026.06.29.06.03.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:03:22 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7383cdb7800so1085671137.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYrOlt4aTq6yYODKrVdwv8G0MdI+L29gXIu6AaOMUc2KkpbgTUd6N9B77w6iacMTV5LFz1gYZdbmvd@vger.kernel.org
X-Received: by 2002:a05:6102:548b:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-73915ff17dfmr1144006137.5.1782738201875; Mon, 29 Jun 2026
 06:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
X-Gm-Features: AVVi8CcTCI6PZ2e5KazbcFsddx5bajf7aRu5XT8XCn9fL0mHlzsF1MtV9Nok0Ls
Message-ID: <CAMuHMdV-OWEd732BpM1XSJiu+7d+ABGYpxYUe8OUSkVV5X2Wdg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Mon, 22 Jun 2026 at 19:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.
>
> These boards populate 8GB of DDR memory, which is exposed through two

GiB

> address ranges.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index 1f575ea23db4..a0e1e4b1f23d 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -30,6 +30,17 @@ chosen {
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       memory@c8000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */

MiB.

> +               reg = <0x0 0xc8000000 0x0 0x38000000>;
> +       };
> +
> +       memory@240000000 {
> +               device_type = "memory";
> +               reg = <0x2 0x40000000 0x1 0xc0000000>;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
