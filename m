Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17C486415
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161678; cv=none; b=CQ2xsoq++LvtLXsebHlHctr9y4bVYASIRxoxo3hrbNgfY2ZnKCKVnIZt3OY1wDBzNw850LxjmRmZ8RSwySANYCwgWk7h835xatwBSdiUzQPdIC+umptpCFlmBxy2refiDebrEsHIHM0SiMgH6sR65IZgcSz78nCbA9SubwLB7hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161678; c=relaxed/simple;
	bh=VB6oO/0/aP3anKWJoqBgbBJ4sY9p6fnK67zg5+eEZ9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glHzkmhfQ03/ylE73sMDSWKWDwW637s4HWRAghxC0FQE0SGuup8gs3TR5TUIOzXDmzkEdPBI9Pb35Gh/utTWLUnKa1ngMDDzilUcXV5CgVMtbclrVGPQbVqXcZNTh7PoCYXG6yw9PF8EFdTt+VpleLac+hVriftptzL/lg7Xsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8p1HoRn; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8p1HoRn"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so60830666b.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161675; x=1789766475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=k8p1HoRnaGyXp+rSHR6w231YkQr6zotPCEiEI+9LkJo4tw3BLSbRwXJczGJ4O6AEeY
         jzd0dHadFRpY+Xpa/9mWeHSLwASSjxskzZ9T4wadLOIyDA3CJaELTayKRKdfMLuRTLan
         oD+H/tVZ38cGGHPYLA/RiJGnxjauMOLOIEZRom6rbeq4Ku801xP7VKVW31IHg6/ZW3YD
         eyWo6FLfjC5Tvd2AHpwqmtdq335afqPX2znZanTy7e5JzskdSDIgOJeEKKY+BTQAci5x
         aHK/HI+HIZKDgHYER6EInSDuEc5tLitvLtwURe5px5ww+xdI2zti25Tu1iw53iLCleFe
         gjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161675; x=1789766475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvm+btPrQRBTuu8+5mSNLZIT1wcR2MM1QR5DtKY3sJA=;
        b=m87Ez+5O1BvQtaprwhXhzpRNKp+7tVVGn3DsE4yvVnf2+/6qjMKFmNNA6Ye/g/BDbp
         VxQuGaKVqrY47VuwkoSnhVDR7/JHj4vZannlGh4Ntq+33Z/HOtgZs8Od496cmNO/klLA
         6TWm6IkF5SiyqCxP17OqgaRrc4yb5eGV9gRjS9Qq15NTKfH/LsaMjnLSvLLyf/UxFIG2
         oIu0Kp19L71petQAk1N/G3N4as/CEAC4JvjyIraOVo+xA1wV9BbJW0wlxYWTpK0VApVu
         Jcw3WrjudLB+fgCbxX6K/4AClViXm09zy9Hf76yBF+66USNjNkai73F6ysA0OwHTHMFf
         aDvg==
X-Forwarded-Encrypted: i=1; AKwUvBw5MTOTtAid+m9mSveJY3LCMVCm2ysD9+ppnqtp7SNIPSE8GJb58Y54Dze1PYd5bn1Kq0yDo+G7NQkd@vger.kernel.org
X-Gm-Message-State: AFuF++kDWqGNtlWmL7Dn9as7eJX2jIOAdyap505xw2VOrZiASx+MXV6R
	Z/0NnWj+v9HNtWyf4aEzoz7DrlLSWYanZpeHQJYe+Cxf8/vMQsIaNGA/SY6AovTDjkI=
X-Gm-Gg: AYBFou0Tc5zemX6Ug+ULDz13o9WgpjXJFVrExAbutpTdk7phP+6gmzSy5Ds3yUZqd17
	5J5U4MElvxXVbRwoyPWh4sNHfj/heNH/lu9FedT6A34j++B8SpVwQzoyVZ1mAH5oc2L3i3CTC0i
	VIKdyjVECTiWupOGlvECCxgbsNmQ/qx53IjGGMU7NFZfXvI8dv7tZ1l3Y4wLxTMchyFKrXOtbSk
	Y7SZI6DA7g0pOgIlTaYuZNyojk1WWqulq3rBOC692grxk7nNx54Vttg5P85G5vmDTLF1qjfQ1FZ
	N7pai/Jahpx4V2Y+n1erIg6asyWgyWGlS8UT/Oms48K2YDcvYsHLUYT+u3gyKyipz/9zvaEo+Z9
	ARnQrEIeXBEdaoiYz8tUOpK4EXaKMWfHQmd3deuIqL1P2kAyVtYWU78Gzc9aO+HTfpPU+vfhoqY
	ZuEVMWpDvsvb5TfODFNMmwRQXQek/6GdHyVZ9xgdfkOI/UkheaMw2HFnO64/Y8W/SsCnfOs4i+B
	tYXFkGPIQaDeajkWFlzBRYo7syKM6s+T33tipe7HGozHpIT+hZtGBhcq/3itBWHxA==
X-Received: by 2002:a17:907:6d0f:b0:c25:1b4f:6d95 with SMTP id a640c23a62f3a-c296650ef6bmr266540666b.6.1789161675053;
        Fri, 11 Sep 2026 14:21:15 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Sep 2026 21:21:06 +0000
