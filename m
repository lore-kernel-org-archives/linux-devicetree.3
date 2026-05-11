Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569D346E51
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529846; cv=none; b=GTuwunYEmPMfNttRjfFmTH8ii8X4SgT9aQdH8TtjbTsBjQHMnQULc6XIDFMbL8FlYICsY6p7BaKgrHQN9pjjeDgfj7K7QajZK/Lq18mv1+1uS/mInB+JNkDihySC3/EBVVU4fvDl/yk/5YrdgqYfJXvMfB/p63ngNxMAYPptWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529846; c=relaxed/simple;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fE0zRfZwanrqW9ViBJnO7naEXCw8txlr3XAJZhWHkb9NDoe+6S+dDyapH79NoDFtOXbEeFZUhulHAybAb7D399ZKEZOshZDyZwBj2AnesQuhq4RVG/VKgmD564jgizhfewripHCQdAgjkpboGYaF05el/d0zA+bVeTxNA5JAgl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzCl32cH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzCl32cH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DF9C2BD01
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529846;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uzCl32cHmsLYYMmy4oExJqEv8+Di9wjh49qyk9KHzEGnYFtXr8W7PJiyJnE0EVVHz
	 bT0F6XVNgJ+UcgiaWUL8qlL82z+ixmAAN7sjUUe88/W2i3uPs7Pngw+oj3/aLmqGxI
	 TMM6s6yoayzX8p+OXRNa9m/Ruq4eP00cnT+/Uhg6UWtc1DXgo1LyF5qGxLeUz0Ydwm
	 v57sQJs2UUFbwOdx9+NWFiv1/eR6spbuNXCbPUXxX9uQABg7+Ku/bL7u/0FkjfLYaA
	 ikHf55Pi/jAekAJZ8vyV/sXmOtSzoCH1wPAhFc/+6W2eNWsvellSmzZdCZKbdmLZNw
	 fBhgHT23UcBdA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso3561729e87.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8pNNQc3koxnALG/or4WKbGGAqpwX3z4Lm+0kK8Os5YJpg2u1dsM+SyIfCXUy9RtyjxERMV/6fxc9kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxte+hX8bBSwOZ0vGkzWTcuLXqGu8fI/IJTyrHWQpfd6ND0XiW/
	sZ1AZAJCXVyQqde9zPU8/yVkKYXATghdQaENbsPkqehNdbmX4ONwGBiX+c17lpcQBDkXTPvKvAc
	NaoVO2r8AjWvXqQoj5bIhDY39pOX5c8s=
X-Received: by 2002:a05:6512:1053:b0:5a8:6ca1:425c with SMTP id
 2adb3069b0e04-5a8e31f2461mr6054e87.36.1778529844902; Mon, 11 May 2026
 13:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:03:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
X-Gm-Features: AVHnY4IeBgb1SfMX7B73p8P9k7dubKkRwUr_eFji7cM7YkQeG5UUDe_o_9aehh8
Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:12=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij
