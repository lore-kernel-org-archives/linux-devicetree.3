Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7941EFF8D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044049; cv=none; b=u1G5qv6OroAFQHstnew7LMiX468Etd/aSGBH8s0Vq99BN7rLRxB4yFG1nnhCtjJBDL6V8FugxmrFmZ/dxxltRi7q7MkbCMEFFOsHRGrTiIKvISf9oNoj3eCu8imsLiRDyhwTX0mT8+WXKP5SyT3BwzeXaSDuGbk84OXOgH99fI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044049; c=relaxed/simple;
	bh=jCP5Zz2e1jsHNyBDmkkcnVgytoZly9neC/WVj1uD+uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I843b03Loc390MlLw2DluAcCeNBqHHCtZ5VTkkMJWuj8Z7AX41CSrfiChVrMBPvOy4cS0Ju+zwAS+ijf3hDfJ7yhCQo8fCE/TA4Ytkip9mwv9lLek5/nusznWeS7Kb9OiDSE3sKF4peJml6bo+FR50zwRGJAeV4DknqPVeK7fAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaEkLTDW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaEkLTDW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so27111a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044047; x=1783648847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=PaEkLTDW/PSalIsY2SIoHIHGK3kdy+02ahesagKFNq2bESVNTBJzOGyXhH+jYFaJiM
         9Ql9hQSYTBrUHukuvHFLochYSkFBEcfuQBFp3NKjGy3KDIUJPhNPLxynDdshMzwKidkI
         4dsrWx5j5zf/H3mLM101RgLP2MYHm7QN/s2CrSAk8T+edqS/cpAnNHiviJCRpsI0tVOU
         EH0Gu0Vf84kxPXqSe/YNP0FhTZrHUK9r4nCV1+SBt6YzK6yydqqVa3rrjDKWvHgLurFa
         VKwg106i/1VrEWxU7hA4s5sTBaNfh8IGWkbjLdtnm4T+s64zD7tsrdTFr2qOoFpUMNr7
         525g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044047; x=1783648847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=HTvKPT80fb5Gue/AbXFXcjSjH9r2G1y+s1A/fOvvSNt/Yva0Cw8a0GyHGxqg6Mid26
         AXj/FfNxYGCRYRUoDaTr/fnp9vHgT4wlXMmf9Lkg4XV0zVlQyZEiStykRyppoQHbuqYN
         V5uPDQfL7zmLO0Rpei/DisEv8F0awWpBgTh48SfoT+1Wf0BLTvrnp7Q/BLzc2s9lOGWr
         aRt8sTFE/TqZstyfueMuDrgzBUP8q/nmkUXErifwdFl3N8eUR5jF+z6ivEOkjl88jBcD
         gSI7TWjyueJkTwuan3sdpanRZdOq8RGqTIUyf5j8ARaUjgH2xqH5hEZzYSmvsm7OHwPr
         l+Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/ArpolDeNFoL04gVPTQhvld7z4AqfXCnLKfjxc88LUNdmdEVrhxtOosTTP7VzRaYFEqOg0kCLedaNY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwyNvZMzhHMX/+n3S2F/eLDi2qeny/RqWkMEZl5ZY8pAvPyq3F
	9tOToTpioa2nKV881cxZzqccasSETsQ7vNRoc3ucLJ7RZVyYCmm62d1M
X-Gm-Gg: AfdE7cmk6+iDcL+xoDSgJfL9Re6PBiM7vehSHLl4uBjI8P06D8HyTkE0YefqlAI1dze
	KDQD6cB2KdvGU44Lu0SqPMZjwsHNwo8H8xnL4Sv3fDXMcJ1esn73FbwDh3c2b2TU+MPSeCIf6yt
	upWc3qdk7hUYl0U45J8PWWqX3b/uZm5bF5Mx6EbCCHdj4Ip5ppFnP9L1llWg5gQC2ZTkujTKXai
	zSYSRjIIHN8Tz4T5OQugSDs9veLaysH6OIHvEoLMde7irctlGnMAZ5Fs13/IvZkUe5sIEFqACk0
	xV7SiOTO63dYAhaPVsKkh40kJ74To3FbQd2dMfVBrErsetcGejjR0PNV9YdmMkV8EqnqqnCwsnA
	V1Fon1Lmo3wVEzMEmXl17QuUSghO7aNhOWO/tKvwlFxqs6sc/+PaN5RAZod7lWQ3b8cf8y4IewZ
	8asbaN5UA3t8w=
X-Received: by 2002:a05:6a20:c98b:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3bff4038a89mr8316617637.1.1783044047021;
        Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2024844a12.9.2026.07.02.19.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:46 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 3/6] PCI: spacemit-k1: Add device id update helper
Date: Fri,  3 Jul 2026 09:59:59 +0800
Message-ID: <20260703020003.485436-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
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

