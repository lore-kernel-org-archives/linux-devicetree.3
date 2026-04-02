Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD393612E9
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102083; cv=none; b=tdiwUw/oSZ0bjwuMS2dn8pZ7a/23ITWMdKk8tiQlJHokHK1A6W1PL2KAwiI8or4aRuQQGmbNtYj/iyVV6wPvWUDfCqgxEiGu3WP4aFCQwVeRfJHUiBbe4ULJfI15RPighnXXd1w7uAObawhwE1J3pTLO1aPrK21bq1s65LUezbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102083; c=relaxed/simple;
	bh=nrvVvbe04rz89echh+gNgVl/hbrlbKXffD7YlpyqvWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K0canT85Ze3sJUkrTGBN6wm8pQwOF/F1aPcAOop5UpOujBScYUyhe+0KcdMMwL4fLTsbFqElYwZBMXAvPLnBi5x8FA/wFs9hguGK04f43brnV2JdW/Am1LzFs1ecOioe6ps29QX+NoxTG8EL3jNgCILfjmbr10wM9QFt7kv57fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RR+AEfH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3Iy8YTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR+AEfH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3Iy8YTS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4AjK1128979
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=RR+AEfH03aPwBl/v
	ES/B2b5UjUscjQpF07y6B94d8FnFQbIKaExqShAvSdkJy7Es2JnBnyd9BBwKO/DK
	3CKpA2NhQqrE5ogwg8epS2Fz/LDGHbEbswOB9+F9Y9PLh3NZtYFfDnRu/nu5UCPk
	okO2EE4phComAe0fifgCB1tlLfmU9I2wW5s6zaeuR6z67VLXV7Tt9vsLukhODekB
	yJ6qvRz9ktPamC+Qkv9ChSusgW7+e92AHIcpYHPOzFTgbjNcLDWsDbr7jbkKddcp
	sIJGbC2gMr5F+T1cH+ifcG3kbYsQ4XefIgxFVfWOw5pEZIXQWPqZDX4C2aYGD2UF
	IBD3FA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9a373-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:54:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf084fe58so209167b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102080; x=1775706880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=P3Iy8YTS4xLNIlyz7QTLrt8s0hH+ATfE/J2jcub8xV+DrhqYxv6ePXDEiwhiU09/Tn
         05epO6pXE+C3jsLJ09r08vbdbypUW5HylLvGNxRBPQBSbRqLYNhgg8vULwr/U5yxanXf
         OjJUoerNoELJXrd6SSIeXC3mn/dt6z31e3OcywUsZx9zND4Eg2ogFI3qSl90o/milwXX
         lXidMNmVi7FNxaNpNGYwtFfkL3nYxGOpTfVLWBFHS89/0J1pTk1xdmu4xVMkAZYkg1sa
         stiXrfDY0MWok9Rr2I5Xe1v32u83yd7/6hzXq+JQJECvaCJUxRlOU05V8psf6sG5FQmt
         kBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102080; x=1775706880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=Q2adAA/XGO2x9l8D8zfvGVOqXpV2j9FrV+OY9iUDRjuouXwXXKUvq/18JisVFXqD8I
         rNL2u57DpPs6lWQggK6e3SKoyDgarWWlYEiuGwcH6UvLo5ub9yExscJh88HxksQNjHrx
         SIVtjRAtpYkVvWi1TBZTwF+JaIrLyTenNbW0yX9aho5BKWSUfEq7NZWKSPk6ES0Km1sq
         x123tjAw8J2HS/jV+J1q7Ha4joe3YLYkoe2TMIE4FQhVuZCa4q/oQIIIDKcNGBAttash
         VpKfOAN/H/yKSXXEFqmjow0P8c730tFKGJ9frVnZn3SJPTZsW59Kg94dkHKMl7bicruQ
         3P4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWm0Enf49RhvrKRQgjYYf6VggEfpGqyHDOYMDt4l0vgPqekmO+FtqE4k9xzAeh3dQREkBu+pnWj+GQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2GXNeEGoiTfzI6jt5meSEdrSRrbpnfAkSeSyw7J33xMpY2/Cj
	AL0wf54h/bv19byKhMubElYyqOZH+G60yB8U+eq7acItgIbHhgBw+l3dWkaaVgZapD8+La/NlFP
	HOf3ksEpu/Zxm6xX5RbcqyqExIKFuNzytHXC6rj+P8hFLMc1EcE7EFxaUsAsUxZf5
X-Gm-Gg: ATEYQzzO6IDuSyXwS14t5SXD9ZN57sYsEMYO3lWYpfdOEsFVtNf3Cqk/R5GGgmzrkhZ
	qo0rH7cDkFmJZ0VgCo2A/ArJZeZLvsvViEBJWxTIhpNqLS8WdSIyEOS0aHJY+t7poEETiDk/SjW
	FXQclYjhOawNOOZAo2cJnUBEayoqCujqA0ewF0Ma58kijp4tsIZhxr8eTWrEBPHDzrJmA+sqb50
	cDvUFIWQsFpVHRZZv5X+Zqw0ZXEkuY2p2T/lCr5hOb3t3uhgXcUuSlcdoD3DPxA0hwGbHfcQvIm
	XFg+ApNXLkyRk/qIiVBNTGTpuqXVepSq/v6acFTmBxcbQtH4oMXAdpL9Q7jAB91g32lM18B6T/l
	G2IeX+5wTCPwN/5cXnGrfoRzrZiPEZ8VNx3HyZPQdBvQuu4jCU6/jrinWw5lTvOQxsLH0M0H1Wb
	5BdTvnCVmvW6Mg5AbBf/ZN6lpTOHRhC/YFMLZ4qzY=
