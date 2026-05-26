Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C904014BB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806545; cv=none; b=Q9rBZcF0xs2lK2uvwe0qmLYXyTbYWNBrh3ZoKqRFueETQc28varklXHZEpBws1PR2XI97jhoZQFqA0h7wep+S9ZhY4ZA115Yiil5LVeGsZiZul1vc6GRMX43Oqwra8HIJ1XTE9XtSfwsxAKzhVwi9YNBQkXnIdcZRp7WV7bsIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806545; c=relaxed/simple;
	bh=enf3+ZPlPMPCTgLbtus14tXkNZXCGM3zYc7lLFmNwZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LugVGa52ncxZrmtB5LIbEZhw7TtsjSrCbcKhgmFoaagTJCcsMejP+YsV+chW5pQM++N/UWZYJEPTJs0GhY+y7AmQBz/MeUsZJXwjau0PPLvRvtY527NZHVwF5J+5ICEnoLCnHaWgUL3eOeNVAbyw4kd94LJTS6KnTclllPmWxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVGcPvTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaFNAfZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVGcPvTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaFNAfZO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhw7h2528525
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=; b=aVGcPvTgv2YSFGEJ
	jbYVspkCi4oJEZxGaLQ0iIXJJ65m+tYsFcMeyM7PdZWtaF0aLa7YaRvl9jtjd6Nd
	Z3eB3OkMTwYHglIlq4Y7rvjqzHEVQTEG+MkxM4DlY+TLbOseicNzPaexP25KdtXz
	HNEvWKc7IDLalyn//AULyBB0UcWBeR7rIBnf4JjjlQKGWfH8IYOGNNP4p782r5FU
	O1/a1beG2N+tuGKHiJoEqg8EI43b15EFR5m5TZzYWn8AKgZPSe9DyO8z1VhwU5jk
	CkIAIsWvdjcGmW4Rp8uvNxHwQy07DbQT7mj3AfqoMV6bu7ru4FyJRzCV1jXc9G8l
	g+DqlA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnr8ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:42:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828659ecd4so4569233a12.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806541; x=1780411341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=;
        b=aaFNAfZOnYMbCzlzYoe72agW1BPsS/Uq0Njfpxu6iLAVoHc0yTpmxIASd3k1vAwwfh
         zSEOvHHvaqLUc/jrtms1Tzp0bS1XcL9rNPkNCmccSS3X6O/gbiJ3GNx85mkcwFovH7Li
         +FdioKwjkxkYiWAXxZiJQGdfVOhuLdsn6Y2lcgMV8cX7wC6i5NRPnDyLKW89j5whG5pg
         686u1hrJeHE9JUoS+zy8Tj8u0VJnPVq1uJkbJSQ7RmxQDOpqqB0utoF4BGRaeW0syazR
         siD8TXPh5vWSXSOWIKIpEcu4fuj1MOUKrG0qSM/mcECUoUITUx/HZbbqrPNauuSdDT9G
         AUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806541; x=1780411341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=;
        b=iuApxHE6TfRzn/yd+V+CpWYWD4dUbrxYkB5z7jKIJewpBZO0Wy/QTY5kCFIn1HNPlO
         tlrIwH8b+ru0wJkcA+rsFtJA8hSCIHuY0vJQvbHuJlFLgK4cR5xXStqVokUh4eUkiZ0A
         Q1SZmQier2lr8wnxwWaeubrrMCg6NmocvOCgtubtTa/SpWQHKQ3zM0/j9A02Me+dxhox
         nNMRJCcFx1LPpgPvw36VGe9YNxWhf/DXy4LC3tTElNHNM0eU3S3k0gZG4SKa6rZWVByN
         woSzy2jhmAY427tQg+4oFYnyzH8QMAmZYmK2za2QEf8xFQodq6Yrg/ivfTWrY9Nr4fWg
         dx6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WHtx6aGk6Sco99s+Qnc0AWroyEtxGJcINpxLFlwQW81UWnqYpORkyMGQQNaQ1yaSs5nwVYtHO6nA7@vger.kernel.org
X-Gm-Message-State: AOJu0YxnyPg3BTPGF/aErWksIulVb7w1lZxicV5qnlSSPDjaAqHnosnB
	y4oH+jpG3V+budGT15RRLYQHVnwDy7Up5lt/Bs/64ir6RCdVa7Au2FTYfrTuPsIE9Z4UzPwoFX4
	crUiLZKxEjDeqzVk7mFl3Ol0q/DggQ0ABsCS732ef4qP2vQvO1t2MkOZAfB8GUmMI
