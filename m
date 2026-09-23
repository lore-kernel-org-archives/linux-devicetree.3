Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADB3655EA
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128282; cv=none; b=EWLKZQtIz/AHQYjVnsYS7NFxS4tGJP344PlGP7Qhad/EPMDbvcXb6t1goN5pXPXWFpffxTYB3/9WDCy//3s8UFG7wzHKRpG3EYA7vwLTIBNpm4fxcKTmVLkb6Wq9sRDODqYdjmvy5+VbGu45FeZd/VwkTR+Fwpx/GXUMxS88Xs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128282; c=relaxed/simple;
	bh=y8V2hkGzlhdb/0KFjTahh6x/FG8XQrgc9cx9Thrw2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8/d7lXx1b8iZd7WLdo9iVFQtvcLWw5P6gQZVR0mnHo//3Scg3l3ipba619O2pdmvaMbXcYSOHBit1dp1dgrFF735BHYJ2n6FdmC1dhVY2srT2dGr3CbD/YCUpYyVtPAjJ1CxKCVMrpJUFw7sFxhc1m+Ll8RLJyt3xhc+7oRZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPIJ0VOx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPIJ0VOx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso318836a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128280; x=1790733080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=qPIJ0VOxQVyo3UFbubKkviQTfnsu1eol8XQ6cj9SRR5SJSc1Go4vX4k1vdeszARmFw
         Cfz9SEy/sJfhM0l7uOB0pnvXdnEyqGtPE4PgJu/67+qPhC5axInQkyrXWXMVs/0p/o31
         E58pmmQ0tog/LEXOEWdyrx49nySDDLAcSHu+eFOHtC4g7C7DaM0oipwo3siW2UyBFBiH
         s2xX3l2JJS5TnQffGDHuNm5IQeN9+8aeioGX+ttgewO32AkuTkidkPTu9oOLfFiTVgym
         IefMQLjx/4WtqofRxcyoGrlteenuYX3R8DYNrAOyTaozCNDs0HWNVhibHJqT1TovYQIO
         pOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128280; x=1790733080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=jeIU1bfKaCyqYGCE+auNx7NDQJxHPIi20EF/kcXlumTBhMWw2Hr5UMPj/O+VW2UZ98
         c1OAnZGPLiS/MQohbhPhVH3qjtuS4PSLHrMMr1hH2w09UbV29TBdkzbtEuzxePxXA7Bi
         eouKIvT2yhAFtcldKTAmHL3P28Du+KUF/HEx9SfSSB8hbUajDKa23dk0SJAbTRewWIJg
         A1TcH4Lpa3oac+dRVaprOwZlMcM6leqMHjivmOUKwXvYIP2ve4eySunwEu6LEVFoeg/a
         fxlLM9rqllnOMma2sM57iZXhaoZoroX01kfZsQ/VS9T+is1/kB/fZdUuHBIfdffGvk2w
         hQpA==
X-Forwarded-Encrypted: i=1; AKwUvBzeQm/E5I2b6wfnQZq7r4MkCQuZxnSemlWyWLOuekMGEXMbywic1OBXXFsuMnwDWBSoFZTe+tqbZBE9@vger.kernel.org
X-Gm-Message-State: AFuF++k3ILDlQcYLlfLi5GhRMlkyZ+I9mdz80bZ/sSL3ipTO+wYgpjcX
	SN825up/zQr+p61TON+DpAHEl5Mb79h5gPieLRu/PJuxUfmJfXpBUiBQ
X-Gm-Gg: AYBFou2R/4+/An9HOeLST3VO+NkizbVzPNZWTaz0C0/Ugn6pdMsE6p8EAQUkiMYts5q
	Z1ucH1pjsJu9l3XbsY/5N9qosbIAejrdDrwzv88DGaf+82n7oUkL8isIERvMiAF8A/hNOW5/mof
	uHgy1L8ldvVpyWhzXbHnyDUh1mj39AeYfOTvyVW0OeNuw/gCtD4Ok0v+LwhDMdge6clBKeEy2L8
	rQqWIRYpDXtoJ1cuPSNC5sNuCESaRcoRspV/xDEqOHqqrM2HaeKSUVmUfMwErgxXyNvA8Cmgwve
	K8q1CTcRVsU0krk4OInG2FKLLn6JbVc1SkMDkP8EQRYCZYLBvZGxVWemxhGr5AdpyDL7taWkPBU
	LfR8zYYJ1Zv9dY5w4R5peSg97LdqzUqtWMKEdCE/Z5Su39vvRbtkxVJ7x8AR5a2Isz6lyvaw+Wq
	+MGeM7Xwr5DxpQtp4f25IqOgh4mWRlvZ3GsshbJ6Sjfz/lgjeEB92ym6ASag==
X-Received: by 2002:a17:90b:3f0e:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-3a07e6563dcmr1112630a91.53.1790128279914;
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a085b5694dsm266746a91.6.2026.09.22.18.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
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
Subject: [PATCH v6 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 23 Sep 2026 09:50:12 +0800
Message-ID: <20260923015016.64069-4-inochiama@gmail.com>
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8c4f0b09fe24..ec59ccb710ec 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -153,6 +154,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
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
@@ -168,10 +179,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -381,6 +389,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0

