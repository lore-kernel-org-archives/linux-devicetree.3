Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D2C425CF2
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574386; cv=none; b=Lt7qhBe7CxAOVN+1faLcH/RGwRNrUImWUcgwyg5TanoguNU1Zq57CkRYy3LjYRWGCsmL3Lv1uSLOO9LSqNjNy/jNpE+nfMNTdXE+gJV9ZGiHN+w/Wg2LQxhzsH/Fgq3ucRUA+3BcqgYvyYPafCcg7r6kQTggDDCqlFjLaWhf8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574386; c=relaxed/simple;
	bh=ywQR6+si3be3C5PHwLaMuL1HKazcqbrmNysyvyYb15o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2jIlLYZVnjQohxhMCA5y1X4Kgogm1Xiq5S1fpB/6HxN2aOHFQVEnGAvTHpk/GEf48yG2SQYchMe63NtwhWL9PXB13hdw7yQ/M88CMcMeCf5bAzegDHvwm2Rxc2x+0bfa+H5tN6fjjDbcUkdCNkd5D/4uRPZJBkQJe6jSgAU7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-96358d0a024so468767241.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574382; x=1781179182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISCTVs8so3qeH2PLNzTEp9wspkUuH6UUbf7a9c+3AGw=;
        b=D3bQ29kdCmnYXzPfk6KUffyTu8H6IWvdJumx5swuqPUyo9+RzrIpnS6l3YhhcShMHt
         NPY94RqNigArYirHYrGx4a3b5BQfFnRaO7VTMZVUU1EL3W+UaAzLLrKLkjhzFhGXYPTC
         d0VNfMLA31a7mHGamrklKALiAeQo4we6jAonRfTsYc7V0IVUXRK07kDo4+AqWBwLERaI
         8f6v5lLMhBPbDqB3Tfj2+MDW+pNL2KaCs5bMrNW5eLEDpqLPzk7P2P6rsKhX0Jetw6c5
         +E+RWyUkLE9h8jVi6TZsh0Z2G74WR5Mg8lPPCoGK6VbhHpTVuH9PJTpYTAQRakPADHL6
         sC+w==
X-Forwarded-Encrypted: i=1; AFNElJ9+At2xXVLvRR2TmkxxLfRPWKrh6gQ33ZveYnwRU+MdFr/UCuV++kxaDunVf+UnRjjl4UPx4Ywh/Vfn@vger.kernel.org
X-Gm-Message-State: AOJu0YyktyYaKz4e90QrgVs+DCS/UnDaMRE3v+g5hYK/hyZLJKBGUxOy
	KcKXoVoJhJ5UFOEb5uC5iFty5ACNmw0/+HVsjesgjr9bgZU97l4SJqtzxM47wUgLWes=
X-Gm-Gg: Acq92OHgGUacFqr7yZu0bnu5XamVTQvzDjArriMFLpkfxxvC+3njnK3S7NimiQuVu8s
	cKkjERcU1gmfIMhF0HylM9tllpZha+2jiAYNA9hqmrZYmKYKl97wQEwfKIjmR+w+qawNUfuhSva
	pASjL1m0vxJaKjidry4KWoja8u7IAdyKwejvb41eN7cbcZEAGTJsYqGjeZwoBLWT+Dlh3Bvy7nm
	83cWDmwYUZ7rX978lOVVzrjkz/sySuonqnzREDcPYqBqat24m66Q8cBDplqhKEktKB+6oXqQ+LR
	ovG5yYo8vbdot/HwbZgQ3HQw4+NF0K41p0MuVB+FtiAm95eHLMkiiVhrqglVIh2Zv3kIF2gXrlg
	rqFqzcrh67XUhY+yp3zH1Yc8PiECFwRqsL7pXaGuocSD27SLJ/HgtQfK5goJ2AtMwE0fTSCr18a
	mcVExCjESF88SEgdI9oEA5L4FlqndObkK1fjOsuHB5VkQVunNnAkrCFtgsYn0CDa4RxvVn8YMr6
	zgHYYkX0Q==
X-Received: by 2002:a05:6102:94f:b0:633:d7ec:153c with SMTP id ada2fe7eead31-6ec2b17bcccmr5254334137.3.1780574382557;
        Thu, 04 Jun 2026 04:59:42 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5745d325sm4847415137.4.2026.06.04.04.59.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:59:42 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6ca94e539f9so401880137.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v/CdgRzAWyhwQGy4SZOSdB4s7ZasXrifqSGyo0Nre/fKXxsCs41rOkVYNdnb5DJ2AYWtPOQpf6k4M@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:631:4c79:b1d2 with SMTP id
 ada2fe7eead31-6ec4b271de0mr4360203137.25.1780574378638; Thu, 04 Jun 2026
 04:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:59:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
X-Gm-Features: AVVi8CcbcHPVoG2RyTFJmvI5Pqu_feKTjza5L3FARlzu4TpWPjIkF65Jen6BRfI
Message-ID: <CAMuHMdXHFZrsdEm1D18oGTwZ0jZ15e40eo5KH1RELfUxaa5E4w@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Model the optional external audio clock inputs as CPG input clocks for
> RZ/V2H family SoCs (RZ/V2H, RZ/V2N, RZ/G3E), allowing the Audio Clock
> Generator (ADG) to derive internal audio clocks from these external
> sources.
>
> The clock frequencies are board-specific and must be overridden in the
> board DTS files.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop the audio_clka fixed-clock node from the RZ/V2H family DTSIs,
>    and drop its reference from the pinctrl clocks and clock-names
>    lists, consistent with dropping the AUDIO_CLKA input from the
>    binding and the CPG driver (patches 1 and 2).
>  - Reword the commit message accordingly.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -14,6 +14,20 @@ / {
>         #size-cells = <2>;
>         interrupt-parent = <&gic>;
>
> +       audio_clkb: audio-clkb {

audio-b-clk, to follow node name recommendations.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clkc: audio-clkc {

audio-c-clk

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
>         audio_extal_clk: audio-clk {

I will move the two nodes down while applying, as "audio" sorts before
"audio-b" and "audio-c".

>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
