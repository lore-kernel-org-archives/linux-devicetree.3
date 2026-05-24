Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC10318EF4
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652191; cv=none; b=TeCiGKBT5tBocdHrcdXi/2i4y+aL9cuYEr2kwQMwG4nmDUUgJx0gpCld0ZLd6TDp4ndo+ASDZZSPyZSLUJ+9WjPhhyaPnQwgr8Ve2PzHT1pzaLk1nOctuYguGDYbZh2UyNUHb1s1Q4CpmK3NrhYxSn7FNW3y2SYJmEg9fwWxZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652191; c=relaxed/simple;
	bh=BIGk9NUVoNDrOtt6d4N1Uq4IdfPUi7mT/rywQ2ssYKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgVZexCOLL4QplX4vxsdHBM+kLLQZR2aqqwebZQL1Ig3gsvDSNmc1X36dBcILmluJCv/KHCT0vwK4R3xL9JWQ4I1h8f7I28Jq5npIs+QDtKkFVJokRFnwmUy6H0APoKH+wIJH89IBGYAQ4kmJo1F0X9EDarF2vg5JZuLvQqf3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f11KwDAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLzv2EHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f11KwDAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLzv2EHr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJKKrP2602665
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=; b=f11KwDAHJGu31tiS
	Kz8lwsS4BECL1KzQ55FgxdQ8k7m0zLCLf4XOcX3MMb8fQB8mNZirDkOvzAt5k3vY
	UGWbwn/v1ENp/5ZhRDEbElW4VxOnCoAS5y+hemT3XV0x9Z+gdUHbbYvBYnbXTk8U
	JlP7y3dv0yVzNQheJtJB8/qXtPsjrl65iRde+lHV+lAGkbGtMR6tA7HTC3VlcTwl
	DfQxmZXiPfunsiV4hMgh2rerqlkVlLd0MEg/lr2/l63Xq2wRWnP7tyKELiA5Y6Gv
	CowxyRcjq+Y0Sd+X3r6As/FdcNx0vODWxItItFiHUUlurB5TrjE4nFy5FuO80/JA
	g+G6Pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t41sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso9237434a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652189; x=1780256989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=;
        b=DLzv2EHrmi9vfs+pNxxCCbSJs/VLnAXD5pVPeylO+nUrF0cFnhc265uc9sQUjiMNIY
         5Ej1CQ9nRqdXUREWlQUSFegIHt+oHQXLmwM+81DYdE0mJYIpd9lfKOgpM67Kovnp/D3h
         yGYG3+uTJF5xWFKvAkJJmBjMYJvK2rxmyMk1ybRoVgMU/m2Y0gOhWVqwLHIBwkwy5XU3
         u2jAKqYdBYT+2j6+4Be4kr+2MdlGQIs8wRtgi+C81rIxSE8mfg17Uc9Re6RudoMVUGw2
         uJYjrywxetBFkW7oGaq4MZ36tVU36eDkqk2iWqatJVfH6U8f47A8+yDLglk73AWjJWyw
         D1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652189; x=1780256989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dn3fvC+mkNY1uNxo3o5q69xFB3+G2i+dm6Pos/3JyeU=;
        b=gCkzJUxNPHLziALjytH6yYarj5A8S9HD+TGIuQh+LZk6vlhQ7fZwGDw0ods1+09hTZ
         FrBmoq/UbXw0ea58PpDqskOBt/+kKmFN+k1XOLkerpro2odcepZHmF1icCRSm+AN3Xh0
         KIVk4YrZqCIZNCN9JIsW15vJ4cFMFEG/ZVlkX3BYJO1ldKhZVhFB/0kA3MINjh8367rz
         sp99KptVmIj+xrskww9uBi99r9sa8UuKh7/zGVFL3h7vE7uqBj1MMZ5CIltOUTiFFzvu
         bydlnsX297WQQzJ2vgta5a6PAt9U+TAyH4fdVvQy7S8T8efSEw0t0JBteuCreU9j+S64
         k/CA==
