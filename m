Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5963E5EF0
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509809; cv=none; b=WWo9iZxfERGb1RhT0XKkXz+5lfPNXPiIDfX6NDvLXY2BxR6+9boMf9cqNb/UL366mAs7YSw+bjcaTM1vIDuFxGVeUQI4F5hX/n6Ok8lgEHHLOoCzHswjmAZhls3XOuaGESfOxJ3gkozgKx5u70cqgAb+F/jC/4wyvyhd5HpCgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509809; c=relaxed/simple;
	bh=TPZ2UeL9Yr3m3dbS1QU3Mf+DPrHdAp2KCtxoGMEFR0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHRLZmior4CCYah78sDZMKNdVK0WPuIYNoauk3fvU26Y7AS20qC0Ho38cFTP1PgrC9715zK6yBSkmg0jykTbXeyNAz2sUixpfGFO//MjPjhm4oRJMCdPjFGRTibKsfKcV/gjpJ5hfZXnYKPTNXy+MooVqEVUd7sDjr5irbWK69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6PpkZVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWrjTTeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6PpkZVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWrjTTeD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mjO63234598
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 08:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXbYoRmgPzS
	A4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=; b=K6PpkZVEeaPQoGj4nPuhqS1Wj2t
	Wsaq0ZQoT+8y3yRond7ARPSv3jrlHIsUmr8sxA+zTZZOyG4bnSfkI/snZzIf3CAf
	a9tl8HNfwbdSAzB4yEoYnIqJUBuonCqlVWU7Q7BSlz5vZu6nIqNqCS585ICwTBzy
	eOPs+Y6+SoaKjAq0DxCvCFWwnVGRo9hAoRN+6UJJ0SwLSbGJocg+vuAdYKsPCwek
	efYs0noPUzb5YXS9ouPDku0e695h3C6I99/Gunn7BzoSRcupZn2Lwkz5aZkUEyBx
	xWWdA4NvF1SGZBRgvkxOO6DytyBPDsw/u0vTivR3PfnNs5QOPEyA7sAFtIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0ug4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:16:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1159406a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509806; x=1789114606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=bWrjTTeDad7PmeZOoGlZVkqPv7BXF4FVkr6KcdeZuppI0OwWlGR0W7nSORqnl97kp4
         GZBIxXBiQMRoVl9PwSvXpFZtZPPjqh+oYU6kLxvx/xjjwQ8qILCL1dgoQXvwONCJ7yhB
         JrmGuRyGEt9u3X+5oGrCWI/Gh/OkLIRi0WtUjc1JaYMWMJIH1wyl90XMmmQhKudMbLtW
         /nwWxJrXi6/DT2gLerftb8RGkd6entMFzkGDM2kurAyqjloRRDB5THJ9rS7KO4PDYgrb
         sJeBGUUNXI0UVgnPwsNxlx9QUkJUKZ+3wE1z0RBRMIiv4AIkHDIARzEcVJr+wOh7R/BX
         K93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509806; x=1789114606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXbYoRmgPzSA4gebf4xnIvSIMQ4UDRbdcKU6SjfVKsw=;
        b=p07jBDqLTkj2ZcbOBYJcEwl6mGVItEdPtXbTuYHxYRap08CdfaleGllHa3/y0MBijA
         /l1Fv5LkzH+e7/3AoITDyBT5T3UKUrZif3zH1Nfoc5Dic7OdCPecPtwvlw+atZ9MCUD0
         AYHFoSU7/dvAuZJvj2AFX7fSUZnat+mxIuJ349Uc+K1M08OvwZDtDLXCIKeyY7S42UKD
         a4cxfJ3tK2fElYsyrZzTWs4VWv2oNQPriSZgfI5+t1seIt/S+xC4JIAr11dt1/TGVZ5Y
         bi33AwuyhFNAcNfuUvzbwrbElUJhL3z28mDpQ15jcSYQ5Jr+U8sd40plAskDe83Kliv9
         0Inw==
