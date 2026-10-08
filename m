Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE44B1263
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471142; cv=none; b=GxsABwMs+j6Is9+QO3VjdZhAFmh3QicrnOrwrY1myMZVIv02E2XLDWuTCpz8IMMM1mUpiRGIsgEz3oSdu3jOiTnMF6XDNJPE5TjwVwmCW2YRgj3m35bmGFnOEw0YdxJBu+G6ZFHPhJxPZT2yHUrQoWfX41VLp1RZ5n6zHk+ag6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471142; c=relaxed/simple;
	bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ex7K2/fsL/cxFxhPDf/NU+VGr1spDXw1y2ut/qcKBIzZ34cdaLkJBg8y6HOFSRw603p1Odt4GZz2Wp6U3feXM/fHq/0KCEmeDjv0I9XJBpyvA0Bb2OWrkEa4ROwfRKZxjltVDdPzJEqW4mLuL4/bcBy/OoM7xa+2zQMCuPtBODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7WtzRU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpkWvGfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7WtzRU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpkWvGfA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVZ1w1685306
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=; b=b7WtzRU9DgBftKJF
	YYqACnn+AAgRSOAx9ZHUHDBR1bGmvFQ5eWD+tJtZ4qQmb/fatQPzHHPs27OPdXdJ
	UlS8wI8xPKxDaI4WEtYkxqv2KpsoQkr+NQfoJwFywdlG3wRXbQMqun0lRWSF3fxu
	f7jdjgT8NintvQSSFtQJfEt2w3BIz3CVa82qQ0VAuMMTTIbm/a6PBTqug3kXB1Ja
	yPd5tLnIKzdzt1OTRy+R/nO4qgQqQMzb7tdUtelbwxqADPpO51KiK1mv+spODvMm
	UzXdujQqpVDpuhMfum2H75aPMshtlfdXef49fkRksB3mttNuDPR2uoqpuC14QzaI
	9xjKbg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe33a6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:52:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b04ea2d440so41014667b3.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471126; x=1792075926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=bpkWvGfAbuleiafRArVXmebl165R77BgalP/gwREHsJFVmoUWQrjd+ddTNHBHTdF+5
         BMG5WxcTuVJs86MchcIKV1GvGRl11V/anMR84ycyuYyRuVxbp8M0HxH+0fyd1Ra6jjcD
         t3gFGiobCP5WvPfqJbFkrXAxE9uq17d43YOHfOCYt24/xQbFDY5q1jGI4P5NqBNz1uVK
         VU3aef7Y2N+SC001R/f4Z+7+aVUPxgHlr2KMVL5xfrlk+n84FjvNm2JgrusxehMSYF1V
         JeVdYgtau7jU5BgfvS/54u7kOxg3XnbldaX/WOuLo2lUcZ270R+g956qxWHhz3sfGopp
         7b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471126; x=1792075926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBuopFriM8namgE/M0OvieZauXK0tnH9bKnJIJbjJYA=;
        b=W20k3MXD8a41V3sAEe7xqKn4AvuuH+AuT2BnrGoKhWqVkL+y4amh9k6/+3sNZ0j9PH
         KZT6zDwPX71D+8Jc0N+82m65c31kkvQYHu+YDTJ0r4F7I226lNeHstFruX8InWjDRuxk
         IfYBFPoHvm0kzqNoz0pMdEWfb+LHeb4k0ILfEdnvRYdjg8qxKoDcIuWXxk/Pr1+7AiBX
         arVMCgvdXzTW01BmgzweDshK4NoLiIc6SzgXUA7U4WPYbpNGH3IYOs2xjCDj4+iZlLxA
         Z6gpMhpoyF1XZrDNpVOCuFBPq7a5/RmMn2sJ7jeOkSdFCvDlnoKv5PO1ge1t5FCxCYT7
         h2zg==
