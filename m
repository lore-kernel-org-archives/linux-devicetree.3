Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396B3ED122
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382182; cv=none; b=t/tUJbZ2Ma8sf/qPXefUA/vg8d4xYUtEbb/h3DXPa1JfHRjn6dVy9Qyd5+LYxX5V6f+xK6eAiBGG7vMsHuAiKODWZ5Cir6XbU5rhbyGdZ4W1An4ua2CJQEaVgleP8/UKew4jGvRUEOjKjHOkzLqgeYQja4t2xikP5nU3fB+9fQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382182; c=relaxed/simple;
	bh=monmkM7gb21wo+8zqTXXwraI3buKDt+F0QM6dED3Cro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF+kM0q8uVB2BZAUp5ZhkFb7fEZ5895asRU3/gv0Q6kqu7vdanGrsnEltkNQxAsToZ6nBKFYkcXi3yr8cp+5/4xKrDm5u1p1ewh/OziV/QKRhl/yS2dy/syMDUN4mEtHGWjfb7RVYO2cPBrOI5Nmg4wP/hmMyushzyQgwMCs6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67893fba9c3so10473717a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382179; x=1777986979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKb4w8sEYs/FkHjZOB3gkPShePsdAuMuIqa1z3/FMfo=;
        b=rggQdo7zJag0wuM89BLhElwsymRLBAaLVKxsrUtNpSoQG4Zd6KbCzxrFjEzmUYlqyE
         jHG8uIyBd+Qrvtu0c5fJxE/4UzEO163GkP0Kj59/4aXR1WHBwNy0QuuxAcQcnhuvv/nr
         KnVApTqhXUzDz2pZmQdxzOOB2nKHYTkFbiSI33vLpn9M+4jfILoRyjn3lOhJ/3ru3dFf
         YsQNfjqZKYv8pAOmj6hvsSYbP6VvbI/Ewvug3Z2V1aHDKMpe84vvomnPj27IZ5AUckIT
         vX4WORVLJmVM2hdjm4z+W0wy7GGlxba8muifXMmQQo7XjLTqF+dWLvJs8vmtmowSDsMg
         sQaA==
X-Forwarded-Encrypted: i=1; AFNElJ8urXn/zAhZwYeWGExqlBUc4vnyWO2o8jXysoZskSPub4gv8kQWDUc5tcjXInK8lT+tjfhUPrap67sg@vger.kernel.org
X-Gm-Message-State: AOJu0YytMqg8qjpR1yABU/ldn3wGgULyOvN/TSHBnDpKM36z+IRaA020
	1JhCz5TOFaFBTv6CvOOwoEtXUtzeHBTro7/4t3eb59IDE9TYSnwFg/RO1Telz7RltvI=
X-Gm-Gg: AeBDietDdjua4woOFpJq0m9z8bm8qh5oGdRu3dWQ3pKIy7N3bduQEJ9sbvWZZqCUcVW
	4g0spCa1EhLM+WJ1X8Ygcx3aRWTmZNy48vUyx/Q7hzO4lKCdMQWlrMM6DIu/J59OoL7fwFvc12K
	6GxtvquetFmaYIlyn4vlGAudn0sejngS8gaYgK7GdWNC4zYeWAkyoUkuN50h3BhTtlCT8yUiCMK
	jf/Zn7bnNh+rFR8oVVJ2s78vP2wf5SzcppyRW9/6i4Ih/ArAuesA199ASz7fBUzs+xTUy8q+LLv
	Z30KEKSqdUMCak9/D+wATmgCBoHsZWay0m12J5294i6bblzQMLJwDNuHISg7FXpXXFcDw5ftksB
	mbsGQ4+N2oRnSICI73351pTN8RJN7LSV1ey7hutzSyh2DmtjzjMdkKf+6bjVX3weIZxW3nClyng
	b7cEH3w1vJPAgPmy21hh35VpMLjkOXPxBlNbakySacL5ouQYt5C4Gd4bvhqfKv4paTaIjyDhU=
X-Received: by 2002:a17:907:9720:b0:ba9:348b:b85e with SMTP id a640c23a62f3a-bb803974c8bmr205340466b.29.1777382178978;
        Tue, 28 Apr 2026 06:16:18 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c37ff67sm101947466b.60.2026.04.28.06.16.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:16:17 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1934805466b.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8T7TmXGdz6+A/qMQvbJI8TYbhBwje6+QTmwRzx5YzGJz6Eu5pGmmyt+R6uuYwJXPE9VJCqCP2ghGvi@vger.kernel.org
X-Received: by 2002:a17:907:98e:b0:b9c:1a5:acb4 with SMTP id
 a640c23a62f3a-bb804537566mr167279766b.45.1777382176315; Tue, 28 Apr 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:16:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
X-Gm-Features: AVHnY4JbgjbQ08KrMbRoT9ZVPhT2gDYodCeLz6_HhhBZr500c6s0xEMp8-01NFU
Message-ID: <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/G3L
> (R9A08G046) SoC. The RZ/G3L PFC is similar to the RZ/G3S SoC but has
> more pins.
>
> Also add header file similar to RZ/G3E and RZ/V2H as it has alpha
> numeric ports.
>
> Document renesas,clonech property for controlling clone channel
> control register located on SYSC IP block on RZ/G3L SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G3L family pinctrl bindings.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +#define __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/* RZG3L_Px = Offset address of PFC_P_mn  - 0x22 */
> +#define RZG3L_P2       2
> +#define RZG3L_P3       3
> +#define RZG3L_P4       4

GPIO P4x do not seem to exist, so drop this line?

> +#define RZG3L_P5       5
> +#define RZG3L_P6       6
> +#define RZG3L_P7       7
> +#define RZG3L_P8       8
> +#define RZG3L_PA       10
> +#define RZG3L_PB       11
> +#define RZG3L_PC       12
> +#define RZG3L_PD       13
> +#define RZG3L_PE       14
> +#define RZG3L_PF       15
> +#define RZG3L_PG       16
> +#define RZG3L_PH       17
> +#define RZG3L_PJ       19
> +#define RZG3L_PK       20
> +#define RZG3L_PL       21
> +#define RZG3L_PM       22
> +#define RZG3L_PS       28
> +
> +#define RZG3L_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(RZG3L_P##b, p, f)
> +#define RZG3L_GPIO(port, pin)          RZG2L_GPIO(RZG3L_P##port, pin)
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A08G046_PINCTRL_H__ */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
