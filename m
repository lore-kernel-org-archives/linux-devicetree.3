Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE4395254
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154081; cv=none; b=i7sygUGcGbrP4ol4JemkIds+G4BVGDeBtCdm0W+9bxku3PEqQOeOYYpiVYkwoYMij2bm/qpoM8Ao6WnXp/f037oS8jxezmlU19+3OFrCdyA9tf0RX2DjCNpDF8SvNQaggrTUwcHu3oJbv5Ji/lydD5lYBiDYotBQJ9aW6vM4Zno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154081; c=relaxed/simple;
	bh=e53PVnIsiLOc09/gmq/7tWbCF/q53MrOPjxF7RcAI5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwl5axMX5Lrioe2Rb6R6TWDH2imFUcdvGfewB+HSEYpV9yL2NgnYP3BqzDu0i/+rr5FULQQ2l9x+GPaQ57KByOwci/dQ6XQLQKVKLgu1ZpL+3HXy1PAcekHI1FH5dlMo9o//VYQn7ianxt9vY9t2K4bOupJ2DivDuzUQHJw5cIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qdsvu00M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGS7bTW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qdsvu00M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGS7bTW0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0OGi01615708
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=; b=Qdsvu00Mu5NhgT0T
	8xOmeDa5Vko5EQCJJicLalN0vOe+SofEYGLaPQ8G0gWeebtNiPl4EV6XFEkAq/tG
	dL112RavU5fbBVDJiICOC9Z9x1s/rZBZMjyEzVSxSGj7+1b1BCXvFZroUM+e+AZ7
	CvfqgOMRvQKMKqQNI5uNypmA8NNx3bJbtz2grbfuV/SdGicBjz8FHFgQLttGzJ/5
	BJ1zmIfOj5lyzW28Zd7A2NN65c+LIi8DPq//wzWUNxMADzJzowEyYRjJYRND8lLX
	jKVDahV5YWnj8OPA9ncW+eObDW4pPmGOcQYyaLD9MkCZ10njTJO9WW9vgnRH8tp5
	3i5j9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hng6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo36788325ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154069; x=1781758869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=;
        b=jGS7bTW0xBQpNz4CCre1DQX0UaOuWNEukClVzSH6XLjMY3G1IF4te68QurY8m1I7YL
         aR+s8JHCzkvRqAARwJE18BH1iOVAW5NE/TC1ggWRMxhxXvigrTDMTgDZehF2JsWK9Q68
         IWev63Ffr0ziGXy6ZEcNGEbNGftrKSOh0m6VNTuJFkBMHSrKG3Ic1/DAFS8C7vbhunQ1
         BJUkty0D8bEflZFWx+Ze8b6QUykxagCni5BjAXJuuPfzUvef4WsKi8laZ1+CtcYyXcTm
         uDeaKgVr+8LDIjyEXxbHWm8H/iSGWlEe7EB9nzYfCO4PiSx6JDndo8U4Gr2xDEIA0n+Z
         Q4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154069; x=1781758869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=;
        b=o+ea4s18q4dD4xPwuiTSglGjf0W5PxnvSNQvn2gaG+jz2ulG8H7gTHzE11u/mpQWOO
         /I8ce2d+HLCyE5f5Y9pYpyrN/p/ONYdUtZoT8Z5LlHJO9rJ1t3nMyuDRqQOQmyTU7sd0
         x2mf4TKdNYMN6kuQAaxdJu4rBKpJCT2Bon4e5oDg2D5JgubpCXYQNqwhlT1bEqLwi+qM
         7Ay0x+wob8pLlOWZxy4XVBM827rxbJvB4iZNK2QM8SY+caHbV9LV8Nqy7p8mIkmq4/IZ
         QZW6DXfZlJdhQ297c/q8rezZ4mtEVez2YkIhHZE8YTOenxKKxxReSl1+4kU2WofC2yaV
         pfUg==
X-Forwarded-Encrypted: i=1; AFNElJ8rAcZ1P97dbFrUcDV/cwhdbX8y/xqXNjrWOhDYIGq/2PgUdLiYOnbzurL1ZIVh5owK3iPK+XtIPgPL@vger.kernel.org
X-Gm-Message-State: AOJu0YxOsxiDP/ymJxbfVfNqnLdkqNAMz2IjxN+iRGBLWJOYXMK0xJbB
	hKscYa3AmYLlc5wnLU5WYnU0Pf0KbK3R6uURFyJ8t6CJPuxrqWkkRxAY52wGoZI4yTT/VnnYFGr
	pNN0t/P+c1xajcNCVgWXYCnC816zs1EtlXtiqG+4d0d9Y1Gm4EiFEpYBe7toMb+O469ceCaUy
