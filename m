Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7141D12B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668570; cv=none; b=szEM7ydaEyxePMEXsGweiMMRxxLT2ttgIMEQIro32FF4IRTI4mbvvmHO1wWAi+XhSWHIZknbF1usQlNd2v307cK5KMjSD83d5ekhqvMUNVhEceqR7VCcp1Ayn45/k1X5sZ8eAzotlBltZa5zQDYK/fW7hz3GPENJqFWrmc9wt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668570; c=relaxed/simple;
	bh=SCzinYuXLvjSrigmXaPRDipldJ+Qb902vZtP+PB/9Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LL+wGlJ6xJJ4UjU8nOURuEAajT8HDFj9V59N02VpMx3cpmhcejoLX+BemqSReCbCb4sxlYXqtEn+lM1HAEnLEkTnej4idhZRdqb9wd8k4XwZMQAe0AFsxKySziEBqo4WNf1zZcCoysxOcyHzzOtMl7JXmElZJFPvPzHsNFaUG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfaa014978so2131357e0c.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668563; x=1788273363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/BSqxIsytWuTzQX94wx9xNgvPdt0/g546s6RHG6Obs=;
        b=pzSLjYVMTvXZhLgBBqIrhmfeliY9wBWt7497uHGIGCqydgcVpmeDeRdzm9B6rgO+oT
         kZzOls3AwIOkAL+6u552nGGMNew6IMVmJcDch/M05DvUBpvTzd606OqxmdVJYXGbi0pE
         alo2ssJ0td+1vigvl0gm4Q/LxLKDmRmc2x2HKnKRSw2oQPYzuuvWWTErrRKL9nMYWzoR
         ARWzMH9V3Oc6mp+vlQPyfCKgJ+wMTGQGn9FiOI6/5EmFKL8g3YBUQuVscCmGneY2OMXY
         0v0vopZn4pDzdclEO6ZUBlZaXFOm7g6LOie0bA7o5nUKQ11hm09oORT8w1V1hDSeHhlS
         55eA==
X-Forwarded-Encrypted: i=1; AHgh+RomdttEJ55GBw7fclXk/1z9YoDr4wZ3GR4sn1OFbxEp01Ki5CaG9Le10FML+/4uHSZUiHLsjKYww/TF@vger.kernel.org
X-Gm-Message-State: AFuF++llQNDALU+ULzVcHxLPTOv2SRfPM+8m0i2tJb1xzyvN6OVeY19V
	lN09VCVwSbPLNxqeccYdDyKEZeKP0DWAQZoRwrfNP9Uo/lcrBELXp30W+XEgIterv7g=
X-Gm-Gg: AR+sD13HmD17PDRDR1x7jRAvdzwd/nx+ZO2DxSeRE709o3g5Xtd5wBIjMfyObcIi4+l
	k52M8+rEQDvT25XyxxBNaZjqn4X+TEF5V3s/zsMLn3c+D46M7/LctunjVtfPB3JFpFIlMSE3R/a
	WWJcnaIWEFAHDeCpnf3yhLs1EltYf4iU3ddsLMgZvSGK7vj9Y/LM2Yf0S0hpM2seKP8AmMhqQy8
	GAihsWaquETgxqpkY9vtIWnTbx6a2inhCXC08yMhadADq1RyL4ACTOiIOYgEOOrcZV6Y9zspcqf
	gi/BaSOUQws9/sns2j2y7O3sXYr3SbxfN0FrbU0R/eU9av45UZE4e2oebsxNnTz57HY8JPD6B/7
	r7G9gx658T0EAICFFY+/8hstncrPwZPGAgzwwgbrOPZQPThYo2ktDNmR9jW5gVEXhZl46TjV9j3
	Twzus0poRjFzFnGzu+wMqGm8bYNMGGtbLHQeF1/6DN8XB17Bgo1JGcoTEyxUGDbdnahuZa9I5Sc
	8FyI+c720K2ULUmEgINIShhs+t4iQ==
X-Received: by 2002:a05:6122:1310:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c5ff877797mr12768080e0c.8.1787668563422;
        Tue, 25 Aug 2026 07:36:03 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cb3970361sm1122118241.5.2026.08.25.07.36.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:01 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1968817e0c.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rptce9WVC+Oq24FX1kMsGEhAO8duKZk41yJX9qwNEDPgFeap7+66qD6VNNLAeqHE3fbv9It7Lx0v23R@vger.kernel.org
X-Received: by 2002:a05:6102:2b88:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-77a63f32c5dmr11778556137.7.1787668560584; Tue, 25 Aug 2026
 07:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
X-Gm-Features: AcwNN1Ukmh5UKBc2zk9wzu2Sw0eK218Xlo9LtqimuxAbEuTVVRxy77cCcK4Llmw
Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 256 acceptance filters, compared to 768 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
