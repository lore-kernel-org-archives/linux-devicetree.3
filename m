Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92C3A256A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903186; cv=none; b=Rotg6Qc8rGe2GIk2SavkEU357viJTbotogn9AbwgnEbwiI8xdEcJrohUIdYu8VQH18YyUzkvh+0PWsKH6wu4zIi8IoqvaWIZzWKLJEab5EfEQjOdhtIT3hACZeSjd2DybUumCNcXU0irMNYwy+XtKkga+hzR6DbnJbIkSWDFWI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903186; c=relaxed/simple;
	bh=nrvVvbe04rz89echh+gNgVl/hbrlbKXffD7YlpyqvWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTa4gFgl/iJ4aJf1MKGMY2hR67ZeZbwpJSxew3hz8sG+0zZIe3H03VlMRwpVZd2BjWNaNPwm+O0WRxev1yDwuK4YL+iBNf4coM+6SunqtHYphukDIx8B9L7Q9gFHUU+TP84o8fxlINV0T80NvZ1CcAZtNVPhCRCXlDOg2I3LXxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETAEACna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXu5PYUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETAEACna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXu5PYUM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOJCo1557444
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=ETAEACnauPpy6SGw
	6GjCMXQ4lCkR4iR2zQwYAg4wbKOLuSHa0+i7sPhr+gVYR4hbEQIMD62ZQlLsU7s8
	MK7I1Aq7fC++yavzQFAisOxdgNcydIYBieS8IfUeAyOuKLnS7zAl/bBJkvQbVD/8
	OHhfDG0ODfb1P7aLjsCZEh9AEfVR12ZZ9mU3+9yFJ1jzChABzg2u5XHDRYrUJSVc
	labKCTAMNzbwSLI7JFdO5FEf9YEToEWB1XtkXOu5NTapkirW9wFdXqjMr7i0+RSZ
	L8ersC3y8RitliWZvqeSEDtyL0DoVO+2WEct6ISM8kXBUFSVv5J9CKYbzgNvLQ5q
	1eKiog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm1e4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24af7ca99so24776215ad.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903180; x=1775507980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=LXu5PYUMnqMi8par/3ZMPsu/QigyOo8GjUfs4hKLXLZOhMCOH7mCKR22zTRTizdRLZ
         38mFItaCul/inNwh0OdFxpPr2wKfWB0eGVxHPTQp6RWiByjeKecY0yE/tRW84pGGclYA
         CSz3l0xhvfY/P963qJdPiGYlG6WYO6YCGQ6IMJufymCshKpdIK0UIUD8Mv1r3fY/RAHM
         +kPiaelWH96iFOaHEImA2AMfO9RNRw82FbrL2Af3l3rTPft9GUjiL/QqaMlm9InFcG+S
         lcx50QOiOPf8/gIw/GJ39CCQP3IfOxI/pvRt/RKhLOB6Il338rnRIIgdPKDsOkefhTtM
         Punw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903180; x=1775507980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=f1ZD1UtCItPZ16puhbvqsz0jTiCZAwykdowMU7Zu+UYwUiqLYWVroNyXxd+EsV8X2P
         cpw2RJbr9nsvn0V7Se3IBXXQUK4rNYsmyTAlFhDO1tAcpbpXF3U/w0EXMQGES1PifEf/
         g+SOtL+9ZheIcqjvpd6NL7K4W5iAaCMP3jJ/Skv81MToJnrE0/qnLrfiIXW22fVW+E3M
         COU6BkIZGQrybvN9iiGbXs0iCBws5/TxenW2qqaqa5qDR6fIVp6oIVzYMZtBIpRR2Gid
         MyRUs9xHuCbTQHnlRJFTKuA+MRPPv+9rrwTgFy5VsXiTDBdtcOK6ScWULHSHIBNYgRDU
         8kiw==
X-Forwarded-Encrypted: i=1; AJvYcCUd0g1lWGYtIukFxBJG6cmeEdIp3NXgMyel29sZ7Hx8+OfxfDoEGkIHluWVXN/brUp6tLek6Xx/mUYi@vger.kernel.org
X-Gm-Message-State: AOJu0YwlaxIFoSo8t9++OoFeJmQOnrOvIdr6ONZRTWVOWsWkfyXdhXr/
	VRtX55KEihVN58QejnSUrNX9yQ5v7MGAvOhh6H/RnvKUohTEhMz4DwIsHpv4Ll+5jWf+u9AI6+u
	5UECrSSRh46RRg3Cz1EIZz6xV/w0N3ajeu3bwkBG1/E6bROvoT6h8r9pLQos5+Of4
X-Gm-Gg: ATEYQzzLSHrMTZwn5KwBQlUUDyBu8qBTRuQ2CeAMH4WB/GFjFEDOxpxYqPsdEphTCZe
	xiQd+y3d2L2lBBkbWcry2SpJEYQAMRxrgrPD4AgIp34JCmQAe6uX/ivmZ7678+P/aBUTg/PktIL
	Wd/zUTcFomzGn6KAwTkX9HBp8WOWg5FcSsEsmQYsuCI87m6UUO5iReppMbEziSsd1TZmXK1sS5F
	LFb2Gmww9jLye2vIJOAsRN+ssjA9sbKwla9hJ4y3toK4ntoQ4BgwzjSJZ/whZpTtWCZrrN7d/so
	NPDFUdDIxdPreUbu4nipJikfqdsmtUjXUMHTYDQFoEbA+5FKAqm+zb6FxjNUr3ECUL9OyEJU6UP
	YpBxv8Y11lJXhuYFRokqBoZtOpmNzZMSjV0/VAfaXb5ZIhCdr4KXJ92PixJR4NuHXiu4hHUqJaB
	DkBJeHK9Y/IelH4JzeEQH13HeA+j3ntYnlbOneKjI=
X-Received: by 2002:a17:903:3d0f:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0cdcde5ecmr136744655ad.37.1774903179926;
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0cdcde5ecmr136744345ad.37.1774903179465;
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:11 +0530
Subject: [PATCH ath-next v3 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-6-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cadf8d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=x73wdjvOoWb_6dWcbhYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d3XFvyWlBlDqw_bD0iAWO59TQLzh6Y5K
X-Proofpoint-ORIG-GUID: d3XFvyWlBlDqw_bD0iAWO59TQLzh6Y5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfXzD+JqwXKe2hS
 yQJSyXkRu1n8I5875nv6N2QCfJnZnLvjbw7wO8arxeoFXPCNzTBC9o7jB9JztDF/KWStkiqSMPd
 vxHeOMo4GD7PpYvCiwaFWktJRJg/9cA/FCOtkepu1VhGzfKE5TwgfV+cvm48ezYtBx4tD8nR+G5
 IDlQ8cxidXpS3Xs3vQoSyygBbukwiwgKzrvfL+T5VaxySL6PhFOsBSSFtv+GYQcJe322gkU2zUL
 kN0ZBrrfc8dZKYgny7KUfwkdOZ4FN+NUBk2Zjo21e+p81R6mwR3mF8fX+bS6yenkA0tDoG8vFmI
 p5bNYYLx+/UFzEllwpPhLCWr6rVqzIjq3BPqZJ8CBKTgoB52zQKKVYIGftlKJvx4TIulKX/MeEc
 Svvu8Ku6MHLLGs6wcbGQ+YsUr+kAYl2kfnn2A7XzBH25X34QUsr+18rVKnymkSNx87JRDSGpRAB
 muZmO1oBPmvL1Xtb3Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174

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

