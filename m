Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144812;
	b=dPcqMnfnu6S/lDqKXPsFM6RvbD65koNYHg7lp3p7JMTFn/eLVf0VCvtucBinDOFbAp5D
	 6naMoKrnbrMsR7gQFeVGzI3+D492pdEpj/qgIM25veoxKGt51dAzntLCV1HvBJ9vzG2A/
	 SoHxJSahGYuVxKzz3roMBSYLK5ZOCzjEBQMrgx4yF0CaTpQKBNrVoo2WPeIVYxCHO5ZbI
	 qDGRh/xzJjZDXqo/7bQOFR+fWtpHO+kiNklQD/Gj81NdDCTiP3ckvIiJH3FPBJTarn7LM
	 wayHTloRlTXrK3EhhkWZYQ0PVmCoTIN1QOuVdXbKyRYxN5qgVNSHN/GkKst0QTOWNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144812;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=eEq/2+Vit4SaFzgEm6OozlXBvSZTVdRglbT5dtsqSOs=;
	b=xWzF5yXbTC1gwpTWTdWLz5inznTV1+yKivm2pYQCTqZnke0NpIAjXlc34BlYTb+OFa3Y
	 eh9/GQ9swu4cIupW933N6750JWDU438getT/VGjr5PvSrMueQkHvl61BtsegpWZx9/3nY
	 BwltXt8Ley9KmODMfq9W5fBNHBlKlNeAH6gTcASTSBzeTC39FW3LgMvNCWY3DmeRy+poD
	 3Ids9yl+JSxUSFLrypzUSXlDWkWPXLfysLcpy4AEbOtIGiNo+07lglduzPn1hBucCw7lb
	 pm9WS6Zbovo0fHj9SX4CEz6htcPh8/O3F0oVjXWnVys3/zM4fNyOmPch2quYeao+TKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4mnqzvY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89560A2603;
	Fri, 20 Nov 2026 03:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4mnqzvY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8229A1F000C4;
	Fri, 20 Nov 2026 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795144812;
	bh=eEq/2+Vit4SaFzgEm6OozlXBvSZTVdRglbT5dtsqSOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n4mnqzvYWTeMhbxByTZ69UwX++muC84ThA+J2ik/MSr0HID6jqV35yjX48XShR0Wa
	 CqPbnDd1uzzfq0eL82tadjF0BkHljYqEv7mgvzcDxrApty9pXIqC09EyJqprASxqHa
	 ZCRB7fckAKevR2j8p12SSNXhyGP6skK30DzOmKswhkIOrkNVhx+sATNKXDFqKoEgyK
	 VKawUALmKlBeFV+fWV3jEIks3by6jvCqvy/UbWzdscQlctKdy0NAaeUTa1Vnkj/nFa
	 Av8vuBferX59ptMJwJsjs/dyldrQUdQuktFxVoiZhy7dQknLy9sddKlyob+HnmtOAV
	 nmlNFmoUw4I7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7740F3808209;
	Fri, 20 Nov 2026 03:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM)
 networking support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514481102.4002121.1730967450456354647.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 03:20:11 +0000
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: netdev@vger.kernel.org, s32@nxp.com, robh@kernel.org,
 saravanak@kernel.org, devicetree@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 17:02:31 +0200 you wrote:
> This series adds networking support for the ENETCv4.4 pseudo-MAC (PPM)
> ports found on the NXP S32N79 SoC. On S32N79, the ENETCv4 ports are
> not wired to any external PHY/MII; instead they are internal "pseudo-MAC"
> links into the on-chip NETC switch. These links are proprietary, expose
> no standard IEEE interface, and run at a speed fixed at boot time by the
> Port PCR[PSPEED] register.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/6] net: enetc: Add pseudo-MAC support for ENETCv4 Ports via a fixed-link node
    https://git.kernel.org/netdev/net-next/c/683068cdb9cf
  - [net-next,v4,2/6] net: enetc: Allocate int_vector array dynamically
    https://git.kernel.org/netdev/net-next/c/3e68d8cee653
  - [net-next,v4,3/6] net: enetc: Enable probing of version 4.4 devices
    https://git.kernel.org/netdev/net-next/c/24579bb24660
  - [net-next,v4,4/6] arm64: dts: s32n79: add NETC IEP18 ECAM node for ENETC PPM ports
    https://git.kernel.org/netdev/net-next/c/821b90b0e9cb
  - [net-next,v4,5/6] arm64: dts: s32n79-rdb: enable NETC IEP18
    https://git.kernel.org/netdev/net-next/c/8fa58d0f821f
  - [net-next,v4,6/6] PCI: Create OF node for NXP ENETC pseudo-MAC functions
    https://git.kernel.org/netdev/net-next/c/d2f68f74723d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


