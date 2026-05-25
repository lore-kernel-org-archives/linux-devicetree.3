Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F99134E754
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704499; cv=none; b=d9DPfYCMJeOCxvUCi/YIibbm0uojZ+sH3WNUVp7bOSkwmzmDeGc9xiBwrO1MEq3g2lEXf6Is6Pe4mpcIvGnXkNXuh0I3EK0KXhKtmPgMOehtcyfpzrPYiw4w6WGztTr7gXP1cfVVUWw4D9iK7WCyErIK4I0JNIPIUAM2o26edJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704499; c=relaxed/simple;
	bh=p0HvZ3sT7POUm4/0PI1XUJ7a2BU4q/k/Mg+JR9ylYyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6snKY0+Vp+qpvvIwcrp+rBTtdglyWKosJB+5qbAN2Wgvt7q2xnqyJjj0pRHrMIK68i9j/teTv3bG2zBE1A58WCM/05C2tsrXRHCqrRFI5Ek2riqvVqrXfm8aFQHrNg+Wqp7nNpyeFTavaG9E7gUOXVsKAv7buXTZAMF+NLzuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57747a2bf20so2860207e0c.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704497; x=1780309297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N8nwhp2ksCBATTBgDUrbzFAvExrUr7ic1VBwQK9ofc=;
        b=d1elFlThYGRUgNb8xwArz40aJqXQzjjZpdMRbtTHB5mPc7aUnmzk9ye9r0zxSCC0nr
         hdhPHFsjrM4ltScnuQ/WwonzVvrVEJhWJ6261TZQRVS5yYDEG0LWk9A+C+0OicLRjdgI
         1NaLVaLrSEGK4ZDaXLYkm6QPZoTdQOihZSr0Pn0Dp0pcf0keOO3F0q5DmKwhvUcl04OD
         5i/ZHKB9BfC5BY1p1UZM23MirBJ6AQzbTlvXPR6sOtBL5wUIQH6HPMxYhBWTf0vT9yiP
         ktPy94Baj5eYpDZXp2zpshvvjsglKviYRWnVGIRT6dLUDSB8TSrVSVdC8vwC3bQNxOTb
         Gc5w==
X-Forwarded-Encrypted: i=1; AFNElJ+hAtSI4Qz2W28u9KOrPOKVFmiWcs8pPtww+pFc6roZEKW02hJ3irCPoOL3O42qXWZpucM9Cke8qVFg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4GW2U6MPkPeRL3iGA3WRYwRYQAYrs0laHYeK2hcFvl+eRimS
	LJftLD7fV0GwptdRHN5Rbb3TFX8no4kjnsAj4PGWk9jBpdPzDFyNi2WxDLFaM8D7
X-Gm-Gg: Acq92OEXU8MZGDlHh2alef2e5+o7rhS+eRm9xto+yqsOMqeXp4YZQVibVLIpicPEnsN
	OHO9X0/l3FVWIzpRxABpu5NKAE9lJdI77mxhUg+JzpvllIQGN+XNbDbJF2QqnT6eEyVhsf8NNqm
	sxhq3pgjSg62yg1+BAmtkU6hcyvpczeGOByYq1d+4qSzfs1FcWMBVvMwqfehudGNteTRTYack1t
	cnETvSow5vo+AW8EnyKOfIZo5kh31t4c/vOf1Oz0hrjFlR1f5BmER1l9doD+lWu0FzuytUgGo6H
	lLAw9cqBim8IFgJjgdkRg74RjJxFyUa1wnWyv6+6WT4EScYXnTAa0e7FgK9BaLL2FSt+k4hpIfi
	UXamuCA7vFtjYBiIFo99exfGDFMgcRSftI1f+n1NIIdXQAGxTTiFd7jzSY6qjUQ445pCm1jchl7
	Vu9foDmOcjMjpDQQu9CE1oaRlrqEH00jBuaG2PRL5quTD67rQ6PxtN7THt3avKmDHf
X-Received: by 2002:a05:6102:689c:b0:604:f849:462e with SMTP id ada2fe7eead31-67c8e97905emr5636803137.25.1779704497332;
        Mon, 25 May 2026 03:21:37 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738430e3sm9495394241.5.2026.05.25.03.21.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:21:36 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575124e716fso3191628e0c.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/RjQd2K0Th8FRORAh9YhRVrvAxsguqJDfhItQQELJvUNaUzL4J21R/Q92fHIETedfHqjiiBNCmxTy9@vger.kernel.org
X-Received: by 2002:a05:6122:2215:b0:56c:ce8a:b07a with SMTP id
 71dfb90a1353d-58660d810c9mr6371489e0c.7.1779704495972; Mon, 25 May 2026
 03:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
 <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 May 2026 12:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
X-Gm-Features: AVHnY4JxX69tsdj1KyIPYumyrvTwDTMHhV4blwWLghLppzdyXfjGAG938kQSX7s
Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 19:20, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Drop pwm2 and pwm2_pins
>     - Follow KSZ9031RNX tSR for reset assert time,
>       FIGURE 7-5 Note 2 for reset post-deassert time
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Geist board with R-Car M3Le
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r8a779md.dtsi"
> +
> +/ {
> +       model = "Renesas Geist board based on r8a779md";
> +       compatible = "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";
> +
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif1;
> +               ethernet0 = &avb;
> +               mmc0 = &sdhi2;
> +               mmc1 = &sdhi0;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
> +               stdout-path = "serial0:115200n8";
> +       };

... with the chosen node moved to its final alphabetical sorting position.

> +
> +       audio_clkout: audio-clkout {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
