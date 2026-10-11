Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED51466B47
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723803; cv=none; b=eJyv1/HqBvu6c9aelChtHjOQL6Wv/ouSa7vuDcBsCKX1EgQbUhfxwa/fKGj1pRYmBtRDaGD8oyUuUgUskOp3N4L9Vx7s6s913vWG2a6UOf0H7NXrZkWvbGe3KvVSC9ytUnEHH5ehog7a1X+v3SxS+p4GOKpxZqnv57HtG6pbqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723803; c=relaxed/simple;
	bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VybOyGc6vAdCF8LMj++U4UuFiOsI/1Dvx7K8aZ3yu9znfkSZJIPyhSBctjqtZkgcP1FpXOooiIu0dt6n2RlrQ+JQK0oxMReyMAW/1Vv/AyUQH9Evt42AyoL+RkArbD55/o/GeqpEc+mnHnq7FOigQ7QEcA6Hd4aoX1cWbL3Q+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BppKAuIm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XO5+FDK+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BppKAuIm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XO5+FDK+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B850fc2110954
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=; b=BppKAuImAKW0l/4I
	41g6D4VGw5nGytGv4pSeQaM0uUdnz3aODpPXny5djloCNkcJXL99ugP7CPX8HBrE
	+g8eWhDNmbjqW6kUCfbuBhjxJn35n8hRF0yOrJWCBFCwXfVpdKQ734cTy2SjgRNe
	lQlPGIN0o7y7hsKpHNmEapUq67QqtYC3Fq73jg1/XvWb3T1H2+rMNfs09ERthvjb
	IsOlSkEXdpSc3s3VvdWkyL1AG1CNREiaDv0SK3rJid4+U1l1kbqNAg6IQPt8W0wR
	7Q7PBfzphH8uQm0HLEqPlS6xQ9pCm/+qsglhjiV17QcUmMxeD6wvddxyzuNEmvgM
	WIf13A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9tup9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so696167eec.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723799; x=1792328599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=XO5+FDK+T/ZXrwK1n1VaLaOWssPDYbEyh9vK+fjO7nEHLBSdROLCyiHn/G6rda00VT
         Im4vo2CU8wn1EjUC8MLA3N5Kendm0/Bf/VhOnxVVZRntN/OvQxtSJAGJQq02slOKA510
         KuvllTCHISNuhxOYiLE+o1nyU5VKoKUcD+eg0hhQpdftH1mghPIFdFW+5ZIFm2MYyfFq
         coAMApsq/VfZ3wj+MN8y1BXnl2TNx5Vs4FLQcZ7ZVQ+xti5YEbDH1iaT3N2UFwY3WzSR
         C2eVJAR6P79EyP3fDFdaEH9XnH+ECIe2wYIUq6intOznVEuDkQsUhAuH7/OoXBQzdcg7
         I1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723799; x=1792328599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=0XTDYSt/sXgc4Vl5Tx3vUnGsvBIPMK6P1pY4xqknIph+1K24spyGAWz2xMOvHHKTaH
         3OQr8OzX1QfLyQstAvO80H9dtQ4aDC4gQrjl5MyZmcr5QdFm9HQUEQXx2fK9mWjUQzOk
         TRNzgiin9XRHkIYkQyHY/XWlTms2F1telscblJwoEJpZM5e00i8mac1b9i+EqNaDqF+D
         rYr8f/AyauYU8VqFD574f9utHTvqLheqoYu2a51gc/jzmPdwXRW0JXppXs3tL76KOaFK
         n7TkXjK31eBuWyfWR3Y7IoQR2YiwM/aoCiXARBiimM4ThUVORxkCRYszgwkiJ24+33ND
         funQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6rHgzCVMzq02j+898BlMyEANFX55/B1Sxsg/2lR/gza4ECeTpjaMyNq6aK64Ix7AfgA3L0+iKdAbI@vger.kernel.org
X-Gm-Message-State: AFq9FYKLXPguGtpgfUPbVrje8bdqOc+BHR9luIwA7C6Bn6Wnd3aKVtrj
	q6NkAb/lpENv3Y2u0u62X99k24PeMLqiB2v0AEFqJ42qNHiP2ZqjFVK9496QhGkkIBSJFZMqRn8
	mDdpixyJPJU4d6NMNMWNV0Qjz+RM1GLpY93b2bPf9mQct0/pmCbM040kX3W7WaG5Q
