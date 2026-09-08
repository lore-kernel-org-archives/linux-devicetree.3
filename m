Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFCF54EEA5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872696; cv=none; b=XbNKYKCuv+o2R84pCnFhqr9YHqUYgIppsZRITJ08qoaDfzMshGLGDrthXyuZnGl+Et8waqkkKgFfrqqN2xO7jIvTDEcoBjjCyt/2Ir6BZHQRYebAXV7CJe5W3Qx+xmFDZTs1+w6Dz9x47Uvnujx8VACEg99gEXyJLnIGiFniE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872696; c=relaxed/simple;
	bh=MqL/Xkqtt9tuAW8ouTIoqFaGI5c67z7vZomae3ZWfzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbygSoN3Ti5ZMDHSitMhxRfwPQxwpFbqGYNub8Ks0EMjASY7GrCq7lw7vsVMJCwJz931EXQnVM6S18YxgCKmfDU2BnHlTPNbvO/S/1Ex5yezs88JspYB9hKBJAUNC1v+XjOQrMziG9nt1xxv1hBUhVnj6dgYmSVLWkF7ILVL7Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c7afda4515so2650817e0c.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872693; x=1789477493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6D5/u0iibTcmvkK52s1OWfcUGM+MqNy3igZLyyuUE+Y=;
        b=Eyc057h8svHiMnctsiDIFTbjwxbOgpyN4F7P06D1KQXX/WK22UyfB6J2J8VZ8/g6LZ
         ylppy2iOswc9IA+xzRPq0bdg8fFszWdSXD75CqFQcS2d2iIsS9Bew7dDrX95aRb9ug/2
         9uVOcJlBVMUpy/D2UFftsGWOf2U+eDA1IVzsdr5BWh9K+YJAJHQvrL/XRNCnWm6FPd23
         KRMt8L3qjMDqJVsmGdAhRYtqCD009Vtf+d2ejaEAvqz0W9zP+Og1kTnMNln7s1Wi31Em
         E8m1s5ARVx3FkipmKKGzOdgIxRtKpUvvEZh5nQ9SmkUyX9hww+rvlnCzX0LT14xVW2bb
         hgeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/qxPWd7rkkrGTzD84t/pISDOLXfrff5XZ01zj82uCyQre4Jw5UJeysV+2DWIeWsMFxAiB2cuyxY/o@vger.kernel.org
X-Gm-Message-State: AFuF++n0hUzpuLrqy29g0GeGSvD9QDTWUgFhR8Kiq91OQg3aKK/p8V3M
	bxHPBEqW0M32ajPUR/9dsgcHGgiXP1UFdNQQ/5Z4ZzPCZeZ7gkyEA2K5FDCFHtma
X-Gm-Gg: AYBFou2n867mF4U05NAT2+AJh+0ZP4PDAkIUViB8sYiejM90u42H5tUcZfJ80komtv3
	3iZPjo/cPd8OifTmlNqJB+L6fbzKce+++6tBtC5oVGXbYbhhNC+AGh29nfwHhFTuNFlX5b1M6nI
	/m/tr9PgJYWF58XHMS3byFVJJya3UXddfA03jEFLLjJTUAk2Bi56Q/EoCZnnlHaYrnfUsvWB9RX
	yhmNCXpRPfhIzuH9/3xqpdtzWnwp3YmCCGTln0jriXmEClMhUDau+cIzDxiJonK3dVKIIh13clC
	5P+Mfg69HFNK9KMmB8w+ai8VBCcFBHMgfcFqO2r+tMoygO4ko4hyBunMKfM+2FPNcOYgdXbyuoV
	srUi7dJWASoeqwP6pZmWlN41fn8vJ3yCiBt+PJUduZ8Zq/NuwPHz6XuVbDeKSrkPCjzVvD2bi05
	bAg9Wnn8dj1tsxmIjyeU1CPJPC+dY6uxSDXI+vLYvS1MPbAzsPINUAimdSKP696OY90dShFMCyB
	KMPt+2SMjGRWj7x/4Y4y5PWc6ez4A==
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c7ed285aefmr13753705e0c.2.1788872693287;
        Tue, 08 Sep 2026 06:04:53 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980d774ad5dsm2500091241.9.2026.09.08.06.04.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:04:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso2151003e0c.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEJ2Hch6Oaa5wv4tuboMT5wkSK4uagPhhg/rac6qYLnBWrt4xcN2o3vH7rpTbg6DmGHnkDGiZbPQ1j@vger.kernel.org
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c7ed3e2247mr13571554e0c.6.1788872692103; Tue, 08 Sep 2026
 06:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-10-biju.das.jz@bp.renesas.com> <apAT6qiBpkum_SLc@tom-desktop>
In-Reply-To: <apAT6qiBpkum_SLc@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9WPT8W9e8Zwg8bWnxXuvgHZ6-hB9cMhTXuxpji9ryx29w07MWZ9A5668
Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 12:39, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:43PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add vspd node to RZ/G3L SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
> >                       status = "disabled";
> >               };
> >
> > +             vspd: vsp@10870000 {
> > +                     compatible = "renesas,r9a08g046-vsp2",
> > +                                  "renesas,r9a07g044-vsp2";
> > +                     reg = <0 0x10870000 0 0x10000>;
> > +                     interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> > +                     clock-names = "aclk", "pclk", "vclk";
> > +                     resets = <&cpg R9A08G046_LCDC_RESET_N>;
> > +                     power-domains = <&cpg>;
>
> Same here IMHO we can switch resets with power-domains position.
> Apart from that LGTM.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with reset moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
