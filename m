Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C93B0ACD
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456132; cv=none; b=daPQjZpvxvUpQk47yCpAs0yaRF8rkZ+VBapaIcr1ZFo28RWCCXkf453UkVx3l+gYpHZqk/+HRL6w+pB79DBSIGL462jJ2PsTOC4EwBmLMK9jTNZZT4mDiJetxNV5zUEvqjletYxHEVR3v56POUkyZ3TCVpJEr50FEd9lVeKR9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456132; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUQIyOyuuucZklMA0RbbWrOOo5WindHpFJIvLZ5mMzJgvZVmz9SB738IRpOKMIp6yoY5pz5WhFRuip2xnuMyAuuC6R3/oMQs2UW0hhlRXPZTUMKva5uLG9IvTkhYbiUWfmqZwwO93DJGlSCAOwvpW2NvVvvIIjpJ4ozRnxJ/+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bce57c132b2so1470401266b.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456128; x=1780060928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=IqFsx9k0f1MZZz1mwVzOOxfCvqAvhBRKl96K4ZUkg2koCrFG8J3Tl0iSrT6uPsmrsb
         rb8sQ/T2lE+/7px3ducLn15nzguIKKxaEBjNmOucqIvRg67cSmJqC+HIfAlqMjfOnVGw
         53L36/f/F5H/jwheIstoPBjbOMaTUHWokeLgVcUz3g4rOeviKDmnu5H8M9XB0on3O37O
         EoWB8HLf3yzAywcaMxF6yeEkX+m0uHB6BW+txOwpBVK9oq4r6RRdwYoPMWHFy9+XTN2q
         ygCAmvMG+oNZHoao0NBRLIdwkOK7dvz1PmTiGhDjM4pUUqpYJdi4yODyotHoWjFFIgEP
         Hvxg==
X-Forwarded-Encrypted: i=1; AFNElJ8NW73fNS+6tZFZZR1uSVpgY1fLNZG6ugQXZ2wNLIPC6uuoHjRePyv35IfaqHWoOA3Hwb2fgVl0PzeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfNi9IeE3EHwiZG+j4U8ibyS5oZkBIhgdkabsDPiWJ24R4MXm
	dSfVBRJyyyx4xr0oktVOqxG+mkfYc9ZcHjSVfBZXJ8aThuE6yYk5AovoCqNUjfIofcM=
X-Gm-Gg: Acq92OH1PEqCpbBTSQQYjnEQ7jQmYcIDcdGILVnV53VPHIdDFZUvZ42uf/lXsmkSQ7w
	uNnVpZTOJFok97U6TYuRmLV+mjkYSDGiofC9kgd73n8nGDvc21IwefWHSaliu+M1k50EkI/PA9l
	kB9dmOIjcA9k6zxZ8pVAftbgcxB07cIdyGFhgmNnVxsHYE/qhScOFrgEaYKCOPV5oPkLx4jnLi3
	SuyPWz3zzAZkCj8rU3Lbb/zmLZE53kv0edk8QTDh2NSsa5+Y4An0RFE3658xFGUDaP37xTSO6Ln
	wSfNdP0umfIQVGxw57mJcgPlDv4NvTdR15YLujkbAgFQBTeBEhQZi048sPcjr2i5c4R2MAvMgkA
	TK8uZIey3TyveB6DhHNN8KnhldoJnN2s0Eq0yV10ManvOBHZWAOw/Zp+qA/KJCzrVhokOGgQq23
	LUGLG4FtqCMXEZXi3YV/5pRltYpkLhDMZF9zkotQFUkH6KTYmaSW3hOyRmmFDpFTyeUfWh+rk=
X-Received: by 2002:a17:907:b5a6:b0:bd5:40d9:c6cd with SMTP id a640c23a62f3a-bdd4a09aaf2mr130227066b.13.1779456128329;
        Fri, 22 May 2026 06:22:08 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc355d25bsm53654066b.27.2026.05.22.06.22.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:06 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2772283a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eOCBxtSNY/2dGgs4FokmlmX9JLXf99/EPzWPCZ2Ae6tAA6XA79ZOziqC1G3bFAARYO8SVaV6LrYxK@vger.kernel.org
X-Received: by 2002:a05:6402:510e:b0:682:c363:d96f with SMTP id
 4fb4d7f45d1cf-6889c44e129mr1665620a12.10.1779456126723; Fri, 22 May 2026
 06:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JaUyiF83u7ZZ_15Eo8SUYauLgYscK3wdborUbq63bx7aDzqid-QKvlQG4
Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: condor-common: Specify
 ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
