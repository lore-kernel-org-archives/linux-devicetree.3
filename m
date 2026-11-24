Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514164;
	b=yKWgSN7FyBjsZlxo6LWUvokifGkiOZ7PMyrawWCoVOaKmypaDktaEvUEvymhv13Lc9qj
	 /WpteKIWBSYcoEv8kD/sc0ju6f6Xy6JfsFDcaHEvx0nNJaJTb3EMKnpXNJbswRLzxlevU
	 mKxa9nmhUW3A1juJn1SNe1Rs3WbHjdShYYYoolPyCNfRcHHMwiGBsHEsLgqb1NGnTZosa
	 b5F/GV5ZvPw7kD75DCAN5/aSEEab3c1KhOZyCW/PNEUYPb86cr509RDfxvfvYZvRWOeAm
	 8l5EDc8M5ww6Oscfklkcm6pElWsLjvDPgVW5a1brvASdGqXausH8IjxFciyyKXUh55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514164;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:
	 X-EPHeader:X-CMS-RootMailID:References;
	bh=CYvIYIwuDiGcctglkMMhgqQL8VutkqVe7MrezV6RgL0=;
	b=b5lkcXGJFfAdwaEw8BopNdp7/yt3sHA7+hDILMa0KVPPnjw3xhFgSO/0crRG3xjez2sz
	 pQodgjUM86VFY8+y3HVrfe7Fz+wb7KziqBiAsUN4a4k2s8/Uh55OigqUOBvByzaEjsWdZ
	 2eWq/8yXRzmCy44qXRoJRFkd0b5jMgpk7A41m1XJbjb52JrFysM++mQn0t+b01BNcaM5m
	 iF9pHoZ85ceCFlkmKcqa9lJ+PrUAq9+NuH+minlUuE1qmplp0lWQfb0lFXtcpIpw0gYV5
	 /xWkhx/YGQOGyySFyfhZnrgnS3UrX1aNVy4Uo4htQbvpYT5vLwlWEl2aQtZkWS3WR6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WwfClyRH;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399B606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1399B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WwfClyRH
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124095555euoutp02825fc7c36907bc05a955374221bed785~q8pxxPzwm2767027670euoutp02f
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:55:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124095555euoutp02825fc7c36907bc05a955374221bed785~q8pxxPzwm2767027670euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795514155;
	bh=CYvIYIwuDiGcctglkMMhgqQL8VutkqVe7MrezV6RgL0=;
	h=From:Subject:Date:To:Cc:References:From;
	b=WwfClyRHLPK544Ef2cxjG7Ov23Q8bJc1uyBIoXqQ/zTWRtAjjMgQrdP+ewgEnvRzA
	 nbmf076xGVJY+37fSdQEpHRWAKENsIorrWAqmf0R28U2wPG/fKtbw5O54fs54qlkTe
	 XVw46ZZgbEtyv3nUj5/0DQ1BUsDQG0JnvxNasCqA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71~q8pxVQtHa2052320523eucas1p1e;
	Tue, 24 Nov 2026 09:55:54 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261124095553eusmtip2be9028c7f2a29e7979dde987e18f7400~q8pwcQXO_0411504115eusmtip2B;
	Tue, 24 Nov 2026 09:55:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v8 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Tue, 24 Nov 2026 10:53:57 +0100
Message-Id: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVeBWsC/3XOzWrDMAzA8VcpPk9DsRJ/9NT3KD1ktlJ7LE6IW
	7NS8u5zA9sYo8e/QD/pLjIvkbPY7+5i4RJznFIN87ITLvTpzBB9bSFRqgalgfegmwYhpjRB8GO
	EOdzAEHdu6FVLTKKuzgsP8XNjj6faIebLtNy2K6V7TDcQrbTfoPvgPkHm5KF0gGDkW+sNk1NOH
	3I/5ms6v7ppFA+vqB/j+VNFVWYg0laZ1lvN/xn9yzSonjC6Mr61pAwhGcS/zLquX1tzKXVFAQA A