Subject: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5946;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=VB6oO/0/aP3anKWJoqBgbBJ4sY9p6fnK67zg5+eEZ9M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHzEijWCf5mE/ywG6gZ00CigmowyI36StKG
 HawX3dSwmWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 unoJD/9g5EpIQMsuKWJGdcGUJ/1Q3cLmc5iRMaXFcXKRRNNlmQyfwhjwmdzrUqjc/GzrWrWRqFA
 mk9NTrlWN0G/ZnnfBltZmYjJxgnqcEKXQo0SjN5kG0q2kvr40lu/nlbzx0rX0nxK+UVKfXeiHPY
 ttvXD+QErU05cm5EOIJXOiarJ5rCk+9UeDfdLBjmdn+T7wL2nfuEXW3kNAiTpY+JFyzL3skLOtk
 cnaLW7wXEL0TO6dBFtT5EzeXlF50ayjk31yafAiv08ncNMaO8OkO5FjKpay69TklnRP6Cw0a6Yz
 BPOYvVNiGRV+Al4hDtGlvrsC42hrfP6ct9ByLxOuR8Q9O5aME5HXCk/q6vrlmsbK2HYxSU/kmsj
 i1Y0a3zBceTr/GDtEijxlo1X89vAb31W6Mpixr80/KgpO4UHrNXZJB3Dmd7nydt7z/yUpzfuznz
 xPJNBPniX7Mz6XLciY4Nb9dev99DHTpFTw97okrfPUg3VmkVjDFixKYoA0/05SHz4yFVWk2g0cF
 R+x4kfEGIk+j3b34vAArwX46HNB8O57zU2FF3q9pms/VU+ulA7eYMXVDItuC6Bh1athAkXoO+V5
 4X9EPSOmO8ncYqj9VzhXH80guhjWpBeBHnCs4pPcoZp9SzM0ZTmSE6B5wpCCistAkcs59xTyuRO
 W5m1PFSqOy2/Ivg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
integration where the AxPROT[2] signal is always 1, which makes all
transactions appear as instructions.

To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
unprivilieged writable buffers are treated as Privileged Execute-Never
(PXN)), as a software workaround we make use of the INSTCFG override
feature to force all incoming traffic to data.

To enable this workaround, the "arm,instdata-override" DT property can be
provided in the device tree entry for the SMMU, similar to how existing
errata workarounds are handled by this driver.

Note this is added for "stage-1" and "stage-2" but we intentionally leave
out "bypass" as nothing is downstream of the SMMU that makes use of the
Instruction/Data attribute.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
[peter.griffin: ported to upstream, updated commit message, remove
feature flag]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
 - Fixup incorrect bracket (Sashiko / Nicolin)
 - Add more verbose description of the issue (Will/Robin)
 - Add note about why "bypass" is not required (Nicolin)
 - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
 - Move check closer to IDR1_ATTR_TYPES_OVR read
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122d..f88647be94475 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -91,6 +91,7 @@ DEFINE_MUTEX(arm_smmu_asid_lock);
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
+	{ ARM_SMMU_OPT_OVR_INSTCFG_DATA, "arm,instdata-override"},
 	{ 0, NULL},
 };
 
@@ -1271,7 +1272,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1287,7 +1289,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
+				    STRTAB_STE_1_INSTCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1900,7 +1903,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
 			 STRTAB_STE_1_S1STALLD :
 			 0) |
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if ((smmu->features & ARM_SMMU_FEAT_ATTR_TYPES_OVR) &&
 	    s1dss == STRTAB_STE_1_S1DSS_BYPASS)
@@ -1952,7 +1959,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 
 	target->data[1] = cpu_to_le64(
 		FIELD_PREP(STRTAB_STE_1_EATS,
-			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
+			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
+		FIELD_PREP(STRTAB_STE_1_INSTCFG,
+			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
+				   STRTAB_STE_1_INSTCFG_DATA :
+				   STRTAB_STE_1_INSTCFG_INCOMING));
 
 	if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_S2FWB)
 		target->data[1] |= cpu_to_le64(STRTAB_STE_1_S2FWB);
@@ -5155,6 +5166,12 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
+	if ((smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA) &&
+	    !(reg & IDR1_ATTR_PERMS_OVR)) {
+		dev_err(smmu->dev, "Inst/Data attribute override not supported\n");
+		return -ENXIO;
+	}
+
 	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
 					     FIELD_GET(IDR1_CMDQS, reg));
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd2fee2f560e6..efbac8ca6d7a0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -52,6 +52,7 @@ struct arm_vsmmu;
 #define IDR1_QUEUES_PRESET		(1 << 29)
 #define IDR1_REL			(1 << 28)
 #define IDR1_ATTR_TYPES_OVR		(1 << 27)
+#define IDR1_ATTR_PERMS_OVR		(1 << 26)
 #define IDR1_CMDQS			GENMASK(25, 21)
 #define IDR1_EVTQS			GENMASK(20, 16)
 #define IDR1_PRIQS			GENMASK(15, 11)
@@ -285,6 +286,10 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_SHCFG		GENMASK_ULL(45, 44)
 #define STRTAB_STE_1_SHCFG_INCOMING	1UL
 
+#define STRTAB_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define STRTAB_STE_1_INSTCFG_INCOMING	0UL
+#define STRTAB_STE_1_INSTCFG_DATA	2UL
+
 #define STRTAB_STE_2_S2VMID		GENMASK_ULL(15, 0)
 #define STRTAB_STE_2_VTCR		GENMASK_ULL(50, 32)
 #define STRTAB_STE_2_VTCR_S2T0SZ	GENMASK_ULL(5, 0)
@@ -934,6 +939,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
+#define ARM_SMMU_OPT_OVR_INSTCFG_DATA	(1 << 5)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;

-- 
2.55.0.1007.g17ff1f9808-goog

