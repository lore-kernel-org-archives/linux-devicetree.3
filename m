Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752194B1D0E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008873; cv=none; b=MqIqnJxWLLt7yi9ht5nfTd1PTMo46zEdImMgNAowMTLfzQfoH3VaB19SB2I5TE1NpnQegbZpWnt08+E/TvmUUxVnw0NzCWtGTGdr7yuN0J/Rh9VR2tmi0noX6dhVohN+9ejOckDmKiP7D4XyzS1KF6eVMb9xg3YktoPR+Av7q/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008873; c=relaxed/simple;
	bh=rmypXG8PkZQdVlXsiCTpd3+Q/qn4BKM993nWuXndS3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2d2uKxnWLBoRH9aYsQsESOL4XXJfBHpO0BPBSI8p1rRLJ2Q33CeQwAuHkr3UvQWHvl1SjcaAP/vlAx/kxzNuYNdOxt6C1eqcqL33kVwF4jkLmiY2i9rvldMuHuYO92KmMgYDGYKRwNCLGU5+9Q2RdPZ+CMQ+7tT5U6xEIWQ02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0Lc2TxF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T52PwNHJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0Lc2TxF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T52PwNHJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAHx41016752
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=; b=l0Lc2TxFowPWCqiM
	jjmQ/tRwxut0WJmDORilcMkT3I12zkeD0keDQf9Hjsx3Hnu4QQEfVzN5oStMl07U
	m3KyKcXThhacpXIAEz8OrbK04CXMhtD0PFiu3rq5X1Qq8uQD8IeCVAL974Cli5ty
	Z0wvfo4hcQdScD0I7um1JQepkK1UFNoXdH3zFJCN98LCSCko6tcfa8P8xv2ZJrir
	pK/QxB010Tr/CSbxHiFUSfo7ZCGm9Y5mIXj8xdJwY5ZZluxxTv2yMz9v+KNPzfcq
	0IdBmlXC7mptK13sAVZGpFFndpootDwrCJdUvp6n2l5md0qG/UIwIQcq3xtmO8k2
	opOToQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxqabr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8716b158692so1496020b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008867; x=1790613667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=;
        b=T52PwNHJcIe3+tKY2dyTQKoMZK6XLJ+ug7Xb4as25kYn6pGrdnfGcarjGrHPmYdiFd
         KUfjLkUf9HjSnxuETYQCalCLvzpt3mShTk3YDMGhZtOetUhJiyWgW6BV1TMDGRsPPVKX
         kVQxz784WdXPC5FzB9hEp30+Fss1o2eRkgf4CSflpfSqLfhJge/t8FjREZNsW6P4j2Iq
         GRQqHMWaS+IuK902bwsch5XVuzQnLGvgcO6GmCCcMXio16VB9BKiu9s/1pq2q/iZcIVC
         02je3vFQUSgba1T7x74aYY+CmBmjzc3tTOtybqjoBYJ6fwVNj1OEyXZey6lIh+nFIJkb
         9NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008867; x=1790613667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NcY3STC/C/9sw5F0QDYnAfTg988+vE1o8LJr3uPSwE=;
        b=KwmezjJWvoKYtvuDbeRkHwPpaP75jV+5ZUpEBM9uydjW7t82YovV7qBvykSYERBjWI
         QftArrQX7u7xWuYX/m0V5x62lrRQUtApLYebvjxCIjNldbh+uvg3J2cRjpkkO+DFmfRD
         eI5P8y2dH9nXg2Id84lG3XlQStK/Z2RajzR6Ah7EDgXfbBJ5pQfvVjyekLYVvL/LPIZR
         xHEQABmbtROR7N8t/BiQly4l7bM9FST47+ux9+MWCo/kJ+0fz5V9HkNBzAGqDed+YvHJ
         Bv+nGx9i7U9M5jf90+4v/Jk4VaoLoRkdgChQVlsYcqHvxBSuXauUgBJwUMlH2F7FYgRL
         Jjww==
