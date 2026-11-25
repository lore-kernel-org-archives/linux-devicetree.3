Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580141;
	b=AfBESHsk+8Tc/qHoFW/SnuKTQKAj3MCPMhXl+0+gu+JHPDcY89ol/MCN0bFLLD1IfcqU
	 5P6EiNzh3jCnbKDsLjdxGfNUoztEwaSPVtWJ3ZI513hoHmHp9XSLY0XPqmyHyeFNH0+8C
	 LBlBNneFtQBexkcuqWsazzbYBPEdFvApEF6ovES9dmvtRjiN8LW6yzSMaYyJVN6BvjypO
	 z9XnsDtKh95jMhQgRB/fIyE5dffsrSRiUQ7qh9qquLK9CdNmy2BkCfMG+N7r84e1JSdf7
	 kcbbLYDSfGz1Psmuhv6eX6N7q1nkJ8+B8xxExhkyhk/lDEIf8tK4WxSvRp7J9rd/eRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
	b=fLv+HdN+EV69mxOmxObKu4WsANbqV0+JLSL0+O3fJvUZPqzBbvRzlqBwd9iNmjzUsXhN
	 LDKMwya2QUXo2OkO78xZJUg7VV0Q0UbSOQOLNT5le7gHnaiLOXh04vTvutj1Ge+T0Jqvj
	 OQA4d6yXF3jvI3H2xzqK7WlhpCuu3LK7JNyoi57NUVkluza5apAuAnEQpQAjIrV1N9Gjj
	 SOgvU8pHdj8BCdcl3XwA2fNxSdxUh9GFyGhZ67beuCjBmxALRqsPxKxtB8WOikfabJHRS
	 AeBgh3Z+ZO9zY/z6UjgFPX/ZIMc4zCRQ8wR7RCRqXNL01Mq9gljw3+RuJ2BIy52OxpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dnp2udsN;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53565606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53565606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dnp2udsN
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3682860a91.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580140; x=1796184940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=Dnp2udsNUtexVWceWNpdwrKsFgONJxChDclniNCZvlS4eeO1Yi/wdiiPivBECvEhhf
         eVe7Vwjsueo/wVpVH29/+PDlrlgf6tOlyub0nSQKFo9dZB+h87gEmLuuz9vBiYCrQLcA
         /UsC4MFFvKVm4MGEdB2bk5Pa51jAuLSpfgV14f9kD5LdkQ5f7Yh7rmS0InS3X1EH4ndn
         OxllEk+4r9ouPvVr18J7Bp7GwWE/3KkNNcRn36B9h/SptrJ6DdrRCQR7/MT8hjuE7HgT
         jFUPocVKEfM4CoxFs8yka/vMm7vIxViEPo2owLEpbhjA0rJ703o1tjcZsokfLfU2fTbF
         d5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580140; x=1796184940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=pjx283Or1N6IxnIMQiODpI1EoVBzb+n4/feRFx+CxFU8Tc16EfamU3xMLe7ok7zKB7
         FjwEj+IUEqx5xPM7+E1LAP9RDfzoHZL7qYr6FNtUqXhAlKxKBO8nkVVcrx1Dhkx85pMh
         dN74UVozKk5/JMLJ8oBYEen0rBa7QwgsqMNTGIjrm73yuvHh1WUV7sQl6P1Wb0cgtYLu
         GjQ9sBer18jxJSZGIzHsXxyyF7Z/BpnLTbZUaXl1InZUnd8LzlMuHGaWyzzteq+epiYd
         Go1nMpVUa8orUKAIUmZ7U/7/0/KWGr1MprGg88S9NW0XIrlLasZkK3Rx5xtm/dkvUivv
         /uqA==
