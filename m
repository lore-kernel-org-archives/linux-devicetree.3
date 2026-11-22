Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387847;
	b=3yFwRCVL5U98/3bR8cYkeNishlhRaV9qLvAymMa4+5fpNJmZdkOMZnofyCtPoSP6+nhC
	 s2Pbfau5vuuKJT7SWarbJ4Iu7Jt6vTqfgdC5y8Vp1h1CjGCUpKODQWt+VEVAdtajhD2jv
	 z732fR+/WuH2UDYD3QPuO+khKtTYyJevAcUjpgobZW4qZ1aCe0xmE7iVW7Qy2Gaase4zt
	 lWBDZSFKuUYf8TjJ89itEEYaPvKnXlvwi1Drmh1Tym91gm5zTVuDC3xA1Y5rF07qhlHlP
	 2oTMpsILIZ4RmL91D0vWse04Q4Dh+4IWAmB2pMVG9j2Se8b0YaabCE6QAy/X4BE5ADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387847;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sFSwHGwHo32EJJu92ZLY86GI7XA1Y+jfQynqNyB7W8w=;
	b=a0iavZWoUu+P6q83bjtplc2RFihXv8PmDwbzwwAKyscqgblpSKoLvN7Vq1TdsAMB6WEL
	 6DCMptTK2fpae4qrGRLd3Dr/erWvB40C6hpTjNhgS43o2q3BZ8GBXa5MnRP7U7+YWukdB
	 N6q8hE8/Oy9sY8J2ltX3tFtTIw40+sAmeKpmcqjYVxJa666sywFhHjcXMC1iXSpvzL7RR
	 /PbS2im+vtEAVpR11SrtrHyZiR1dGgcvdabWsmsWR+hK0scYgD10vNp48GJKiy9f4Pkv+
	 ZEO0akn+lNBu+8qijE8/1Xh6ukmJSUYzrF7AVEUqdUM3RlYScS8kNDbNAmt03UwIsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nF4O2hzO;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8E606A320;
	Sun, 22 Nov 2026 22:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB8E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nF4O2hzO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sFSwHGwHo32EJJu92ZLY86GI7XA1Y+jfQynqNyB7W8w=; b=nF4O2hzOQvod2nLgjvx+IOZWcE
	OlV7JlTTrHGyWR7KIk1G+zG9Cja6PH40+0p9gENHQywXjSaKapx8LCEfHNF1GuGtUpp/TPdb7Rlcg
	iXVqTkx2jz4D5f1AYo7uCFwBLAV5iZ7f5pK+5ejvCScIY391Xjxf0cdkT2RI5ETH86WkrWnZpoG6K
	R6GIGGfgYO9TQnRKlvjOD4nU1ln547L95CuvRXEapP4Php8c8nqWS1vkHB4OttlJnbZ4m+7V82s2U
	wuA6/4F1E1czPEmUK3VUGfxKmjatvnByXXV40ivJlE6IQ5agnc1pVbKbD/BMSObuzKGWVGxIj780I
	qf6ab3vw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
Date: Sun, 22 Nov 2026 23:50:20 +0100
Message-ID: <179538782475.3150822.2947713629701780597.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
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


On Fri, 06 Nov 2026 21:52:35 +0400, Alexey Charkov wrote:
> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> controller and a fixed-voltage VBUS supply.
> 
> Describe it in the device tree, including the wiring for both the USB and
> the DP side.
> 
> This makes the data roles follow the Type-C port's negotiation, so the
> port stops being host only. It also leaves the VBUS regulator to be
> managed by TCPM instead of being hardwired via the tangentially related
> phy-supply on a USB controller. DP lanes are also muxed dynamically by
> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
> lane muxing also goes away.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
      commit: 55d1d74d62a7962d16ae1bf63083861761966e6d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
