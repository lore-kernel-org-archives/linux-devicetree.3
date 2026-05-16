Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325F3D47B2
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934869; cv=none; b=ITZQ9bGi0XKSlQ01A3iVRzErB+wzrQLzSqspVSNvYe+sAeorDBSWziYuIzBbEhbYgNQGyT1QcU1JNZ6WEzrwEswiyTDyE4lDGhAoF+t4dFDCZzkPnuNjsN8myZdF1bQ4D23YkhxPSCGIDA0FIy6s3aFMBhQDl7ocTXU2FK+uays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934869; c=relaxed/simple;
	bh=TpMlPRysp3w2m+ZFi+sTeXE10yR8wAdZPz/OYCwHJZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQ2nPzk2o+PcIZH03Mquy5kbJ4nR4RYlFShdpzQAoD9NFx9+6H0bJPeLRGM7JeN4p2A+lUEs/sgf/daRc09fXioivuqPenqDCDeao1rNYlzIBcNOQWBBG9gxcKWjhHfJMqHzCxny4M4RTliiCj0fQfOuje8ci5esRi8m3DShVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THkNH11J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxhON8Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THkNH11J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxhON8Do"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4lpCq2863050
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=; b=THkNH11JahRpcOQh
	cgkOrfRZ1nJ+n25nkWnaibToFf0oA+EAifIhnxO6Z3clJmVte+16rNYY6B71rEDk
	rEalt+HaLjbzvJsdOVg+KWNxw4q2QPa/fd8SjbrTOaotR/9m5mb7IoQrKaPpUuao
	otv0eTHg4hCexmnDuuQxTmOYPWaHEQ4Oj07yrRePtHwAe+4GMnQjzePEFnqB8IqB
	jKoYGHAMs/RlOwawWTZg2gyAO2ftmRS+PB+VR+U6gXuAqV1+bey0xqgE3t/du8Zo
	W3s2QNkmbZyXt3qiJ1T2vdqYJ+nd+FodzmhLo741Izch9T7opqkxdh8SJSHYuO4Y
	FTSJQg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7rqx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso382932b3a.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934867; x=1779539667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=;
        b=XxhON8DoeYgL+dutXlJbNOmGG7/vnV/pi4ESVQBy+ol5OhocDY0Ke9aFBqEJ4JKZrE
         bApRQzPlNvqGlxObCnDrvvRfSCKNdWSVjBzJDJM6raSkgvMxlJY/Xk3G4jZ+GykXoZn5
         QIJlYhWRaKUt3nfiVXmg52kVLwpgNjcK1JhFfmaVHfY6yEHb8SVJyR17wqytATr1IhXf
         33yromQWB3ubOMxH/clwXDvQRMddTqxxVUboZ9MZz5qIxkZpShYDjz+YZhQ3tkJPzVpp
         z9L668AvjcheYD4mu1ZCJuCLYlCWhTT2+meo6kskVKlJIqhsVT3PxgLBG/lb1jQLv9qd
         FjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934867; x=1779539667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=;
        b=NmedKOnO1jyRrTBHCnJxYBKJ2JV8vt/UpWxMt5eMCOjstWuk431rAmrgawGUhAUFoz
         SnDCojm85ZcQ9gOSR8CYmUKrOYdemmKROCN0aoJV6+8Gv7ht2Ypn/uFOvPMMy+TT+UvK
         IuMbuLDrRVztoACfcyVo4Sq1xMl0c3DnG3h4IK4aqj6kg9I5uFjIvjjTMsYM29K3DbAB
         D9ZHhhirfEKHuzyX4bKdrUWADRd3XTaNWzDgDA6h6EXdvu9S6WDwxhEVspD41QJ6v5aB
         nzQSimLhlLb0MfC6Rmynk9gr40P8qtetySOx/k1YSxAwIFJwHMEAjwb3PNB6Wxvuy8Hl
         QlvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hxaib2tBRwNcXbcoPSyxfMKQvphJgsew6m8SyhL5IGTnP6RdBIBqbToEIg7W6jooITG2ts82W5EbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AvPHlxrgbuDjIwOvBj8dpahwUskd4OWr20PPt3D+gYZzHv3f
	GTZIQRMCTPo+b4Mld1Oz1eOoC2TuvqluIcW6ornL4uySXNmRwMCEHdPbdXRH8a5HINtPqLZFfHX
	FSSAuXLXrWfYv4cDtThqH+AaUa7eSauFhjy8niL/cTFHcM8dXwlKnsDtKClMzDiOIJj9BgOUD
