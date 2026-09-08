Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825349892A
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903309; cv=none; b=mqoYrDeIY+QbUo474wX94k0OEuJN6828p7R+7XpHOUr+umP2HK4x7TwLXebUyC5exlj6+kblN24BnpDqgeOUHmqaMarDhEn4ROgCvrUm0lgU8qY4CmlKfdvgWdVArIpDEzldwrGw2ssM8IceAUZk/LgdDxJQVpHKZFp+8ulHorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903309; c=relaxed/simple;
	bh=dSVFMgBYNWS5F0FgVH/G2sJcIm/aUqTCSZVMKsCMKP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1UFjJk6+aK48rr3NSbudjRKCQszt+gI/WkRqsqC5RId1st6dRfzkpmlBJpJzf3T01PLwqblNdhZizxGXikKowDl7OvFuG4bKoZJg0eVx9nRUyfq1LpRr4lGj/RfehnDuuow00DHBSfrSCxdwNWl1hFqMywvlEMSmwXv4WMua0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hzGNbWvq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hzGNbWvq"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92f0b5ed131so598607985a.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788903305; x=1789508105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbp0io90tD3hLKOmsDGrt9wIS9lt0GeXuRra07vYj6c=;
        b=hzGNbWvqQdA3RLBIXdrv8A8irGa6WhQiYcnlQ879HmC2FD7momMTDkshU9Em6schzf
         wi7d0OK4sSa/Gg3fj0e2gBPOKSdM0jlN7yHHTJ+eXzKnHNKjccoLQ+812GHueiZ7dJzD
         XONmiXZ0Mnjk4QSDANfTA/Wu1HH8h9JN6+bSwv3eTr5hFAzWjCNYklqcEAbAyZdyAOaf
         vIJol0Ba7l7UcOL/Q10BQMv7oDU+7rswPlxAxGWM1117MdKyV/+5ZtJhcFaBCRup0y7D
         a4ppzISlbW+EW6eY+7QNDlWNzTnm6afNqSkwezJtq/jSIgjFTXSKJV/pAptkc3HAUktx
         xudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903305; x=1789508105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbp0io90tD3hLKOmsDGrt9wIS9lt0GeXuRra07vYj6c=;
        b=sARyzKdSTABAk9CFxev0n/ifowYVX+WIGY5Ez03m3J7aOyI5VYtAIPPKepwbVkGkyU
         c5srKWeW9YhjVQ2X+fBWfNPMnfA4K8NFqB1vyOGqon2ImO5nG31/toS7RsfQpVpxw2LV
         gRyfcPaSraNu7j5iDLxdtGg8XctW6vL4sxqqa2RpWlEFKXBEvCzOkApm61KQ36zJUY7A
         M+Y9Zyrl5BOkb/tqVp8xgkYPUrAfV35u2SuDAXrBg7enEStN2GgbyBcE/7RaZB39X3Nr
         H4ioap+5HFFMvK7i4TIIirGIWhLO4dqT5e9pJgHfPfapAKNJwYck73oS6zKxshbFKBIz
         RTkQ==
X-Forwarded-Encrypted: i=1; AKwUvByjukCGzDo0zJwsUGa3Q2bCBbmwZ3zEDquTP4e7ZwHdc771QV5UJo3sUxdJzklB47flKyNyVdzcm8H+@vger.kernel.org
X-Gm-Message-State: AFuF++mvAFUHzXADGggY2YO0FRTd3XVf0MiNT13Wrbf9lXesl5aRzF67
	BCQOfe+wzPdmC592rWpgcZWopsuYXsZuskd3uVW2+JVIhFtaSAK/OBxRGtfVUparjKY=
X-Gm-Gg: AYBFou2+6zZwsyo13DQRMILJMV1jEw31GtDo6xuN8LY/9KwuVHF8Oxh+NwfcNECS0HY
	Nu5YGpRTfZJZVPD3Mjap35PVTIbvSZs2geFWHm4ZnU+VxRN+kYr3PjrCVEs6tktam9/MYAkWwxM
	Ma9OFrSN7t9Zcr+r6raRknDkYIuzDbx6eEoP1zyyoadL8ezv18pUQ4+g3tB7BSC1FmFZ1QsNWQD
	EKsq0LLlhgRkPeamlIihZQj40ayV+8OavcQ7HHrmpQrxLmef9Ye3yl8xCIO+th/5Fxm0Y7n4rIJ
	v+zm90e0KeiQmZBuFEE7xWKnGLbXgkE9tXtdxTf9r2cKSxTtgLNTWDKw+G+NionA8+5B2gXNXhq
	8dnry6qlVpH561nBNwrgvFGuus/srRQ+ywhQb4SwqyOL53tX7q7sDtXajxFraHeud1yuChV5rJH
	lTuzmkJIL+o5t6M8YIVsYUR3iwUiN/le3altLZ+GhXWU+A7A3WthEGYWpOZ8ohk/Ma6HGNeNc+6
	88=
X-Received: by 2002:a05:620a:8083:b0:932:df7e:b31d with SMTP id af79cd13be357-9398034162amr3348906385a.12.1788903305398;
        Tue, 08 Sep 2026 14:35:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f0734sm1250497885a.4.2026.09.08.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:35:05 -0700 (PDT)
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
Subject: [PATCH v5 2/4] PCI: of: drop the reg_num argument to of_pci_set_address()
Date: Tue,  8 Sep 2026 16:34:56 -0500
Message-ID: <20260908213459.2519059-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908213459.2519059-1-elder@riscstar.com>
References: <20260908213459.2519059-1-elder@riscstar.com>
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
index d66c702218081..1caabbd4c18b5 100644
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

