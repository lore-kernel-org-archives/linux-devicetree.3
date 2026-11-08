Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098190;
	b=U+5d2SH/izLi8Y/D6azUc+xZdU4GqCBug3RlvuIXiDRUeu/N6eVkEIJ64Z80AeRF2j6v
	 /BDQz9au2vfroUPwNxDOaf6ZfdMd657jtDNiMnvCFU1Qn3GPcM32/h4OlpmWcu9cRI0ci
	 MhMXUa+z1eblSg9zkMSCVZSOYE5otYBVEyQHyk442czELqhNexXLeZllWslpgpEvuA5xb
	 7omSDfdYryqITLn6kd4rAG9V9HLQwPky9E8FsYB44EVcLhRJpsi+rF5VkH/PPpHFkfpRH
	 8TY+lBdokQvrdbszvruvjhh2sZepqeIiOoEZXHj9zwO7jDg1qkPUCnkaYBbBgIH+0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098190;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8Aw1hKcMo2UwPIo6N+A44TKGRiDCU4zKWVbhcVjBxj8=;
	b=GsT/4rUDlwUI21tnHY24Q9PYuBgO/EguIZIV6Zbn3x3HpUqKoXzVeeyhoAbXKPpa9U7F
	 Y2YmdfJuCG6sdaisYX8AdLdPQTb59MMd4IlFoW1b+EkvDPzX57mdPGkQ/vePs68yN4KbE
	 CED4SAPMpkB6hvre1SQW9sgoUAu+oOx0fOrjROBjpRhYOEq18PNlEvM30lAgHGjEzyN3n
	 jnfFgmc7DE+imM0RqksALTXviDFXGnYk9zpKZwghyU1Yg7+xh2m6ZHQgpYR5ihK2IMhX8
	 mMw88/SIXqbuRzpzF7KVChw9pz9P3Hs7/1BtN7in1F0k1pRzFXPC6uz+Un6doouvQ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=a4xwZt9G;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2A606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 00:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=a4xwZt9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8Aw1hKcMo2UwPIo6N+A44TKGRiDCU4zKWVbhcVjBxj8=; b=a4xwZt9G3lGEKgscRRUMeAzU+y
	B9z3VAlYitCLsr5CFHarADdE4jGjOekTu5k/EJ/txsvyOGhytNOKeb2Kd4MlyiXSb5GeeCfBvVomJ
	C0yvJFOo1jaUUow/hYbt8htgqNklZkY6Ox8GEq30N9FwoWRVN1ny0/Wtpu3CDlvdvf8iWWQdHEF36
	cT/Attoc9dgVr0eQPTbMYcTpoG9tI8LFIPOKIeOTnXm4I8urG94bYQ67Hb8IwqdxQwmgPgi3Nq8BQ
	4CDGeOd+jyInB8RwpoO+hzlO2mSx5XlDpi646L7gpKk4jK6SnZyVkJQuTREJHAaFIS5Qoqp/6yNHj
	UvZt6Gdg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <Shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: Add NanoPi M6V2 board
Date: Sun,  8 Nov 2026 01:36:16 +0100
Message-ID: <179409813362.1454120.2066114184347271123.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Wed, 04 Nov 2026 21:59:20 +0100, Joachim Eastwood wrote:
> This short patch series add support for the NanoPi M6V2. The board is
> very similar to the original M6 with only a few differences.
> 
> Differences:
> * New audio CODEC (Everest ES8389)
> * New Ethernet PHY (MotorComm YT8531C)
> * 1 extra user button
> * Misc connector changes on the board
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6V2
      commit: cfa6ea6d25f73595165482b2326805ecfb375533
[2/3] arm64: dts: rockchip: rename rtl8211f node on rk3588s-nanopi
      commit: b42a3f77ad0b9d672fa6228517442c9675d3caca
[3/3] arm64: dts: rockchip: add support for NanoPi M6V2 board
      commit: 37145821846cb01e1da93753d928e77c42b6bb59

I've reordered some properties in the m6v2 board dts


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
