Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423184;
	b=VaOVxjp2arCHmCfCAFcQoZXx9K+3b0M7zn+HpIjGA3WbIlpJuu8GNKnUXOvc6OAeVlZa
	 YheBtaxIv20TglyGrjJyQ41AN0r6el09tFPp8J7XW15l8ZfkghzZD9QE44GWUr10gJSjK
	 fIOdDQKl9gnWk6TwVS4HaFMneMlwkGG6hlHILo+A3th+Spt8KG2mlr1hbIsW/+/25Q9Wa
	 rWZy3p5D3tmTtG8goYhI3/Mljtu6CdS+H7cYdP2Fl5ZoCx9Ri8bVL15RKdVE1FLUr91ex
	 ahY03pbBQ3e9Rez00h7MiF0oG81cymeZDGCMOFCvuWRbhiy3HgS5oP6IhyATRkEUZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423184;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rHcVKFskE16WvqfDEM8dKQQtjFYJBQrFBuOWdXceh9k=;
	b=QFkmdTnf4XVk9W+0Ipx77dGrztCf4r0s6m3fvKd9G/KBXxMCFFouRH72NpqfsRUSWLFC
	 gTZGKTJ2k0l3zeYaRYHB6jPnPNdYc0dt6X+/HABexbQvBeRwBzdTeO0+dK8iOW1isuWXk
	 eozXi8qQUP+DM375OoR8r4A5mppS/UY4stNEolQ8wmc3ARbH9DnjoSKrB8U+szs2vqT2e
	 SJLVcDAgA1oC6Keej96IOYo6xBpQ/MffRJsg5WdwspLKkYudtImTkxKzIllGLVWYNj/Mb
	 yTwbVva/xiEDjaclNdwAaNq39y5qwuL1Qxm13TtLstWpiIZf3t6vX8L265s58nuem2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmenOAP4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44C606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmenOAP4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D888B1F000D4
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423183;
	bh=rHcVKFskE16WvqfDEM8dKQQtjFYJBQrFBuOWdXceh9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KmenOAP47x+39hMYReotJM518HSXLWQldWFXDbA2alkm463YBdRmuxk3Ki2lSnZtA
	 zFgnjhWae7b0SYVAKvF3ZhkUkl8sj+fwCVjsB0ObvpU9LwHNx4TfLTspYUGRjyJazQ
	 86eN49zVapq4S2Wx43NcPomFkBXw4AvaVvD+/moOjRuNP+IWjzgKfZ4I4vOHKEtbvk
	 3vYz2hV+odubKMSI1mQDagvMz6AAfgFQ+oYN88958fBI4VKLzs1fXkZ3J694+JV16O
	 PFHqgAYop70iIHoB8HWnp7fkoavpmpVXnRGztS1sCMhjL6490+/I+cgbxce5fevsnD
	 /obZqgPT9x09w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c126f80426so3101747e87.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGCFS611yCdqDC17ZGs13GHArWsdxrZ3xxHYhD6Zuu5PsFUhT6aFHDQjp94VvwYGzkRECxKb2YmOCLg@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lj6FGDA1T15dPONnzMJhZxYhbVmrkKrVKydKwuLEfdtAIQ/2K
	a0mIWHXp/FyyzkbqhKIPWs0ZgF0qN4Nzkotx+3BsbO13ZRQ8PW/4qK7r62MNxibrakDwqBUjg5e
	oFyO33wrPvKZLoYW8l0cqOBbeuAR+ETM=
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr3038979e87.3.1795423182665; Mon, 23 Nov 2026
 00:39:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
 <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com> <awPxSN7wctw6xsDf@zed>
In-Reply-To: <awPxSN7wctw6xsDf@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:39:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
X-Gm-Features: Aa3M54p4GsfoEWdtkuj5oItCwPGzhNvJwHA_MjvL3pV3p_XEjQVQ1NHvHx4FvqE
Message-ID: <CAD++jL=iu-zT5BwUwiTmyzQpWf2M0ZBT6FsheGziKT-+xRBGYw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:55=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> I have queued the patches already for my forthcoming PR for 7.5
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/commits/pr/mali=
-ivc/for-7.5

Thanks Jacopo excellent news!

> > I guess the DTS patches go to the
> > renesas tree and Jacopo picks up the dt-bindings and the driver fix?
>
> As we prefer, I got a PR for all 6 patches ready.

That works fine, I don't think there will be any conflicts.

Yours,
Linus Walleij
