Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3F38DC43
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520438; cv=none; b=ruSl6SNwav/Z4mFYuVzQ1J3p8TZ9N7Hldqaujyb1xtKrOrNC/ii8oqotQ3Sd3scLm2vd+hFmrgSB2Gv82rBI+UXaqWJlRHwsQVnzQZjeUQ+exhA1Te9T7C0AAd5hEo5lwJYs5hyiUQ5uf9gaH4YCcnfX5r2EIlD81284LA8OJEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520438; c=relaxed/simple;
	bh=8NIMyonBTLl7p5TcLVhooTgWqOCx0uqDr6kFmRrrkQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpxYrbPQ8+zCPGoMFxuvkiO1fZrAgbBqeowIP73aR4uXOdn8vcYr7fgYM/pn1xPfxSQYPwHMBy6bzrWnCRXD+LpRs5pPMtAxnc8Ix4+cW5/2GiHpHZOI5cB6REcbzqlKP4ieeegQeE3kMQOeXgP4jZf4thxotyYGRulf7wHJp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpkEHvKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpkEHvKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A506E1F0155A
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786520434;
	bh=8NIMyonBTLl7p5TcLVhooTgWqOCx0uqDr6kFmRrrkQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpkEHvKv4i+JqSzorjwyomLUtI+GEumeJLV0rdgKKmtQ85BFQ4kA6SXsMMTUPTkYM
	 P5VlIYfTJD8u8o9jB51KRa+12FOpN+SKPS4+tNM8GMzfUNJSbIRcgdpYkx25sxug+V
	 +I9sgt6S/W1KiWEi3UuSSJ03TyY8PsqKv6ueN71q6X9aZJrWvDn4++VMHD9b1IH/5M
	 H3tto67xi6IzkmbvZRuTptMR8ce7jI274fUs6UCKpsqbzrke7fcMpu2fkZCAJE95yB
	 rOGdyS2IekQ2j9nQQu4PgXNKeupPwadWriiRHn3LOMpJiH3A0QH6RT+aHzQcHKW9mf
	 FxLq9kWjawaXw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b013084dc2so690146e87.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpYUzDArFb1FKC2RqW7Aj6gUXZh6m3pF/iDU6LfHIdzTOL+awtwwVnJhlY126zuijuKt2Uj6lMyiOx6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hA0uje0rBIXF9Abxgr29WX6+VPUd0Vn3hqGHFTEGkasnjKKa
	baSzAnOvM3vVV7wNELfFB73Ig39Yy9ai6OdsGY5EOXpi5bKXPvEe0LGIM6ID4ck+DDMsW7R15b/
	21WJ2UonbpTRg8++ed9pK4TI9y6O3a7Y=
X-Received: by 2002:a05:6512:668e:10b0:5b0:1dd0:f20b with SMTP id
 2adb3069b0e04-5b44e2db43emr269927e87.6.1786520432729; Wed, 12 Aug 2026
 00:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com>
 <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
 <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com> <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
In-Reply-To: <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 12 Aug 2026 09:40:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+LNAb-VDsNz94Rj780fn1Z_SF9qxxbBAwLMNuedpccQ@mail.gmail.com>
X-Gm-Features: AUfX_mwKiQhkB2vUPp0CB68UDRKMeWXa67ucLPOGncEJWQU6-LQSzSsOw8NITtk
Message-ID: <CAD++jLn+LNAb-VDsNz94Rj780fn1Z_SF9qxxbBAwLMNuedpccQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Rob Herring <robh@kernel.org>, Konstantin Babin <Konstantin.Babin@arm.com>
Cc: Long Zhao <longzhao@ambarella.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Page Konstantin)

On Tue, Aug 11, 2026 at 6:11=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Mon, Aug 10, 2026 at 2:42=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> > On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.c=
om> wrote:
> >
> > > Thanks for the review. I will rework this to reuse the PL061 driver w=
ith
> > > per-variant register offsets, and evaluate modeling each GPIO bank as=
 a
> > > separate DT entity. The duplicated GPIO implementation will be remove=
d.
> >
> > Thanks Long, I think it will be easier if you break out the pin control
> > bindings and driver from the patch series and work on it separately,
> > the same with the serial driver at least.
> >
> > I understand this can be hard to test on the hardware, I usually
> > put a few patches "underneath" the b4 cover letter, and then the
> > b4 send-email will only send the cover letter and the patches
> > on top.
>
> The problem with that advice is then 'base-commit' is useless.
>
> Maybe b4 could learn an 'ignore the top N commits" or "only track the
> first N commits".

I honestly don't even know what the base-commit is for so that's
I have blissfully ignored this problem...

So the summa summarum is that the current behaviour kind
of encourages people to do large patch bombs for a new SoC
since due to base-commit and the fact that developers tend
to need to boot test the series (and it won't boot without some
other SoC-enablement patches) the series must be kept
toghether.

That explains why it feels like I see *more* of those patch
bombs these days.

My initial stance would be that a useless base-commit is
the lesser evil in cases like this.

Konstantin, what's your take on this dilemma?

Yours,
Linus Walleij
