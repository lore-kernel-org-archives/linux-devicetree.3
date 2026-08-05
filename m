Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728546A61C
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931379; cv=none; b=azsJn3L5C2ASs2KYNAK/stKW2riseN2NsMDM/KyW3leDuhCGinG8u2rXB6xWaj+26wED+1Kz1jn+WJvmeizk24mlyDhSHWhe307/dP2/ZZvWECDCWvziZvdHbT2FArBl9yV54QGSEAVyPU62CmmS4lwlyhtAZHpBvptfTunxx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931379; c=relaxed/simple;
	bh=mWDkhCDQt28Rzz6I2tZE/YSz/t9DgfeaNNfvuTOIjvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acKAFTWC2Nbjg0eu4sVjUHAfek4zLdHx/INoD1uS4rXGvm/EvHtW9L3ccDi0WoboS5Equ3AiaKiNSLu+5mZxQA8T+iprneqQNAWvlWMnW5VSe2WvqpMoVkakpe2+dqyb/8roQ9MYe4G9l9557U0xR9QvaiDmMdx26Qz4AGPTSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73720e58dafso377275137.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931374; x=1786536174;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cmx7yQpz7FXmZJPiqLpJPoIkgxVuzO0p+i85ObW18Pk=;
        b=NZ4ZTZiZucMVp6ZYDY0XzZ6lo8RkQ3UeiYH7LRUD/a7C9/4KNIlnt4oOtIQsKpsRAw
         6kWXomv0/9kyB2saJZeQFVAxzBkC1xxmZQ+1UOpnxHpoD0q+pgXTsJAGIeg7JtyCnGhq
         Ejk88p2cFmMvPvE632fbCjWVhHj8IVfvsFcNlZY+u0L4QDnM83a+/n/dTc/VP0ViiFkm
         Cs0dOoJBubshOulTF6uCSWsX/Ho8WwzhPE8s/0u4lt8ff2XBkNLwNTBhBLMTjZpCY5QA
         kA0BUDHCxNqeA0qWVfLIpqNgr+GZJRvDpuMRl9PzW6hCya5aL6E+e0FgnMrKQnQ45ZP0
         /ERg==
X-Forwarded-Encrypted: i=1; AHgh+RpTSisxU1AEbExQ4SrdLmnwelC66EcWqStHA8VmYJZdwko4Algxn5Ck6W6GMt3p97ZI4HkftvPPMEyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdok9gXyCTSkjslE9YOAyyW+z4poPvbtaGMxmz2Cyv9iWJXYkC
	R+FQfpTpVdawSuzll5LJEWWEXf5R4/KjiKmbwXqTEU2DiKuLEVJEblEPZyLJBymE
X-Gm-Gg: AR+sD101iFxSj5gfx/ruDjKDBf6nB9SyLCq8j0TlFNAWzUuKPBVMMGgr0W702Seb2WN
	QIlHXChEltK6sNhgynIvzK/6yY29er3UCGRUD87ziaj3SDXubur9Y8YV8+sPpx+7HaMIPXtokY3
	ShdhzW9TMhdRo2ffyjIoHHlsUS//vLrVYjOYoNaJxnzEJK0XFhMgEhtAa+45ZvK8j//d+ErciAj
	NfvHvl4QNgYx0lmcbLBX6DDrZ7sWKWUwJe7iE4QPGX8oyCtJvZvuxWHT4+qoXUdDP23rTvGeaAT
	LzcZx+7rSr6aRpQNMJMz22LLsRLIUoyem/s0Ppqkb5YJlkEykI7ssptlDhriFyQirZA5MDib9Is
	ckrgyWpdYEpPPllZIUtwBl30RUTKe1PKQUGno5cw3YReXJW1T8K0hpezuGnQUhaFfDWeLlsdiob
	vxlGdJjC288Bto7GmOzzMDp6ZON+souTXet8HQ0p4LuzizCTzQTOei1C+wrPGBOxevey+5fBEEh
	GKD5u05ljdrlDZnLwoobTXpw1kasqDG1jVwkIEm
