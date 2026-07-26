Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536611E4BE
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045078; cv=none; b=Jfwun9sfpP/dvag+lOzg8un5W7KsBu4x6fTuTEVKOngKVi4YF9OzyskjyuDLkODpYykxbZ1kUg2V6ZW+LOEDg5ugME3QJKd98gqQjH3irO47eFTw9Q0bi3WXLQ7dumAa0JwbVy/f2dlC8zQQt6RT+jP2X2wFXZrY9VEiSPgjOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045078; c=relaxed/simple;
	bh=baQ90teJi7Apuw1DT4Yon0BjJAdFT+yLP4AlGLp6bYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p02dgtP63ImaJm0ogrbEpDjjFXT96+8hDjDnk+wbGDpSwV5m0jCRhp7CfshC7rayC7zrBWtFa/B8aVsFCXyMEiKxwFWmbIG2p/emgO+fwQOG5KbE3v+UcLgtsUPbR9ti9IoXaFkkkSozRbb5ZTaW0/r164sBi3ng8Lt26AQjYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMQjB/Fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSA7jTfR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMQjB/Fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSA7jTfR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SmZS4181774
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=; b=eMQjB/FwTjtOFgl3
	HXDymnkbQSPkga1JLwuVPshkJ1UhpxKmLT8M2dSICvIG8UjcNGE5qjLmxnu+qw9p
	MpDZSaLOFffX9V0MS1nK+7B4BJ+ClFdwM+CpPErxyRe2TWunGE1Ue4XAHn6s+beq
	Qtrl2BwK34BRtcu2iCjBZjkvNFySCL3wkqmGn5VNr6KDr5mktnHSw6d3Ai+uqxTT
	jtSVVErZV+zSKnW5AzNETO9RjouSYBw8QG8dgWl3eyVhmlLnUwydzbnn3UlR+RCD
	uqsPALhOXwSgTeZxWBK0bRdJ2wcPHV8bBodBxb6Zcmho3543z6nc2KgBFxzSuxbt
	JRbiug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm572fyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1041018a12.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045075; x=1785649875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=;
        b=YSA7jTfRS3slOSAVBPBCcHk/MgbjElgK3vU8bNLAOqvsuX7j08i1wki9TlqjrzZE8Y
         8vrR72mDx5cW+zQArd5JFFf1l8CXIwtooVLn2OIYDEsx+R+pw2oStlzVQKLJZJmjVAXU
         M3GwECl4nW7zZAXZiVkdmQYSr4FD1YI9xrXqkLMDzPF7AbqfemA3NOjN1x1pVrw2HsNR
         6zekHIZldnUOPOWHgOg8Skt3f+SH6hbLt5qv8w7O5NNJJNfTRw9BfVj93SyhZPSLo8Ir
         Xsx/F7566Ny0Y0AySkAol1qBzmzwwImXv1VgjsW3OfdNjz9h1d+G/yw01v2tE5eINaEL
         fQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045075; x=1785649875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=;
        b=Ul3qsU8YcW1trB2Nd1kXNpni/vs1pp1wD6hwVjk8I8bS+HaukDOomU2pnyH8i4d4G2
         tKV2xcRbTEVQskh6X3BBQlRxLyeu2GuglEk6mTwUJCkPv+9/eCBUmXxCgRzIC5m9T6lP
         FXPPSB4K2BBgNMHZ9V6iTAUzMQuI607ItWNmvJczOZdW6K8cwZGRb95SYFbXyaHtD5LL
         UBkvoJU/P20z6eIvPZ8WkZ8L0lO6+JW3AtGts8bPtROJBRRgfxPha86j7AA/EGLBqXzO
         qVOnCm4rpTpNBQLVJwWs6T6FTFj1MSRTXwRw9pRjfYcSJYtmmVk6RlXcOp7OFrcuX1af
         Drcw==
X-Forwarded-Encrypted: i=1; AHgh+RokhQjbnHAsB3ZFSbmWHcm++nRVGOMJ0dXWrDJeyFvIKqQeBCm0JaLJ63VFjUkhYW4OZbOySCbOrqYq@vger.kernel.org
X-Gm-Message-State: AOJu0YxwraNQJBQWe8OmimIYMUIjau7rOZh0mAtghcZ2wkX+fWnHMTUY
	BJ4/C30UloRK2dK1MFmgK3QAKy8NGrSpaDIQtLbeEmdvdPaegVs3lC/6JmIXQMqDDMSAEwuhn7Y
	Dvj4ax7hAUCgokyN0xEAiAzgEPHEyqMWRfvxurP7GSzBaMKnt+UgGTioUluyD018B