X-Gm-Gg: Acq92OEKRPQIBnrzniLwToNqvV512j0HbKYHJ4TnYnglYqFlyov0emX+RWQkXGHuEt9
	3t5zyu3+fKDOKc5ft+0IdjwEfo25kRQjxhIdoxYhL6c7FHMzqDk5WvXsH49uSz9ZKp5sbbnoWRr
	nG1MWHcmwViTnOIEMY2mtOm/qPPqCZtAyRFsGMxkI86CyrIsu+XKNdFc/25Ov9h2S/8PK64tN3J
	3KjEOjZ9INTPDDCuIa2/QGEXvGZ87ScygGn+qf/TJ3XK4eZH8pFacdH5TT+PwUaI2SmHPfnaaz8
	Z9bAQC8cyf0MDRTjCwSn8tWs8IYGeV84dNlZBlEk+9ZHHrWp/inIQ6uUnYQeq+uz6/bWymFimy+
	Jj1O7LUyYasIon5mUe83kAgX+ng7dnJvebz5mxtMRzUjfdyEBG4wBjADe311IFHIfM68=
X-Received: by 2002:a17:903:124d:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c2f278fbe0mr12309685ad.12.1781154069091;
        Wed, 10 Jun 2026 22:01:09 -0700 (PDT)
X-Received: by 2002:a17:903:124d:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c2f278fbe0mr12309295ad.12.1781154068589;
        Wed, 10 Jun 2026 22:01:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:10 +0530
Subject: [PATCH v2 34/37] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-34-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=2736;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=e53PVnIsiLOc09/gmq/7tWbCF/q53MrOPjxF7RcAI5Q=;
 b=HcP5OU2IGal8udyJP/M16TVSaEBeKILqIqLf1hLmIihpKWyDvw8+s5TNbad+VRlY6WjwtgB73
 bnjjWBeKFQ4AuuZdRrxSMtoD8HWK7gbEDxY19IqzWcKdbIiEGbFE8ht
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: c5mRQi4t5zXSEN7vhTqqFmyyuAGMHErk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxMfzpE67dtOj
 IVw4cCllNptB/ZMlghA0/7G5RxrWR2/t3wBGzzIYwZq6JH/3OvFO3YEFcAdniiMibGcH0NMCqh7
 c0HtD3Z2wZyPIemBXU0uPzovTbuyq2ZDlXDsyItGcTxpGjwMqEiNJgEXeS+OeWtEnxG2SMohyet
 Bha/DxmbAuyaNPWXKworUZM58f6Pxtw7IWehRPJs8L2I1pnFzxBzldKNTwrSxoMqJWTLA0UoTju
 FC16GsGFExLsq6rwNKo6t2rPXno+FvGbjimAbWUVLOqpSHB7FzYKOhV/HdHykUdLoYcZDRTQtIL
 52wuLRmauqYKHsPk3bq4KNWaSyR0LyUiBjnDl6Nh3NppDESL4GFrDtgphyHA9Nre/CB7obW73vd
 XoHTU0gkFeaqxjSHkiABV37VEOJ7ZvoTD3ISDEl8UFMbLLBqwe9R65L5Sol8ncO84XFFIVfNs5Z
 zXNjR7pokS0MgDVkyMQ==
X-Proofpoint-GUID: c5mRQi4t5zXSEN7vhTqqFmyyuAGMHErk
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a4115 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX11hD0rvUTzhN
 fL+GNde4nHx46CtYVR1umyUA2M582OVvQFqoP6tUTNG1dCt/Vs23LBusHD3Kptu/9t+aDCc6IX7
 rFFO6+Uz/GaUKSP1xKbzNG8fFbYvreM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 8 +++++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 8 +++++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 5 ++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index d89548a2a3f1..94a6849566f8 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,15 +444,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 6eca3791e2b9..619880b0ddc6 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -358,15 +358,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..6f5f468ca4d6 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1371,6 +1368,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
 			};
 		};
 

-- 
2.34.1

