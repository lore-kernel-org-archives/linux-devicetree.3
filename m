Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144208;
	b=QbzvrMoaOpH8HAxdmJSS+u5PdS4Zx0sbr58YXcGCAW6wnSmfWX/KP0qbuWA/cNmOuWyR
	 D7Itnddcxh96/1NQeYbC/eAFEV3SER/807qpw2hnpiFD2e5Um67VO1JnyvQDRFc9ASTCK
	 KHn8KEde2tfDyRpatGr0E0P9kBfQQTv3hDLe8dvAAp+Y83szRNHJNHcH7htq+4dXdk07R
	 e+nGmFovIBnODJlpt93cKId8Q8/GDU3EwMJLoVtxV3lBwunaj2pTKL3/XBp4BkW0Hd3pv
	 SvO3Y8RW7omZiNrXoSpOAXiWdbMKT3fFIMhidTPMm+wjCymo9mBje2fkjRGU/QiwUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ukKJgUBAL20jCzTZgargorWA+q45FyRreSUu86drbqA=;
	b=pJsRA71L6ZBcJWA0d5oypK1ylyVP2tBM6CTrqvNyHy8QGy5witJ+rHUzdA2FicOZrfAl
	 stvq5RfNNJpPBPC7haEooW1S3tPSvRMbY1u+DVKY2IqHovgroj5aOKF687H7Js/Zpfxmp
	 Gx4wIqIi4/1WZgdpZJgdxpNGjEEYDvkpclndFeD63JaYHRHbR8RaDkFVPJC037KVLcEdv
	 xL7JYk2LFc4EwEePOzj0kwJEV13Zbh8WFEDj8LGjbuyKQuqlfRYrIAEx3hFz8EvUy8TRW
	 iEQ6icJ3M3EDLsxWWPHAFWnWDNtl9uoleGGqzKq9UpAIyclmX6CIEWXBcs/Lnim1w5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+NYSCYz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC60606A320;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+NYSCYz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED4A1F000C6;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795144207;
	bh=ukKJgUBAL20jCzTZgargorWA+q45FyRreSUu86drbqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A+NYSCYzxpFujYYuRndjloCnPVEaFUrzzOY+sPGtiCaNkfQMZL4RW5J7zlE8h/8Wo
	 YY2xfK2Nb8RE03jG/M5FkNbQJvhGsim0HM9jwxdEBopzfjMVPVwXpN0HsNkY45YHQV
	 2Wx7Jk9oJCdPhX9itaSw308WYP2UNknHUdN6B1SWOfuEd/mJZRitPCNPCFJGKRhQdX
	 KNW7JzubPKk7mchgpWFRM39CBp/YbZbhUts7n4OFI84ZZB0JDiJCVwh0U5s4H0eDPd
	 1qrYVdUZipHul8Q9zaGp331aIvvPOaULtLIa1hKKyaNtl4zbQBL8+d5ebVDrJRCw0l
	 8QrB0Oa3WimGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44333808209;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
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
Subject: Re: [PATCH v7 0/7] Add ethernet support for the Amlogic T7
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514420653.3998775.15150461070796128263.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 03:10:06 +0000
References: <20261113121852.334604-1-tanure@linux.com>
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 12:18:45 +0000 you wrote:
> The T7 has the same ethernet glue as the G12A. This adds the binding,
> the driver support and the device tree nodes, and enables the port on
> the Khadas VIM4.
> 
> Two clocks are new. The pipeline stage between the controller and the
> DRAM has its own gate, which nothing else claims. The glue registers
> sit in a block gated by sys_ethphy, so far claimed only by the MDIO
> mux, which probes after the glue is programmed: every write to
> PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".
> 
> [...]

Here is the summary with links:
  - [v7,1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
    https://git.kernel.org/netdev/net-next/c/2297f88ce0b8
  - [v7,2/7] dt-bindings: net: add amlogic,t7-dwmac
    https://git.kernel.org/netdev/net-next/c/18029931478b
  - [v7,3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
    https://git.kernel.org/netdev/net-next/c/c4c851a3325e
  - [v7,4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
    https://git.kernel.org/netdev/net-next/c/4fdc7da7e13d
  - [v7,5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
    (no matching commit)
  - [v7,6/7] arm64: dts: amlogic: t7: add the ethernet controller
    (no matching commit)
  - [v7,7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


