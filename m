Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B83B3888
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043701; cv=none; b=q3CafDwPC07HCuCB6XB30vv6G/i3/YSnWUArPJQxNjfFIxUB5PQDdd7fx6Un+/wyG1tf7zy9cLBVfP5M2QnOWMMrpJMYJsZDMFgVQaVIbhqunJlW1x6lWBqMWBGu5ldHcW/xwQXYWM+wU+HUzfm4MorAh6Kco65wJv4VSE9eGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043701; c=relaxed/simple;
	bh=ek3qk4m+/2gBxopYsug1++/DvNEbzXlTNyoVd3g+TaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a69W3NKfp8vWtwXkiZYzxsxcWYWUJ0///fVy8sc3fsdjgWEk6vn9SilYmxwS4keIEYB+Rf6+RXp76mZ3CWKp0W2tI8LfcAtQqYQ4lOhdXxGtFDIIypWBIc3scIMXB2mGr7wWcRAgb/ReLzsdtNnhlW2XJq8QN/8DELK7+SLZXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9639e91e773so444892241.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043700; x=1780648500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6zzuN3Y1XcfvM192VXxH5bPBxYyz0/XT0mI+jj97c=;
        b=RE0vSrjc25Jq/XC5rXvhcdZAj81exTOnJligunXZaWeEAmiZNsE2cMkf7lM/NcutpM
         wuC1/TcFPOt2teU4xWC+B4JwsLp1ReNBQohXvkcNgz5x1DmKcBUjupiq29y9BVnprKt9
         09PBrRswfrcV0imVyIVkBwYMWru0z195POqGcD5iQZjrvsdZFgEJTQhPn3rNxXUvTpVT
         Ll2aU4adgewLehQjY652cE0yjp1kv/NF94EMtda80S1Z0li/q5Yxz4VwfMd0AFPKP6Ng
         1t6fkIebNMr53IEQ4FxX9PtNucuq8pdqyhAZgJFSH7yoMKzINidTiGhyMI7AVcFD+jmK
         pu+g==
X-Forwarded-Encrypted: i=1; AFNElJ86QJuOcjUBLcON766ss0vCW/GNoacfg8W+oFx2jcoW7lngS7VDjIMD/Scs2BALcUXV4TQLs/Zsl/p7@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYMW5z77YtZicxDMfxKyNtiHUgbMgtGTIBP5qCVfe9CDHWxwt
	/BT3eEFQ1lm3ocw03AsDOQmezK73ZTB7WdBYBvNSxrGn6RltWV0KQDBIS+LRMNXvBRE=
X-Gm-Gg: Acq92OFnn0UK70mDTvT5rBRrboChksY6h+D4HYsSD53DT8pOQd99MAyS+y/br6NJhZN
	K/79KKJb//RPgV1gmSi8yoEndaFA0qtJflj3Jv02+vCwaXjU5NXYIyAI1qADN6knUoVCkRIJXAd
	r+7QOm6xeCowy1P8+qz0jT2HBFN6F6FBmL4OSTaNS8ot/Tvj7i9fsgcWuRLJIztgvevoVb53kwJ
	b7NgUhAlrnDgrk0wzlEOdrNwB0oQgNjsqgfmUzbjWDQKQNqqWuw8fy7i3DOug3sW37HxCuh7Cnt
	rbAYr9h+L1rf2rGv1Qwg5OY0CNNJimWajn4C+TQyczqjiqfOPAhQnizrOUQ+/KZaUbkVfKwM93q
	/fXPazQkG6kT8csoe38Fu75TRVpGFY1dle+J62OmdhZD7Zpebu9WuAgeaEkWZV/BZH9LzPR3jEf
	v6kTZFHvloGXLU/eiHSuoma5J4/XAn/L04qrmdED22e1vrOQFSmpxbQkaLKmSdF+W7evSHMlICT
	tMGf0oLUQ==
X-Received: by 2002:a05:6102:6a8c:b0:6ac:c0ab:5dc7 with SMTP id ada2fe7eead31-6bf264835cemr653948137.5.1780043699609;
        Fri, 29 May 2026 01:34:59 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abeadd1fsm499288241.12.2026.05.29.01.34.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:34:58 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c1f4439688so48899137.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oXlhRVZN5v8JlzOf9W/2IOUMMuYmy4wQcoSaEWhWBgbkaHBiYy4CpToipPmIsAB06uE+ij27KZlNL@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:632:29a5:2b28 with SMTP id
 ada2fe7eead31-6bf26482f08mr633139137.6.1780043698317; Fri, 29 May 2026
 01:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520132315.944117-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260520132315.944117-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:34:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLmoOrx9+TngcOK7_M=oKgJRcxmPKGDetRe++hX2vDPw@mail.gmail.com>
X-Gm-Features: AVHnY4LJbRYzzzwKxtB5OZZtYlbRSFCPZZqg47A89j0pRjOAgDTOMrGCgSK8kjA
Message-ID: <CAMuHMdXLmoOrx9+TngcOK7_M=oKgJRcxmPKGDetRe++hX2vDPw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add DMA properties for
 serial nodes
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 15:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DMA properties for the serial nodes on RZ/G2L SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
