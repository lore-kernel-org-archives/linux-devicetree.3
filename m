Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981776;
	b=iX2rIN8qNPvV19l7MT/JYeVpLbj4nIUGxm81bMeQHUBdCGsXPWG+be3d9V1NHspBwwiL
	 qT3JwzCifxvwxu2LKeOQr9vEtsTVQNETq2BBK4BGEmhY4NNrR036MdaYKEO/Sn9b0FRKf
	 22rYPQu7GVhDwQKGNecWseWxkWK61qxHdqdviIt5XY/Cw0b1NPmjP4OUeR/5GC7TkgNev
	 f5rcEiKZYmdBCGMiCSvZzvXY+WYD0rICPNVH4Tb0ZSiOpFDYunYCVm6KbZhHp+MEDQMrG
	 GxatZBJqquvASvoqm+TpChMoHMRgRZmcSPhVi0ii9ytcVV+nRWqO+7XgwMFeokI+ZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
	b=Ma30d+AYTNFYIgi5Piayh+DVJ/JL2KhIWpHJwAHIXOacFf75cMd15MSWVvRNykWcYIat
	 EU9UXIytLJMUJHHnDtuw41p4YQTveT8mbFu4mqnVKjMA1jgziBg/sgXgBth0JLIel8w8S
	 /lAuhoabdBsed73zrzm0IZ65kFIudHHNP9v+CknT8F3RcokJnbHocsSQr9FO+M7Qwfmek
	 FUWZaTZYfADO5FwTpfxynzzRSkX4PNBpqgEj23GFfWScAH+nq5uGWA//1nHe3lQ9ajLNS
	 gVjBd7UV6HUPBPgCtXY8shG6s0p4G7I1JtEQfzfT5ysHN8VSnw9VmEnotCjCb4i4szQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IwhNYp45;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv0EBeHm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BD606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IwhNYp45;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv0EBeHm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VLMc3122711
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=; b=IwhNYp45yfTHbrN8
	hXWdn/e/aWA+ZKN7VhfW0e6k3QGTIwcSXL2k2pvr85n6e1ZUn8s0oOD4SobYfO/l
	JY4JFxOfmWhH2dWsRnTRXUhvDnOctE+qRK36UVMXucBj7lWDC3X9XGtwzDgBCu1w
	eSH635JDem7ug8xwbgX5irsxSh81VUO6YuYt5gSYtDum1vckKnBrtM0ELLz4AX91
	GPX6jD+K4rwWJHUDhgMDLBTa0HTdvwnJEIUyUjX+Q3FECx16WgQSkWEafxeCYPIJ
	/TEJoRXJOm1mwKf2XMd2f0wQdFZJNrmUMTpkKsuk8ntC5M8p4/ONfPTJLUoKPxHN
	ZjZIpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9he8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efa9aea3c0so7828365ad.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981774; x=1795586574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=Xv0EBeHm4ymrqedm6+K3Z/kCHblBBkbmMq59ZXD3aTKiI8c6kSI79fw0v5/cr9uHVw
         U6WY6Gg9+PRX2oIOpK6ouUr/J7NXmem3wiFfzsQitv/zVjju5jv4FM/MWf2OA+Suihrf
         K+PQNcEjDIa1SsAuhe8N5oyQ9/1BQ0+c5qcPZfXjbiijXF2zCfQaro101p+Xnr+jQ2AL
         4hyiGbTvdPNimFczjv2P6KQ0T1yw6ImxZwTClTUfvE4nEmzg1MRaKEL8LRHbqslFXsGO
         SHj4Fhja0v2/pUjDHY7luaC5CNOIDqCJWbo8eAP6E0UOTvgivw2OTW39448z60tZEPAI
         wOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981774; x=1795586574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=0N3RwgHtdWXclsO/Cny9oW2PSxAtZuaGWzwu9wPbwdTECzzQ6536Xivd1ghfQ492fD
         jJF1LYHJeLdrzly4IvLbPdA5Mg6JfVlp/MObL3hXWHLag4qD8dOvEU2Fz0B04QM0HwME
         U6fm0JwN6C8CXmSweFydBnE7b5R/j4CUlDDDil28vdTvIOaz7E3rLTFQ/IpoZsZiZi8+
         EFrlaSCZC1ckU5LhzZeHgi1Tdhj58xFsCao2p8a8qlI9xcpkhrk95C9vfvBrgbD8imWr
         nWOykTi048s4zWHgcRJJBv9yV9hBDZqGB6lyDgLnIm6o8H19mYdMQxeiWii5/8z7Z3vu
         M5nw==
