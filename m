Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871115;
	b=TKPDTdFePH+vZ/v7EbRcp0Y0eE25DqXhvr8Yvw09AFwqZqYGwZhtscnbYvkdbUFV7ZIs
	 tMX06c6VnRjAJqbcFuC/udmk2WFyp079AvBIIJ7eZHhiC+IkqF74WjvOjkJdnTdxkmVJY
	 mFEHMAi3ZmnXv6dvKp7XddT3GqjEDRBPzFDlv36a9f1AdAUAcAe4gjkoexfdgxSerQeZ3
	 SkI7r81ys5abAvNlXp47cusbrWPp5l1yTOHpnjD1Tj88N5SH/ggBrREht1Hq0xCsFRiks
	 J85t7ThIFpDfgkLqRJsflxz8MiWtC9R8A715dJdkbiXJtDdRUlIWCXhonLD9Kw9cyNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871115;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	b=CYIBSn9yquRDlpwDsRinn02bezFBzwcbTN4+NpcKlVJV30BAfk/UxBSaze96qK02vX2t
	 v9XjkY7F/w9NriNH8zceQfHeStw8cNMZRUdoS8bnI7d9WNksXw56lJTHLnUG/Lcar20va
	 4cYNz+U0DY0lGqxEzjYrE+ZE/tpHonfJsCvcIQIF21BI65knmJZDEoNEVHkudFOgjIDjx
	 e8tp9SiDZ81ppzgFC3wyD3vAIS5I9Hiw/ybIaAK3qt9k+81aT+qKGN6PM/at4M4r/s9B2
	 tT7HTTgD1aIUg1pFGsLRQ5pQnpjIyKt4zZ7LAu3D0bGFIn7r+5swQE9XYGQm6VktOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633F606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DF71F00A17
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871115;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IcGF+ZvBwwIDv6RtPf1x87ef0btHX70l7XDMWkc/ro1KTUvF05h0ToPfcRT8jesUk
	 Fhr2cO8O7EIKgzsE3HBIOFYjUT5lwPLHfGHCu3ArLld9sTb8XbdT+txyHco1od0kRH
	 DLWSapdam7sTv8Tr1UtGO0+9ZsCsweL7iRqpQ+G9kKlaONpqZ0UgnKSu4Hq1nsnqd3
	 8Mrh6MGAZcA3Z2985TXdwkJ+KOiT7FujUYG+H1JhEKShwgXLR1eNmrtkBYP6KQJ5wS
	 MxoUbm2zigts17cd8T7srBFWrIfivBxyssHH9RLutMD+sDhv84Iv1RL4n43o4vkAdt
	 vScoMcwFN79pQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso13853211fa.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:31:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBykK1feopgZzfw/GP3NJDRg17zRe1dCLyjdl0mWE+vUJ7vCr8YCjd+6mkUzQZ2+wEKgp9yEPcK23tvA@vger.kernel.org
X-Gm-Message-State: APuU4Z+/vGeN7Rm2pYUSS+I7MXoEY3J3N6OlCwcgJV8r9osU4BJIpiWX
	k2147GxoLHg0pcT+umfaGgGN9Nmd76IKNJbmuHOHs68ESsIb+6X7sHlhwj4g+4D/+V1rwjtyfXa
	KbUuNB6b7X1ZM8uFea1UMti3N7oCBoEw=
X-Received: by 2002:a05:6512:3f14:b0:5be:64aa:af1 with SMTP id
 2adb3069b0e04-5bfd951d51cmr6307404e87.3.1793871113805; Thu, 05 Nov 2026
 01:31:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev> <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:31:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
X-Gm-Features: AclHuK8im8p1ygqVyltdRT9NHRhFsG2j-za_UOILYFTJ-DqXIB886YYYR3EPHIs
Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: joseph@telaak.dev
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

thanks for your patch!

On Wed, Nov 4, 2026 at 8:21=E2=80=AFAM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:


> +static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
> +{
> +       return readl_relaxed(priv->base + reg);
> +}
> +
> +static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
> +                      u32 val)
> +{
> +       writel_relaxed(val, priv->base + reg);
> +}

Completely pointless indirection, drop these functions, just use
readl/writel directly in the code.

Yours,
Linus Walleij
