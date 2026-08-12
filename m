Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA6480357
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555377; cv=none; b=R2Lk2SKAlKNqXDRaYUeHY+Gro8HkkCaaYtxXCbOEpMVcj9xvj1a6NtmHDcxvuyMpVd3i+Q4QCXuamk6hjIB/WIgdxpTlEK+KB3g1NJMXoxgTJhG3vYTp0S1K7Gu92E/99FV2Ei/Kn57bf9A/rzVHu2CkoAynsUjmqBafR3QVBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555377; c=relaxed/simple;
	bh=6MU93lD7oPCvVgWA1NeStXtYPktufCBo3mj6HDbyAGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLYOgfuEHDFIhHMFbW8OH6G95n0ENOWQYq4DcRRrAMaSaLh5Yca/7LlOoBucdDoWnt2y5w90n+e2zbMfrDivy4nPEnzrA58nhmEGErbnJ5caOfAesvwwoI6MLrtASqrLr+X5G6T4BK8o3B90awhER0Sy8L3AIoAFABlCm5CULtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z+qUtLgx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z+qUtLgx"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-934974844ffso86886585a.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786555374; x=1787160174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y08cvUPAERT8DtacgubgZYXObs4Ve5NXsThRcrzdsK4=;
        b=Z+qUtLgx+oq9V3oy0k6sRn8V1y8xOMf0dg+auyyVCU65P7e3OjOVgxr/n0H/S8J2mA
         CikliHIfztA0Bl2QQdU1L+r1/x0Uslr6fTQcZlzpfaQfZ0+qA+IPQtx1+GYtvZpVlWSm
         l/FgB+3gr5j7omazItHXkCFUJ55LxCG/A4f8JpJI3gBtQEAz5ZNslU6kgJcjMe/fAKkv
         JP7GvSYZtJj7RshSPdf3L84NY4TCPyd7ySeZykJirKra+xyAOUU3VLWhvDKMgM0Dy9RQ
         XLp5B+0wjss/0xOQtHTpikT/JbY8wctqm6sRKHLeQs/bx6b3ZmCeM2M180ofg30c2NlT
         dKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555374; x=1787160174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y08cvUPAERT8DtacgubgZYXObs4Ve5NXsThRcrzdsK4=;
        b=BXhsQDFpwK6YVOezVYW/kKI6YCsCfk1x9nYqpuweG5ZOFEPq+wc030o+nduZj0jgno
         f4SiOPIgF2BjtdUEMCYaSMtJbGxtlNrspuCmcAsZN1PZiFl0tV3Wo+oB9LZOWacPtSKB
         gae7QUGy8yrCbdJMIMp0MsPR+iJsENZ3kI9URgb8CuRIAC9kgxdr9Kd1UtLahdUvBsFy
         rjqWDoF4Ik5oiDbfTc2+u3/2REUHkTQw2IsLIQeeNbqFRAUfzqP7NS8PF+M7q3v10KwF
         2JcCCgrYcig8mK15N/okCzX9AQzNxp6Wy6Lzv5Bz9C01Mu4cridnDX4YHxjI3nQ2WLo9
         UddQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9WtsmtOwa1ptfaX5fgl+M84ggeKZNouhU/ZBAG8ueVaONjpJKmS4wd3j8OwANgkT36ohsTCgP+9Qw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2tb8IMr/0ff7KV9C0S/oDiZOp/qjKjy3oesBz50AT3euIrR2
	qzuQUvzk6JOea7azQ2GMDxQTVK+Fg20Q8hcL8ZL1t8BLxmWixCH0n3Zx0lCvlvqWZ6w=
X-Gm-Gg: AR+sD10j0Vf1SA8cBe6JUe9Az9C4WrBzkKdx+b5QkH2L6r4lcaDbUtRvS3KG1Glncbp
	pgBpz1cfu/m0UcCikGPUqIojg8hdpbGHfk9/HJC21ocsDyx2VzPIqy3QdXFccIS7uLT/QPdWAYP
	auuJstPslka8S9UrwCQXGRKWFSrusDECilaQfTj7UYc1agaiFPS1WL3qaTboeESlyMaDBEmR1ko
	bKsirhGCk21wJy/uXGR1tOV+zydCWMWNMXT082eedqn31nFmGPupQ+WvPJjZwqNuyw8sCVZLrAP
	AHUvgVebVOV8YJrhGqzsFxtMt2tTTEDZe6MHCFWJCtHAMzF2CkgopxF8J4RSplTUDHiOwhH+oGe
	qvJBxsCcgkjbeo94n+urh8WQEx5pm9WOjzdBTJIYFY+AiFVqdpn3vbkEGYnv2QcaTc7EQOztvCC
	POeWafZWShQHxTO8PEcDjIIMO1MJz/wH317Qv1znO5nvRebWYIP8fJo6L+EVEyehdg
X-Received: by 2002:a05:620a:4710:b0:930:fbdd:c242 with SMTP id af79cd13be357-936b3d241eamr541326885a.29.1786555374150;
        Wed, 12 Aug 2026 10:22:54 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f720eesm173587685a.47.2026.08.12.10.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/4] PCI: of: drop the reg_num argument to of_pci_set_address()
Date: Wed, 12 Aug 2026 12:22:44 -0500
Message-ID: <20260812172247.276554-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812172247.276554-1-elder@riscstar.com>
References: <20260812172247.276554-1-elder@riscstar.com>
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
index 75a358f73e694..505226b876c56 100644
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
@@ -458,7 +458,7 @@ static int of_pci_host_bridge_prop_ranges(struct pci_host_bridge *bridge,
 		/* PCI bus address */
 		val64 = res->start;
 		of_pci_set_address(NULL, &ranges[ranges_sz],
-				   val64 - window->offset, 0, flags, false);
+				   val64 - window->offset, flags, false);
 		ranges_sz += OF_PCI_ADDRESS_CELLS;
 
 		/* Host bus address */
-- 
2.53.0

