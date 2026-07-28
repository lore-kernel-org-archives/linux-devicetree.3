Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF147276C;
	Tue, 28 Jul 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266221; cv=none; b=KQiJDYnHWWYjpXiHqBdmbxFO7GFu6fuAiHwHomP1EY9+or+42XGSjJH5BNfeLB/+qMSo1wDCPIBxjBcOwnvfRbvl3HSaZkDL69s3x0S/AOW1cN2wFCG3mTlmeplYB1PjxOecHUbOS0lXT7ODV7PhoiXcLvSFcEMROQitJafkhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266221; c=relaxed/simple;
	bh=lvg7corChiQuolN8dxuY6UJx3OQQy2XZJyVY6xudRSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4UtliVIHf8dYYnMjU4Ry3QFEEojOJkxqwTbkM+OI3JVFzCw3kJZPzA7hqFjNF+u8h6qDAZUxj1lGVy2xovK0R+5ciFuIsnt8sHBcho4QEzAaqj4YLKkSihmOW51HOlTWRAkfGfUhA3EYN5BVrweiyOUnn98koVrLT8rHlbrT/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1CVnMMTx; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1CVnMMTx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=k/OibEZQ9hPIHLYPL4MyyZBX8Z5atnq/wmS2oE46q4w=; b=1CVnMMTxlNzj0OJXouLgQ++8ay
	7OzH4qCIG0KVj06YxY4gggMgajfEIFa/sS9Fj32V9VDpjDGZWf2Ql2M7JlIuIO3t7XJgL57PEs/GU
	hWxMx7cz0jC8a7x/b2ZanC4pb3OH9pWSK/MLgopiZ8Omqhj+lcNNE2QWfDUnNOJ7L22jF3fHR8s+t
	ksGX602+hSj2eIC0fXZ8Sj2Dyafo1biBx2iMFauSWdyWWWsVicn73s4dABK9bTerL1ZJmGAWmg6KV
	244KBJL8y2q7oce8kx+5u/IPjrskaKyHZL2rcJvIXQYPTfSmhe7+R9itUAgVbVgpNHCCJY37o1Kwl
	buU4ZbRQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Tue, 28 Jul 2026 21:16:31 +0200
Message-ID: <178526609483.300371.1972096741019410847.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719034611.3623066-1-gahing@gahingwoo.com>
References: <20260719034611.3623066-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Jul 2026 15:46:09 +1200, Jiaxing Hu wrote:
> Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
> its CM5-IO carrier board.
> 
> Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.
> 
> The on-module YT8531 PHY has no crystal and takes its 25 MHz reference
> from the SoC. Following review of v4, the reference is now handled the
> way Andrew Lunn and Maxime Chevallier asked for: the PHY is the consumer
> and enables the clock itself. That needs a small motorcomm change sent
> to netdev [1]; the clock is optional so this DTS still applies without
> it. The earlier dwmac-rk MAC-side patch is dropped.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
      commit: f60f44c24b10fe7fd1fa76b360646def1bea193a
[2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
      commit: 44a48a23974b86d2c551afbabee15ad70b249df5

Adapted the styling a bit, fixed some dt-checker warnings including the
2nd ethernet-phy compatible - I left the most specific one.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
