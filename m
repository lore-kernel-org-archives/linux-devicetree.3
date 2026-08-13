Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5123328FC
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613132; cv=none; b=hV5fMmFWA4Neuxn3uc7joNjTJ0YiYPAl/6/kXe1vXjpkoJbP5PWWcD5imy5T3UuMHLjUWDW1i6yw0LiEL0m9pfB/49jXp8BpsY7bFZurovd+CGZT2Jp/1QDKl7p72iXbSH5q/DVtTB5z2mcSgYFfGL5W5+iRrwnNBzNoWzWYO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613132; c=relaxed/simple;
	bh=6UeQjnNQQKepCtP6jT6aFE/GGpXYwrHI1wdVI7j+YWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HT/t2QRUrHIqx3Yf1q7/eQOdCd51JFU2pSmZ/fVAk/oGC8crbb3hRJhLBjlL1RJ5E/F55Sk3Kt1I6zQSnoP1tlwk9xTbxXt+yuyXNvgAwv0d/0fO6xHt6k54RWwexRLUcIAcwh0FTge9M3S/71c8iHXqsuAbJgQH20Q70BZF4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966e7380109so1359318241.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613130; x=1787217930;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZSWQ6egXX/M61qbKh50ws1ZJUA0MvIrSjxfVopcJmo=;
        b=DeNYei/CmuAPCbrdEVzuSNh5gtlMOQ0KbxDYs83vUWH4HW72BEbOq2JWlvgPwzx538
         mnLkXqixLpX1jNyFn+rV/VEkJYTnnDzbk1d+KdHaoWljN2sHiYE/HTHo4twKogy3aM0n
         lQHkG4H2Sfst69il/2fK+weTq3wyJMLAgA1+oHQ+Qm5R4pHrWlCLZLgyVytxau9B662o
         /PdMVIccfZA4SIdvJHNrFOLaRjmWx/JYWWBjP78OU0khR2pjkw3xK8Cb9tyXdgRYAjxC
         g/M6MbQ+xCiPZ64q9SXdcpE55DCrfCGUcOt+IFTNw1+8TApbMhYiUlLmCS6eNNLP1jzP
         6r8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Zh+9E+xPXniPeyMIFuUefbO3BS9rpuwVepQgrHIA20uzVkXvif+7C4oxsRqhcfbGPwrTtBfv/RKG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lj1uefzFEnLBWr8sYRzWZGsvXP5nEb31jK4vTOxPLrOTVOby
	RZW9jJMEBZoO99UZby2RF3YL2mvPD0cfn2MBUPXzvYqpLuLX6iU/doS8cAkEMpKX
X-Gm-Gg: AR+sD11jLMbpIWG3H4Y/B8f3gd/B4lUEYqaseXH0br35q5vBLhgaT9iX8sJ7huIeEXy
	HgmfgR1X/NXRexCSAJyoGP5lKtdcb/135tQzVCHBEaWHAM4CCGZU2p8MrGIaa3SBY35eK0/rlPA
	7ITJpSAJ9kcgvi+ysEOXf2KJcdYYxg1eVkipTS1WlrLtuao+zgXRPgmnj4gDp/ef2EOOGJTGj5B
	qvLVwgP9rHjcK74ARy1ss59N42x0GsvCejyVgS8L/k86eSwvq4PgUyGBLtQ2YuJRbTJJcSPtK31
	2Guap6DQ35o9ozGaU9kCDhMSbaABOxzzUKIehX9qi7LUKWFfXs1iMtJaTtb1wYc6iHb/t7sAvE4
	F4Ce2ZsSuDu/fHPEj2/OuHZUzQpziu8IsV+vVOv0I+GVktQ5M5Oso25bfPycVRDXzwKc6sJDsDy
	2gka1c9843GsMGTINSrdYPc53JmtYRDR3GFWfspnTqreb3wlLWFbKbmYX7RsH66DqWPstbyx4uL
	EVHb9pEgjScvjOdPGGbbMhVMw==
X-Received: by 2002:a05:6102:5087:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-76db1e3ce77mr1434503137.0.1786613130283;
        Thu, 13 Aug 2026 02:25:30 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5ef5csm636279241.10.2026.08.13.02.25.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:29 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73a442f7cd3so1057114137.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6BKaJvBrHo0E83F7jz66y1jsXXDahoDFvOaXeK5b7icV/9tG5MaxEFjbj4R3uEa3TPo2nipnKeNeo@vger.kernel.org
X-Received: by 2002:a05:6102:2c86:b0:744:c068:438e with SMTP id
 ada2fe7eead31-76db517cfc6mr1399093137.2.1786613129455; Thu, 13 Aug 2026
 02:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFBpWyGhiEsqmQ=R7qHkysNpd5fGFN-r7GjqVXJJ5J1Q@mail.gmail.com>
X-Gm-Features: AUfX_my1XqYOgWGA0Z5ZVwVS4QZkdrhOw8AOG0maGe-AncWKxhhRcLybgvhtzKA
Message-ID: <CAMuHMdUFBpWyGhiEsqmQ=R7qHkysNpd5fGFN-r7GjqVXJJ5J1Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
