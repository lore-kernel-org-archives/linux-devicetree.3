Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD155218B4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115116; cv=none; b=gVN8ZLYjY2ypS3zB12P5rcJaFe/mAry8lacXDOOwjhqQrvWLF0q+ZiQ3K5hFLSBDOK/CnfLBZJECVbqgVJ1HTuAC03SNQAjXIobTLK8h24tFgjrcb9cH+RPlEXEh3IeiJridjk2d6MUgBfN1vNVvGePPk21WzSk57o3S8rGLl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115116; c=relaxed/simple;
	bh=D4fSP+2I7GV0JaAbRIzIFwfvzVtsM7z1Zzkl1nD9slA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEPd5q+7O/OVxiQbdRslinL1g5L4n3mKZCt9DB2zNGuLYSEmeCool+AA+eWimohvOcSQ/ZcLu22k37Npebk4Vt5LixpdlS8M41dx0rPcZPxWSxfNCuhVlf6XYaffh7O24urQdH71bGjnHDQrV+9Mmi3zwCGXY4o8BAzS3vmOS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDoFKJhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fA5SnZnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDoFKJhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fA5SnZnn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJHM8r3910921
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WxXkdQ30yeX
	+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=; b=dDoFKJhhMi1PktsvbOXiMfvxStq
	LSpXoivaPOMrjsPwKNwQ1IsPPPFzwwFHXjbG7TFeYC2ozkL1tRIW4yYFqPwDjxIS
	HE9uqZ1Fa24o67a4dnEZcVpIlHxoKWLkKClGgmJrfMZK1h8MxbXdpvAT306wmv/4
	389ufXH9PFfUhP4adnjY78tjA/8HYKoQTPl4/B/Y0GQ7Re2expExUaG2EU9F64y9
	CaisERXqJSNoETLAggpXdDO517wFxgISIHxKbG1M0WPUj79eBlI2jGuMgdjHlSa8
	wzq/Brv0u0ALMWlEAxR3bG9buG9BAdD6Jx7gnqZBFQQuFxQ9alsPKKgJDwQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0tnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so237162137.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115106; x=1790719906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=fA5SnZnn0/tCzDG6WLdIY0/UoK3EgeJ6ONqksrH1pepVtNV0wS7ic+eaUNU+JFFG2z
         tq3GgUkMRjfza8oazdOaIR3J+XfWqwhOHMobx7B88RqM+EiHmQcneu3eOuAn/P2Ouepc
         PMfqMk6TTMpbBxV7MuIRuLM4cW/yIf1u4zOt3F4VgEz+JDLD6Uhgb+D7lZCnqeZIB9JU
         LIha/qJuAr6mkESK9NCDx/SQrzAQiAyZ5DA9TeVq79lS7KBkszxYvCPcc39v44oYkprO
         fjuaTgI9OXXvacGju3XdKoUXD3oGE4FvqtHpZt+kBhHkUpsYoNcYkn5qR0zDSRrTtvzS
         CBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115106; x=1790719906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=gcYLm+ruWzF//MeyaVsoHLVbNsKhT7egvSiLqSsYKMhNb+b5YippbXroPCKpScyrYc
         2qTwKYjzIedpv7Hw8r9SDD8m3Nxnzxr27E1X/8+aSD98ChG8cJMM/ZW9+y0w9XyBDWKi
         oKeHunS1qXbq60XGy08hoexiOGyHe9S64LwG5NYltht+aJ1L02xkslzVnnM5JxDqmXH0
         g5zmG+IU6b8glH79CjmFQgW+7oSaVkEuxw1eSEa1/XJEZQKnT5yF5OP/iP4aOC3Us1/O
         OnC9Vu0bwasOykk1AWkbR0b4dnasrqNP0ftbJPJRjm2hQRy/wcXp/IFbFozfZTSCsLS1
         ySPw==
X-Forwarded-Encrypted: i=1; AKwUvBxgDjlO3MxbCL991mr7UNrhLgn/qROnovg5tUMC8RHq0iM7I331WCxr9tjRVH3myWU7zHQLhg+FVC/A@vger.kernel.org
X-Gm-Message-State: AFuF++kch6v+R1MRoOSB6Mi5fxIuBlFY8IddHWyrSSx21tdepgScZQwV
	TfyKtk2HPl4aAdd6EYihL/ZDvBJBx/FQWau3DUZZOrwK9N0MosZK2r2ywOrRV9Z4J+/S7WvogNV
	KSBMlibcm3MGmWJuVR/GqP9g5eoSFibjiO5kRtg3ZuLer5stLY8mXmkQxUsfcM9WQ
