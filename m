Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358228;
	b=ZqXsK463nFciIpkGjeIRqsFW435/mODaFUMunmBvEb0Hg/+JYTyb/rk3FutPQa2JHu38
	 rQEJokYHAwuwOfpCRkzyD5QU2vqBeXpGqP7B8sAwrTI0qFRQP5rGhp2eQVCTU+imKPV/5
	 QmQOtst2mNt6Ij/zQljVGOJK4ohDkkfGh/rdzmFuvIQOou1Puor+LV0UH0szKSUCRUTNe
	 7b2MZDII3gFfub+2dVzYg8L81WhVq0H7N4BSFioJe4hnochfwek4mXbO4S1G3+2g6VvZe
	 pZ+xX7S17dB4MvwzFMs3iBi4mI9qidruGNItXRajGF3zYHCMfaiTWDL/NyWNb0Z7SzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358228;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kuR2Kw8cNv8RIOa+h6iOlsgOXA09fvFgvUja95wPB5g=;
	b=KTEI1DVGbdNml33w4XlvpRfpHJhUo2qLXPuavT5l34qe+qfethSp9k1E3L0FjYAxxKsw
	 fz5dhl7gdEyUfovM5GajqhtMxJ/2f7pPg3N/Z/l5qpjxWZ+nG3RLUFksye0UF0Nw4DyAF
	 +1M/gvx7NK5u3KpqespRI4/sJKZ3dvZnZbyemXIP8aPaVn+kf2cYC7SK7Fh27jdcBijug
	 L0zrJMBcGnC3USbYYfYKdkGHyd8rQfPWTbxcsfiHiuRWa8Spb9pSmxGZscCZO4RfxH9oE
	 uoBNupEhWLLB0Gt/FqDuHflLmHr4FETsODBSMsbTEXvoukuGGKD3fZOJqQXjOpnw1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xa5/Fa4i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECD606A320;
	Sun, 22 Nov 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xa5/Fa4i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5D71F000C4;
	Sun, 22 Nov 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795358227;
	bh=kuR2Kw8cNv8RIOa+h6iOlsgOXA09fvFgvUja95wPB5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xa5/Fa4i8Nya/+TGNN40OP18fEPPcLRHOHVQkJRWXiOgxFK59Tcniu1NNqblz2Zj3
	 NliIu84K4Ra0qPTS7aSkN0hxc8zB1Xrc8txLbHESWmXKGBMCWQW0+TjGdnu0S9qWz5
	 Juv7gTFCaE4qNh+Q5W7lgoMXbE5ePF2G0dY10S2dn0OLSFJh5PlbEIN/b8l2UWFe5x
	 P1k+LP0yxaGmXDAyqR5+KlK/8hY8zKsHAq06IowIYejHkFia6tqfPll98eTthxUgEG
	 r+eb8sGZ5MPgw+JdvQ2nrPef2rRn1MypzqgtXYy6a0+wedBWs7GNvCFkLTWoAglSfX
	 Kr3IXnX2GzoAg==
Date: Sun, 22 Nov 2026 15:37:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
Message-ID: <20261122-brass-raven-of-serendipity-6cacb2@quoll>
References: <20261121213102.143130-1-tanure@linux.com>
 <20261121213102.143130-2-tanure@linux.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>

On Sat, Nov 21, 2026 at 09:30:59PM +0000, Lucas Tanure wrote:
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
> 
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.

Drop paragraph, no need to explain obvious schema and driver is
irrelevant here.

> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