X-Gm-Gg: AYBFou30y5oA0lheaul0kpCNZMoJEtbddoEpqj6QtGM9ZEFiQSOU1vk7Fk5zvHOYC4k
	jvgPWXlskHxI3IP/+eX1wlzckw/7r+43zlPp/o/b7R5SkcP+E9xTwFEY1JMsOF8aWSS6KmbsjEA
	k7tMfi7HVXchlcOr7hKJRqk9jlP08gvLuyO4aBKKAMfpjI2G+a5hgVAF/UL/zEzsKTL/JW1SCsU
	Byd9tk6KuKLvKLNtuA/9JFocb9lGpUO0FdF1mGM4lVgNNvnp+T4VptYEdD7ht+2mZXdmLIIrME3
	pGBJ53d+ERhMtjfpaJe/S8uV2yTt6gHLEGRiWOVKECzjqEHw8Covt1B8vHWvucYhXRZSRT/WrgS
	M317j2qzOLf3byXr7Adfumdx772lkemMeczVon6My2fk=
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr13179283eec.0.1791723798543;
        Sun, 11 Oct 2026 06:03:18 -0700 (PDT)
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr13179235eec.0.1791723797975;
        Sun, 11 Oct 2026 06:03:17 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:16 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:17 -0700
Subject: [PATCH net-next v2 11/11] net: ethernet: qualcomm: ppe: Add
 IPQ5424 counter debugfs support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-11-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=6180;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
 b=7FakvAT4U5+pTdx78jjxa39dmG9CMkX4uPYNTFnyhqLgsuhpGrqVPn8ZWERs4FggVOIw1UZMq
 icT7JHmCwFlD6tjraltC2qZ3dJU5Qmpfu+owY6qPO4txKpt6W/LnzNC
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acb8917 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=76TLMYU0KGnaRKKVPX4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Sk3_b54IANt02pQbBbjpviFo7IQKv4u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX+um7dLz3jRzJ
 VXG7o9cg/+ZFw83o/l2Iw+sh1a1Czo5QPpZsAp5aZzC6A8yulOzrSI53qSQILKMeWqPEgU/IbbU
 oJSckfQ8nvP3W4C0+XbrwW5AMOlCD5bgT0LawXcadEk2XSjX+aRs3FTzpL+Zuur6pQTJqO2kS+I
 v1/n5zZRKilp8XGbz1dyiUym2iUFwmILYCLY34yPqIyj8Gv496Ig4Ikyo94R6kVTXGobaBhvVeU
 UU/IBRSkfPNILrRQsDBqZJlhdK9YXLEKeuIfcVYsWQ5fh08hgtX9GN5kBfulNKiGtSParMfvrTb
 BgyPMK4FZSJwk4TxC94brgpZCTgGw0Bv9ZuvZ3+bCTypuJwYbIQrA77aoKIjeyhlv5ZTjVr8NXK
 SHU1sdH7UyS+pmhiHNS+jPZohVxZASbY3aHOMwrstMTfbfg/KIa4y4TQ+GJ73jsy/ZD7FAF6UrV
 d8NVA1KK9dxwr16o8Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX4OJsNTDd7oBz
 59sLn/OD6cuCx4aTtqD3i3+XYbyGyoa03mErTKaTvsv1VAl+hv3NJRuWvPaBH9VI8HwL9cpHEud
 zTCmSrdkorkgurd8/Wt1KR78VL1gqtQ=
X-Proofpoint-ORIG-GUID: Sk3_b54IANt02pQbBbjpviFo7IQKv4u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

IPQ5424 has more BM ports than IPQ9574, so the BM used, reacted and
overflow-drop counter tables have more entries on IPQ5424, and the used
and reacted counter tables are located at different addresses. The BM
silent-drop counter table on the other hand has only 4 entries on IPQ5424,
versus 8 on IPQ9574.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c | 14 +++++-----
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h    | 36 ++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
index fd959a76ff43..8d5a6fad8337 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_debugfs.c
@@ -201,7 +201,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 
 	seq_printf(seq, "%-24s", "BM SILENT_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
 				      &pkt_cnt, NULL);
@@ -225,7 +225,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	 */
 	seq_printf(seq, "%-24s", "BM OVERFLOW_DROP:");
 	tag = 0;
-	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+	for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 		reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 
 		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD,
