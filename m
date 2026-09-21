Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24F3BBA0E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975536; cv=none; b=UweLwKMKPu744qg4lqnEegQK8sToQs/hdcmLUgwKj2FBY8qiLCRy0AvAJacsy+yVf66YLpt03uN6qzjfEBiYPmV9IjPrf08GfdskrkY8rm88kfHSq1K4UxOlNUgB+kOEJH14q48sfTtERJWDc7GTPjt5JHNWjQdQcnNs+em03V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975536; c=relaxed/simple;
	bh=6tKTGDS6JtG90Il7+2qAPduVfkvtwUyKRtM8IGgWrL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJ9P0DUWO3L8ygulZwpx4b6v6ImTviT+T650re0xYae5gC1FRSFOrvTKHvVeWRThesrOE/JHNLwjT4ktnFxl2+GwsMw4JFkHjZvOD3vWdG3Z21epJ65VwnGDFz3RpZIz1XZhkWPSFKZCG98xFJKdtBQBJKlBPjRf2mCMCVVFQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so1154688241.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975532; x=1790580332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Z1SbtUTgxZShJMFyPJ1MYGOC5nK1asEC/Nf/hEw6KQ=;
        b=1//fyyGFk2Ep5U9S+8NxA5EW4u4vof0qw4YfPHHDWATMfrXYaQmaD5r3PLNzTcx3xA
         g7lDXpWk4Tq1VnicttBkro7aIIHPbglGe8V4Tx8X+Ptl2TOu7Nz1K1bQcltA7YSObBcw
         EzdXJMdH1dcP8e8elAzZiuPm6SZNkPaF7wpTDx+H9H0/YZ9CqKQxIk43Jr6dQuB/vFgN
         LuS+PgRdjWzFzWb6PU5emzKJcx1ucl5ZP1HJXwLlZa4FTTqP5txVo/80J/rF4v+WnEj5
         ilBLj/yFa2TUW2vJz1rIbwSczRLfroHtw+SiLmjA6Gl9lwDg6HCQOWly2Zj02Kh29p6u
         xkRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPB59BQWLoI1gD+lAwDJDl59ffb5XxFMAI7JeP0N4z0capWGLim5DXT2NuIX3I5LfKK07uwxbPJ57t@vger.kernel.org
X-Gm-Message-State: AFuF++nGLJzzUCabEgWLcpJER59K2N0riZtrKX6ldc2IkNsjeCNjQf10
	jyXQ0UsNQdvAwYeUovfmjs52n5sKXY4fqXIjyM5ge47E64olCgQH4aelspvow5Zt
X-Gm-Gg: AYBFou1l5UzsKxosPvKS6Kjy112pUqckhvLV7huVkC3M83mEKq/f5yOKrRE0yWRw7nX
	Ia2PPfU6e8Yxo4m7POl0QiaeeKUFEd5JCmouPMyrLBrFgAwkqJKuFmu77nnyAsihJOYMkwcnZu4
	vhS0jyNrnN/KoufPxitR/ljyIF3gnftEeezYHLs7UhReWDUQMH1VTTArNFUjOOM+ssZ4Cw4sl1I
	1IYr7US5rBpDJJi7/7I7mqbsWf2jLDECwAeSd7drQgkhPvbrOTkBgS7alPFHb1MpgqtTn5OlVKO
	z1+J5UngCWByDz6f+V65ei1/upepL04/BrcWZ27jwmWPKusziqYjIxOvE8ORWRhR6kZAjiSOcmg
	5+U0B0WYlScxSCOIENoxTk9RrwzP49/4s/bWR00qdcoZTSi/NZJEf9sLmqor136ze0/nWIY39ey
	nYAeKK8idlcw5h7w/IS4FRShkMWmFYW0Q7JhU4li/odmWkzJXNYteTGDo8YaFK0KfnBo5Npc89T
	eM0hiuY8XofDOpvZMG5lk1cy5fXjyimtaYWaScTuA2hN0k=
