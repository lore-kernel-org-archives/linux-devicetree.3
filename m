Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638087;
	b=3ecrD+Tvw2QUeg7snUyOGVyfesZjVpR1zPy2XqhEKr+IQpc5mVnDvbUFlh8zDJ/WAkJJ
	 wvjIl6pAnNFPHHoLPdBKnlXxKKP6OjyoExstvL98+zp5S4K1FsesnULtARiAu/acg4nth
	 VR5YE08E6LQnJXNIpTx8M5HAKdhitZ1kZpNk8BZKglksOMcyZer0RxgYBZobmKVFH4Kn5
	 jD13p+lxL0jG9a/qm7ZVIazYbpI8x3OOVDwJtcrzv9Dp50bO03UIu7gH3z0biu2n8//Iy
	 8Urt2j1bxO070ylGM1PX3rzE238s91PNAJv1nt0O0BHSviwardB+WOfFYwc8UWDBrJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638087;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B5BZgd5zoHz0zdIhCzw8DSXoUSIrWD5j0BYlPEOOgi4=;
	b=dxYUWdhqbzAZCP4D/hXhQhYgxQ4zxBhxaJiM+vypNYKRKnBCijZxhDy7ipmN/pGF6iYV
	 t4n+WroKToA7HLzCI/5kmil4zMy/Z6TRTgiWQxtzZOMZJEEBmTEI2YwJ95GkUjcWNwhAV
	 +u3xrzTIACvWIcXJwvrixsAT6FTolUibW4DUxqIJZDICfPjpQuEUFesE074nT8BD49EXi
	 +y5ARYKoMPK/NeNN+BhleAbNyySGC758CJsh4poD7bnQQQx2YmUj+Xs780aqu2Ujq51si
	 PtwjzPUGDDnDRaYK1jzJeYPgSmnD4bGYIeOUWL73z7T7I/2uVRAo4LVoFu2z00GP+Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=W0Blz0s7;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D1606A329;
	Wed, 25 Nov 2026 20:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=W0Blz0s7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=B5BZgd5zoHz0zdIhCzw8DSXoUSIrWD5j0BYlPEOOgi4=; b=W0Blz0s7Y+5YxGr1yzjAAbi3Q4
	99BbmkOTwIREG3Xt2cLcIWh2S1ucamMoYn5/rNfMTRtGd61LH8aLY4lE8uv3DBq0Kv6z6BK6bZFSU
	hRH2gDwGDTJtyQ2AoqyafrqVNgUGeOzPTOkolzKNBQ8lvxPdNZcK/Fuc45iYDmZa8B5TFHo0N9Qqf
	fST48mLv4HmOe3WMHINs7Gj1o9EGwNQAb622Gki8iAbgnQxfnbLTmeehn/AORAPpowX6lHi3eyGAi
	CdhopWWYgnEeC3Eygk6lgqiWhfYBhU+jCHBMRFSt5BKzzIh/bw943dEUNDq9ZuJSmfP2fynLQGG9J
	HgLxyyDA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus
Date: Wed, 25 Nov 2026 21:21:00 +0100
Message-ID: <179563805238.3885553.12400647321653395091.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119121433.550704-1-jonas@kwiboo.se>
References: <20261119121433.550704-1-jonas@kwiboo.se>
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


On Thu, 19 Nov 2026 12:14:30 +0000, Jonas Karlman wrote:
> This series add initial support for the FriendlyElec NanoPi NEO3 Plus board.
> 
> The FriendlyElec NanoPi NEO3 Plus is a compact headless SBC based on the
> Rockchip RK3528A SoC. It shares most of its design with the NanoPi R28S
> and NanoPi Zero2 boards.
> 
> Jonas Karlman (2):
>   dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
>   arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
      commit: 64ac32ca71400db753449770d81f53c7f41b112d
[2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board
      commit: 6782665f70d67c0541ca6a1619b1dd7ddaf70b53

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
