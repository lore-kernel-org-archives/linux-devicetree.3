Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F547255B;
	Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266210; cv=none; b=DE7K88XKL9ah9oWox++zFrmvSix9GI06gpmZ0EmaIaUEelvFPmb2Op+frhX02o06AKBQLLLfJOOpPnFtnnwu36m0JL9ybGsc11TcXDsBO7p/zkACDhsdc7IsaGu75jw6Vsg6HAMXMt32paQYQepSNQ2KLTvXvoY96ZdyH752mbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266210; c=relaxed/simple;
	bh=2tgQ+xJatQpb69KoilSsd7iz+TLnuC/fIYZxigl7/Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIck/tMYpbjhUVHdlhd5U1Ht+i3aIO4DAnWqXA7lxs1gAv31l0CODbZkjBzKpbqIcDBvslw00lXYQPTFk+jN8mfggI1p9fZTMa8mPIo84Gg0wdKOyt59OO4ZK6asSvWz7iMW88ad1QHH2qg22opqzjQRvJeOevsh929qI9GAY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yvf0oo6J; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yvf0oo6J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ktVslNyishmwLJIWQZVyJyZGaF8VrnNN5PLCkW5qv1c=; b=yvf0oo6JI9hw6HVT8BbmF4Bx2Q
	XB5AplJBXaXF8KQpdH0HOyXSi89oHtRraPaGkI+oGxC9JCqPPXKpi8aPLAQZDjmgjXVm3qgUttCTP
	2YWyBf5fgmASVSXe1pq40vY5gDe7AtnCF2TyCXjvxJFizhgvwOPHB7BaZKLAtNtQ9fJVVZjZVFpCj
	d6xqqdqG+eLT8WT49qGVVdVPv+oQ/WgoIC9oi/Bq8J/x4QzjLkH/3CxYvJTgG2dsdASs5ruOxLTBd
	oLCefYR3Ou8tlCRmvygo2PXPbBWmpJxTQOG6Aw0zf6P5VIJ/ZUn9sz2yTn8bZ3YbXyPQFVgezc6Sa
	fzZ0s2LQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Tue, 28 Jul 2026 21:16:33 +0200
Message-ID: <178526609457.300371.12562771898279698820.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053419.265523-1-hrushirajg23@gmail.com>
References: <20260714053419.265523-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 11:04:17 +0530, Hrushiraj Gandhi wrote:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
> 
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:
> 
>   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
>   - RK806 PMIC providing all SoC power domains
>   - eMMC 5.1 (on-board) and microSD slot
>   - Gigabit Ethernet via RGMII (RTL8211F)
>   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
>   - PCIe 3.0 x4 and two PCIe 2.0 slots
>   - SATA 3.0
>   - USB 2.0 host ports (EHCI/OHCI)
>   - NXP PCA9554 I/O expander for status LEDs
>   - Haoyu HYM8563 RTC
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
      commit: 58db5a28c85150411f3b6035b9a7eb3b23ca7789
[2/2] arm64: dts: rockchip: add Vicharak Axon board
      commit: c42f01f053a7be77f534c850911cd8d54777af19

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