@@ -248,8 +248,8 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 	/* The number of currently occupied buffers, that can't be flushed. */
 	seq_printf(seq, "%-24s", "BM USED/REACT:");
 	tag = 0;
-	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES; i++) {
-		reg = PPE_BM_USED_CNT_TBL_ADDR + i * PPE_BM_USED_CNT_TBL_INC;
+	for (i = 0; i < PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev); i++) {
+		reg = PPE_BM_USED_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_USED_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -261,7 +261,7 @@ static int ppe_bm_counter_get(struct ppe_device *ppe_dev, struct seq_file *seq)
 		 */
 		pkt_cnt = FIELD_GET(PPE_BM_USED_CNT_VAL, val);
 
-		reg = PPE_BM_REACT_CNT_TBL_ADDR + i * PPE_BM_REACT_CNT_TBL_INC;
+		reg = PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev) + i * PPE_BM_REACT_CNT_TBL_INC;
 		ret = regmap_read(ppe_dev->regmap, reg, &val);
 		if (ret) {
 			dev_err(ppe_dev->dev, "CNT ERROR %d\n", ret);
@@ -723,12 +723,12 @@ static ssize_t ppe_packet_counter_write(struct file *file,
 
 	switch (entry->counter_type) {
 	case PPE_CNT_BM:
-		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD);
 		}
 
-		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES; i++) {
+		for (i = 0; i < PPE_DROP_STAT_TBL_ENTRIES(ppe_dev); i++) {
 			reg = PPE_DROP_STAT_TBL_ADDR + PPE_DROP_STAT_TBL_INC * i;
 			ppe_tbl_pkt_cnt_clear(ppe_dev, reg, PPE_PKT_CNT_SIZE_3WORD);
 		}
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 089aa34b7732..d08ab02bdf79 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -18,12 +18,20 @@
 
 /* PPE drop counters. */
 #define PPE_DROP_CNT_TBL_ADDR			0xb024
-#define PPE_DROP_CNT_TBL_ENTRIES		8
+#define PPE_DROP_CNT_TBL_IPQ9574_ENTRIES	8
+#define PPE_DROP_CNT_TBL_IPQ5424_ENTRIES	4
+#define PPE_DROP_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_CNT_TBL_INC			4
 
 /* BM port drop counters. */
 #define PPE_DROP_STAT_TBL_ADDR			0xe000
-#define PPE_DROP_STAT_TBL_ENTRIES		30
+#define PPE_DROP_STAT_TBL_IPQ9574_ENTRIES	30
+#define PPE_DROP_STAT_TBL_IPQ5424_ENTRIES	38
+#define PPE_DROP_STAT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_DROP_STAT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_DROP_STAT_TBL_IPQ9574_ENTRIES)
 #define PPE_DROP_STAT_TBL_INC			0x10
 
 /* Egress VLAN counters. */
@@ -426,14 +434,30 @@
 #define PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID	GENMASK(1, 0)
 
 /* Counters for PPE buffers used for packets cached. */
-#define PPE_BM_USED_CNT_TBL_ADDR		0x6001c0
-#define PPE_BM_USED_CNT_TBL_ENTRIES		15
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ADDR	0x6001c0
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ADDR	0x600220
+#define PPE_BM_USED_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_USED_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_USED_CNT_TBL_IPQ5424_ENTRIES : \
+					  PPE_BM_USED_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_USED_CNT_TBL_INC			0x4
 #define PPE_BM_USED_CNT_VAL			GENMASK(10, 0)
 
 /* Counters for PPE buffers used for packets received after pause frame sent. */
-#define PPE_BM_REACT_CNT_TBL_ADDR		0x600240
-#define PPE_BM_REACT_CNT_TBL_ENTRIES		15
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR	0x600240
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR	0x600280
+#define PPE_BM_REACT_CNT_TBL_ADDR(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ADDR :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ADDR)
+#define PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES	15
+#define PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES	19
+#define PPE_BM_REACT_CNT_TBL_ENTRIES(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_BM_REACT_CNT_TBL_IPQ5424_ENTRIES :	\
+					  PPE_BM_REACT_CNT_TBL_IPQ9574_ENTRIES)
 #define PPE_BM_REACT_CNT_TBL_INC		0x4
 #define PPE_BM_REACT_CNT_VAL			GENMASK(8, 0)
 

-- 
2.43.0

