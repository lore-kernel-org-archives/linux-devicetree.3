Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057FC3D47BC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448235; cv=none; b=W7m6DGxoMMRAaLcBv058qi3uTQP++XvSJT8dQW5fAlY/bFKI4mzBvX/D69XuvIWern5ruxpz3d1U2VzYe92p8TxZlvcBx29QkHlx2h1Ui0mkyLrnBKoTgF6peel3/mEk3l4bTCFAiIbDvOG+988pUGrQU3wqjudXYkz0KyXPZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448235; c=relaxed/simple;
	bh=iUfGQ0fJez/3uptpGDzAVGoYlqLssM5v26RATncmoEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uf6rv6dJWbqkqlvciM/Qbhf8hKvFkwnonMP/fRPMC+M2w9xjfVJJ1BLMupLObmeQUwzCkyzXBwSX3IYLd/CoDGa16wcsWET4YunBwOgaHSCbO8GNoI5UpK7A+77a5vMS7Igp342S6yA2js0AKAeX9VqlzYTqdBp8LCU7fG5gHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln/qk1c9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iajS3kx7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln/qk1c9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iajS3kx7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6u9jg779268
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=; b=Ln/qk1c908H3JKTF
	mBU0fssYgFzAiwnkP/F2WH0e5/FEv1hFxkwettd9sTVIhct3jIIdGozLB21smPpA
	zuFIwUR805Xbu0bjZGxYij2ZV3/EfZj3VtWcRTAOZgBAH7dfHtsrgPp1a52Am+kZ
	0Et4nAnXbkOtq+5zqD2SOhIvt63DNQsfT2Ut8CCmxcq2GNp/x4Oxr32zw2FttHQY
	UKc7KdFcO7geaDfIF+BEi7/dUwltZFMGlM+xovxWbUW2nfWMotAX1kWdmT7P6dII
	N62rT9G8D1Ubn7DBrBe024VUI2C38N2CdHxbmbl9prr/tCvAPrlp/S66BO4gLm6Z
	CbRc/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atenj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f85179263so9302152b3a.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448232; x=1780053032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=;
        b=iajS3kx77w3S0y1NwL7UrD0jwTgrigiH+9CZOs7p4coyfMVZgudQOU9Hy/Cgve6k5r
         mCFTkFhLAh9wU26RQzzb4Pwp4EVLlWIQJ3975kUCURNFB9FIX0Zb8qkUlOA72dwUIJcz
         FvR2lSQ7GF/bUDbNHrJ1KAej93v0Ypl8GgslTRydDmcm/BXPibrqTKzAY0zKwafodTWC
         wESZe+1h/nUxAYGNGRuQrj+SMjrmKhi61qy/UvyBoPPNzWCufjzh9dtmqtWW93pjSgGZ
         VbL/Oa4/rTzroW9W/SvkcoHAARRmqaRfB5SCStj5bZXMXGNaaCCQM35PZ1ICEHIq0JCG
         uPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448232; x=1780053032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jh/v4/2c8PuVjYnckNwLweAG3dohd35ToKTYOVMXeEI=;
        b=CtO9Fs0UmHixl7rDlNNZlnCfR7L7Mi22sQt0ps43tw4HyiaL1m+WMJ5V8nqMw5l3nf
         IWXsKso5tbWTu+ZUFnxRhIzmwLmuyJqbQ7mUtVqwpqtLUgypmrxAYc4Wm9sRJXbJnZxL
         MnAkwi3yBmp/0Dc1Egu88ZaQccUpQXhb+kvqTmtAsDo0aoDyzDqVuvcEE+X2cesy/nPz
         crRHhFhyQjtapadiyaEFAW7GvrDCXtfdRG6Bnsjbwp3DV87mfWmMzAoLixwEnnZs2Ikf
         9mBHU6ihHU26QwPPYRWFvAOyP9Z4o2G1fR9Wf33inMchA1HaOXZzdgsXcT/Gostb13sb
         G6LA==
X-Forwarded-Encrypted: i=1; AFNElJ8143ceZf5zJdHYYheyExEt9c24OMl/rjmdZObX7LoIGIxqNTyso4NpVpjKg0+gd03jMg7C8UBiZKKo@vger.kernel.org
X-Gm-Message-State: AOJu0YymoJwqkT8LEgBQgMyZ4KxlvTBOgA+zNibeb1Al//fLv4Ds1gaa
	2sBEWZ48MkHx7l3HOiqJ53C05HE7Guyz+zSbSGYC2yUbCXalh6RQgimTL4Is4uj53UUeFeb7yBT
	Q/Z+mXtkOIC6nafxgQZHS0s5mdSn3/aY3k9AsYWUYwbxGA2vPhLJPXZtxFypwdcQIUjDWUAIg
