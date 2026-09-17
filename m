Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832E3E411C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621292; cv=none; b=BVLOqhkgw4piLfZHCL9cbFxO87mQAxps+2ZK/3QeRJNRxqpSaaOZbJ1bxSy0kDByVybmsjd2Ff30G3AdBPYqS9fUo/t8zuPqHZlV+zLt59hZAKtAx1ItXDGPP0OFfSJ2G9xBulCPXwEO/kRWAe2ox6NX3jv8AKH9vhQniRz8jT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621292; c=relaxed/simple;
	bh=vD9rSJDP8x9PwXl9K5hnyRGQ1BA8Zsd0Mk/jziWWWSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVzEI+ZiIQosEbSyu3Subzv0P5K6ghQV9CP5qC37XBMmDyebGRxarsn3fXrn1/jGseOpmVnskeMNBDaxNEAMJe0/HRHptGbuuATAl8k7slLNfID1nWP3pdJXrv53o/pmXJyRkqOErZttbEbwltAxy9crsEFIT5+i3YFMYly1ZSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmqeEv7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjrFo0q1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmqeEv7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjrFo0q1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2sqXS3302827
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELOxM4ZOEXnb0gqasQYqPct6U4hXPnR2eQW+WWya7Yo=; b=VmqeEv7ouuuOPE88
	34a/00gubBS6VfvIIwPkhQnxRrkDhbOEubj5fN8zIDRCd8WEs9Nzij8z8+aLSlS6
	qUAyZx+Z9CC23bD4GE8qyqdw0f9gC5qlHpWu6JSWMsVF0bJGwkQZlTL1IQAev0uT
	vkdb8Ubo9s1BcmZyjpPizfTxs3vVi54aPL3tQN2bSC/1PxoUgisdq+6Hy04Q5SUh
	94stlTyEFsY0X0QdgZWO5Bg+2McoEj+Dv5diwnoYmHBe5etP8lNu34WK4YHi7TBp
	fpBgibPJkRy1MwZhgZvWF+0puHcsqet0DbKchBUI6VuANilBCAocP44LsJ9MCBk1
	3IZPRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc8dkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so357674a12.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621289; x=1790226089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELOxM4ZOEXnb0gqasQYqPct6U4hXPnR2eQW+WWya7Yo=;
        b=KjrFo0q103THZVlzUX/8ppMkNtq8u/Ulj3wfUN1t4fsC0uyIINtaqdlCkWolcKz/Kf
         Mc9C5upzxATC2o4Abu4D4z298FexdN3u9l+7w9hk11YRcSbjRixZ7FuqA1olZUpbzfHN
         3gVVgR9NWvy6cJuqsnaABa26qxVxRcgTvxSp2ino8Mqdst84g3bMrEyvUgvjs8viFexI
         h5rVlMgk3HVMkYCJCcn+LfS2SP5jAMUj1K/X3xfcurIAnLMOSIipLLoJ30bD+uT/WR/Z
         Pxel73JTXN4Gr3VqoM4fPPt6PQ1ziSU1whzwYfnPUKDCO5zcZgskkfgHjzl1TWq6g/Yq
         I08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621289; x=1790226089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELOxM4ZOEXnb0gqasQYqPct6U4hXPnR2eQW+WWya7Yo=;
        b=aLnP43dWw3oDgFmDerHoLZ/bMtkfsChIGWJ3yUGSfD1Y0xAkCUyiaYde2vpenM6G4t
         Tp4N780tW+Sz1LOt2dxzWRuhv3eSCq2zIMxph/XD2DxaPkuzSEr+fkwzgQC9HwhQptKC
         YZlGR4oU3ArgtfMRHZtghSLu8b5pNOzT+yNsoYqbb0afhA/cd12jtDX8HYTIMuDDtu7y
         U70GtaZA6CydTCPoQqBKpovdHssZnfk4uwMnL7/yiq5DY2McUzaOhuFWvGd9nYD3vvqE
         ro2upiPqLRq38938eWUQ01a2mCZb20WcuWb3hiH0s5/9xi4VHDz5M8PdbZ1bAyjYy0K8
         pjTA==