X-Forwarded-Encrypted: i=1; AL+hErH6cCl1HjZvNZqJ0hrtfFPkWS+plWqZxtYysaBLZ1pcK2KSkYfkinQ1znL55/VSFiO2+OfSgq6WswQ3@vger.kernel.org
X-Gm-Message-State: APuU4Z/mNCPahcdvKnWuMr1xGJtTZTaG7bAEZkWEm57GHJAWVywjjqvV
	BjYYwwwyiSHPVTqQMSJUqhAgCMA2ENs+NOiX8EGvoRsp9F34DRfOKNQG
X-Gm-Gg: AZFdTZca/fCWTq5c5f5QkKcJvQ1/JAdIvbRx4k6ZsJA9VYXeuK2IYY89Eh4cpO6+ZoS
	UP5R10tU93pszibuzCwRjNQtKPZSKEJKwil/66qpWqbeqdLt/SdOcN2AdzeyV9hihoM92moSt0Z
	Rkb0LREJHCb9Q6NZXSRQMQDYiU6hg0Dug+2DGxkeMUwJ4U3iNwDPEW0JWDX5r3RSiiGuheeJVps
	URDBdtjlDmVxdRxPDZwH1D6CAXxsOg1hCoq7zT/gdsrjOv9KpFej0kzwiZ+sdQykJTvQ4fkVTjk
	+PijZu9OKM9Vd2nvu0hKHBh9DSPsqOrZt4R966MKWggJPLXh4AwmWy4iG7UQ1H7TPjwiw9SbWqe
	CHU4wsAqaOOzJw6bYGG86HDgLpwU5Vl/D8UtUz4z2Dlozr/jq99+Qr5fp0c42WbAN0JHDT9lhZB
	RLfOXVfBqIgktoImZGhC7RHA3+ntj/LFB/663nMwzlixaaHXiuQYVaNXQQ/XYldcHpq2iAipRRt
	w9al107yZ7E+vEmBt+jc6KQbwaOoB+9nMQJi8p6GHwLHxC/mWvZO23l4gQsBJ5C7aTUz6AyEl0K
	E9G2vAkqLZoE3Y5BBHCaUQV8SYo=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b41c92a2c1mr16021471a91.31.1795580139611;
        Tue, 24 Nov 2026 20:15:39 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm25258203a91.0.2026.11.24.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:38 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Wed, 25 Nov 2026 12:15:16 +0800
Message-ID: <20261125041523.242588-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 658ad2fa87b2..8a3cae32609f 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -54,12 +54,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy_bulk_data *phys;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -118,6 +120,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	int count;
+
+	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
+	if (count < 0)
+		return count;
+	if (!count)
+		return -ENOENT;
+	if (count > data->max_phy_count)
+		return -EINVAL;
+
+	k1->phy_count = count;
+
+	return 0;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -173,12 +194,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
-	if (ret) {
-		k1_pcie_disable_resources(k1);
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_init;
 
-		return ret;
-	}
+	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_power_on;
 
 	/* Deassert fundamental reset (drive PERST# high) */
 	regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
@@ -187,6 +209,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	k1_pcie_disable_aspm_l1(k1);
 
 	return 0;
+
+failed_phy_power_on:
+	phy_bulk_exit(k1->phy_count, k1->phys);
+failed_phy_init:
+	k1_pcie_disable_resources(k1);
+
+	return ret;
+
 }
 
 static void k1_pcie_deinit(struct dw_pcie_rp *pp)
@@ -198,7 +228,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -265,23 +296,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
 	struct device_node *root_port;
-	struct phy *phy;
+	int ret;
 
 	/* We assume only one root port */
 	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!root_port)
 		return -EINVAL;
 
-	phy = devm_of_phy_get(dev, root_port, NULL);
+	ret = k1_pcie_get_phy_handle(k1, root_port);
 
 	of_node_put(root_port);
 
-	if (IS_ERR(phy))
-		return PTR_ERR(phy);
-
-	k1->phy = phy;
-
-	return 0;
+	return ret;
 }
 
 static int k1_pcie_probe(struct platform_device *pdev)
@@ -357,6 +383,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1

