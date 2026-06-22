Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249353A9D99
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133366; cv=none; b=Ew2cqbfd1veewdPHIf9Aocpe/d6KOvRa4ptjQNBW+vdRS8GWW4mYhWwcxmlQV+CgWkLxM+xkdxaSIzTUI/n4bwqezh5W+0cuYfdDfqgNUeIgNMYD9IxOYXrxmIkycOFka8a3mLmKy7bZEHS1csTOGUUoRzjxWHc+ZgJ0hap5DQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133366; c=relaxed/simple;
	bh=vpZ9OKBxRaFankypZ6LbMStZQAMty0CYmOmvVJLTcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvjhifLz+1COS3r3pnovMuUZl/wV6sOn8M27Bahd0eQdA3RwhG4IMY8Xi17R/aH3M8db25vmkQX9at38RdJOYKLrKKPWo1g6QgBxutzyBd7xPRIthQiRq8NMwWLsSQiEK2YbEdDA5bPx2sMAip34BAchHOtRjYFl6z+2OogGItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so454464166b.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133363; x=1782738163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9wtzqvmTPlyh3hNxuU2x4nVM8ZntPzt7m+UykQwrGE=;
        b=X6vbgfRkT34mCM4Ch9TOn+FKmcxtfvHLbLtWM2YJNL0iypaCSiixEmLsqu2Lo8BBip
         xvP9El3dYYxIg4Uau+KpjHE50JvhTE/HrM890gFhB4Doezk6sRw8oZQLqUr8Kn0N2gaC
         X+IOBMBunx54vxSVpDcP9FX9REk5+cVic2zF3aV4voZwH0W2HIxor8WrRfs73Vk/nb12
         rVc+c3OCZPlNbPIbfFnGNqPa54KiqOqgy9pZCUpZaVIEIOZO0Si3/xM0uEuVzBYOMVpB
         LuQDIFHyioLa8du8NlzF9KB7QjQM3l/Yy4LU971YDBLwDrtzQSYffV+/fCb1CSUm1cV3
         w6bg==
X-Forwarded-Encrypted: i=1; AFNElJ91sWn+sr+lZQMWYCGUtDSCazfyGLNC5TJ9g3WuyjSzIHctqy5u3+hNFWX//F14a9L8iOKpgDDXAnkh@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdQW6JcPtosCmaWjG1+kXDZ5cTUz6DqIEyknE8Xs1soOmKq9n
	aqWtcEDl6oS7onJ3tts9tYOLw1HGZKRfRGr1eDJW+0y7W/imJ3ydYMFINrjBDWQCMaNm/A==
X-Gm-Gg: AfdE7cmwaQPZBSjXY3ddA/tnnrW6Vwh5/O31tor+5YztjIFVjCo27aE3lpQB5X7eh2v
	yUaD8sX84PtUQyw2xm8pEbIlpEDAYxm4PafgcZPz4Grz5YbSOMLgpZ4dOPTJktCG1NWNYGDDqaC
	DWCsvkYbvqYciPFaQvIZyqzZQhr/h9qz6ljlgfJMa7H1RWiD7ZbdPKqr044wbPQl/QrKqU3kCQE
	r+Sr/SyrZX/D+tkf8z4fPjGanpYn81wU0NZz8SW92fRcon7ubudMhlyVkxYU68c9yt2LKX74loC
	qMs6kxihkt9dwHmlFlHeK6aYeZ9awF9LiugOsGIPOB0MS6hDDr7LwrU+aWkZru7h3RragyGWviE
	0nzMU2L+LzTkxTZbqorQVJOd0Mi6Qc0h1UaBRkMiJAkgGqakss1YnSo04esAJBA2GSQQOaL6u2z
	q3jPXXbNNfNxpiNupvU0RMubn848aUY7e22EOFGhVkC9zZ7bMWZA==
X-Received: by 2002:a17:906:4fd4:b0:c06:58a5:c003 with SMTP id a640c23a62f3a-c097ae1a754mr746521866b.17.1782133363045;
        Mon, 22 Jun 2026 06:02:43 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e88sm360090866b.11.2026.06.22.06.02.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:02:42 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69690062350so3896859a12.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9C29VOLs6VZOJiM/KnRs0dqQsLj8sg1Ji9qq4N373h4kddeJc9Fe04Jh39RPiZtB2w5W1xZWxppSdF@vger.kernel.org
X-Received: by 2002:a05:6402:3548:b0:695:837d:529f with SMTP id
 4fb4d7f45d1cf-696e5221662mr7072149a12.20.1782133339417; Mon, 22 Jun 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
X-Gm-Features: AVVi8CfgIAfwOmCE6zZuFwVKPTX86BS9YPtcpPMAwipkZXEClLrZPjNAjwEsi_c
Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] clk: renesas: Extract RZ/V2H PLL calculation
 helpers into shared library
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
> Move the RZ/V2H PLL and divider parameter calculation helpers from
> rzv2h-cpg.c into a new reusable library.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig symbol and add
> rzv2h-cpg-lib.c to host the PLL parameter search algorithms currently
> implemented by rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars().
> Export the helpers as rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars() for use by other drivers.
>
> Update the public clock header to expose the new interfaces and provide
> compatibility aliases for the existing helper names, avoiding build
> breakage for current users while allowing future conversions to the new
> API.
>
> This prepares for reuse of the PLL and divider calculation logic by
> other Renesas clock drivers, including upcoming RZ/T2H and RZ/N2H CPG
> support, without duplicating the implementation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
