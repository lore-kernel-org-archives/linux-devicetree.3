Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501023;
	b=O2mkktoNaflKAv4khcqoVZCixzQbaL4p9UPck92Pd9Q0ZfnaOdq5YLaVK5ismotRnN8B
	 Q6HHVTXgxdKV7Pruj0wYEV24go9g1VtdE/s3sf/2MK6nWEl1HspJgtx4PgKkYIuw1VK6m
	 1wFPRnqEodvdyqrEviGXsnms7CzAd2wUJAqtPx8KxinGaPzm8KoNYUVEYRBze4oFUOq99
	 K7Hp+mVZQccR3Bah9llJABogAp8KTmqYDV5GR1VVvCbRD22nxTRR+3/P6dciNB/aVpB4s
	 hAUOEfQceAo6dJ3CFmKIhukqfhsLUxdU2m51kyrcQlzZCthw43jwZMH7IuMxyhKTcfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501023;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=;
	b=ptYpqHYP5W75TH3LOV/eBvlloam9JxcwwSYvV6NQoLezynbJo9A/9G9REeoX6o12tnFZ
	 0gqCPGTRrtUff6WEva/v6tYWjVWuLhrcUPqAXCJ2z1mMsaifJBVDXQwAZrxyghB+jir1w
	 ei2mxrfiGVKhiXhAcX3yRc1AtNa2rhopTk8NEbCof/St3gSHpOj73CWzGFPlRAMATHpTn
	 y92Z9D5LzcWAIjlkFQ9TuJZoYLQEj5sBMsicIvYU9Xg06eWeL2vzTD4in0r4dfWOH2KpA
	 2jm1Qfv+lbfLYCZ1YGM91O86/i/DGM0S6rWNIGpaG0EmO2dzslRc6bbQdZARz3Q69Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zpsirt15;
	arc=none smtp.remote-ip=109.224.244.29
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE19606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE19606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zpsirt15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792501014; x=1792760214;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Zpsirt15KyfTrH31JaJcCMcTT7NRbu+8WsdQXGrljWHUk0wPUCmI+c7cfUXvxOLhD
	 ixLe55UCsM4AFHDxmvTpzIGdgLqeHTj7imPf8z7gq7Nsf4belrgBT2AIn+J7yc6hHB
	 Wd8Re/jFOvMKNKZjNEHJ808PA7qPR8ho9KcIw2Yo1ydoPwLkMH1ENkD2SOWhR5Rtys
	 /TMt30ne/rsY6s8/Im9uMZ/m2pF2ou+2sfLvlxzu088vi6yWciHQRckpmg7VcE467F
	 93osPHsNTTzNc+nWK3Tz/4poHFsBafCwUnjp0HpKFyyFzp8kpa8ZTSFq7UmmYOJGM1
	 hOUNOmYp6DNLw==
Date: Tue, 20 Oct 2026 12:56:48 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <s4UILXDPoM5J79laZ-Kd-LqQhFFKEy6vh8axrHJUAQ2EP4R1HOmcCyV0xtu_LhKfTBHk49bkb3E9qD44d7LoeRAuIA8wzfEjPrF-sJ2xFnE=@protonmail.com>
In-Reply-To: <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com> <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com> <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: b772592dfa4fb31ed61ac52e603a69298ce5b717
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
Content-Transfer-Encoding: quoted-printable

> That was never the case. See maintainer soc profiles.

Thanks. I have now read maintainer-soc.rst, and will drop the watchdog node
until its compatible is fully in-tree.

Thanks for your patience with my patchsets.

Kind regards,
- Aiden Isik
