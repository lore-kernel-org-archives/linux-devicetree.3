Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC13AC0ED
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133188; cv=none; b=eAdxrKkA4OIDhxI0vWVq2OHxYqnHqhi9RqAE/sQz+oqv+gicbI3BgjpRhneHPpMw63zZGkgR2jCPsfFJDePzMDABoLrNEU/HSwT26sHe0izG2JBT5rFpw11Fqwcnrn9W/i6X52FqzYnPyKWfd/FV0mCfCayihnjrWRJLiiuOaoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133188; c=relaxed/simple;
	bh=SM9VHBXV6TBGOikkFpTdL1XsyNkeAn7us1yu5cqpdvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXae840FxVccfqQnS6og9Vy4ulY42hTzDrzBmtO8qSohtF9dLjkmOO9CeIbtSrlhk7MvdgAr2qatp3us2Mn3BZBukWaYcUAdgyy0KerJ3/ob9/qrTRWma4RE/sg82SlMlskWE3V3LYrZMwxX3bXyEN1o3oqwyRmEnxlLoRYcQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1668948e0c.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133186; x=1782737986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WkmFP8EgfTBK7Rgts2GV0gt8NlsFBfLpTTFR4+sUd8=;
        b=VZCNOQlicXwZN1AT2QA8jl/eKvCQFebCM0Tizy69yaEmDcJFFD5/27OEGI6aZ8p0NK
         KK5y6fTFgtnuErk09K05+rieBM4jekhgSCH5uVZhGMezxscz/Vk2uD3+fe+YL0jkO/B/
         2bSaBr6WrohWFb1YFommGZIuxXuzIirHAlin+hhvriHQcVW0eznHLKMO6+3MPtJwaFTE
         6xI5vouE8161tfF3Pd2HZeh1HvMk9BPR6semrL0G2eJc9pouYLCKQIhkBH5lSRCNU9pH
         j6g7erIfcAzo3FEzAID1DlPVlYLnrWgC+YthRo1hIZID0KIe/tYoBt2VI7/wSzhJ0EBU
         ozrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ig4trXiBdRc5FC/NxMQ0riUtXjsOo/Mun5Xqlu/Ml7moCW+ayqDG0rkXBTcB047ddQ6mk+uf6rLdF@vger.kernel.org
X-Gm-Message-State: AOJu0YyKFcXtWE3dVyJ5KMs+Qnnv5UzjDJlKAl5IiJI9vrMK2C/8Dyae
	3TBb8CE6CcI8q5z1QQjp5MAIwzRAS4nKjey/P/taYgU5LGfxZzTeOv73AkInsZuV
X-Gm-Gg: AfdE7ck3WFhBTKnf7z2Lx0hearLcqRbUvsyQKotiwzN8zVYIaNsJ1RTgDVozi/VPiud
	fzNYo8kyGs0uu7auucy9qdbAq8nGN3JDfhbpQ8OSa/Gs7FiCXunjYQrr7uQ/d19laDI2eSqI4JQ
	0V3QSP06jJWh2+z3oEpYyYaOsp2CYto5H0jTZ3v+v8vkMAG2QN5nfZRgm7YOqW16JpTy/wopptU
	JOBN8m85nwrxp1uW7aOG/JteQtuvnZtEzyJxGiRkt+fImxvRZQMndFauKf7D51VWP06wUw4uSjz
	LXPmT8TqnuEZUHAn8pABzNVAFJ8M84iGglEcAKr2VGDo5q4bNHmjP+nrbXOsTIbIAQ+kKyDbEfQ
	FCdbNLYBZLxWi9uYTmFI1j5mzJP+8hLJhiDyKIhWFaq/FTLqTZ1jv3JWWVQz+TnCy6E6f0lLPUi
	gqpELJvIpNhC7aXm7ETGLZ5iDf0tLqiX6prsrbF05DjKBjx7F1CQ==
X-Received: by 2002:a05:6122:4b8c:b0:575:360e:600a with SMTP id 71dfb90a1353d-5bbee661f09mr5532599e0c.8.1782133185853;
        Mon, 22 Jun 2026 05:59:45 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba4a086sm6379524e0c.11.2026.06.22.05.59.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:59:44 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966d4da9fa6so909554241.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SrHiLBsHkbsPSWO823If74dLDSw9pvRJcul3iscO9IgxlBpqa9IveZ/sPiFygHMEHu8wX53wqnNtR@vger.kernel.org
X-Received: by 2002:a05:6102:1621:b0:728:3f9a:897d with SMTP id
 ada2fe7eead31-72a791ced61mr6106327137.27.1782133184732; Mon, 22 Jun 2026
 05:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 14:59:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
X-Gm-Features: AVVi8CdvOYFyC2YUihLVLYtBBghtLclJxlI0ynR5jdq3sSBLsDEr397xBO2_96g
Message-ID: <CAMuHMdXWEmc8ihrAqBKc1E411mHk80t5ky6e4zvKPGwa2s0vtg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
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

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> Add an input_fref member to struct rzv2h_pll_limits. In the core
> calculation helper rzv2h_get_pll_pars(), derive the base input clock
> rate from limits->input_fref, utilizing the conditional ternary operator
> to fall back to 24MHz if the struct field is left uninitialized (0),
> and drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
>
> This abstraction permits the reuse of the common PLL divider logic on
> newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL reference
> clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> disrupting existing platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - Fixed MHz to Hz for input_fref in the doc comment for
>   struct rzv2h_pll_limits.
> - Added RB tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
