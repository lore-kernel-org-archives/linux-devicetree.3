Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181212;
	b=W9zq/Lkmkn7ukIzIfg+rgVt6V8IxmkojwWxCsKs+avEmyEKXXyjrdEzo76Nt88VQFlE3
	 I9AMqpIDb5NJ+PevlhCoEKDx9TIyExboF3rJuddfXPcEJAUuk67hnJiGXPmOo3fyH6Jmm
	 1ldPS+QUt2y6dm6DFYc9aFVGrx7O3dl9SARFSKazvsK+asF5yupee2FxU1cVBVIgKw566
	 ngRR0Ryz9ZFcT0yi+8o2HdvQBQ6liXzqm/O9cWn7Dw6sUeFzXdnicKk7eTJET6BccJ8Q1
	 +/3LHOODOJ/slFTQbvONh1HSI7Bx23nvo5se8vBHgTyIF5laA9MouKW5+rmsmnExitw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
	b=Uuf5k+Z/JtU7er9B2PWVqJuhP3fk3qmNXjIJFySKnYda+/aYfhUJ8wv4Zfj8z9C0dB4w
	 uAWPpqgDcx1NdJuNbqFjt86bzn7KCdQgFt2twdUD2ltzkjSfWScx4BMhmLxXuPX9wyZO6
	 oPDKoNlDqYxTf+0iWLHOm/ynMqo4MkUc6G7eraGsE6U88yNXiwAr3uu/XBo2Yf7HGkLnb
	 +PHscJ2ErsVbUTh9MoiEZbbT4k/iHHuea7pSz4ydjyzvNOJLjOorGlsBVJihCRBUPi+hK
	 F6kNhVIqqYqgqs7v33DD5ijL+HyHQwDpoWzRyd9Nqu9i03FvLUaX1UHN6pnKXsJf7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDC2606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso453972137.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181211; x=1793786011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
        b=TALBfZdzUpWMaoq0n7RlCpvA2E3oLvpdw4IZtYxeAtMHsA8hxUyDe8o7ud98CaiICu
         v842/7BwXDSN5kR6nYDv5BJUHCFKO4Gaj/PxzenakGVXy3dh0J6I/qYFyhnFucHKgCGo
         lutB77oY+cXj9dNIPVB9Q6JI+wctf6GzthsGmxCH3u/HsJs7O3hoMQOzehZfULRUL5KE
         5vmz5h3JnM2OqK2V2HJYyY4nPUNKlPFlFK7HSNCU9R2un4Rt9YFNfqc4maU2gHtbUsLn
         915uf1oiPD7Yi0gc4AkbaMKpxvt7mEB8AHWUGrWJ1Gsv3NdK1rsS6lzOK8IZfmOna4Bx
         IfiA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ9a9q5ir3ofkudR6XSWDjcAYrWqdbqgcVZvKl8pgyyVArL+0AJxIpHnnug8vYYpRT0xL4bEiHK6Hk@vger.kernel.org
X-Gm-Message-State: AFq9FYLRv56+Z2qYmhKN0xpVVOYJcrap5oz4ym0VhaKkhlqpX186WwLd
	04Fi21uPl1RR+cm1N6XUlQf/00Fw0pqPW0y3KmvZeloxap1GtT71sqZlAeFUw9Lm
X-Gm-Gg: AYBFou3pQUDWnnur07TihvRSauEfPsNy1jIpnjIS6YMac/8P7JOaWkpk4ldDW+nU0yf
	owlQU2M2mQZuSz5CrOzd0P21DGCQ/E5VKVytzRRvPFwMhZJAX99mKCtyhAy68s2j+iLvhDh6p2S
	FAB7M25a4QnpO8qxLdwwecPSV4B6nk6YxFfJENPTjFDiFp67/aBUv0LkDBizktaocUgnx6fWOEC
	n8Z5969aEs7zoTCuVPkpMQ8QxS4tlhjAm2vVnK1r04X0fR5mbKkxUK+ZuaBhAyHJUYrx8bzBFzV
	5fUU7IL8htyoIlOmSYY0Z8K3IrJ2ReTSYQLfP8ML4sBGHFiX5E1v/DOvrRRfX47luCIpv/9jryU
	NtXnrWBr8nJ3Y2HTtAjoVWhBttHCqWQtdQHpTKaooBTeAz6+pw5UuHEgYeRS7poM9tCWymKfrOS
	DxA+LyiRY4gsxqgYAypfqewq8y1zz5rWFXovcGJg/jby6gkuKSL1AFu4hjS5IkMO/w5K136mBNa
	e+60rfCdQVpb5kRwSKdUue3YkHW1A/GcjXoPqhcoZJcOuEoPpQbBSyPee1R/gk4J+DuxPrI8ePV
	KqNpV5gsC3wnmi6kReH+MwkhsZQDoc8uNy7n0v9V0O6aRw72qU48rNVskfc6nRaeJh4=
X-Received: by 2002:a05:6102:4b03:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7d03a1ed917mr837519137.4.1793181211366;
        Wed, 28 Oct 2026 02:53:31 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3c44ee7sm5089408137.6.2026.10.28.02.53.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc53938a8fso455884137.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhvnIlrTotEtBjJVZ5f0TGb/YazwMoonvDNi+Zm3oMftNx2+WOGPsxWTqh4OEuL+GoPdMrYJWjkJBj@vger.kernel.org
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d03a47e768mr803872137.18.1793181210633; Wed, 28 Oct 2026
 02:53:30 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
 <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
X-Gm-Features: AclHuK9BGkRKGrsUq56mu96OMIK1DMZBGsGDXPyfwPmkMrcZVroZETBYHJfP3k4
Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 28 Oct 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
> <geert+renesas@glider.be> said:
> > When a gpio device node has no gpio-ranges property,
> > pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
> >
> > Restore the ability to use GPIOs before pin control support is added by
> > using the gpiolib helpers instead, which cater for this use case.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This sound like a fix? Can you add the Fixes tag? Is this patch independent

Sort of, but no upstream system needs it, so I don't think it is worth
adding a Fixes tag.
ISTR we used to have GPIO nodes without gpio-ranges on other R-Car
platforms before, when pin control was not yet available, but DTS
history doesn't provide any evidence of that...

> from the rest?

Yes, it can be applied independently.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