X-Forwarded-Encrypted: i=1; AFNElJ+xQyvLphcVPtWbP/75hhdmzUAKQi5Evd5ljBYehVz3hk2FrUCAsRD7mz9nu999KFHWWOye27rI8FCy@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBRP1IhjeusTYBS8mdXo2ZOZXhE6SIkcg9EiyZtwzxmLcKsLG
	cmuWM2WAiMr9dOaxUrCjHe+5DA5Zd0iBzCugFi5dAqe1LQDxD9SaDIl9P2XOWXJQdZFWf55oZ1r
	ryrvaacuFL3s4tUiNLpOlqlbC0N7gw5QesSWHyIiedq4gF+XreNP5NndGGWpWLXVq
X-Gm-Gg: Acq92OELatNeaPck/f4r4MY07VW0sFlsWf4VQEx91E5SI/BslvjAMg92RPPHYlzV4w5
	yIUNO2dKvc1A4l9xuBLNDUEfWDZme6Lq1oTmO1aQa8emFy76Op5uNywY36wyBtbtYeeS7XPb/N0
	2fTvpW+hDZYA4c49gU+mWJD0ChUbwrtoZGlH3VbPLf/sFj7ILw1a+QEiHh9Fa6gPf0UwL5cMA3j
	t6FwAsq/Sr79rGW9A9IKIMguaq6Un7jRJRwS4Lu9Ys6bB7iwclTDKK73e9zxVR69QDUa3KLfzub
	UyLnJDpegn3CvLhl9ExJ/sA9BUOj7412qTN1ddLuXon+qH2qVXLqY9/S0Ct51d+KLvTiStI7nba
	l4Jz6ZipRbar1CkPjvdqQoNSkICH+be1BrrT4
X-Received: by 2002:a17:90b:3eca:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36a473cf321mr13318562a91.3.1779652188958;
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3eca:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36a473cf321mr13318546a91.3.1779652188436;
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:48 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:08 +0530
Subject: [PATCH 04/16] arm64: dts: qcom: shikra: Add cpufreq scaling node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2418;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x7oSC/QDcnnpqyvWDCndMCwGFZzXKEB/9qcjR+Qs73g=;
 b=HxZsJ/jHJslnVtlepsro7vs9WMcGY5uPTKgq44vIO85LdheKILFcNryAySnY0r2+UCs/LiR1c
 s7sw0PW3rBOCD9AeBLh0vzGROv8XydUBSXVMDKjw8OJyiXlg2UnNVpz
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 9xoCbjzrlo7aTBfMKtJ1k5hEzFil-EKx
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a13565d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sEM7OkBMBn96DhIRBF8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9xoCbjzrlo7aTBfMKtJ1k5hEzFil-EKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX/kvn6o71SC+s
 0HmUCgXEnlmuB8sRLnsMIw+5Rix41BlERfao/36EKfSVCcIVSHTGSEcuZVg9f/aAFIY7ifOSQ0s
 ib17ZEdnpV7c6JgDvol1+jWfkDh+YlJZZclwRZGdZgkI/kaqXHHr2La25iXyRMsWYzyLM7muQw0
 ouKwD/McQUJQi/RkDoU+QvPjI9n7GIUg7ZXqY7uT/ErZTZLufIRA059qNdR/azEZa5NzjIzapv9
 tIJkkF5M+iYHVGSzfUd7DqX7UiK6UMcsTiXy20HTWKQQLArVAGdJoYKrgXZ9xsXORN+h8O5KS+N
 FHadPhnV+mtQeeLrg0UQHq6IiX4LQL2I8gH72aYAqlHpDjZZFgFOw2J9569FR2N0Z1xRHl9mVLw
 Zui7bU7auL7RNS1Q7V5N/nIZKOYvrw3YT8qma6mCAm2oaV+91hxV79XPzCJ7z1JjP65zXUbvLhH
 lf/uEnqg7hczQVEgElg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Imran Shaik <imran.shaik@oss.qualcomm.com>

Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.

Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2751b4f89678..35ab7072e20a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -44,6 +44,9 @@ cpu0: cpu@0 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -54,6 +57,9 @@ cpu1: cpu@100 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -64,6 +70,9 @@ cpu2: cpu@200 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -74,6 +83,9 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -1780,6 +1792,25 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		cpufreq_hw: cpufreq@fd91000 {
+			compatible = "qcom,shikra-epss";
+			reg = <0x0 0x0fd91000 0x0 0x1000>,
+			      <0x0 0x0fd92000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1

