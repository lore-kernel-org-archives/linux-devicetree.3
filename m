Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773280;
	b=MbsI0r+/pZRiyMWYnkf0gZCQbm8r3YUKE1HFCvwnxefqsr4NqVkyLH7+/ybrimlTusSF
	 wZrTxIB1gSTIj2iTMyBt3dUraAJ4iFPTHwsMqEU5bOUbvOFHKPYFZjXF1bLW6GK2NRxUl
	 gntUbWT7FyiEIcTxkL+z/RPClLYSJBcT7jwPueMaG2u06hMwsqk2ghj9Oo/8zFB2chwnX
	 AAR9+uiY9W1yJ3JkINZXTu8LcwQepSB03rm9/Zxo0Rnq0H2qeVNyIfaK6NvCf0h22mLWO
	 ELVEE1IZYIHjagrIjfyTs5pOnbH32sTFQ48PtXVsdc5eNazbj0JWNzkM140LSvD6gmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
	b=0s7pOhITxaWnbA6/NDjhkfiUE2AJwHrA8f/9r72iFqCzadkQTZAVO6zlnSXspiLpAVk5
	 hAgkTBzgYNfJSlMA3nC7HDPfSivy3CMkNkRBqXqaSVSrhryhfz9MpoaX9B6TuaKpnhvQD
	 YXKNiK1lTNWzAXTYUqCqHruNVbkSNTduOO0ShrpvXpkWbivpBywMlehfKAq+gCLbPeXO8
	 DGqqj870O2Kf9217dUwXS1AeYiiTiIZ3Ji9+WoZCD6hh4mWYnWD1/YI4m0ridV7uXX5MI
	 Wv4ukKmLo8yWzqEoizspDnmS0/s7aiSSfhtDZEBhOGZY9Eu91MV2DjaHq+/JzNyplMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A12606A33D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A12606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso77446225e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773278; x=1796378078; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=gF4N7eR6wbYxwpQdFZRD8u17QtLAeOHIGciJxFGFH0qkLFvkBGSIn4zqV/9OUhTqk2
         FYuKv7WGQ3iuusTnIDVnRWlXfcm9AUa9E4borOHqUGVvpakVeRHFSjA7LPh4mADdfGkQ
         9XpGyPmX/jQubZVBdjszhdl4P2WDYuk9W4knbSftqmc79Rwlxo2hR4FCYOkOnOJuDsrW
         S84pjwAOq1EUSEIyhkZGtLuNEFo5ZWBYq4vRy8m52F8z9HTiFIw8XYNL2Gq+1TaZ3Ike
         gnRQ/HSdhJ7Xq9dplpKJd63EkMUZ0cBh4ordEUr4F0NALX62RlM1bBuSuofWgLjYav2K
         gT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773278; x=1796378078;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=R5KFEpFvDW4WOvkbYZ/A9z3GFsbtlDXK4pAz8VHOcu/squRTgVWgj9uDHLHvEVxXPm
         UJywF3Eg8+bIf0ZkEUe5ilnj/jL3b7Ge40kGqOCUe5ic3nVGVD3MHJBXOaxyjwi2jK94
         vtlgWCNjibb349yTBDJA3aQSoxBxq5Gee1bUo+ovrrnZ7tMyJKBPvXBy3d4P0rduP9oD
         jv0gAkQ/JIs3pl1AoG5P5KdvrZDXZJXjWwDhhULFqogeBH1cS+ACJhsa8zyuw2Pu2xQ2
         kWlrTOwZGPbgsqSl+2ZS9+TLD2mkWT5HwuO3Tawu6oSVrj5GUy5OJiAUGq6yXOzJ+lPm
         QRXg==
X-Forwarded-Encrypted: i=1; AL+hErEp4BtSsXkGcnd1GIz71oIB9apLVssCEhNrucQlXQHYMsxA/vlNdbw51SsAc/w11CUyLS2n0CYh2HAt@vger.kernel.org
X-Gm-Message-State: APuU4Z+Urx4wRcuFng9Dte6MJ63l4LKQsdM5bC59adr1SjkpBu0z08KK
	Ck63qpjJdGxgEiMSJ/e2xNbHxjJtPZdhH/tMKV9Nsu4RzPaWccm/n6WPnyCpG6/bsVk=
X-Gm-Gg: AZFdTZdkTL2d5hl7va1aymcxGabqE4wT//aAg8w0JdIujkOUxOF5pbn3rtk/yD3VXdr
	cvgDGXq2xmronPJo24vJHCELYgYFcd8C3yGLTZv4GvjNnStExCOmUUBTBw9zCdTgzNwP5YUEECI
	1F/j4EjvRPHlUgxfbFiBAs6+b3oUQKZKYV0mVxKCQkuQrKQNFnm4BCyxarAotwzLUuRjEyMrURs
	IfJxr0gJx3rVZKFmm8N0q2WvA+/NHSBIIhQlbkvtOr/zicxGTmuO5xj9QtR5TVDQMmSPmXZ3pEm
	Db5/2uyIPVSiMdJeO4T5y38+1fySuWUFptVd2mqoGcyGK/l8Ws3MEtWMUlClJaXLOWvUBJPDDdG
	eATKh9oufWDarA+Kc38wZoFp3hoPSD4AHtbTpGmIbtJaaWfYeJ2cOpJlfm1lGUGbAKr0AUnR043
	yh5fw2b0DDqzw+nmCKlgMrkaH02zgJqO/nZVPJUh3tBVYuN0nyulmjQEtMtjq56TOQdim6QHFYv
	G0eZ6sO5ip7o7sR8Gufgo1Gv+G2sVUgTz3UzWkpmZteODpTIf0ivSKITBGWJP36OxhUnW9Z6sPW
	Ytxe0zdRK13oUatLL+XSWkmUTqovnyL0YY1rtHDp7Prdfz9+
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr473789905e9.10.1795773278505;
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560118415e9.9.2026.11.27.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Andre Przywara
 <andre.przywara@arm.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alastair
 D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
In-Reply-To: <20261126064345.2569445-1-alastair@d-silva.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
 <20261126064345.2569445-1-alastair@d-silva.org>
Date: Fri, 27 Nov 2026 10:54:37 +0100
Message-ID: <1jik1iwqea.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 17:43, Alastair D'Silva <alastair@d-silva.org> wrote:

> Hi Jerome,
>
> While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
> two hardware differences that also affect this series:
>
> 1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
>    Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
>    CLK_OUT back to the MAC and stalls on 1 Gbps TX with
>    SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
>    matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
>    will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
>    boards work.
>
> 2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
>    With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
>    delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
>    top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
>    it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
>    0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
>    inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.
>
> I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
> series and address these in follow-on patches unless you intend to
> roll them into a v4.

Hi,

I'll resend the series soon. I don't think there was a major change
request on it. The way forward on the delay matter was not
entirely clear to me to be honest but I know a similar discussion was
happening on an Amlogic series. I need to check this pan out.

I'd suggest you build your changes on top this. I can't test your property
changes without the board so it is better if it comes from you.

>
> Thanks,
> Alastair

-- 
Jerome
