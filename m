Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535645;
	b=oWEi7/MO0zlShdWZleVMtrh2r3i1CG/ldf9iHjeo9pvQJUM93SkpYOaxSb1X5TVuOm6D
	 d5ctwCzxDtyw/0iGFG7Xhr9ca6waTkqCkhAdl8YjANWt0qDN/YD2GOyW4cgsnYu0VU/Cp
	 yzda9BVnQd020On0DGEU/hilMkUC1sj3bAg3AC3OnUswcrhIAkBpyHJ0sBebAw6j9KkUb
	 dP/c3yx2+O4NnpbO/Wc9VbMwtDZsHVC1JobajMliN0Jw/ntRH8v7mcfbUhpb/nIynnV7W
	 iCESQDiXavhwcq7ZHwR3TMiXnqyiitLNJxibX2mDXNDvpqYucxcZIeJS0WIvJ/NUzhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535645;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=fj4DZBX3qmtZVdvzC6wAJ8aGEx0aictuhq2eiRmzYrU=;
	b=gXCR9lqWBKc3vNkQyNbqiRCpVu4jAXDpK1GiO5DgAsE2YLUJO9NUAGrQx8M9JKXxl0C2
	 SUNIGAUnMtaPCk9SJdplOrJSLlnBp8UecTiudWIv5EHPq2Pot+HL9jjf2zJnPqGcy8ldX
	 O4qEtqujxirCC4I0E0PxybfeEkTDZSL9AsLPxl2pjusmPcKa04zaWcSyjXEwmpZNkoBGL
	 GqectqBAm+Q7SO5TkfjFaSp/WMVprM73qpxxco8WNFE4ZHib9VDsJ/RSslbLHjS3t3Zu2
	 zCuDybuXKhiK69Ml9fXRFq03dnJ4Nr4aOddTFFCRf7NkvA5zyMcd3tufwYfOk3au7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="k2uTMl/s";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55152606A32D;
	Tue, 24 Nov 2026 15:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55152606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k2uTMl/s
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155402euoutp021a3e87088df3aff17d35d406e0b62b19~rBic7cgFI0605606056euoutp02t;
	Tue, 24 Nov 2026 15:54:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155402euoutp021a3e87088df3aff17d35d406e0b62b19~rBic7cgFI0605606056euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535642;
	bh=fj4DZBX3qmtZVdvzC6wAJ8aGEx0aictuhq2eiRmzYrU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=k2uTMl/srTJvy0oLxuUwRseoMudxSkjR4wiBV9bXCnAIobwYBuohqVZ67joUUlFg+
	 hiKO8hrCLRk+2Lee5bKXvc6yPkRjktOVGNleqAl8KCCS9QJkHdxVFTWf/BRFEfASeT
	 ItYYSYeQOBwh6AU9NveG2o0vSvzwnqdkNaQ53ZDs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124155401eucas1p23c6e29781ee1e0d34bb8539a0a848625~rBiclcYEC0334503345eucas1p2B;
	Tue, 24 Nov 2026 15:54:01 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155359eusmtip1148f1c610c97b3b5472618c9ae0b2327~rBia6sMyS2805328053eusmtip1O;
	Tue, 24 Nov 2026 15:53:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:37 +0100
Subject: [PATCH v8 01/18] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
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
Message-Id: <20261124-jh7110-clean-send-v8-1-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	Owen O'Hehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=a34UPcRaoorrU8zNQf6sLKRiHA2MSAWHEgRGfiP6xI8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhYNetHedNTPN4j7u/vzI+rKRSefXuk/qDrxdfIbX
	oE7z00SO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEtl9hZFhax9/f+Jlhu/OW
	JzbNF9LeKOq6KXiFGhv2fKyaxbuV9QvD//hbTEcVnk5yivB6z2sStmqXVr3Y6xSlcL+E5fPEnxq
	KcQMA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155401eucas1p23c6e29781ee1e0d34bb8539a0a848625
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155401eucas1p23c6e29781ee1e0d34bb8539a0a848625
X-EPHeader: CA
X-CMS-RootMailID: 20261124155401eucas1p23c6e29781ee1e0d34bb8539a0a848625
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155401eucas1p23c6e29781ee1e0d34bb8539a0a848625@eucas1p2.samsung.com>

v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
opposite. Most CEA modes drive both syncs with the same polarity so it
goes unnoticed; it only shows up on modes where the two differ.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Reported-by: Byron Stanoszek <gandalf@winds.org>
Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
Suggested-by: Dominique Belhachemi <db@domibel.de>
Tested-by: Maud Spierings <maud_spierings@murena.io>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 9470d51418aa79275196ca9604cc1c3b5fbbc531..6534ad7b16a7c6dfb9718269821b4dd1cd7c5d54 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -121,8 +121,8 @@ enum {
 #define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		((n) << 3)
-#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
 #define v_INETLACE(n)			((n) << 1)
 #define v_EXTERANL_VIDEO(n)		((n) << 0)
 

-- 
2.34.1

