Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1673F9A0E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372689; cv=none; b=pEYYubXNp64fdEmpMyjUcwhVf5MlRuue6A826Vz7wFnkyiS6W8banGze56ok3w3Um39cSvbL96i7yu4UQTnvA+JTl+fEPv/Bdjzf78qCASFa5Y53NYXhwrtpTwsM/qjpxS+GWCmo0PFajOG9AVxbAiXa/I6dgHvc3a95qaQPsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372689; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErBcUJwRQIDygMQnRwLhA7VHwzAFiDd5pDOdUrFMapK7ICw5Sr8ZizTl92+X0O0wocWlQRFkAOePXQ36TvZvhZign0kPtm01A7kju9uk3F+MrgURRLcEwdC+ZQMu9g/wPofiHoMAcqb3ZUJ1VdIGZY/70xDCKt3IzdIR38rWNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so595582e0c.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372687; x=1786977487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=h1h4W8Cya8+9Tjq5pfFghwJ4MR2Xul1eeYes++wz1r2YvR5YiBLu01XivmLafRdP2o
         djv8HJj0xrEZgK46pWMAx3RtkpUMJuFRp+p79FwMUx9eRvp9ogUPJt3UMhyYWTTZFEUE
         16ftW57r10m7Rfl6jAMXJbi9qxpIouqXaGMaHZKBek4QrDwUp+hA6wEUNOZXZp6D5P3x
         7YSYwsQdfBgweSt5RyYFhqK/5Ndsm763EezPxj3yfiyidna8yMNF4TbK2PMfQwSjrRzS
         6qTu0wRLBdIyaVr/SB8uJX4BYv12OcuSmoxz7jJuWKW7MyPjb+TK+0CCKfvAtu11LyPp
         A1Rw==
X-Forwarded-Encrypted: i=1; AHgh+RraopIppDPYrPThQxe4KHoa4z/fFGrkDx1EbttnKYT+jIMBXEtqgdm6e//LuiGBghnVggih+mN+7jJN@vger.kernel.org
X-Gm-Message-State: AOJu0YygV5f81QP/1SqQjXs+tK8H5D5IjKBwRpxmkq1sGCTKrLPhCg03
	3fltypjtGIF7G/D6BmU/sGMc5JqiY41fvXIeBHGGkkDsfGHwYLA5M4XCLAL+TEMU
X-Gm-Gg: AR+sD13P6NU0ASLuUJYsSKiUI79QtmeKY3cLAyIO8d7Be7tXF0UOFQ0LlP1Q/Pyxn/o
	97XFeVUmST2XBrCFl8f2KaL4lOTtdmdhTivjZ1fIE4JkoNaVve7G6bqOWtStf52tYqo0m36pTYh
	GLzlg8kcgf1+pqDPWrU1bq2zDqYHupj58hTjOo+5YOOWZBdcNz+nm6BzpRGtmyQuvdY3QwYN9EX
	W0UQhaM+2BEYvBrkwoxb3qi0QQho23ett4NRCSCN5lvU0aY3WI9l2cgfmzJid6byRljRfKrcpQv
	IeFpLtJQkBjyLnCnXy2oSaeX+ATA8kS+v7YlZ2DqBe6Q8XFxoDRSFk725Fb22Rmfo9JOFhX7RPw
	5bZgPy78UKoE5j1tL2lP7TkPFsNrf1mJiPaq3Mmhue19Z1UTTHeqcGFn1yMU+8IvPga5sYkgT3W
	mKbzv3Vcm5/Ls1JWR8G1prIBO4l9vte8PCxK0BUhQijGMciLMPDEcymK645sw9+eYvWUecfpMmz
	ee7Qyk8Yb8Iznf6ytSlAR9LNQ==
X-Received: by 2002:a05:6122:240a:b0:576:c4b:460a with SMTP id 71dfb90a1353d-5c3d9142ffbmr4363121e0c.8.1786372686647;
        Mon, 10 Aug 2026 07:38:06 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6b6c7sm4332505e0c.1.2026.08.10.07.38.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9696319e14dso699025241.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp4Im/y0kp/Q6DOugmWLEIkfrDXub8NtXeGydEYHBQNpo2flEtkDLtmUFAG0vM0wOxy/2CpdaLRCgZI@vger.kernel.org
X-Received: by 2002:a05:6102:534c:b0:728:53be:7c87 with SMTP id
 ada2fe7eead31-760e77dfab8mr9982753137.7.1786372685152; Mon, 10 Aug 2026
 07:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
X-Gm-Features: AUfX_mze_-zHFwLEPllsdSuJpX2MOFA3Rbmq7xanY1eONL6iFxyWiwDqSoDZXYo
Message-ID: <CAMuHMdVrVzFKMYwOJsBj=We9_fRNruL+AAfBwvvBb_fVK5oUDw@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm: dts: renesas: alt: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
