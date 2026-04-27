Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6939B959
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293614; cv=none; b=qi10D2MOz20cUnmjAsTQch8vIFpVTYJPV296f2gkGBuQoG2Y5oqkfG6YQYJZeY1i/yLNjAIHN2yQWDi+NHmi6jgesGfScZQHJkyMcdijy+ih2ifSKmDDJ/ETjSCYfcZl4BoaP/yNrJ6Cmo7DyLF8WYrSBGWSBW0DeZGg7QCarWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293614; c=relaxed/simple;
	bh=9Fkw2nHzd0jcBU63nsLw9TsU/VmPTpjWCDsbuOWp1Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DegKcxxddWXsiNsC+gx59Oo3kThpGFpafSE/krH2ns6W8EQOeTlY+UK6zzdRQZPbVBLrGZ6huhRlZASbH965nEZUz1ZjhmKrkWmngUkCaSzfOIGzjNNbcvdyM6CxifwUBvMLVS58/MBb6uAPBAlrXf9vWLZWfkiAwhG9qaUULmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95695190911so2193050241.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293612; x=1777898412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mLdfPcCMerm9jSxUSMQpVhZltIoWZ/5WS8yzwZGc9g=;
        b=kkqoBLjwRbXt4zyTLGFmaHbW1Me26lgJyCxoScyOJztbm5gvmPxmrZSaooxoHcemBr
         nWpzC7wgtl1kycnfPksMn5E0Zmacg7LP+n7nLWHnMyrcOjgFTwSxoDefYMvEMCncCx02
         HD3P7EdS1qdQv3cQkiFruXGbbqmxQh3wNvOK/GoTSK1R3j+1MGkEOXhYCv7oc7+yN/7w
         vnVH4xEhgz8YksQj24xtCqKDI1Ic3TB7M8DVtYaSJxJdO+CF8JZyEaKlDAhqvSma4k9Q
         CV0tDQ7bRtmSRpvpNiKfkP26ITCTyyi2GDcu68HmekOYPjlZ/dPe5MDT7mvdWBITi5PV
         ODnA==
X-Forwarded-Encrypted: i=1; AFNElJ9Pjud4k4PckspfSJiMLdixUN0dSm01f64OdCGD1jwqs5BcjspzlukjEpRjRFHKZ9rOPHOUCZBhJ8TF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9obCO7R9HgG9ZKSu9NiBrIg3r7sR3krgETQctmhqrQIWJxp/3
	Q8g9PNp35PR05EGBSjnamZ85qbjBfK44Ivo8A0SqGgvhngTh/B5Kv6lioqw9RSQn0Bc=
X-Gm-Gg: AeBDietiJs8KhLGFAlVlNP/0zdHINEzunaTXGiu1+qrE1xPnr048IakFlRET18GjSm/
	YhPp8U4UKCDChkWeRGjdVpBgvwgk7wZsg/ImLbFYab1WUs3SrviAIEhoVDZVnllxWDqRFPB6RAP
	0DpWMTtYarOcVeaoK7XBkTR1d80rgqdG6EUNmkMZ2Pg6vk6C6h+uA22yZ6TjE8hYSF6ya2y3TKM
	08OveewDHG8FwaPgmmnGjtYTlcvJSkqy4oHjc+WcAkO5lSELm/+vQnKdbUE8RwWRqUCpUOU6mZW
	Ar/U+SWdBJejMF9oxu6jtCQMjPAK87D+kPW0awhDNHuEJbmzUOXsF/sAPOEDvtA2NaOQP8ddESb
	rKpKK5PQC+U4TzRIHGBW0rdpAyxr3a/UKS4aXFSD0zeje+wOrJslMdL8ZTBkEyEryG9NICDzYMA
	CEwc9VfUh13l0Gy/PNgFI1AgX+lSQh9VG5no+OR2up68gSQgKAi0QT4kTgz0lzpxXpVkxTcDS50
	1TW+ihr4A==
X-Received: by 2002:a05:6102:1484:b0:609:4db5:de7c with SMTP id ada2fe7eead31-616f66c4421mr20591772137.13.1777293611985;
        Mon, 27 Apr 2026 05:40:11 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589065388asm15486376241.0.2026.04.27.05.40.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:40:11 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60fbbac2938so4009238137.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JfYDkHGwUxbaDVtLAzJFFdbLuasHwRtrYYyCxeB7shbqpQWdN68UnaC30uKYLPv56u05Ky/x93WbK@vger.kernel.org
X-Received: by 2002:a05:6102:4415:b0:605:7a45:c7c5 with SMTP id
 ada2fe7eead31-616f772e9c4mr19149950137.14.1777293611470; Mon, 27 Apr 2026
 05:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 14:39:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ4W7Gjs2uHF+JBzmbEN-XL3+pnKSWO9kugxB7BfWODA@mail.gmail.com>
X-Gm-Features: AVHnY4Jn5h6-wc2ZEMcdSg_3PErpp8tISoj2_DA77h0UJ4kFfmvlw4Y9g55jhsM
Message-ID: <CAMuHMdXQ4W7Gjs2uHF+JBzmbEN-XL3+pnKSWO9kugxB7BfWODA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm64: dts: renesas: Add reset-names for RZ/G2L
 and RZ/V2H family SoCs
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add reset-names for RZ/{G2L,G2UL,G3S} and RZ/{V2L,V2H,V2N} SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
