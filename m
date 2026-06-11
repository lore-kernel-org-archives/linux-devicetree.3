Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928DCA6B
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154088; cv=none; b=fIRT4IuBfYdt0aWmV+DlV+iALGxERBxvAu1D98TNaTCzCGlqpCJuvX5rEh2oUSX01+fTUf+wovLuflu3yfOQFkhjooP/PcT16U/xv2WDgN1FllfHHtOPJgHPUSfGgO5HwRBmaVj7EPfFaPVXqyvPHqnf9LnANUA1krhGpV64cB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154088; c=relaxed/simple;
	bh=nJ22RhsEYu1ZN2/H4/WWZENc1zfrl59Y2SybnlYrC64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7/g+oLDR65vOYYoP37a2TIt4NIEZe8CqB7lHn8R2XJfOcH8Vo8wCFrzHlzXprcqOwdbRfrGWAdFIRPNQGbnSIQx1ODwj6QvKDOyvhERozZcBwOu32gsaLq1UTSp8SiNsSQYnrSOBZkV0dwqTYLhzSsvSshJdo3jylhCxkkzkYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9eFKXen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTbjXd2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9eFKXen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTbjXd2z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NZjM3183756
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=; b=S9eFKXen7+Rv4ena
	JLO+wbeFVy/NggcX8lQk5Q+gXDJuZtgT5q00LsjxWeDhwIHulO3viW2DdCB73KRy
	RhjL8uqOKgmRp4EBvzdLffMwULzONrbrOsVqArF5kHRmBMoAYj77LMpc1FsbLjh8
	rFvMNIPWzrCEtnOJaMZs/ZxBEn2PO5+L+beBgFOSNt3+3I7VNBuulFBrV3id5vOM
	pkzIhYGoYQ7aNwewI7FoXzhkXw6XSeDxF7w+9r0Mw4IiGeixzspiVkz8PsCQNpdT
	yqSMo7iogEgAaJY8Ijs93SNqprQhGhTmQVZu7IT66HWgR51tK5Qb6sf3cmeDnr/P
	TZBX7g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf55c3f44aso4737315ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154077; x=1781758877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=;
        b=RTbjXd2zL5tHgQGOE/rTeCmUKNloX4Oe8Y2M6zTiRZGy/Py085BeARIpgS/iWybn30
         mMm/CfIPEs+fnJ19LJJAnUljluenRzwWuG+h45YZ6yxyPSgzRMCi15Pg4NLBQVpB9McY
         5bGA2v+4v8mbSLy7bdILoxngEPYY+jlDmkrp5NTumNYZLFgd6t3Wq7BtHE2FlmpbjRvc
         PzPPsESC/0EfwX6/bfPVHYqKtAO4Dm1iZ4ubPgDI2u1loecH7nZ3Evl0CiFm5da3yO25
         3rZJEkEJ62FZOaVx5WFEsBpM1KYf04GedmN5imegdKAYw0RPZ5qncXZQsae4ZCRl7Szm
         ONNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154077; x=1781758877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=;
        b=YcQ4zTanodMSFiJg+NYDqLZ3jIBkSj040t2Jb6x05NwBeh2VcN6nBQjABlK6NsxYik
         WZ/MYZj4nBsKJi2DaoV+ndsKeJKSQ7rY/pTTFg7gHdH4/xJU92vu2s6ZUwFDPMZsNjdA
         W/OYeuhmf2VySj4UV+oGObA692QyHZh7zLxtmqcfXn3zrnoS42KBGBKq8828YsqlYApZ
         An7seCqjahNTC6H4FIjhVI5KhBQrWmJD5pLNaHYypZJQXYr9PAIpjJdAhUFUhEDbFM3T
         AJfNe1H7O+/Cd4AKt4Oncb92gzSVLqCuH4tS2ERZeWVFBfdKiu7UBox6i34N8FCQPZI0
         j8Ow==
X-Forwarded-Encrypted: i=1; AFNElJ/4glL7fIdw7QS1rD5ppaFgkIH2YH70XYn2XxmWFQLZFI6I0GWgbv4Y9a3MFtAo7F0WHDWAiM1GLoEa@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLn6ancC+O9xpgQWXhtJhckB1J7saAw4xVp50sKqnXcdfmxgu
	pBuP4OXEmN5Wk2aHYGYaJnhu6lC7UCbSxohFEbreGzrEYTIk3CaV5vEBQB7KraX2JL9V12J5GOF
	ImuiTXs0BNxm3YSiaiGjFoLhXComlF3q7AISOLICRb/2dbakgVKOiCedSLeAZpBqK
