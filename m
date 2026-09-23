Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350C362149
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128278; cv=none; b=r7HrAEIWKRRZdYUSRg+iD9/MA23v7ppWUBbk0u9tOjIIb8tJZZwj46uzCisDM9tqrvcVNpHDPikHAX56f3a89+w9smiIBfNukOl2fxHtrPwVXv9Q9Z2OEQXrNxcveieQQSJ8osQMCIVztRMXqPCOUFMQ+cxLNgTwS9kiij/Vdt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128278; c=relaxed/simple;
	bh=tzjrnSGriiNsUvWgycospNy4s2NeOSuRgB+TBE7F6QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3Q16dofWCWFySwSLM+ZdmAhJq0wihB2CQayRtRVkTbykaO7gHf17jQHLor0E42/dL9s1TRdJBh6Ki09QKE1+JT+SNfFeoejHXJ6crmJM0geeYABIBZEp02OdIzNPy+PrrkY3oAWnX7RHqgzgSvykhiwk+3LDTsoaw6spr3zgrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4B+gHCc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4B+gHCc"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db22383fe8so1766425ad.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128275; x=1790733075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=h4B+gHCc57n5ofB5/oA39A2UTGAY/c6loihPbBUHiDCxPGLBzoD1BB++SqSifXecql
         U959Wd67mmUXy64s9vhMTS1CmjFewqoQr+/vMHUFOgJUwqDl23UtWOKoNN6PlFeeovTC
         tB4/QlF25oQgU57a6I5G4U0dOywUzbb+/v//3gnVKmv6nYbdMRR8lr+PSckfLzW/ZVod
         qxCYfLUrY8aQe5D9iScpSJCdAk/jMJtiiHuYQKcsj68jjoWeRimClndYb/fwf6h1zI3m
         bijGfbmX2KpUj7dDDU3McEvXAtujfL/j+hbioCZ8Ck/f81fuQfk1yVdq242Gy7BPCT5g
         KFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128275; x=1790733075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=EtuRQI0Cy71ljMvwcD8svAqARi+P/OGW2whdnbQMWLo68uLsFpC3rGo3TMzVq3D1yv
         5IHSKLw5PhLg0xRovOPhAJC0aoYL3wUrA3uZ0+HZFMHWWj6PWTxeol+7l6cghPDOluSX
         GHtKbE/pXUOKQFWWphMkgQ4sk2RI9o9WkKcbnW90EY25njUyEM1aVkEBssf+8b8Dn25R
         MKMT8kxU61jvYKLnPTp9hq2732tfYbHD4hd9nvc2BFtiiBQYvari1MsMP5xYVvN2yJUh
         3anmXclojC3mt+y0h+TYQUV7QuTtCbArscvOjR7Kt2jtNbHpdur5PAt9bueVE3TWD/DB
         xrVg==
X-Forwarded-Encrypted: i=1; AKwUvBw6bB+P/GoiYuf+fwC3s8HZQ5S+Ij5tTr8avjNmQ07YgkAwodWMefyjZDFBR6OI8wP929beaLY85ETg@vger.kernel.org
X-Gm-Message-State: AFuF++kH8gh/q+D1xRQFfvfKhF/1N6ZMPrS/8CR9q56jkPCHGQx3++yv
	no5nbPVlr+TR/tncCgpql1siU7f4GZoTQdfvrFWp6FRu+GpmjDmqhHSs
X-Gm-Gg: AYBFou1LOlcFTWU/vkFcuDr1qNLN2+ClPKkRAfjHMYLhmJjJEouh4JscmYxbkMenDFM
	AwXWn3Emay56F6dMhLYrgssHgsuddOwIbdGLXg/ShATgeCJTcLpME+FaFQuUbfzm98D4XVtbiQ8
	iRXy1zRW0M7na4qdOh7LTZPonMas3haJ57/+2ZARudXWEweU1+7Gn1dr7JWrGiuC+Et5sJD7W9L
	z6KLF5zBw4yvrYoYLmRdB23fjXHF5MmikeN6QBg87WOB176JqvpJaU6H+Mkb4Q2alBJhOit3QRC
	O/OaCU9Nv/zaDieKzG1NYIJ+eWdlQwBOYd+CmOWbmCjTFjVBKANFbVAmSZJgHcU0BNfZs6Alteb
	wqbZQe5tsJiOZVnzP6KOLb2QJK0THZ+aHrwN9JIojKJWjbaAdjNcfpwHnScHwfq5Z4A8PLjnMDn
	g6BGDTNjez+aGvEEzEmpgK9g76Je3nxX+9VCIhnS4KwKvernA=
X-Received: by 2002:a17:902:ce08:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df69d583b9mr11377075ad.26.1790128275555;
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c668sm2768035ad.78.2026.09.22.18.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 23 Sep 2026 09:50:10 +0800
Message-ID: <20260923015016.64069-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..ab2953ad8f56 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -45,8 +45,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0

