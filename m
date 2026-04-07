Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E93783CA
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775539619; cv=none; b=nwAmxO5br3x3O6rqvAw2zjx2K72y3eYVjJyVAFRR59NHOv4qJOamHAW63eis2mFtCRxUqglQ0EeQS0XY5aZT7kpsXfmJHn6moAZDawa1IEAonUfl35zlTJsHtnPt19X7vHSrPMz53D2ixAty4OKbsEaMzf0zsRuuX0QqQPhqzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775539619; c=relaxed/simple;
	bh=1YwDCLJW5AyG1KVkqMkKBR89/QMCu4M1b2u2EOFvvTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dw1XTO0QeKnUlVSG2Hjh7giJe0i+HVIoIH8soM9tjlg7SylpsL+iyURXiAXd/AOXR1h5ylukkYVY7A7HYXnhGjf9p8iK48O62elLKDXtQT/WcWIWZTsVsZwmamg/qeljrc+uSMjZ2wcgNR1E6NL4Sotrf9+kEjftdFmHsnoXGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huOvn6VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAlg5Clf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huOvn6VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAlg5Clf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSDd02009900
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 05:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=; b=huOvn6VNueYZ+t+G
	OOOzY0jNl51/lYCMJly3m2aixKvXzmmJbKUeQJFIxZsa/W4Ou7nI6HD5wlgmRvQN
	Wz2Y7KbRk4s8GcIr+cXXuFbl5hIcujgyZnt0WQRA2nubc50pj9lk31Uqgb7aWC4Z
	YjlCkjlLBF5k34Fwp33DWbFa2c/ZZ2vF/zbKLvurHT89/g5iHHQvaBsWzVHsxS77
	bJVw4Ze4vAZbImMMKGKxeS/9g53gWXtCipUximiFLYerPTRAz+8bj4p438WqGp9f
	jUSP+M9NJgKVrpRZh9mPXVw1gh2zT3hxa75PpwRC6cEiPkY4qvjMbxowAnJzuosV
	XX8L+w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrs54n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:26:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso8090695b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 22:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539616; x=1776144416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=;
        b=IAlg5Clf52+zOs4ORvlGlXbrMrM1agLaxJjVcBo9jc2YaUOQvD33DC0wnZYXbBTcen
         eU53M71hh+ww1slJBvX1RYaLcUsJ/bzsM5Hf3yv3q2cv1KsdD7yRkxS/J0GIyiBwBZHA
         C+iGgCGdBXnStTU/YQC0jGrDEaketavOwAqlX5vDWcvtkb2wntxlx1O221vO5ti0JxIq
         mp9y8b8sDLSRcjSgtH8Kc6ggFdNreDB+n77rUnkO9cJfbWgxu6RkrtY3iUF2S7bMZvva
         5BCp7FECEKS4Q+I/9vxMjCFuVaZ9xj1Hc54w38SshP/TcjDnjobLlfpccrotXtt5PF2V
         vqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539616; x=1776144416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=;
        b=ZM4gHMItuWFQoooAn/ROUE9M4P/MpkEpfRjnDNJC+9PmusKGlJAqilV/jEQBEPWC/F
         QaHtyZm+2CZkD3GICftdLE+FFSiN/39/3W3YAwZJBR5M8nq4ZcnwNWvuQvwRlxAEinmb
         Mo//VZBPLaO/KV6gsRfMDTo2V3mn3ey3+7OU1iSDr7bAyG3FxZo6aUDX1vovYuNesD0y
         plQuNRDXRuis1X3iRrwaXfWtQwSHNmoTHRCcSTf9kIB86xuQ3oIAY9LUox1+0t5q3s1Y
         WdsQ77RdSN5hLwpLiY/LCWAnESBQ6Ia75fOPeZ35k+Ol+A24YORhY9fD+WLAIRY/FIuf
         qQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXBtjCaX6FgdY11dS6D1Ex0irurKHklc5qv2aeN9wZyZes0Yf9IA082wUa4VletnIcf0GaqiRGrlKzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpP8yxQZ/jXB0QBS/PUcEaeZMJel/eayYWMZFq5VZYkkbWZWXQ
	ZT5sygoBLXGiMgAJtcwaIixIO/jhC5heDDhXaQ+suYLOsnafAq1/Spe7FnLncLrN55P0xcZpYig
	WXcvWbmT/dJmwHrTqKBwcnnOY+Oov0LXi2rvU6MkoUkeYGXTxoPyM9qFDlh9zccyq
