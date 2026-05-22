Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E593D349F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448238; cv=none; b=QTWNnl+A8JDVh60v6mytBUCCIAIpPo+9oZjMGCKvnwpuJe/dHX82RJkSuvxx9DTQpSjLSmGPYP+LdzoCjzlICsHDKDLDbQ52fY84tC1CWAWWV2MVEjzX7dJRal8LoHTexxy4XDtA/IsB18N486nTyDkTYNcnlPFie0jLDBqdTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448238; c=relaxed/simple;
	bh=sT/RJhdlpzKkZ2qsCzYy6ERO48u4CQ25iX5KOSGXUrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmGIrSn4waTKLYxFZ38fLejOquErA1oL/IF8z5eTWJOE2f4MPEG/PWAc4p4gbBanHEj0aniUFHcWitnchBygEKU8p3ak+LQk2MBPATV8L9IWrJWYPz1AJtOekg/eceAbSNP4bttSqF8eqONlCOKRCp3g4QndjDoqja81lecW1t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJx51xcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f54SjkME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJx51xcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f54SjkME"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5sXY8777027
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylkJk8aA1T3tgOEhTrb1tXyIN8M32SMHKf17LcUzpfE=; b=NJx51xcZ7lzbVZKS
	M/IIQ365r7l0LX1f3kvAnDzrbg0aPvklhcnfFhalc1Bl2FV7Bs83xpffo11L/Rgj
	mYex8j0RzGjcCIrojN7sFQ3XpDSeoOyWuXOUL+21YKYArusCRyvNqebq/LpmP2ee
	fpKYHiZSv3yCZMULDRZPRz1KhuXhIL4gx9sM8yVAKTwSqQ4SqHtXC2QHpg1yy3i/
	SIIO5CuP/xvl4HFnRd/HZgT8ldK0k6U/Ve9jAbWcEg/IcyXNnw820MSUKic/bQhM
	pI+BOHAndS6ZEHuxGaelqyJU1MblQbdzMBf+PBLVjHk3EeylFNBpY6+XHKtB+2nI
	EU0Gqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h36wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:10:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83544d05c5aso3552216b3a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448235; x=1780053035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylkJk8aA1T3tgOEhTrb1tXyIN8M32SMHKf17LcUzpfE=;
        b=f54SjkME52+zd0/WMXFxcJTcqKMHJ8L6ybL5ESAqjazJTBFTtr0Rd1LZZN0SFxvOrZ
         ZPLaeB5XOV4Q3o4HuF7J1KhZSiwevtqu/n1Sglw3GOHwQks04Ao5pyd0qoa22uaiRwyX
         UQmLu8rSNshBrnGm9KqVLoWDNbNtBPQUGIH8o/mHzFUvBJ+pY95xG2VDr7GNpHSRqTLM
         kikkOoeOtfMSwCaVejAi5TEMJEJBXYJ0rV22gDaWJHcvEkv2he5pUSdAkckN193gEHPw
         uB/dSzKXnQ4rlGluUGkIFTjUnW39aFME+jRWbOjYSVVVDVqplTr+3m1BHIVKDeXkyT1E
         Hnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448235; x=1780053035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylkJk8aA1T3tgOEhTrb1tXyIN8M32SMHKf17LcUzpfE=;
        b=g4oFbONeYZ616avmDK9oqzLtDSEQNlvlwsHkQL2TV+Yws6OarCRrfghYhcm+1umm3X
         TjXvOtV8cc3BXg6fp2y1buELLDfMM3R1r03Xgiz9z97KmdMdU1zxXbJ5Vyhxa4Oyh10e
         W6rmE2lDYIRfTnTfAxr7txsp/qNzVcYFli06hwxVecLHE7XjouClQkCYrRUC4CMaaZHu
         rcOX9Q3k6lvMOE0AdI7XqVc21RQL+nEDoqeVqH+GFSPMrnttdgdmvmIM8Kkiq2d1mLIP
         4ssb8mergIhre3pGOkPPt4fzsD3aUKLTDyiU18oXTxtbPpcI+i0/tI9N3+UiGy+Jh5VS
         DzRg==
X-Forwarded-Encrypted: i=1; AFNElJ8IvaqgdWjf0gBPyAzaaySPV44sWHaC7RxJgx8e4ZWWOdOniNXclhyzDt+ECbxfMlTesSm8D8svUK+S@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBhbN8sUbqUpGObzZxK6EYRKOg3ra5FBw4LdFqD/9a7JysS9N
	F5ucITkvZD570pbhoyB1BtFgx9hwP4mM9KlDa4au1vfEqOXrIL5BlUX8OXyXQT27/mqy1ILm/cI
	7KoWKnyth3bKKJ071ghvRJRjpvR0wJG0NrRqtmHhwaF6sWQDlokvGhJ8LWW1XTp/Y
