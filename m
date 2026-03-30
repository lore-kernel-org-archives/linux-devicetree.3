Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9E39BFF1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903179; cv=none; b=h4Il+7FWspx63rPYG7tDX7yfyJcWYvUXQ8L1mI2ymeODYY6Vy/jkux/w8Cb1zWiHIZWiwDdEQ6QhHSWWIZpsjYct5YT9hQMy1KOVQPj/xTAPzdHyFNLATIvrC+F+x9Eyt10rmpMhkf3nK/pu6jCbZlmHUzYBdbiU9fVG13MHE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903179; c=relaxed/simple;
	bh=jI3MJb34Fpf484h0NsiAZuAs/DRVNF3NhnamK3BdUY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXxKZj8T8ZpjTddiR+cBhEUXRywp8pEX34enb/n3+yohIzt72vxW0GN10i8WdsCvgSxgDdbD8w6IyXRd+gPftJ0eh85DfV6XZvh1tIYRfiWzaH5DuUQANbjwqYkDrmKfVRUKLFiNCSVDXTniL5RwT2ZycTwN+qoYPDA5R5V3SgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdQs4war; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9nFnuLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdQs4war";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9nFnuLT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOT4n1557628
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=CdQs4warMj4fzqle
	7RxxRMRzoti1GM2zpsPJRpZxOL5JIRaf47yiN+bm31KwsJrAs+dh9yUWdP4m0SN5
	ca1QS+ve0nf6i6zo1NGEq70J2oMYBi0Qxdtro7FX/zmEdwhv/PItguLbqF0raMuR
	WNX117kpogo853E9rp6hNatmmIPJPuRNI0XK3nzAQQuL3Sl/vMl4ADtrdceWeOWS
	A3NGewZib9839jpW/iCZasiH12Sn6k6TZQ7EF2cXs+Duf/tlJvblizRNuQ54yFko
	d6UaJTK6G/5qsdixUxA0N+MIxMj/PyW9Yd1NS3qBupwfuwV+qvx6+cmQKxS1Uq4d
	gQepVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm1e43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 20:39:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24305cb3cso27763155ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903176; x=1775507976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=a9nFnuLTk+JXv6G4AmcA0jOcyVbcHS1rOAPjWFXnD8FDLtvX/mRdBNTGPB0KaxPi/I
         4fyj0HDqU4ohmjsJZ9LdOLhUlvuz8ZUU30w6zNmIiy8yUi5UPVh7Neyw7FIAQjFqN+KJ
         tH8k46ToqJfiADhsFE+p72Yzrp7Ah/pa+8HJboBV6ZBiCgCx9DYRj3lW0pviKicE/HoU
         UK7Dmvzn9XAOMv9eQ60aE815pOXg110Hhohw1awJrXBeFgZYAxAZgWVMKGjE7+uftcCM
         +6BEYati6urJkiovNeWLUV7F307PjPisLEovT98xoAfBJw4vzgUjY8DRZkyFmbHNXozm
         pj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903176; x=1775507976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=lfa/GPBAVqZhFG19kAoj9hNa7La9ZPRklV+3qQAr7e1Rkr30OomhVX0rsJfH3FZsBb
         abOM2zivWI3GCSQhXiHNkA07PxCPciUQXXHhobmJTe3WklwZ1DF349zPnTHcwMho7XBs
         cEljBgxkqJNXaw1TU+3/UJvKv4ZFmCqgrja+8khP9ew9Loixf/FpImzWBhduN3y0JJvn
         wRV9Sfj7FFIDG+mtQXkP7d3Y1yYz9TgRbdnB0cNnf0py6PASxYZC7S45iuo/BvHKVxNj
         uCBRnxyLRpPIG5r6Y+6+w3ZIJivaQcSEH+FRzrNZtF28AJ5U8P3MF+zoxVdlQMaN0sCN
         tZzg==
