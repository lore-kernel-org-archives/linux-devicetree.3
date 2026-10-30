Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355570;
	b=SWyghwmVCjlW00eeVxYWyz54e9PxznYhI1iz9b6Wp/p7Nq9sx4YWpHFmgMSm2UoTpBhN
	 g7sApzn6BoqAzyOv6TH6Rf32NkhHTKO7X8imdim2SSCBuCVVGHuQb2Sq7aPPHEt/doDEg
	 HKwQ5A6F9IoUINKX+V3jdkEYUjkwkYtcDw0QSbpAuXGJgEH0xHBM6Um8oqWGp9kDYCU1A
	 cx06REu1kEjC+vkdODDmjCndhQdXRZVXeU1hURqaPE4+dA/H+yJZzQI6VyLgLZL3TG3gA
	 vuMudfvjHii+bNNJJGvuC84YynJSWi2w4Cu2Duf5XSJOiHReRmwhtJvA/X2kwACRDaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
	b=ur0oTFo4U3mTSDd2uIZaPPauXQr8hi4RVAghsbGC6xIoTP5jxeHtSXY9UMeA3PIA6h7t
	 EVERISCtfRSPdO3NBvlFahJr7WejMeeP9OboyTtBYugauPmx8vjhcw2QiZwfGquQ0FQUA
	 LNywTuEC+cr70AniWHkoA3IBBkFlwnWTolS7GMhH28d3HBUeywyb0LYmIHicyN0ZKno1/
	 RxTxyvorKV4F6uayS39CbIiQijUE+qTtI3DJyuQLuq6EucqKQPcL5d+yoshBoJIhuy3PN
	 PeFpGADtV5qgV5rF2XIsaZqo24De9dcJtq0UcktnYL378NKHiBOeJekT3OMSSbP06/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAA606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac01ff101so203793e0c.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355569; x=1793960369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N/lKB/c9Lq//6NoMXUd+nQ4qRj1zdlYJ2/JdgAh063M=;
        b=HMHRgpwhnnUampBfvPyZC66I7gbUeVqnGIMk6ovh82zM3yN6GtXy8s1KDQqzlCbAFp
         gMWXlhiU9NT0gZE0YhO20j+5SniUQ5iVG8vdDwl5I9ewvCiCUXfwU+8xwuPQeclhliFS
         KYpvubdYemPjgKazbFQAO0uUE40bLy1dCkzjx85JOl1x0Iv4psJFCDzdhCvSigqKGHR0
         JVME/mVlia7/1dUILsC7sGoQ9xwxsqSkWlWW8r5EZfk5i/aowZF1wWVIn8U5hQStS//Q
         ZQHl7DC3sxEoM3f+uGguIhC8PRWCclfl5aT2YH5gplsxb5l0yLrzfjGuOke991Km5RpV
         4zPw==
X-Forwarded-Encrypted: i=1; AKwUvBzTMgqkQUBtnZh9lfM0XT0Jrkuzexv7Xk7ssInRqgcbfgC3jVwq0yQWiS0xM1TWjnVOOR5bGKinyMEv@vger.kernel.org
X-Gm-Message-State: AFq9FYKVx/K9r9EJ23xz2ZG6iMmbfcSoWlkEpFQfjJmomF6znf7+/M+d
	WXAAKTR6vFec0yataD1AHeAecymzhwUjGIBaXKSc1q0ysSZTvoiDNZs+aXkMFHaf
X-Gm-Gg: AYBFou0loO4mQe3gc611mfQVeLIPIcBM6ORcujTmGJCN9QqKYgm0MNWzMB4pa7iNQPf
	jIjroPw36N0lPNhiahumlmwj4my0vHTnFzX8iiOyrcBNNFiM0ILIFvf8v3W4cUNbipvGDdwGkfg
	td0s++eTC+cwkJKVW4mewcZKZsYQvD8NNa8Pk/8qbRGUOfKgvIdszBsjNVrDOVlnyC2XjqsJI3i
	1ZAhiVqWS/O7U9sWJQkuFJzMx7t7Ntu1D3/pqydsd/zejWRHC1ygQxSGJHjIES2MZ5IdxYOndRC
	2Od5IT6A5mfxtyFtfxEr/bL49U2lEZKIbvvQqPZoUy1Or0oRypmtv5mPAsL3/IcSeXZrnIFLoJv
	Wzv/IlRNzj4PZpW1Q5nJgxHNOuBsesfV2648Xn3qdcPP1Fy/1go5UbEZ1oeWdVaMwK8LFCzsZPg
	w8PsIsfotPOY7P3T0WMKRGQPsjdEBcLJtkOmbXU1Z8w3IcoHqVH+Kycdgo+dRVCNzbRUXw6GGQA
	WviL+Dwxr5HM/HZNQQt3syZwXWDdY1jmHxHMnvo16SCcMpIqX2iRiKAiSNUDcajSsw+iELwHVuI
	x7EX6dI1mVEw22TmSonSRA+v4kfbDEjqn5WpOLaYqpBZ7LToSleWKqQZUACr+uZNk6c=
X-Received: by 2002:a05:6122:6990:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ec6893b670mr885808e0c.13.1793355569148;
        Fri, 30 Oct 2026 03:19:29 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bbf5easm1860198e0c.3.2026.10.30.03.19.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc81984fceso146327137.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykFF+LT3vIUpzoL8QwXGPutzao+8fdoPuO6XOgt37uyBKWwc3bO4Jc8GJ9xJtE94VjLnEhnifgE0IN@vger.kernel.org
X-Received: by 2002:a05:6102:9d4:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d0728d38cemr726412137.36.1793355567237; Fri, 30 Oct 2026
 03:19:27 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
In-Reply-To: <2f986484ade3f3ab7785a088b476b4bc6f53c157.1793278754.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
X-Gm-Features: AclHuK8TLIiJXfBZEbZO-sDHcOFpgPhdmma0xCzHFZfNFDpVgGdGYD9NeIfWwIY
Message-ID: <CAMuHMdVDs38CWQv+-1d6iMa5Et-w53iVbjSTyQS5uVcvq+E8Ag@mail.gmail.com>
Subject: Re: [PATCH 4/9] can: rcar_canfd: Add support for R-Car Gen5
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Biju Das <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 14:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The CAN-FD block on R-Car Gen5 is similar to the variant on R-Car Gen4,
> but uses split global and per-channel interrupts, like on RZ/G2L.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -636,6 +636,23 @@ static const struct rcar_canfd_hw_info rcar_gen4_hw_info = {
>         .external_clk = 1,
>  };
>
> +static const struct rcar_canfd_hw_info rcar_gen5_hw_info = {
> +       .nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
> +       .data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
> +       .tdc_const = &rcar_canfd_gen4_tdc_const,
> +       .regs = &rcar_gen4_regs,
> +       .sh = &rcar_gen4_shift_data,
> +       .rnc_field_width = 16,
> +       .max_aflpn = 127,
> +       .max_cftml = 31,
> +       .max_channels = 8,
> +       .postdiv = 2,

R-Car X5H does not have the /2 postdivider, so this should be one.
Else the bitrate is twice as fast as intended when the external can_clk
is not available.

> +       .multi_channel_irqs = 1,
> +       .ch_interface_mode = 1,
> +       .shared_can_regs = 1,
> +       .external_clk = 1,
> +};
> +
>  static const struct rcar_canfd_hw_info rzg2l_hw_info = {
>         .nom_bittiming = &rcar_canfd_gen3_nom_bittiming_const,
>         .data_bittiming = &rcar_canfd_gen3_data_bittiming_const,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
