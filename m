Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084207;
	b=uPsnwtdsv3HsjhQTorZ6vnuewbSHw64z+sHWx7Mk2YtRuUAiydZjRKi1QXA2kupyfh6F
	 Qn34QBT10Cr2Rs+T6QVT2hdH62DMxSOIGXw4xNObZvjTEkaVjustn3ss6naUIgLkWy3Yn
	 oaaXi68uaWfwnclzZDgLv84GsR4M4L+u5n5glseSdWJheHgssfngOlq+n+QUDOSTeo2QV
	 qAry7bDVNxWxu2WJOFrG6PZrXrQTx3i29dyua2Oi+ZoDAyILBnGphP/oRAqEBpsUNd3TE
	 pm7X1guIYEQ/SyedKODD3CJQPI/kFmdPm/uiqUI9bd4woMo60urc90AUxNsk74HMsOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=m230NR/k695R3vvobrlBsJwyhkm9vXXtTsfKZe3AgLA=;
	b=rt5TTQcwkzJOl/bJpYthhS6CQhjJ2jqBHnU8byESXW47fXWQK0xlSdQa7niL2M6c2EL/
	 lUtHo61kYghS7uyG2g7Ouu5xKxHc83jWeQK6SKBRVmPw77Ic56S9RChtcrbTvRQncgiez
	 X9iPWFNY+OmgD6K1C4YLxd6lEk1zqsMERe4yX31biYr+Cm5q1GeYs6jZA3s44grwp7zCs
	 EVVia7nQ5nyaWN5+XGZJDEJsJ3GXA21MIsq2XGmJBpeNFhsRHVcS0ldKJYPZ2H5ceY85q
	 xIsVelhgIXgHyewYYIMVQdcf6gUJQB6AYl6E7x2zAg1lUJ3oBBqBhaRmeGIdm0xeoyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpSdEZ5W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF2606A332;
	Thu, 19 Nov 2026 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpSdEZ5W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4DD1F000C5;
	Thu, 19 Nov 2026 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084207;
	bh=m230NR/k695R3vvobrlBsJwyhkm9vXXtTsfKZe3AgLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mpSdEZ5WQxOAcdP46cRt3bYmHZX1LF2RPN4Rfa26d+2IHf2apKMtR3SxjWb/17kUL
	 GKbZbMPazOAQvym8eooggQKP0Jv5EF6LVN7tHcju8nQbIa9RWRhKMJj2xnz3yAzEO3
	 ADw6gtW1qhbAjMTGo7EBheiM11zBxygnsrPz3gshWXtRjmE6ipwD47l4tVRqvqPp+z
	 y+qP9M+t78ajeuMcvVRWVdnKLLOnMqTX9VjOtacIHlDujy/fN6VcdeLvfExJHeRdMI
	 Lt4U2jKWW8NbuenRj0jSK7RiYcBuOlDGHIKIlyv1uLIKxJ4KqMILXOLQgBis8k2OwL
	 0YUyoPL4YDBDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16843808210;
	Thu, 19 Nov 2026 10:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508420578.3002552.9484670027487082797.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:30:05 +0000
References: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
To: Joseph Telaak <joseph@telaak.dev>
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org,
 p.zabel@pengutronix.de, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 15 Nov 2026 17:33:44 -0500 you wrote:
> The GSW1xx driver never resets the switch, and the MDIO core does not
> handle reset-gpios for non-PHY devices, so the driver works with whatever
> the bootloader configured. On the GL.iNet GL-SFT1200 (Siflower SF19A2890 +
> GSW150), nothing answers at internal MDIO address 0 after the bootloader,
> and each port's address answers with the neighboring port's PHY, so the
> WAN port has no PHY. Describing the PHYs at the addresses they answer at
> is not enough: with them at 1 to 3 and no reset, neither LAN port passes
> traffic. A hardware reset puts the switch back in its power-on state, as
> GL.iNet's own firmware does from Linux.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] dt-bindings: net: dsa: lantiq,gswip: add reset-gpios
    https://git.kernel.org/netdev/net-next/c/98b599217570
  - [net-next,v4,2/2] net: dsa: mxl-gsw1xx: reset the switch through reset-gpios
    https://git.kernel.org/netdev/net-next/c/839a787e9ba9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


