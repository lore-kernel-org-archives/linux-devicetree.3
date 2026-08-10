Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023E29BD9A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368737; cv=none; b=UXnbHmZybYmkG/csux3Osc6Gqvk2dFX2rpkOFRa935Y+r/O0VAkluxjuDbrQ15WHcHk1Cp89GDf4dMRSx42iKW7P70i53YyoscpgF4fk1ounBN40riQqGYuVNLqtnuilzjt6fSjVC5t3z/V2FstILuqKaRvpKyPe98xD5acbznE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368737; c=relaxed/simple;
	bh=Aep+teDJlwbf0Y5ec1cKht5bwgrOwhUqVAOQe+YdTw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drdqbJWZr1Mqk3Q9/k2R/tdOS5vt9hEZK+h51ktROWdDn9/o19eIW5Tgowo9mrlPPejzlZRysvtALCAH0NAJd6+F87i+xJNMP/R4BJzPDhnVQSt4mYWvkCo3ZFfRhtBNo9BGmeatJD0HRR08v65bPijc6PCRXR2jEow6jzB+BWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-979ec61bb02so389654241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368735; x=1786973535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAYkmwu6egPfLeSsRRfY8GI/sUgVMT8KKlBPc0rkkQ4=;
        b=N/q820xAW3800yYePgYrwwMZ+4Pc75/3xrd5EQshjjd2Jf2ifu1VwmeplmtItTUqdb
         0n0G9W45pShc3hF/YZJjnqO6pSYatPY2qu6SssOkpiJmDFu79abQfnqcs7/HBg4vQtPg
         rmsiFPaRpmjnvoq70MYUKH2D0tQLpTV3P9+GYiQpnYp/Mga8i0qE0DmyZsocMwIOoG/y
         nySTcydZ4KeX5kqZ7kveWNDjjol9vnvCwHYId9AZzJqzqLR+g2JClZAXUxOGw2/GintM
         Ur7Giz3sUxvDG2lnOmRLDISnok92yhqdui1Q1lAj/q7ZNQ9pjCADbdvGR/I9m7l468LV
         zOzQ==
X-Forwarded-Encrypted: i=1; AHgh+RriuwjiAltkw/2hreDZN6migILh2hxaONIgKeF4sR41uZTxtsQLPcwZHNGOUwrX2tlbFjLiR0eZhx4j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ljrT1BileQg+gHxmxpU6eaa96wutISfppMXgEOkX5oD8XkvL
	crsnzyIJJZpN5jGf5MsVsPmq8x22E+Aar33u7pZd4EZaGi6oxAEGE4k4wRqvIiMP
X-Gm-Gg: AR+sD13/GTM5wlUWo1B+6bjy0qRTD752mTXQH+jTgDDuUx1cnDQ9Rxt8s6Eu03KUYg9
	5nGfX9GNBmoRXqL7Kih8MMw3QsogjZjyUV7tq7+neGhHFHpaGTX7o8XBJaQiOJcYpmXV/UweZ2p
	46wD1vNb+Pq9B5WAFqZHt9rAzPVbPCX8qN9/c44unoGjdDsTgct/s5wLAPeiRee6hnx/7+iN2cC
	WH4+J5aRkpBrHmxUk+NIdcQnyFKxJ7TATUXFWTT1StP+zAnKdanjDnxl4YVwrgNuPUCF9dp1z2D
	NHGNwSp0NBbVWPv14fGqrIbgel9UFXz33vNjwV8COv+R9qIlOivScnlGAD5P96hmYIfVfG55sZj
	4Wyk7BOdl13myR2Ved6qNoNLrE4we/R0up9QXkbazIaAgiUIRDaMwyXx3pnTajykn/QMn7bIpot
	7JpmswMdEjjkno7g6XrHTO2/pAuRuOWzo4DxMVH/2ikhTi0aTwrvfKSaFHCkvQbOWPGdIgo9u+A
	Al3i41VP5IpXX7U56rg2xj+IQ==
X-Received: by 2002:a05:6102:32c7:b0:74a:b5e3:e96f with SMTP id ada2fe7eead31-764e5537febmr4435627137.7.1786368735568;
        Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-764013f3489sm4741971137.12.2026.08.10.06.32.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96723c7151eso455896241.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqp+/e7qfvYBoFzDDHsI/ZbI1IRhq0961mVnY5TgJiCjfoM9KcSnieN+ZPSaR4NcXQqMBxtrM7B/0/C@vger.kernel.org
X-Received: by 2002:a05:6102:5129:b0:745:31e9:f3d9 with SMTP id
 ada2fe7eead31-764e42f6f3bmr4278378137.1.1786368734822; Mon, 10 Aug 2026
 06:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVURU+FEKk+6veDCm=hyO+G+5=nRrY-7gO=9WHdCWgNdA@mail.gmail.com>
X-Gm-Features: AUfX_mzYGDDJkWYPMaKDK6-tLiUYUuFIuNBGVT1WGjCUgRjPIFMG82sWBjDm4aY
Message-ID: <CAMuHMdVURU+FEKk+6veDCm=hyO+G+5=nRrY-7gO=9WHdCWgNdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 23:03, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct a few white-space issues, like using tab after ':' character or
> spurious space before '{', which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