X-Gm-Gg: Acq92OEr1q3SlhN8aMgz5x5RL6RcPlzAwwOeaA8GHgT6l58OFriE3Oe6gHirj6AePxE
	7NtiYUwVR1ehJoSLFonAp0Fcgy7i8yGp8FKcM1eJ0iDoBot1WdfHvVMxvBudvwh573OWHw5OJZ4
	ysLrwbvFdZMPNOKzBAqQ3FgJjb4YZfcOOcsygp1JHUbWoAPpF9iBnCkPAgrJyfLQUCnJNl7wdOR
	wVfPrsAzV2OhcW0AoQnj15OIKcABgnlh0JVZAfc4d41N6ZwCb3+Atz3YnX1/P14LILbykzwfHBK
	eNitNaZnWgLfokbCzdPV07IpHih5w3seEG4l2vkA+aV9eHzw6Y62Bcglua1UekuWuonQSPUhnql
	dS/azFu1vowVlj3+agmijEPC8idY584mkgCDcnvqT2xpXRqtucruLorY3KlZOADzgpac=
X-Received: by 2002:a17:902:d4cf:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c2f101c3b3mr10049165ad.18.1781154076907;
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c2f101c3b3mr10048905ad.18.1781154076409;
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:12 +0530
Subject: [PATCH v2 36/37] arm64: dts: qcom: kodiak: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-36-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=10020;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nJ22RhsEYu1ZN2/H4/WWZENc1zfrl59Y2SybnlYrC64=;
 b=wC6F6iV3+H8R50Maaa8EbbN2evldAlqQZqzhFZAsaTm8J7NhyUHE7G6Kbe+VX+Pb0DNfB0s2W
 q1IfosYNCRODHTp9LDyHe8sZQ/UaYu1n9tURGnNlRLpJHA7NSCrVE+A
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 0gogfCboxxXGTVpU9dqYLeORiHxTNiZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXz9yyAp4jFGDc
 POLmnlXQWI3jfHP9PxlJ5EJFAs7j541rsWLZgRj7dSkbdnDPHYe01OfK6MeuGPVxMxIzR9SruYD
 i1snhHH9TcUhTXa9rHiH/xoTvHBVkbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX23Xczzh+s+Xs
 RmodJKYUjhfRpBuO4V7kkDeKFhcXwlAXCWxWHlNA5YYkdAhvuvzpXWedtLjU/fzmKAKSD70ZkNP
 hcm3A7vCpthAuslKPCqJd8nOMBaRiS8RRoRpmYBEZrylDnFLVl2gaW1y7KZRxmxeZPTixY//0Wa
 Aq2CF2hc1K0zWSrfBT1av+lrySkNhuOuLaI6gAKKYaYRtoq1J0WcBkdWiSGilKH08NL87BAYu5f
 TBhCZxNpjUWE+OPNh7dAbGhEUZQpu1WZYn7+dYBw4vpkbcFR488mLiztmVYx+wV+9ZjdFNnqOmX
 3m7/HmdnJ0hleZs5jh2ft+CGzlFYnUEypqZCKHJU+OsWV8aSxMei05ACDRwwfmKpnLOMHUKKb19
 fH6OAncX19JPQ8iPojqIpybu8760ITRj/VSeIQYKgZHxDJhGrs3bwGq7B4F0MFwQlDrzf/aiRbw
 bnu5J7aqPWhWSqrTpfA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a411d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JLcStonL50ma0eizzm8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0gogfCboxxXGTVpU9dqYLeORiHxTNiZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per-root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie0_port and
pcie1_port0, and move perst-gpios/wake-gpios from the &pcie0/&pcie1
controller overrides to the respective &pcie0_port/&pcie1_port0 nodes
in the board files, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                     | 10 ++++------
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts    | 15 ++++++++++-----
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts    | 16 ++++++++++------
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   |  4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts             |  4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts   | 14 ++++++++------
 .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi           |  5 ++++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                 |  5 ++++-
 9 files changed, 54 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..52887643e1a4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2286,9 +2286,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc GCC_PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_clkreq_n>;
 			dma-coherent;
@@ -2300,6 +2297,8 @@ pcie0_port: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2416,9 +2415,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -2434,6 +2430,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index b1ad1d7c346a..92023aac967d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -545,15 +545,17 @@ &mdss_dp_out {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -562,8 +564,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -572,6 +572,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 3a9fbef89aff..d0639eea398e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -522,15 +522,17 @@ &lpass_va_macro {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -539,9 +541,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
 
@@ -559,6 +558,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..8e65a63a533f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -49,8 +49,6 @@ st33htpm0: tpm@0 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -75,6 +73,8 @@ &pcie0_phy {
 };
 
 &pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
 	#address-cells = <3>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..3a7998f7ca55 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -824,8 +824,6 @@ &mdss_edp_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -850,6 +848,8 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index e0275430ef82..65687a6aeb6f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -684,9 +684,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -695,6 +692,11 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -703,9 +705,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -732,6 +731,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 681a9ff5ef77..e5c549c794a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -812,9 +812,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -823,6 +820,11 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -831,9 +833,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -842,6 +841,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..9198377c2a8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -472,10 +472,13 @@ &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_clkreq_n>, <&ssd_rst_l>, <&pe_wake_odl>;
 
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&pp3300_ssd>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pm8350c_pwm {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..655192adbd5d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -418,7 +418,6 @@ &lpass_va_macro {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&nvme_3v3_regulator>;
 
@@ -426,6 +425,10 @@ &pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 

-- 
2.34.1

