Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F16472768;
	Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266209; cv=none; b=o5B6MJ0pQqxGe7VeYKs/buDydJ3SqJc5viYff+tFgT4VWHE4lLCUC/V6fL3ZnuCNW0ajZMR0hb8sDfz86JOka4lCZJonsOvVz6TN8sjNQCO+Hjn5bus5Dv67u0fhCU50Z/HCVIE+9Pn+xfRhOmBjEUiZymg+y5EKcUb8j5CqSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266209; c=relaxed/simple;
	bh=pY34KpAaCS5fudIyneKsha5efVcroUtwOJOrEX4ezhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QvYACKQdocRObUQMD9ic6Hw8CN0N/WQJjtw0vU1RMD/mO+6/2oWmgA0OcRMg7Nx7CZXdLBYOpMgdmV7Xcu72IeVZGLYOidyJgHJyigk3oB/crh0xD1x/nmRk/P5RhHr7AV/rSr3H/6OeObTB6kDWjN1rzASdKGeu3ECoyA1dClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YQudPMPe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YQudPMPe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YMdC5OLdtmiOOau9BgRbCPEDWqt/ahOGgghr1EDyiXY=; b=YQudPMPeq9W2ExjxJJkOP6tE2l
	H5WGZMKRcb5ynaCnDPK8xUYbwyYfdN7zYhLQ0KNQgTltCu8pCIh+Y58qhdv/0BecJQsthc1YO/y5N
	r33QEwXqlNdskiDD1/dLiW6flWSGPcZCptxKUxFwvlPsMQVVNdrqSlfI/G9bm/gsxuulzXmebXbaP
	8msP/wXjSLzVMEWWRFtXYkSBprBfIUJuFnDbwBx01qcKdwyXYI4KZU5nILm9h4Y6AOIjLP9hVFUNK
	KItBEyTEXunH/Jx60FkX6Cz6Sr+apyw0Ov8Ef5WzdH3zq2AT9Hs2BXCM2Ew90a2cDTqvzOTOVSDLG
	Fm3384oA==;
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
Subject: Re: [PATCH v4 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Tue, 28 Jul 2026 21:16:32 +0200
Message-ID: <178526609456.300371.2885999135285384351.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714054653.266842-1-hrushirajg23@gmail.com>
References: <20260714054653.266842-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 11:16:51 +0530, Hrushiraj Gandhi wrote:
> This patch series adds device tree support for the Vicharak Vaaman2,
> a single-board computer based on the Rockchip RK3588 SoC.
> 
> The Vaaman2 board features include:
>   - RK3588 SoC
>   - eMMC storage and microSD support
>   - RK806 PMIC and multiple RK8602/RK8603 regulators
>   - Real-time clock and status LED
>   - UART serial console and SARADC
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
      commit: 89be7a07156c0b4109d07644664474cb20782f43
[2/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board
      commit: 896e4c4508b66f9b4c9ff12b536bd1a031621aa5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