X-Forwarded-Encrypted: i=1; AJvYcCXoN1EpbPxPB0D8wnLBNu4B8ps8mMdPXNB668Lk+3X6qCvt75wthjx89RZMDkg7kIaIvdvl0iW4jSSn@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8ijzbeslAzWeiMXpKs7I6DIw4cgOywXKXWzUSfIl3EQ1LT/9
	gP2qHsy6P38YIeLdFB0u54UlEGDtnScmNHJWm4ADe219SxtN3tb9Xb3wz/kJQQkdOMQMau7egxL
	dpnUAji6TJTn4CCHaYuc0eC2nUl6Pt7DxHGAns17Js9KWet2dBy6A0Co6iaai1ySH
X-Gm-Gg: ATEYQzxqnq5bUk0WiPNSRX8lmRbRwzrlI8BQ8CfZgyjrECw9Lf5cDuyhajenxfT3F1V
	6VlHgXcUG0aE7HjzUQZER0MKz0pqe3/GvyqCb66j+r3PxHVeurynGXQWd38+4d5y51QKdtx2HXJ
	hOwi33QCj835heQ2+hEtX+9R/A5/tn+BzevWFO4cZMbbaCRslQy+aPvzS+XN1C6majNw0sj1V4Y
	h0x1eTQH1+NYhC67SxgJvoaBnhXkVDyVA8ku1hkJqu0WnnjGHQLZc2MJkVx3ZCsKS2H9e63PAtI
	aIb1n9gM3sF9hcgGfRIuEdKoe7fndolKYjQ+MEMlUQhug8dn0aL6TFI2mwzvGB4fR4YKix+Ae4A
	s35S3yl/pnVS2uraZUjxor+J5zpF/paKpllaMtndVTEKjf9MNNokpG+h6/sOV/TNoDC12asc8Jq
	g82eFgRHi03D97S4PthOJNOfKoJ68FCAOM/ClMepA=
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr151261705ad.42.1774903175747;
        Mon, 30 Mar 2026 13:39:35 -0700 (PDT)
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr151261475ad.42.1774903175208;
        Mon, 30 Mar 2026 13:39:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:10 +0530
Subject: [PATCH ath-next v3 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-5-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cadf88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _jgUJuw2V0585yl7llwFchQloaqVmJWr
X-Proofpoint-ORIG-GUID: _jgUJuw2V0585yl7llwFchQloaqVmJWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX6zAJH3ECySrv
 3Sp+62YoiXJMgHPwwTeZiX/o0dOOWXD6nyVnACaT7s0oDpdxbSDSZ7T3McPS/Z5fqDHOWoWm9pf
 Um8TaTEjZ6QbquGESMwkwB7JY+8PzftXapTz8cNZ40ToxCU3Xi9Ff2ZU8+GC/4403xIwDLeudLu
 jIeLR4ExXm1n4gOQh2f9j3LZHcbRDjpe9pe1RxB/GCYHoZZ6kxID2b6v+ctE48QZtvgxo95fFRQ
 mbMZmcBgC/S3/4w6tamg97b3vPhJ+3mpizNeVsQrEOJEfOYwky4qS/tLI7pxysQkY/rv14v4Tta
 Alubbx7xwI3/G4lrGHljM5bA0q1IGPP0xAqm9xzKIuRhAkjBd2TR5A35Za+Ia8GB95junzSq47Y
 fh9IoBynl1MkDS7AGWBSRJBkruIMaQLU6IQYZs56I70ObwbvqnMw5ZsmMqq2ahzYhkwSHXQ6G0U
 iEDosCCGWzG3lH3fSGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add CE remap hardware parameters for Ath12k AHB device IPQ5424.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
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
index 9b9ca06a9f45..a2c98cc1e348 100644
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
@@ -822,8 +834,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.iova_mask = 0,
 		.supports_aspm = false,
 
-		.ce_ie_addr = NULL,
-		.ce_remap = NULL,
+		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
+		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
 		.bdf_addr_offset = 0x940000,
 
 		.dp_primary_link_only = true,

-- 
2.34.1

