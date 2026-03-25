Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692D3DFC89
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448577; cv=none; b=m7+D3uilTPFudGzAIeFfMZvt2rtG0ZYioUKzr3Y8OuqHjgDkDB4soWaoXGKOmUVtz2iRpIrJ6O6w1RojeTfSUM3docWXBHN6VfplrklsGDprg8XYFfzxQ4cvbQu/puyQO5sgkZSXRic4m0xu4SCX6Fv2Dk5dItAB7/XuUrdTS+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448577; c=relaxed/simple;
	bh=rZThx79frx4t18+PPTsDrfdxpWxT5AnHxRbdBz5eNgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sESl+kXOlnw0wl+L7Q5TFiS5v6B+6cxsG//ZrzpejiCIXQSYC3ZDaT4I/+Cspt+Zp+GPnAU2R7DJ9Kcjf8VqAPRFDfGOtlVtsHKRRMxgf9yN7kxvhe6NiD5kAm9eT3PCqXNtDlRkrg3J4matZPl8+vuor17QIcikUIvyovXrzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cfe7b2344so1222671e0c.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448575; x=1775053375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yon6PYtk4fOFlVLRxERqANp3qEld/pf3TJ4Zh1FRxts=;
        b=mj1evnRg70/N++rJuC5eBE25+I8i44otjQMNgOo/gzIcnh7zqb2b3qD+IS1HfwGC6V
         E/HJVg28fKbi3sQ0v1nzB2iTLY8XLA3gGXfuZqsByyqxByBBSoJdXwIRnIRQqQA4/Pfp
         4MIx2IjyF7H4gGB/z4OYlRYMaQk3+kaiHagG/e2iHcina8vFe6ZP1jzUoUXHNIOBxZdZ
         bbsKl5DMtiU1bCdEoYR8mmqo3ZqhjvcfndMIO/ZX8O3FZWV7lKw28jwnFLjsszckTDA7
         YvkETBfgGu4F7Bqc1GZYZmdlzM/tInw099d07vYoPbNCdQUjoUD8NpqTtmBc3dRuoBem
         ml7g==
X-Forwarded-Encrypted: i=1; AJvYcCVjhXhu8m7UfOHm5kevRpFAAZ47/fB+CV3NKHWh8dKSAVXLZP6mEMj1aQMut8bucqaf0LHYWcNfvBno@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzeuqcps5A19xrRwQVY2Cpf7uydP2OJQmoDBE4qkbMuvvRZP3x
	+iBF+8BNglwHXRsIkY2mKXRUkR3aDBw4oK4Damyb6DvyDU9Hxerc8XL81yYY+qqNR3U=
X-Gm-Gg: ATEYQzyvJ5pDKAuSrrUm0ut5WyojYGtBVZEERaTH9JWdsY/SkXv9whPv6wt9lG3pZCV
	uhng4GonqaUPSWiJIr3oU4hp/AAnO4rjtmuUuIWA8LEeKyu7G/r7Ak1I118lPeXBO0XtohNEl0s
	AV80y4MCPVJmJD7NZ8XEIX0xHk9RAy64kJWojE/+qd/Udhh7kPJc1WwzEynDWLJm8pvi15M8qat
	94hlHge9FLMs4gD14etRBzw2Nq7bax73yWkQfd+zXVYcxVKCFwkb9QSAkflIwGaBuXEmd0mLSgb
	a3+g8utd/ixVQZ0jBAtyhd7tfITG50dVWMs+FDSoE3KTlLx97B7ZmnotiurpI2w5CIZCXO9h8q2
	lKqaSKu45q2N3MAIw6glTaeK1f9KhZ21bLANuHMgZFd8zRClplMstPTmPOexW+4gBJ8XN/umSWZ
	xTlnSyWiDRyaDYz+Nm/WEMZLPt3p4mFTUsDVYxpVo556OUnxHH0tGD6XoXaR0C
X-Received: by 2002:a05:6122:65a6:b0:56b:9083:4331 with SMTP id 71dfb90a1353d-56d22062739mr1843089e0c.12.1774448575157;
        Wed, 25 Mar 2026 07:22:55 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cea30c727sm18903173e0c.2.2026.03.25.07.22.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-951afc6741bso171105241.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW36Fc3zdQqBaDVpuHKtn/34YLhT1p2BcHNNGVtVMgEIkBEGqHNXmF54JRQKTIehfow1Fycd04tEub6@vger.kernel.org
X-Received: by 2002:a05:6102:442a:b0:602:9a1b:ce47 with SMTP id
 ada2fe7eead31-60378ff9e88mr1928806137.5.1774448572910; Wed, 25 Mar 2026
 07:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:22:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
X-Gm-Features: AQROBzCiHDWFWS4-xaGWn3qrV2TIjofyDBjJd04Uike4JhA4L7_5MYxpr4TAhvY
Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211E PHY schema indicates that compatible string
> "ethernet-phy-id001c.c915" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
