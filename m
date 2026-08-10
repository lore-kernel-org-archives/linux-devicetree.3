Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C563F54D8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371613; cv=none; b=A/N2fv+sgslJL4EoOrR1HIFek+tOYzkwLPYvB4ywReMkf+DjTOFnij7YJxW06nKzikFG+Y72FtgwWsmHOJuLuZyQYAuLpN58A7zZNuJgupwxpnNt5CeszuD57JwrlxWxwdArmYboaDZ7uP/1GC/Ad4s+aYGtpOnsmKMAc13HfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371613; c=relaxed/simple;
	bh=LFVUV7tv+VXxprYyb3YnUD/Y8MYj5qklAjHaW/X3Q1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSTkAemkJm4k4r1J5cBVEd4L16Y3aljiQu7Z2VwwOEx/iEw3Nh9u+IaKxyCg5lsw9QCzuEUPNC2Zvdf51EnN9fDalxRuDI4w1cAydK7IQsCRf0at+JBYGq6tS/4J3lsu+dQmjDicPs8JlQ2PpjkmaRj8GnGgZsQ/Ce1X6YPIGDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74748e3a4d1so949416137.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371605; x=1786976405;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=madawIf9xh+l1j/F1b7PO3ogSWxUlxLeFU16GLApY24QZOyTazYUKQzlbwdA1JgumU
         aSROmSPjPKQjxOTPALRFI2VobdzSJpdMTkIDP4ppy+4RyFhXUds8u4FlO9Dd0H6NSyUq
         6jZGrJWWvrtuCi3fJBAXkeZfEEokRXUX4h1BwPKO27bbLXrPfGpLN0cstvV9lYYa+ZOb
         u2VCM6XyLQg6hr/whx2FvAdXDQfn5OxmJigVOqrAeNQ9qDdFcSy/L8UZ05StrySbj+DF
         BFZU0RhjTt4A7yBgWo5lGMj7+aEMf1SfqP5LXc1UlSlH6OEQUatGUGQm+UnW+M8H9RBd
         dsYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnwG4olRfgn7uts5FPx41HkSjqnRbA+MDUp7ocsFzB9NxeYh93tl3QR3HDnORhDEXp5oqK8uxD+gfn@vger.kernel.org
X-Gm-Message-State: AOJu0YwGyg/i1SpXhfnAa7+6RKSIPaCSPa4Kz0cxNxQuj4TZNkjXLnmH
	5XKowmJRVx3MhyR7Rvlh7lz88jwNaZBhz54qTRGQWMXIr5kDwb7slEaJ6jSQhvpH
X-Gm-Gg: AR+sD13cMSjoVIg9V8WvwZdNvQIUA7S2e1W5WLpYVwiqYKka+W78kWG5SbolyXuVAcT
	3Fm8+xH3wvQpRUZ3tWkot/H8tazq+f9/V4bHQZsV8EerqxTM7X+///RYTP3FwNsBBgt1ReMUj3m
	sbtSH3zvRkAkvmGu/0BGY83oBOfh0AwHVaxRykHZMcesEFTi1q+K1ONT0vEvR6WeEvUCZhP8IMo
	S7xXi5k+fP7n0ms0azncMlScgx/BBFO/eJFZABGJfW1L2lCsDbRJ8cjas/3AukzgGjF5wCTrKwT
	pol1VOgbV6CNkCB4BryyobNLiBfVOOub+oz3seLYFBRZW/K8Rs/VO8WuTwFmj5IxfVwwGfle8iY
	mZTmx+2gKXj1HSWChGth6oTyLpw6zBni4mxnbdWjoxfiyPZ9CDN5lefpSe6WL1sxARwdSZv6LBb
	9iE/QPOgekG8DTpS7U1j7blJ/mzHUxnRBI+592Zd4Kt65ePuisvlla1bVo/+J7TtVr8yeDECf3Y
	WEmyU2ORHY/VV4bDX79PYkIUDvIL96A7g3d
X-Received: by 2002:a05:6102:1610:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-768e623ea25mr466993137.5.1786371605439;
        Mon, 10 Aug 2026 07:20:05 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2cbe70asm3769019241.0.2026.08.10.07.20.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:20:04 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ad03fa605so992593137.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqT43clmSF1SQEjaAc8NuSX+jAtqhwblIsc1VzP78EPCecvRom7L6TFVrJQm1JwN1ldILqLwtO5Bz3@vger.kernel.org
X-Received: by 2002:a05:6102:2ad2:b0:744:a3fd:410a with SMTP id
 ada2fe7eead31-768e8940762mr560960137.14.1786371603877; Mon, 10 Aug 2026
 07:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org> <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
X-Gm-Features: AUfX_mzmyaFcfAhDqolFSfcUlHhBbVcrn1RxopOMapmQqRAQ7qu_SOQmReL3jC0
Message-ID: <CAMuHMdX1soMQwibF8kr+K=aStvzRoouDyAms45U_WQtWojdDjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: renesas: armadillo800eva: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
> POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
> long should the system wait after deassertion of the PHY reset and
> before start of communication with the PHY via MDIO. Opt for 300 us
> which should cover every timing option, including the 16 us delay
> required for MDIO to switch to 25 MHz listed in Note: in Chapter
> 3.8.5 RESETS.
>
> The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
> POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
> supply voltages to reset high is at minimum 10 ms. Set DT property
> reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
> spell out how long the reset has to be asserted, but this at least
> covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
