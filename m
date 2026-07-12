Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9143403E0
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870141; cv=none; b=F3B/xnPomPHBFBASJrBhxXpHk0e6SWend9TXSoc2nc9eD93CslE+ajc/0zhW2fn9Yyk4qg4mYNyIBVTpGJbRSrLAfVfUOcvxdiTvgjhhcBNDgJucB4AGGX18qtE36SwLoF3lnjfrWbKSViJBAW4aN6yqRr0XUOJonQjt4dh+Et0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870141; c=relaxed/simple;
	bh=vndsUeRg4LFLcX149F4anKCLh9nHIAwuVq42HyJm6zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdKOce5aNDEo4z0ws02VDCGvFCEQgqQn/SDtwtMe8VL9yFLsnBEqm6eh7ihNpCaNuG8IjRQn8XLmqJ1SOwFiHbtLs88IaWq5iH9Yn4lHmMgN0w5pKTvs/sn7hS+nVweD2h7VzkyScagOZquKgUuBB/NOghwXYTJWo/mTA7FMrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKSXnsFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSIwHuv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKSXnsFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSIwHuv0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZffg2563886
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=; b=kKSXnsFDtObkYdm+
	u6R+eevvx5u76k83II0GHLKEVWrgbKCAfjRcJdNl2n4oNaUBb5rkip562ZptkkxP
	rb6jSQ/EMUBZmxifFVSfWj96Zf6/5r8ddDmE0f1CWtUEs6e40UBWZPJx4MNhJ9SP
	Tiei5J1fqNRFgn8U7265+HLNEbpAMuWU+X/tagl4k+bV603Rz3bSmagVUhEeBk+2
	GFjTOlN4RqMBl1YTo5qnaT6Z10Hi4gpv4FQZDazjl1NYyP0Wm64gvVV0TJGAwdSa
	kZ538emDMtAlXZ9bQ/Qp4a38yyEB3QJC7CbdYJLTJo6UDiGJj54onchKR6snONo/
	uXxGtA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf482w7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so5841053a12.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870139; x=1784474939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=;
        b=eSIwHuv0gpaaW0EkacrgDp2p6m3dz2FW8/jOUNv4piefiFTqz6Y9LQ3IvA8+FGCgth
         88Jy9QkDqNHPMNFrL19PB7ymLpMVYRRR9RvnE92+10GEKJqkQZ64emnIZYacNLtDM02F
         xf7B0Lu4Df2I7u3fkB6o7/bAsJDUsNZB/bbc7S/I/3PJGz9opB/alDKj9Zmjs/ewRZrD
         tUS+Qu0selkgVcv+W1xmvBihSI92Hc06/ZE5jXKVf38QM4bNSs7Dm4msn9ayQY105g0B
         +H1G0TYjWYme20DHWlfTvolFyxS/Lm1Oup3MhyHLse47MZrygg/99cWcd1WmydSCJLDx
         7/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870139; x=1784474939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wtn8qmkEProTeRWQ3sXxWz0hSrss8hVGxBGi5v6Q/jk=;
        b=ZNps6eIaCH0FOLPJBHmxjpyzf6YPeTF0mHwodQ0mrIxJfsQP49LeSerUMpsHjnSUc2
         Mv79ZDx5LVfwleEQv9dRPViJdVdDx/FTQ/fcPvj4/BLnAg3WV7W92UREiTltM4tPiDzd
         wTiAWWH2IDCp8fTqx0NYaA42KNBn8Y5GKefwU9WpNJloNVuOB+jQPjeNcdV/5uvb6UL1
         1iwBcCiVtJ7EFElgFe2npAq1zm0O34U+HrcGzElmti8Kr282g3QBrw2nt4uiIwHT7Jxr
         l2Hp8nuuRQjYA7ZV1m4JK7vvesx9Xi/bbIRE49Qbv7unSTY/cJk3M43BXH22tOIc06uJ
         nVHg==
X-Forwarded-Encrypted: i=1; AHgh+RrFzBv5Hs+FdAjR61vgfRj3oOJW7lJtRR7FlCqbvw/WAKSl+KvS6HigdG+nwDMHOMF8lYP7OtwlAX8S@vger.kernel.org
X-Gm-Message-State: AOJu0YyXt/GY2AEcy73rEaILaNqTaG0UayLK0XbEDrLR/Dhp/+q4tavc
	+RtPrU+RWzRbahusAEyMzobP0qcsb8mhotuM4O5ri1He7MJFfcNlExxYNdFLzuFh8hrGG1n/gUr
	G5BRmXXdSQI+cJH93eZmyWrnG4ODrjjLx2nPVhqlTotRqrg0ZhpJkOL/Mgt3KXI1q
