Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB038370D70
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398450; cv=none; b=PrEdzIk/x2HorqsbOkvnziArAqg/rXggIF64Om+knBj26xAxLbmnKmjQ1GJWlVgATL8jHrWnSVKcmXxRG0eD8LX2mgpQ8WTPgN3JtNgWG1hJGNhSTnH3dU6s/idROjCK8si7nXGdURM2kBwVCwqX+eJOhZ/czrndg6+8iDVP0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398450; c=relaxed/simple;
	bh=l69NxiUTG+KDRNL+lJ3c2t+QaNlhHUbuUDROt+qYWW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npCao9wbk7oY8nJVxqm2fjq2J9QPRvbJhGLCIPCH0+61UN+gzZh9slSFa+umAC/MOx2b0cpOz7We87bFv8PM0ALohcxdaIZ3wP75OcB9o98T9La5WtCZUJVwm1fYQ1/4ht7jB17GfoDLQLYuW1SDO3PeGn/TWCmu9/PdeSMbLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so3505715a12.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398447; x=1781003247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDA630jESKneh4iwNa8g/St2EwYznnBHuc+Np5jJahc=;
        b=szyOK4n3CthIwj8Aq/tedUpxjWTPPXBqcm3YGDLH/8TTwPOenhjaAGOyjEnyDk8258
         IEXQeCBct5/JZE6Lk9GFIYse2KOpG9p6/qfQmiKvB8Ap+8aQRwMQCLlozPNI+ipHcdUF
         VmXzyRycE7C+WSGsRBuag3wR9uxiIHDw64xIWOSzF5+KZfaDd6sismJztvwJ5q3qNvvN
         D2kZzh/51EtUJkVnQY+dK1x8L4Z/sn3+G3Fp+yyPddYkuj4V/WJMioVvJwa6Jzm/Vgx/
         AVj1N/L3bWrfKgE0wBDLp9xmeq432QLOcmqn7eEzX1rBFGlzcjve6qqcBHRDIjLAjzzM
         agOg==
X-Forwarded-Encrypted: i=1; AFNElJ/j4uMdLWd3zArSC5f9OMRkQEsNuRguwn7+xA/hYHp8IkqpdGN2wFW878LJJwh4kZcckiu4CbFAgYIy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18ODOSIjaG1oan49PhqWMQhF8XC9vylix+hKATmFNHGLU8vx/
	0y2tr6gh/tgR1aTnfbjXpmFYGiD4G5nTQZFTXnPVJ7Mvn8dBvSAiWg3i+9yzmxOM3Ac=
X-Gm-Gg: Acq92OHL6Jgatw1giRO8wfTIPsCKKzDYDErMahILFwm1JviyKuoF8MHnAV2cnnTLDX8
	h0X/xlHtkDCfD/OXcBUEYwQ27Se4bY8Q6qxK5nYBKXoHsprr8VNR+cT2VfMWzp5qD6fcl9bd7Uw
	GI2db/eALmu0JO0N5MnyaxQHcc9qv463HRHSFVLRsTklsIiRiJGm91rvLe6I/GYH7Hqr1LYyBM2
	5T9Ui8s4vG56olJDCzp7MQMkdcmIc+P2f926OrOr66ZhOo8jMQUsd5+nRsZiV5NkEaziwaJITeV
	VDziJdTV+xDHukVGXNZScJF/N0k8x/jYZoxzSGhVuvYhcJtKheemKiHKtfNWu653Zw+1ypc2cod
	luw0Sb1IIYlbBpfoCXZ8LJHEzHW0rL7XPcGWAqi022LStNLb6jEQwuqDpWWm8aBiNSKabs/rEux
	95KkBFvR+OGR+AJ2epIIx/rCDsggx4WkAmxeZ7X5h6gEccAcNoxcOa17l9n3tLfLzbEpS9+ag=
X-Received: by 2002:a17:907:a394:b0:bf0:1c43:bd22 with SMTP id a640c23a62f3a-bf01c43c462mr6710166b.19.1780398447060;
        Tue, 02 Jun 2026 04:07:27 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bef95a5e95asm59760866b.57.2026.06.02.04.07.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:07:26 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so3503896a12.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YCwjmRboDcyInpAHFCVN6oE2ftcYBx1EtKwnxrQVLXBB0dwDTis4XwrFKOgGJm8o6cYeQZSnPD/Sb@vger.kernel.org
X-Received: by 2002:a05:6402:28c7:b0:68a:f749:608d with SMTP id
 4fb4d7f45d1cf-68c8d1faa20mr7720273a12.21.1780398446024; Tue, 02 Jun 2026
 04:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:07:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jru0COyS5ymsVNqmANoEEEJi1BF8TktYxaag_QanrsBHKyvZKEqE5P2sU
Message-ID: <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> There is an internal discussion about dropping patch#2, as RSPI is useless
> without a device connected to that interface. However, as per the
> schematic, RSPI signals are wired up to the PMOD connector. Currently, it
> is enabled on RZ/G2L and RZ/G3E. Please share your thoughts on this.

Sorry, I had missed this question before.
RZ/G3E SMARC EVK (which shares the same carrier board) has it enabled,
too, as the connector is labelled "Type-2A", i.e. meant for expanded
SPI.  Obviously it really depends on the use case: one might want to
use the pins as GPIOs?  We can revisit this when we get real connector
support.

> Biju Das (2):
>   arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
>   arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
