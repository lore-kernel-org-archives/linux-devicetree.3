Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F23ACA58
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641300; cv=none; b=MKQ0MB0U1JBUo+eVPlJv2KJupDtUwa9iu7o2SzgR6+mKG2U7EQqEWPLccPGW6HCoExHw4MmhcJctt5VPyE/8lrw92laz0mswr3V4GInRd0RA8pzDa8mgW1pICxb+WliJo7hoM00oYdrsMQipxOXOmxZSTxAGOC7j/qEdYRBGVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641300; c=relaxed/simple;
	bh=O0dPKIPUwqcZQdDhmwfagNKRPoro50YwQ5jiiYuAkY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUq9ysL/y1xRPeMLcP/CqgnWJ9mzCzAfbRNGo16/RxErnVWCqxW1cVEXICAFwjVYGLUa932U+8tiz8CtW149ghaGMT31RKcwC1KEwdHLKIRdYA+p+3wtA9x3pPghrgLR4i4NAETeHlm2WAZwBBstIZnY6MZw1bWBSlht2te4GC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso4687229e0c.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641296; x=1776246096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quvvcejYXNcTSghIu/ABG/aBBVzSmRl0OrHbMTAKiNc=;
        b=kDHBxpFg6DX+kLv9ImUtSgDnSyGO5Do0qCSszbML9CKZsFkjzDhvlxqYn8tAWq2IMh
         nnCR37Qbe1pdQ1cefM906uU1lAAL4vpNIxG35mCSoU5/eMRhOZlqeHYn7xLPdbc14Feh
         wPu0rzKWJatS+ygtP+Blg+Yk43C863eaGQLuCD/X4luTBz1KZpgjG8dyD6Mj9/Bnf/i7
         bIw3CE7FNhW+npWVdK6P/RSClWWkmJOnnh6XhDRIXaUz+Usi7rFxgNox58chZAysvzk2
         cS5YU163mDKfGBZmhS7lAG/QwKFQ2yyQNiF8jZCW6Ze+Y8j7tGYkUE72lTX8nO68xZhz
         L5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg4UdmIr/iEPA2wp/qLOHrVLZGxfcqVGNitJDN23XjfZWYi1eD8oLrkOhJVePx1Tept1vMMhOfG1K7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyps4K5E4fBWdHPjcy+7rrxI1EY81AveF7eyoyaMqjL1rt2ajt6
	HeO26aV1blquyczxbJNrGYoNwdmKYdtJQbuxeFbghQoYS6MmDrZ0KOq+AWLluGZ9
X-Gm-Gg: AeBDieu6eSBrU+ZQrJrR9DW4852c43dt+D3BA3eEacw4su5PUYvxwvC3p/ktAdkDbIV
	/YBJ/xLGopkdttVksJT+Lufx0tmB0aM75gOMV62KvMuNd2fPt+xeS7fes/Ln6ZgdZ9loFbi7w4d
	a+DY662iAxyI008/x0mZ299xpUCyHwPQbDgr2lzq5DAjoOfRirxM4WpEcCoG96kOz4s4T+fpFTE
	ZWrHvTVngbPCHzrRaD3ojK+AIbu/cUbWeQAUiyStkIXFx4BLJ7kQKmoRtOhYX9nSEC6YmUQU2sl
	s6r2SilzRRURySqpj/csZ744JmitP/SSsGYwQogNVVUP1BFqZxX9uzcRyAc7fDzdQASchgPTKPr
	65JwqBjeu1y/r3R2cAlMmt/NVd4i5RxKM53nf57bPUQza6pMZ3pGrYHylVZ2QWavS2ehKWVEhFp
	FNsBx9xKoeSB6aG5Bhf/kuk2spAwVJgxPatE6WfYOZBytzvaUeJXHxQO5TubQcSc9+rbw0Ly+0f
	F4=
X-Received: by 2002:a05:6122:1684:b0:56d:a7d0:e6c7 with SMTP id 71dfb90a1353d-56dab81d7f4mr8239876e0c.1.1775641295730;
        Wed, 08 Apr 2026 02:41:35 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm19835454e0c.7.2026.04.08.02.41.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:41:35 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso6265493e0c.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMXa7IZ+j3zvC5dSQIFQJGh0Y8Y6oR3qRn0kDN+8WK74WiW/0kXzWbK0wbd9XJSOzPNCM59hIVDd4y@vger.kernel.org
X-Received: by 2002:a05:6122:a5c9:10b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-56ee9cfa0fbmr3844058e0c.3.1775641295235; Wed, 08 Apr 2026
 02:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com> <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402090524.9137-25-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:41:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
X-Gm-Features: AQROBzD3bL2aOOG6EzT_imFnbWnAbXmWWZH1UF0TeTlDTbev2ZgK_ZCcpyzlvIk
Message-ID: <CAMuHMdVLb3Wj=4qK_5jLsiN28i2LDYPVH9ch91Y6e8XyT+yjjA@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 11:10, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts

> @@ -280,6 +358,42 @@ &sdhi1 {
>         vqmmc-supply = <&vqmmc_sd1_pvdd>;
>  };
>
> +&snd_rzg3e {

Please preserve sort order (alphabetical, by label).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
