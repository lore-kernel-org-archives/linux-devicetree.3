Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535676;
	b=C/2jC9ZTD8ylGlg6az8HwnGmPjbeVe8Db44xfw1lQyIGezCvnKqgDnYoe+oCm38R//LQ
	 eGxSCvaqfpP/U0cH2r2JUuUFW1/My+ZwpORNsx4iUhCq+EF4zkknuMV8PBWiddbyd3r3e
	 /Dfz+7zJunAicxxRN9CzzM+beBOvm6hNWt+Fhf6G0BgIwl8nMFXBtL/IXcLhBDHR+sBY2
	 RvAcxkiwP2o0s59ohUQGH4En2wCUEAflm+9KDYMjcC2IKPDyKpgpHFcUYy8FlN5iC6pOv
	 ctnIXMXXsfUNtVmDHkPmrOdGah9YkN5KPcUlIT7mcpvwuJGTwkMlQ+WSDc5FR5ZUwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535676;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=7xtsv23Ga+zcUfg8vWF3g3+bBKm2zjQEvmmIB2ef8jg=;
	b=RGSRpiynOUnjsy8k/12aFnKaVU3DPcdIkkaJjo6aTUcd88BTZV6gSXYzzowsmNN/CwpM
	 h27kbxMlhRzt2KWj0aWmA/8cEtH5Y4nMi5+b/sZbwx+cCcKZRUToXeY6ne59oIZsTLpL+
	 cliJDfLtIrvw67dVXHrQFjNWALIwJaT2am9E9Kvv6F0jMToMTfJSvd8SRVT0lAd89K/Ex
	 C3cBi3zmmGjVUGf2zB65RF7ntnY1Bo0S9wTnBwLZ9ynKG48f2Hlr9Q6Y2b/hOLN4dY6qH
	 lMnHv6QZXsgYDkmtGdUBdcUx6raZUfUkx36pTF/Irgo87P1csGlkMn4CHxj/VNEd5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=I9tkzDqx;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32830606A688;
	Tue, 24 Nov 2026 15:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32830606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=I9tkzDqx
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155433euoutp02a308d9f7f41cf4101bfb3d98aa62f9e9~rBi6j5raV0555905559euoutp02K;
	Tue, 24 Nov 2026 15:54:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155433euoutp02a308d9f7f41cf4101bfb3d98aa62f9e9~rBi6j5raV0555905559euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535673;
	bh=7xtsv23Ga+zcUfg8vWF3g3+bBKm2zjQEvmmIB2ef8jg=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=I9tkzDqxtQh18dCYgr4gQBVOW80ONTfCP6zn82PK+IvQmuqmVS0+glhYt8sWiIF81
	 jMfHMl3ltL4nAGFTxi9whqLhT5vxO/TyxLwV6kzHjpf0qiO76BzdmWeYlhARMGNaBR
	 DxHgM5VSDnhBONVY5hBLuWzkofkNA3Lq3bgWDjOs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124155433eucas1p29be901baa6a465bd2c8472160abd86f1~rBi58WqCi0334103341eucas1p2O;
	Tue, 24 Nov 2026 15:54:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155431eusmtip175b122343e41bc7dd9974d8bc8424946~rBi4SIi5K2656326563eusmtip1T;
	Tue, 24 Nov 2026 15:54:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:54 +0100
Subject: [PATCH v8 18/18] MAINTAINERS: Add StarFive JH7110 display subsystem
 entry
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
Message-Id: <20261124-jh7110-clean-send-v8-18-de92635dd857@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=R23U0BdtWZJARORVv+P6PTo+NNi5W1W0a0Fd097pnQY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbha9dnbCrqmVor+WSCxbHyI6c+sVx44NnV/n3Z+09
	MRiGZXjMR2lLAxiHAyyYoosZzdGG0n+Y3hafvzxL5g5rEwgQxi4OAVgInqTGP67XwyrC9oSvmjz
	epFje38u40pwsbp/Q7JyU6iO+oFK1m2vGf57HFy/5s/yy1Oe217mvtw7O4Tlh8VKI75fx7P1Go5
	knp3NAAA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155433eucas1p29be901baa6a465bd2c8472160abd86f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155433eucas1p29be901baa6a465bd2c8472160abd86f1
X-EPHeader: CA
X-CMS-RootMailID: 20261124155433eucas1p29be901baa6a465bd2c8472160abd86f1
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155433eucas1p29be901baa6a465bd2c8472160abd86f1@eucas1p2.samsung.com>

The JH7110 display subsystem spans a PHY driver, a DRM bridge driver,
a parent device and their bindings, and has no existing maintainer entry.

Add an entry covering them so patches reach someone who can review them.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcade5bfbafe9fcb81f9b83ff9ff5fdfba04dd67..5f5da9faa806416f963394dda786994ace49b6b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26806,6 +26806,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DISPLAY SUBSYSTEM
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+R:	Icenowy Zheng <zhengxingda@iscas.ac.cn>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
+F:	Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
+F:	Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
+F:	drivers/soc/starfive/jh7110-hdmi-subsystem.c
+F:	drivers/soc/starfive/jh7110-vout-subsystem.c
+
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>

-- 
2.34.1