X-Forwarded-Encrypted: i=1; AKwUvBxwb++JB5K4x4sU+Dhrm7OKW4nn+JjNFVhRHRSSn8/9HLE7ReOWVCmZI5mNptxSZUBYh+MVxjkEWI7C@vger.kernel.org
X-Gm-Message-State: AFuF++miSgynCII+1Bq2zUDPACtltgL5n+pj+tD+bB+7k5PN72tm4qrI
	rUn6Z2LFsSsnskJKZKek/31EXWcvdEh42tKrB2rlpsovDv6/eqsOzxcsOqCJl6zzYspcj8K0vtg
	Nq7jIocxAc/Ap2XOrB3E6oiKTvT1mLyHDdRi6u2VmAeUPrIqqd5HUuBCErn3nMZ4c
X-Gm-Gg: AYBFou2kdk21WcTdX4SV4eDHHeYkg3ccbNHo9vyhjO0DnjG0vpSWaS4GEnVu3eOT4ay
	RtAFCuzCNs9erWhGwoShlK/rNkTvfVEbbxRmzCeZ1m+Z9TR3liLSoulL++H/axOEh3cL1LB8qN/
	tmBpPoYCKudKHz2OLfYKqaSOy2Gduq6ql7JRju45SOM0QBGMPy0s5rNETGmh5nyOAVCT3dBL7/t
	gqifH4PDJ3Mxh9Kjk01pGnV3hgMXa0I6w7hUH9SElra13uaKmK/KJBi+y83NMQ3+L66hXnLUY6j
	i1T8n40prvm4GcRFxF8rEAeBzLvUn51pxXuVLLLf5exWVhF8Y1xcppjibo5FVUcGaS1nyml4wnY
	WTxWKK0bz9KlPg1c3X7sXlUgKYCgjuZhV7w==
X-Received: by 2002:a05:6a20:a10a:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3dd5f5af443mr12800573637.13.1789621288816;
        Wed, 16 Sep 2026 22:01:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3dd5f5af443mr12800418637.13.1789621287814;
        Wed, 16 Sep 2026 22:01:27 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:01:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:21 +0530
