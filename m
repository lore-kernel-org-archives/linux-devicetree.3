Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C59346ACE
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884471; cv=none; b=h6Mbki10bpwpMvXNjN9rnH+2+Od9TD79D3qFIGcZp/36KN0pHYuOr/U4QNgsYqfEAGxf+aqvMWrPonXCp6Hwi9bXM7yGxZhH4qeQQE/C0ul0mcnkb6/4+iFWmg023wKx7hmuiphAeo68uTtD0V9HvjdGuY+DjQ3FkTpUGx0IN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884471; c=relaxed/simple;
	bh=9ThezaybU6JMwgX8EqkJ2e4UKZQQL7Vuu4i/Sg0xHEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8aI0IZ4mhfXJmqgjwfreb9gw1mQ3B/jUUbq1+Lq2qNmHX5jRmKMiw7rAcrDK15rcgEr6ydIQNcKcAqKml7xoTSkkZeb3rF/7LNnX0g+HStbBgY5NIqvUlqHj17Jr9KkZgyIrqGGezhVxf3n4kU2bi0oyFkZ9Ge2XhdNlGGzwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso2285114241.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777884469; x=1778489269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7dAimrYwm3G27zNKOrwjz8dgHuGQ7JjwxtM6TGtY+M=;
        b=gBsZ9/BP7pCj5Gn1sMm7YoeDN4/Dw+2O2ukPEc0SdQ5NNpJEJRdDZT7dLUyVq8JsxT
         Oa9rtUwV99OJ4JWhEjmtf1pW8J6aLmfuyu5TWd3Ts8Ps0rhsDIojFmOXp0qFivjrSHWI
         dZL91IlhOIuc1XJ7pVB4kWZ+kkBS8FADcKtrJU81O6w4mHUW9WYtKEWQtKh9qGNFVY1q
         ztJumFt+8NzCkT/BbBhjGJfNZffv17KwEDX1dQMagnq3ec5qq4c0artCnNXg0PeJpFVV
         oluhhNLMldh4mWabYnhBvxwRKf8cNLVPOF1Xu835f2PJKc29FVaH7Qdvzj6/VB3Qgccu
         bG8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+BpyVuiz89RqA6mfo5z70ENPzVVzgV/AGyq5vmmte+VlFzGpJeYfs2gFQmMatB7YkAhfUILALvcrEs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9b8CMxe6CQJZfDqFBAimxamxWLcTagBUsnrFKIbTL6aAMG9ZH
	40WPVw/6wIOfuUVdKF5hABgl3UKQ3jbMU2JITs+Tj4bo41ylZ8srulJDP4tX+TIb
X-Gm-Gg: AeBDies3EDAY+Q02Szbnq3xyBgX/tVLEIzPZbumCGh8iII2uZiMzHcb4md/V9vGBD78
	iox6Ww/WkQdSIljzn0v9gy1Pqb4vgL34sxcLkC6Wdxc8MX67VytRfZP+b05xUBH0K3/99Bwfndt
	H4lpmeBRmeL419+vC8o/ZqaMMYjxih3v/xiIeWb1vRulhyRtbkT2q/YdX+ixV2cyX9eNT9BICnU
	GNRvgeoCG9dXmqorT/J8Re26wpW746VL3ORy7kgFd9ZOsISSB5en3biGOyFzAFAGBQgLhfHfteN
	PjOhOKPv+dR4Tr7NQs+vkL3zEL/7NiYPzEFFavNZPLbR2LZ+mtiswsEV4sbDWwW/Mo05kn+GHwQ
	fHO6eEvj8bg7IBN019+CgbOoeEt0IuJIJDJcsj+yEQQe8uAxfWYtq+HQWFu2YtZiH5p5LtPPmyC
	aXBiTtMg+syJUZv5w+e71MGI8+LQTG3i+Z6bz8lyfj8M6pKPwMHXcluycc9yD0M+cgAq9pjXM=
X-Received: by 2002:a05:6102:c4f:b0:605:218d:ae0f with SMTP id ada2fe7eead31-62d86a1cd99mr3182078137.18.1777884469226;
        Mon, 04 May 2026 01:47:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08972bdsm4836514241.1.2026.05.04.01.47.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:47:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso2331923241.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9n4zvL+riaMA7wwhsQpXjD+HyJBjdWwkwTOOtt4oUgP18DBbLkGJ4hTgoJs7PkzU5j2i3hwJONaJxf@vger.kernel.org
X-Received: by 2002:a05:6102:6053:b0:605:6615:d9dd with SMTP id
 ada2fe7eead31-62d84a737edmr3283917137.3.1777884468126; Mon, 04 May 2026
 01:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
In-Reply-To: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:47:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
X-Gm-Features: AVHnY4Ja_beTfs2zJQEP15HITljg2EdKPb6XLKJOnEpV1VMzgSNE4T0gDnfoB8Q
Message-ID: <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 3 May 2026 at 13:18, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of oliRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.
>
> Bindings are added for all currently known supported boards, namely:
> - HummingBoard IIoT
> - HummingBoard Pro
> - HummingBoard Ripple
>
> Device-tree are only added for the first board to reduce effort.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your series!

FTR, I found documentation (incl. schematics) at:
  - RZ/G2L SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
  - RZ/V2L SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/#documentation
  - RZ/G2LC SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
  - RZ/G2UL SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
  - HUMMINGBOARD RZ/G2L IIOT
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
  - HUMMINGBOARD RZ/G2L PRO
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
  - HUMMINGBOARD RZ/G2LC BASE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

I believe "BASE" is the Ripple?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
