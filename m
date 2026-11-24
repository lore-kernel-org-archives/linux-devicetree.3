Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535656;
	b=qoilncn1JpLpZtlVkph8V4ilZyPJ9KPRMxlG2Jynl9usGdx0tXfFnG9CwzHOpvM1vkZ1
	 n0ZbzOvdWtKb/5e4nNNv6KgN7tSXoYMqDVUlaQ4fg7hmsd/ClKpX0J1Pq4nbJGFBOVweS
	 clICxQL/PljSugYPGW8TuPtm/FgY73zrORlw5TTzM/bKq/0XLWrVd20c5NWbvsqU6LscQ
	 whx/Yq4YeAwZNFaWvK05EI6ZOLQ5J66X3nGhVAQrJS5/hxhfkzu2vP2gPVUO/A9E2DAk3
	 WG0wsk80l8JvjI5VrXQ75y2QHWRwN8rveQzGb3r9Yvm963CCkkdQc/Vyhgqqswav6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535656;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=crfFbI3cKj+ke4aYdZaScB10py2O16A/EKhDlQi0ffk=;
	b=RHDx/cuUrHbuBpVypBn6VvBQOyPT2vnILkOvJDTDnfylmTsGye46QYY/pP3dkU9ILt+P
	 NlbgINdFFCO+IpXExXuMiq6gh91Xx7r2KbiKHT5iWfhps4tKrPEQOYn4X9wY689N0uI6h
	 nmDdk+XJ8cIFtlPLfh6bvQo5SrnLqSrpKJmtek0CRhSMh6IY6o+R4Dl8rzRtvw4P75ZGW
	 JLvfRxrmslWiksE/UfIK63h/PJ+DR7D/14dzQkIciniFHVPmbnX757jaexgRJuHhWv6n3
	 QH51m1wBIDqxgWtXPQHT9JW+z+2vkICL8Hfd8wjlx/602AM9WSDRluxSBBbW2jiJ1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cWOV4g7H;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A7606A695;
	Tue, 24 Nov 2026 15:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179A7606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cWOV4g7H
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155414euoutp028a3842d9b642fb12898db619c16f0547~rBioqyOnH0605606056euoutp02x;
	Tue, 24 Nov 2026 15:54:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155414euoutp028a3842d9b642fb12898db619c16f0547~rBioqyOnH0605606056euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535654;
	bh=crfFbI3cKj+ke4aYdZaScB10py2O16A/EKhDlQi0ffk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=cWOV4g7HxFt+RjiN5fcDuqt8OwPzkvYEgxEA9EzdRRS9OG88UF/UkbrtOLPnoOlWW
	 Bw8wb/DRJkWtE5UhwR6h12zFyRFvvKvM1o1aNLanJE5dh3qdvLil2FdBmqKw0Z4S4E
	 BO4r1q1NEwAwpDM2PSzhKCnHE/FkBduV0HpDsCDQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f~rBioVruft1250912509eucas1p1T;
	Tue, 24 Nov 2026 15:54:14 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155412eusmtip1041a995c6f79dfa6c03a41b8ce2137f8~rBimsO7_E0284302843eusmtip1C;
	Tue, 24 Nov 2026 15:54:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:44 +0100
Subject: [PATCH v8 08/18] drm/bridge: inno-hdmi: Use a regmap for register
 access
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
Message-Id: <20261124-jh7110-clean-send-v8-8-de92635dd857@samsung.com>
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
	<cristian.ciocaltea@collabora.com>,  Owen O'Hehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=oaN4zH4Mt+Cbm2CLbYcckqmbiSoUWD8Izw2ThFQkAu8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhb9x5X3Pj3KO+yHzuaeshOyMpsSX//nkWbS6TzSn
	2p1+m5DRykLgxgHg6yYIsvZjdFGkv8YnpYff/wLZg4rE8gQBi5OAZjI9jpGhjUrha8/71pc8WLT
	vkeC924xV564J9R74NPq0JoH/vbeqvMZ/grfTlt5Y/pbNWPDijPuhS1/IoUl7iXyHum5eLlGxCx
	OkhsA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
X-EPHeader: CA
X-CMS-RootMailID: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f@eucas1p1.samsung.com>

On some SoCs the HDMI controller does not own its register window. The
StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
the controller and the PHY, so the parent device maps it and owns the
regmap while the two children share it.

Access the registers through a regmap. Use the one supplied by the
parent device when there is one, and otherwise create an MMIO regmap
over our own resource. The MMIO regmap uses 32-bit accesses with a
4-byte stride, matching the readl_relaxed() and writel_relaxed() calls
it replaces, so the Rockchip platforms see the same register accesses.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig     |  1 +
 drivers/gpu/drm/bridge/inno-hdmi.c | 39 ++++++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6b281f328fb3016ea2f167f8da093..34bcee88170317a4796178452ab5d2e673daf1fd 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -105,6 +105,7 @@ config DRM_INNO_HDMI
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
+	select REGMAP_MMIO
 
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 9368814c1414c2e7a00f44dcced996a397ede150..9b90a37bf29d164b6500ddd119bcf8ca094a1735 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -395,7 +395,7 @@ struct inno_hdmi {
 	struct drm_bridge bridge;
 	struct clk *pclk;
 	struct clk *refclk;
-	void __iomem *regs;
+	struct regmap *regmap;
 	struct regmap *grf;
 
 	struct inno_hdmi_i2c *i2c;
@@ -467,14 +467,25 @@ static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 	return -EINVAL;
 }
 
+static const struct regmap_config inno_hdmi_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
-	return readl_relaxed(hdmi->regs + (offset) * 0x04);
+	u32 val;
+
+	if (regmap_read(hdmi->regmap, offset * 4, &val))
+		return 0;
+
+	return val;
 }
 
 static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
 {
-	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
+	regmap_write(hdmi->regmap, offset * 4, val);
 }
 
 static inline void hdmi_modb(struct inno_hdmi *hdmi, u16 offset,
@@ -1080,6 +1091,7 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct inno_hdmi *hdmi;
+	void __iomem *regs;
 	int irq;
 	int ret;
 
@@ -1095,9 +1107,24 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	hdmi->dev = dev;
 	hdmi->plat_data = plat_data;
 
-	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi->regs))
-		return ERR_CAST(hdmi->regs);
+	/*
+	 * On platforms where the controller shares a register space with
+	 * other blocks, the parent owns the regmap. Otherwise map our own
+	 * resource.
+	 */
+	if (dev->parent)
+		hdmi->regmap = dev_get_regmap(dev->parent, NULL);
+
+	if (!hdmi->regmap) {
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return ERR_CAST(regs);
+
+		hdmi->regmap = devm_regmap_init_mmio(dev, regs,
+						     &inno_hdmi_regmap_config);
+		if (IS_ERR(hdmi->regmap))
+			return ERR_CAST(hdmi->regmap);
+	}
 
 	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk)) {

-- 
2.34.1

