Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FE43FD0B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661398; cv=none; b=jyOfN/iHVfo9VBjGMn4UA9O22Aus0S2qjXhVfxvMG+0+mHOknBpufj+kcuC7Ff0y70oz00Qzwej3UO0sT92k367ADX+WvRM7TvFLxFqqgpkA3iWkAGHPFpdyA/PKbt+YS/QPEDmwX7Lyvs5NIhAEtlQH1+8fZ9W/GNt2dJqQ0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661398; c=relaxed/simple;
	bh=ok07ERH/NwgqhzqDl0baL8HLrodhlClduOLX6Z5TrNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVEcx/1iaN4s4M7/frs+aSDvZL5Ou14qFJHUKJpVIBTByIYIXJaYQCVN0hj/XqSlsaSkQGmw0Sieq7ntIvG/5BfHwFdIEERPCg8dNgsn+BTxoSMpMh30L5s9XiSfFovDa6oPka37FthMaqPuU5YlpUOUCTp3VyYT3iPVo31cREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836ce6cbe1eso67616287b3.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661385; x=1788266185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PcH15y8twR6KC4dsUQbRnnIWb4o2clyuM/4NKdId/5Y=;
        b=nQlgvRuteMhCntye2o+W6Mv7swMvqBtVpurSotEioxb74MWPsKSYcXDXT+CQUSAMzq
         a9vVIkh2+AksVjSKsg/7olNC9lWHEiCW+gJ78hpVyhe4xytcLnnSLvQWVQ0SC2biTps0
         ylYbt9ChSUs5OZXnZzn/aCb6ZwAP75ZQeIXBgQtfPQOGyNMGCMZcfVPSuy7ItK3vrSc0
         MGwuqYH8WH9Al3nRH9+37KP7VNIVqZfU98ilZyHTrGOmH5ExwMg2aMwB8R4Eoa94myX4
         9qshFdVNddhfUp3xfPL43DxKJy+/nOyVbXfTzjLnWrieYeEjagmsg6Xtqorle6am107l
         /dlA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/ZUTJoK5Kiz6E2f4Y9QPQVor7uZVQqjcj9GSWB91RHqwzud9tO/0kE/fJTy+f5okepoaWZq5cEOBX@vger.kernel.org
X-Gm-Message-State: AFuF++kfQXXwxfDxBFDB90eDOXDVQ3Mh8VOVeqHgSw6qPkCQZPlBHCTI
	dR2GN0E7dJY8EG6cr1m0XxbK0Xblv0dCK4hP/EZEFmt12BbKTQOi5q7PlaQDa+PE8Pg=
X-Gm-Gg: AR+sD106iOBoh+J8PHIoB2C47jMt7w2jjVheDEEYHAGCqrGjRq8HDT7yrQQou3wSheS
	kDXL8kM6Bx3b79kJo3tDJ/xalE1dZg1IQjcd5LrNlZBa4Jpac3e2RHhu2vpb/VPVqvNAdzMDlq6
	gDFBlkdsj2FKC4yjrVJiNJb84hBBJf/3qhUra/719dfzLmdQdn/3aa5K16J4R4GoQb5B53tl6di
	XvcEvx3cd8IBV8+cNgfGp0qWQK8B5PQKyRsZpoUh5ZU1q4P3uW87AbC6VWG//ydTzitUygMW11K
	MKzCBapUT7+rNf6QpiXgmypVbZ6k1NR6F5/n8k2tu6H+OdgN+2czKE+EmSIzdqXkDvbsssKlBvh
	DCd46qDk17stJBO1jsJolbroGiMjAoXUoO76cy1ixAbrmQTjWyJmYkzRAQ1skzhRHtyqipSWksp
	quAbVWPbie60JZBk6Sxko3zvBkVgqLiNVvuoReQGfB20GvVPBOdQFnvsz1g0SErw1rF/2GuitPi
	IHdEAxkCubV1X7/Wxr0w+9pER1CEg==
X-Received: by 2002:a05:690c:8d0f:b0:81e:7075:e2e3 with SMTP id 00721157ae682-849f782c876mr112842967b3.35.1787661384830;
        Tue, 25 Aug 2026 05:36:24 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac201719sm48413857b3.43.2026.08.25.05.36.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:36:24 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-852ee3bb0c3so24584597b3.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rof/r4kyBp5t5yLILFD1O+R655iptvdPyZucJ1p0scGBY/nty4057oBHAkHSZ6KMRBNJWD8UJaho2YL@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:781:7ce2:1896 with SMTP id
 ada2fe7eead31-7817ce23603mr428191137.6.1787660899827; Tue, 25 Aug 2026
 05:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:28:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
X-Gm-Features: AcwNN1UWpDCFj0N_VaU-Rs-_PsGCZWtHQVesPIowDRB6pC65FgGL5i3thBl2XoE
Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
>
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
>
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
>
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
