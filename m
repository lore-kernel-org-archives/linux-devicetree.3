Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110828;
	b=YiVC2/M1MzCW6Gu0jduIslHWX+HJJ8SZKgDmndYKisDRXkyDUpQHvTRQ2Ob0st91p7b8
	 bJjWwoW5ZAcII/DQ4jbg9TtvciH1nvaLzympNOMakF8IDQO8lWNKyYRXiHEDP1AAsJE4M
	 Q+vxhWyj7C3h2YDWNoUQlRg8rMDN3RFevc8ivm4Po4WfOq9IGJSSCOttMCIkE+9XE6xE6
	 L3q1u5hkDvJu7jRTWKUpXJVkoJyZcWFUUitaRa4CJbdLXBDQRGaU7odjphAQynIeqUSyS
	 pBmJN7kvoCin4XGtyM8D0UJfyuX7vejVD8wZ72rnuxO56rsuwVTqy8c8SvuuCJbroow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	b=Pvf/R0J8JIWAupCOoK+iWi6NgRjC328/RS7WnBbJCAMnG7Bu0OmgLhaIaJeHYhqoLKzc
	 ZtjkPyrC7hLLCjHusl1rns+nIIqHVArrMJ3JOtP6ZQOLzc7UDfwFWGhUUINDRWnMgFn+C
	 aYpCzjOlm0WfGGK706gh43sMDF5uWNL53no+G74jPR1ROM87DW6xJpnnw0FBjckv8MEn+
	 3FJH3LxFeZPIc376DEnr/+JxoMU1nCgMw5LZHmi8m9E2fubdvxpB7ll9s6PEsVef7Yf4p
	 JTNSySo2pUBoNQlCFPiQi0UuitCyPlxX0BbDrxTxy5U7dm50z7vWIiS0tAKKOQLGFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/3197F/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCC606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/3197F/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59E71F01825
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110827;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I/3197F//5bf406jcAf97sCVxQOGKU6UQ+ppRF4YfsIIKbMuoTYo9LTj5Sjy3AD8w
	 KzUFb/HWCvyqo6L0w0RA7Mux0i2L9tlWeNARzqQCoTEuRvWNWYhZUgP4kshPwZnbqR
	 qLTdSi5pTD64Oq88TgupSzSmf5UvVYDrrasz4m671Snyp+Qd5JLlhhCzeJ6yacD0A1
	 ot3I4+kOrMBuvLutRTGJ/d8Tc0Og1ksLmp6oy4CedyYgX6NINvi1kEE5e0iYTsAhic
	 BWtWbqRrF12zvUIqmwHD09OsGL0TYIP5ow6FProRbLMo8vvbOqpDP+oG7cmSY0LqTR
	 dCULZxEgiBaxQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4911df1e196so2096921fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUthBN2n0+s7eujIUVHpAB0QO+G8lvb5pV0ivvP6g/RxtkmUYyi5jeuRp90Cd75/ZSgS+ENAxZFDd+@vger.kernel.org
X-Gm-Message-State: AFq9FYIZq+E4FXtZUy1VPRbjHDXyrU3IUhNDqDBQBzyB8PLhoIqXs5fP
	36YQUGyNWNAgEZiMRg9cBZ/GUT5AqZufvEzyGvu2aKZ8Xyz6LseqIlgQLFaxXkU34rvY1SY1Dz9
	EBDtbNqyb0bix70IwU9Qtr3Ya/m0Oxjs=
X-Received: by 2002:a05:6870:c2b5:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a83f533260mr6584722fac.22.1793110827181; Tue, 27 Oct 2026
 07:20:27 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
X-Gm-Features: AclHuK9MY21FRxc3OT2vCWHfUpZZ9cxWX59B-lOuZ_icl7P9J24tGPdGErZiGJg
Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
Subject: Re: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
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

On Fri, Oct 23, 2026 at 7:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Link all GPIO controllers to the Pin Function Controller using
> "gpio-ranges" properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
