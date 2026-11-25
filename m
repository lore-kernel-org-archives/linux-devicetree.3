Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638083;
	b=wK9pHQBB/bfzIaHjE7fJxz8VfMhmZFtRPKrjPbtB2ek0aDS3tON9viXkuuRN9aYdWbQT
	 FzFVjsTWgmkzteLkulK2J8Ipyv1oRIES6xBzgm01Td2H5rJgH9WQOs1rHWOVhyg70e06K
	 8ErJO1nX2z6p0W89BMpXqTGhf+FDdhhq3N7U2Gn5aup/Ff0Wbm/qF5B1aVFvIVnr8yi7Z
	 uPrTQwuUesK6nyxqIw16vVMaXD/mwXTLK8ntxU/p2lZIMAlmm8tLXlDXuTbP2HNDC58wV
	 FVHFLDt6e55aBMhRXYUVjl7YeWBvpKHZMp7sc0Ak3CZKPzMQ4bkM2uJiA5YiGoBl50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638083;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=d+X14DANS5O3iOHEYShXxLr7GGZvSrigtM13ny3x+BM=;
	b=Bi4uDbg424VwFcsm7MkhLiMNjJd3Q1JcQvfukjYdF+dudMX9CocW8WKHXVRT0vZch/iE
	 bvCAuhAyDV/K7BEtehlZwAbPfgvD3XHxbn7rIJlpQJrAUudpy7jTy/UDGqLMFbNgsUZ3C
	 IHAOHdAHqlLQtNHOSZ3wS7A4d+jeAiXjiN0r6ZNW8TIz0dbFBYx7adxURii75Obs9xiy2
	 OK/fkVEUrAOwUhGDg3mdk6ehff/GQEqaM+6YJCxg6ngMjY+Xzv5mKSBueDurS1sJH7AeV
	 cOfYoIoSo3duOWnzzx2vavCElvho7TnV+/7DtaJNd8t64Ip71Io3pgUkRgyidRgqraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="I/mCq+r9";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06909606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06909606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=I/mCq+r9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=d+X14DANS5O3iOHEYShXxLr7GGZvSrigtM13ny3x+BM=; b=I/mCq+r9+IP4jEUb5srWtPXLUR
	Q9eUARsmjm6g2+CWrR4LzXL/cuWDw+cMdaFUspq4xmBnQtxROU/EkS56FRkzJTDijZHCRkifgMGCk
	M1jZSGgaJLSGCuXerVs7Dk+vS/Gk1k0mSzJxX37Wtbdbd+vUqhMIx0e82ED3DB2SusxtRZ6qTsY5B
	oGNZqwwyBz5Uk/ZU+lDmHK2t9tpinEV8G8FHYX6JqPypnFOftFsG31679JIAYuctlo4nMflug4bA7
	WooYS6uDmQ2XcTmbFziaYnBTEGTW0Lo7g2eP1riNa9Cj3UlRu5BeRc/c1yjCp8sAVNHsOXdMne/70
	BnbChMFw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MidG971 <midgy971@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Wed, 25 Nov 2026 21:21:03 +0100
Message-ID: <179563805248.3885553.17653076293063984623.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120123250.1417061-1-midgy971@gmail.com>
References: <20261120123250.1417061-1-midgy971@gmail.com>
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


On Fri, 20 Nov 2026 13:32:50 +0100, MidG971 wrote:
> The ROCK 3B RJ45 jack carries two LEDs wired to the RTL8211F PHY LED
> pins.  Describe them in the PHY nodes' "leds" subnode (binding:
> Documentation/devicetree/bindings/net/ethernet-phy.yaml) so that
> PHYLIB_LEDS instantiates one LED classdev per pin; the RTL8211F
> driver drives them in hardware via led_hw_control_set (e.g. the
> netdev trigger with link / rx+tx modes: amber = link, green =
> activity).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
      commit: 5c83555aba2bd0835228b2205a00ddcdcb3ec1ed

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