X-Gm-Gg: AeBDies+99KUUpVlPck6gZRfCvba+XY/HzeqQduklFqj3nDJeqiKK2xYQSzje7UsM7f
	HNPRnRJmT941rw3ndorrKa+wzKZHShRke5XgJ6iko5BQ0uvlWDiJ42Ka1zRUnjyJxMnEZ5fhXur
	cEpcZdWgyRFNTMudDRvAzC1Vy3YDeNBN2jWAPkBrYUx8fPUbz+LFT0j3u4DChhCKUEt/0iAMWpH
	JLWAEsAj7IoGIDgUUV/jYLJMdddP6+8jh8IzmyGvXr17lhTCwucIabP6x3IAS/ZMJK2OM6RKu4T
	CFkWGvjr5TUPLOZDdACSuepgsagqsQDhNJtc07BaypL6s5OiPpOntfgNG7A68z8GFa4TVLZ5sxi
	D76CQcut9dPhlW1xBUN4SEj9s1jyj/cnrzUlRcOlvdQVKE2ooS7r+vaUpE50J/q/2tYCcB7hHSA
	qHCKNevMvFY46ukq8VrSDCkQolzXz66tOt8inJt3o=
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr13975905b3a.1.1775539616047;
        Mon, 06 Apr 2026 22:26:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr13975883b3a.1.1775539615571;
        Mon, 06 Apr 2026 22:26:55 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:55 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:32 +0530
Subject: [PATCH ath-next v5 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX1+IX0/yN2Ab1
 8J1Mfio251F+vNz91lvUX71AVbuNa8bQtLpvfmwUE7kvuLn5Y31R7Z1d6gTLOYO14M+4xkBg5o1
 t5FsJd3Z1aPL3yGHsMGx6GUEU8jI07+T3fM0rHc+1spsv4cGU6LIWGZTKjcVqKxBl2nHWuglMqZ
 YWGSt2dUwf0QeSt5CZOKpWtTgG9AE1heoxlhF0aN18PbRKJl2VevwK29QCj3g9d2gN69QBBDbrC
 YFmO6ETGmrSjLd8PBdjYoWKxujBGcYa6QsJZxnJWe5j6ye3RGm3wfIam/gYaePQ5lOgwRZkh6r6
 4srifiaDgnq3xJpEr7maTCDp/ilqby8JCw10hPvXQ9goXYKhuMvGSkN+jD2ygYT1uHe25XRoVnE
 w9nuaBAl/SQhn4o1L7QajufX8oL3LK3TTaCV5Fzft+3KN2M4TpQenavyAXO1qHjFMA73+drSNfc
 YJkwXZhKJoRBm/J470Q==
X-Proofpoint-GUID: FUdbnrv1OX1xrAkpV7OCup43gnrR597Z
X-Proofpoint-ORIG-GUID: FUdbnrv1OX1xrAkpV7OCup43gnrR597Z
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d495a1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add CE remap hardware parameters for Ath12k AHB device IPQ5424.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.h       | 13 +++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 22 +++++++++++++++++-----
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index df4f2a4f8480..009cddf2d68d 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -38,10 +38,15 @@
 #define PIPEDIR_INOUT		3 /* bidirectional */
 #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
 
-/* CE address/mask */
-#define CE_HOST_IE_ADDRESS	0x75804C
-#define CE_HOST_IE_2_ADDRESS	0x758050
-#define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
+/* IPQ5332 CE address/mask */
+#define CE_HOST_IPQ5332_IE_ADDRESS	0x75804C
+#define CE_HOST_IPQ5332_IE_2_ADDRESS	0x758050
+#define CE_HOST_IPQ5332_IE_3_ADDRESS	CE_HOST_IPQ5332_IE_ADDRESS
+
+/* IPQ5424 CE address/mask */
+#define CE_HOST_IPQ5424_IE_ADDRESS	0x21804C
+#define CE_HOST_IPQ5424_IE_2_ADDRESS	0x218050
+#define CE_HOST_IPQ5424_IE_3_ADDRESS	CE_HOST_IPQ5424_IE_ADDRESS
 
 #define CE_HOST_IE_3_SHIFT	0xC
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 2b5d1f7e9e04..cb3185850439 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -329,9 +329,15 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 };
 
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
-	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5332_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+};
+
+static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5424 = {
+	.ie1_reg_addr = CE_HOST_IPQ5424_IE_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5424_IE_2_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5424_IE_3_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
 static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
@@ -340,6 +346,12 @@ static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
 	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
 };
 
+static const struct ce_remap ath12k_wifi7_ce_remap_ipq5424 = {
+	.base = HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.size = HAL_IPQ5424_CE_SIZE,
+	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
+};
+
 static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -824,8 +836,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.iova_mask = 0,
 		.supports_aspm = false,
 
-		.ce_ie_addr = NULL,
-		.ce_remap = NULL,
+		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
+		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
 		.bdf_addr_offset = 0x940000,
 
 		.current_cc_support = false,

-- 
2.34.1