X-Gm-Gg: AR+sD10Y3p5/DSaCVsk8eGQlMEd3bmyJJOFvRqN29o+bJhAwa/7WI1IfJrCakr8Shez
	1+/P19nOrXEhHhgQ+9TII2IIQdlQEoc+GfNpaOLIKFLZkFLraTFb5oX1loUUAfXUtKVvDxNkQVi
	GDEwEqaAEyZ/aaWr9OZ6Iv7n2Kiv7w7X4vulMv72cVw8VdCt9ZlG5P37AElCJhbdJxBaEU04U2C
	/upKoKB+dVzit05qtyTNJB4sMpVikJeeoXQu1AHSUVsClIRfw8fLqOYlTdprbxY7qfms3HITxGC
	rVvV+kk1pZmbJGtJXBsrgvraHfO7rGj1FBwXbVHyvuyc4kFQMV7B77jfzY+uhmIc2Uk+ulA5aCC
	vvFsXzIciiYXcOv3K6JgkVpvxOmDYeMSo3Q==
X-Received: by 2002:a05:6a21:a96:b0:3c3:b6f1:13ef with SMTP id adf61e73a8af0-3c67df86a28mr4252288637.62.1785045075002;
        Sat, 25 Jul 2026 22:51:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3c3:b6f1:13ef with SMTP id adf61e73a8af0-3c67df86a28mr4252250637.62.1785045074532;
        Sat, 25 Jul 2026 22:51:14 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:14 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:36 +0530
Subject: [PATCH v10 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-6-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=7611;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Wuzgz1rzYvmDPB16a5Puzh+s48WQEHTanWtzd6CqHlE=;
 b=jLtBDSIGL2y+RM3yWJWjAEq2HNXIfoC+ANjX/xICSnKIV2FlIPs+nvolEUD734iw1njJXmZ8V
 5I4vbQsXG6ODkq2tsaFyvCGj2M9L7iiP5SRFzj7u8VjI9sykNN00gNw
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfXx/0UtnhChxgC
 vPMezEdR2YGDS2YrKRm1q2//jVcsmZGlbQx5+i594wJfiqFDZu6ra+nknJ4i0k/dEfzrs3CW0rQ
 K6S4OmrvHWGxCawlPRY/WBoN2+dV7do=
X-Proofpoint-GUID: TrJKO21ugp55BWgLLXZb-R3-MN5tlmKe
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a65a054 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U8OLdchxA3Z7P0hrdlYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: TrJKO21ugp55BWgLLXZb-R3-MN5tlmKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX5lOx/iwQ4RlG
 ym1iKBktk1n+x3hdy5bZdxNAFYQ1RTD/AStkzslXLkXzbzFfHQyWcqIc6g0P7YRJQbvTFk9fEHR
 1nkvavwhY4AN/Iobvrt5N4Ap5+JUTWH6oGnutSkkHAxCtDqQM2fkRXo7MxsOrA1OI8lvfZBjzy4
 hlM99d+vWKE/DUncw/DB/5TlID4A6p3laNSQrxijiOpKlEdLLSpoVBzVrA1LS4UnzCRWzzisIcw
 VbPo2TjoQGjmVh1sOzCu6VdlqdgOpi1DOM5kecGBPMF/OYF3tj5GzZNYW8driSBYWCA4W0qeFzq
 Zf/W/iRvvA88I5IR0jNKFDXl9cuGMl1lus6/wknqGGE8XtgAflGPHNA02X7K5PE3hRiP5Yd/Z1e
 gMwoaZCQTksUOSk+eHODWhWXh2/1n5vrFTIcRrDlr4z/rPv8a+aXJXDo8CDGj1ADlCQ6iBD7wmg
 0uTS7jhIbfTDNMa0zZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

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
 drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
 2 files changed, 65 insertions(+), 12 deletions(-)

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
index 1a476146d758..56c477b36b61 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -4,7 +4,9 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -15,11 +17,14 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_pas_context	*ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -30,14 +35,21 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	if (!core->pas_ctx) {
+		ctx = devm_qcom_pas_context_alloc(core->dev, IRIS_PAS_ID, mem_phys, res_size);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		core->pas_ctx = ctx;
+	}
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	core->pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (core->pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	}
 
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -63,6 +89,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
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
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -94,20 +132,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_pas_shutdown(IRIS_PAS_ID);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_pas_shutdown(IRIS_PAS_ID);
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_scm_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, 0);
 }

-- 
2.34.1

