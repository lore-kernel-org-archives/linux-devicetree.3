Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E7440627
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155490; cv=none; b=IiCot4W4rK/1J208g7EUBmzdismALizMhWzzbDYF/gMBDuMDJ48tIZ1x7fOxAWo5wivgLJ1QyIeBtJIWAjNiisFVLYBj37cgF0rC5C5yNHuRTzU05UEmWakgxcp24zb6zorBssnJolUH31G4wLr0i6bg2bxjH/GTVMtMHqZmvwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155490; c=relaxed/simple;
	bh=giLw9ZC7rwC4GyqyRaXAh/5vOpDJdRZPgq8bl9w7pNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iS7SjytmNKIXGNc7xiO9aJuu3WF4zxmRbSRwV3pK2zgaY4yRuD4ghMSAPWSU3KcUGc+AG6Xh6AAKdqbQ7gbK0ejwCKV0e8y0Yvjn70el589lt4R5hi+kk6WjwEPcubHadKANpJ0vo78mLbW8d/mFI0zHcJ2HBkfCYAj+w3UYmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5059faso274641e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155488; x=1790760288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kx3tronudNhFXSg3haWqBf1SOxfgb2tJlD6OgG0oOzs=;
        b=T36v5fn74jgz0syR73k9QLA7fR9CVxsemkqaCCh8y1cE6t5bdZ6swkOauTnswYHPG/
         8/RXo4+MLMVWZvTpu4yPJtdA8CH4Rbvh9+r4sngqQeXuaWy4UCK/oGAgVYJrRZcx/qbs
         XCu+v96CQK3+6SKJiS7EnV/RXf9kWqgfkJ9d2uAZrnC1qauVqlactSueeNN4IASqVK92
         Y6UtdNNxm1rtlws+vFIIH4Y89e6wCBeT52Z+HKSpuheUal0HWejQxZ9nslV87Lhp5yUu
         XrYlJibFn7TYsbT/pHZlSQPDtVeGHo6Putk+YWP7IppaBzuO89fSoKCb5K3hOUsyEFDw
         E+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCtfYJAcbmhDWeVwXca5oIv0t8J0os0HghpDgSTY+g0szX7yJj3RlQ0KhFQTfJb/Qy7TjJIbQ2mk+s@vger.kernel.org
X-Gm-Message-State: AFuF++nI8xEFJ2bDPDagedQ1i5WXztynqbDpLqTjlDsorgC15s/tMnG0
	CTQszdeB9AYThI2EAOUzng7i2rTs1rmYgeglNdTAnviVyGgmALHbIP5kXK/LglmAUBM=
X-Gm-Gg: AYBFou2k7WOOKCuZ5bMldOx1MwylQ8iTzgcjGCbuDz/yHlhNWSfqnIfLoQeLFKQQtF0
	98X4LXYHvhiEkmtvmA5P5G0wq6DWMZH3zKsNmgNs0Pi9eiocCHHhl43WpsQO1Dw81klYWk3eWds
	2gqWh7wAvaN9nJa3FUyHm9Af83Hkh5BsySK44Bl7FLSYaxjsnmeoDr7ojRVJk4PXOjPLQ5kwDep
	7uUdHtcLh5WwV+8v+IBjqfCP7+5ud5HOW6oa7vZCtp7oFhI8JUzI2W4jbOXeCDPnnWuoE7vDKa5
	W9MHSrp1CBs/pFGH4vytAlmyNJStKAJFxO78/Wt17hyEMZdjr9lodaKMDQpuWTdtTLx+b1ql+m1
	nKWXpjTgM6TTaU1/YBZ1KX/Op7HtXoyBAhiMBRrqFsQ+6gixfBZGjjZdNvwHdLStnUuU0lVsiu+
	m4Nlf4brK4oLgSjUZsrMpR98Jdgcpm/R3vJG9l4gZ7YZ9e0EZhs9EGQB5Kt93Qlde0Xnwz6z/P3
	vrht50XJQ8bZo1qmkEaXoQcVA4I89pFbIw7OA==
X-Received: by 2002:a05:6122:3c4b:b0:5c9:c60e:3a45 with SMTP id 71dfb90a1353d-5c9f16b4cf0mr2308921e0c.23.1790155487737;
        Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c05b3sm2628127e0c.6.2026.09.23.02.24.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7dba0631so258643241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYv7RJpdWXr0Sda7S57MNQJZuXIhmvNZ3QNRaId0EkXwnWMOwgL0kqfWJkmNtZJF6Vdzjmr1WVwNNa@vger.kernel.org
X-Received: by 2002:a05:6102:3ec3:b0:7a7:ce1f:6b95 with SMTP id
 ada2fe7eead31-7ac1aad345cmr2119395137.2.1790155487273; Wed, 23 Sep 2026
 02:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:24:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
X-Gm-Features: AclHuK_vMjP-0WXG5Enu7q8Kh8Ojjt6gbc3hJeq0p0vSo9g7mG-PtYy2Hv7jehg
Message-ID: <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CANFD channel0 and channel1 on the SMARC carrier board.
>
> Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
> since it shares pins with the DPI interface. The CAN transceiver's
> standby GPIOs are conditionally wired up based on the carrier-board
> switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

> +
> +&can_transceiver {
> +       standby-gpios =
> +#if (!SW_DPI_EN) && (!SW_SD2_EN) && (SW_GPIO8_CAN0_STB)

Please revert the order of the SW_DPI_EN and SW_SD2_EN, to match the
signal flow order.

> +                       <&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
> +#else
> +                       <0>,
> +#endif
> +#if (!SW_SD2_EN) && (SW_GPIO9_CAN1_STB)

Missing check for !SW_DPI_EN?

> +                       <&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> +#else
> +                       <0>;
> +#endif
> +       status = "okay";
> +};
> +
>  &ehci0 {
>         dr_mode = "otg";
>         status = "okay";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
