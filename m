Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19523361DC9
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102079; cv=none; b=mUJVu5I7bBP5SBffszJpoxwv/cAaU/C+3LSykNt01F2DUgjzx4qO/A9fVzzE9nEv1xCu6l2+hYWBPx8a8lPTMYZKZrCAleUiczQKa2DHmxZx4feinpre7y0Rc9hzJJc+/DAfKjlSTzeOSfcpXZkXSwIRcha9NYIdwPv0caTa/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102079; c=relaxed/simple;
	bh=jI3MJb34Fpf484h0NsiAZuAs/DRVNF3NhnamK3BdUY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJHVDp/0XfNGSYpitzfy418ZM40RCNyTTUf8xJailkGpB4H4v3bs7zqgoQuwTsJuBdsH9h194VEG1ZW7bWlts/f40w9c+SiFhdsTRMNrsczEXrV5udTqC/4ntxj3aqqcdm2rpG8bPWml4A7J0B+q0uSprSqJk+ryRSQVwgNzcA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpI6Sl/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQSgDd3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpI6Sl/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQSgDd3Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4AWL1424430
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=; b=HpI6Sl/AfkDqHLSc
	SN9Lc1JmcsgfQnTPAMlPnEzHZX9pD13HbBwrgFh1lebVOSgCoicnOq95v5UUBwH1
	4uWZBDxi9D8T5jmJhuGIKake3K10Imk98LekdG8eumoeoEn1JfrDTY2wzlzLdsdB
	U6PbZ5dKGTtN0G0J/iviezwCqZo3BIhBM4V25KmyQpMHxavAvwT3GXIaSXQ5fPMd
	Qov8E/nyHVm38M5fENYNS71W/da4BtEPNTUIlOqCVq3a2cAMngAFh9OA8I+cesxS
	eCJSPK/fGjyJWzkC38EUEQFgpPXVdL8h0oL0C4z7CEw6kNi98EnxGUKj436UND/3
	oawDKg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511aqqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:54:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cf362659eso323828b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102076; x=1775706876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=CQSgDd3Q0nfXBAcTlfRwwyifZ9OiyYOSKgIhD/jwUeYWMYpmH6/H7HnMJhshhYYd1j
         3yEpxDzrx2kAeZo94Xj4clIw5jIh4l/Myp9H/y/LDtIF+oCxliF6ZX+NmPTE7dF0pLOU
         65gi+lCZOpJpqIEObKbNnPAlfglrBsN3admNRqpkmazJtapaoQYqSnzWsU1o4uFkbul8
         gIk7vgNqVIi9dct2jPOj6q4adGNbdmelRFYgS4wWpfb/7SjS2eSalvlAPVR6Ni6olfEY
         8ze3Yv9LAi8R2svVXcNQbQ0BVnk4QUdNa4SA1jrmkEeOebaBC8Nrx/pc4kI5Cct7LbIl
         +7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102076; x=1775706876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NLOqrmrcKA3RfsbA2VIhZMGTu92GozTrB1hx2pX3L8=;
        b=mK0vDHmKdjLpgghZjKDMgLvJdgIHYA+zv8bgB3stFWwlVP7ZAdhhG0MyX3hxX9BtSS
         wgxBp3p4lOuQxihfNGMQ1uWzFFIMD057o/NtS+w0gq4hwoUG2hig06G3+kpzMygdOwb3
         NbeFsabNIkHe6YE/vu+Yka/uPyvq56lWtRJ4JN8W6GC1nzD0Vc/48ddHru3UU1LK04nR
         /c6vtFpdkzuNYfHpqrD9lFE7hNCePmooj9mOWnPHqlGgzz5Rzls9VjnXNh8bOAithEKw
         gY7WjR5oM4otwsEgcHvv2IoYzy+O/q6QdSkYFUtNM6nXUYlSPWNHtlTPoPV516e5YaOx
         eWDw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Td7VQVxrqg9kPw7WEruErkS+P0MIyAcR7flhzLLLT29sredqAo40ql5hMJLaBbFHJp/tvsqjTXmL@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrYASei0M4uFUbxTgdRujSgTtbWVaUyVsVCevw5nqXYNqyqTR
	aeJVrkKT3g7wRZLtMk5EuPEjV7nhdrenQHwNZEOTIZfTWv6vkD2Gp1psDaYfAmLaxqPl3MNth1E
	r0BUIXl5yNPOnLMvuT4rdJbuLb8WLPln/PCZch2uXcTBcRnC5NnXJBwqGM7WtVblr
X-Gm-Gg: ATEYQzzhfIuGU63rt3OfgP/DaiUCYH9GQunFL/xGlZju9QQJEA4dYuxDtRjZnweaS7R
	I45+cQ7AiskVckv4hrOlyhdVKZxu9c9ZL5CvIkjMnvgo8lZv1J7SaOPSnb0b8rD3tVtjDdKdOWM
	RSpToTfwp6nLRAf6x4lPb70GvsYo3BuyioUc7MoqioAjI9z9qHqVlmgpFZgJBXaXdHhIEfKc9QC
	hqeQ3ggwqvKq/X6W1FZeXHt7hZIOJvpmMfv9g3Rqzq71+KgQRgz7EZprgeCmSAp1G37BK+k66d+
	UTtP0jcfkAEnJS3V4H9kHR2dzwlPC0+O6Hc3QRHE1cg9GZ2LXQOTFFBD+faW87KtfGvSeHFQPcP
	FZhIg76vEBpAgV5vHVK+xKXVsuhyEeNfqbwE53KjS9bR6Zs/ajBLmn+aXQ6zf2L7AxxSAydR0uW
	AA0BMufb9FRW6+6GkIbwN54x8kiwPRNZ8sYvLbDuY=
X-Received: by 2002:a05:6a00:3d08:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82ce88ea07emr6644287b3a.1.1775102075876;
        Wed, 01 Apr 2026 20:54:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d08:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82ce88ea07emr6644257b3a.1.1775102075286;
        Wed, 01 Apr 2026 20:54:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:03 +0530
Subject: [PATCH ath-next v4 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-5-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX2fub6rqkz3Pn
 KQU4Z9+vpNGXNu+K626rsGPw1fX7gVYcVGuLS4SSP5L4pghFvbfjSWlcLf4Jn1nlpJUAlFClHkY
 b8yo56Y1A36YX824oTc4fb2sMKBoqLyEj6a2tUYYAxJzqT2OMwB8Emvx3fLfQbaNsyTou8tFk+r
 dIbezdluOBKvnLBPZVx1l5s66B4CF7bYDP8osNrYcpkyNodYpiNEz09+kLu65R7kjLg6uwbqfF9
 txGZSdb172pC8C1ISLrAjbEcHKSjkoxU7ILJafSz1ikMgyyI/sw6iht33XvadAD1W7SEKINV9eR
 NSc6nEcTavITEsrWQUf4RBLhYuVwXXDr2FGY7yEapcXCsZYPwRwbfj7nPzL8/drIpaaE9/QGkhD
 kdyTCT90hODhPLcbbglmv3PAt9OmVLqP+hcTu1oqDJ7yFjOrTM25mVb/PliZKc6gZg4cnJ9Aq0S
 vRIRp8odaBGL1sDEmjw==
X-Proofpoint-GUID: Ixp2F7Lbw1EacETyyf9kY3K-6pZRBh4Q
X-Proofpoint-ORIG-GUID: Ixp2F7Lbw1EacETyyf9kY3K-6pZRBh4Q
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69cde87d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031

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

