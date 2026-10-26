Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014221;
	b=iSi6fRatJcdRPZFB5Pkl5txc2P8BetpiWXvEQYFlMZy1kw8Z6wTZbf96cFLQtntC5zSI
	 bx0kWv+sqGV0oqfVuRo1WynHPY1jAdMAYTSriVGsapRNkQIJGI3FCi73jm0SpOBrQdroM
	 TWug65RHGV5klhVB/7yHRzhU1V4LyTOD3Sq2giIVyu5S13nL4Q7Jcn5sZxwt429V4+SAY
	 eJYuM8bkDbq9ycbjtHKjmLDLDE2a9xrlq3Z7PDtqNZtYoqvCBRBcEY7qJIDVW8GczGYm/
	 9Te3Z2SMlWmb9vDkVFA0FYTCRTv0ag/wE6dDVBwM54T42AUsf4Lr5rGi22Y1sjz9RsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
	b=SBNQpqSpx/yinbAiaNrp4xALtPbKKP38JGr2Z0tr90ZrBuoIskzMm6pVN1nmMEva4QDc
	 6xzNyC7LZcPxLy4uT+z6vU7eWVzf8u/Gq4aWYSC3Y6q2QOcBGkloXatfYIS+t5Tw+Qrlo
	 Jf2RGsmP3oMMpC6D8d5nocg7viZS8kE7Vm7SnDCp7BfQiAz8cCEnrODOEHchi+bOIVTrh
	 t79SHIhtRp+MvVnLmra9Pcs0ieh6CVJdsnw+hoTDHXsjrNUYnR4H6ldg7Q5iHfseXX/5Y
	 y92lvJb3Eto3p2UcRfmrKb8y1vq1rI3YgIqUWb6UALvGSYucdVYDO2wTCFYUNkUmz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CBD60A260C
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CBD60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtaiL1548003
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=; b=S4qG6BFZIZ7R887c
	q08zSadn5YqdRl465l1JEkvMZtIQ4Iur6HbCjN/4lXxcggrGkZvAHSKe+mVZpeix
	/fM7kh8y/aw0dVx2b/TjjPbZZmJNg/3vK4Qw/hIk/IccKY325p2fQFeH/wE7mL/j
	Q31qOcW7rqFOO90kZLb/+DruiVRO5JjblKC4q+ZMhF4lyDh0c69Mj5mLEmXmMtsL
	1eAoORa4Z/eZgIEBK4agkqqlcUqFfpgaviNBcCjXR1HfuzaSFJe6bk3zNIF6m2l1
	XJblOSKdSc/w0jlfsQGgyaP/FL79/bTpUAOKMvYa19KdpXA/W3nNhqzYWWVltzZn
	gMZZlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst7ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so2720304a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014218; x=1793619018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=VI57qAbOjSXEmndXRV0/G3nQ3P2j92eK4gCPsCLluiCeUy1NB2tBG8oiuS6oMS8pfs
         gJghGeC3QqYfpI5K8X2SE7HSLL7bdBWSeEfka6VmotkVjAdkFYeGDVvmrUA18E+I0dwe
         /9pXZDEfmupePfFpcCAE/ke7x5ouyKFA4fiubdq2LImcjr7kb/j1NFUXctLaIiL6M2dq
         xL5CUgbiVjsOrMkbwTmtqDBQfUGdv4rp+jY2HCP9iTmpLrGRIQy6L0na4sckc2VdWu0T
         aENsCvc/JmNGnUIhEeH/HTzG8Ntdc6wXp6x+TghwdeCES8xOGqKUhgBx0sLZvSYVjxmo
         EuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014218; x=1793619018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=UakepirjBGPij1GrH25ubBiQes1cuf3zxJlUYPKLG7ne+aSoB8QTd+ujbGJvkXcjUh
         xZPMzxGMoq7wRG3noiXjCp06gRKtyxbQSVjg3MnZiqEHeRmjGq2WisSL94s8W9DyTdx8
         fvDTpeXQBC66qjq+02ArS4LLfF19swcZo40VTXP0Lez0dDUElF4OBUphkeaA0YDzE/6O
         MiSbEC2kVhuUBbg+LMTwMwlplAqhnCj6TP9lLc3z2qW6lEDNkGkNXLwwWkFlFXPCnJJu
         +wqMhjk1Xd0ME6nvGH66ZUa1Pf1kNFcB5vPuZxjn6WfU4ruO9BEBTg6d6sCSe50s6Ejt
         pCVw==
