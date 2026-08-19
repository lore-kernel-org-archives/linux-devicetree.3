Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12D3BF67A
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153056; cv=none; b=dfQr3Z3709H34IDIhfNu79+RPHglsFQKuscDIgPTmVurl/BRm+I0TWC+Nn3G6tf1XktxA8wyuAuHUD0sFMp8wG8TsvO/EEDhm7Oz49CIyhN8LfoJqiI6SkY28C50dafLFRvphhSkVUDeeG2mOeThpAf9A1dYfGKMA6jTdlTwbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153056; c=relaxed/simple;
	bh=9/jWhBT2jB+VS6PkwWqHNhBmY/udCFk3hQDKYhDUS4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbRnEFm/ttvoBRL8PpFTOnOb+7UlAmFiMI+23SqbRNJJOe0sX9LlCRFXbk34jsLzXB9nPlZRQ5KsLr8nUOEOkVNj/th0q5JHhJi/h+7Ba+ncrig+jgabhnkurC2ia2vvu384ZndKadfrBQR8a3YxLVeioJS6YcIbOOu6iYHyBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBd4DgcL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INMRZdf1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBd4DgcL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INMRZdf1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbnmS068018
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sq10HccuTC0NLQ48P9xPSCZ0k7r7IBtIRmU
	Gb1WxBbw=; b=kBd4DgcLqPIXQxuQhA1wOezvufZrWuero/z9Zq9TEaEfwYNunby
	PRs4ffIQjbDU/UNCZ6l2nqpwCZNN41Zhk9FsELVrOtdtOOHdCJiErX1Vz4ktUfCQ
	nn8oodTP1rl5vBA7E1x/2TngtTyTeqyxKlKnRAI349cLTIkKZHq1JKBeBcg2LbiX
	7D84CxqhXUM0Sk+JVUgAaDx8qEGZl67p5MsC9lvM6h0iUdpQDPavwKa9m5qJDb/l
	tgwwPVnfgnZr/gaLaa2WKhfNT+e4YkRS11gOHXfm4IuE3tKwiCuHrRo15vIwBFPz
	+Ecs9IC/DVlXPZ6jNHZUjFGuujU+v1ZOKiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d09yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:24:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2487883a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153054; x=1787757854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sq10HccuTC0NLQ48P9xPSCZ0k7r7IBtIRmUGb1WxBbw=;
        b=INMRZdf1KhR2Q0TWbcQixSjE+1FKaiiaGGm+3aSpQKzyAk6hpkGU+m7tdkqHPvwRIC
         +NLhoBTsRL/KMNlAFHo0gfVbkkvYWetH25GgQCRepACS9odG/U9ZVMZHDxvbrtv0ZHvK
         VZ1sbycBYsT+7O65+p+kS9zam0v9bsbJ0TuGxpONxFFZkxZfkliN51wokxc5fOhufqou
         MxZbsAEFCPBOHw9BFjJtYth/fdzfS3hNyREQO4akTD19Cg2xEH3nR8cL4+cpxz3DCY/R
         kZ7w5jLimNtDd7kHgtQJyiuO0nTWmmEMzte2iCMoytFdy5kW4YgPEhIAZxIetqnUf8h6
         YTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153054; x=1787757854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq10HccuTC0NLQ48P9xPSCZ0k7r7IBtIRmUGb1WxBbw=;
        b=PEDrt8ArwiHiW19S3uTTFNePC7WEztja7IUOCgklrlDXdWnaBTUtDkFpyM44zIdGLA
         IHK1oFu9Y2nEsq6TMskzDpxHv5XNxz/ddksQD3FYWbvS0QxPkjkHY8ur13pEwyhqtVVJ
         QZNjOVFUcYpZ/sQNp8rqv6XZ2fL+JU3EDwua+CYD3rXFU+S91R66rN76FLnuD+AF/Aua
         P6PSO32qEaHfj6NYlqcrDVk0DzTBzUADkGRk/hmFPLQ261OWrhBEcVFVIQUsyUSeH2/p
         STs3Mf11PN9N1zrAQ4dFpFlp8eMMtUQoY/4cguJY8XBMqaiW8qsfeO7h+u6xL+OyvBkB
         dyzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSPCNoByWYJ3E6FZdwkvGVRg3Q13fViER7fCS5xtja8tzlHwlS3IlqtbHU7OQylpxmswAm48mUuYor@vger.kernel.org
