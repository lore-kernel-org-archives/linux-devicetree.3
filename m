Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8F4A263C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529576; cv=none; b=SmfKqID0szi6ybgQK7rM2aN9KZZMoZIQddz2ZhsJjwC93nJIi2eq/wTvCKLUPtNJDX8bRXbpB2HeMhF9HT7wyE5O+qwuuRO+qJbgIFcB9iXIkBCSv52SmOoCygfmY8NktVcJLXCi8ZTOHPdJTlRc8YYOnx533icglrx2F8wygeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529576; c=relaxed/simple;
	bh=qsvHvr0KAaevLVLkT3vf4bhPnfL4fka0jjcShl0SAUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYefQywe9XS2LzloFW1LHrzYhCOdYvSmZ3uR3tGxfLplxhBZgcbhGYjnidJtapPKjQalegkGJ5/hyDj6rJSsSJ+qCwLTcKG2/lnV1etILsoFBlSpZDR3K9+QCLzyUVguTysWPbM7N5iTrSY3Mg0lk9gs6ppMO6Qm2ROSAoLAO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pLbOPtA0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pLbOPtA0"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9390f8a1c9eso68596585a.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529573; x=1789134373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LewW6w2wMuYs1hjrl9EfxjaqOnpI7soa/xK2a7NCBI=;
        b=pLbOPtA0ajCFEw/z2Ei4jIQVPT4cSFcNKQgxGO0SwpY8anKsWCpM9gHISyCH0FxcYM
         yKUaMyOKTqo67wQdiWcZuABhvys9EXr1b/G+/3mOVFAtC2ItGC0Ds/+s/ev2XrbIdBJf
         JdxufQfo/bDAUe4BC0m1Lf1/X74MXRbOAqBNnj3y456NTtdaZIZUezZ8Ne+CRX6T8IBr
         UNi1jyzy8L9uGkvWju+ZA5GC+zQ8Jv+GvfomVNbK1aWg7BdsWMaDCJvvT/AH2Se1+Ulh
         2q6sWiOZfvaJuTvhRGiQlhcTUvC3atBGsOVAZtYU5RtIA/G+fm85fzWSZDFvRkpNqmLY
         MLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529573; x=1789134373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LewW6w2wMuYs1hjrl9EfxjaqOnpI7soa/xK2a7NCBI=;
        b=foStd/F0QAy2EzhB54E7+t2QcjolAp/P1Dcr4HMESifVcMpKZ+7KV3ChkFEYwNNbFx
         MiTneZVNs26OxI48h2LvlrPI3t4d7g8ErUTWtrvae3MDmu37mj/lgTqsfEvbVeem4bZ2
         JrT24P8Wqvc+SIdNyme8X/2hJ7/9DbaCy5P+mtNCpcLYc+WLX7dhTbwLqinbZ2qWut5U
         ExfugBfHao+JzEeLkuyswUBGaEBan6G4HjYMim+wlmMQcfXq3HvV4EJjeoo5XJBclXdz
         wX+Fj0eCnfLPFDVGOZpKbkpW3eSJK51N9npvgjdIAdh+qLTQnnAOhGA2Nt/KWtzjCLd8
         +AZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwhRSTBPNTeyNNenxw8XdCbLaWtijbZCP3TgiRgi9Yn90065PkUoiFP4kyvkaBCYA2pMBPQF9GbPAH@vger.kernel.org
X-Gm-Message-State: AFuF++n9XmhBPZ2Wp2hyZ4mpUPsAYfu8q6p65uU+iDe9XCAp08QlAUFC
	DAU37NiJor/ZWbdR4UctQKFkkGZmeaMb0V7m5iuyjFgrjQdyOHKlBM1iPzPyULsmNzw=
X-Gm-Gg: AYBFou09GtkgnVMVNVcyHYyVxs/LgXdMjIG9lQ5HIC2tSRwIevmKKycNScquY7ARj01
	noNrkoaYKsk8Dn8TyXMgQrbgZWaRtHg8iwIkF/GPnbU9N9XauSd9b7vwnFlOq1ldRqiBJrQIAF1
	priBr9jb0Hx5I8W6ZMzmVhpWSMTZ+X7CpJpq+SSYWsGmTV6x4ED4bOOMfjSk7RNI3T+H3hZEtIi
	k0YpM0dlXyhCinFnEzPK1F55TOyorl67MX6VC3f92UXTGgBiqKeypHuuDFe2tIkVrJmq+EHscus
	OzIZZoOXB7CaYA3d11PQIB+V1ZMvXHt9bBHkfgIyneH7IMx2pCRSWANo9LeP1X39/Cot17pn6m4
	ZxYSbd3tXigl8YXNgAYM19k/tCELSbnhU8LuLmTiOO7X73qYLZGNjBq/s4iugBO+Qn+FgyB1BPU
	EARTMvqgChCBSGT9hhOtEdBn+WyIOVFFQX8xgUEuMyHOZR2cJx0YGweDvH97pa3jgJ
X-Received: by 2002:ae9:ee06:0:b0:936:e938:b07a with SMTP id af79cd13be357-9398032898bmr454562185a.8.1788529573342;
        Fri, 04 Sep 2026 06:46:13 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] PCI: of: drop the reg_num argument to of_pci_set_address()
Date: Fri,  4 Sep 2026 08:46:04 -0500
Message-ID: <20260904134607.1856121-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904134607.1856121-1-elder@riscstar.com>
References: <20260904134607.1856121-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reg_num argument passed to of_pci_set_address() is always zero,
so get rid of it.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index a0632f932b5c6..8131aa1b0b3c4 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -52,7 +52,7 @@ enum of_pci_prop_compatible {
 };
 
 static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
-			       u32 reg_num, u32 flags, bool reloc)
+			       u32 flags, bool reloc)
 {
 	if (pdev) {
 		prop[0] = FIELD_PREP(OF_PCI_ADDR_FIELD_BUS, pdev->bus->number) |
@@ -61,7 +61,7 @@ static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
 	} else
 		prop[0] = 0;
 
-	prop[0] |= flags | reg_num;
+	prop[0] |= flags;
 	if (!reloc) {
 		prop[0] |= OF_PCI_ADDR_FIELD_NONRELOC;
 		prop[1] = upper_32_bits(addr);
@@ -131,7 +131,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 			continue;
 
 		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
-		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
+		of_pci_set_address(pdev, rp[i].parent_addr, val64, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
 			memcpy(rp[i].child_addr, rp[i].parent_addr,
@@ -164,7 +164,7 @@ static int of_pci_prop_reg(struct pci_dev *pdev, struct of_changeset *ocs,
 	struct of_pci_addr_pair reg = { 0 };
 
 	/* configuration space */
-	of_pci_set_address(pdev, reg.phys_addr, 0, 0, 0, true);
+	of_pci_set_address(pdev, reg.phys_addr, 0, 0, true);
 
 	return of_changeset_add_prop_u32_array(ocs, np, "reg", (u32 *)&reg,
 					       sizeof(reg) / sizeof(u32));
@@ -467,7 +467,7 @@ static int of_pci_host_bridge_prop_ranges(struct pci_host_bridge *bridge,
 		/* PCI bus address */
 		val64 = res->start;
 		of_pci_set_address(NULL, &ranges[ranges_sz],
-				   val64 - window->offset, 0, flags, false);
+				   val64 - window->offset, flags, false);
 		ranges_sz += OF_PCI_ADDRESS_CELLS;
 
 		/* Host bus address */
-- 
2.53.0

