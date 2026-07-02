Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05F384CDA;
	Thu,  2 Jul 2026 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019112; cv=none; b=FSNlF0oT7GnWxlE23d0AhcfCHthmGax57Axs2ewXLjgkvU/mPj6QmdyOwuLPMd5dwNqXTB1FOQ1tMT2TwuAp4keVvNfMdrMBJ9iZgraWsLpSCU65IgCmGB2bDtDqRYThzJfc9VC7vQxbwOpF/tShsMta91I8TEuJHLvPjMAal1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019112; c=relaxed/simple;
	bh=h2fX8z1BnmmnU1na9hryUTqTDEa1BzR7e8dEdv2Rzro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPLOq7MVYkfVqzHd/m/tJJC0bSXIqxy2iKn55Q/ksoqCORKOKFRU4v3B9GAa41TtxXm9YDBtUEGZ/v6zwlPsbJvCqDlWGzRq7i12dig5JElftYnUc9oStj7H2XYcV6mTpm69ZustDsnAMsTmpYYYJc9x3wuuqZY6HqS+URiIbek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YEKfePcZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YEKfePcZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ILx4u100roKSNdt62g0vCVIzu5pk0TzDJDZVD8Hhcks=; b=YEKfePcZJ66Vv0BDxc4KeXTSIv
	FDr1kCdSRTOHlgrLRJ+5jvXRu88+gx6MENusUTuCv/fT84nk/0UC3CEYLbMq/Y2/N3pWKhzVvsDLB
	Id+5l7pyRIFfMVVIqdXv5oqgYHpxgHTGpJTqEOjRG8Tm6E4FXkAl37yHurwlJL0ZCpdl+eOtyZyVP
	DEWFrX4j4Pk+PBTWb1fg12ub3y3dgMfPTdKDGLCpg9GRgn2di3FsSN9fA3rogzpvS1GO1QbMt6Cyj
	V6+/I9UNIBK01n/VJiEhyqr6J/APWIX76ecrTQehy1YRhlbVyr5iPDR9/y3XZRi+qDK4BM78HuGyW
	zjt5hZ/g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix regulator names on NanoPC-T6
Date: Thu,  2 Jul 2026 21:04:56 +0200
Message-ID: <178301901912.3838694.17963295262868921590.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605-rk3588-dts-rockchip-nanopct6-fix-schematic-names-v1-1-15dd3b23ab1a@pardini.net>
References: <20260605-rk3588-dts-rockchip-nanopct6-fix-schematic-names-v1-1-15dd3b23ab1a@pardini.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jun 2026 13:54:35 +0200, Ricardo Pardini wrote:
> Three fixed-regulator names on the NanoPC-T6 don't match the board
> schematic [1].
> 
> - vcc3v3_pcie2x1l0 -> vdd_mpcie_3v3
>   This GPIO-switched 3v3 regulator is labeled vcc3v3_pcie2x1l0, but
>   it is wired to and consumed by &pcie2x1l1. Per the schematic,
>   the GPIO PCIE_M2_1_PWREN controls the power net VDD_MPCIE_3.3V;
>   rename to match.
> - vdd_2v0_pldo_s3 -> vcc_2v0_pldo_s3
>   Typo in the regulator-name property of RK806-1 DCDC reg7. The node
>   label and the schematic power-net name both already use the vcc_
>   form; only the regulator-name string had vdd_.
> - vcc3v3_pcie30 -> vcc3v3_pcie_m2_0
>   The GPIO-switched 3v3 feeding the M.2 M-Key (NVMe) slot is named
>   after the PCIe controller it sits behind rather than the schematic
>   power net. The schematic names it VCC3V3_PCIE_M2_0 (produced by an
>   MP2143-based buck off VCC_5V0, enabled by PCIE_M2_0_PWREN); rename
>   to match.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix regulator names on NanoPC-T6
      commit: e53bb7bffd4d359b68e8256bc0ebf5a119ba3c71

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
