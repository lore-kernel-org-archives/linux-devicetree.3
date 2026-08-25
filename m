Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C9435EF3
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661058; cv=none; b=KP9jwkI9LUQfzpM9TTGseNAMnObEIAwIczsdRKrEIaW/WloK1aLlGljxEOHuJGsscTs24x4HfFcSr5hUMFVD13fG11ydGJxdCPECWlxenycnpQBrICZFj9o8ygAEPhlffqSs/Wm1TpD0rxwYpZc+toJwc4UwlnpaxJWOCVTx7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661058; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksIQVeQYylk98YCC/H2Y2gOGMb5eayuCNDwZeFyXl9xe522/JZHPQPRgOgxg+wxo/mrXpJ3ktMlU0g4z3SEmhFbyamT7gfbpml123Ixherf5LdIlxex93qKGNGgVDaoVQyJSZi5zgYHi+P8zJLhDf+MhA4uTzX5svHEjlKWe0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-754ac74c495so1422739137.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661052; x=1788265852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=QPXHL6kx1sSq3bJBe7tT0F+LumBz6P2481tZ1MF0MbboQOdUMmw1BGNXzvcah5mbNb
         X+GGo/rwyCtP4P24UD2SJwSIF0tY7aRg2VBykP0rkGO8IouzZZmO7lUmlAu4Z+l2+XEj
         nI9StCflVOCVYz4NL+DIu1aoOQI0iLU3FQw7wkVw4mlag5Jp6aZBWEh5LhaCCkojauG4
         gCoDNCa5fhbAxlXw5W30qsn9/XUhWb0nBOvA9IdVSJlgOGXtmmfmYSDjmXU7OEIZOBMa
         okhPLbpaUrSPZS2vamR51rQzPS7CflmSBAP2MlEmymOyUnVjwPl6pFIVNpLCX2Pk07WN
         uE7w==
X-Forwarded-Encrypted: i=1; AHgh+RrCnS9tDgwra0Wl8K2ezY+JTrw8ITd8yqynC/hv4CyrtKW8cmNLL8iGhjyivl0lKS96PXiMHALQSl0d@vger.kernel.org
X-Gm-Message-State: AFuF++mLfFh0O54/z4wCX73X7fxeYg30UzCHuTnhsTeFYGfgC1E1UFQU
	nLy0jJwv0ZGqluMtkEaMPC0uxKpFcvsju6f8cSuaqmvTMiYvsV85cvTQTDdrXV9XbzA=
X-Gm-Gg: AR+sD12HclpmlAZFkzST598hCm79iwq0A/v+rociyXc39Uufzo7/2oHFztV5rOhBHxJ
	6JNSdY/8WJ13d6AHwrhbyxXaJiolKbcD2bxVBBk1JvBwJdW+5puPlgNNboCh1KPSEcbqJgLglV0
	6azmD/900pcicJjdyjbyOdE8lSFjRvbPm8JeEskEvyrnHW4hiwunbk4OuGYEKmO7rKAjdLgmnfD
	9AdiMKOlwoztZc/pozO+pwOlBr1+K7EHqn4JxnUuJKKdfDtR/d5RykAnIHPROH6dV7ndfJnYgUU
	Ppy1UM4cWcpMH8lMU3/39lGwrCMO39CH3D1yn8MNtKWP8FTCLQlUuIC4xL/inxoqlPClrf8M6kp
	YabAu32HjNZJ27b+HceCBGQHOrNNA8kahNt1YZkZ4aiGTH8WmbCAHkcJQOcVMzAmmYAKVDh3ale
	HHAX0uoOuAUUml8tdzmzl5lu7RLvC/BlbTxqqfJeh2tArB/h7eqv8RNR4YTw9CwcFokC00G7CU3
	ADGESzeG9IJ7KpGHKcAMMJFpw==
X-Received: by 2002:a05:6102:3e93:b0:778:5e58:ec43 with SMTP id ada2fe7eead31-77a6476ae2amr10667233137.13.1787661052085;
        Tue, 25 Aug 2026 05:30:52 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357da32sm5223901137.5.2026.08.25.05.30.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso965201241.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr/x6tjiqBxSWsk5JUeO3AhCJNt9UtE9ip7OZDW/PwUGSch2dDp7t0qSRn3abx3P7Kk8s51z4+TPgCd@vger.kernel.org
X-Received: by 2002:a05:6102:5107:b0:778:4c28:6725 with SMTP id
 ada2fe7eead31-77a6434bfc4mr9788298137.10.1787661050975; Tue, 25 Aug 2026
 05:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
X-Gm-Features: AcwNN1XXro5QQ7iyl-KmnWQpVLzoicJmI0T4QyJFnTkTZ2UbLlORJ3tn7mvhDjA
Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR
 syscon for WDTDCR access
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
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
