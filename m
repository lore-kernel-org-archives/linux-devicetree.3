Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8704395D90
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635858; cv=none; b=XXeZWNc90j17LZ0g8b/jho27BvXpj0xs9B/VB2g0hUSdn8EJIxgFZcj4t/69WrXfozBXobR3gEP3srWFKrhmmxLLvika66Kh88YZazOOUFOBZXsfDJUvjFTPtA318eKMXrYt3wcNzc7bGksWm7e60tbCri1GgfW//XqLJzG3LAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635858; c=relaxed/simple;
	bh=OO8/V/ieRVIAY7OerP7B4Q+EVWmrnJ0uFfqR67sUp4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHpgTbOnuGtJmSD1u/1p3rXithn66iHWB1LQDKyszD+rPMgHkfA8SsHz22LjrOiGXy5mnx4GQd5cq7mbS6H+90TgIiK/bqEeu5a8q9260r5wd0I0LkIyoZklOqfkvfiVPSunAsPXjZcBmSEkokfkQ6+QwpRB6iw42le0seMhQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d2945e6adso93457571cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635856; x=1776240656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UVrHD1kGj3aaIesoTisHRRJzYnLIrQ82+sB6XN35Xo=;
        b=eX3KgE9Fsp87NVh9HC9tkipbk/EvhqhSU+akcgIRisIUBUfAkwWhSMo84Jr4/cjB6v
         BYyY4pB5qXjk0TWDO8o9KamaMpDNRzKwJ49txGvX4lMGBYOIpOJ+oM5buRys4KltEZ2o
         KEC7aAqFKsQC8EXp7UEdOBy8mlS1p1KrP4oAcmP0VP50RKcXiX/hOrkyzCjuO0n+eQVe
         m8Kam5tlv+mhQpuOUtyJ+fvAtpI7ROSWLrUDL34ZVIzGnPLyRy0JhPrOddv79bigvH1F
         vR2532AvDrI+0R4tAuytHKDnoDJyfjn1ziD5y16DwHIXJXel0elXGjF57YPsoeNP9wNQ
         AQTA==
X-Forwarded-Encrypted: i=1; AJvYcCX+7ZRO2vPjQqng0GdU3f/Iy3w9TVcoTEoHoFZo+a3nuMuvXYwWhedX2vHvv3TvTswyzhYttWPFa9Il@vger.kernel.org
X-Gm-Message-State: AOJu0YwIz1YESV+Y4PlsJQozEbimxIQEDHf8vSLvN+Czf2QPk7KyHotu
	M4kY45VR7SQpXwF9BQRnFpa0wwumQhMuK6w6ju49RAYoBshfWz+cF/K0ieNJdQ==
X-Gm-Gg: AeBDietKoevkYAqjEaxKxa9mCdPjnmxx23jKApP9ui9dwTWMZ4UOQVLWIT14xpwApdk
	/vvGPo7HrGf9vaPTz7RgyrC81R/APJvwm4q7V4h8rzmuB63jE2DN64B+iq9R/9Y3jF09Xi/wASr
	7qYaWG2NnP39wRAhmfJDY2SflRKglz1p2H+cFvATL0lu3oPrn0nAFJrEcRPk02JZ0ZhUKC9bLTZ
	snNR3vz61WE7OHEFYExAC5gzyLxBpaHS3XMwkyD/nF3f5wctGfv7Oa0T8tmmyRLWCq78d5eKRL6
	vdVZkkZe8gdgETh8/rtWmQfVGiEz0eYyz5pEFaD67j1IPBW37jQuljyMNhiBeVKW12zjoxDLZ2+
	pJHkR8zKANSZMHOWH7ddYHZ0kPHXMPGztot31kqI4vR0eugKXjx+/eWW5PvR4QKY79I6Z7F94cE
	LqLQTgKX/7dEzjKCpXNV2ou/GfyGsno5IKexKJoXj21JLEOGc8EMHniC8F13zA/KDKk2fO6vzEP
	AY=
X-Received: by 2002:a05:622a:418f:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50d6263b6a9mr307426601cf.17.1775635855780;
        Wed, 08 Apr 2026 01:10:55 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596915986sm187735646d6.24.2026.04.08.01.10.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:10:55 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d87c138e1so36091791cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzLBF4rHryAfZpdh+mlB8cragEY4KlRJh7cIObk8OLevFrA98Groe+jtgMJarAytu16+kzlGK2kg07@vger.kernel.org
X-Received: by 2002:a05:6102:5486:b0:602:ac40:969d with SMTP id
 ada2fe7eead31-605a5125dbemr8047885137.30.1775635529642; Wed, 08 Apr 2026
 01:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
X-Gm-Features: AQROBzB7FKSpqL9vAEkvQ3NeO0nTGrKiA5rUbk_QvEvIe1vD5_FZ5lwMa_3wMnk
Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 27 Mar 2026 at 21:11, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Describe the EIP-201 Advanced Interrupt Controller from Inside Secure,
> typically found in a bigger block named EIP-150. This controller is
> rather simple and is driven using the generic irqchip model. Its
> own interrupt domain is limited to just a few interrupts connected to
> other inner blocks, such as a Random Number Generator and a Public Key
> Accelerator.
>
> The one I used receives only rising edge interrupts and uses its own
> logic to track them. It is theoretically possible to wire devices with
> level interrupts, but not in the context of the EIP-150.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -826,4 +826,12 @@ config SUNPLUS_SP7021_INTC
>           chained controller, routing all interrupt source in P-Chip to
>           the primary controller on C-Chip.
>
> +config SAFEXCEL_EIP201_AIC
> +        tristate "Safexcel EIP201 AIC"

Is there any platform dependency that could be added here?

> +       select IRQ_DOMAIN
> +       help
> +         Support for the Advanced Interrupt Controller (AIC) typically
> +         inside Safexcel EIP150 IPs, gathering Public Key Accelerator
> +         and True Random Number Generator interrupts.
> +
>  endmenu

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
