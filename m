Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2999353A7E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120932; cv=none; b=np52fhGNtcI1r+b9cMRBKTjfn/WIR+NQIXCd9guvf92cakLAHN3u+Bmiwxl60gL5C5DfZYCAFygawqayZtSqNh5PU2up/QEgRjN3PCksOsjo+OEwTcnpxchaBpyq/PfaL86HIeJZbAJ9EEKftdLnj3LqF0VfsdHXkgnpsPTDDVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120932; c=relaxed/simple;
	bh=/UU8GJTxDpInLuxZ9mNJMxg54IzilmGy46v57pGMLug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEE+tQ/xaPEY+7qKZ2SCYSnA0VbJ6UJV/bK4mbABa8FVzogBwp+jyuiqp70JOvF7JvlVTnS6k+/F5JD6kqobSFLigat6mV+n7cVy4cOHcGCBkU/aXC0JgVS6xqOaiR6NvzjYdlNgZaZrwKjy4Jeqm4zHX/lnwSmZ/uKSliPgSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyS3D/YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDrDa63y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyS3D/YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDrDa63y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G23UiN3202292
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=; b=nyS3D/YCe4ByCqib
	kM2nq7F6rC7b0fNdQ45GGjg4pKUiKGB0iYLad+1SXCE7fszRIu3MW1RyzGwg3P/p
	lCi9Z/+q41ayELgIFiwHqxnF7gRNDsTohW7h9XJinwsRhw/k2/UOOmYmTq0YsLh4
	u1k4I7Z59w6LGqYiWVCy6CIhcRgVgexCNzmswZEt10s9hy3Jq0pRWt14NSSjLyL9
	YoZ47KSvEdfOLph+/jI6anCviaIJQoEm7belqhnWs7iJlmnqrs0hbe6AayHRBvej
	VeJBjc+UA9HBWimDxmLIwNRVEr8i3EoGIZl2QFNv7ajJzFMgputj+yq/gsSAgeuM
	PNEAuw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39ty6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so16724361eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120929; x=1792725729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=;
        b=fDrDa63yCxsMQDR0MsliOmZ4PZmYGG1yAWUJGoT4z6ICxgxRvac9JKPAKGwwxBnwYx
         2QSFnox5TLD/d4bKgI/ngvx/buDumTaTs1C3vZSIuPmC/1hQqfkx782aulesXvGZXLOr
         2wD0shwianl5TMeZPFWuf2yTYB5ENZIfVDny469qffMEixMeSxOFec4KlBT72OeDCH4E
         qvrq9e+v68WKEGr+I5784Tdux3lrZO3wYdzyIaCZ05+tUlDZs1Xk4m0DwIJ2IjxYqXA/
         zyXQCz2o+sm1NiDRpZ4AtDC93rNMZLeyOSfuB3lAabTg41aYeQJyq5lPuzS3vxlBWcNN
         fs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120929; x=1792725729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=;
        b=qf1+maCSrhjdt8PEVxvxQ4cCaen5MShnSxMS0xPf5ReOD7lLdhlOuzZyn9dzu+Evub
         eP/dxSEjZXsT4zf71e8saA9AemyZtIEQ8W1znh4eIvHJIU4hUURb63hNqPq6ch1VYlpw
         OY1c8a8/T8u2rQlwqC8lz5IJ5Q3Ch48in2zPkE76e6MTM1Szn6+ou9vTv0ZqhzPbrT/z
         //F6DMPnGkiJPyTtK6wO7JznJW8b/sc5V++emilJetW19RD/iFB7sghvDveFa3umApqW
         7B2RjUmcFofqd3k+7jHHGfU66//Erc+j35N1xwhdVdYyZrz7HfM4747ZYxo4E1IOwL3l
         PyWg==
X-Forwarded-Encrypted: i=1; AKwUvBzGQR0GNXzcHl8yxYrhrThjoajd0zO6E18evfExaP0RsQBTwEXPSVC0Vu9lmhTshxEl3+/P7Ol3Dg41@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4/uR21Vv3uBMUywfIZNp0Wreei5DxNfBnUiylw9gXHlDCrPf6
	wcXmGLJJXD4Y05utCf06RRdeoB3QFvcefLyQ6bkaEZUphPsbFGIGoLtla8HxMWPABxNU5mdhEzg
	TPjKhsauJpO72gWwWwJuTHkF254hxE4Sh/rEXzuZKV0MJEWrWY0NIzDB+31EttFqs
X-Gm-Gg: AYBFou39w6LhpWilZ7BOVFQjdXCjytwMh/wtyg/5pr7AR0wkLFew0ZAPlE2aSJYWUNg
	XxdMQiXb5gsTRdwGiKpDNIU2uXapjqsxu9ySgLA7fX6++42k2vIWMVx45deSYOloEmL3ShHQM9H
	KZoQOXFl0zrNMvDBF4xLoB+DV0S1hBylxTLgdUZyYsRSb6lcl/onDPB2rbxkBo/JIztmSyGs1pf
	PnCFkLN8osZlKDWPB2gs/LA7w4SwkJu+dAwwnywynzJh8ualbtNdqp5HJgukAdNGMvLKOLENlp/
	PfokiColh0ACBYkLeP28fiyxuTdn12cjLcjwtuaqrBJbsXGISQcLQo1+rkGc/heKXb/Pxg85MMM
	7AC/QPs1vwukG5mW90Qcgddvc44LgAgmQgIJIIpOKkEKFi7jO/23tV3FvRYpOmn0T6Y5ZHIPsXj
	ZNepyvp+sc/07gBcGt3PU9sg==
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr30095135eec.6.1792120929003;
        Thu, 15 Oct 2026 20:22:09 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr30095052eec.6.1792120927321;
        Thu, 15 Oct 2026 20:22:07 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:06 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:41 +0530
Subject: [PATCH ath-next v2 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-4-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5k+rL3gtwCCg
 hiGVfyshkoU+S2i3rNDOurckV/ez+311lo5VgSCAuRdEvpdhvJdvhy1JZkSIG2HwR+rb+plKvbD
 vc0VgBQVXYSHRejemf1bc7jictO6ofp1XhWBQDvc/f9iCqAt6YI4bZ98z0Gffammo/ecWbon2se
 bKK1VriYSvYcYbnxwxDpItWKHYVLdf4XkQxiKHqQu1eDfc5ZevuSJdNIBpmQ6W3Tpk8kR7UU46g
 jk6o2toqVuROFm8ri742vK9iR1dGE3KRhkqE4Pe4q+OIN6p5wytZfcTolKo90HoiOW2+3w6XyQv
 fnekayoJtikpLGmVHGR1BVMpug/mXYYOJEjLQTbCdojLKq9DibroCp+t8jwp+324sVPhDOQcvIa
 c69UpVM4kC3aL0RjD3DmZTgWYDxaoqDdT68E2cvySZ/YzBtZMgD/dAqVuH4NFOl2ZADSvBShXXK
 M50Pj6KawQSgjACBLlA==
X-Proofpoint-GUID: n7DaXYdQJ36396sZq1h6L7IKI7u_u7JM
X-Proofpoint-ORIG-GUID: n7DaXYdQJ36396sZq1h6L7IKI7u_u7JM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX60ZASmvZHxLk
 8e7I1xcMPs/KHqu0erJqa0PmbCmUwJXOPn3W5dQoALM9i+xPZCUyHsT8QJyVfi6WzMM90U4I8zG
 LbWdD3UEdqLcilWOwrE7h5R6UbaHtH4=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad19861 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

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
index 494c7b3ae1ac..616ff695763c 100644
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
@@ -925,7 +975,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1

