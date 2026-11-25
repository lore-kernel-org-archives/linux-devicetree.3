Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580137;
	b=iieeK0Qxa6zCe0vSA4esueHOOm6avnxddU7Aq5sjrKW0QTuDFQSlF6xoDsNnj1ZoD0uc
	 lP8ypnEQWt2XBq8Di6sw1gfMhiZhu8MaWkuAX6x3YdymqjIwQRZKrLMhXXKFhP7wrXlSc
	 UFT/ywMFKFcGB6ikYen7p24DTCgkSr5vdHEfwTq198wNbnvtL998FCXzm+MzF9cPlyFz5
	 v6u5qj2Ds0gf5DxYXWYWpmPS4+XmrcE17sUFfkpjZYOPVCBkDO2A5rp9tY0KW+4UDunLf
	 3i45sdbDRkGejr+QiNCzZtS5bAz/cw/tuCj3TRdLsC07nbfHaNIZvUbB5FbjvZ9StSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
	b=iHTeahwz6p6biT7DpCVp4nydHmNXS0x0sFNl9V9edEmD1Eyph6ZvUsLI7UsbT5hYocEE
	 D1ZoGqpyPX3N5qgnnWRhEbLKt/fh2zVm9l6wuty8kMPyO2v5ftbq2ttYohP8e8smufKUF
	 x9wxxHJOZtvtaGQyBEI6h+RDJPqa0hjseWfXiBEscIfv4sf0zAZVvKxGJBfiv6/sUsr4g
	 DWn6i/vaXmRgZFtnYFgipcktEheCHkXedS/MTqNT8TJIt+QiL/iSSixZgRgMsn79IyeBA
	 Fgs8wKJwyFXnnZUd071NBBdW4OmRk3T5WvxmK5PfaadR21wfRw7XzFdLrkdMfpxTvFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOehhLV5;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D1606A330
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOehhLV5
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04b676219so29036425ad.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580136; x=1796184936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=MOehhLV56Waaq2mRUpUZJGwEY9shCuv67QPGJ8YarlLXY0W4iNb5HkkEPmmMB9iKUl
         v0vXxQBxg2tRd4+wkkh6REu80iLhv8x4vkQ3PMFfCBQ5ba24hUx5b95rsqT/o9glAT+P
         ZsJ8EO0sUD5uJ/G7VsFp+gEPQUBcoRlo72hmj3N8J9yF0xeS3t93kkwlOtOupuJKpT1w
         sBlvylZ2xkJfMIfCSGlIxjCKhsjdV4cQvkVc6MxVYwkXJgwVv5mBcYLnB6jVpEBb0s2m
         75TU7qrBQMzniA6WXqmB0JaRxKipz2R5U12Ju3TNaAxRwzAAtAH8/OK8eRsjD0f3NWLw
         jYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580136; x=1796184936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=2BzqgoadRI1zGMLp0Wj+EEv83R6rA9TnU78KL2mZh4IyYrC/Xbx0gV9pH6UCG+fWKV
         uxEDoWGQlsDj42aExpSulUOZVMppIlPUBbWO8OHvnqwH4MaT3IFEwu8Ej54wBrhSFGzq
         Pe2WltDuzE9urJe6dmHQncjgTnT25uT21RTMo9ztjMzHMXTZR85WK7MZOmSczMke2f77
         HGlecEL1KiyeRKhS5veoY4zy2zicsJmten5d1Q5eHQ9WV0+zES6q+M9cdgU8DNI7JHgj
         S5h9uTsayxaTp3rL4i27PTCjqacg4nSEWuundcV/GmbsvpckZw6rSYcyKm2i+Zr7qETz
         D26g==
X-Forwarded-Encrypted: i=1; AL+hErGOM+GROCSOWIXASt5frM57UA6fDU4dUGJeSRSrAnc3OSDrEISgH6brRL36sOIozJFylVaMI7Yl30Vq@vger.kernel.org
X-Gm-Message-State: APuU4Z95WiYCECfpEfXc4FLnMaUU2sfNmK8Wj4qrrdigaC9OGLpZTbST
	oM99Bs4FK6c5bkGW9zAXM201a7xKC8Utdfq7NvvlxdLVSQyc7+h8JYIC
X-Gm-Gg: AZFdTZdD7E4WmEBGC87UHL+qDhb0oeC/3LltxePgFPeyqhDARWKgS4YlpdPgEQW4sL4
	JtV1pR13VSAJQD3pXZYSTJwOT2icpkV4vc3YgMx32CBT0dCxyXwf+03Cd9dkEXdBqo0bdDTyCWa
	r0qHtOZ7bljmPOO5ryqkZK39v0jrr/+6H9iWyiquA+4WKw4jeD9MXFzBWuaTd9u+JPORdNh8Ee7
	/fmN2PYJnJho11zKbQRgxCYTFWnXNQsBXjoSiQ2Vr+JHZtqec1gNceHgIUCcC1ynMLm1AWl+hLq
	WktDTtrbTkyt/YLyppPze4EN5Mp4lOy5kcnBxLF8fMZnq8ZT5/VGaBpHppYqwB2MmXbFRdpt7rM
	ZN+B7L7JoDUOKxe/ZgvFcrOr4a4Df5ukWeNzoeEHr2chWS/SNg9HveJMGbFFSuEdqZ4rOW1YSQl
	y7r5qocKR/jGAkNuJaPevWGN3wnBiuMPnW/zAvzDNXbDxpO3B4KCn/quKXD6LWbKObJZbEPV/y6
	T/U4Kyh6sWG0K6Y3AYnGMwHks4IhjB3MnXCIbaEA8M6XhZXPPZ9Pw6JECrjzhhRMgB7xApvdWmv
	FOamrX7Tz0aEct8GFLGeIgwucsaQ
X-Received: by 2002:a17:902:e80b:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2f03f181759mr177341625ad.34.1795580136016;
        Tue, 24 Nov 2026 20:15:36 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm68640555ad.38.2026.11.24.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:35 -0800 (PST)
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
Subject: [PATCH v8 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 25 Nov 2026 12:15:15 +0800
Message-ID: <20261125041523.242588-2-inochiama@gmail.com>
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..658ad2fa87b2 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -48,8 +48,17 @@
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
@@ -277,14 +286,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
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
@@ -298,11 +314,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -319,7 +335,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -337,8 +353,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
2.56.1