X-Forwarded-Encrypted: i=1; AKwUvBxZD06daRP27v5+mK849zbvAWobP8VMzf0GxodEdR4bsLuE1ZWcuFJFp2Xq3dXX5JGWqnJrMemduhx3@vger.kernel.org
X-Gm-Message-State: AFq9FYIbvnPR3iXt3ebPb/LWvl1Q+2gKrvxwi5hFOACuK3q6pVZx+Kfe
	EL0EI7Kn6YU8tRGvKIciAj6OE8FAqJcsLmmsi1SVlJU0H1+JaEz1888uVsirJBEj7sBr1gPUoN2
	VRbMX16hSOSkumBZl3KNnjmkpixSRlNeS0OE9l2pqp2W4DRCo6qFauLBsgNdSuyPr
X-Gm-Gg: AYBFou2QQug3Skw15HFxI3LYtxdKAuaZBukFT7QhZVjXH2grOTyspAJGArH334IbfAd
	fhrZ3EbKqSEfKz8c/WHaC5n7Qhu8SMC3Vt6CTZObdiE+Hz20pLW8niKKyex3R8BTgAKmuDTPnAI
	s1tbNht4VgSZ3ibH66D5CwYB3WdgrYNVj6AjUi0f0JkjlXEV/yPD2MdcQfO9Vwjqr39XT03t7cs
	hdepp0Q0SqLK8sgJy4CDqlAxi8bfNV0M4m5MuDXTN4W9CenQ6A1gAuryvMNwnIAdkCCkQ8xb0Zj
	XZu0+4hAyUw7GRNdF5HIDrdqHfy4eBer6UnYrEcwQu5kvli6Zk2Xk7mextEAs8RQUL8qsVew6vO
	32GaXI7vSsP+lBBwYSN1PCnQ=
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308445a91.9.1793014218334;
        Mon, 26 Oct 2026 04:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308404a91.9.1793014217632;
        Mon, 26 Oct 2026 04:30:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:30 +0530
Subject: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX+hN4JAf/xjB8
 mMt1v4/5Fgy0GRuesD05qXgd5nTCF5GEdo1nJXMIoH2is1tfBfPtYQNtX8SQkwuaZvzHJWhQBG1
 grYp6Xb8rmOrIVujXcSxK+fEsdySlKI=
X-Proofpoint-GUID: ThCjj46YuzfpTs7zoD3zqE_Ha2No1g8e
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf39cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l3K8MKQ1fDOuS62S88UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ThCjj46YuzfpTs7zoD3zqE_Ha2No1g8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3GPmVFscoPJ2
 zpH8egdAKSiosDFXDbkV/ozh5htAFZgPNT6gf9Ziui8Ww4R8JvCy4HbKTE4CkrEIxjXOz6slr0D
 dPPJiMAGRvXIZGmKTBVbOWU0XNQKXUfbDv8lYMbbX/93sCbc/CmweldxIlsNnzT4sMNjt67HHj9
 6r9ymCxb/VmHfWG8ndzhphbHfbG0+X8FgMvnKbb2AI3xvMvAR2zvEv5EoF1N3Y94pevc6qBQ2G0
 LbvfbbNBmQ+HGZjxCmbOU6KdRNSn1nXpAgH56tkqCJbD2dtl2/Xds8/xdVaq3oV3TPLWlqGv1zq
 C/ci3uCqRsMYfqRfB9xA0qDwKZRKin4vj37KH/AY1a31CdgkeghbE8y+VOhzHqMrofO1MnC99H8
 iK586GcBxGR5gX5A2RwD4tYAN37KSyW7xnjvNoCDRxaf2i9g/xo88asgnTpaTpUrbnTxMy/LXEq
 iJTJMNSGPcGCRlXmLaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
GP_MND select the supported PDM source clock rates.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf558bedf524eb2ca959f3e9e5c22e..9b558ea023ad62e6d465155e21c54376d7b99732 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1654,6 +1654,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1662,6 +1676,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2802,6 +2821,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 916617a001c854c1a0349c1793a427a2822acfab..4a152e95aa997bdcc7ec56a6ae96c61b3575cd88 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -2280,6 +2280,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2288,6 +2302,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3501,6 +3520,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614162dd7d5d9ab9f3a20c390ed0512..5ed3ec74b210807813f97120a4a19773f3f67d0d 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -2712,6 +2712,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2720,6 +2734,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4406,6 +4425,7 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP1_AHB_CLK] = &gcc_qmip_disp1_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdcee225d2f21f39844b056193bdfca3..dc7a855be0234f6135d461175099862f2d486d9a 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1913,6 +1913,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1921,6 +1935,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3250,6 +3269,7 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,

-- 
2.34.1

