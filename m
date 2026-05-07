Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540D2DAFAF
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139813; cv=none; b=Rg6iqBl2nq+iYr/cOpkOXtKjW2dnsyOW8SnG27ack6+crnOdLyEQoN5VMD49ig1zWGKcq7M+NxXlL1yalx+5lIwTwt9lTNKh8RNB1idniPFxtX9aV0QHk8RC8rPVLWGDE4lUjCK2evNvxyH4sSSQ6iX8WHlGdw1FSlNXSnmxxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139813; c=relaxed/simple;
	bh=BCBnzIbovSj6nZkSdLu43I/N8uho8yIG58ObXHwQhSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRoBu5XIPEWcYDjqVnq6UFrkWt/J6CVvtV4ZhijEFwf5RvTpzVp4G9VTrqtaW5cdiJF+4qhIwGeZme9Qn7mA5USoyFFKMg3Ru2FHZMROk8UkHt6jI1o0FZZH5tAs7EaDRkk0WP88JPUdLrykGsXcu7mage/JDDJgV3uTo9AEKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-365eecc5885so491157a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 00:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139812; x=1778744612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egy2nC9k2RFpcPzSIv9jZ/VwU1PCVKckuVqW7m7bXrc=;
        b=qbp0rBL+yFMgZb3mjuuI+sGW5eahvcZTFwlyAJOazdAmbwhaYXX8/Y/2obtmblqgJu
         1XRD6xJP4U/KW1mTQjkmTMibq+SNXomLUenqFjV+E4tfHFoGgbM2/S1rkxCLUZPlUZiA
         C/2rAznLGUPhtQgWEzVysc/KkaVqPNmUge/jdrvPEUWeY/mIqEyFSfo0wESEOBHlsDaC
         uYU1I9qnJjISfAOfU6TAPAuhb1rXmEdWrO1NYmD8Rh40xgNVVLU6dlDaRhcPlN3O6vXe
         Jpx/ZRr8iVFxkJA6d10uhC8QHRm4jJWz+RhYBK4uJcKWuenbBdrWkNAATaitXUlHZags
         Ju2g==
X-Forwarded-Encrypted: i=1; AFNElJ/na7ut+u08OQDk/bCiDFH5R4DKzqOQG8qwvXo3EPoJNUO5cqT55l+9GGx+BcNDFr9choVgOug+OgSL@vger.kernel.org
X-Gm-Message-State: AOJu0YwhpKJvSCfZW6DJ2Wzn9P5BUYVjXLTMqfykT7dZIloRgmWBb2Js
	EvnvbXutW6yUHTNe7I3bTIn0msRRSK3fkbU+RPFp46bA/SNV2uO9KwRwwdxWcfpVsAU=
X-Gm-Gg: AeBDiesB26KaNS0OYkm+sNunFIvi/cG2CPb9nrAHFpuxybtoQP+RLlCq8o6EY8pTi4f
	KmADEeYkT6I1hbMd1lrVGqcSbysV3uJUS1B3OCs+rKDlLcg6VZuUcS12BcGjd6SZHNGxlT9qCZz
	JHtuZErh3qWG2bYK+sh6XVhGOuYTDfRYGHb3H7mZGUpQ/78T9qKjvg/BCHAUF3jGnf0yVrB8eR3
	8RJwxjJz8hnZ5bcaG0V7zG8G9zvbvJ+/zQvRZfPYbBCPN+36BantgFlt9vE/etqdPZLi/gl5Pz0
	E4whiAWNCjlAQJGzKhK0eiT/EM/Aw4z2YaL/f1oZ+z3Iy1gl70IHG9barwn9R31QWIaOvvWtJpr
	RVFcfJqbv1MEpogM0p1Wpkb2el1F6ZI2iOdkMJR/9zsTXjQEyjMhdJw/r9Hah0+1UOwAT4Ve1Ug
	67YNTsm+m1OS+4dSFZ4btHANqGK+CWsetE6HCifV0cu802BZihwxRjfn08ffLXVGqEZG602HfLB
	lU=