X-Received: by 2002:a05:6102:91c:b0:7a3:2e52:1163 with SMTP id ada2fe7eead31-7a55da9b0damr3569974137.26.1789975531686;
        Mon, 21 Sep 2026 00:25:31 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a74ca21394sm5826620137.3.2026.09.21.00.25.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:25:30 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a7003f9f5so1736222137.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTRxF1HXVYeYONYjTkgBQjxMYgSKy5uCbvrr4CmkxCzzfGccDVtgzhxblLJlreO7ECNN/gAjySUJCK@vger.kernel.org
X-Received: by 2002:a05:6102:41ac:b0:7a4:e550:eeb9 with SMTP id
 ada2fe7eead31-7a55d28bba5mr3601642137.22.1789975530039; Mon, 21 Sep 2026
 00:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <60988ce9c4913014e255ecbe127e93374f6a2295.1789570538.git.geert@linux-m68k.org>
 <20260918200033.GA1667835-robh@kernel.org>
In-Reply-To: <20260918200033.GA1667835-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDmZs1f+co7EcC8+yp4BU8iNo-1c-TNg6Xe8nYLeXOpg@mail.gmail.com>
X-Gm-Features: AcwNN1U9s09WD_Fc6q3FVUM3sMCtDOgMMGz5EOC-0K6lXxufMm3wQwxnxJmg5fk
Message-ID: <CAMuHMdXDmZs1f+co7EcC8+yp4BU8iNo-1c-TNg6Xe8nYLeXOpg@mail.gmail.com>
Subject: Re: [PATCH] spi: dt-bindings: Relax node name suffixes again
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 22:00, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 16, 2026 at 05:18:27PM +0200, Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > An SPI bus node name can have either a unit address, or a suffix.
> > Commit c4fb6880edc15866 ("spi: dt-bindings: restrict node name
> > suffixes") restricted these suffixes to decimal numbers.
> > However, SPI bus node names with suffixes are typically used for
> > board-level bit-banged SPI busses ("spi-gpio"), which live at the root
> > of the device tree.  Limiting their node names to numbers is prone to
> > conflicts, and may cause silent overwrites, especially when a stack of
> > sub-boards or expansion boards is involved.
>
> How is that commit an issue 3 years later?

Because no one cared about avoiding future conflicts and/or no one
noticed any conflicts?

> I've commented on the case which I guess prompted this patch.

Yeah, "spi-ws-2ch-canfd" referred in the Closes-tag below.

> BTW, "spi-gpio" or "i2c-gpio" are not good names because you can have
> more than 1 instance.

Yes they are bad names for node names.
I was referring to the compatible value; sorry if that wasn't clear.

> > Hence relax node name suffixes to alphanumerical characters, so users
> > can write more descriptive SPI bus names, which are less prone to
> > conflicts.
> >
> > While at it, reject empty unit addresses.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202609150228.Nh4nZzbQ-lkp@intel.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Other subsystems (regulator, i2c) had similar issues, and numbered
> > regulators caused conflicts before, see e.g. commit 45f5d5a9e34d3fe4
> > ("arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name").
>
> I2C was a case of "too many to fix". Maybe time to revisit that.
> Regulator binding is a unicorn and not a bus. I really want standard
> names for buses given that's the only way to identify them generically.

Aren't "spi-gpio" or "i2c-gpio" (compatible :-) nodes unicorn buses? ;-)

The issue is that they all live at the root node. How do you name
them in a conflictless way using numerical suffixes?
  - On the SoM: spi-1,
  - On the SoM carrier: spi-2, spi-3,
  - On the expansion board (hat): spi-4?

What if your carrier board supports more than one SoM model, with
a different number of spi-gpio buses? Oh, let's start at 10 on the
carrier, and 20 on the hat, like we used to number our lines in CBM
BASIC V2 before Simon's BASIC gave us RENUMBER ;-)

What if you have multiple hats, each with their own spi-gpio buses?
Hence node names like "spi-ws-2ch-canfd" make sense, IMO.
When the WIP connector design is finished, and provides separate name
spaces for the subboard in a board stack, we can revisit, perhaps...
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
