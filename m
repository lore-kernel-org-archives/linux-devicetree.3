Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738893;
	b=UiA9b2jHQQ8UKnVKUD0S9cXhss131JVE/SgW++k+I+6rfamLvPibOQ0lUKE9+Wf8B+V1
	 guF54QQngoFpPX3/EQyYoCZR1CbDOSFcrsSRzmoiO4iiLirQ+LpxgzX7RZjE2kdIvhEcH
	 MftLRbe5Eqw0TZJGoOXPrYocwUQ/eH2vjSG1ahh+qLKuW9+IjDgTl5NSfAJXj2FbJfupD
	 /SugPF5QEwEU3elz6iXbMW8dPTqmgtbxjGmcgFJyQcsEe3iAoyhA4KmjbW+mpijBTz6AG
	 QSxtDxykLJsZKNx99fxJsul/FizTgONKp/17Ib6SD4eeEV2u4FgHPNN74E+Wb+IUCWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
	b=N2z489hbpzRYcfZnAdjnUIwUo876lI+21HG0B8FY4NkGtdXy3C4G0L3iOoyZy1x0ItVa
	 vCx0ysb0XvkBrKCt4A6OkFMx+Nfmiq0B+0Rqirsy/DtNTCVsmUU2Zm2non3bCNF4lOhcZ
	 0uF+ZgdP+uLAmmBlgc74eJdNnn8eSHkev12Pa0dtCJ4SzkIryb4tkjmQbbbRbkBAsBzvG
	 2dGToLRu/pdBPy3pX43GqKWb1fk+LXkfWKbL+iBjtRwt1hy9KRV7jn0zksTBqYZ+bgu6o
	 dPLQ3FzLmPCmM+RpkZr7EcNut7bZ0LyFP5M8oWbqv93JY3Sn9rKkSstfzyC3wg76Xeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hKQbarb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBn2Yq8R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1406606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1406606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hKQbarb1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IBn2Yq8R
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1ErKg2389377
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=; b=hKQbarb1BYVCgfgx
	WS/Joh4mAyMiwZ+731RXvNT5GoeO+DnRvJPZCjaDWqav7xWvyXBSnAnsxiBd0CwB
	ETcvfgUrr4SxmD2LArtCpzPKqy+Gj9TNydj9Au+PZYMtiYHD0Pd8IlgxBTeSUX4y
	0KY/aoPUDqOaZB33uIFi0KlfXcdyyk7XN2u9NvPK5XYbQVaLoq+Gch+FUl7GGhNv
	EEm6g+YBCSuc3wqf37qD+r/y/lBc/e8LzRPWKsZJBmMTvcfqrZhFpTLFp1GcPgIj
	/IXihBPgO/NyjMUysbnHPIzSj8s6LnOZ4+9lIdG8asbHKuFvB5EdVrm/4MRFX8EB
	3wYDgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso652289a12.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738891; x=1793343691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=IBn2Yq8RtI2cQVRhH/1Cs+qyx1iA8767pMv3ELW+fjdaPPhL+mLSSpeRBIe8dZ+JQb
         okgoG/z5P6dtTeRjanNUKvFu8kcDI9SJSSjR+FQQezUZC6SKcluiA9xsZubShmVSpcvf
         IBRMhSM5//7UUtrbSJGopcG+p+GjZGg2dzN57RGqeCWRIUqlgfDxRe3YIz0a9b6NlFE/
         B0/AKmjGVobfqly/6X5/Rz4i2ixavTLOMmIMWsWq8jnQV/Rk24a0trxckpX5dLfNufkd
         wwPG+2f0KuSuaRwYn5RYoMJIClrV8ZwXpRbuNN5WGXiTbtVNgDjnSLd5VTYIlIrVU1h7
         gUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738891; x=1793343691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vOE8sL9t6xNjcUysD0wOX3Qs2fD0W5uM0CzKej9jTQ=;
        b=cPFNsglOmWk2vQJIDmcW8ygs9CWYGZ2zOMcrEgjqcYRzncdigMaLL6Uij0d+/PX5Pj
         GZBDN4jRNac5hqhuBiI7lpEo/l3PBTn6IxzCL1jGhXc1f65cpDg1pjsuFt9zyKH4E5fz
         MlCDPmBmgqrM65vrL4kbyzuUlWN/x+gS5Vl+KUwgsCW4RfW7Ez/g0HGfVa0AKKttSnWN
         P6eYiYMHBdcn80xBZI/oVNWJDm0ToM/CxaXGSrO+8IVBqv9jWouSeqLDRcUxZSCm2oPG
         wPbHlOhbvB1XpQuAjVuCMFTtmhNCiPtDhJuECnW3U8p6fKr78WDCpSUgMXmCrAhMqbk2
         GQPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRdEDsVx/YMm02WYV3vA/98zD2ZayrStLmNOXxXdxBnMI7Pf+DkWiNd7mDTljpn1GSVmMvSegjBjy2@vger.kernel.org
