Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392D346A15
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569690; cv=none; b=LCRWWbVbRgI/N+TIPH680FXCU+QhU6qwtdx0adHyHcCcXNTx7hFlKLzak68yWXNrDJLStuensJbTOON9Yy/+YXS0/tVza1kfvrgUPr8PA8pB9hN4/vgw4oC+06b8jN3WBAXlpwGnhlEia5IJWawolUBFdj9T9Z8gX2lb3HtkmBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569690; c=relaxed/simple;
	bh=jCP5Zz2e1jsHNyBDmkkcnVgytoZly9neC/WVj1uD+uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGZsKDcX+r0+3dscbiBXO1WNl1P5DSOYah9+YY6QreLrEm7v+OgOXw+n9W5Izb1LObClxVsMJb54QEUgrTOXIjqEhgPo99Xr3WSUGd0gPrwsRrbtNmBJRPBhmm7AxEQhE7ZSrJB0mUHh6e9qw8wvC+6yglYyOn2FLqSSFUFegFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaRbmS4+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaRbmS4+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8478fe07f65so1392773b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569688; x=1784174488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=WaRbmS4+K1jWOiasRvXBXXbFkpodjrDZyS6+d+1dUa0gvljJk8gZGwPbA6cK9VjGAW
         io5fRKooqAsSYf2NVldvTM2o9U+NVNJNnWl7GfaE/SRhe5oyzgSzrO6qbn2mqPQiBJCz
         4M9qdkPYynSjNMjJp7tm8VERDRqoc6sAbm41L/g2dbYemZ6AtlO6ueL4pKwGeD2Xsreb
         6eu+pnzlV4/KpjxxCKm5QGGNTu8aIzfp+X5unn8e9oiL6CAvXBG5u57ZrB0C0elQnFWo
         qiIzSuQobrHMlB0btiHdBXayToqu2y8TsLrY8DQUpHbFFtfgpUnHLLy/ZsN5JkXleeYG
         iHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569688; x=1784174488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=QZjQQpK8NRhx1WMRMBmOte1RLGIA76NFAE0JDekqPsxiEXr8NlhvHMr397tq6oZ2ZW
         1JKkZbKmBt4DuDfByn9E3nRhvj/7vJcDAQfznKk1idWrUDplXCqF+tvcFJiAFIMJ94Nu
         OSjeEi89MXqSmNpHqYj0jNCFEeVk5t+WYl4F+r1v084CUopxATOhgnPg1h9BK4SGGmZp
         296mOl9TwVn58lkavzP8LoFwfqfkpPy7gnDkhxD4XodP4fSWZokyU+RzTat5Ko0yU5Nf
         y9ue+/WXI8HqmdLuuJb2FLtXhUoD/5QUvdnqzX2mme32aZqhduKwpOSNad36/Ao0qtEa
         9QJg==
X-Forwarded-Encrypted: i=1; AHgh+RqmnMfrAUrJWXOJqtnICIkt/jOP2Un+H7wUsXTZ6QKB76tUquxCq9HbyxFnSlywqwkj8L+fAqi/Eo8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xCrLRnXDjXAPFYemSHLbiyL4NkZG/E4YNc+fRl5j3jmjJ3g/
	i0X+s2Cgw5qhQQqboTnh1y8ye2mNh4bim9D1J6I0YZyv/nxA/xmDovdO
X-Gm-Gg: AfdE7clA2y5z4t+nVc9V7yAhpO3/UbFXiSacseOm6xXUk0d4yO5z/cGfEM/Cm2+hDsx
	SVzP5BGjLoiCGSkqI5RZqm835dGqDfcIXHzh5DgzpWaQq3kGgcmmrFKYYSlf/Y31clfzrKSLsjZ
	pyALTy/37dtSefoc+diWJ1kK8f7twNQ48+eah9VFiD/d7XuYNQqBceaefmHsgsj1XATF0Mw7pSW
	yUtyF23a6MVs3NQ6WrnOAe9RfjNvYslLY1E7YROOWRz0buYblJnqtMrWRUjIOMFbqlSJJ7Oyc5i
	j7Bs24xmLw6VidkaJ20rAwwV26xqjjM2YeDarkYzJyWzMHh4Xu211nAr3Tpgqu7Ht9LiCmSh5PN
	Q6DCfOfVQvd4pdrJR6JZidPTifya+p3gJg0XUx/cr83/ZAdKMdOnTBChJlCuxhdUR
X-Received: by 2002:aa7:9067:0:b0:846:1b9:cb63 with SMTP id d2e1a72fcca58-8484356de46mr5839163b3a.62.1783569687912;
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm7868309b3a.46.2026.07.08.21.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
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
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
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
Subject: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
Date: Thu,  9 Jul 2026 12:00:23 +0800
Message-ID: <20260709040027.958400-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both K1 and K3 needs to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index e22ecbd09579..31aac056b68e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -56,6 +56,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

