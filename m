Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.126.93.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000430;
	b=WYAkzrCDBQyngZbTnpkcAHu2CBXM8eJVXtDUdYgox97Qdr9aUsrsAGTvWmVdFx9ydhnH
	 3GMsoakAN+Mo6ANOc1UiEafb4T4pLuDfBfovyyzOdidZOL4YBFsdsth1+vPO+cGSrMg/c
	 EuSbdYrvDAsveC1lJD5lJPXrTga2hWCGoNvOoXkB6lmapOuDqXRCH/VlGRq3p9g4dYe+r
	 9mCP0h23003jzJfQ1xaT3TfkD3L7S0fcHQ2bJPbDT8wQ1arHeaBYWejnPjpHyVgG9pFY2
	 wtQDhq8iWEYytJdhBn8fDTnzM6bc95Ne9aS4AEIMSAcC5qdJfFkZzrhED8ZipacjMdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000430;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=IsbEs4MSj4d8YazJXdhEcTTEY7fhkLBoKpl55zE4MMM=;
	b=wm8ZMJmzZc9eG22ZG2wIrqJq1O7815CYbF+oiJM3ahPev06omB9tSbjkQTaqFmPxLf+I
	 d30thxQRgIiVm6HFA0v33YKSyutxUDnIx8vlWZDGDBr4Md5C1mFcX/eLmtUFqVNDyUWUK
	 Nrxa0+vAvggMth7Gfy3lUUH6zzIfdD16heepZ9opSsz2sEHsHqkPPUM0bfAjXY5UWEu1J
	 HtsU0Od/8Ug2Hqr9Wn5FlI2e/bR0LA5mg72PRXxcPCvbKZrehosuk4biDi4nPUz8FJYUy
	 JPUHeHf0VcT5fcj0pA7SF6tWwurRxiDg59MyOVWQPQuLjW4FO9NYY3X/mD2vlQxOf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NOYltmLX;
	arc=none smtp.remote-ip=103.126.93.53
Received: from mail-m9353.xmail.ntesmail.com (mail-m9353.xmail.ntesmail.com [103.126.93.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BC606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NOYltmLX
Received: from localhost.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5257abbce;
	Mon, 26 Oct 2026 15:40:19 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Coia Prant <coiaprant@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 2/2] phy: rockchip: snps-pcie3: Load updated PHY firmware on RK3568
Date: Mon, 26 Oct 2026 15:40:03 +0800
Message-Id: <20261026074003.1169669-3-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
References: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17727304703aakunmbf670e0d2f005f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU9MVh9KS0waQhhJSE9CQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NOYltmLXq2ouEJ/CMy5zJpHdi85Jy8TvZ666Y4i+UdPJ3n8evKM6KvizOx4M3i/7gtkqF4dGK4Rn8elA9nBt15eUlOxd+hSt0Mfe4bXBar7QeCCENI0Oc9rhBap5mOaQY0APRYLi74GwhrotQ4fhcF6/d1VpZnwNDtzQpvDpx/0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=IsbEs4MSj4d8YazJXdhEcTTEY7fhkLBoKpl55zE4MMM=;
	h=date:mime-version:subject:message-id:from;

The RK3568 PCIe3 PHY can load an updated firmware into its internal
SRAM during initialization. Without it the PHY may come up with a stale
microcode and fail to establish a stable link.

Load the firmware named by the optional firmware-name DT property during
probe, so that it is available in the phy_init() context and is not read
from the filesystem on every init. During initialization, clear SDRAM
load done and bypass, wait for the SRAM to lock, map the SRAM into the
register window, write the firmware and finally signal SDRAM load done.

The firmware is optional: when firmware-name is absent (older DTBs) or
the file cannot be loaded, the driver keeps the behaviour unchanged and
uses the microcode already present in the PHY.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---
Changes-in-v2: None

 .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 101 +++++++++++++++++-
 1 file changed, 99 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index ce7d8db2a7c5..bc1b4d0adaff 100644
--- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
+++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/firmware.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -19,11 +20,13 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
+#include <linux/unaligned.h>
 
 #define RK_PCIE_SRAM_INIT_TIMEOUT_US		(20 * USEC_PER_MSEC)
 
 /* Register for RK3568 */
 #define GRF_PCIE30PHY_CON1			0x4
+#define GRF_PCIE30PHY_CON4			0x10
 #define GRF_PCIE30PHY_CON6			0x18
 #define GRF_PCIE30PHY_CON9			0x24
 #define GRF_PCIE30PHY_DA_OCM			(BIT(15) | BIT(31))
@@ -31,6 +34,11 @@
 #define GRF_PCIE30PHY_WR_EN			(0xf << 16)
 #define SRAM_INIT_DONE(reg)			(reg & BIT(14))
 
+#define GRF_PCIE30PHY_CON4_SDRAM_LD_DONE	BIT(14)
+#define GRF_PCIE30PHY_CON4_SDRAM_BYPASS		BIT(13)
+#define GRF_PCIE30PHY_CON9_SRAM_MAP		(0x3 << 8)
+#define GRF_PCIE30PHY_CON9_SRAM_MAP_WE		(0x3 << 24)
+
 #define RK3568_BIFURCATION_LANE_0_1		BIT(0)
 
 /* Register for RK3588 */
@@ -56,6 +64,7 @@ struct rockchip_p3phy_ops;
 
 struct rockchip_p3phy_priv {
 	const struct rockchip_p3phy_ops *ops;
+	struct device *dev;
 	void __iomem *mmio;
 	/* mode: RC, EP */
 	int mode;
@@ -70,6 +79,8 @@ struct rockchip_p3phy_priv {
 	int num_lanes;
 	u32 lanes[4];
 	u32 rx_cmn_refclk_mode[4];
+	const struct firmware *fw;
+	const char *fw_name;
 };
 
 struct rockchip_p3phy_ops {
@@ -96,6 +107,34 @@ static int rockchip_p3phy_set_mode(struct phy *phy, enum phy_mode mode, int subm
 	return 0;
 }
 
+static void rockchip_p3phy_release_fw(void *data)
+{
+	struct rockchip_p3phy_priv *priv = data;
+
+	release_firmware(priv->fw);
+	priv->fw = NULL;
+}
+
+static void rockchip_p3phy_rk3568_load_fw(struct rockchip_p3phy_priv *priv)
+{
+	const struct firmware *fw = priv->fw;
+	int i;
+
+	/* Map the PHY SRAM into the register window to write the firmware. */
+	regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON9,
+		     GRF_PCIE30PHY_CON9_SRAM_MAP | GRF_PCIE30PHY_CON9_SRAM_MAP_WE);
+
+	for (i = 0; i < fw->size / sizeof(u16); i++)
+		writel(get_unaligned_le16(fw->data + i * sizeof(u16)),
+		       priv->mmio + (i << 2));
+
+	dev_dbg(priv->dev, "loaded PHY firmware %s, size %zu\n",
+		priv->fw_name, fw->size);
+
+	/* Unmap: field back to 0 with the write-enable for bits[9:8] */
+	regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON9, GRF_PCIE30PHY_CON9_SRAM_MAP_WE);
+}
+
 static int rockchip_p3phy_rk3568_init(struct rockchip_p3phy_priv *priv)
 {
 	struct phy *phy = priv->phy;
@@ -125,16 +164,41 @@ static int rockchip_p3phy_rk3568_init(struct rockchip_p3phy_priv *priv)
 			     GRF_PCIE30PHY_WR_EN & ~RK3568_BIFURCATION_LANE_0_1);
 	}
 
