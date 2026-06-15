Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401B3E6DF5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524523; cv=none; b=TJh0vNSvgdHK8ghwkfLme/baTkr32mA/OMoeTNK2zZPvtiqiQThCUrAnCjQwQ2JBIsFSAdd79q/VTr5whGLknG2HSv9WozbKL4iafgqKlTYIusie66aNmZtG9Kr5Pypr5KWKo6h4XeIeuJr8JxHdaYslnweJEpkvsM/Js/SXYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524523; c=relaxed/simple;
	bh=DBWE1CK73Wh70+bbScbL1hyMkGmtpiYqv2M1Rk9Kjyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceKld26+Fu1wwS1q64CIRuRFiQB5VSacHlBpv41J/OGRZpmirXfZjOQXfq1KmGW7XO3IryjsbhjWtRwaP6ZaFPA8dvYP6XAtivEZlgDd4pptGlhl+5Z7yC2kAL/vciv1OLSLlm2eiNz23Su0pqTlA1k/LSEPApKL8t/Rmf1il8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso2095840e0c.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524521; x=1782129321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akuiOgYcbdwbz5CX+b5tWNYxkr5P1OhsIXqWYjloeWQ=;
        b=G7h+u/SXRiNVt0lRj+gwO05VpogZeKtSjBBxNNaTHrPlbNXB9yCe8jiWERZTLjBIxQ
         fUUILVxIe+U423qTgEw59HYTLFv/hcU+e18uRUswn57ncakgHSMXOrNMt1vfBzueOIBg
         CwydClDU689e2WUnL/JWdM2j46OJGlU7jZIq8cMUN7Db01yT9zfEO0wy41wLXn84iBrP
         XryPbO4hUfDqZ3sSBk6tIKHQ29HI+haLrFJvx8UtjOeyEXSKc2/Ryw96TvpvN/YaeucT
         IA5HtGH8VAmYXYVDZs+paVu6LoOPH4N+HuJGvtlm1bqQyN7h7lQ9hbLTKlcddRa3w4+p
         pYCg==
X-Forwarded-Encrypted: i=1; AFNElJ9y/IMNl0LiRzRpB9Z/6tP38eRGS9k+lnGzlM1N5XjaT8i1Arh1VvocwFZfmkbPvw231174GE1qQ4RG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNJEvbE5qH7SRAbyAF1nWz4eK7biUU1vWXoCJt5meVIaNZfNQ
	SDvHokrWxf7wjZ4sihIcH5/qmOmiqFaK5xdZDvyw4FBSYknOZFoHCU1dDYZbQ2sz
X-Gm-Gg: Acq92OHDKkCJ9UDNWFkg9iwnqnaFOkJ/6NlwHr6TVHeQTlQ0VrB+luan/TwOooS187L
	guBpxrpUvZr21vN8sJDCxyFTsFqSOoHEixNMfw4D7tQomE853ixsVSxdKk9m1j1nDN/kgsEgZ63
	CFpAnihsZeikAbFUgZg1Ndtsk9CXupOsiCp9GmgjTOK0HHc/ZtDT/GuAYZttbXKRpzpYt4BdAG7
	MNMayG2inkixMkK7g0HMhioTQKxD707lOpV6R5NAzh19zKb3+jWJUi4Lk1VUjDq4oT3iiDaV65F
	7TRtQUL1fEhHs+/DAx222D1rLD0ebF8qefiCEng8YgFAG93t8bQwkF/t8W5Ev9JSwz6d3a+qiD0
	5UvoKNzSaHy9y8XghKA7HACkUpVb6swxnsrojlrIsoTgf5wcdIAiO/ZXMuhfRytQ7WdWS9hfakK
	YT4NsOgxkwcupYQbjDsVF/+jfLcb+pzRms3pace+LRX4wc6pIi8jEuvSwyr08W
X-Received: by 2002:a05:6122:a1c:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5bb6c15b161mr6877746e0c.13.1781524519886;
        Mon, 15 Jun 2026 04:55:19 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb90015ef9sm3194902e0c.7.2026.06.15.04.55.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:55:18 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9639aa8ca17so2166271241.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8MIqz63gvGAlPH5oKdVNfe2zHKjm/EdqbY19fS1RBScUiZ6AIzizTuqDkSTjGcimDj1RPZm1KcWKO@vger.kernel.org
X-Received: by 2002:a05:6102:3306:b0:610:6e69:5235 with SMTP id
 ada2fe7eead31-71e88dae7d4mr6834578137.22.1781524518020; Mon, 15 Jun 2026
 04:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
 <20260612080354.57459-6-wsa+renesas@sang-engineering.com> <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
 <aixTJEh-A4WeL4fJ@ninjato>
In-Reply-To: <aixTJEh-A4WeL4fJ@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2026 13:55:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-R9KO-6gPu3KqEugwkQSoZ5my2PZeHXv8bCoQjW1P2Q@mail.gmail.com>
X-Gm-Features: AVVi8Cf5qLIzimAFUyILY9i1UCOrGcId5ncThR3LOBaauA3jobqJLHJUMwQOWmo
Message-ID: <CAMuHMdW-R9KO-6gPu3KqEugwkQSoZ5my2PZeHXv8bCoQjW1P2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 12 Jun 2026 at 20:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> > > +&spi1 {
> > > +       pinctrl-0 = <&pins_spi1>;
> > > +       pinctrl-names = "default";
> >
> > Please document that this depends on SW2-4 being OFF.
>
> Hmmm, this is a bit weird. SW2-4 does only do the routing to the SPI5
> (target) controller connector. SPI1 is totally independent of that. I
> can read out the FRAM with 2-4 being ON. Dunno how well that behaves in
> parallel with RMII2 ;) Shall I still do the comment?

You are right.
Once again I've been bitten by the confusing naming in RZ/N1 DB/EB
schematics.  So no comment is needed.

>
> > > +       cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;
> >
> > It doesn't work with hardware chip-select?
>
> I couldn't get it to work and I know other people also use cs-gpios on
> their custom boards.

OK.

> > > +       fram: fram@0 {
> > > +               compatible = "cypress,fm25", "atmel,at25";
> > > +               reg = <0>;
> > > +               spi-max-frequency = <12500000>;
> >
> > The actual FRAM part seems to support 40 MHz, but that may
> > be limited by the board wiring.
>
> So, what do we do? In my tests, 40MHz did not work. Up to 30MHz it seems
> to work. However, all of the BSP DTS snippets say RZ/N1 can only do up
> to 12.5MHz. I don't have an errata documenting this nor could I find
> another source. I would still rather play safe here. I could add a
> comment, though.

In that case it is fine as-is.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