X-Forwarded-Encrypted: i=1; AL+hErGhrLZulSaDdL03tT4rgL4sI1/QRQibkuDRFHEkUOT6vhDDWkBdX7TuCk1dcr9pGdPkXOrpY1ilF8BF@vger.kernel.org
X-Gm-Message-State: APuU4Z/+WyjbQRyMtE73aks7wPlhWYDuXT2beO9wHct2aS8GiFSnh1US
	ALU2Y9cQmdAMvOOOkTn72VPmcW2zc1rDF1D7+cyFmYLSxXIeE+/RdHELXyADXcjLKR+k7pNgmKt
	Mf1lCpb2gbIXiBGsfJbAOG5InXgYVWJlIP0QMCaJ4Q6GfMPSQkAhraP0wCHKHxiti
X-Gm-Gg: AZFdTZfHPyCQGuh09HpsPHgQsOjYZHZVlyf+p+kMBp1NZEwKAKPYENoD/MOs+H5oTu/
	iHEN60j85QNs/4BfeCNpZZ1+zByBqUlMdoNPMR4i+eL5qrscgHi3LBmmKVssGa0EXhIY4merqIZ
	JnNie5tQWK7ww546FgkxqfaUVyu+xq9vyuOgMifA2e/0bqAos9pQU/CAUtHwSrCU0/QSQwNHuTc
	iaN9gcDXQungq6pqiduCvyQAZpu2UBz0T4VZhSgbN+FpSdY4TbjIiNO0wArzP8HL5jEr/QpMm88
	tcoVI8PBYaTU88Ylqh22TvEK5ENXOO4FQvP4tKmqcIqrRsnSOSeBb85byzFtUWfYJo2mDGyLevD
	Oqu6SU3kF2UX7zzEeEdKCYbd8C995eYgJx2O4mBYK4w4c5Nj4kb8G0xfftHuSpFfzho0FTfoAoA
	==
X-Received: by 2002:a17:903:228a:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2eff73f1f09mr15536265ad.13.1794981773960;
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
X-Received: by 2002:a17:903:228a:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2eff73f1f09mr15535925ad.13.1794981773512;
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:33 +0530
Subject: [PATCH 02/18] pinctrl: qcom: qcs8300: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-2-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: QWyqLvgEeGN4rJ9gfNcxuw9jxH-gJ3QF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzZmjfdvFCtz/
 1PJiB8VytUAuZaFost3ExhNdCMDU+BX+LlDwleXfpY9BnD8crOFHBZhJEZ+zu0ZRCmkBAp+lGpR
 CH/zRwbE8FrMmXl9oKYe1GJlHmXWT5I=
X-Proofpoint-ORIG-GUID: QWyqLvgEeGN4rJ9gfNcxuw9jxH-gJ3QF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4Sr4wMlh/yjU
 w2V0p19k+ibaTVaaHlPhbFSQHhgQNBBH7RfhwYfmezm2Vvk8WW+KTOvDSMxH29GB++kbC+4MWFQ
 SgyXPF8fjTTkZlRVsmT6X2F5U9f10sqSZ48D5TalCr/oJPvlFqu2b9ispobjLBqtO0pT66aLgnm
 RvbSvA/IFVvERnmW+0Yw6lnJML2QIW7cxuzVR8pMy5BNYt1eRwwVWjIERTUOxvGOBGKvibX63qf
 kZulkrIVducuHHFPq4Y13wpwxvbOVz2iwRQqPLUk5hMGuXjGlC1RxpjHYySJEpW/qr3hTu25XW/
 48Dp739bgCJL/DmyTgMPfW4+VuMU7A43gT0LoznCs7JWA93h/4C6JKuFGf5VX3QwR6boKdqoQcN
 oTjv4SNBa61EZdA/xcSxftXqYOml63mYLUYjQZxv/wnl0h1/6tF4kB1vOisgYzLYFeiaEzgu0Sf
 WG1vP3hR4t2Nmh1uxew==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd3f8e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio32 of QCS8300. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index fec86818c51188a0949e268382fb0c5de3f66f1a..349369fcdf18342b27067b91414eacbe378224e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -424,6 +424,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -651,6 +652,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -955,6 +960,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1062,7 +1068,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

