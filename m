Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172735;
	b=hT21/jRSuWlnBU+sEg/TFXqVH76M2Pi8aCzPsQ2kCAo9RewUuX23s4UlOqz+Kjtcw6gH
	 1EjyRg3M0fwi4h7Pwx+LILUeqderNaIvBgIIw1IFoPHi7p4t94ICmOQ95u4QBVP0JAJLZ
	 tx2gYlfhYXoNuEFhdHn0yUTJ9aiR0WLAcPg7N35UspjTJd6XUph3aOomunDZOA7Qtbi6i
	 3aYYaJyLlidXRLrVret0tdKEWVDV0PxyokUQOWdwsNcTFIWdD0OdqUBlfhYukZVlkIhyM
	 sNZTiIuBZVb5xP0fpRzkkT5F6NaAA/NtrzRpUnsDobFrIEJwYj2Z6f0s2UJ5tydLONQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172735;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
	b=tP2+/2X3L+QOLGwYIRujaDtJt0gkQBCqV34pw231f9s5bluSWdCtcgKcz1oRJ3RQDJLr
	 b2OA743Zr1tg+Uwyi8s9UsRUxwul3YGunDGCr3mmY/Bo4bkA07ZK0nAp21QP1FzFLxfH+
	 aHGS3Nfnva4eFqCE0ym0D2u1wo6r4gBxhv9oH5pE7W/2X8tplnjKT3eJl1LyO68ueoztH
	 XBIGBessd+xC8YkBnkztZ4BIZdyaBYCjsdJVy9VHStCgAYI/BB9qQgUXS/1hfp1OGwR/u
	 t/a+iRPBNstR6p5X0gP7aO+r3I3cshjqVOAv0PGfn4eZPAj4jIJTo0Clzc7DlT1xwzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7819606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7819606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso235864241.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172734; x=1795777534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
        b=hg6JZd45Q3JJO7u2kSIpyWofV3oVyhOjMXEqshAnTIK7J9/eLXpTzm1MIWFYIAAIxM
         IMTwM8uPVj7OnesnrUdZWF4S4kmQhlK/LBZzn4txeE1hZmKHP0vN/cyOiABTGZ6PjeHS
         b1xXZn8O/ZpgYxSY842lYpaiG7nJe+VBrU171Gxqdnywh5vbnuddm11gjF5k8Kc0ebGy
         5sCs8QPy9yc8GWKLEx6cAxprQyJ0B6c3GHouGmf9TPEa9YhCdnKK1CpQTe0qBWcwqEcg
         03l+w2STr0X5wN0C+Z3r177QoSlfKfEHbmmpVOzS6SY8UkPBl8i/zXam8VTgfM0mK8AQ
         aCtQ==
X-Forwarded-Encrypted: i=1; AL+hErGZergJh3qyTSUiVeWk7jKf67JK4s5DHTmN3p9fCvM0pVcCk8Tv39o75M2wS7KXpi98Dks+EIH9ChCA@vger.kernel.org
X-Gm-Message-State: APuU4Z8XQp5rKWKipzATYCSnMilwDsSRg5QpYshIv8Pln0W2UQ9t6DSB
	qJhCDCZqPx1N/DaQXXFsPMZSTOzzPgXFF+0hpsbGvu9t0eBdb41SBtaVhWyHmjAk
X-Gm-Gg: AZFdTZdkpCZQ5D8It8xAGwPSZY3cMOObP7wRatSNJZx2qK+G++OHd/BCiwOxz1CZIZS
	PbgZXpLCviagUug48xvJszmSkFpVb5IxWkjCTib27uNZVVr1eOcFeaDhfMhZGQmxAtcP2cThIMA
	fvq215GNAQCNlxW9RtkFfokZJHHcIQi+knZIGdBwgdRTKBf6pTBS0rxlNYrCvU6JPSx4pMapquE
	B8+O7009+kBfwukQqlZfeYnJJCtSlbNiOarSAQm02pPsOjuYja5rvGfNrhvyuUyIiBATp0yr22b
	VTAa0tDGpKq+SyrhExd1s15bx4bW13dvwiSBMop1fAxAK+8S5QPMi0YYBnF947x0LwD4htFKXAQ
	s4jXaNDjcoQIi1rLfnMIRcyDcDUrRAes7FACWguIdiY01lyC17XITAHDFbUzMFbOih9Tt79lYw4
	xSVOkVU+tHmRWYL0enHJ9i9GxV0/Uhe2+Eqd+2QKaUr9zg+5ReQSz2GoMnKvETjY72syfH51omY
	A5DvXnc+ZtY9vQcYkx8uLwVD6LCbf67Y+SC5zP2uIwdRIvdw5EKiPI0GAjCgvN5+DKSsWtQZV/l
	J0oDV4RUn1doLTpVrr+g4iexTKS3btsQOdrh134GjWpZl/M7YbmLZf8ZQ7cAn9RtDBQ=
X-Received: by 2002:a05:6102:1610:b0:7ce:a840:b86b with SMTP id ada2fe7eead31-7d739405353mr897569137.17.1795172733625;
        Fri, 20 Nov 2026 03:05:33 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e81cee49sm2646952137.8.2026.11.20.03.05.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:05:33 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99e145569c6so149535241.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:05:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGw8/kf+T4fdelWhD7VVU9r1eudJBQiIdXgnsnBdzzl6K9yfVS68TZ/QEDVOhj6NG4kv85J8qODzRe8@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:7cc:9d47:9c9 with SMTP id
 ada2fe7eead31-7d73963f00dmr849125137.35.1795172732962; Fri, 20 Nov 2026
 03:05:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:05:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
X-Gm-Features: Aa3M54qJy6m08CrK20MF4Bh-SEahYYaIemU7d5t_ENxV4MsT0OIrWbFwbx-tam8
Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:16, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags
> - used ti,tcan1046 compatible
> - adjusted the standby-gpio property along with CAN PHY node name and label
> - adjusted the CAN channels phy phandles

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