X-Forwarded-Encrypted: i=1; AKwUvBwFd0uQPJwx9S5e2O3PiCMrNl9HEfBu2BS9ubX+T3sKa5KdBUwnDnWhd+e0eXnTDPz7JG/5dltsRgsk@vger.kernel.org
X-Gm-Message-State: AFq9FYKO37m6NBJvhdzY6XW/F6RDTSenev7+XvIbY/AZBKJcnt2Se+KX
	EaXm0ODYKuYeefRI9C8jxr8IVj4yyzlWhLW18LWcf/xnEaMXkbPkQsR2h2F+PhUjr1pOA4IHO+P
	5Db0aKRWuQ/RwiUINSIPLiz2IeBICG88GrpV2Z3y8Mhx4pFwIvKFmSN47swdcx7fj
X-Gm-Gg: AYBFou3Y1btWbBpo+CEPtHdOs9WxtqkITT5TxFjMiK9ghIU2GLYMeU9CK97tJY0w3Aa
	Nw/1wtKOuPjVTmWFhO9C/Rpc8wSd+JpZMlkJr8/FiOSfnxbO4q0Uy6hqPJ+1YqzT3ZTGZu1vrio
	N5v7dKIGGagQEqgHUlXqm84mW7d0ZJ0D3Tc85xaNpqfyg+gkGrWLAVYi2mFnJjxzp+j+/ijwQe7
	ir4+mg34zuVU7UojgtgxNSgX3iPRXJPMTkfY0mQrKxE6DWJbjJ/PyQT0YrzS0Xcy1toD7n82iS2
	W0f3BSAW/+aR1i1gLHWSCR+AdQNChTvd0SL33pLvGx/jmkUb5hw2P+uatXyCIHu0Qd3DFvTEqt5
	9Z5qTEr53N8GRyq3MzXpktGFD0lBIABs9DldhLDt2MVo=
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28436057b3.64.1791471125728;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c5a2:b0:8ae:521e:b3e with SMTP id 00721157ae682-8b05b07f2f4mr28435777b3.64.1791471125014;
        Thu, 08 Oct 2026 07:52:05 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:52:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:43 -0700
Subject: [PATCH net-next 11/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 counter debugfs support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-11-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=6180;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=f7UgC/h70IbjkbEhISDmBS8SrsPHSkVGFtcsHrdgTXk=;
 b=wuap9unxYof7C0T2ucWWZklA15SI/9X2QkntAkaUt9ntWiHUgD/rMEhKFOb3gYZO/O0RjFrYR
 T90Hgv6EFvnDfTy3agnV1lJaAm0oudZ8g1O6zdq/XDzOBn1BPu5dw6q
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX0jD1keXIovJV
 h8KhovAn7JixgJreX89yBDFGZ6vlbaD4fZfeNQ5K/R9L77Y9Es9GKZG4lv8WNNZ23vTyhBC/mzV
 LXbIlT/oQRwktqrO5ErbKwPLXCXAM9cflUaRcWAdme1p62LkdNkk2PUDNpam3FQi2Ohwavq0M/V
 zyMuUW67rTuoJwaCy6WNO1bczQzFvBEHFSgHApe4YX3m7ec1rNFQZ760rCy1rdi6ipqGLt5OSnN
 fjwlmq7NI9n2QEmUY/1LifJH9/j6Ha5x1XvCkha6uTbgtfXpDtLT3zaCMC9Gyk7VOiHEEe7wSOG
 5X0qRjm+OTq4MBUGhxIkbapyJfLf8cA6I1Y8jYM/vxFUS//aUM22bgSRgY70oWkV1zNFvKvmPdb
 ehzvDeyTuNp1PPiww2UKrvGdS6AIqRVsg99D1xpWGs/2i3+EWeD2Lkuig03iYCTzL8RJ77kkixf
 xo/sc5MqsUijpbCWd8Q==
X-Proofpoint-ORIG-GUID: X7zQ2OtQxldsM0cNiyUuOz514m-OvQVi
X-Proofpoint-GUID: X7zQ2OtQxldsM0cNiyUuOz514m-OvQVi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX2AaK2qN5tXvD
 inR5STtSkf1KF7F1iklPW0DwmDOfMk2h6DpuibGEXdTbFr7hZJpfWjicujsiGmQ2iooHVhK7XzT
 fDHDYOSVLWyN3PdYiagt1uhp3FEaljI=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7ae16 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=76TLMYU0KGnaRKKVPX4A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

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