X-Change-ID: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=rm2cOug6bBmR4Ol7dMEohetL7wgq09jQCr4wqNGckLg=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzxmsGP9VyZOsv2Mr0rk4z3tZLmmFq66rXvq/ZuaJYZ
	03IXZPWUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACay4xrD/8warkWajP+2Npy/
	Wf69TG5pvscZ26B6w++BkqfqZDvVBRkZOvczn8+5J1uXslz/9jGm9DP/t6/JXbb/+of7fko3LKb
	OYwQA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
X-EPHeader: CA
X-CMS-RootMailID: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
References: <CGME20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71@eucas1p1.samsung.com>

This series adds the HDMI PHY driver for the StarFive JH7110 and shares
the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
HDMI PHY.

Up to v5 it was part of the JH7110 display series [1]. It is split out
as Vinod suggested, so it can go through linux-phy on its own; the rest
continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
Nothing here depends on the display series. The display series depends
on this one: its HDMI subsystem binding references the PHY binding from
patch 1, and it needs the PHY driver at runtime.

[1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
because it sits behind the HDMI controller in a shared register block.
Patch 2 factors out the pre-PLL config format, table lookup,
determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
post-PLL and analog config stay SoC specific.

Patch 3 should be a no-op for Rockchip - same writes, same order, same
values - and RK3228, whose pre-PLL is at different addresses, keeps its
own register code and shares only the lookup. I have no Rockchip
hardware, so it is build tested only (arm and riscv). A Tested-by would
help.

Patch 5 adds MAINTAINERS entries for the common Innosilicon HDMI PHY
library and for the JH7110 binding and driver.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz. Display off/on at an unchanged pixel clock
and unbinding/rebinding the PHY driver work too.

Every commit builds for riscv and arm.

Changes in v8:
- Address the Sashiko review findings (Vinod):
  - Fix the fractional dividers of eight JH7110 pre-PLL table entries
    (25.175 MHz, 25.2 MHz and the six *.75 MHz rates) so that each
    entry produces the rate it describes; the 25.2 MHz entry
    (640x480@60) came out at 25 MHz and the others did not read back
    as a table rate
  - Avoid 32-bit overflows in inno_hdmi_phy_pre_pll_recalc_rate() and
    log the actual VCO rate
  - Make the JH7110 bias and RX enables follow the pixel clock prepare
    state, keep the cached rate across disable, and wait for the pre-PLL
    to lock when .set_rate runs on a prepared clock, so re-enabling at
    an unchanged rate works
  - Power the post-PLL down while its dividers are written
  - Drop the unused inno_read() and register macros, and use the
    macros instead of raw values
  - Get the reference clock and register the clock provider through
    devres so teardown runs in reverse probe order; drop .remove
- Add a MAINTAINERS entry for the common Innosilicon HDMI PHY library
- Link to v7: https://lore.kernel.org/r/20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com

Changes in v7:
- Point the binding example comment at the hdmi-subsystem binding's new
  location in bindings/display/starfive/, where the display series moved
  it
- Rebased onto v7.4-rc1
- Link to v6: https://lore.kernel.org/r/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com

Changes in v6:
- Split out of the JH7110 display series (Vinod)
- inno_read() returns the regmap_read() error and recalc_rate checks it,
  instead of a failed read turning into a zero divisor (Vinod)
- Bound the pre-PLL and post-PLL table walks with the table size instead
  of relying on a sentinel (Vinod)
- Lowercase hex in the JH7110 pixel clock table (Vinod)
- New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
  the display series' entry
- Rebased onto v7.3, collected tags
- Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

---
Michal Wilczynski (5):
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      phy: Add common Innosilicon HDMI PHY helpers
      phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      MAINTAINERS: Add entries for the Innosilicon and JH7110 HDMI PHYs

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |  13 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 359 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +------
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 561 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 ++++
 11 files changed, 1126 insertions(+), 144 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

