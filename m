Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154148;
	b=y8vFOvBkh0oplj+gAIn9p5w0l9n1/6UHSqirwd6RgLHufrRf/NN/C6ShTBCOCuD1UGRi
	 nLyEXazLv1PhYMnvsVueHzrwnsa35sQdHztb9m3IaMHRp0MNj3UTHWAvVJlK2ZvGI5UnA
	 LXZLCHRR84Twc8091aLbY9FeqKewy6g/IC6dBu9LeJhmwp4Gb9JB4V0QKGU3vvw4lothQ
	 kM4B+sYZQcYYbUrGpytCNEgQcUitTFg5fwFOGuGvtb/iBu5IpIeDzenE8nPk33122LDvM
	 ZtOqjrEx7/EaL47Fdwb4N7PVHCmNr9Xq55aYKcAXHH+XJE1IQrMGWZruFjrDF7+B5Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154148;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SQe5jbD/zyzZ+9qfy+XHKm+jJlq4rsLg14mHaCfHlQE=;
	b=mnx3YTReiAvABejmK/E3eQwYa+ERnWAgdICRSjcb2PuIxorqpi3GmpITg/rNSUrbXCfO
	 0MiqTywFYFXWDQsivfRqdgXnGzbci+EM6TdNUcdX0qX3MHnWtq1dehkCBJn//8S+05d0V
	 pF1BYP2YU/ALmRyEHReZeki118RqTYUcq8KuShYCcqS4BsD8mkNZy4v9i1UfU4ohU4dDR
	 JMb5SMnFNVVwUjSFaEAn1+GZvfWBeYLa8b8m3SThruD9QUEGF5vN1aC8UiUOmqT/2969q
	 jfzPsrbwRiLxDKA7bhHgQinwFd1Oq82AozzY7HmAZyE/BisAKsugQThQ0BCpz70cG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYqbHS4R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6F606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYqbHS4R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B4A1F008AB
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794154147;
	bh=SQe5jbD/zyzZ+9qfy+XHKm+jJlq4rsLg14mHaCfHlQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LYqbHS4RfWZiPOL1YPi2Wh1HB7z3oQkhtZskD838VdFop50hFqbF77o3as05gkllm
	 hQ7cwH1A2thyBJvEsGuu3E34m2SjFPQVDPdi/KPe7juKtrRXpwRw4yjOwZJJJXxBoO
	 gKg23K/iOEWZmtjIXNTKa5wGcRYlJXfWz2qnxSXO/llxyVUrCRPCDubq7WaDsXbhvV
	 BoDaSQi7wCXY9qiiKuC4XrqrHUAol+F53aKvTfSCrOds6MzJk9SuKcxIPCfzRblFWS
	 SgZEoFTecFHqGLhWTnW59nSZRxpdWm+crzWpQJ8R7ROXWlObnPEvAvbOiOrgyyF2nr
	 QC28vsg283oww==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c00ba84568so64607e87.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 08:09:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF7yDwKg8FXJyQJEYJuFdsOuviUGvalvvE6YzeFReXgXrD5aYSXrJEoXXFqBBC/QaSXQr6WXwz5OC5H@vger.kernel.org
X-Gm-Message-State: APuU4Z8UL+clyc0UrLNNrSjAQKjsXmZA+mI84eGIe97q9Zgb3jXAQ7xI
	PeMSc35a2Sd7YXOrSjMi4iVHMqGOUUSWabur62gQGlysoV1Q2Apbw6JW68O4CPMDPRMMcCdeLNi
	LozqplTgEWPPGIrpJIupK0xwYTEQTmrI=
X-Received: by 2002:a05:6512:4018:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c14c021361mr438569e87.55.1794154146533; Sun, 08 Nov 2026
 08:09:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-gp2ap030-v1-0-55314eb7055b@kernel.org>
 <20261108-gp2ap030-v1-1-55314eb7055b@kernel.org> <20261107235827.02951362@jic23-hlaptop>
In-Reply-To: <20261107235827.02951362@jic23-hlaptop>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 17:08:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6Ch0kLCxf-rd7R8UFnGjd_ij-cxVOM=vhAguNSye-sQ@mail.gmail.com>
X-Gm-Features: AclHuK8iI-CaRdJHPlnZpNc5__iuWVfECSfYTdAhoz7ptvyeATcnPbJbCcZe3K8
Message-ID: <CAD++jLm6Ch0kLCxf-rd7R8UFnGjd_ij-cxVOM=vhAguNSye-sQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio: light: sharp,gp2ap020a00f: Add supplies
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 12:58=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> On Sun, 08 Nov 2026 00:31:33 +0100
> Linus Walleij <linusw@kernel.org> wrote:
>
> > The GP2AP020A00F needs a core supply as well as power for its infrared
> > LED. Its I2C and interrupt pull-up resistors may also be supplied from
> > a separately controlled rail.
>
> Hi Linus,
>
> The infrared led mention made me think there was a separate supply for th=
at.
> If not, does it warrant mentioning?

It is already in the binding, incorrectly named vled-supply.

A later patch clarifies that this is the leda-supply.

(I saw that you saw this too ;)

> > Describe the core supply as vdd-supply and the pull-up supply as
> > vio-supply. Keep both properties optional to preserve compatibility
> > with existing device trees that only describe vled-supply.
>
> Is vio supply wired to the device?  It would be unusual to describe
> a supply that is a pull up only one given that would often be a character=
istic
> of the interrupt chip at the other end of the wire.

I guess I managed to look at the datasheet for the
suspiciously similarly named GP2AP002* which as separate
VDD and VIO...

I think both of these should have VCC only.

I'll fix!

> Definitely after input from one of the DT binding reviewers on that aspec=
t.
> If there is precedence for this good to call that out.
>
>
> >
> > Link: https://global.sharp/corporate/news/110721.html
>
> What is the link for? It is not referenced from rest of patch description
> so seems a bit odd.

It's the only thing even close to a datasheet that Sharp
has published for GP2AP020*.

It doesn't deserve the title of Datasheet: tags.

Yours,
Linus Walleij
