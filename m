Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E13BED7F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681750; cv=none; b=B4tYcpuMFxTaHbI2uCH8TaQBelJwOTEmjfqvAXJxlirziGePy0ROHolJOcu0W6of8ksaTHAhncNcmH2cIfzboAWgMvbN/hTopSfnfdLSv4AOXEoHU2YwCDG9HAhF44X2RD4vVqSUe6sC8pMxTtY6ojLGF9FX9MDebqlzVmdmefo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681750; c=relaxed/simple;
	bh=vNek8FjLIl8HvwiOC3xACNGcO3tpvOAaMVKzAmldG6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzXMqWkrdwzgF9zDE6dOSlYUaiMU3NfCpTvmbeoRy7Eh46E5VPVoTty6JzqbQkdva/AuajBTJPk5j1XJMSxPiulHuoikSV4p+xYA2O0J2Xhukl39PEEf7efsksdUhXFXXzsHYNkqWbgVKuhqL9d7gHz8pQFbF2kF+QJ29QwQzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso48891815ad.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681747; x=1782286547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbKfUx0yCKVUC9L3G3BTSWTRHNmPQxEcOIjC4HA7MgQ=;
        b=SqRNSmJl6BhMD0cbJ4eX/LPINUZXBeeqLT3vd3HoJkcOMDhOJHIAOV8X+jDy1ZB2Wz
         hTGE7Rrd9HX7wTMh4Z2kcs04IEJzxtGmltFWgYlw6OgC78lEPYPRuczOVQ8y1XcUWXfM
         mufxZzXYhGdlsuZEQPDKdC2VAsay0KM66GXUZn4T0KxvGw1PJb37NYKKWO+qaF31IowU
         OZ2/h65Dfwrs5gmZDLa1e2htou/kAspDti9Ykpc1puasr0G9rE3T31Q7CZTzo95JEDqZ
         l9yHf5/Ws8sgOYfa5CFngzybB1TmzCUEshZxMMy4Tcu9FJ989trghAKNZuI9KGo4HyOh
         ibbw==
X-Forwarded-Encrypted: i=1; AFNElJ/aFYsxLS8KWK0ay4nSEN/E55ZUZXIUnoTR0HF/n0LG9/6UMyXcSeBWDGp4NfEyKd5QxUSDwOhZs9GA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzal6ljbeRA6sQDeRX4pYZHNMEel3fD8iEzXAc/Yc756YLN/C1s
	Bg4vIIcyiExwuPXGXaBdBGKWuqXJ7zRj5gtYAOAZxU9EYq7td4qEm0eNG+ElZhJo
X-Gm-Gg: AfdE7ckclLu0vzk4KTHv2giMkUmwzZ5iwNBdl99xc7Qquwjke+2NUI4BKShPkvhYhQ5
	hFzptx50jRN13gJU+UXlaOr8E8aCzDcIZc2m4CY3vRt3WsqoGX6KWUJ4XxoRX3Q6R0GQjpd7xEw
	6lbzhAqjg+QvGX7DJn6vmjJxcUg89d1UC4l+QJlUle3lhIwNW/tsrx98repd80jBm77Uk48h0BU
	D5cZVAxrMuYf7VgoPwe2GthwTks/eVypogLIZOLJKQYdoMpWXyFoT+MS+6cTOe9xU5e1j7N4Zgr
	5YCaw+BQ0/D+kDNodbqbm1RyTp2xA6+70YwPVjw1DAL5+RGpmzmFLt4OiMT9+G6VrNzT4h487FO
	kROP0hIlLFpvkMxGli9oUarrQTFJPa45PO+vBGe6UDzDBsmGJ9hYFRk0L3wz14whbFXBnYCy3wl
	vNywKbsWjGjmJN5KBITJe8VM0fyGJLsJUzu2VPT+TyCgfvDtpDe49sqw==
X-Received: by 2002:a17:902:f548:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c6bc24236amr26301635ad.32.1781681747395;
        Wed, 17 Jun 2026 00:35:47 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm157130095ad.73.2026.06.17.00.35.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:35:47 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so3315793a12.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+EXpcajqSUst4W0I3jzGtVu6ui6Ez6D4Axr/7lZFGimVu9LvWaW4YS9QWIfcD08Me4JfMfg7TGSWg5@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:6c8:aed:ca95 with SMTP id
 ada2fe7eead31-7246c9ac2d5mr1291045137.13.1781681369628; Wed, 17 Jun 2026
 00:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:29:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXatyCmWsLZuaxsjHmwvaLfuY58dFj3CFDzxWUsnV_SaA@mail.gmail.com>
X-Gm-Features: AVVi8Cec7sdhKO6enoQpO-vFddUl_hmphx3k_Jhb6Ts9DPQNkP2qjefI912kXBY
Message-ID: <CAMuHMdXatyCmWsLZuaxsjHmwvaLfuY58dFj3CFDzxWUsnV_SaA@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> alarm and farest were declared as unsigned long, but
> rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> unsigned long is 32 bits, the assignment silently truncates the upper
> 32 bits of the timestamp.
>
> Fix by declaring alarm and farest as time64_t and replacing
> time_after() with a direct signed comparison, which is correct for
> time64_t values that will never realistically overflow.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