X-Gm-Message-State: AFuF++k9lcpB9NyGJzksd1wu0oIsP+sibIlcgu/Y9mxTvL7ZGF9CbZ4e
	HjIEnrUEEJyZYXFnVdOMMGOmMkcFBTUeNJ0wlrWl0dn0gHO5bBh4gpN8Q9SNqKgx6tPYnB/EPnz
	G7UMjNc4SE4Iwe4vvsYAEq9zQyKPeFduqGLFCW4YQzUyBrUD6cDEWbRkgj02Na1w3wf3tY+JAuy
	E=
X-Gm-Gg: AR+sD104jRUFMDMmDce679U66mWcEaNPEMgiG0KNh5cRvWXc/6q+0cRRrMsoukaaMmW
	U9UfGcdVhiU6oDaNSDSjLznHhqCop1i40qfKJM3LrKA8UgXxmVI54UM18hmIoW3+H9DuxQ5eVDo
	KhYkyMBLI95W0xLuP9uaqa6+hI09xDQFeA4MzfZe9fP/ebB5oF13akZ6hWsy0pswEWc3/ZeTuRM
	xRXqxo+3j65dhnYcGGZZbozY20ZYUZJo8xnmsBF0XHpdgnZmGf7e6rvu7G+Hs+gswuXi+DtXOhA
	Ga0sO22vrNw+3ehgbDBDWP5z4Zcvrw5Qp9bZ4YulhMdTCJHK68CZMwSas+3yrWfB8O8owNZ3Hcc
	PU5TnRPz1rGanBCXR99p9QXoh4nNIuYiYpMzk4JIxqWTL0w09hXIkVIGtbW1k
X-Received: by 2002:a17:90b:4d0b:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-39581211d6emr9490689a91.12.1787153053635;
        Wed, 19 Aug 2026 08:24:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-39581211d6emr9490599a91.12.1787153053114;
        Wed, 19 Aug 2026 08:24:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm15148144eec.8.2026.08.19.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:24:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
Date: Wed, 19 Aug 2026 23:23:56 +0800
Message-ID: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX3kd9XrRfx8lw
 xT+p/71SnVADy7JqNhvJs+jjMiaTs44c3i9+r3/DEGurJzmzmj3Mxnv5zyxtTVaUr4oaexRH3pk
 W+apKJ48OwtHrBIlSlbpmy1TeEuWrSJUGY5vllwpOLqVlYV3qUAz1sGXW4QgEBjmA6WRHOw2zlC
 845FxCZH2xQ2ij40/75kZKAo5leD0miBTemy8YAoXcOQnzNn+M/AcvQq0T3ZYBoBpm7aCmOgzJw
 ZXb0jSKffT9uHdsv68EUcm2WIIrOd1tQST8ZYiZFaWZpEfZmVsZcU89r1w7B84C+tGSuNUlQt1M
 ORkeRLuLpJ/z3hGXx7frzlpbCBJ/NRKxWRsfuXPRIjkYW/UyybshQVbqt+T4P00Zhc4/1JCFE9e
 kYoAb0ln3E7U39hjhpugVusk3qGhL+EIF7TvKhkkyVtnzuGMS6T0ue1V8Swp857fwVZqO9ly8Jo
 nASe3dlx8y4PbWYEDFg==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85ca9e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hkSOFwkIQQlSBzuAjywA:9 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: EJN9sOWPPPUx3k5xGmYyAwdywLCob_C7
X-Proofpoint-GUID: EJN9sOWPPPUx3k5xGmYyAwdywLCob_C7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX+W4BUybmzJQt
 P66SOfOEh7Li+imMxkq3oBl2Zo4k2rTow39ioaM2dvFyK8LBSMjBDNZo65dYtpzY3kL8tCitM1u
 MxZahIQh32MwDqADO7h6ZMzHNILVoME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
respectively.

Both mux values were named "qup1_se2" (respectively "qup1_se3"), so the
two distinct lane pairs became indistinguishable. msm_pinmux_set_mux()
stops at the first entry matching the requested function, which means
mux value 1 was always selected and the I2C lanes could never be muxed
out. In practice i2c9 and i2c10 got the UART lanes and did not work,
while uart9 and uart10 happened to be muxed correctly.

Give each lane pair its own function, following the _01/_23 naming
already used for the same hardware arrangement by the shikra, eliza,
hawi and maili TLMM drivers. Both functions still cover the full pin
pair, so a single pinctrl state per protocol remains sufficient.

Drop gpio129/gpio130 from the SE2 group list, since those pins
belong to SE3 and were never reachable through the SE2 function.

Also rename QUP1 SE2/SE3 functions in the binding doc accordingly.

While at it, add missing QUP3 SE0 functions qup3_se0_mira and
qup3_se0_mirb to the binding doc.

Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,nord-tlmm.yaml      |  5 +--
 drivers/pinctrl/qcom/pinctrl-nord.c           | 34 +++++++++++++------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