X-Gm-Gg: AYBFou3G5gPef4M24lYzo/ReYrwLaQkKhZW5k+RTkGkDKGpawf9fLTZcQrTrvn4sblN
	Y31BicU399yCrYMmmebW8VbOMEhocLq+TBue71dTleeqAGpsM+trmBNJqPVlrcgu7a6y7KW+9ef
	6YfeqFjgrxdDNd0V9iGugA4LbhOYulbbLwhAQgE8IlbEK2kxmRxB4LF4wWInS6G/l7wlOAQDei6
	UDwpP9O0aOw0ZW3n8Hitcq2Ud8u7cB1syY9XP4V40Cia6XKWxX9oIth8fEsJSncXcQWHsM/Md4d
	iqzyVX8o9hpIAH0dSGtxMwUMQx/ttb0R2ua2rO0NMA82KqOTuuzr1lauK7w9BNottTtbJ2vRj5L
	bbQGwsUennvhxTOBUR6hgHsWlno8iMCxUvokj9hIk3Kb8m9De1ugAA/AEC9ny91HW
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948347137.17.1790115105830;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948323137.17.1790115105365;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
Date: Tue, 22 Sep 2026 23:11:23 +0100
Message-ID: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WVx65nxIUMmIdqsP2YFqqo6GlmitY_a0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXxhQ3qi9K1iOH
 7T6lLOXW3+TPdcujtt8FtufDQeKzrwFypRpok4WefPjv4xT7U+wNHxqnwiOEmv83grkTEEudqvg
 cHvwF4xrCe84yzLWrnKXVru/gMQCTdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXxxQA6jXfJYTP
 zLNNpmTky1+0c6+HGzjCvhuB0mxQIHymJmfMensCiYqxid9kJdRDr9+hPKP9JoyXsXJoTwaCikc
 8oCe/yuq+kKudRvPZmtNAaLPNcACnCec7oaYSTulfn2LP4srAIqzyVVzjyKNCSpVmmg6dtL7lNq
 b8xaXb7FlbspOkknng7ur2P2LeuhuHiydQH5rB4pfRhR863KuE8RQvXkUgFtLYG3wFQ/M6DJ3Wv
 x3cwz1n3XvUAnRZ/LdkRAcZ98tJ7wY/Y/2Wy5rUZukYg+CiX5u8f4MjmSv5MbZt5ptQ3keuQTjq
 w63HxsB43YweWAQcNxRo07FCsvKOAEuOKa5fpVy4RlIjcBE7Ilgo/LBv41hbghWKQuFwiFXCENP
 qVMQzCF1nPyRH/LRpQ87DVPV3AXm3GN9xFvX6bTSGdD3+JYlo/IBt5ODm/wopf/raeBWViYxzJh
 SLcRLqZ+skDGqm4bK/Q==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2fd23 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=g3NoBr1hRuMCkkBryE4A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: WVx65nxIUMmIdqsP2YFqqo6GlmitY_a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

For some reason we ended with incorrect register offset for soundwire tx
controller reset and the regmap register max was also incorrect it was
0x1000 instead of 0x12000 which is full register range for this IP.

This was somehow compenseated in DT reg property which got it working so
far.

Fix this by correcting the actual offset and max registers as per SoC
documentation.

Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
index 226dc02fc42d..fcc1512d4a99 100644
--- a/drivers/clk/qcom/lpasscc-sm6115.c
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -34,7 +34,7 @@ static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
 };
 
 static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
-	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
+	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0xc100, .bit = 1, .udelay = 500 },
 };
 
 static struct regmap_config lpasscc_sm6115_regmap_config = {
@@ -42,7 +42,7 @@ static struct regmap_config lpasscc_sm6115_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.name = "lpass-tcsr",
-	.max_register = 0x1000,
+	.max_register = 0x12000,
 };
 
 static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
-- 
2.53.0

