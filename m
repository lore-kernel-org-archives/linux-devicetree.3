Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD8382F03
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407296; cv=none; b=R4fk7jKS/z31A/UAi/zpps3xNtAX27Odmwp7PgiKaLsDsKB1TN1rOZVD8N+KdOr2Uaskzsp8HJt/YgkbbFKYedP6x5Zok8IMPLj3qhpsOTsHfwAc/5ZViRKrV5aVJkDKS1DVK2uVgFq21s8R0Y+oWhBjAYJ6bfVfm/V4FQ5JxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407296; c=relaxed/simple;
	bh=Vsfrgq4Z1iO5Wgf2nTiGn/7pth86QSJP/A56JZdeAO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLT6lAbtcazHYibPazl+H37zhRuTOo/0ugvWtw1rN6FEqCWe1gH8Yr+6O9eFI2+lR+1qJKgMlZgrI2LvPEbMCXilWpwr4og/Bn6Ri9764OkD8z7n8FRCdnvxmOHfAktfUJxVHjg6KyMONFmwQ5mOdcRLWbWBbkF90G+eRToGIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca939aso1684181137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407294; x=1790012094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0NUX54nJDMCbpqD/MoUkH89fRfTiAlUe06ZP87dx3t8=;
        b=hSWaHD8KkqGubNLjsj1QXNra/lwFiml6xOhyHy3eVnM1OZdHG68/rXSqjV3rS2f2wU
         6U63obLoj2iNONxr45k2R0adbXAwErLkJB9l3EHlTs5bD8ZnvEMHqY41iSt/zz7mKjIt
         uuMRIG78uZTF6D5MDf1ADW44DphpN/Xv0dlEmidPym7z6HMCR6tQ5xc1BFvENISeOqtQ
         LFZxXPByIFCQoOiSTQHCeTvbi/kMq/qDNGSh6dVRyy0KubCkqlqtB5EyDx85C4P/UwKZ
         b03o387JUmXyCjAM1fH3Pwdt+j58XCId3g/bv/UAWdw3BjCcqrpBNrGduN+L9LXrGCXU
         lDkQ==
X-Forwarded-Encrypted: i=1; AKwUvBweRVKLzMyFr0xYQkmaioG3k9n9GM4l9BRWnlS2FYNdB/F7lGlGyEVUHYa4k0Km4QeJQApS1bleFGWA@vger.kernel.org
X-Gm-Message-State: AFuF++mmvP8kA+CpdShpfbjux2Frz8+pSeUaLOfZO36JeSj8AYQ38xz+
	pbrxy8OzdhqYU36XOeKcTbUosh87repEqrKRxd3iNDZFA/QHPGaNp7Wb6EU4KVyZ
X-Gm-Gg: AYBFou2g1D++6AvuAMl2A20vVsMMeVtNoj6zUqouN5OWIMobNNcfG1qkQB9RyPKMMPZ
	trE2Bg85OXnq/44c/VCrGpFbDENTple1nOCtlUQUy7+GGNgUZYXHFnBxdO5XbA+znzf+pk+8/ze
	oUwUeBnYC2Ju1wUjKHeN36c91ydX8KU4RB/+6byHhTi5hQkopvwTgGr95iZbzogNzJt9vua0r0Q
	cT9nJy5QzYZtWmNat3LbN7Medp68NAh6DEcfzUsHw2SCWWmUwAu4G1hdFHAbcwgwVTQXJ9cb9NT
	x8woC81/2VJNuxaG1y6i/z12l6IoLHlGCUkJnrb1uWEICw3gD+uVKBQWY8GkuNMYoOxC//dgG28
	G8tYf/qYjnw26I44rDSOKHkvKvHNBmOL0PK9KZvsQ1JReB8wcdEL/tqPE5h8txWq63ouDY1kS34
	fFbfWNU9e2nkyHWCne0nCXcAzAPSPDyWmRfkAV5YEG+PLyfss+IpwplI8QnGHMvU7CV5aBLYMG6
	mOYJkJdhcAHXB2FZKe4RnpkgMpGj4m0q1O+JA==
X-Received: by 2002:a05:6102:292a:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-79b5b681515mr1850450137.11.1789407294223;
        Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf17fsm10914215137.3.2026.09.14.10.34.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-98296941f1fso1397994241.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxv+hiWDl3tk3VjBqWUZxk7ZqXFHVo09D+j5/yWFYeOF73c6Tz4EN/Q5jpLXhnQNhBV9JUaFirGnvl/@vger.kernel.org
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id
 ada2fe7eead31-79b5acb355emr2241619137.10.1789407293829; Mon, 14 Sep 2026
 10:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
X-Gm-Features: AcwNN1WoxHDmzn2F97DUjx3relfUn6leVozV88qE-5Mopf8vJX_28JLL2_fcd10
Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