X-Gm-Gg: AfdE7ckLkILiaHMSPwsNnRzkiRtqW4E0cKkIsUx7aP0849U8Hy6fnD+LSk29jOnFYuC
	qfKQJOyW+QbomHC2wHHDe3TsKWCDuMEvVEkqpbM7Yj/RBETriX4IX+YmKhbtjstBG4phUT2psQP
	s0PZdjkPFqSoWPJgkM5quhWM3LeFLiYaJW3rNA0fyn5VnhFiExBiVvkUoes8affcXmhkc9T3KLS
	PXERutZSZViJrnrGcSK09kbGq2v8cgOKn+9+u4rY21r19Pk/bsBcZ9FDq9RF26DLh8OeRZhWtY7
	ZeEvRQVoy0321TQSVg2rpvFrTfP33ZyPm0jk0LB8+u6tT623Nash0rjm2Ix6E/S+xpgsgQXTgRL
	Zg7dWZp8vpUcRhws0zmWiekShd5xYySoMJUs1Mz0L1IHMormehl4mxOyg9o6mEbvizkqgBohWQN
	19+U8e
X-Received: by 2002:a17:90b:5384:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38dc777c40cmr6139275a91.34.1783870138994;
        Sun, 12 Jul 2026 08:28:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5384:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38dc777c40cmr6139253a91.34.1783870138591;
        Sun, 12 Jul 2026 08:28:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:58 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:36 +0530
Subject: [PATCH v6 3/4] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-3-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=1543;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=vndsUeRg4LFLcX149F4anKCLh9nHIAwuVq42HyJm6zU=;
 b=jHE8QHzT6nM/WSa/aeR2TU70HNXWXZZMQfTZ199KDr4Fdirt2KXdhHM6bqaUFFHRR4nIgfaBC
 cBXSG52FqNsAeM1ugNetBk2A5Xzd7X7SJMID/vK8B0f0Iu2z+oVVqz9
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX90fgyP1u+h12
 mfmETkVJk9F874Lnt/QHJCJMwXkDCErhrQe4vN6VcW/OVr4oro2EyuKF4pYboU9baeWl7o5sX7r
 Aqxp9AgVClsLxoD9kh1Ei2EDsRi+NcE=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a53b2bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Pub0nXbp0FV3ozl__XAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX5fN2twYSvLHD
 +l6KsPuFtCvuD/LcNAgvIkmLguhoxYzCR7cTBU8Y9bAUdOjSGDBGadaesVDZToJm+/G7++OLhdq
 z6c6/kmuC928GqI5FG2pQUSi0sUDkNF1UIfuUfB9FGApqjFYQRb1KUh07bNxeiKjdQSp3fk0CZJ
 2QRK4t7zkzKbE80gXhQZj4fdBUM8bTvA2QzuqyCQEjBmDTITJrWdkIsBuuM8a46K4a2+dG8UCI7
 YA75Ur9IMxUwa9Qja7GO6M7eC5xO+TVBViuf0bN4X/XOyVW+SjorYR//pgVxpyRe7TRd4LWtY2a
 bgB0s4KkOvnQxvFYmXSMcI2Tvohv0r492ugTxCQQTThMMAv1z+/hpVHVGetrfAjy2fvB6bK+kHu
 IOohSlcK0f5+LQfDqPz54Jw699WskhmTN47r69pl/bPVQHUwQUMph5fXVP5Y5FI6U/1SLDd2y3f
 MynXP4MGy/b52MldY5Q==
X-Proofpoint-GUID: XK6v_U5IvnbC_60Cx4KtB2xHAjUAO3UN
X-Proofpoint-ORIG-GUID: XK6v_U5IvnbC_60Cx4KtB2xHAjUAO3UN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165

Add init sequence and phy configuration for Shikra. Since the init
sequence is same as that of QCS615, reuse the existing init table in
Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b22b3c6adfd3..101c0820023d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -377,6 +377,17 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.mask_core_ready = PLL_LOCKED,
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = msm8996_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -953,6 +964,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1

