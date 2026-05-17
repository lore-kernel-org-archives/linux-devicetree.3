Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6C306B37
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982566; cv=none; b=ZmbtRmw2v8A0JpXXwDeOwZjhtRfbuIARRbbz0k6ZcWAVo2NwBll3DBbEhKH9Hp0jmvQ+mPz45dePY2BSZyYiDcSCXemqQiRNoIadN00ZOwQFUDIxmJ7xgUeJxFpZLHCxP5S9JbI1dp2hC83j75kqsIozV2//CCDxmn7AVPbv7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982566; c=relaxed/simple;
	bh=7xXazUW++/Ihl/B9YC+Gc9/dkyUHgTw/pMGMhxHIGmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ku1xrCwzROGtmYfy5OMWMONKk5RbKR9y8qlxyA/KR/7xYDzTuNbammrwhu+oOYLgVd1WRvXIrWfMpZFiQLHBvchVuyYdWoY9yc0JgmAaVqDbMjOkGIlruSXScbYO/Hf5IpcHnlbL2FrSM0mVyImeitt+D4IS0Py+48SlVoM+tEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyREupKY; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyREupKY"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso349382a12.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 18:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982560; x=1779587360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=QyREupKYPNmrCerLbQWbbxZQMYkt2XXXfU6efpmrCdeLneDR8Lbpa3r6W9KSdqZA+J
         uQR0mhpnp58MYiUaQI5J8uaQMAbsi31EzGEG/mLiYBKp5TZC+KckhT+q4Z9VMG8BedJl
         Ajiyt6haXa6ft/z4mCpHSICt9mbO2ltAzgcQ8dlshn+Mpv6ekIkCJR0whvq+9KllC7uq
         RFffdZwmMp4vFfnhjZW5bPZLdH891rZ4DzfmF8A3Ouh6Kw0vuOU7rH04YPMXV2HV/kor
         5/N538riu7ziFTMUsWCpcSqWx+k2vZNI3mmDuujQ9jN1PjtrMgxd8VvZu6v0i8dvm1Bw
         ivig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982560; x=1779587360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=CNMH17vhqhNEhL5F4iPQS3pl5upWVVzUoBhil49abq7Xvi9AHFxAdc0ulLPALVkfIR
         z06o4yBhi5UD+ePhInVl8G+TFUG00TL7MEE0usnr9/JJ5nFGh67WT0zAfZHCqx/thNd8
         5a90vZfsMgpiogsxTblF/Q1ijXXh79AgitrRFSN1dc5ieVxggEZDMet8bqR4rfgFFrtG
         2BWHmelBSjA41prh+2MJ0TIiUZnSISPv/y5qGeMzSk7aQ5RSa53+oFCfZ2wcIH1Ik1Dj
         W21w9ZE4XIJ4liITkkhrrDkGP8iTJX0pjIVIBA34mlgpkk/U5Cc32WPrAKSWh0M9LaBr
         WkKw==
X-Forwarded-Encrypted: i=1; AFNElJ9z8/X5YiMUBohT+dCNqB+3wM0xK0f0bCP3chttyND3zhVbwi5jmgXxUqBd5/7itUqelI+KpNqTborS@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQ7hZrn7xpZAx5Z5dihK2vIpvNFqy8ZVWVxlYnv+5Xf10Iv2R
	foL54o8HFhy39wOih5eK3BsmwJl9CQ1qBndWeHKIf3Wl01+R4nlSSHlv
X-Gm-Gg: Acq92OGfyYbJGvQT08WCZhigbW4uXL3YrDYXkDWaSDFScqKVKHjg6+UbBn0pCvvnyW1
	R7r9/U6eM/eMSnJKm6CNNbt5YbgvmhoueiUk9HZSVkkLwQqLuHeAjAxAtXQTGkrazar+x73+eB7
	XmsQJaNt/E/0IvhrS0Of/RkKjf7HFA5mk0psRbdskoKuihyYWDOkBSs9nWo3O8T56WOT+9PCowX
	iFsXUQr37FXtIYOp1N1ZlNI0iPLeEMkfIrrZKn5lx8Y8t5Easn8kQnF1rAUT7eRBHITDivUdYQ+
	8QTJewYT65yioxGn0JK1xFTJDdRGcFjo3BRs0Bhqo3nJOQ+ORvMfd36+drgeiLfhumRcjkMnrG+
	8rkQJy4PEzJMrZPRpq5FstDhYm/4/O62Pl3H+Qa3z34aidenNVzLUwQ41zJj+niNcs6CPmCRrm8
	p0KUAMWUhlf/RiuifH7OHs8Ug=
X-Received: by 2002:a05:6a00:a1b:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f33de1258mr9305811b3a.50.1778982559999;
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778ad1sm10531320b3a.17.2026.05.16.18.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Date: Sun, 17 May 2026 09:48:37 +0800
Message-ID: <20260517014841.254085-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not support by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 1b519d49dcc0..7f6f1df31cd8 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,7 +51,8 @@
 
 struct k1_pcie {
 	struct dw_pcie pci;
-	struct phy *phy;
+	struct phy **phy;
+	int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -171,7 +172,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_init(k1->phy[0]);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -191,12 +192,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	int i;
 
 	/* Assert fundamental reset (drive PERST# low) */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	for (i = 0; i < k1->phy_count; i++)
+		phy_exit(k1->phy[i]);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -277,7 +280,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	k1->phy = phy;
+	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	k1->phy[0] = phy;
+	k1->phy_count = 1;
 
 	return 0;
 }
-- 
2.54.0

