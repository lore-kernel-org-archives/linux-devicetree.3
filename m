Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2340BCD0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010160; cv=none; b=eG+bX1SQkv0PEBV2lAyQ7SmNStQsBeNtcFdLSDYcH2uF6LPZz29gtXL/njASFJIfv8I6uza2yLrnLPxegktlTNxlSySEgObn0akQ88MOSuecHv5MfAw8Bvb9ccio/OlY/5n2APmqERMLxmcdLUAsgiRECmuNCOYj2+ott2Utkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010160; c=relaxed/simple;
	bh=XN8hc40Aqohm1Oux1FTd9z3AKS0NcB448jgv5NkarhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXJxcrao2JXYpFUCljGFcroDKvYcX1bDLJZ+Dp665lynavzW+6x6WeYD7GTp5RAglspaMvfrhKLTvG5ObmJQqDzp8SjneBFUHDVlxl9GYf/l2VEaiVcAUNA2yTo+j1ParLkA0+LeYVZfBY8UTPJdJHVxtqQVO9yH0Iv0FIbByd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juR/rMp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMAe5AIJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juR/rMp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMAe5AIJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClK3V652197
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=; b=juR/rMp9c8O5SUDq
	lR2VC+Cf03ny9QkPsi1RhTiFv5TqEdSvTLNOanb5ziwG50E8axHc6ZOqw0seTMgq
	zMF45s5nLRpIet9gRi5rlUgnRWe/nUpP91hzOwevI4z8iNyNwN+fnkPEa+C5NpTA
	3uhgNOBNeCdYCDl/9DW38g55oG9Sb/5lXA2SgSDLCWmkp9dt/6BapdL+mIzU3t9v
	Dq/i1MrsoYLRBBTLnNw8LzxAJ3bbKP74hZjlMWoc7EUsavmRndvnRgK073aneVg8
	rLKKI3+Vmubmn59MUGN40EIApeXQ/m01rqSnVDwkEqCZrNsjx4m/+ju2e+CF10vy
	EJAMPw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ss8bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:02:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd1227161so182157137.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010158; x=1781614958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=ZMAe5AIJdfPqOJyjFU2+ew2sPjLfoe7MvSArp6dYeTqG6/XCqWIi8Mr2jAiAC53iMz
         T4hLTkSq0taUlmpUXptg7dXamCOsEns+5XC1JV7Jn4s77WSC+LckqiwMldPuUVR4RRHC
         S1Cfk/zXDEYZN7AlhZkzgTGOwsG7bzaXa5gtKkqx6tZSG3//z43c2FNZLaP+6ysOZL2u
         nIkLmyJwkZqxkryKqB2IIh+FsEUVzL3BZMgoE1hIS+7Pw8RJkdhASHwkBC7Q1BmJLrpQ
         VzAB5uPdkWvFPoBsW/tICT985HHHsedXqV4vL0AkpbspiLP2AZon0i0AJNHj3Y94G+hp
         rUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010158; x=1781614958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=gbZDL5IHaqvSUppPAgMbLY9b/szfR6cVrJ41A7Kh+BPJKCZXe36TBYjK1DLSK2o0g9
         p7nSAa5KYgYg3otrTPL8yuSwzZa8T3NmHNmZs97o5IZ8t6vRsMYsMEZjLCgHOIy19AiZ
         75nHxLZIXieDFUr7usW/q9Ul5/pc7mtbhZwwhx9o+9t59XIfl0BfYzektovy+4TaV9S9
         LvB+DdSiFuWUrrPWF2OTE9vBSlxvZ8koCo7zt08JxI3c4lmeG2Vony9tgHvACnCFm+v0
         WDeQ0umfdLgMWO8tWnVffLiHC4svXFwTkAtbxsltjFaAGZkbzezfb5XxcmwVSKMrYx3f
         lZUA==
X-Forwarded-Encrypted: i=1; AFNElJ/OI02LMFXhkkpxRj3dMNdD0TtaVlJtTqujQvJCzC1fHRQT7u0uP6dWmTWHlnvWsQyrsBKDifXIniJV@vger.kernel.org
X-Gm-Message-State: AOJu0YwU7RYwUsd2p3npS80vJzMSyl8cogiBZmf2HpMAw8cf0GVuGdqp
	rGCNB5ZOk4SR/mzJUBVHpJ3PW1ZWi+9WWMIa00tmqqJspxSedcNATXLDZCLb3JHeByu47zKzj6D
	2KdjFaCsmiiXTTzjFcRI6mfDWA7D0u59boArxe+0tyCTZ6sX3ilg5kygE5APaoRxC
