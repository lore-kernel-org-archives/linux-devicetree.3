Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4513B8950
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456715; cv=none; b=fmqTG6WCcWFQc3NO6unxnbyje1sazz1EU4G7YLUzjSshgrIatfNgQtTUgERRn74hKOH3TIFnOD5CqLmb1Sby0pVPLvjFJymR9fnRlOv22o6uX6G9uAhdZN1zvmYPUjnKkQktMv+pegJA0WtYr/6eRpoNdNLNh1ZYKasEeoeJc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456715; c=relaxed/simple;
	bh=y7ZVsokYwrOCxsUDPu81piViO80ENG+JI7klgqrWxGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu5y4jlvgW7iqP08qnXZ+HRJvtCBgDQ2LWXqb8HqsGcuSKnzkfJznXvunUjHwL3xnHcw4PpWApPw/Iinj1aaKhUWjOC38DS365rW01e/EasPgjvjqBjNg/Fsn1qnrOCVuIC9oq0Kt8+aSlvF5lzVou1tjKzckoicFBOeIZUc+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5675d609621so100108e0c.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456711; x=1775061511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFcu8ieGkR264Mz98C/g1GKpVrWkvJMfG29A108tGUA=;
        b=FhGhd736G0Jzz2EeQeprN1i0GdfmBSZQZ4Wecs1t/uOWn4ZXd9pR/RzI63Ydia9h1t
         b5WjHahY1YiRsOsPKi7JakxbItA9gLNdVj/1TTRYQ6Ix/e44XK73RUdETvMgomUfNT+Q
         7RaOI9tTEjrLaNfEmPI9h2DAEub3RYZ2GbTE/0Vau1W5IVUw5EOYmTvDDEx+aP1fwISz
         AQXBSGEXUiSb9BO/hBdkB9zjdh/dbcahftjV8W83Ub4UGC7ozEYEJxDeiLApblzF+ORo
         MJfWlcR3j9WP1YFNnGyN2+DOXRvPvnUEONxp7v6Xu6Kdq9sAa6EIfdHR1FOby9vV8pK7
         svgw==
X-Forwarded-Encrypted: i=1; AJvYcCUDjQSf02H7SAoQTZYJ7otz8TFmyfrCGt6Z0PHmYysR1MhLIxsrJv9aWlyFrD19nGdj7CyLL5Q6CSSf@vger.kernel.org
X-Gm-Message-State: AOJu0YxzatXdyjUZQOfl/aj/Asm3YGPYfsgv2Md9pZ4DPTkHfAid9ALH
	dVAiGN1bQ6eHR47C4O90NGLQamrM16Aspx2C+uYgSCCBnBG0S0VHrMbHc//Yy6eBGQA=
X-Gm-Gg: ATEYQzx1HELmfzPDvH0KZlQywRWZV8ujUSsAP97bpzQIFTVr2xOQhVgNh4Cd1rlENwr
	JuzVvSHzc7ec3vXToO3JwtIHCyVLIAT7/7yjmqGZVIbCVZbvsCz2ZBuNvLHFf/xtyqdcFFYaVo+
	COMii7CESMbgLLcvT+ar1JJKGah0LdLPMT92jXPw9mr2swwztxIcGwIEHkGLTEqpocXpT/V+osj
	a8pXY+TCq6oBlguMhMtJiJySFxNt8wmxfvU8nvY3sf7W5QGeaFPRxdsbi7vRfRMkiLdIOOfCWYG
	tFOCeJg2Xt8eV18uLz7TqsE7aCA0XTPIHVgzI82GCAdL2xQRXtBZLPV4zS29pdHAH5tle1hOEqV
	G1P1JcEFidfSySUMLZbLMSUGHeXyoyuw453BUB3CTctzGeCZmcCVhSQkGIv6ma5TYgdj/ZTOYyg
	wS+4KO45Io+sXg4Hg0jL0BsCc1NzH7PvdU77GXsZSMo9NqjDazXy526RZ9NZOo
X-Received: by 2002:a05:6123:163:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56d21f3d368mr2317404e0c.1.1774456710651;
        Wed, 25 Mar 2026 09:38:30 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf7190sm470836e0c.3.2026.03.25.09.38.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:38:29 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so18721241.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:38:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOOMxXyduBFdzvdf4Q6cBptb36jyAZ2gzBWc42ylzr9ADM3PI+jY5F1QqBI/+QneeujyiJ1XjSoKLA@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:5ff:dabc:db3c with SMTP id
 ada2fe7eead31-60387434993mr2416423137.33.1774456709423; Wed, 25 Mar 2026
 09:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325162735.24467-1-aford173@gmail.com>
In-Reply-To: <20260325162735.24467-1-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:38:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnGv_vu7ZXWosGYP7-=c5wg71y0rHONUTrZCiJy5+shg@mail.gmail.com>
X-Gm-Features: AQROBzAhdR6SWkA32yBTrlPDW0lwKRWOJknvBYfCLd5RT-Mwz1g2JnCkKIPxPxw
Message-ID: <CAMuHMdVnGv_vu7ZXWosGYP7-=c5wg71y0rHONUTrZCiJy5+shg@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
To: Adam Ford <aford173@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, marek.vasut@mailbox.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 17:27, Adam Ford <aford173@gmail.com> wrote:
> The LVDS Panel was never shipped from Beacon, and there are device
> tree errors, so rather than trying to fix them, remove it instead.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add LVDS backlight, some power, pwm and pwm pins all associated with
> the LVDS panel.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