+	/* Clear SDRAM load done and bypass before loading the new firmware. */
+	if (priv->fw) {
+		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
+			     GRF_PCIE30PHY_CON4_SDRAM_LD_DONE << 16);
+		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
+			     GRF_PCIE30PHY_CON4_SDRAM_BYPASS << 16);
+	}
+
 	reset_control_deassert(priv->p30phy);
 
 	ret = regmap_read_poll_timeout(priv->phy_grf,
 				       GRF_PCIE30PHY_STATUS0,
 				       reg, SRAM_INIT_DONE(reg),
 				       1000, RK_PCIE_SRAM_INIT_TIMEOUT_US);
-	if (ret)
+	if (ret) {
 		dev_err(&priv->phy->dev, "%s: lock failed 0x%x, check input refclk and power supply\n",
 		       __func__, reg);
-	return ret;
+		return ret;
+	}
+
+	/*
+	 * Load the updated PHY firmware into the internal SRAM and signal
+	 * SDRAM load done once it has been written. The firmware update is
+	 * optional: when no firmware-name is described in DT (older DTBs)
+	 * the microcode already present in the PHY is used as-is.
+	 */
+	if (priv->fw) {
+		rockchip_p3phy_rk3568_load_fw(priv);
+
+		regmap_write(priv->phy_grf, GRF_PCIE30PHY_CON4,
+			     (GRF_PCIE30PHY_CON4_SDRAM_LD_DONE << 16) |
+			     GRF_PCIE30PHY_CON4_SDRAM_LD_DONE);
+	}
+
+	return 0;
 }
 
 static const struct rockchip_p3phy_ops rk3568_ops = {
@@ -250,12 +314,14 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_p3phy_priv *priv;
 	struct device_node *np = dev->of_node;
+	const char *fw_name;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = dev;
 	priv->mmio = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(priv->mmio)) {
 		ret = PTR_ERR(priv->mmio);
@@ -268,6 +334,37 @@ static int rockchip_p3phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/*
+	 * RK3568 can load an updated PHY firmware into its internal SRAM. The
+	 * firmware file is named by the optional firmware-name property; when
+	 * it is not described (older DTBs) or cannot be loaded, keep using the
+	 * microcode already present in the PHY.
+	 */
+	if (priv->ops == &rk3568_ops && !of_property_read_string(np, "firmware-name",
+								 &fw_name)) {
+		ret = request_firmware(&priv->fw, fw_name, dev);
+		if (ret) {
+			dev_warn(dev, "PHY firmware %s not available: %d\n",
+				 fw_name, ret);
+			priv->fw = NULL;
+		} else if (priv->fw->size % sizeof(u16)) {
+			dev_warn(dev, "invalid PHY firmware size %zu, skip update\n",
+				 priv->fw->size);
+			release_firmware(priv->fw);
+			priv->fw = NULL;
+		} else {
+			priv->fw_name = fw_name;
+		}
+
+		if (priv->fw) {
+			ret = devm_add_action_or_reset(dev,
+						       rockchip_p3phy_release_fw,
+						       priv);
+			if (ret)
+				return ret;
+		}
+	}
+
 	priv->phy_grf = syscon_regmap_lookup_by_phandle(np, "rockchip,phy-grf");
 	if (IS_ERR(priv->phy_grf)) {
 		dev_err(dev, "failed to find rockchip,phy_grf regmap\n");
