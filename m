Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014240;
	b=eC3nBxM7INX1m/zFE+7YdoLPCj3R21Mag9VywPJdgDfJOq/E7AtFIcuvd6/rFzAHQ2Kh
	 InzWX5hMitzhbDmM5we2WWFn+MftnzB3LuS3El/TnvqBP5g8DdN3kmf0ZjSdr64B2JrLN
	 k79BqyNNMPtH5lY7ARiNFZbLC18LFsjcyBt9wUFER2VTqw3gA+k6vGLbCSHEipwfbe4IP
	 HBeJRr93PCbcaj5BBQtDIWzf1hoPP2+J4L/DcQVGPyTs7ZdhBmr2gv300Yj/meCC06Dra
	 MazutfulX+t1kZRbfS459vTdmFnLDKM7uuhEi+94uGTSHvWE8BnPLDMj+mx7mNspqAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=5Mcjjv8v3m3QanrOPL8zqm9eYcoFM8IxGXjPBfu4DytVQOYNPkvZBb65STSKpcnrOoHi
	 /uC8eJV4HSNl8RoPp5jA4TO1fCntrnzhwGFSPhbumGnf3kTq8EqsiwdjuZWlL+2GpT0h2
	 FtSiMnCBNi9JatOq3bK4Dpo/v3jgbcguWKmIJzpyOPIoXhHARDH5EmAM1MW2k2KSUds2t
	 0COf9bb5WzjmvjFUpc1WRkzVTOQHx65WNXNWj4nmXSJ67tl/gmy6FXaDKZintY0M6Dk0P
	 sqWxz56x//ozYcoYslVbP+UB1C97J/wkyrVoLHnhCX33fUFQ8uq1x79GssdTVJVNR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962E60A2607
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8962E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtaiQ1548003
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=kBVrqT7Do5kCKYQp
	Xr+mV8eG5A3PRn+t4jCykyOpI0aLy4kRLbT0eqYs5BGCTiFp0xi3RPAbywuU16Ec
	2GnRgzxKf2FQmmuMnzcza3axbUK9txw3KndVGyWSmvpoZ/eieS3gVwNhMeMTHlsx
	QiuJB7g2a8wqCqxuIiaKb+eclt7TDVPZYpEwkJv9CqrxNAzLh15CtS+X1kFcWmjt
	F1wlTRFtS0TQ/ejC14KuhLzbQNBnhaC0nBKuXBANScduph/+ABnNR8+2IOfBWJCQ
	A4Cosar1pPM5lxpHB78mEY9dHyg+/VN4ISyIyYZBd0aV+9T429kVr349GayZhym6
	LzHW2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst7fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:30:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso2787767a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014239; x=1793619039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=U1Okux830LFf1hdHdIHVNty2/Z3B2F7hxKRv4jEbOJl8ePkAjiwpS6156Yib9PnHl8
         b/f2OwSW1Znkz+IJIgSpjsv+g/ChwW7n1zrMdAo6m2MlDkmPvAUfH48M9+SGD7AGW4rY
         TT4zVCPDshY1mmW1fo2C7IC1ebCc9oEGV/JfUZSg+t/s7bgIK/2f8VgDMQd2Q7CWVXGR
         3ed27hmUaGkwvVJqK0anOTg/1wRrlJf2I46zPMbe/R4qkLZz5v1IbcARRkpouFS07R0o
         TVrGgmWfkvk1ufkNPmf7bSLiLs9J+e7ceG0UsW7c2P3iZW8eUEIJKKV5jofZFPcr8AAn
         UhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014239; x=1793619039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=iCi84z9ZigWt5PKCMa08kMlb5mKT4UqskhPZilzl/70+kGIcMaND1sVAuzYpey9En1
         zPWmoJhP4lzQ0P/RNJ2wy66gnPdGj0r1s/gZkIhWTzmqZhhNAcyuQbe8Zkr1/mz58beP
         zNCo5rANEJakrq4r9mozxPNGy16+NBZktBKCzLzW5gG0KPGPCt5gv05C7NgBGAHOkDon
         SVEbPpRnTLdT34VNvlpPIyb/qd3T26K7z9tvtK1RrLEXUshqIRzel7A4ro7Bt9wLOx9i
         GAjmwiQq6/holN5VRbsIpNqhm1gvaRXtKjXwh4rTWaIdYwLbozv7Qk7rKvHbIDfklhDV
         DG1A==