X-Gm-Message-State: AFq9FYKID6jKU0ox+3WDXtXbzy1ET7VRFnzIPKOcHwgEKP7vwEk2JUH1
	SriD5m2h45yLO668agsS1/LxDzHMAypNyPctGpRNtNPZaHaJHdNl1aLG8esP0UBYjv9Jv04OXXO
	CZ8GqEgXU5YGIOiqc/WmsOnsXu1WyDbKh248CXIE1wcPQdl7th0OQjxAh24XV4Nuu
X-Gm-Gg: AYBFou3Yb5PGfh8R2EjUKs2WBlWYji1Q4b1HPivYLcBvgNpEL+nykAOOpJOgS/g04+Z
	lgzO3lKenDMR7A6XrYSjj7lBSfEy99dXZ8V24YB82AJ1DEJdk1A26Ij/3fJx26atX2GhffZlN2e
	v89dC2TP72PMGiTkudI+9FYCnY7CrBuXInULNXhV+YqFnnzcHWnszNMYDcFLcnJ0Unvq0CfAkxD
	2aC3qzhgxm2yV4iReHlCRm+d4XXlDivkScbN8k1ebSvJaPKp2ZAEUL3sfF1NaV1Yy9lx3Y1UiIE
	n1IUFOISfk/QpxH0HQ34H1zMjvgI3K2q/qTnhXTTx2RFHxozY5Jeq9CtHT/9DVDqbZceVpHq5vC
	wIuZ6YiULxklJlMLzcUYjaFAxpIbvBEyUrFcIgvLubZDfaAZjWlPGnlXE6x8SjSsYeXb1HrBkUd
	BK34mtIl+9/57Doq3sZ6dIyA==
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832386637.26.1792738891433;
        Fri, 23 Oct 2026 00:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8e:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3e3693502dbmr832359637.26.1792738890923;
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:30 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:07 +0530
Subject: [PATCH ath-next v3 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-4-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXzHOWdRDLk/HS
 1gqsSM1fp5v3IU4xq6SAVbi91iTIKLks2O2F6GAoFKvFp3AVzfTci3iIAvLrsuYF99tgWKK5OtX
 ZryOCuQIx2XFOPsTmE9G9W1Npc3ZXro=
X-Proofpoint-GUID: AV3gfltm9bunCPxe4OX3saXas9MUiEaB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5+tEhKE4h9P0
 8bt2VXVdoEgd0Kupwz7HQR+48O4zAf0XHdMSfnxDCJKN2J+fq966n2cHsZsVDtAwB248rXthG3K
 lpwcuvJu7WWWzGn2BnQU2c7iSwDVBXTB7DfSbOOhkJcSHj2wEsvq6qSZYDNs2WcHZhwEnCzzdst
 D03OKY6bzazfZHQyoFvoV4OioPfZoXmnsq1Qdc0h/z26R6CXiYPCglZ2SbyE4x8vAtjv2L4KxPB
 ilwEnPNttgHw7ThhPduxMsY+wBITcoyqgmrGzvSOzibq0TM/hF9MBJn6/LLLd1XlgbE0fTCQN7l
 fEgdeyWYOyWtkwRXliONWU62T64YtvIkV3OWao1WVhJwuZT0k20uE0Y/Jmm67kBr/daS61juYzL
 w73packoHX12mVdikDlK0kIgMXeFNzwkxZ/r99aY7FCC7mFXCY9cFmwf6QDM66OtOHSD2d5xY38
 KSP6lA8x5iolMSq8foA==
X-Proofpoint-ORIG-GUID: AV3gfltm9bunCPxe4OX3saXas9MUiEaB
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb064c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware ring mask configuration for QCN6432 to support interrupt group
mappings for various hardware rings.

The QCN6432 requires a different ring mask configuration compared to
IPQ5332 and QCN9274, with support for up to 12 external IRQ groups
instead of the previous maximum of 11. Hence add a dedicated ring mask
structure that defines the interrupt group assignments for TX rings,
RX rings, RX monitor destination, RX error handling, RX WBM release,
REO status, Host2RXDMA communication, and TX monitor destination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 52 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 52558dd126a0..833aa6d43ce4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -127,7 +127,7 @@ enum ath12k_bus {
 	ATH12K_BUS_AHB,
 };
 
-#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
 struct hal_tcl_data_cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 643c95c9bccd..acc4eabcf2bc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -332,6 +332,56 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_qcn6432 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_TX_RING_MASK_3
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+		ATH12K_RX_MON_RING_MASK_1,
+		ATH12K_RX_MON_RING_MASK_2,
+		0
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+		0, 0, 0, 0
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.host2rxdma = {
+		0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0
+	},
+};
+
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
@@ -926,7 +976,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1

