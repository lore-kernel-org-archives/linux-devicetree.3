Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBB4A0143
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534174; cv=none; b=bQMvaq7bFWyK6WtlIAJJgr46Swl3U3Z6SX1bYRFa8L32X0F+jaJlovt7FxIixieKTXdpnNOsLDj7Aw/KuvZTzJhFQNylyFc0hnKtHoc2Pi+q9k0of7ZvvSjlh7TwOmlghIVgrHnh9CE/jcQiQ6iPQ+qT2eXg87lV0rXA5Y/UAcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534174; c=relaxed/simple;
	bh=OVpDaLi1lD+Takpp4uvA66C8HI92i7f0cSJulK2KE6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M44EYLUdF85TVDYo8P/cQWqTSobwRA/jVguD3tjLyjli3y/rnLodMFzYKrzKj6cUpBklSVKhvveAEL9YGXTpptqp2zHfRHRiOiE59RTHs2QiCcsXhQ7ffREFJQdEPzMNWDY8B0PBUtNVex9IGgIr8Vz3yKiEbmbSNPZJzoFofck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c65093556aso901248e0c.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534172; x=1789138972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qjft24L+Kray3Ujvp0X5j4rTQSYixQ6JGAbX73Xi0TU=;
        b=bznat4CqEx4lS8HuCiUAR/TCDPezsvaMuWkMnCdlxblmF9iAbhX/o7xic6G7NlDuff
         rV1Fh8yULAmIVdRrII7Ho/dMgM/WdaV+kqy76cBQlD4LPA/aAwqTrtVT1NLhhbCv6UJs
         QWSo7FijUHwzvqV9RjCGwcYANiYwZ5ca+l7MW7kf1GQFWgXDE3tFecvfv8DcMjZcPZ5X
         P4e2QqZAVwNqr6i+31Q5sW4OTaZ8uQzD1OvHjJY6jl0wGqrX8b7zjIq28J6Hwiv6ACWB
         s7w+lgmM9mzssDTUT/ViGjELare2S865AOx99N2y0KdGGdirzmllAz1XMmGTdbk+B/qC
         wqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxInoTYUR2aIYs/qd7EOoqYDRiTrBS+Tj38u9GSAsXJSyej5sUBcx0N3JpgxTyCfunHYpHO3zEYsFdN@vger.kernel.org
X-Gm-Message-State: AFuF++lQUnNmUhhLm4x1T4EQfsMfHGttg4CqjmahuMXIp6CCx2ECMdMd
	RGpKmMZJao5B7j5uNfLY5efVIC0M3vPCuDiZO37W1GYHnd3he5CuM4kaOMzkrC/Y
X-Gm-Gg: AYBFou1lBBZ/jEgWnycTPlvHvoVLZNrvrK6Vol5VgwjYGkBcZFDj9qcgdZvT/G5O+d8
	4ga2xocgGgZnrzTJ4SF8VhG8tzslw1lF33CBgNVJ13o1jKSFt2DCdYDFIA8NEMnfIzsbaQypJTU
	QVN7dGzbeGPuDKVtIqmatMn+M4Fv3nz0ewK1iTxpF0IAQByVLJxOFcsedCKllBOsDw2YaawbZwI
	sDxmwcV9oci4I+Awnqg/49urtaLNCD5wfsVC78w30VFS5+tsBKa9eA9KwQVV02puPbjMSFgRf/O
	XtpFduk2GnZuwdbQwAgsTLXmlYnrw5u6MNRj9wE7jyIxmqGbbifMWVBqQZqu6yLDtkIOFAqFcUQ
	xZK5iaYM85xhtTuUHovIxRvg4xyB9ktHxYS7OIJA6qB9NhY/iuTybYLsq4apfDsoHim8gat0kOs
	ALrLwojt3Y2toYi9JfIT7EVYMEjs8ZITEVzX9Uws9MCx5GxiWa6QcJwLv+ihfEXZuJ60CDrLgD4
	cfVWqxaSwGxwHVq83d4loqZGDEZIQ==
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a4femr3375831e0c.7.1788534171583;
        Fri, 04 Sep 2026 08:02:51 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ebb37fdsm1800877241.1.2026.09.04.08.02.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:02:49 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1123112e0c.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzB37V+GDW9cnv2UBzmB9Fw4QwbRbFGxPPWZWZVb5DdtsxutgwOwNpozjfs5h0G0VUiUOCQr9EkamQG@vger.kernel.org
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c7ed81a4femr3374662e0c.7.1788534167484; Fri, 04 Sep 2026
 08:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:02:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
X-Gm-Features: AcwNN1XqgKT4w_HXWtn4Y9fm8kvbc5sNYhBHCQ08jgA0R_r3KSaIYmzU-ZXgbgE
Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a774a3-sysc.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2M v3.0 System Controller
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a774a3-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a774a3_areas[] __initconst = {
> +       { "always-on",     0, 0, R8A774A3_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",  0x1c0, 0, R8A774A3_PD_CA57_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",  0x80, 0, R8A774A3_PD_CA57_CPU0, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",  0x80, 1, R8A774A3_PD_CA57_CPU1, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR},

Please add a space before the closing curly brace.

> +       { "ca53-scu",  0x140, 0, R8A774A3_PD_CA53_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca53-cpu0", 0x200, 0, R8A774A3_PD_CA53_CPU0, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu1", 0x200, 1, R8A774A3_PD_CA53_CPU1, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu2", 0x200, 2, R8A774A3_PD_CA53_CPU2, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu3", 0x200, 3, R8A774A3_PD_CA53_CPU3, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "a3vc",      0x380, 0, R8A774A3_PD_A3VC, R8A774A3_PD_ALWAYS_ON },
> +       { "a2vc1",     0x3c0, 1, R8A774A3_PD_A2VC1, R8A774A3_PD_A3VC },
> +       { "3dg-a",     0x100, 0, R8A774A3_PD_3DG_A, R8A774A3_PD_ALWAYS_ON },
> +       { "3dg-b",     0x100, 1, R8A774A3_PD_3DG_B, R8A774A3_PD_3DG_A },
> +};

For the content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