X-Forwarded-Encrypted: i=1; AKwUvBzS/xboOKHrpNM8dyCRLg9QnRWXkqdVTYvuMfYsI0CFNMSmMWEi0uzw2AApGzqvnJ8kN8I6a8HbunIN@vger.kernel.org
X-Gm-Message-State: AFuF++kEWP/Gx+xNUwl1TkW34z4/cZhg3f9QWBDMeonn+dc7DSuH0m1B
	Pflo0OxabBVuF8NvB4nXqh6jF5DZcQmRNE+K1KZ9lX/n+U968Je6QLUofg0HKvrSsadUE2u6CWx
	Fw05eWtCyPB3PSVlYdg+9bxzXRZNPdiaFAyOF0GGtArNC1yPaekrSjvtAoZ3Oawto
X-Gm-Gg: AYBFou3jrTK+ZO0pIee/pNdgPUZf+IxHvniAaswSOEWdmYECpFsN+8pNgDvbGiWJGT9
	Mp7zxmGptjKJnKAFofHrVX91/kqa0JzDZYIYnkvAt3pVcCvBrRdU8qQgU86KhBsX5wUM5z0ttWI
	JoYxsrYgeQw0ToHyTbakriAf6cQCiiTblXSSguip9NM9R18Pxjh71kJadT6IDkLtbIXTsEzcxuV
	6eUkudHaEdF+pi4LOwae4IXUxOdUGDs+72t+ggiosgs+e3f9k6jod22H7Oe5fSDrsCnIrZbwTGu
	oOCr1/mlimoimCHdw/z9KENeib0GC+jxoqu8D670JjpTBE64e5Gr6qlkIHlUJaBU5vvjztupMGw
	J7XbbHqM+efodzPTKltRQKaVcZQFALJ0=
X-Received: by 2002:a05:6a00:1a0f:b0:877:b053:2e12 with SMTP id d2e1a72fcca58-877b05337a5mr7701119b3a.10.1790008867407;
        Mon, 21 Sep 2026 09:41:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a0f:b0:877:b053:2e12 with SMTP id d2e1a72fcca58-877b05337a5mr7701093b3a.10.1790008866947;
        Mon, 21 Sep 2026 09:41:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:41:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:10:34 +0530
Subject: [PATCH v3 2/2] clk: qcom: Add support for camera clock controller
 on Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: JiCNVoO8bF-TadfMIAOX2dg_hs28BVlB
X-Proofpoint-ORIG-GUID: JiCNVoO8bF-TadfMIAOX2dg_hs28BVlB
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab15e24 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=x7oLaaGiLmRgSqN1hWIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX+ifSl2MhqFoZ
 NlX+uUo35q9Cmvo6P7zVEg7aA39diZP2ZD+oiodhKCQylWh7hBph8ZlIRfBXzXzgxXeu+YzP9f1
 swIXOWsoSJOr/wZqHWobqOALkNpfNymPZ4WA/Hxarkr14wJnDG8Tw3Y/ATu3nxTswQlHtnmMfSi
 dtTOPcb1BuMxu5u1OEHYQQMTZ/MyDJ+F7Qi5BR06qDgI/0pmOnWAtSew5aSaJsYNdOHNcC2e/3B
 oMw811tQyhrzyyXRfvRZHZvPGq9+2kqgGcFFSdRoBoA31cQACcvG0Xr/s193KbkFJ7Ayw49QuJc
 flUOIU2GwqxSVxz5HIunoa2tWisjNIM28A0C4IqdNwd7zNsN2HLQp01MGDKlGM5D6808LjvS/qn
 7iDpdYXeX6BtsSqYtIB+cY6NbUWMEe5CxsuZG4BZdyMwEHXg4hkhOeIqPC/SB9GKU51/9E+gqi7
 QTdJtzqNzvRreFQHpeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX1mGMYUcLzzLQ
 ULMdEiTR6mHIp6utCTtb9POtXXhBJ9Gbv7CptNf9MJp5XK/HDfB/PPd4+vh0OQd/UcCdOKSEoL2
 hIE0TQpEu1xD2NDMPmkPA8YGPoiaxZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