X-Received: by 2002:a05:6a00:2d82:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-82cfb9c0d13mr1887470b3a.47.1775102080229;
        Wed, 01 Apr 2026 20:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d82:b0:82c:e816:4135 with SMTP id d2e1a72fcca58-82cfb9c0d13mr1887430b3a.47.1775102079627;
        Wed, 01 Apr 2026 20:54:39 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:39 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:04 +0530
Subject: [PATCH ath-next v4 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-6-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69cde881 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=x73wdjvOoWb_6dWcbhYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FyIMmDwmzOzW2Z0PUMigLVrYWAGoVtru
X-Proofpoint-GUID: FyIMmDwmzOzW2Z0PUMigLVrYWAGoVtru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX+70LHVTXmlk6
 D3VEi4CUAA1BcMbi3qUyVLkb8GUC5rqkQQTiNTfYOop8Brxfgg92il3bhIAo61bZy7wW6SqMbGp
 CxtqyWCc/F19qCz9QHJCHOKB+kfdsePNuIe22HebQdiOLpH5yjiBq05oVns6/QQno7fhlFASXGc
 exOGhd5SZUo+SIINArpSGRqFud3TlhoQM3j/aWGBKX7EWuKPCroek/8RisKNkG/bbnyQ4uGh3e5
 oy7galce5tTd1Sdl5/jwmK+J8jQF5iSlFtbHCa3FgF3FIzX0J/KaiwgQut94NKcmLWVyrJ3nKFi
 JqhzXqO5Qg7k2ef6vd9W9AKqEFAdhpHPngKQrWKlAeqFgeh5zi95gsLEPV7Y5R1z7OSluk5IY09
 Y4MhRde26H/ZvqnvY8e4g21FyKo3EjVEyhf49qRE7DaVMi/AsEx4nys3/a9g6wwO0L+vgdvZ7al
 lW5Uzqb5e/er6lpJ5FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031

From: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>

Currently, ath12k AHB (in IPQ5332) uses SCM calls to authenticate the
firmware image to bring up userpd. From IPQ5424 onwards, Q6 firmware can
directly communicate with the Trusted Management Engine - Lite (TME-L),
eliminating the need for SCM calls for userpd bring-up.

Hence, to enable IPQ5424 device support, use qcom_mdt_load_no_init() and
skip the SCM call as Q6 will directly authenticate the userpd firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Co-developed-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       | 36 ++++++++++++++++++-----------
 drivers/net/wireless/ath/ath12k/ahb.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  8 +++++++
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 9a4d34e49104..2dcf0a52e4c1 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -382,8 +382,12 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys, mem_size,
-			    &mem_phys);
+	if (ab_ahb->scm_auth_enabled)
+		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
+				    mem_phys, mem_size, &mem_phys);
+	else
+		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
+					    mem_phys, mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -414,11 +418,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	/* Authenticate FW image using peripheral ID */
-	ret = qcom_scm_pas_auth_and_reset(pasid);
-	if (ret) {
-		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
-		goto err_fw2;
+	if (ab_ahb->scm_auth_enabled) {
+		/* Authenticate FW image using peripheral ID */
+		ret = qcom_scm_pas_auth_and_reset(pasid);
+		if (ret) {
+			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
+			goto err_fw2;
+		}
 	}
 
 	/* Instruct Q6 to spawn userPD thread */
@@ -475,13 +481,15 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 
 	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
 
-	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
-		ATH12K_AHB_UPD_SWID;
-	/* Release the firmware */
-	ret = qcom_scm_pas_shutdown(pasid);
-	if (ret)
-		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-			   ab_ahb->userpd_id, ret);
+	if (ab_ahb->scm_auth_enabled) {
+		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
+			 ATH12K_AHB_UPD_SWID;
+		/* Release the firmware */
+		ret = qcom_scm_pas_shutdown(pasid);
+		if (ret)
+			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+				   ab_ahb->userpd_id);
+	}
 }
 
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index be9e31b3682d..0fa15daaa3e6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -68,6 +68,7 @@ struct ath12k_ahb {
 	int userpd_irq_num[ATH12K_USERPD_MAX_IRQ];
 	const struct ath12k_ahb_ops *ahb_ops;
 	const struct ath12k_ahb_device_family_ops *device_family_ops;
+	bool scm_auth_enabled;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index a6c5f7689edd..6a8b8b2a56f9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -19,6 +19,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5332-wifi",
 	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
 	},
+	{ .compatible = "qcom,ipq5424-wifi",
+	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
+	},
 	{ }
 };
 
@@ -38,6 +41,11 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	switch (hw_rev) {
 	case ATH12K_HW_IPQ5332_HW10:
 		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = true;
+		break;
+	case ATH12K_HW_IPQ5424_HW10:
+		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = false;
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.34.1