X-Gm-Gg: Acq92OGyCXKWkPWw3SR5nNKXuGOHKto2Q/QhEdA+g32QqVCKqPI0nbczh315W6MYZyn
	sGJu8TP12JVO7MFMr2uLF2JRFcACiEtEwH56X3Sj7lDwnVo3xG/oEJsWS7TreqfC2ll/H8WLFiN
	94KhxeXOwM++b0rSwtMba2z6eN2mAcn4goImTqaPVWii8YXE1cpuhDJAC+i+Ix1C1KmUQrT/m53
	Ql4QOieopcdar2P4QYUGfH+47O2vuLlnixb4kbrLXE7MW0bvd7N9Ja5SpV4MpFNhnYdwRZzXu1N
	YXwCM0pdlEEAiibvY6fG0AyMhW15Zo1WkI++YHRaIBhPYsx609cPt6BOTKXvVIuTIxmYBDcNTiN
	0maR0W7sjaQTjwZKKsnGNNHAOaFrxF8yN+1c3seIlIp/MlOsvbNltz599iNKdFXfSSiQV
X-Received: by 2002:a05:6a00:17a4:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8415f3f68ccmr3432293b3a.49.1779448235203;
        Fri, 22 May 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a4:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8415f3f68ccmr3432262b3a.49.1779448234717;
        Fri, 22 May 2026 04:10:34 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841648a2bf2sm1578962b3a.0.2026.05.22.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:10:34 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:40:14 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: lemans: Remove the gold_cpu_sleep
 idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-ml_cpuidle-v1-2-fd311cf33fb4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779448225; l=3497;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=sT/RJhdlpzKkZ2qsCzYy6ERO48u4CQ25iX5KOSGXUrM=;
 b=I9uAzt5fiOjiYCa6oXLB0dXZDvzgq7CPJUA92EuKrvd28cq8y+xhVa16sUHia31ESMTBP9/jX
 fKL0bp4kszJDvSIGCgk/bYERbqhJNLjqwfH6/iR5AcKt/6ohueTqk0F
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-GUID: 8xx3p094n4WPUN1d9onT1CQiDqEVKNOv
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a1039ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UxDgQPWV-SMpCg__AdQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 8xx3p094n4WPUN1d9onT1CQiDqEVKNOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX8AtIvpHuRSIY
 QpmmhBcQpARyA47a+tpy5HAx0e2KLcBxjuSXLpGukwgUAVZoRkVWl5cq3Ikibj/W06r64Jw5XM5
 YJuwgGWOtQbQG87sUzRK/RMZy6sRba433qcpar4DsppMTsvzvVeJm7pldWj97BjUcWJFRoTYExf
 cXahXUQtdQcsG/fWS8ixTLX3teKio8EHA5V30EYYPsnKcY3LuAwbfq+VhC6/JmMLXZhbD+hz8wP
 vGDa1mMBUwEqTICgNqiJRwTatHtj/ng6RSQ53g3e9jIG3LzEFRP9q2GQ6d0KYjiSWuK0HE7jNzd
 rXetvOlooB9duYJmqDuU6+zNud6a0VpqACxz5fCMlILzom6EcXAAmCMFNFI2JWJFeGT6+6vVG2d
 p/FFGZ+JNB1WCm7hEGAYWvx6r+FprIdTSwT95L9ozErT6MiYnxdMBazBfYJ90YARoMj/lhoHiKK
 oO94AvGGhl/QRIcOH2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111

Firmware supports both CPU power collapse (gold_cpu_sleep_0) and
CPU PLL/rail power collapse (gold_rail_cpu_sleep_0) idle states.
However, CPU power collapse mode is not utilized in favor of performance,
so remove it for lemans, aligning with SM8350/SM8450/SM8550/SM8650.

Rename gold_rail_cpu_sleep_0 from cpu-sleep-1 to cpu-sleep-0 since it is
now the only CPU idle state in use.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc7b4f65ad5e..cfca4895e9ec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -297,17 +297,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			gold_cpu_sleep_0: cpu-sleep-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "gold-power-collapse";
-				arm,psci-suspend-param = <0x40000003>;
-				entry-latency-us = <549>;
-				exit-latency-us = <901>;
-				min-residency-us = <1774>;
-				local-timer-stop;
-			};
-
-			gold_rail_cpu_sleep_0: cpu-sleep-1 {
+			gold_rail_cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -566,57 +556,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>,
-					     <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&gold_rail_cpu_sleep_0>;
 		};
 
 		cluster_0_pd: power-domain-cluster0 {

-- 
2.34.1