Maili camcc is mostly identical to Hawi camcc, with a few clocks
removed, frequency table updates for a few other clocks, and PLL
configuration changes. Hence, reuse the Hawi camera clock controller
driver and extend it for the Qualcomm Maili SoC.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-hawi.c | 158 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
index aa52b99aec003f7b9224bb89a15783dcf3889044..dc5c108ce608c2c1131d8e7edd236becc9fbe909 100644
--- a/drivers/clk/qcom/camcc-hawi.c
+++ b/drivers/clk/qcom/camcc-hawi.c
@@ -66,6 +66,18 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config_maili = {
+	.l = 0x3e,
+	.cal_l = 0x42,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.config = &cam_cc_pll0_config,
@@ -141,6 +153,18 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
 	.config = &cam_cc_pll1_config,
@@ -193,6 +217,18 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config_maili = {
+	.l = 0x1f,
+	.cal_l = 0x42,
+	.alpha = 0x4000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
 	.config = &cam_cc_pll2_config,
@@ -245,6 +281,18 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
 	.config = &cam_cc_pll3_config,
@@ -297,6 +345,18 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
 	.config = &cam_cc_pll4_config,
@@ -349,6 +409,18 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
 	.config = &cam_cc_pll5_config,
@@ -401,6 +473,18 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config_maili = {
+	.l = 0x32,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
 	.config = &cam_cc_pll6_config,
@@ -476,6 +560,18 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 345.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll7_config_maili = {
+	.l = 0x11,
+	.cal_l = 0x42,
+	.alpha = 0xf800,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
 	.config = &cam_cc_pll7_config,
@@ -505,6 +601,18 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll8_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
 	.config = &cam_cc_pll8_config,
@@ -682,6 +790,17 @@ static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src_maili[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
 	.cmd_rcgr = 0x212cc,
 	.mnd_width = 0,
@@ -703,6 +822,11 @@ static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src_maili[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.cmd_rcgr = 0x21250,
 	.mnd_width = 8,
@@ -1076,6 +1200,17 @@ static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src_maili[] = {
+	F(300000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(376000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(445000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(609000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_ofe_clk_src = {
 	.cmd_rcgr = 0x20120,
 	.mnd_width = 0,
@@ -2970,12 +3105,35 @@ static const struct qcom_cc_desc cam_cc_hawi_desc = {
 
 static const struct of_device_id cam_cc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-camcc" },
+	{ .compatible = "qcom,maili-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_hawi_match_table);
 
 static int cam_cc_hawi_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,maili-camcc")) {
+		cam_cc_pll0.config = &cam_cc_pll0_config_maili;
+		cam_cc_pll1.config = &cam_cc_pll1_config_maili;
+		cam_cc_pll2.config = &cam_cc_pll2_config_maili;
+		cam_cc_pll3.config = &cam_cc_pll3_config_maili;
+		cam_cc_pll4.config = &cam_cc_pll4_config_maili;
+		cam_cc_pll5.config = &cam_cc_pll5_config_maili;
+		cam_cc_pll6.config = &cam_cc_pll6_config_maili;
+		cam_cc_pll7.config = &cam_cc_pll7_config_maili;
+		cam_cc_pll8.config = &cam_cc_pll8_config_maili;
+
+		cam_cc_camnoc_rt_axi_clk_src.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src_maili;
+		cam_cc_cci_0_clk_src.freq_tbl = ftbl_cam_cc_cci_0_clk_src_maili;
+		cam_cc_ofe_clk_src.freq_tbl = ftbl_cam_cc_ofe_clk_src_maili;
+
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSIPHY5_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
 }
 

-- 
2.34.1

