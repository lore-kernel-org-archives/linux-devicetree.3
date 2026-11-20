Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182199;
	b=qxNB0Hbh4ensh+wj4OlIT94I+qkcHaD4JLOsS87l+Qmqet4Bext23pBaCqPAEb0eMVQm
	 Jp+NFaYZEE1dgvCMARpHw1xSYDWE5PcdssSGoef7doCQ0sOfGoSMfBtsc1ZLuwohjYeKF
	 s9qftjlSMmuShv9c/1/ricPZFviHWA9r67wHaoCfatrJRGRnWjEhtcfMcrXCv0AlYAp9D
	 rVnjwJJYtMgQhFXnfWtrPyE94p75ik3vjg9+XBZpHH5Yf1wI9Ie/jfwt9mbvsp7wqRDc/
	 Bfa+iH5g7KarJdoKCItYeeBpDMvVf91F5slymoHPoqxt+Tm8IuxIOsEQF+Js9mXsS3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182199;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=9237+tKAR89WsuPxFlAqDCDty0GUNRZKGXXasLOl2ng=;
	b=kAtXboKMKRPte02qgxwuSQDPNFn7dFaB7nsaAAaCg7QrGfpus1pQu6lmxkIBdPq+FQKj
	 ATXOYnNG0qCcaaYTBcOVBF2UqkVS4YOK6J+kf7Qp+NQQI+abcHrcZlBsEn2eFqi8yh7fQ
	 PzX6VqXzA3Y5LXgJfk//WRH1xECgma5DID896XRM6DeRjEbcVhKs1MLrt4U3BdtoaGqVc
	 YY6kVO2nlHdXWbZ1Npwp5RHTitzOk9wmmmaX+DybUosfqHAxlXXxAoIgPRdMmxR2aFsze
	 fY86HxvYxp3MZ2KmqHGPr91dNWQTHhgOCqcaVGv+dJ9yXPWhmLgBR7ptvlveWnZsCQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AVDT2NBg;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4993160A263A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4993160A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AVDT2NBg
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261120134316euoutp0295563d425512343ddeb5ae0df332f0b4~pxLJCKw_62620726207euoutp02T
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261120134316euoutp0295563d425512343ddeb5ae0df332f0b4~pxLJCKw_62620726207euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795182196;
	bh=9237+tKAR89WsuPxFlAqDCDty0GUNRZKGXXasLOl2ng=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AVDT2NBgHGsRO0KO7DoI41IixNDJ18plqCeYQue7B59xesvIJz3QQok0fPUO6n1Sw
	 vj0Cs19HyEGr45mj1VWnfM6roS9dZozGmwEh6szwoBmt+ZjP9kUdvLbUbcuSP5re48
	 JbPpsDgKcmjI3Lnj0FsAOoSy94VFvUNpn/T9zPRM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134315eucas1p14bd143778442db5f514865fe00a49c63~pxLInXiM60242902429eucas1p1r;
	Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134314eusmtip1e5f11fdfc1d113cba0eecae5a72f9eb8~pxLHtfY1G0050900509eusmtip1w;
	Fri, 20 Nov 2026 13:43:14 +0000 (GMT)
Message-ID: <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>
Date: Fri, 20 Nov 2026 14:43:14 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI
 PHY
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Emil Renner
	Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Icenowy Zheng
	<zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Joshua
	Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, OOHehir
	<oo.hehir@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120134315eucas1p14bd143778442db5f514865fe00a49c63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-EPHeader: CA
X-CMS-RootMailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>
	<20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>



On 11/6/26 14:52, Michal Wilczynski wrote:
> This series adds the HDMI PHY driver for the StarFive JH7110 and shares
> the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
> HDMI PHY.
> 
> Up to v5 it was part of the JH7110 display series [1]. It is split out
> as Vinod suggested, so it can go through linux-phy on its own; the rest
> continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
> Nothing here depends on the display series. The display series depends
> on this one: its HDMI subsystem binding references the PHY binding from
> patch 1, and it needs the PHY driver at runtime.
> 
> [1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/
> 
> The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
> because it sits behind the HDMI controller in a shared register block.
> Patch 2 factors out the pre-PLL config format, table lookup,
> determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
> Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
> post-PLL and analog config stay SoC specific.
> 
> Patch 3 should be a no-op for Rockchip - same writes, same order, same
> values - and RK3228, whose pre-PLL is at different addresses, keeps its
> own register code and shares only the lookup. I have no Rockchip
> hardware, so it is build tested only (arm and riscv). A Tested-by would
> help.
> 
> Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
> other JH7110 PHY drivers have.
> 
> Testing
> =======
> 
> Tested on a VisionFive 2 v1.3B together with the display series, using
> modetest: all 42 modes the sink advertises work, with pixel clocks from
> 25.175 MHz up to 297 MHz.
> 
> Every commit builds for riscv and arm.
> 
> Changes in v7:
> - Point the binding example comment at the hdmi-subsystem binding's new
>   location in bindings/display/starfive/, where the display series moved
>   it
> - Rebased onto v7.4-rc1
> - Link to v6: https://lore.kernel.org/r/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com
> 
> Changes in v6:
> - Split out of the JH7110 display series (Vinod)
> - inno_read() returns the regmap_read() error and recalc_rate checks it,
>   instead of a failed read turning into a zero divisor (Vinod)
> - Bound the pre-PLL and post-PLL table walks with the table size instead
>   of relying on a sentinel (Vinod)
> - Lowercase hex in the JH7110 pixel clock table (Vinod)
> - New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
>   the display series' entry
> - Rebased onto v7.3, collected tags
> - Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/
> 
> ---
> Michal Wilczynski (5):
>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>       phy: Add common Innosilicon HDMI PHY helpers
>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>       MAINTAINERS: Add StarFive JH7110 HDMI PHY entry
> 
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>  MAINTAINERS                                        |   6 +
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
>  drivers/phy/rockchip/Kconfig                       |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
>  drivers/phy/starfive/Kconfig                       |  20 +
>  drivers/phy/starfive/Makefile                      |   1 +
>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
>  include/linux/phy/inno-hdmi-phy.h                  |  88 +++
>  11 files changed, 1144 insertions(+), 144 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
> 
> Best regards,

Gentle ping on this series.

Is there anything else needed from my side ?

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
