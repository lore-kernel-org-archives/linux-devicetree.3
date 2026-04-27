Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4C3EB810
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314382; cv=none; b=AC0cfjQ8ouR0yvpwIAuZEYFnl9Vv4gCX70RPO0C9LN5UpHtlH48BpbyA6K7kSCYkfvy+AmLuq7akltzVahcT67vmk/KlNkagkpbIYly1TY32cEIDcYGg4Qh63Ud6C4S0G5Q3ZjRXyRtmwKdjtUuBoqGLn6N//OVz8ZHVKOuKSRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314382; c=relaxed/simple;
	bh=aCSDQO436HpuxDKMB62Pk7KuQwfxeJrpdLuLYwmKsIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oapmheRb5EASdIfq+6T1A12aEtYvLcLPdZyF6azZf+DeFCQJVLP05sLUKAuF8+Mjf8roWx6bWRBBehhC5pXYcLuxdxIAzerBUxYsDoh6mVVjgDH/PKTtDg1uaRDWQ20L4Hg1qI+bA5+LfrFHJqDomLneVsB5uG85yteqpEOZ0VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHc61Ip3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVJa9ur7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHc61Ip3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVJa9ur7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHYs3k1237426
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g+ARg1hUBWvaOqT/ilKWbT
	PpnZEeo862sArqSvo5Veo=; b=XHc61Ip3mJVqC1ipSG0OwpH32VaKYyfW55Hwf5
	XN5rWRTNTqd6A7PUiNIJVkPwzwyRbcqZM+kFT5KrF7n8eRWJZVuUMC3kSVYGO5aM
	NldH7ynMoFmER1TDsFKmMBvvsrRKfQQRLutYaqfhmTLhDpYXuLQfs0rpaBCWnPFA
	z0/ZNzLceBpKiWaOaEf8rpDcWslUa6KC2noRlSHxX/Q/ALettQwR2ZgAQWz7w3/m
	LfZuwzcDihlvkyio6TP/nDPgreGF7bkFdMZYaJ2aBDeevGt9NbZm2LEyD28LULRp
	OX/pHJL/l/mQvcnOfRt98j18rrXJXMgGaa1237BTGe30d5bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4hn11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:26:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6197269b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314379; x=1777919179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+ARg1hUBWvaOqT/ilKWbTPpnZEeo862sArqSvo5Veo=;
        b=YVJa9ur7FRCapXeeptnsCC+EZODiXJkau3QtCzqxTJERBDfNLQBzaBf9ynx+YmvjR7
         dvcrwf/ag/q7oQ5Tstn/95FjYYXzeWFntiXmULSNNmbARRGP8OSu73W8buJNSLTt34Kb
         cZjNgLwWqp0Yrc1+Mbsrr9r3ySint1zud1PAEArogbFXPabwHAXzhpVmuorQ02KxUhIk
         DFGdT/mtDIP4ho9myTqzVtwBenEVY9Hu09H7n5jfhoKV8hnAmdMyfci9RUQvjoF0XCtM
         HHZyfk2rjF1qiDiUEJwvZYCvz5RBaIFmOnOCtzkfYElhr5z9+ya33JZjNm/pK5jUA0w4
         HLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314379; x=1777919179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+ARg1hUBWvaOqT/ilKWbTPpnZEeo862sArqSvo5Veo=;
        b=sdP9u9vZOcALA7Lb2SdSEb7DSzbKIrPTUahSMLlFsd4VETQBxex+BBgDMiCKFNR3NX
         N6VRZrcmgvmWhvkyAGNDF5w009bNfUQPc7fR4y3jD83LSDZtybQbFKlVvjeEqpO6+/Ri
         2oouc8xqg7F+uVnl383+EkU0pFin8xow8dJUUhDpLblsSPRk3Dv13ZKq4j4uQCkycJ1o
         F4MuHjZb01vepWh8y11/EQKjoWFoc4OCnq4efkgD8/A6cwb6HzfyQ6+S3I7asre+Ri4E
         UEHMrpoiSH1ECLprOzGDqFBU+gt4Ne/qr/xJ/BtIt8GSPvur7jT2pCwZf8aJYbQVJFkU
         UpcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zx7D5b3FxB8ojmwnLd96ngEsOaXBwV+03B3DIe3vR0jgkccDnawmICOdqIZNfW63tWrfRcTXag6EI@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpm/3Y2fIqQJhfM0INhs5s+tMunm/zpeXgY6/qF6eOxd7NyKQ
	91j5ickPq8cmkKe6J98QR3EGBGyakgfzZlH+6YrwI1ZNwmsR3gpacXYvoB2f8eD/47JMM1ZRwXm
	koHrVC4LCMS8rjlBod3mlE/bQG+f25e/eAbxc32vYp/w8WAF0+bBCrefGOMEdUj6/
