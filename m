Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994802FD69E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370141; cv=none; b=lAknmm3IjuKgYFg4V29f0SXYpqrJ80XxBwEsxKbaRXfsGGCD08XhTfCi29fLr7yoQAnYMfPgksq29/C32spOvpi68zObGn0ulE1PPvpaJrBK30DIV8DbijiRmsMLAsK37jxD/Uiq3iW15nm0a7tDqAPtT0YKNad3AUY3/Ma/sEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370141; c=relaxed/simple;
	bh=+49H72wzW6N8bjn12Wyc5oS2Vh9uUPL5RjM5Gza56wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LntGkIDq9FY15eCITTp5kNwP7qwAjzDpUGAveON3SbxmgaxbJPDHCpFldRWZ5jY2+oZkovjPCm/GLo/A0FKJK/QUmnUNU/ijDhTv/rl4uGHR7yxJi+UZ5xZ0diAGM7QxVhISUGnpKcuP2+G6VhvGCI2U595xIuWTQZORa/OZKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97727c2064fso1269222241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370139; x=1786974939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmACebBfyQcjcArQc12qo4s2Hk/XInMFxhT8kxQZcwU=;
        b=Bi32mUZQQKIRRwibCGJtmqVRgpNMmRUL+OXN1eDcl2pRrB9CdliGVTcYvdGgfoItcI
         61XyDWr0gwCE462xo2PMjQTZlTM0c5IcyiRLHW1qroJUie20tc+5+UcE7cFgKDu+/kvp
         vusdriQMteT76/AWY59Vb1P296d0vcGBkhaEvvKfD69WOb0otD03PSo/r7ZEgfboO482
         2TaaXZQCmqRUnBuy1HVnkJph7gGk9DR76HcWzWwdts9WLzARBRFpNh7qxo2SS8RSccKb
         M/CmjUW2uOcT3ttvXKEUDYkbXbzSR2M4cDldqyiv4bQAgOXVdSiU/YMCfeLCA2Xx7UZD
         npfw==
X-Forwarded-Encrypted: i=1; AHgh+RrVm+abFghwhik62K6047bCgtXmuKqHoihnn2Tjq9/UBTyUjVwbIdnc39fVckNRoen/GpBwxrOFkoUy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+KvzjZxWBZ552H4af3vZBxPvQGoKF7B0XEOiLftFzZp34GSFM
	sM/em0ph+l/dSlrfArq2FFGxWlpHLIOWIzBR5xJ1t+xw6ustfrmVOyoxN98KZSQ5
X-Gm-Gg: AR+sD11RenVR5J2jzgXM4qha9oYN7j2rZ5BX7rQQPgOOQvw2p7ULap3cvEBK65csj+W
	5xe0ao9+6cqsWv74YFLCvw/8kGidaV/W49bLY43XbwpLPPhXR/g8RbaaFMPYXwzZOGH21B5eJCw
	x9p0ba8rPQE8C8bie7Vmna1A513mo+oE3dz3PkB995WQJ+U78RWgRrgewA50omAHFOKkBjf1V/D
	QLCPQazrJAHjBatUV7lUlnf1S3+oUzuqxEAbj70NNXsANSG+c0FQhDjMwxghq6MxsZ8U4A8JCzi
	nKdfZ2e9HDmnCQXWlgjAZkhn8G7p66NZISabVEOsTA5aShiARMpcs2HKfgOs+AkmyART+hlSVl3
	hym4wa3RkFV0Z0dTrSKH/51tFAL7wcf+HIFf1QrE7HZDewh3Y6MslBQGZ5DWBNen0iTxuJj1Hpk
	raDcyiqVQzOxu9mRYfV50qf+BxCIrvQPoM6DcFB1ZMCeyPHJ1jVQwEiVJO5DyAOA82DH4MaoY6h
	Asoijq44mWkLK4f9X6YUXSzWMbT8kw=
X-Received: by 2002:a05:6102:f81:b0:752:757a:96f0 with SMTP id ada2fe7eead31-7634ac4a5c0mr9407129137.3.1786370139341;
        Mon, 10 Aug 2026 06:55:39 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm4635251137.1.2026.08.10.06.55.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:55:38 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1418005e0c.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:55:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrmxhOvfjMuTLPKAfW50GqwvIWHLmtmwb21rIg7S+CZKYsVqq3ve30NeSmqsEYFkOCg74CNj7JXWHvC@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:739:5cfb:50f6 with SMTP id
 ada2fe7eead31-7634d10fb7fmr9198315137.11.1786370137779; Mon, 10 Aug 2026
 06:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com> <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
X-Gm-Features: AUfX_myvCDbZrLeq5_AkwBFoQaj9KuC2_xzwhuBv4cnxNXwsS1wJ2BykJXirplM
Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1
 clock frequency to 1 MHz
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 3 Aug 2026 at 15:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On the SMARC carrier board I2C1 only carries the DA7212 audio codec.
> Override the 100 kHz SoC default with 1 MHz.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

According to the DA7212 documentation, it supports 3.4 MHz, too.
But given the I2C bus is also exposed on PMOD, GPIO, and M2 connectors,
1 MHz is probably the safer value.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
