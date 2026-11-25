Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600193;
	b=CWlMFaJQY3M/V1cVREg2Cpa7BEVO4PEsqh9sIanQtSKgKdaOwdRXMfW3J3xvY23wMdGA
	 Uo+x6Dp3f7XbliT2kdyrQabqklIM+fE8BybFiE5ZXQhJSgkb26tzjFQmxc2vKRmcWR98Q
	 OsTjdhjshj8T0A+fntJ9c+MzYMfe50QrZePQcrrT5P99ZwVKIJzfPDgdNp4QQm+euv7ZF
	 F3tuS8v8yaqqZ+Mh/EtmlZ6nDR8Fex0YRERq1wLgAYP+86Yj9Jw9vj2EkuKHTXj9zLiiI
	 Bn+3dIw5jHjLIQb454mZB93wHH8yFrGpwUppcfnHuIXXQ3nNoitTNCmP3N/JcUzNL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600193;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=xunVIrIg01k9dWl2kATM9x8o4Anfrw/KbUh3MVWvjx8=;
	b=XS/zzZRWNf6JC61RkZaRgmFipdeSMu7SNspThV8vOkwnavZcTTCLe1W810J7eZ3Zkv4z
	 kCVlTzJoVTMrHW9IiDbV9zMG3eMBY4ZXwx9fcf1yzYSmG47Z0qlk4CehEvh7sdotgf2K2
	 JtEQWS2La3mJFMs/QWUk1vUQI6N9j1lIvfP5NgVQeksthtT7B+RC5HovO/9puIWBp6nPG
	 HS7HFGlkZczUAS+hzm45nuoSBMInhdonA+3F6qDjZ1f5bE1NRvD26hAoqyNE8bibtQ4yr
	 l8BDAmCdCz8Lh3NDTn79g9m71Lvu17Zo35QjZoq8+BeH9QLxBM7c2FgpsVVIL8SzE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9OlPYx2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6F606A31E;
	Wed, 25 Nov 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c9OlPYx2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE881F000C6;
	Wed, 25 Nov 2026 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600192;
	bh=xunVIrIg01k9dWl2kATM9x8o4Anfrw/KbUh3MVWvjx8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c9OlPYx2PUb+TnnyiKOi/AM/pSJQPhY8w0GpFwH7x6KuDmzvMvoFeUe03oy8IH28A
	 e83D4o/FNEUNVJ8lxP4q59b4RV3vP9htyOLPp6ibBlYHJDZL1wH4kAujhXA8nOaeCt
	 L6yZhC6EV3WVT1d+YmEIAluNYZ+ahmfbOb5t2Aki+GHhArOPfBH0BcplK2dLDhsTpi
	 FYuaOzGZATGZYemP1Kr5f5rQKtVXxXSTn8+cpjGzy8neqIEZ4xCq6p9su+XoClKwnb
	 U87p0ozEys3cwJt838wrptAU0CZaneC8nvQKMcCGjeu2bEHoGOVAfM/J65diXkG3hC
	 1VwaPWUhkrotA==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 Ultra
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-6-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-6-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:49 +0100
Message-Id: <179560018960.14607.5906486541495491849.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
> integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
> 512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
> IO expansion interfaces.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - No change

Same commit, what's the point to split such trivial changes?

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