X-Forwarded-Encrypted: i=1; AKwUvBxgh+Awsj6KdpyvQaVJgsj6sn3grtNou7qCS8HuV96a4DyYIzbiVRIDpnvIclZACLmvPGjgDMk2WYIj@vger.kernel.org
X-Gm-Message-State: AFuF++moRSEXM7L3UxxlLCUk/5H4oydk+xSSfnUrV/LPGIEyq6gvwiT7
	QFGun/IAG1fCRXREMRWHNfx4pnZIrr1egviy5sBF1HwYtEY5ty/6HwBszBQIEyb4ZLRK+vOex0B
	Sm0gZyAYtKEs4hCpsBIHsZXbNqZtH1EWSwcKQ/EsVTHpS6/l5BBpI4sEDo51zE+qv
X-Gm-Gg: AYBFou1NuwFw+NGG5Rj2J5lhhx4p56bghnwB9+StIuGaTXf9rAB9bq+G315Tnq5sjDt
	1ToBPfQu6ReJlJY0QZEzUZeioO8GosKKo+CYTYRJ4kXguUF3vCC9uaBiR3NESJ2HejWn4FnmI7G
	27jGw6v/RdEtjfo0yEsnFGlcJ1MHIJz2PO8ujZNKcmXC4Ob/95SwTIlhwMwFL4hTRuyM6Y0keKw
	laO1kzk16sOcvFuPvBS+og/JuPxHYSuojcQC/HwbxhEwgZPimJcqxLh82g76RWn6iZVM6cbEfGN
	BZmioNnGDm89pUclZKhq1/ZVvHMLQzmoMzQCU3z6T9tS2nEwVIOPQa3DKxUNrkD4e1bjCoB9k4d
	BW6l54CMJFHq0F66WfwCAbz55Mfggj/0jzlePEZ1vaOC3cVNfyAxoSQcV36Ls
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555890a91.9.1788509805911;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr7555828a91.9.1788509805313;
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:45 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Fri,  4 Sep 2026 16:16:15 +0800
Message-ID: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX8K16zHsggIHs
 Kl9xJ1Jy1Z4krWe36DJLIegD461QWaxkVWHOSWFvzru3sQwZCDebuPrvYTVpvb++y5hPbXFQpH9
 CZLH9GyBG+ziQJMsFTHuFa9BpLWReCM=
X-Proofpoint-ORIG-GUID: cbUf9a2sSh2jar4AoT8l_4bE_nvpjVzN
X-Proofpoint-GUID: cbUf9a2sSh2jar4AoT8l_4bE_nvpjVzN
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a7e6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX3I1Anq8RuXZS
 E5anFqfq7ptCELDXzuy29tKRxATZSO06JWcHw56hUEq+L3w1vh9M0ovbYYEZuEULaEMkYzRyuKL
 QdXCHhiH0LNX6RLO4S2bKPsWwOFcvk94/q+o8OLbh/xR2bR+MoWY8e5NSY/xl1Ngx7Qx5qlr3Ur
 +e0thM6ukQsrmVPdZNKdoAsa8FcIwDFz4SmXLnGC1hxtSm5TI0BSBJleFYefky+4wZcS3MaidrI
 MVl6W/3ROeBntYuIJhs+nYkVpCDzoX7GnZn6NFh+Tt7qT04AtTw5w6mv+jAvfczZfiVEKoJDeEO
 7V4c9U6Pn9BMMjrOwmDcDs8JteOUfEUZ7jfA2/5HMoOrbJaG4qXq+/Xj8kWIyH03ypP05e1SrBQ
 MqbItJ7zk7xO7ILK6ND+i/G4ycqyS93Kf+zwPF53GSS6wg7ZfJduaYlUMr1fAxXpmjkncZu80ga
 9QKL5+avKun7m6eriJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