X-Received: by 2002:a05:6102:1491:b0:739:a2d:9621 with SMTP id ada2fe7eead31-760e8934d04mr1854884137.13.1785931373810;
        Wed, 05 Aug 2026 05:02:53 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76048764defsm1951942137.8.2026.08.05.05.02.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 05:02:53 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so619121e0c.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqu3Gp+mv0w9hMOWzBfnCnGPJKDnEbdAbROuYDJ9vCNg+Ae1R63tfkHS5ta49V8KH/+cLdTBsBDEtbd@vger.kernel.org
X-Received: by 2002:a05:6122:289c:b0:5bd:fc23:c9d1 with SMTP id
 71dfb90a1353d-5c3d9162104mr906798e0c.6.1785931373330; Wed, 05 Aug 2026
 05:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
 <44c150f6-b04e-4515-ba71-63780c56c38d@kernel.org> <anDNtrL-eL6VUD94@tom-desktop>
 <8c5f0e53-2515-4744-ac6a-a4c94f2ae2b8@kernel.org> <anMkwfGAW5fBSAEf@tom-desktop>
In-Reply-To: <anMkwfGAW5fBSAEf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 14:02:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
X-Gm-Features: AUfX_mzB7HlYXBn_cNKB7rJbOxNdM-zSKxAmP2nWd-xohS9mCBFdbwcKjfIe5vk
Message-ID: <CAMuHMdVzvnz-XrgJ2+UrAA-Gj6XjAnz9Q0HqrNCuVQF3+v9X-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document
 audio_clkout clock-frequency
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 5 Aug 2026 at 13:56, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Aug 04, 2026 at 08:20:29AM +0200, Krzysztof Kozlowski wrote:
> > On 03/08/2026 19:19, Tommaso Merciai wrote:
> > > Hi Krzysztof,
> > > Thanks for your review.
> > >
> > > On Mon, Aug 03, 2026 at 03:32:48PM +0200, Krzysztof Kozlowski wrote:
> > >> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > >>> r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
> > >>> but the binding never declared it, so dtbs_check fails:
> > >>>
> > >>>   sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
> > >>>   are not allowed ('clock-frequency' was unexpected)
> > >>
> > >> Maybe the DTS is wrong, because property was rejected? Did you check
> > >> this? You cannot document ABI post-factum if it was rejected.
> > >>
> > >>
> > >>>
> > >>> clock-cells is fixed to 0, so only a single audio_clkout applies.
> > >>>
> > >>> Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
> > >>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > >>> ---
> > >>>  .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
> > >>>  1 file changed, 3 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> index d7fa16554698..6e2b2c93b4b7 100644
> > >>> --- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > >>> @@ -42,6 +42,9 @@ properties:
> > >>>    "#clock-cells":
> > >>>      const: 0
> > >>>
> > >>> +  clock-frequency:
> > >>> +    description: for audio_clkout
> > >>
> > >> Incomplete, missing type/ref, constraints.
> > >
> > > renesas,r9a09g047-sound is handled by sound/soc/renesas/rcar/core.c [1],
> > > and "clock-frequency" is read by rsnd_adg_get_clkout() [2]. The same
> > > property is already documented for R-Car in
> > > Documentation/devicetree/bindings/sound/renesas,rsnd.yaml [3].
> >
> > But was the property rejected? I am repeating myself...
>
> Looking into this further, I found that you already asked to drop this
> property during the v5 review [1].
>
> Thanks for pointing it out.
>
> For context: the sound module contains an audio clock generator (ADG) which
> generates an output clock from the external audio clocks and outputs it in
> to the AUDIO_CLKOUT pin, that mostly supply master clock to codec.
>
> "clock-frequency" is array of the possible rates provided by
> AUDIO_CLKOUT to the codec master clock.
> Based on the playback rate it will request either 44.1kHz or 48kHz.
>
> I will drop "clock-frequency" property from r9a09g047e57-smarc.dts, where
> AUDIO_CLKOUT output pin is not wired.
>
> But for boards that populates AUDIO_CLKOUT we need this property,
> Could you suggest how to model this properly?

Isn't this output the single clock output of the sound module's clock
provider (#clocks-cells = <0>)? Hence can't the consumer driver set
the clock rate?

If the consumer driver cannot set the clock rate, but depends on a
fixed clock rate, it can configure this in DT using assigned-clocks
and assigned-clock-rates, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