Subject: [PATCH v11 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-2-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=8492;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2/Gq93R9cpgwk7KxsAU2reyrjwlqEiy3PAOkiucUGPw=;
 b=ysEdEgwI34d1zGh7C9vj0TKupQtTIoDYLMYw4GMTnJKnDbHaUuGOKK8unpHgFyaSsREf99LJb
 ugAu/qC23BkBKIdPhjr6vM6Bu7ezHMAWD8l4bcb2UY/MZR7aI7ZSx+r
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX4s1aa5T0mPAM
 AwdPs6pff5Zkhfm7coU7vT+GX1gf/+Qmgbmt2h7sJo0qpYbtofWaq9xOvNNKUnF5PIOFgPz6wSK
 b1MirdolmE0tPYQHP1j6m0II6HwBneDwoCqmf0Nj4iBRiMiNqtzM9GbN1/FPLn3wwOBkawPl1pm
 UyJ28hX3yHiOaAMgSP1jMlmR8WQ73QglAvvIB+N9QoD5SUvypg1hkzHtUlaXkCIyiOIUtExn76i
 o4TecyR+cRJRMA7mih2YweEuUcMC6z2tRrg5up+5cSh8DfSMmiU1guF0qjwNs//FiiqxrlfHOkB
 x3rY1JorP1P5030yDJ8aIZL5pb9O0QKMaht4pSfBRAMlKOU08wh4mv1tbiaw2HLNK4gz72oV54s
 TgotNPRhao1ry6UyOEFXBkRjjaCMV0kiMqrG7nCqXDnSSjrqse7wOFYqtf7897py+IeH3pxGjap
 Fxvvz83vHGIueeG6wOg==
X-Proofpoint-GUID: jFbuXLv1aR20-PCPlvnTnxlT-dAm2-TV
X-Proofpoint-ORIG-GUID: jFbuXLv1aR20-PCPlvnTnxlT-dAm2-TV
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab7429 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsvzk-epdriNwW7vwuEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX0ZAvtb0s24cV
 bZ+fxCvxRHvlBmQNCIzwLB+x4DL/nJ4LkQYes7GrRz3l8MQqfOxd4oA9ySPBkVlDjbSfy31ke41
 XfchtkM95i7LwXCgBOrGTCEGwUjVAtc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:
HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].
To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
the firmware function ID. This SID is specified via the iommu-map
property in the device tree using the firmware function ID as the lookup
key. A firmware device is created and mapped to this SID.
The presence of a SID mapped to the firmware device via iommu-map is
used to detect whether a hypervisor is absent: when the firmware device
has a SID mapped, Linux manages the IOMMU directly; when no SID is
mapped, a hypervisor is assumed to be present and these steps are
skipped.
Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.
[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 69 ++++++++++++++++++------
 drivers/media/platform/qcom/iris/iris_probe.c    | 12 +++++
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3c96f46cf567..5ed2ec0b97ec 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -38,6 +38,8 @@ struct qcom_ubwc_cfg_data;
  * @dev: reference to device structure
  * @np_dev: reference to non-pixel device structure
  * @p_dev: reference to pixel device structure
+ * @fw_dev: reference to firmware device structure
+ * @pas_ctx: PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -85,6 +87,8 @@ struct iris_core {
 	struct device				*dev;
 	struct device				*np_dev;
 	struct device				*p_dev;
+	struct device				*fw_dev;
+	struct qcom_pas_context			*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..8ab8c3cc9eef 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -6,6 +6,7 @@
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -16,6 +17,7 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FIRMWARE_START_ADDR	0
 
 /* Detect Gen2 firmware by scanning the blob for:
  *   QC_IMAGE_VERSION_STRING=<version>
@@ -110,23 +112,31 @@ static const struct firmware *iris_detect_firmware(struct iris_core *core,
 
 static int iris_load_fw_to_memory(struct iris_core *core)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_pas_context	*ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
-	void *mem_virt;
 	int ret;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
+	if (!core->pas_ctx) {
+		ctx = devm_qcom_pas_context_alloc(core->dev, IRIS_PAS_ID, mem_phys, res_size);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		core->pas_ctx = ctx;
+	}
+
 	firmware = iris_detect_firmware(core, &fw_name);
 	if (IS_ERR(firmware))
 		return PTR_ERR(firmware);
@@ -139,22 +149,40 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
+	core->pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
+	if (ret)
 		goto err_release_fw;
-	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	if (core->pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_release_fw;
+		}
+
+		ret = iommu_map(domain, IRIS_FIRMWARE_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	}
 
-	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
 
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->fw_dev)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FIRMWARE_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -166,10 +194,10 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -180,17 +208,28 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
 	return 0;
+
+err_pas_shutdown:
+	qcom_pas_shutdown(IRIS_PAS_ID);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_pas_shutdown(IRIS_PAS_ID);
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5..106dbd44ec02 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -193,8 +193,18 @@ static int iris_init_cb_devs(struct iris_core *core)
 
 	core->p_dev = dev;
 
+	dev = iris_create_cb_dev(core, "video-firmware");
+	if (IS_ERR(dev))
+		goto unreg_p_dev;
+
+	core->fw_dev = dev;
+
 	return 0;
 
+unreg_p_dev:
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	core->p_dev = NULL;
 unreg_np_dev:
 	if (core->np_dev)
 		platform_device_unregister(to_platform_device(core->np_dev));
@@ -205,6 +215,8 @@ static int iris_init_cb_devs(struct iris_core *core)
 
 static void iris_deinit_cb_devs(struct iris_core *core)
 {
+	if (core->fw_dev)
+		platform_device_unregister(to_platform_device(core->fw_dev));
 	if (core->p_dev)
 		platform_device_unregister(to_platform_device(core->p_dev));
 	if (core->np_dev)

-- 
2.34.1