X-Gm-Gg: Acq92OEZzq1/OkKzvMgFmLnpytdrxJR7ZcgNoYgIrKRuKNO97AJSppSkkrdf74QPp2g
	XC6dnqOrP5WLYjNKAXe51piQlfyd5+df0AuMVAGISJeZEUoY9f9FtI8KZg/lPdDCAfNJb5Ku6oL
	AKo5ZpV/1JL+ok4L6UUnVolpuZsxbeHQyzjwApydQ3eimuArtXRz8aIrz3yiY/igTZXENvtXeUc
	QaKDq+ms1xciIgcuxwptA6E7fJlM+aIMeTje36lOjo27zgP0co9QXjDAI8/ZIW/BOQI3/RFOb8v
	9lt/8b2fYue1E1Ak/u0YUlqx3AC4QqavLKIdZNC5aSuMU29/TWL4CybCtb15WJ9G7TfhXm0uao0
	aJBodIagHA7jhviDCUYcmQNlid9FF5OiaTyaK1gscXXIPLiYaeHEm
X-Received: by 2002:a05:6a00:8c10:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-8415f6e8fc0mr17753522b3a.45.1779806540976;
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c10:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-8415f6e8fc0mr17753487b3a.45.1779806540473;
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:03 +0530
Subject: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=5501;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=enf3+ZPlPMPCTgLbtus14tXkNZXCGM3zYc7lLFmNwZ8=;
 b=5d3nHDhy04hWjF4+t0oXqcQisvn2D3hkiltQR8u/D4ZOaNXWUXZ+Dx8dm99JGymfCvg4snhA9
 /S+Tl5jz0SfBV0ZP6FN8x/4AJYqKmyAf4mKOb2z1v7X32OMPgJFAoJo
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: LxAwWmf1a9nPccUrZSoj4UbyzVqZrka2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX+9AHld3DnsXg
 0vYWiL3+7XDbyK1aiNgsg7GvC3MZQiIewefmq+A7dasKPmchSCZ2y7hlMMPJZNmPZRopcZAbZNH
 iktOpMjETXMXbawa124qbdzuuyY24Zyh8yqnEOysJlnZx27eVw8h8s7WTQ14j5pMSgOT7f2VTj6
 rCsrR7HP7/Z5tplpNscRiHfNIBCZ+8bUi7srnOT1YX863K/jzD2oG2sfJXoCYkVmhX0puRF2a8S
 meh9egF5jM69pXTU1P4CbT9wnxa/8jUVN7ITqdCv/rP5l4Kq4vlFrbrZ9SchhyxMpfeJan9vOhO
 ysD0/DY1mDJtvssHGCYTOBwHAUidw/F3/iEZgPkBMPinn0auMSLPqmjB6Md8G/7JLGhF2izSeER
 0OO5upIbpGF3QuZQLlmIRSH/QGHcugUvw+4Lml0o4MXhFNHYMYj2gi5q8sVnwwuHwFL0xj2wDSP
 SMEWxoA8AM/bB2EcFfA==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b14e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=taUV0mOn9u7JAoyayg0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: LxAwWmf1a9nPccUrZSoj4UbyzVqZrka2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126

On some SoCs the SMMU registers require an active interconnect
bandwidth vote to be accessible. While other clients typically
satisfy this requirement implicitly, certain corner cases (e.g.
during sleep/wakeup transitions) can leave the SMMU without a
vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently.
(also GDSC is involved in adreno usecases can have an independent vote)

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -53,6 +53,11 @@
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
+/* Interconnect bandwidth vote values for the SMMU register access path */
+#define ARM_SMMU_ICC_AVG_BW		0
+#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
+#define ARM_SMMU_ICC_PEAK_BW_LOW	0
+
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
@@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 	}
 }
 
+static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
+{
+	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (IS_ERR(smmu->icc_path)) {
+		int err = PTR_ERR(smmu->icc_path);
+
+		if (err == -ENODEV) {
+			smmu->icc_path = NULL;
+			return 0;
+		}
+		return dev_err_probe(smmu->dev, err,
+				     "failed to get interconnect path\n");
+	}
+	return 0;
+}
+
+static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_HIGH));
+}
+
+static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_LOW));
+}
+
 static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
 {
 	/*
@@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/*
+	 * Acquire and vote the interconnect path before accessing any SMMU
+	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
+	 */
+	err = arm_smmu_icc_get(smmu);
+	if (err) {
+		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+		return err;
+	}
+	arm_smmu_icc_enable(smmu);
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 
 	if (pm_runtime_enabled(smmu->dev))
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		arm_smmu_icc_disable(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	arm_smmu_icc_enable(smmu);
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		arm_smmu_icc_disable(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
+	arm_smmu_icc_disable(smmu);
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -15,6 +15,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/interconnect.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
@@ -335,6 +336,7 @@ struct arm_smmu_device {
 	int				num_clks;
 	unsigned int			*irqs;
 	struct clk_bulk_data		*clks;
+	struct icc_path			*icc_path;
 
 	spinlock_t			global_sync_lock;
 

-- 
2.34.1