X-Gm-Gg: Acq92OF/vFBN3odhZ2JoWd3syzpUtNqNNMXnyIZ9QyzE6ffts8qrwSigIOhiDr6zC+b
	lYeaQD8tgJOBRgmrnXL4Ii4tTfQu7IaJn/nV4huCM0Wqsd3U80b0Qy3JS3y4ExE98OmmtbyYjWb
	Y8cyEpz/30rzj/3Q7Nw7uuWuBXMCI4W9pzbW8P/99e2lTolSzX1c9CU8DIUSZ3mnaA3A7y2BLyj
	crKTAa2Qq0Wdnf1/mlf08zWQQoNoopeKER/bd+IVeiK+gzj5tBBTMLieUZ1JkvyIdCzkRvD2aTd
	siCE8Z09LSj87ZcSQXLbdqgSQLf89kX9p/ox+6geWiassSqyq4FkCsifRoZAMlVExRfKu5UIgRG
	Gxdx1vY138S23keSUtWopwyM/No4NOsFnL8mK5WWv0gP4AVopHjt7
X-Received: by 2002:a05:6a00:950f:b0:83e:6fde:54d3 with SMTP id d2e1a72fcca58-83f33f3d3f0mr7854675b3a.50.1778934866923;
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:83e:6fde:54d3 with SMTP id d2e1a72fcca58-83f33f3d3f0mr7854653b3a.50.1778934866433;
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 16 May 2026 18:04:04 +0530
Subject: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
In-Reply-To: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=5165;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=TpMlPRysp3w2m+ZFi+sTeXE10yR8wAdZPz/OYCwHJZo=;
 b=yVvi3RjY40p22B42QDBaFIBVse8JGLs/A7douwNNONNIVhxQTgPq6cRhjnRT3p7MvcZ1o11+A
 IheV8q200YLDw6+xJEkE07G/1km2pLjSR1EpkJSR7EqLt4cgHI3mTcP
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfX+9v1goxDiRs8
 epRTVSiv1U0EECVQ/Ifhh1Ycgx3n3O2NIGzJ3EyScxGUqRtkmBujoFlecGaTxYIK30xJtrCEa6I
 5XSUEYaglTL+gevpSVnZyBXxjCj/H/yrS0oJJ2534TJMkbvxnohWC2bxGghk86A/gSM0VQWlcDf
 2Z4LYggoCe7FFZaM+ZmIXSRx5BNHu7IdAQovcuNUfAtyyopWpGu3ljhb8FkoCdMXeqf/E44YRxo
 qzUcu9V+Ss0d6Bxzs6e8K+R3l5Fw5lb0K5x8O3AZMkJ3Pgs4OwEjmvwYxn/F04BjXVsXNrs5j/j
 RY/mBsQU7kziBu6QiPEIE7m/u35hWQ5BOrvs/JlfWqMB5Eig0NONPoHXQHOURzcP3NPSFDC7S2/
 yQf3jG3FMr0iybYxpHrRJfRNoA4ggBrMujXLhDbjOo83NcqVP9rsgWLOCp/iFV+9GNl8WTgDkE9
 Psi3QINWRZezCQ6X55A==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a086453 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=taUV0mOn9u7JAoyayg0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: WXe6nldC6Cz1Pe_q4jkwaxJgevpXttzo
X-Proofpoint-GUID: WXe6nldC6Cz1Pe_q4jkwaxJgevpXttzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160123

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
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 ++++++++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..aedf5edf8f9b2b75f80a61af66727b52a5b3ad49 100644
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
+		if (err == -ENODATA) {
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
@@ -2294,9 +2340,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
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
 
@@ -2308,6 +2358,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
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

