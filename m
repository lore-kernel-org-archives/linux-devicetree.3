Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA824BBF0
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457425; cv=none; b=B4S7hK2orToyhLXqNlDbmYh50uDZ/u6xRcff8mtbAsXemLD4URA7J7WD1EpL3Ti+NqE/fBOormtppdwUKZgMojYAakxdEmIY1Qg5wMIWIYmBKqX9y2XZy7PTFNj7ZG6UqNya+M3eGfGzrjXMGLEWReWSayf1AGg1KF5aVzM1nYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457425; c=relaxed/simple;
	bh=a58EuFGZxQ5yCYnA9qrvXyLI+dMZJByadlX6j/LFqVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBPj4vqb7Tq21BRmfY/FKcYwajPcAjUvjk4d0OP85wzFVxyfKmqqaYcdYT2WK29giyx0L9gwacpNO4DMUYRx9+h1TqAGEKnS/l12kieOjb0Tu096zFGOyv3o7Rg0l91nIH6xAWokXBMSDmooACMwxHg/gjnYovhOR9oASrDLru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so6615674241.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457423; x=1778062223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=;
        b=ZKAA5Vy6SZn0t/r8Ruzk0VE9dAiZVca/MFIQQ+mNSzvQx8MAq7aKwLjWGiPU7B3PR1
         o1lOBIFjYUZoXhAanRHt/jqaYKIioskjJCGS30wi8aZA0oy0fJX0Cs0gUPJcRK8FCjaX
         72wCH2EPJQBiOsK/reyFyId4dg7mIBWy7D9ZZZ5UScQ5MRXN8jrAO9hDZoJFm3uf8F33
         LLdLsd8uMLIBAchZ0nbbWIaTns6SyRJCCJiHBHzPnpDlrcz9bnnhs6rvAIRwV0RB51qx
         QsxXHq/z4/ctTteLu0oQrfiij4LHHC0fpo6bBf6K6OWINIwTADQdaRX3/F9BN0XqXABC
         89oA==
X-Forwarded-Encrypted: i=1; AFNElJ8IYE+yXkC4LabgArF+Rd9i62mFNcAS/jIv7ZJiSh118A+sEAhEsDJuwzSTohQxpTx/Lcr0v3Tjp6Fd@vger.kernel.org
X-Gm-Message-State: AOJu0YwblZUozFaMSZoIEjPa2EU4nnQfItOLku08MkfZJNTQq/FAvsD0
	KoLxLjDvvbD7dQqmQ+4AQ4svjCucWnUYMDPjwV8x1CGqzO2iLNl3+pDwlVossHG3PB4=
X-Gm-Gg: AeBDiev4mXtAJHACYwLJHh1fdIHf0ay39Yp29N6F8TmMEZFk1WnYdWNVVsv09tjrzkD
	AqNeSRk6L18IJwGx+H0To1sqOXgTyUGnInaUE5OJTtCu+Z7poJlztbZ6Y340M39s4PXkbXg+5Nh
	wrcS855QuUiq6v4A+Sz+pRk5pqhQNXqcwoj5Itc7oj3xHAzU/WwDkZn4W+bIF68okk6LgeU+UnI
	BfFxevstF0dbvWVFDrxuC/NNySlCPuZ7mHCnB4rpOmgFcMfZBa9ysdKT/JB1A9YqaDH2SMaub1S
	GSd5iKfvNPFG8kaFtLH4CGAo9yz4M3nQrDxKf2S5N0qJB8XKc/tbQwHZFUnV3ZftiKr+AX266IL
	EOTLTN9VTelQxLBR7n/QxbmPb/3/1FtXFWAr+IYRGKRIN5ElsN6ymZyiz5zbDJaAMJRkh5H/PZD
	9oaqUgDzdeFerD0vnlEQnynILuMAHfd9joHMlgJ/pRMe0eL10MlB10KpWYhhY29bKLpmDjVZ4AI
	Vqdjj+6xw==
X-Received: by 2002:a05:6102:cd1:b0:611:3bcb:aef6 with SMTP id ada2fe7eead31-628059b1625mr3421462137.0.1777457423437;
        Wed, 29 Apr 2026 03:10:23 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629843365e9sm766699137.7.2026.04.29.03.10.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:10:22 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-61316792e42so6997434137.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8F8j81ob2m2j1+JjUwJb1Fq8z+LLlj9XUYP2zECrlsys7ML0jWB3yJ5lTP0/1QnSGkNQ/hE4OCDHmK@vger.kernel.org
X-Received: by 2002:a05:6102:5808:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6280a4a8859mr3233756137.16.1777457422707; Wed, 29 Apr 2026
 03:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 12:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
X-Gm-Features: AVHnY4JG2nQR3icySEfGRtnnQzDT9zHNQTQkbpTpvtHZyLM3-S0niXuSWkJz0jc
Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
> similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
> not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>         .dsi_clk_mask = BIT(0),
>  };
>
> +static const struct rcar_du_device_info rcar_du_r8a779md_info = {

Assuming for this review we do need a new compatible value...

> +       .gen = 3,
> +       .features = RCAR_DU_FEATURE_CRTC_IRQ
> +                 | RCAR_DU_FEATURE_CRTC_CLOCK
> +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> +                 | RCAR_DU_FEATURE_INTERLACED
> +                 | RCAR_DU_FEATURE_TVM_SYNC,
> +       .channels_mask = BIT(1) | BIT(0),

 "BIT(3) | BIT(0)", given R-Car M3Le dropped DU1, not DU3?

> +       .routes = {
> +               /* R8A779MD has one RGB output and one LVDS output. */
> +               [RCAR_DU_OUTPUT_DPAD0] = {
> +                       .possible_crtcs = BIT(1),
> +                       .port = 0,
> +               },
> +               [RCAR_DU_OUTPUT_LVDS0] = {
> +                       .possible_crtcs = BIT(0),
> +                       .port = 2,
> +               },
> +       },
> +       .num_lvds = 1,
> +       .num_rpf = 5,
> +       .dpll_mask = BIT(1),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>         { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>         { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },

I also don't know where "M3Le does not support 4K output." (which is
a VSP2 limitation) is to be handled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
