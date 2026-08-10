Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B95418A36
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373436; cv=none; b=ckPfl/lSnoH0Wd7dBhJqiX+blC9rLow7yN0AzYyGtGCg8RAsjyIeRCSJsLhccoySkvl0n8YAog1PL8s0A5V4bscQNenz/V018wLOMzXFK3nzt9KgyKyf6iWuYNjL4cGyPd1VOTHJc+OEpfiaGCjBHEkX1flz30Idr7AtVbopM9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373436; c=relaxed/simple;
	bh=n5rMYOLB08GVMHx1R8PCKx0D3UZSKzHrcfaS81rxPSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8O95/Gykr8fHP7RshSV26X7TMtKKGiVuGH/HhWWQDveQT1W1aPLBE25F33F4ZesJW/o7OgwOpiRZriohlkLdTlT5IeQPzQxEn3SncPyk3KDdXj4YFN3pa/bOVB0+7ancRo8gKNCrISNv18EtgYnPtIGlovlrTkTeluPfSqtRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so1516205241.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373433; x=1786978233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDUVqF9bGKPqsW39iH6LzgBQf6STHLl+9ztnXalCrFc=;
        b=raDjkx+ns2qGVGr6g7PHNXEi9H5fd+Gb+cZC62/mrqb1PuNEzgMs0M/qRDnFeYgIL3
         AS9uHwnJNl708nzoP6d6uWIalfdU9tcLSi74lqbBvSujgVXU9odgaAgmmnKy50sKHhdw
         o6/anMggVBOu993rkkR13iFXsIsshjfP0LzGUqLFb6DhZMWM9AFtUWAUcs+ErfkIUgEm
         1kCOJPcf6CeFNbHeSgUTo69jvwMyCnmHRynRczXLyDVnV+RQXoVI8SO05W5lczITeg5Y
         3tw6kD1CFXpR/P2n2iI4HV1+s/gYamEWDMvNBcbEGIm+VNgca+9B2nCtZFpM5/6a22Zh
         tfvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+eCG9hoctNLF55aDRDTcX3buoDIxrkTvW/tpzpjCnyYg1q5o7AjPEQAJqZ51qdwq7ZLlzQYC0c793@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjxZ69Ebn4oBGLu2D+zmKiDLuHeIhjutUkePRKrcRwkmSztVR
	yVwOHk6hydctr7ydYsyCLxPHr5sOb6w3imLlVr6jBaokWGvNSQG+mJ8fxXPoAaM9
X-Gm-Gg: AR+sD11n4B7QmDK3GJh2LpBUMrv1FtDOjTl+CQHELhkNrhbuYU9C8orqTVBW35s1xtd
	tLLtLJi0zx5CE14nPn0e+LJ9OybVatyLpyz6T5wx12la+03LZkSwZyjG4OZIigemCefaDkdfhQh
	yP80S9Ks1TsXx4lUaRKUbwAQaidnLpmKlBSWfjqsBlqg4uDNbBGUNUVrPrP9a7mfhYF5IP+lWn1
	7sApxGgVAQPHAV81Apcjdq30cqmNFsDnk2d2lFHS+axDSpyeS7sP0urZFpiEoiqa7Q19WM+7MXd
	ebq/GhKaNmO3WBWnE70ZKJBjuGKY8zbS4mFBtj1B/sAyzxtCQUmONS++MG2Vd4Ov+Dl56SyQ6HM
	1krlrkuB+79NL7kQL//REUOK9oH2Bz4JLTNdlDV/I7bJFk9tAnhK7VfvsZWF7XIE/xVzd+iEZfa
	vwVnu5q5kCy4hCQ9DSNu+7Y57hNVAJNTvYdljdp+Db2fHnTwx7PT2YhjP1hQIf7HnwFLFy8C1Ty
	vN9D/khzQ5w/GzzzIxHUkxXiQ==
X-Received: by 2002:a05:6102:a157:b0:744:e49e:df75 with SMTP id ada2fe7eead31-76522a3542bmr1218803137.21.1786373433471;
        Mon, 10 Aug 2026 07:50:33 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303c3a4sm3712841241.10.2026.08.10.07.50.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9770e900464so1568244241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHF6VpfUq3bWdSh2Rtpsc+GBbMbTECwTq2Nsbsspha6/MW5hIpV39/THjoJ5nMc9KMBQT7AYjRFvo/@vger.kernel.org
X-Received: by 2002:a05:6102:2082:b0:74d:5456:b6fb with SMTP id
 ada2fe7eead31-7652241d10cmr1596982137.16.1786373431244; Mon, 10 Aug 2026
 07:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
In-Reply-To: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:50:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
X-Gm-Features: AUfX_mzSDh0l0A6CyrHddRhefJg-h_HSruJEAkSrbmndCIqd_rMaLktXcM1WovQ
Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series adds minimal support for the Renesas R-Car X5H Clock
> > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacin=
g
> > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > These two components are closely related, in the sense that they are
> > both supposed to be accessed through the ARM System Control and
> > Management Interface (SCMI) on the Ironhide development board.
> >
> > This series consists of three parts:
> >   1. Patches 1-2 add DT bindings and DT binding definitions,
> >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> >   3. Patches 5-6 update the DTS.
> > Note that this series depends on v7.2-rc2, due to the use of
> > <linux/device-id/of.h>.
> >
> > Changes compared to v2[1]:
> >   - Add Acked-by, Reviewed-by,
> >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks()=
,
> >   - Drop fill_clk_map(), as it is not really needed until SCMI remappin=
g
> >     support is added later,
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >   - Sort MDLC nodes (alphabetically, by label).
> >
> > Major changes compared to v1[2] (more detail in the individual patches)=
:
> >   - Add default support not using SCMI,
> >   - Drop everything related to SCMI.
> >
> > Note that this series does not use or rely on SCMI in any way.
> > SCMI remapping support will be added in a subsequent series (old versio=
n
> > at [3]).
> > Full hardware support without using SCMI could be added, too, if anyone
> > would care about that use case.
> >
> > For testing, I have pushed this series plus additional work (including
> > a rebased and updated version of [3]) to [4].
> >
> > While I know it is getting late in the cycle, this work (especially the
> > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > would be good to have it included in v7.3.
> > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > Ulf: It would be great if you could take the pmdomain patches (2, 4).
>
> Patch 2 applied for next, but I left patch4 for now as it didn't apply

Thank you!

> cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

I guess your tree still has the duplicate "default ARCH_RENESAS"?
Patch 4 just adds a single line there, and the conflict should be easy
to fix.

If you want to send me a new patch, please let me know.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