X-Gm-Gg: Acq92OHVMYn5ErGEEhkAs27evIv3V/OmM1dsT1iY9pUZDy/1OPp2lkbbW1UKTGlFzkU
	sZAZHO+Fee8Ef8d/a53/nPQUQxdhCvdpz1Gnj/OHR+NnhZVJj2yikBMnaLbgzCSi6NcatAPPxLr
	dnizQX/NFFYIFjWk6bvZ2Ycb8NcZtaP2IhHNSyy62X7HcIT3KAe1fo2QF2+TMwU/Lecv2QmqHAY
	Ob8xYmH9lk0JafwpKWybE+Ro/BRv6W/05sA3RPjVm80gJORjC45QxwpFVOwBOL+MzVxcilolX2W
	nrh+Tza7Gokh3HF8bNjIzmcRLjp4Y4bob0wAdQo7oxP++DKjMr9oEfIgckWIPg/i3IBSAZWdqHS
	Qkn8l3l3N8iqM65vrWiawktBGqtt74KmACnUPdnIc+5eJ8MamHeO04I/o
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465890137.3.1781010153677;
        Tue, 09 Jun 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465752137.3.1781010152819;
        Tue, 09 Jun 2026 06:02:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be29fsm51941651fa.21.2026.06.09.06.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:02:31 -0700 (PDT)
Message-ID: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:02:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMyBTYWx0ZWRfX1C2tg4E9/Ys1
 +jnQ7s5eymzi3lC0oCuZ0Bljh9M+ZWdTDKay5Xoa/vy/b8nuqVm+xUKn0YmzyZX47EefD7KouBs
 44tILq0MzuT7bB9Hbu00u+GQ5nNG1vuIqWJM23IW4qtpZyflmc0ChLFeWMhVbH1+aPYpFRNgwkc
 /IMJ7lOrg6Cyf1CaCS+5bsLROuhx080L1KMAncL/27NSYSBsNkKZroVXXljphHqZI78mGraDmNG
 7oycnFHCwlbf0idFLfJ7uSIwi1brROAdp9kaa40sf4H1312XemQiJwogQoGpUm4VyC+VBv5ybop
 US9mqCvYCGUpUyLRPVIqxfMhNrhetpZFo+/psOocMH95PKQYqWVjNKzeJMu//OcJItJqmzzekrp
 Vnp+PMBIhSP04El6Ffyc+IEVKnIBFcvTvw5Z9R//OzdbZJCxInwGr2BtG1bbtP04+SLBC4Z/xnm
 4lN3mUtZlhFDWrh9h6g==
X-Proofpoint-ORIG-GUID: nUsWWqOy2D6d-GKxlsenKxR1HJdqC2ib
X-Proofpoint-GUID: nUsWWqOy2D6d-GKxlsenKxR1HJdqC2ib
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a280eee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hcCWvLewiaSd8YhtB04A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090123

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

You can remove the of.h include. Apart from that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Also, attaching a diff to complete the regulator map. I'm fairly sure
these are correct, but it never hurts to triple-check.

You can add:

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you squash them together. FYI e.g. the tertiary USB QMPPHY would
only start every 20 boots or so without this, running on pure luck..

Konrad

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e317003398d1..eb4ee8ec9ad7 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
        "vdda-qreftx0-1p2",
 };
 
+static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
+       "vdda-refgen4-0p9",
+       "vdda-refgen4-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt0-0p9",
+       "vdda-qrefrx0-0p9",
+};
+
 static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
        "vdda-refgen4-0p9",
        "vdda-refgen4-1p2",
@@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
        "vdda-qrefrx2-0p9",
 };
 
+static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
+       "vdda-refgen2-0p9",
+       "vdda-refgen2-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt3-0p9",
+       "vdda-qrefrpt4-0p9",
+       "vdda-qrefrx4-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
        .reg_bits = 32,
        .reg_stride = 4,
@@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_EDP_CLKREF_EN] = {
                .name = "tcsr_edp_clkref_en",
                .offset = 0x60,
+               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
        },
        [TCSR_PCIE_1_CLKREF_EN] = {
                .name = "tcsr_pcie_1_clkref_en",
@@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_USB2_1_CLKREF_EN] = {
                .name = "tcsr_usb2_1_clkref_en",
                .offset = 0x6c,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_2_CLKREF_EN] = {
                .name = "tcsr_usb2_2_clkref_en",
                .offset = 0x70,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
        [TCSR_USB2_3_CLKREF_EN] = {
                .name = "tcsr_usb2_3_clkref_en",
                .offset = 0x74,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_4_CLKREF_EN] = {
                .name = "tcsr_usb2_4_clkref_en",
                .offset = 0x88,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_0_CLKREF_EN] = {
                .name = "tcsr_usb3_0_clkref_en",
                .offset = 0x64,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_1_CLKREF_EN] = {
                .name = "tcsr_usb3_1_clkref_en",
                .offset = 0x68,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB4_1_CLKREF_EN] = {
                .name = "tcsr_usb4_1_clkref_en",
                .offset = 0x44,
+               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
        },
        [TCSR_USB4_2_CLKREF_EN] = {
                .name = "tcsr_usb4_2_clkref_en",
                .offset = 0x5c,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
 };