X-Received: by 2002:a17:90b:1c8b:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-365ab9dbfdcmr7184873a91.7.1778139811789;
        Thu, 07 May 2026 00:43:31 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadd2826sm21092595ad.45.2026.05.07.00.43.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:43:31 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c796163fac5so358797a12.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 00:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YG/o8Vj9c8yycYLAdNOxDJPbbe8/Gf4dbMKSEOUnLFPvTpOVpHvV7sSrUb4OhroIed36QeohvCyWJ@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-630f8e752e6mr3312584137.4.1778139466906; Thu, 07 May 2026
 00:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
In-Reply-To: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 09:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
X-Gm-Features: AVHnY4KGlUYo0uuTDH3tynnil_8H5d8OEIYrlJIco2kr0W3O9LQYd8HP5vniIEg
Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet,
>
> I agree with this part.
>
> > or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> I do not understand this part, please see end of this email ...
>
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
>
> I am unsure about this part.
>
> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> block contains multiple Module Power Domain Gating registers (MPDGn) and
> multiple Module System RESet register (MSRES) .
>
> I do understand and agree that the first power-domains-cells cell must
> be the identifier of power domain within the MDLC block.
>
> However, I do not understand the second cell. The MDLC bindings already
> contain reset-cells, which should be used to refer to a reset within the
> MDLC block. Resets within the MDLC block are operated using the MSRES
> registers. Why are resets conflated into power-domain-cells ?

The Module Reset Destination bitfields in the MSRES registers are
2-bit wide, and control both Reset and Module Standby.  Hence the
same register bitfields are referred to in the power-domains and
resets properties, through the module number.

Module Standby controls the clock(s) going into the module,
and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
firmware. This is very similar to how MSTP (Module Stop) clocks are
handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
clocks have a zero rate :-(.

Summarized, the first cell is the power domain part, and the second
cell is the clock domain part.

So perhaps I will clarify like this:

      - The first power domain specifier cell is the power domain part, and
        must be either the Module Power Domain Gating (MPDG) register index
        (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
      - The second power domain specifier cell is the clock domain part, and
        must be the module number (0x00-0xff), composed of the Module System
        Reset (MSRES) register index in the high nibble, and the Module Reset
        Destination bitfield index in the low nibble.

> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
>
> [...]
>
> > +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +
> > +/* R-Car X5H MDLC Power Domains */
> > +
> > +#define R8A78000_MDLC_PD_AON                 0x40
> > +#define R8A78000_MDLC_PD_SCP                 0x41
> > +#define R8A78000_MDLC_PD_APL                 0x42
> > +#define R8A78000_MDLC_PD_CMN                 0x43
> > +#define R8A78000_MDLC_PD_ACL                 0x44
> ... what do these numbers represent ? Shouldn't those be register
> offsets from MDLC MPDG00 according to power-domain-cells ?

These are Power Domains that are not backed by any of the 64 Module
Power Domain Gating (MPDG) registers in MDLC blocks.
It is not clear to me if they can be controlled manually, probably
they are just always sequenced automatically on power-up.  As the
documentation does treat them as separate domains (see e.g. Table 14.1
Power Supply Voltage Monitor Functions), I figured they would better be
exposed as separate domains, instead of as a single always-on domain,
like on earlier R-Car SoCs (cfr. R8A779*_PD_ALWAYS_ON domains number
32 or 64).

See also the X5H_Power_domain_structure.xlsx attachment in the R-Car
X5H documentation.

> If those are power domain IDs, then I am unsure why e.g. for SCIF the
> domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts:
> renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

See the "Module Standby" attachment X5H_MS.xlsx in the R-Car X5H
documentation. The "PERW" tab shows that all PERW devices are located
in the PD_APL power domain, which is always-on.
This is different from e.g. the UFS controllers: they are located in
their own PD_UFS0 and PD_UFS1 power domains, which are controlled
through the Module Power Domain Gating registers (MPDGn) (cfr. the
"PERE" tab).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
