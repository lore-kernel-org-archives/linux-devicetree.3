Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110788;
	b=0s9u7UFsZnwQZ9vKR5rDdBfVAJEvF8x789bwX9bcIux98gOThHRCcWaM8dh2afWU3qGi
	 dHTS9L5Lk0X2ZBnCZPGHt/DvN+EAbva3xO80m/7rcjM35JzNooSf5+zdNv/6CDkIrLmt+
	 V2ZQQgwKIY32fWbl1lwXdAgsX9C+v6HpGoJ0W+qnIuFnViYP2ilf8AbnKLoG14LVxSpQ1
	 g6gJVTe2mcsVi1XMXTRLupIcQCKgI3I2ewLk8UhZqw6PBW7OJiw7ToH1ICaI5r4Z4E483
	 RBrV7Ss2DdcD+iI3xKu9/hRYTHpBdRJD5EXYgSB75Ggw7bxrdS9Ays3m7yLYyiGrJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110788;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=;
	b=RTJlUcXi9kLdnQ0qCldeDz/JDgUMNPn2N+hD918YSq7bMk+wUis4MyYFTRhbkas7sLrg
	 0IcI6NN3655bLm37MTAMarJ/1drHBYoqn0tbDe/sfMDOuDGSFNp1xMSo3BbXOi0/qnRA/
	 ni6HdV4wa5T7WP7poWAr72qCMlfXQhBNGqtAleUrJtzSLylcOwjjxK+FyckD8L5r7M4EE
	 TeWigPnznFyPk6dQGIgaVCWOrJDl1W+4zgHXWR9ef5jm7igNtq5dtre/o7RC910uEbIbw
	 qzGN5DEuTTlf2FE7Xrya/Hez7E2/6+U7AosWRpH/IffzF4JNgvR2QAPKJ8VqvL/OaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bTrYKY/N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5015F606A32C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTrYKY/N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A25B1F031E8
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110788;
	bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bTrYKY/NCtBQEqHzZxx5FWO4+paP6G4Zi606u8ECeNkDqyadFAAmZ//dG3grmowVm
	 d1tciUMEEDAQFCj1uYrrSKri/n6ePDG9eeISLDcFHhEl557VzR+RXrO31eGIO8eQNU
	 JTkprt7vienttMNV5MxlOGduU7dpzTNS/y8MU50kvrBTrwzhzoZISIeYECH7ena7Eq
	 6/otvp2wsbwRx5Z6CXoWzFM/wTZbzOIWo8tv42AVzG1/qMANM2RCs0xSe/KNLOlSZN
	 VdzIxQpxYfFhHzkRW3TnKUV0ZddDh5zMSpZ/iEme/pBnRjBgjgAb+2lpT9sdJJYSA7
	 LB+VxUC7mQXQQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49e08af5fd4so1660969fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFA2EejGQpMWXZOk/7GKIA9fXfJHlTT3XDUIGIWceWOmTkBVVQWn0WQS/OO/Mm3FNM+RFRzEzxdzpa@vger.kernel.org
X-Gm-Message-State: AFq9FYIOFXjhlp/TYy3w+ASqGVF4uA9vTtC81I8KgBndDYheFkLrcSCt
	gMvXpJHOrNWvshuXnKdXOJ4Tg1FX8IOrZWBzkJ+fpX9O6JU9CDdFuy+TQRrVj6wXeM3/lFDQ2sH
	EeXr3ZGrRwI7+1ghrZzsgcgmcoRY7k9w=
X-Received: by 2002:a05:6870:8109:b0:48f:e0e5:a205 with SMTP id
 586e51a60fabf-4a83f55fc6amr6537849fac.57.1793110787343; Tue, 27 Oct 2026
 07:19:47 -0700 (PDT)
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
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:19:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
X-Gm-Features: AclHuK9sHLPk_RjSdPfQ2Qb8ggjUTeBfa7KowfsZSBkBlD3ysUfPGnnDgLhFvkE
Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