X-Gm-Gg: AeBDievhDwc9uPeuM6cbb0hKcR2xI5mxIcKhiS3dxLLb33UbQczOXOxuXPeN1Up2ZEW
	fn1KZOKeCQkEohb+2ruR9M869SqGDeezw0bCLu4Ne83Xy0pDg7dPKtyGvqveTd+2GaZOk+tSuXM
	1DR54jnKPpHE2Dpq9CIiPw7RzDfaYBuUey4h0CkAYzKvffFf8Ci9bXV3DorVDj9tX/9OUU/i2CR
	F+5JGpulzjUQUvQMMXrQlbZQtwvXB5gc0IgVzfCwfVGxPeGiwXB8eAet9wT6+aTuysARuymxUx/
	H6puamlp4lL6xHZYiG4+jucK2dxJf23dcJxFfouxBQpMzYefNFcLwZTM2dggiXTFgTpP80oIfMK
	ExCccCZifayfYCUr2SFHhUtOO9t4TR0pTZ4oxnbmANX4Mve+zfy/ROEl3
X-Received: by 2002:a05:6a00:2d24:b0:82f:6a64:deac with SMTP id d2e1a72fcca58-834dc277788mr109722b3a.28.1777314379005;
        Mon, 27 Apr 2026 11:26:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d24:b0:82f:6a64:deac with SMTP id d2e1a72fcca58-834dc277788mr109687b3a.28.1777314378378;
        Mon, 27 Apr 2026 11:26:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae07945sm179413b3a.9.2026.04.27.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:26:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:56:05 +0530
Subject: [PATCH] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADyq72kC/zXMQQqDMBCF4auEWXdAgzTiVcRFTKZ2QBObiSKId
 2+odPk/eN8JQolJoFMnJNpZOIYS9UOBe9swEbIvDbrSz6rRBrOdoyDtGad1Q++NHk2rXd06KJ8
 10YuPn9cPdyf6bIXN9wijFUIXl4VzpwIdGf80DNf1BbjqLeiQAAAA
X-Change-ID: 20260427-talos-evt-gpu-dd72b782c18c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314374; l=945;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0V53xvYr7g9kBtmZTUeEPtPlVCLGnJ6Vp4Y20I75eX4=;
 b=N6a7mInwX5bMssY2w3J2quJDF/s3NVDROgDXxFpn6lapx5t93Twz2i2OVlTTgVVFjv2EUQPDJ
 ZjVgPBmayJMBzjpWP9hweDLkGaSCvoHfZdcLEIJA+ZfAJ2lntbY6b/R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 6UyD_Lkgc5YPuVR2ZFntRZ60zOjumWn6
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69efaa4c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6UyD_Lkgc5YPuVR2ZFntRZ60zOjumWn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NyBTYWx0ZWRfX2hiTuJ0/8hfF
 se2oemeeQZcAla07wWG1oRtZUpuwtFF9vRXRlb2cAAGYDjeDc9v/0NDAbrxrJQcQ5E7cYQdSXQf
 EswuTlQQVGRk11n4phtpkNsU4mI3j3ydti93exZMp+CLVJuLOx8uwiRqt0qNAywbOAZHpAaxSmJ
 QdLhnhsg1RXdMUEX956hTfbw3ObvMyJSrVPUrp/i9Mgllr/bwtKbzBARzfYdTUleZ+SG6L8fDpY
 0QMedFiEARZCaA3V9Y5uBT9BDJtFIuYysPYhyHWu7g+mZlbXfU1ZNN53QrV3THE5FceNZexzLhQ
 ueCAwPe96/F73A8XZ6yD6l1uinhgW3chfTpJNxfC7xX3uPkzlQYPPrAcIZpI59on8+wuZLdMVBY
 o5jFiP6uq82jTs0jGb7ElNLhlnGekY40vmyj0mkx3EhuU1Be7UQa0jHeNhK/WXaEqRVuiZDUi6Q
 voCi/yLCjzzl3lyX/YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270197

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for talos-evk-som platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6d2cff3cf23c 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -317,6 +317,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
change-id: 20260427-talos-evt-gpu-dd72b782c18c

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