index 4bb511719f31..6b5ec9f49971 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -98,9 +98,10 @@ $defs:
                 pcie3_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
                 prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti, qspi,
                 qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
-                qup1_se0, qup1_se1, qup1_se3, qup1_se2, qup1_se4, qup1_se5,
+                qup1_se0, qup1_se1, qup1_se2_01, qup1_se2_23, qup1_se3_01,
+                qup1_se3_23, qup1_se4, qup1_se5,
                 qup1_se6, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4,
-                qup2_se5, qup2_se6,
+                qup2_se5, qup2_se6, qup3_se0_mira, qup3_se0_mirb,
                 sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
                 smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
                 tmess_prng1, tsc_timer, tsense_pwm, usb0_hs,
diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index 7c21306e77ff..7f37f8e819ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -570,8 +570,10 @@ enum nord_functions {
 	msm_mux_qup0_se5,
 	msm_mux_qup1_se0,
 	msm_mux_qup1_se1,
-	msm_mux_qup1_se2,
-	msm_mux_qup1_se3,
+	msm_mux_qup1_se2_01,
+	msm_mux_qup1_se2_23,
+	msm_mux_qup1_se3_01,
+	msm_mux_qup1_se3_23,
 	msm_mux_qup1_se4,
 	msm_mux_qup1_se5,
 	msm_mux_qup1_se6,
@@ -1152,11 +1154,19 @@ static const char *const qup1_se1_groups[] = {
 	"gpio123", "gpio124", "gpio125", "gpio126",
 };
 
-static const char *const qup1_se2_groups[] = {
-	"gpio127", "gpio128", "gpio129", "gpio130",
+static const char *const qup1_se2_01_groups[] = {
+	"gpio127", "gpio128",
 };
 
-static const char *const qup1_se3_groups[] = {
+static const char *const qup1_se2_23_groups[] = {
+	"gpio127", "gpio128",
+};
+
+static const char *const qup1_se3_01_groups[] = {
+	"gpio129", "gpio130",
+};
+
+static const char *const qup1_se3_23_groups[] = {
 	"gpio129", "gpio130",
 };
 
@@ -1428,8 +1438,10 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(qup0_se5),
 	MSM_PIN_FUNCTION(qup1_se0),
 	MSM_PIN_FUNCTION(qup1_se1),
-	MSM_PIN_FUNCTION(qup1_se2),
-	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se2_01),
+	MSM_PIN_FUNCTION(qup1_se2_23),
+	MSM_PIN_FUNCTION(qup1_se3_01),
+	MSM_PIN_FUNCTION(qup1_se3_23),
 	MSM_PIN_FUNCTION(qup1_se4),
 	MSM_PIN_FUNCTION(qup1_se5),
 	MSM_PIN_FUNCTION(qup1_se6),
@@ -1633,13 +1645,13 @@ static const struct msm_pingroup nord_groups[] = {
 			 _, _, _, _, _, _, _),
 	[126] = PINGROUP(126, qup1_se1, qup1_se0, ccu_i2c_scl, mdp1_vsync_out,
 			 _, atest_usb20, ddr_pxi, _, _, _, _),
-	[127] = PINGROUP(127, qup1_se2, qup1_se2, _, atest_usb21, ddr_pxi,
+	[127] = PINGROUP(127, qup1_se2_23, qup1_se2_01, _, atest_usb21, ddr_pxi,
 			 _, _, _, _, _, _),
-	[128] = PINGROUP(128, qup1_se2, qup1_se2, _, atest_usb20, ddr_pxi,
+	[128] = PINGROUP(128, qup1_se2_23, qup1_se2_01, _, atest_usb20, ddr_pxi,
 			 _, _, _, _, _, _),
-	[129] = PINGROUP(129, qup1_se3, qup1_se3, ccu_i2c_sda, mdp1_vsync_out,
+	[129] = PINGROUP(129, qup1_se3_23, qup1_se3_01, ccu_i2c_sda, mdp1_vsync_out,
 			 _, atest_usb21, ddr_pxi, _, _, _, _),
-	[130] = PINGROUP(130, qup1_se3, qup1_se3, ccu_i2c_scl, mdp1_vsync_out,
+	[130] = PINGROUP(130, qup1_se3_23, qup1_se3_01, ccu_i2c_scl, mdp1_vsync_out,
 			 _, atest_usb20, ddr_pxi, _, _, _, _),
 	[131] = PINGROUP(131, qup1_se4, qup1_se6, ccu_i2c_sda, mdp1_vsync_out,
 			 _, atest_usb21, ddr_pxi, _, _, _, _),
-- 
2.43.0

