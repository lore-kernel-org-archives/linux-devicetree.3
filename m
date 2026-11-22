Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387846;
	b=oC6NtYjBNc/IDOj0wPQZTAWMU3AT00BcIExcplHyvzdSWPYW00HBBHuj0EvYT14ER6O7
	 XybsJWq/gEq4b+RPEggBgVGhVIBIBZfntVYWQ4i8cNXIa96QaMQvGzBctCZph6st/g1TZ
	 LXldGwDAgjPo/RBH5m5xK5vv/vlCbyu0dk+DP8S+ABAD/6jxhLP4cD3Z+R/uFr9Aqd5on
	 U9c9FgNKMUAuFAmzyQ54JB10sGcjcXUmygZ/eZpvuPm1lscbg4tRWaUHoaykOf2Yb2JSP
	 UAlW5cl2Dk3EsswTEY2jTurlCOnp/plXJlOLfvAEsalWjUWgGesVg+o4dMj+S9gHKHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387846;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m0n2SYcY79h2AUU1BpwbEVohNWmGBSP6n4I5dcaBSL8=;
	b=dpWMeM4fyan8JK+zwK0GoGElXLWdN7Q3N1qgZuMBtiRnKt1laauutFllLFeJPKi81ZHm
	 aMcTUPMFS4Ozj0Hp/b8vywD9YOj3FTFPA8QAC6iMFHqFL0o4IO7g3reA4+eRGPJHIcKUJ
	 r4r7WXeD5bWH9p5SppS6BUoOXkdvNCMQQdoKGQfBArpVSCmMZO1OTXEOobQx7+h2ZVPlI
	 lkBerLMxpgBPcGjcXeV34ee5+ysgeCSV79zZgx/1iHHCHe8tFBFs89jVSf/KEeNls6Jbd
	 Lbj2BHtICCu4ZHdHNUZRDgMBasTV101b6V746gjpgpxjSGkZR1ROi3BTe9Pf4rJerYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=kF+a3xZN;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A1606A327;
	Sun, 22 Nov 2026 22:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=kF+a3xZN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m0n2SYcY79h2AUU1BpwbEVohNWmGBSP6n4I5dcaBSL8=; b=kF+a3xZNaGXJEfbrh3p4y3vmue
	7Lx+LfyXqZJRUliEFzkvHVMK9XySoBiDcm7VsOFc2gjV4AyTT77D/3kP+S4LeHxIdYaw79jJmSYVe
	yY9JHXwHpRM8khH+7hgYerkVRNjnmNc/9zIrKB5CTbg7pQuElUJfu9QtuE20okjw0s3WgjAJZ6iPw
	tRXBTxYj70uwYwxV2ed4wifSnPkJoSj7sBPY56S7MaY/pMq/QJxuh6TLS0xsVUon0CVMtuh0CyH+F
	9PQ4Zv4IPNSue7B9TZjRtsnP8no+4lzpNVlnmQlH0P4pux1v1Qu+DseWIoVj7Z198ygUy1VGyMLQq
	9JadTD7w==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Sun, 22 Nov 2026 23:50:28 +0100
Message-ID: <179538782470.3150822.2574967572696059189.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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


On Fri, 13 Nov 2026 12:38:05 +0100, Patrick Barsanti wrote:
> The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
> SoC. It offers efficient AI compute for multi-stream computer vision and
> generative AI applications in a compact design.
> 
> Product page [1].
> 
> This series aims to introduce basic support for the board,
> which includes the console, the eMMC, the two Gigabit Ethernet ports,
> the four USB ports and the HDMI connector.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Axelera AI
      commit: 26688b74c3706b4e890517f6add709446b214102
[2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
      commit: a74cd16a74e3ecafedf392105d6d8ab6c2dfc1fc
[3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
      commit: 4cfbc536b8728b6c217add4f321a6e80d7c03cc8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
