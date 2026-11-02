Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646772;
	b=CqGH/zFlkmr1LvUqqZm8tLINU2LnwU7CUSPed7YaQtynCMEUsm6+capOXt0ITtD2vb6p
	 s7HrgmuRJTuyxPz2JqVCWwpRrmHDfAuMt2JRxh5cBtPviRSlPtF1FghhTrzEgFmKD2ITR
	 l+wNsXJQ9gPPZZylqscGqiTxppPcZn9NiYv382LQhxyx7SeUdXphKcSRFc4aVBpIJwgLQ
	 umIIbGPZ/7pmL/bXOoc70QdTlZhAUNGNGkiEcLh2Uy1b8PFWyquTPaJV3Oo8c6rLx/DnO
	 wdQXCFE4DZ6bBoQwIPPI0uhf1IUnJEm4NSqwcubU9P0WbJVr6oaskacO2RONRf31kSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646772;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jiTkIxHuhAkziw0ro13jvW8WYMk3a+CT3sljb5fNVfs=;
	b=NKj41YOg0Tx81T91v/52V9w0l/Sjb6Ok/W6HTVC6NMMH8y+Z0lRiRH5bZLe9CidxjB1m
	 Gpw6ai5rv0h+56o69n5mGQPcpa/CKHZDtBm982eyBm5PIzM8GP3CnE/4hheg/Eak3uiLk
	 TPlPZNxM/oCO/S4t93wBdgXbvE2gxDQZA8CA2k+F1BOZu/8RUMTa9m1s2EM7PGAmKrVix
	 /5aOLOZRAzxOyzeewacK/81wpXmSW49LjszgvricCSdbcbiYQTziCKlWKb3gTw2D/QqpL
	 tyAQD7UoE3LuMeWQGMgLfJ1NWwMUgekaUGqnrLKpaqQ9Lx76sMwxnqs8hx3rkYlGAqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ggir4WL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C13606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ggir4WL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C7F1F00A17
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646771;
	bh=jiTkIxHuhAkziw0ro13jvW8WYMk3a+CT3sljb5fNVfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ggir4WL2ENvsjGBc0Dunfrx15FRVSzPAYHhJCAnJccJhU5tldMV9gI8IqcAdNUZiR
	 2UA+zEf/4YNXOFqguwEvBo6Ycdv1LFLGR67utf391GnrSh3fWG1npEeRL22FdtWBGU
	 dRORbuEHJ0QdCHKiKtc59NNFow9sUVjPjPsuGhS3KcdBBxbjucmAwbooedJWPoERm8
	 HBOXPWruv3GhbnqPxO1C+D1nmA5y3Mi9nWo4sv9E4sNreP3D4oxJg0qJ5+O2a9YYnX
	 710mvIJV1YnfILddxx7kxqov+tp9VwVjaZUpMKd/GGrIWqckR2216ZSYt6UquMKCqf
	 8zxg1czW6VuBg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso590006666b.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:12:51 -0800 (PST)
X-Gm-Message-State: AFq9FYIVf6KasmFjFkFN4YGrfXfd3WP1tZEW/fSMP9areOQVmISYQKvq
	b4lyZ2dJ1w9mzL7APRI1oNzxyTRKy4H0H+Yo4aO/KXTVKHBjmYgo4RgrWL3TRuGtokQJ0i97Vf3
	VOLTQDNyrTYAigkNSqKhi+6qFk5wldQ==
X-Received: by 2002:a17:906:eec9:b0:c26:1648:a076 with SMTP id
 a640c23a62f3a-c4ca7abf2aemr893729966b.49.1793646769977; Mon, 02 Nov 2026
 11:12:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102658.968138-1-m.szyprowski@samsung.com> <179362278569.150793.16322788098732007689.b4-ty@b4>
In-Reply-To: <179362278569.150793.16322788098732007689.b4-ty@b4>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Nov 2026 13:12:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
X-Gm-Features: AclHuK8yGh3NSN4CvPkoAvulZs_KXn319zDDRWAbtCSGLwxtYjAagwVTktYpSvU
Message-ID: <CAL_JsqJ7mkOL6kBwjDV=-A99zpmHWTFdc+8TunXG5EfueiFDrQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
>
> On Mon, 26 Oct 2026 11:26:56 +0100, Marek Szyprowski wrote:
> > The wm5110 audio-codec node uses the legacy "wlf,reset" and
> > "wlf,ldoena" property names without the standard "-gpios" suffix.
> > gpiolib-of.c only recognizes these bare names as aliases for the
> > correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
> > alias support is compiled in only when CONFIG_MFD_ARIZONA and
> > CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
> > disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
> > codec without a working reset/LDO enable line.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
>       https://git.kernel.org/krzk/linux/c/76ef3ed714ac178cda84ef39733d4f7=
12e682081

Now in next:

arch/arm64/boot/dts/exynos:2:1
   Schema warnings:1
      2 audio-codec@0 (wlf,wm5110): Unevaluated properties are not
allowed ('wlf,ldoena-gpios', 'wlf,reset-gpios' were unexpected)

sashiko pointed this out.

Rob
