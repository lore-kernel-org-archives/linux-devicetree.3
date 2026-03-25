Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19302346FCA
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444849; cv=none; b=hkeuoP5CcaUOJbDjS6VSRVjN94Cv/dTFjPrfGFNe6pLWgYgcuspX+r6l10dDiuj37v0NiIPZoU4Ou88HriCvaX0ptIoZopnMqtqsbgKiaypzUL0zKKK/+nYZW0gUarh5KhxUBA4HcO926dwMUClqLouxt/NYcVattKebyXDuHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444849; c=relaxed/simple;
	bh=A3BH2U/sY4o7946Q9Hmq3lUJVkCY45IcyWCVPKcRuYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4K2Xg+FX/x3gyhcyFi/b+qZ/KLMwf67H45fEN1IAyJfIo8oMXgU7FAWDMcJeK/W4eiidHsRMivEXr6XW1MFFSAAB3XcgptkRWUiTsYc4/T3WYdSELwCQjoJQLVaTph34UbsFv8Yyh537fdCvtWIvKrlWneR6unwBadQwdwENdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-669462b0fecso3843283a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444846; x=1775049646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGKhB9qy7hiwPLOMIV/4ydxNNnNMBwmIgfNydUSJ0fg=;
        b=n26P+GDIXGS5MVTDVo9YAntXvYpI3ZOiX0Td/89+ROFyZyMBmlbrkfxOwC2HLc9bQS
         7F3/kHyiyWshyO4G+r2KnUvURmuiKrZsCZg93RMwTjGe/lIGIUqu/CDGvNWd+kPbM80X
         MsM1wlXoROTUiY39LXhxw3NJaFlG5qTnFRveIbEiLsdTBGM7kr+WMUUcx1zLrrVld1Lq
         Qlch9wQz8kPIF6xcuGEVmw5HqresPFyHtnEvUhjtnLKH7zZS/r1ozzXdmGTczz6w7uLr
         QkmPeeq2efTDUBmtvBd7RtJpn4lnJFWzLXUbh2/JLSxBlSNwOSp7l+rmkdfKa5t5ChJa
         eTww==
X-Forwarded-Encrypted: i=1; AJvYcCWO4ATLAr/5SDOp41SvICqheM/OAf92WKucoZkNoC9ptdzKbFKq5Fa6N6X7dbS0rgZcTFlcv/i2N2VA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75wwZR0jARzkL3jzT0O12RzdkRolwLoYlnyZ9MgbJ5I0VRUjS
	vIeZfxk83Pp9n4OtUSogZ8MwW4wZ8uscFgvkRhE/dPvYt0fSoNyOkfWQ2aivdle08wk=
X-Gm-Gg: ATEYQzyywn2UWlEn6kM4ND6l21tN2nmZDuwSWgf7U4hsQw1Ik3P6GoO5UphpNwqf61y
	n6w+xiGVPP3W3Ho+6s4RqJLdtm7eZ27EBghz2eMYOJP73sdrDo82rPqKM5JjlnsYsJvUjJYsQt6
	ZYeAMTkCG0kZS/HYez/29ooQ+7oSkGUc5uCm5HgkzLw9PkhFxmNvlHuhaECjlK8WfPMyPpKhleL
	jWx60fJTw+FEFhaD8HJmFN3V/OhWHVWSfnKyvLJ1eprjPjraADeyEJNYGM/bL/QK5S8ycwkIkBR
	vHIShxGHC/86R482IyMcB46hTNzg7eJlpwS13YNyLop13LjnFMemNQD1pfpHQMLX0bhzLdkfwgF
	hmSN/j5SiYigFjv2iJWFvYGhgHM2wY4hfse2U64TzB030YVIHi6kMYHWNmNwTRdwnN5LDYAheef
	daLeSZrP0SYmDRntLaLvSmtZ5uOev2lJ0eANTQpn4jLw6naRMNploJqJS8+SSF
X-Received: by 2002:a17:906:9f8c:b0:b98:8e42:95ee with SMTP id a640c23a62f3a-b9a5426db5amr233580566b.46.1774444846214;
        Wed, 25 Mar 2026 06:20:46 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a39590431sm1551255a12.6.2026.03.25.06.20.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:20:44 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so324196166b.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj7P4prvR+qtLv8/pTciuCYg8vmAzsXpOljVSv+sGGbgaHVkT0+tcNGDYZzvlEppx1NJYiorTsbbrf@vger.kernel.org
X-Received: by 2002:a17:907:7a89:b0:b98:3ffc:1c39 with SMTP id
 a640c23a62f3a-b9a542bc0ffmr242084966b.56.1774444843570; Wed, 25 Mar 2026
 06:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org> <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:20:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXM8FOnwrCPXUdKmOKYUdB7qvgbrmXn8Je5FEgm6uSjQ@mail.gmail.com>
X-Gm-Features: AQROBzDEx4zWUiv2Aeo1TfPzF_xYHWi738ocpywTiKEOtgvD-VvYpp4M8-J7Tcw
Message-ID: <CAMuHMdWXM8FOnwrCPXUdKmOKYUdB7qvgbrmXn8Je5FEgm6uSjQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare Display 13.3"
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
> Touch Display on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> DEPENDS:
> - https://lore.kernel.org/linux-input/20260112234534.225954-1-marek.vasut+renesas@mailbox.org/
> - https://lore.kernel.org/linux-devicetree/20260112234834.226128-1-marek.vasut+renesas@mailbox.org/

> ---
> V2: No change
> V3: Use compatible = "waveshare,13.3inch-panel" and drop timings
>     and dimensions, those are part of panel-simple

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
