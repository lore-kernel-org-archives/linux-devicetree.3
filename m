Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05748EC68
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467029; cv=none; b=AC43AG1D/r3fVAEAEwInaeWfW5VsRkIayIty9hGteR8OQ1VOEWq4csLRmE26Nv0isVhlj3BWFhDHm2w9ZkUBm9bBvcJKvWsnOozxoisWDS5w6Wnwy6XesgqpKZBxr+S9SoTgShbSfXTzIgV+5gx1GtNL1KZLiRWsPt8yMszCP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467029; c=relaxed/simple;
	bh=HZyCz5jD3KbpAZiYF5dRLfwyPm7VIgD5v02kFD7o9sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ph4tokcZXeky4mKjEAQX+Wta+p29fEcMtcdnD8Q0A1lNdotFsDvTpNhoIjRLhr3Zc/cFV0DIzGo8pVIKvNhR9JwYqW8BFlaBk0vnCmZuKZpmKISkTqnjLYNVO9y3gyl94dy0+NDgxeoFtR64cCMgMmTFyAXMhma2v5T8apM9RkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8l7NXCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dv8WCofe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8l7NXCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dv8WCofe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvM52584528
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6G41HnHEgrSVpZiRgZevEocSE3Y9rd7VdQKi0lBvRfg=; b=h8l7NXCGY1jVm4VB
	EpO/z0UNorqlPR2FYzZDhXXh8L7Z8Eee698qIhQ07Uai6T1I9h9gZX+I6wiiX9p/
	YlyJFFcb5MxErTqs3IsNDa/v68NDYhdeBItJTIDZWu0FQtn9WLEsGWWljrbY4w8n
	jSC6+OLoXGdQF0CIBoGb3mxJEQZfsXtSwyEurph+194AXwW5A215m3Dk5YHeS2Ud
	x3LGyEn37JZsSTx/+MGBgkK1KI2+LTDuEEFN/nu5IerduUIbnoCWX9oq7A3ydIkM
	H7K+mrfX9E4amtHAUtLWapRgE28dAA7BJW191JUww/HjWQsgfH3lc3dlmmJ3x5Vd
	ZLc9Xg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b3c58d686so8859477b3a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467024; x=1790071824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6G41HnHEgrSVpZiRgZevEocSE3Y9rd7VdQKi0lBvRfg=;
        b=Dv8WCofe37IvPgTXjTxsHAMBe2o2NsPI+toxGg5x2xlrtDwL0uG0bXY8rnOHuFRYm7
         wnNi121/2nWLvEM7ojylX7NnvpiOQsypkbBK9C0MpbJrsjWBN22qouXYdBw0Li03iOr2
         D8ivB+vbx/kqWn8yyHGMs65jtKszj1mzvPOD+bC+uOAbl63R6uVcssYLriiM+7mi+wEM
         3/JpRvrW8jakLOIc1QJTgT2Nf6f1d0ezpus66CqTnhUa8DGRz85wgN5zb/DsgevwoAbG
         CNRzIR/Lg8VIRlN8AYFXZ18eHTyzQ/sWL9Mx6EoNxwcvvZiJHJBJsG3scPgX6chAM3Ef
         mDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467024; x=1790071824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6G41HnHEgrSVpZiRgZevEocSE3Y9rd7VdQKi0lBvRfg=;
        b=QNPpyEieAB8rxUcWo2LjyjB+jxdGK+GJt9nW1Bn3isR4Vs+WAuWX+A+azaax0lvqDF
         /mEl/NV7F1LT8sui0ONHThZAz5YWWmRHHdxMTeaEXPZ8dym0p7Aqe99vTuuF/P0KVxT3
         hrsOZ0nMCFGGN4vkuYUudkSvv+pYuqhU3eENhate/DR5RAjDro9eZ5/thS5JA+R/LORS
         eA15XWft6xi7wpfm0+ANz0ul5nNB9/ReBGGuN2vAQy0nTgaJgT+U/LrQM+vFEf5A0eo9
         8DMPpE10Vd1Epjxpl0uxVQuPg6f0k5ZNjLMNWUX64+AQ83huxYUQrkltcmhr+pOcA9+y
         TvbA==
