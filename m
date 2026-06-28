Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D644372EC0
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782688320; cv=none; b=FEc3+S3LMrdh7sCKxganztz+abXfnhuO2RhDYxflNoEufRU8iuTFYb2rcjIHR6SHzg/MMv7CUlf3j5pVOtCcbeBOlz5rRanfO0h4xtouIdFf0Uj5twuY7x6oHgCX7kMsrcssY6O8vTb3zwC4Kar4qhppoJWZdn1YzteofnLM6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782688320; c=relaxed/simple;
	bh=CvHPMDa7QE/yHwktpTxBRGqeWFMmQqfmtrdztWRRuvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngoZUyMQSfz2jFDn09XyuZrV8ct33aQMGT2tOtBVw2+zcWNKXFXMcF3aaIKTbn5/+nKlVaoGTMVV5C6NOlUcZzpQr2Wddt9n5Ut6Ekt0spK8YDMNY8zIKZgoJZjy8WX6OePvBKBYPlEhoGBD/tjGweeJUv9kdQfP1We/5bxpTW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgiTZzpT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgiTZzpT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84780c95e2eso175952b3a.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782688319; x=1783293119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBzVoiVEKC6YZTZ3TI4LBB+zvfVWnbKnaW6nuLVCnqQ=;
        b=jgiTZzpTh7yPALwYj+Zody76pGsWBO9on7JwJMPWyJ5ytptVTtvTQDceRExb5T1K59
         tD3/7kH5eQwv441LBAQqEQgMHSY/Y1Cc0Pk7iTjY/uzs5w/Uy6X33rDrkrfMjSfin5kq
         Hgx9trQBRGmtd8HG7tffsiELLsJEmxO1gn2+e8q9bUIv/Z8LvNbOpAI9CjFNMSI5vQHF
         VoNNaUoPNaBpnD4hVLIQX7ugkkqtbQ6UUpSBtSPvFKLv6qb74TAfkaXGZTNcymFEL3Lm
         j/QknfK6CD4zzvbz+epydo6LcyV8GhvvrdgeyEPkuwKNuMedptYWGnXYTekyF/tsbE/t
         SI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782688319; x=1783293119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBzVoiVEKC6YZTZ3TI4LBB+zvfVWnbKnaW6nuLVCnqQ=;
        b=SXQGRKVU5sZNaNpU3SqgVe5m2l26iou1IXwd0Sc9jBWDMu3vl1xfLRn7QYuYzkezw0
         hffJQ/6kgQgDq7uILQ0hZ0JxWWTHrWsbQd+CdrEgTYPCZi0HXtlG5nXN5ZdrB6ZRHaAG
         PFtc6dokmbhi13NYLOb///yum7eHYoePpHho07J8X96KvdANIRYE17HEoWbQaZH20oPL
         BwNcpsyo5O+EOnG9VG0XxGTD6uIujrVX5akaeqqXGaV2jk3aEOK8sQ7uVI0Z9dCsN5Gj
         9N+LQ4JuN2dxHHemfoKi/2BqoszeGeN1fUh62WqExG508flrJnWfw8KLKhrtbdAluGMa
         CQKA==
X-Gm-Message-State: AOJu0YxPRcoCiJj8iKCGMbCBGFSDzmsDdozRvCNb8afAZAjIaLDX4ys7
	OEp2ZoxDnvlOxTzu2AMX2c2IVSHgX1jnGe9FKgOkNIVtLWo2aU0xY+ug7Eiq5A==
X-Gm-Gg: AfdE7clw2tfYeE7q/TQWqfSeCafcMC5EFDJOHy7iDMOOESHHEIs6CxD4zqkhMCNheF0
	pQuujhqxpEBlYEjc+BUfd4rkvFzudN9V8MNDKLFPsbHefKqxydeAXDCpibalFk8v1wc8o9Pe4Uu
	75YW0Joz0gSDSw2IrMgz1ufUTioriXlzLTEzBt3YgMJZMuxVwjAiN1ZTrteKrI02qdPw37zKfby
	B0vVo+Z0xy97cU2iwI3ophukBbOZOsab1n0uUdH8buLy6H1z2GEpVRTUqxu2mfUtKZzZVI0KXzV
	dYmhBKDyc0oBUoBUQOft0RLWEdv6TbxV4Fa7KEhqxiwyWvILnbOXJVzgFf4K8cshRjmaSDgsIqb
	KT6lCVD+SRPufjEAT1zmite1CTYVV8bcKVBHGD8QpE2iJaUxJoEs4TXD92EaMr/Dyw/5hXSEmAj
	/0e+zZsmGs+HYu4YXpOXPcYiD5c7td8PNUgU5xmYRz+t7w8toqwmr5yeoW0Rc2WCRhLgpPEXi/x
	yIkUEnLNA==
X-Received: by 2002:a05:6a00:b90:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-846f517fca4mr2671001b3a.28.1782688318921;
        Sun, 28 Jun 2026 16:11:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm10450263b3a.22.2026.06.28.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:11:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Date: Sun, 28 Jun 2026 16:11:56 -0700
Message-ID: <20260628231156.1254012-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These addresses overlap with DRAM on BCM5301X/BCM470X SoCs, causing the OF
address translation code to route PCIe MMIO accesses through the AXI bus
space instead of directly to memory, breaking PCIe. Remove the extra
ranges to restore the original single-entry mapping that only covers the
AXI peripheral register space.

Assisted-by: opencode:big-pickle
Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index bd52de0faa3e..27a97c8122de 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -95,10 +95,7 @@ L2: cache-controller@22000 {
 	axi@18000000 {
 		compatible = "brcm,bus-axi";
 		reg = <0x18000000 0x1000>;
-		ranges = <0x00000000 0x18000000 0x00100000>,
-			 <0x08000000 0x08000000 0x08000000>,
-			 <0x20000000 0x20000000 0x08000000>,
-			 <0x28000000 0x28000000 0x08000000>;
+		ranges = <0x00000000 0x18000000 0x00100000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-- 
2.54.0