X-Gm-Gg: Acq92OHQ7A+v0IvzC7KlxT44fntFosoqz2OmG9+JRxNvB7eGLdO59CAADU8rYRV3Nou
	6cfcyqtJlNYM6a5VlBD29wPGLdamXkUPE13/o0PBB4zLMHmHGot3ErvNrRJ+yrgbk5+/seJqANw
	ujaQDRG+l3s0rrmR/oeE9qTowhflfkll3n9ByHtw1a8mQvCx7Ow3fSpJv2/HG0k36MvsKpHifng
	UO4H7cYvvo1WrpqB7GuGekLo30LHtL7PqgNQOEtpREpqVr96OF+i1a9IRJLL98JfZ0sXVka71Sy
	uGvTP4w2uFav4eD1qg9J9cf4WaayGfBfbeluyyaVgDc6S8H7JRqt0ObJaDKiuaJxniLeyqFq8OF
	FoV8hVF7mqiBw/4nkWBDySU8wRE8ZcHojeAyGMAxi1kvntQ0pnGTa0KxcXcPYA6k5ux20
X-Received: by 2002:a05:6a00:39a8:b0:838:1636:e2d3 with SMTP id d2e1a72fcca58-8415f618045mr3411113b3a.35.1779448231972;
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a8:b0:838:1636:e2d3 with SMTP id d2e1a72fcca58-8415f618045mr3411082b3a.35.1779448231436;
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1578962b3a.0.2026.05.22.04.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:10:31 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:40:13 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Remove the
 little/big_cpu_sleep_0 idle states
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-ml_cpuidle-v1-1-fd311cf33fb4@oss.qualcomm.com>
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
In-Reply-To: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779448225; l=3829;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=iUfGQ0fJez/3uptpGDzAVGoYlqLssM5v26RATncmoEI=;
 b=KxJbGF+OoyTgt+U4d6EepILUPyNS+Q5UsuAW0lVHben1H3jOkDcHhbKxK1Vn/sC1iXeFVLsVl
 v0MT4kNeazoBT+Fas2+9lTFKsRwSjx2Bwe64YRf32PXpi7jHDYmdQ5L
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: ooY_QvYeH_Rul7_YMu1AT-P7tTc6FVPj
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1039a8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NYXHHODC6xWyQ7jjk-YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ooY_QvYeH_Rul7_YMu1AT-P7tTc6FVPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX+kZdY4hnq2k0
 JBMTHbGk2HQODC7eCxmvJ/0SRJbZA/mlYH9ECa9G1I95T7kWGTsTpcPHNrwWorG0Y+pCHmHEXWP
 at6pvLtd0V1iUr7C4YHLzf9XZXS3uM7NV6oy1s//jrIeScWlJ8AFvv1d9f5CioTER6NC1Of8Wlu
 dwxNFIXudgr0bJCmTTZL3jIFtWZcjn1a0LccaSqe6i+aWukytUgmGsqPLp6CgPv5JA+aJWBb03r
 vXQm8uP1vnU1fxCrPJA+MssCBYEgASM9T3CiHD21WwO6B4R7Sqv8X01U//IJLLzwbiQjBv87g/m
 //uwq/7nKkCM3XcwrVT3Fs4k2B8zkcxCRZt0igA1tUOea/kTi1nFoqLFup0UYXaVJLHe4ggaAQs
 AHqSSZxIpuDzzlqnBDTjK2M6iBiHDRs9ph8I1Ph/YwSxCWi2l1Dc9yMoeQR3TEZhhDlhshSzKEl
 zjZZGA3uhuMKoCWmv8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111

Firmware supports both CPU power collapse (little/big_cpu_sleep_0) and
CPU PLL/rail power collapse (little/big_cpu_sleep_1) idle states.
However, CPU power collapse modes are often not utilized in favor of
performance, so remove the CPU power collapse modes for monaco,
aligning with SM8350/SM8450/SM8550/SM8650.

Rename little/big_cpu_sleep_1 as little/big_cpu_sleep_0 since it is now
the only CPU idle state in use.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ce6ff259cb4a..fed94cdbe41d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -309,16 +309,6 @@ idle-states {
 			entry-method = "psci";
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "silver-power-collapse";
-				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <449>;
-				exit-latency-us = <801>;
-				min-residency-us = <1574>;
-				local-timer-stop;
-			};
-
-			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -329,16 +319,6 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 			};
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "gold-power-collapse";
-				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <549>;
-				exit-latency-us = <901>;
-				min-residency-us = <1774>;
-				local-timer-stop;
-			};
-
-			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -681,49 +661,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
-			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
-			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cluster_pd0: power-domain-cluster0 {

-- 
2.34.1

