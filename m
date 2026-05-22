Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E202E3CE489
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458507; cv=none; b=eh3dJWwi3QaoH5k9fc7ChM1Uvd56CtbbhGRpX82M1lkiyhM/2sFfIGBjqYM/ITi1ke2wpK55kHQA5kRFVoTwM+Jox4GdZm8TAFB2dxM9f7i7NyaoDM7h5FNuZ8cUqnzuuJfPF1wEeqQA2ZFwu1aV4C3SyBHW5F0RZmqYYNlXWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458507; c=relaxed/simple;
	bh=FUrrvYF1KlCYgNZMOn/2U2OmhC3p91aW8lXQejJ1EWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDoj3vcf1p5e5pGQualwPCnV9LbfHA8jZQMnabkBPfetgZ7iDkd7g7a4PvJa3q1syXTSApDzSkECfNCPVlSW/c4+vazg5y741iholysIdHSUcMzKA4jJGQT9Mb9s+aHrHIdeDDiYWNave/DNBMlzGF1utvGu/55nv0eF2qO0C5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7b41fdf9de2so53764927b3.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458503; x=1780063303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3tqZ3OVcBR7J9y1KxfWGi4ZaR+C0ebaX/TOYg/Itik=;
        b=iZjirUF8SqB7U1PjLYFK8XWtt2GSih3jzPyGz3QlzgzD9PRpvbSiLFrC8jDSIY5Tfe
         OE1CwtglZlUpo3Q1YoMvx41X7oE/nfVSkCQIZaYvFklPo7phGFKENNUh/on3jKS+uT9w
         cdBu6RbjMnvLF1PYQhe6nfFU5Y7F8P3SxVeBSp5d35qzeDs4ShDM8lPgL2oqLrYskxiP
         F9Fo4+ASpjXF7dOP8JY3xo+LzmJ4O5p/VkguYVCikABTMTrlADt/og7midthTaAdR8oZ
         /FJmfj55v78TVn9VrhXJ1kLjDDiqglTOVa/4Qhq/GHh2AjcQyVzcZq5wkFEhgNfl6pJp
         U45g==
X-Forwarded-Encrypted: i=1; AFNElJ/VaGtSHmhDVvedm4up7R+5Ok3/4BjtVFs9VbxNlYx3BmyOwQ9DkVt8HDRGkU7FjZt/gvkJX/aQ0hXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkCfF3PzpuiGSx6Otbr5QUvln/oNCoDSWy25+NWeXpCKQCs99
	iFfpx74FoXUub6G/5chLnPXFBzXeXGktQvKQ6Kdvvyw7mTMxo9LndzG+UajD53NoSp8=
X-Gm-Gg: Acq92OEaIqSiVymV1lDozbOKj9hawW5pB7CLzQ3weDNWqyDtMi1H1TBdRzv2FOQlpLk
	LvZGg6dco4d4poEHY3h0t2NSpmEMUI8lpjx9J2LMI8CG1+k7ci7jG0gAezNP6X9YqhSF+YMaVgt
	f5FvcKPYHj98Y26slKifqvvaBgjo6yc+YUzmv0iCXG/UujjQpAt0o7Kyafoi6RhuqUA1plzNTTg
	nhUewNQ+NJSMZbKlUl4OsHISjd4mWxtoaKvkl1fFv0gQFCXWXMJNrV7dM9uTUhn5bNRmz97jK3T
	+DaBOHLu9GGb/N3iWTu9Bkn0jsUITYHoeuO/PpSVGHuKaOsB3dFTTgDnQnMrsDVCXnJ0M1gelAu
	zH1FTp6scayI0vveWaSoB3TM7D4uVXXFC99gkDrcZEdpnUVbOEc+eP5geANGAmmJFzpt2P5vcr3
	O4HmnrtR1ygR598M+noLy+5QM02oF1MpRKnEWDomS1q6bkYHdOloqCcRSyruZv
X-Received: by 2002:a05:690c:6309:b0:7ba:fdc5:17a3 with SMTP id 00721157ae682-7d33ad4ed9dmr40655327b3.43.1779458502386;
        Fri, 22 May 2026 07:01:42 -0700 (PDT)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com. [74.125.224.54])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be313c9sm8363637b3.30.2026.05.22.07.01.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:01:41 -0700 (PDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65dd9b25829so5848925d50.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:01:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FR0j0oejy+vXR2GMne6s2mx88JxEsHlZZmAMg8dluWu6ODV9hNb8W0IC7bL2HCHUFN62LYJ+UDJcB@vger.kernel.org
X-Received: by 2002:a05:6102:fa2:b0:639:6533:65a0 with SMTP id
 ada2fe7eead31-67c7ffecbb9mr1562113137.18.1779458141395; Fri, 22 May 2026
 06:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
X-Gm-Features: AVHnY4ISeZdPBYDF9Wtg2Sy3PVMdCCeL0WeBXF2maqndwrmCz-EByfhYArSf_hI
Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r9a09g087: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
