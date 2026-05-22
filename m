Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A753A7831
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456298; cv=none; b=im2J8ktPEXZfSruYzC8T73r/xL591n02YPP3UsvNxw+kDX4rLPLN8H/2HOUDx2pmVCj9MvV9bf7iNg0AlNevWlTYcpr7SkDGiVhxeViyWh3ChBBp6Ad3WXby47YYlVfGj4SL7Eh3kG9YwIDWNygo8yaJpJXYWMIDiE8cap/xHow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456298; c=relaxed/simple;
	bh=0XefSVQAASZ7I3v90P4q6gXEnxt34c2YTAPuNKCjEcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp5Umqx2TURXIBJstP9NNfX7nC593FpTLg/cPkP+r+3Yzs0unKmfJ5ME9b+k4m1g2T/fLr3Ls5C31CmCqDUvsxYsx/QDN+6TNotrozvT4W/BRuAPYcEWKCPiuCnDwcYQGerUkH6GMPl3pQqIv4EVkXrQuhuNz9qsmOrOBAOhnFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so10489849a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456296; x=1780061096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZI1PMoMgSNQ27UlN6QAasFy8RXu1wi4ErH78n3sc3I=;
        b=Vta2NA2irg3tCuMd5WYOmRghU8m/7FFlT1zUrtLG2/0qmkXBSO5B8Xzs5FBm6lfeuL
         1eziWHmAK8iKyaBiI8viGDgNK42R0si29+ja8JfQ7EcqyB6jPAKzQSqx/wc8bNIIpbve
         QNLI45qdESPDO6VWzk0k4rEEQ5a5SbsJKoH/y7LyawuhTZPn7j7bGY/Kh0Co8VmXw8dY
         DmgzjPNV3L9Q5V2MKTQQtiQDBSlEtyXTmXx+r4CcmELuP1dnBvtIai2OM0nDnWZbAWB6
         UpqhXfTJ30z7XF1UXgqUD8P6Zn9Im2+az4IYxTRnjUrGbrWFWGKS4DxBYEebTqkEOjlB
         oqhg==
X-Forwarded-Encrypted: i=1; AFNElJ93eTsVCqqsQuK8P54vmTZj0XotjnsgSb3aWaoucecfav/cEIFKoneBMPLo8RwNIZ+gyVQkiviRzbP8@vger.kernel.org
X-Gm-Message-State: AOJu0YzVe4NeKuaM8s39xsQq7P7KWE0WB3A5MvKyDMOijlTmmXjVIBLe
	X9yfXOkdxDM4HL85jOPhD2i8DJC3dWc6mLHr6lWwdpi1q5oODicaJxzsv0DB6qbk+FM=
X-Gm-Gg: Acq92OEtRGdvokbwBiQ9LMR9gPswylD80HxvvAqDJtJj4FPhhe/1Yc4f2XFbTJ32yvc
	hBwil+ZQBQPpiAbMdhKM/jLOjUhA33yDHrWWLvPFgzhbGN9l/gk9IClq+OT/mOzspjHdiBbEjuh
	GCQWu6Rh2teehUncZohR2PHYem24G1Q3zXlTfN7VNyAmKdZpc7ilZzCi0zYQrYecsSEMJ7SPGcF
	f8gelDCn4/l75ozoc7aGk7ShEDLpO6KCcP2ZppnfjHXs1E++KW4Fp/1yAgDyQZADaW01Hnz3BP9
	AjcGNp6zPWrDTHxk3M261YwfUbMsZBdZocgE1WehJ376q4r2D+4CU3YCmq/1lowxTVld6OhF0f8
	AC0b1GGyNhM0oqEgzjBK/ZCokI1RqexJyVnbM2MVVuZV9VpBbyQr57SpzCvp2ksZeuMl5KrqLFJ
	ZhxhBZ1QNRsuHo+pAxCdG40cMyb6ZfRNdT9AFBMMwVYMKuDZL2IuomF+75bIebkdSFcjyu98k=
X-Received: by 2002:a17:907:7fac:b0:bd5:de3:263 with SMTP id a640c23a62f3a-bdd26ce97e4mr268329966b.46.1779456295820;
        Fri, 22 May 2026 06:24:55 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc325b5e3sm55494366b.25.2026.05.22.06.24.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:55 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso9242720a12.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9whbpLJmcLCKSj8HkKC+1zccgFeyEIglY1xl+hG+1Tt+ksHNsLK+ASXzomNAhdwHiJR8UgFwvTimK7@vger.kernel.org
X-Received: by 2002:a05:6402:4348:b0:681:2472:414b with SMTP id
 4fb4d7f45d1cf-6889c41ecf2mr1807151a12.3.1779456294545; Fri, 22 May 2026
 06:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
X-Gm-Features: AVHnY4K0hyBTxidEUz0Cs6vOI6UOPodIYHl-4j9DmEyg4MCcdO1vyiwsRekMv5E
Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: renesas: gray-hawk: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:44, Marek Vasut
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

No regression on my Gray Hawk Single, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