X-Forwarded-Encrypted: i=1; AKwUvBw4c+siREMg9cH9NQGNxF7EyL0T056aVz4mzFmjI725j2Wj6W2rGx8U/Ru+pYgIsgLTy+MxG6Zyw7ra@vger.kernel.org
X-Gm-Message-State: AFuF++m4ZWrLzDdGtdWvbqgttv8zeopZDuetqxoYRHmEPLNgi3591r7R
	jTg2GLmrGY8Mmqr6OanQG+O0956VFw17JNYFl9NUSs8lL+0JqYoHnKa8NsSnjmXWKDUONY6kw/7
	acyLe3i/Nwf9cSJqAzd831MsdQcTqQbupMw3csuxMlV92Po6caDadmL6d83S1upFu
X-Gm-Gg: AYBFou3mCd+IksL2D4AfW9OK0rA/xje/tXGrJYbPT0MiN5wCzmK8ud9rYH+CO9LGGMr
	NvVNLvPENLNhLRcC3C5BR0vXsyslxHpSnQpjm+YqdXl+jwluQtB0Cq6VuJSCaO1RBZHfh61bJJM
	hGCBsgvdBqBj9ji+3vRc3RnVKrMDfiu+R7OlCHTGhuG3RS9pWGK91g1nWtENeT5i63ZLD5B8JW1
	CcsyIJ1cn49VMhCQwTg1feCDq0eFU56/+3paYQbrT699RDvO1eHQEs2KXUg1fz4xvUeTUlzEo+h
	tkDlGU0AlNYdhzmrHA1YlykgoOGvyziHWuP/eCGbtUh6AIx9WHEPVrudZ0Ab/T0o97eyirTA0Jn
	NPyQz82gU3ni4VdenjU0p48KdvyyqO3DuU0QPd8shwIjMfFqUdmuhE9eFBnfx62lSJZ5VfHuu5g
	onVSMVn1SrzBA=
X-Received: by 2002:a05:6a21:8cc4:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd527951dfmr1141418637.2.1789467024227;
        Tue, 15 Sep 2026 03:10:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cc4:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd527951dfmr1141352637.2.1789467023843;
        Tue, 15 Sep 2026 03:10:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:03 -0700
Subject: [PATCH v16 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-8-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX2Q+9gjbqHkn4
 Qh8tOE8vtaw5rkuNNFXblvRmV3s+KorByxC63FJPwK1YlHEr/DpycXwoDWpua0QR01yGwsevjed
 wIFFKNlxtyZPPrApvOG+BPZp1S9ZOkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX3GM8sySy1fd9
 FscXcwo7lULzcuinb9hsW7NJiG6F028duVWz9rWf0TeRJ/iMvu4bjlc4i77k5IOKtwkyanPRBtC
 AkniJAToCif9Mab0nc3r5C2WFIMAtb16M5CXuDF5tcefxmM+X9XIkhtsEYmpjqsfoqzXj6Y7PkP
 X/B29uwlkQZwrvgWyDTbJbaZx9TmuFH0QEYmdyum4zOp3rkZgBR8/gEs4ihbDcv9/ozrWKt8KRC
 X68PWiJItFaAl3JKCwW2NImHClq5+J9BOQGMEmtmdua0EALa2CqRYVkB0xjzlxEVWLKDhW52zbl
 FnDsvTShRAorEFjsmEEBydBGeC1aX5czKteVINNlKbGOE3KGk4ugG8Y9HHXHsfZoSPKdq79Ifgs
 ylEa3QnJU+RYnCrqcC5rX25kjqHgYKD1IolW4TMEBqlRevmmYkfExK5XVnw8vs0O1z+2qxc5AnR
 u7OIf86JXfMoo6MVEyA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa91990 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: sUZ26MXNgZHY5kYC0h-wVJ3mov50KdIs
X-Proofpoint-ORIG-GUID: sUZ26MXNgZHY5kYC0h-wVJ3mov50KdIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID gen4 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
index 4ff2f41f70f7..bc52e4a1135c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,12 +142,21 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 68ddfe911bac..e19f9b54454b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5889,11 +5889,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

