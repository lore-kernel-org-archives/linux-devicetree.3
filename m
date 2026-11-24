Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535658;
	b=PWhZaBtMCgbwVNVwKnXp6u9z417UPPG4dUHyb1c3qMwX8LU3VtHgV4zmxZdv7pUTE8I0
	 hGvrDLkCvc+eqE2DZ4DXiYnq5ELvkzbBVsO1597jxGe4cpHRZzJV548sXusZwKxa9goK/
	 tL8Hy/pCc0jwQUR8p6c+EJPMlIHv+QzrFmpNayE4L4sOf2kn/M7Wh5rmSy7gtoH4KkcxQ
	 67MixX/UFjUqNLao6ZHbgBXwu4nwa+Qz8svfYCn+iJ8LNJqbruZ1loNhkmQQ40qDV9xUp
	 8AXoGsqzkPPCM5NmKxbgtHdEMArQFTH+7+Fc4Jypp6FmV/FxSRDm9k7MOp9VhkV/juQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535658;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=XV6NmS9EmrcHVtreIgJw5LSGDxATIuU+dhkRn9xbhqE=;
	b=Wt5423WsWeSq9DKa9HAnYngf8z0Su+KKUGrvKbIQs3U9KUPg29lwMI2PoMMnGb8erNCW
	 zptherJITs9PN3JX7IVh1GxUpvCPEsyIIzhPwwWqv9U4sVL91n5Y5Fd+krKvJC8Mm/8Jn
	 4+OWpYWHvMatKLQfVowTEho1dAfzfLV1C+2/mJoHlXqDmAvuzDSp5itvPQ7kUOgECFzj4
	 wgMLHYoGGTlTMcuEy7yJaCiyXYHOZZYu4HJsuscQwnj2+N1V1JioB4VB26UpoYugNV+uj
	 vBWNf9KoZDSArO0AZv4sMd7vighBx/gt+FQ89K2GQ9psRjzD+ylhbxOgFV63Lx0kj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aKIYgZpi;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DD606A6A8;
	Tue, 24 Nov 2026 15:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8DD606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aKIYgZpi
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155416euoutp013bb5dbc3d8c52bee54208221adf27297~rBiqaIdFI1661616616euoutp01l;
	Tue, 24 Nov 2026 15:54:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124155416euoutp013bb5dbc3d8c52bee54208221adf27297~rBiqaIdFI1661616616euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535656;
	bh=XV6NmS9EmrcHVtreIgJw5LSGDxATIuU+dhkRn9xbhqE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=aKIYgZpiyaeoS/ztV+oPfEMl5+1n3SOWJRPVWRS3+3uT34NZwdnr7AbjDMZddbO1w
	 kiKDRyJl2sP5EsiLbZp4sUsoxuaHLlen+hrvo19hFxDlLbIhlMMdLB0kEeXqtevMMl
	 D7dPyral7kRL8BmbV5RsLslIRyAGw6KA1SxNiIkk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155416eucas1p1d074766d9b700f0f829cf9bdc700bea5~rBiqEHdiV1676716767eucas1p1s;
	Tue, 24 Nov 2026 15:54:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155414eusmtip1c4d4f08e383392d36919b67f26ee9e5d~rBioaCYR62899328993eusmtip1N;
	Tue, 24 Nov 2026 15:54:14 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:45 +0100
Subject: [PATCH v8 09/18] drm/bridge: inno-hdmi: Add .disable platform
 operation
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
Message-Id: <20261124-jh7110-clean-send-v8-9-de92635dd857@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=/knjP6UiwZdKsnCrvrX2Kb51jzLnQ1cNNiICHKtW6ws=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhaNddW663J+lvVy3Y/p0a/VFL48eSTevZ2Ta3WC5
	tHHrrIZHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAiKU6MDG91UjbOOBV2yUMq
	301//yqLbT1ZKUquXdvXejW89X71cCsjw1PPBJYEbYktcRJl+kybbs3nc6+xmST6Z/vDnzOfnxf
	6xQAA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155416eucas1p1d074766d9b700f0f829cf9bdc700bea5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155416eucas1p1d074766d9b700f0f829cf9bdc700bea5
X-EPHeader: CA
X-CMS-RootMailID: 20261124155416eucas1p1d074766d9b700f0f829cf9bdc700bea5
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155416eucas1p1d074766d9b700f0f829cf9bdc700bea5@eucas1p1.samsung.com>

The Innosilicon HDMI driver supports platform-specific behavior through
the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
platform-specific power up sequences (like enabling PHYs), it lacks a
corresponding hook for power down.

This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.

This allows platform specific drivers, such as the StarFive JH7110,
to implement their own power down sequence (e.g., calling
phy_power_off() and clk_disable_unprepare()).

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
 include/drm/bridge/inno_hdmi.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 9b90a37bf29d164b6500ddd119bcf8ca094a1735..2b1e2d61e4433ead684b9de41610000fb11e07e9 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -881,6 +881,10 @@ static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					    struct drm_atomic_commit *state)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+
+	if (plat_ops && plat_ops->disable)
+		plat_ops->disable(hdmi->dev);
 
 	inno_hdmi_standby(hdmi);
 }
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 507d5e999183ca02e7dcbe4ce7568acc21426a89..0864f0d8862a4325821a84db6d04f14011d9aa78 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -16,6 +16,7 @@ struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+	void (*disable)(struct device *pdev);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1

