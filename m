Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219219B5B1
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882795; cv=none; b=lBSuSn7GOq96vnnVVpvBZhAPCex3F9ghkbEQx4Eu0U0UdUd4GFJcKrlcCpk8sTnhfz1vkbJismNJuElsgO4xgU4z/pL9uG+ecaghJogm+xMMCuZYi11TkkYE0MA3VfZ/bskhd6iYPrGHFMTw2Yn7Uvzomfi6j/AchsL4RxslSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882795; c=relaxed/simple;
	bh=ufP7vWp08CvNF0edUBUSk2pG6uz8C46BeoX5YxHUf7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cI2han+p+69vydjxCF2ovbB8LbSBxzjwPTnx5MlRTiIJn7fVN7esodyDijOxMfNpk8gJmK0ziOi3OIr6ak7hTOnUoHmmFY+lTe5WHEaJnIW8ylu058pttkNHAsm8xQQ6bsWoCbIQ3SnlP8k5Gp9e3NUE5SStoa0Vxa0+QQoB2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95d04f205beso832332241.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882793; x=1778487593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bVJNr48mbuXqcLtQanZN2nd/IOT9Q1mbdvULl7e7Mc=;
        b=sUKPVgM5MoaIG/X+KD/dVojCzbC9ZA0cK82k8YljQZMrRyn97a0aC99XLLrCKHjEFJ
         feMK/Y2r7J4FKPLXfaxCFQOE+7hPdXM5NIm0AIjGhmBENWErN1XyspjyvzuYoVBHs2Kl
         QvQKWFbpC7xUbMFjtatKoov3bzNyNoi+L0AJ2dTEmfzngyY8QqhhbucTV15gKynue7Ek
         t2GRTfAtBv1U7UUOpimJ1d4xO3noKZLyRHMcqKv5SJN4meL2U1USSRwCCQGY7lq2PPOs
         4vnuko9J7bz+PyAR1G+oB30zw0d/MbfAVfoTQ4d8oNNmXOiP0231v4duCTXo0SQB/Rt8
         CTlw==
X-Forwarded-Encrypted: i=1; AFNElJ8bcMpr9Xj2XVgj+rViuRrrpIwFaA8GveRgON3s4MxndUXaEfWIMyvfML9Mw/fLi34YmKb73NhQ3ieR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4Klf6Z+NdbcA9KuDClfDu3COJt46FEd3HEfKtfuPVd2wcdJ9
	8A3TQi1goVSj/lBCpNYp0L7JX3qHdLIW6SnWZljvMVG5QifavdH4rOr9IvEMKWwe
X-Gm-Gg: AeBDieuvXPjVw5CN8HKcc8+t7RHOHmHugrDyzMxsY690umVlLtOilQplT6vb2yGleCW
	48nvTML4lfIF0UA0+qg4YvkD/XC23fIYglN6nA5AfOt13eMtNe2OP9fJJ1dliUHgnR/FhujzHuf
	pNjWuOTtWxysZTmz9lPHQG7h1Thp+VtT1GyTkxGnTI+3qlGyG7mN+NjGFzX+Xww4FXxK4wYcf1B
	QcvyAtFGE2bA7LVym7L62QYMKETJmBXi1/r/qfOyIQ4Qb2jSqrXOfxdOKpVSB8mXRv/ym4hBpFc
	Gq2qeZ7P0UvBJDyAbwkkNrP6/+M3pK4IOCGUPdxNrVQAZspwJ3nEofQ804iwoAL2VSGMTgFsGfJ
	3jucsDNqL6hORMJQ9EyuvaFBv6lbIT3DZa+/yfJ6Fjv0JRI0562QmbEfiVYGqaS7kZWCLxDAbuL
	hV0/C2f9oNYmahFx8zI4HshTZuX7GmqwazfnSV8sACGmofqzaL1cqw1bLVfIgOv0UzlbvJ568=
X-Received: by 2002:a05:6102:4b08:b0:627:bdf5:b91f with SMTP id ada2fe7eead31-62d8548748bmr3300986137.8.1777882793068;
        Mon, 04 May 2026 01:19:53 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0902d6dsm4791788241.6.2026.05.04.01.19.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:19:52 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so2437820241.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nyZ11sTtPrAu8t3mK7nqP9l7qmLhi1oP1qHNSNLW1YWCCwrARl8/uDMa1L29biNcX+HrLc61hx5+T@vger.kernel.org
X-Received: by 2002:a05:6102:809e:b0:605:6089:674a with SMTP id
 ada2fe7eead31-62d8754d144mr3013701137.23.1777882792441; Mon, 04 May 2026
 01:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org> <20260503-vagabond-barge-dac8ececfc11@spud>
In-Reply-To: <20260503-vagabond-barge-dac8ececfc11@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:19:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-4jRYfF8LxdP9XrDuKDsAp7ZXdpCChdp=CanE0xGPUA@mail.gmail.com>
X-Gm-Features: AVHnY4L_7YXtlo4qE1y_LYqC7rM20qjGgpwaQzzNh45fY7gYtsmwSqrimcTuATY
Message-ID: <CAMuHMdV-4jRYfF8LxdP9XrDuKDsAp7ZXdpCChdp=CanE0xGPUA@mail.gmail.com>
Subject: Re: [PATCH] schemas: Allow clocks: property in cache nodes
To: Conor Dooley <conor@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Sun, 3 May 2026 at 20:09, Conor Dooley <conor@kernel.org> wrote:
> On Sun, May 03, 2026 at 05:44:13PM +0200, Marek Vasut wrote:
> > Renesas R-Mobile APE6 currently describes clock which supply the cache
> > controller in their DT using "clocks" property. This is not the only
> > hardware that has cache controller clock controllable via some sort of
> > clock controller, for example Altera SoCFPGA Cyclone V and Arria V also
> > has controllable cache controller clock. Allow clocks: property in cache
> > controller node to allow users to fully describe such hardware.
>
> Hmm, shouldn't these cache controllers have dedicated bindings that
> enforce their clock requirements?

Just a few general comments:
  - All electronics needs power, so "power-domains" should always
    be permitted,
  - All synchronous logic needs a clock, so "clocks" should always
    be permitteded,
  - All reasonably complex circuits need a reset, so "resets" should
    always be permitted.

> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

As I have sent the same patch before[1]:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/dtschema/schemas/cache.yaml
> > +++ b/dtschema/schemas/cache.yaml
> > @@ -33,6 +33,9 @@ properties:
> >    compatible:
> >      const: cache
> >
> > +  clocks:
> > +    maxItems: 1
> > +
> >    power-domains:
> >      maxItems: 1

[1] https://lore.kernel.org/20260113075243.1192477-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