X-Forwarded-Encrypted: i=1; AKwUvBxXow07pOoMOudpTuiuHMXvHoXBsQVuCc2ZLpl7LlTUQJ0Yu0QqjQjXTubLXSSefOn5hh6AmHh3AO5H@vger.kernel.org
X-Gm-Message-State: AFq9FYLEzAtCmj//rdeYqEpas4URbiqvwRnp/YT9rneiuHGaLogTiY4S
	ZedNGBI8a8UzOAukljTgWU1RDl0urUkz3PqlK9gGuFOh8DXQlezjky8UcZF4+rzxrSNpbF5hNVV
	8tNv9728iuls+iMPyvsfSg9R6jSEr4cKP1s8Gws8yDKvUGBroeelO+UAD/8yUFOjQ
X-Gm-Gg: AYBFou3QGNvCUqOcAbxRfRTGHHAc129oEVKgc2Y5FZZLDr7OlJCUrVai/PbjhqU4KhR
	pohKYx+wPn2EUvUBIRSAtNm1VgzR/nrKOeBantsBS431RUeWXB2SD0s3uHAjOV3ZwlQQ0top7a4
	LbDFj94B4oFDozXpE83cnGV9S8q+iXNsoj3exxGXQObIgk4sWbEtoZP5q5ZUYAz7H+KIwfYZkS3
	nHEJa2VwHom2xZItyBjFj3z57SpEfpWJtkCXwoGRURNc/n/OaWiUwp7Uxcb6RteEAMDBhlCJUhp
	l4YYUQkXSAjCpwUU0zQp9pNJ6FDP9/enD2J91G/csRboxwAo3OKkuzg4wSF1+q2Va24AwdCO96X
	CfEvGStTAfw0E2Bv4VAhUxWg=
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970119a91.48.1793014239293;
        Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970084a91.48.1793014238806;
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:33 +0530
Subject: [PATCH v2 07/12] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-7-ff8e4bc8d567@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6yHa+ogAbi0y
 88//gmM7gnHGFy6RahNhFx9ouN3yRVstwkzc8kqK4zmJr1jrd7DguoBO+r4Vc+VVq/yrgHrdKUg
 tT9oBUErra7MLP+7gLVghkylDNlDCY8=
X-Proofpoint-GUID: Uyq-Qv-gCfkebrem932b2Yc4pBeJMuxY
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf39df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Uyq-Qv-gCfkebrem932b2Yc4pBeJMuxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXwD2hWVUfL/hz
 bSy4LyNCTL2kS81QRv3O1HlZ+kXuQlPypC9Yf9qmYB9dkNuScc0Ctr/lAUhQRJCFgeZbjqJO5rX
 NBQ8d0kMmGineYBF8JnwhBbqBvpAVABvRDnp2bFxZ3Kh4VfKe5lx2TPcCHPkI88wzPgUk1ycyDW
 UsGcNYbWkBpKRATF9qBXDerklO3ouVhs4uUJDkxqOX+U2LatRe2pIehXLH+0VV7ExJcenBgVeSo
 E2QLXsOGq0BB30XLJLB/vfLl7PTlIYaLwV+Xc+NV7CveA3uZ5uuGRlxf7jhyY3lLDNE4aNxufGx
 3bEhTK62cL83fALkflDo60Zx5f7nkcqvNIngUuY+hSpt7l8TwP5B/oMkbV0bx3N1aiMRWy5X11U
 CRf5UZIX3er4OZnZD3b+OXqOKKthAV4J/xiwFw2vBBCbz4OyA1x2V72dGgK1bDVa/EYzlfjKQlK
 MvABlDftClXBBwKW21g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1

