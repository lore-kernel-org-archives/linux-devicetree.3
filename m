Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7F36657B
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195717; cv=none; b=YpTYtFoYso2hpdl6l9zN91Z3G7HGwztDINXTEc+YH7KIICrRye9/U6KiF8ttpzUrmdjFKyCOR8ar6cfqwXB84lIM/NJTu8DEv/HEhR8sOieEY+YRf/aoRxWOhg+YMJfn/FEWr4wda51IMZGUaM+SbNX/lzwiTGWOUCywqtV56YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195717; c=relaxed/simple;
	bh=Jn/7kW+TtTWyzFJd33pnOfItUBbGG3+oelgBm4l2OS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZ1EsErCY5MPv4X15ZN2oWheaG5KC/7xUktydsONWlKLpGLLqXWJzRUpvP5fpsLzjC9wA6Y+ll4bU3B/orMJEXQBoE2x+5lNd6u5ZVORlKPPDNxtWRX4EuTkUC0+sZwJRP6LZVwooanS5SUilE/XszZtvYahF3RAw8vFJi/fFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3Psc8Hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLt479E6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3Psc8Hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLt479E6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MFQTmN1406099
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=; b=h3Psc8HqdDGmeXw5
	XHCYKBTIoSgBOg7qRdSXWGRoDz1wA7hlla04/dT/TvmNQidRm7k9GoQVktuq949O
	2vXwf21m9ZPPooqmMd/B4obeW87zOWMu9kZyK0+wjP9ub4/VNPmybn72nsRbp4Cu
	t6wzu57PiCxZy34hOUp4Mqm6b+pFT8pe0wpUgi5Imbmu2HjPOXemw09jolwj9Y0O
	jS+nhrHMUhK43wFIiCepdMSEniC/KksPsj16j0i7Sb/2Z9G4XvJHnVR633bN4c3r
	MEVkaRflpQBWMCY8Zpqzi8y45qzJLJy9P2b2d983oapiHzW+NPv+Du3oinLQEIXV
	oHhv9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cth24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b469e5543so13723691cf.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195714; x=1774800514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=;
        b=RLt479E6S225fjQWmRxsfuc13GzJNWfumhv7EuLaCRrGmc6FfNj4sCDYkH6fhsroOM
         WAOXwzbrnWG327HHFnnwZ4c9yRXif/V+PynDy4DBrqo8beYyCrqgyPph4p8Jula/dTt7
         tB4cv7ZmZ2j8OG3HK4w7UrTA67R5EVkrahtFJsS/ZmtjkIPecW1CP+6XMyaVnAbkOxhL
         yf5/PFXAZKVH+6VfUWlVvKbIu4j58eYmkpO7COftqRLBHP981JvTRA0dGhcK5HfdiVwF
         WWMjNdDTz1bpVELIEYtySOYi8Q1uWlF5Ka240LZhQqd0yZZDDevv/2EPDUH9bW4g5whr
         nSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195714; x=1774800514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6h4OnlrvZRfWeNvG2MAwP3BOgMWsgBjR7/TL6GoA5o=;
        b=HHBnTFF1HhLyUOrkWLGXDT2LK7kWCxQUfJZEF2Sg5iSpBWDtP0h+BDPO0FvVIVjuDi
         mtyKPwl1UVrsPmwXGSeouEel4heBl7JwowRf5QIptl3gaqGRHXoORn/dqg5BYakZoIbS
         co1JXmJf54Np/zR4AGPlsV6+DZH/4Odv7/GH4vRNH3JhsCv3yFCOSa7h+1eKlwZ7EYV2
         T0ChoaUjFmGakGYSYwbpm2/B9YO6NPTnMKNWOch0L2Ni1035cYcayjuM3PUam2keeiF4
         4Q4e3a5RKEGMaiaKETgHu+7lpwrtJT71IJ56zCdFp7FOdGLW658+a2Afiwi7zXRGe5fp
         wJDw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Lj+NxW7zmbCP2tlJMyDbau6HYC0V/+EdMr1/cDCc7lX3PRTn5D43JTuJg8IvF3KH8pdJ7BRz2eXL@vger.kernel.org
X-Gm-Message-State: AOJu0YyThs/vBctfjNJ8JFO84ys1TDK9rUBuZ1iCyV/3fkpxRVGdXnZD
	H4wCSudjtcois8Okpvb6BFR5rrWxjciwej8Tfrseuy85C2ARdOZe08RRXuMbyDiCi2zsCZNjtwx
	DEWnfF6s5T2c+6w0lCixqtaxnzb5JYR88deXaXy7tUqEEM8dEgIeKbiB9ue6lujUlDHwVSATF
X-Gm-Gg: ATEYQzwwhP5cTavUXi5qD4G328LgnpvbrLR181MjlGZbn16odFkJ0eAKCZDqugj1Oj7
	Y4+Tc1QEk8M+nuE9nk+c3Za+xpVlcAA8aTfGS7f4uh2wysTBOXBqVjTuQqwsx54RNjKZtRGpVV2
	0LLqytt8X+tUya69C34ijY5of6/l/zPsBeMP9AbzF8O7hw5FKNLd5c8koUpgEGsRO/ZBpdbDvQG
	nxODXaICMNtGbgtIBVUJmZQtOYU53daUt6mqcytIxwNo8U2IGDRyxn4Axj6NOxnOJX6oogUWX+3
	8CahR3NG5zezIspOc0yoUKXYsQowJMPfBWtlm3D5eKcM/bzHEs6jVC4HKoPdaeo2TUJLXfofIjJ
	A64JqyzQ/WuSg48d0BTnQQD3Tcpo=
X-Received: by 2002:ac8:5893:0:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b3743b32dmr151308781cf.20.1774195713838;
        Sun, 22 Mar 2026 09:08:33 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b3743b32dmr151308221cf.20.1774195713249;
        Sun, 22 Mar 2026 09:08:33 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:19 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jn/7kW+TtTWyzFJd33pnOfItUBbGG3+oelgBm4l2OS0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP5mK8fQ/AWmspi7gaqDC3OQxfjaDhMx+W7L
 d1SoNCgLE+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT+QAKCRAbX0TJAJUV
 Vt4GD/49JKSufspCV7U341xtQxHLue4hXlHe0uitvEo35ndPm0+X+LJKXORMYWtkNjMPyNW7cJL
 RnDB6n2FRrk3J1jIhiUoKrV+Iwf63EdGV7Idp6SDlRlBr6/Xq38ClM4dDkzWdIIZqRb6nMH1ElF
 01j7jG9ZjdMotmAhKXRkn1bAhM+TLj/pL1iqfIickF6hBTnLe5+KL7bASBgFVA3D3AlwssQPnPf
 fqSqIRVbkuTahkpIvSe62Dnep6roVl7vyBzg0hlnDvxT34PAvF3TX3X0ryeR2O4GhkzyBhh3CoY
 HSPnIMMPbgL8PZM0MQOwR3nnuTCxkA5ZDwQ/b1Zr3hcT4JuqMs8PurdYBiysmX9AHs6GJmzuEDo
 sN4puG5VxKKsYyqbBGbp6YM3GGeO9nrnX4LyXqr8vJ45VI3Rd/ifkF+T729b4Drra4RXm/zARQK
 R8fUu7rOglSyu2Vap2GuzYhMkJkJTGkTsIgpe87ynfKWSBWvX643DX+jlw4n7c8DELGqjLjXJ3c
 3KZEj/+qTnCN3Ix2JPXqBvBSL9SaUIuLQLkGgICIkjTR1tXp+OYncVRooatpRrNagCgwXmnF9qb
 OzF4iEDryRpy7k4BNuWjMM9pzCn5zGyfuAyY2YbV78IzrqS71xcb+1dbGpzzHsAMBdCRtzOijQD
 JGix93wrkPHwKsw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: nR85PIp699Adq9k_FvwGMZq5vIUc7Y7H
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c01403 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jx7dCe-4cp8LvEwUiLcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfXwqy9Un3hOnSi
 KNe10d1y4z1nPpF0Ps3EuuF75OjTEnKo3UG17V9cQSbYbfQh2xb0/qlqzCN0NBqDC0uA3h3R7n+
 hD8/C2QZtgqNEZTAORBlja/B+vqwqn5LLjeNC6beZQnJaX4pJwxVT8WSVaBHKHvXh7dXy5lWh3n
 qB+gANDcCWkKmPE9N9Ax0IpcGx/sKdtGGsJ0v6dmJNXUUNs/hfM8amdj+tDt66CLvA508qcTXH4
 boOXCHLvq+IltGwS1gQ25YpNuSUtTi+z3jyLOT3oOrKfvf+OMTpW0Aj9/N+uN+CjhknvMmga6/q
 6ziPJsRdqCDk8aXQADFq/GcmsjN4Ynm/KV+KA3pi85uD1g77O1boGYRKIXWxpTY1L+3R1F/7KH9
 veXSx4zRg4g1RME+mFuK1o5iELahwb75yUsAy41ufVFp83J+oMlJyHcU0Ulvg3N/xX2282Lxfgb
 Q7Qc94AcrocOwjBtZGg==
X-Proofpoint-ORIG-GUID: nR85PIp699Adq9k_FvwGMZq5vIUc7Y7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141

Some coding style issues were raised during review but the devicetree
was merged meanwhile. Address them here.

These changes are non-functional.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 190f10a77d74..5dc3aede6842 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -686,7 +686,7 @@ pcie_noc: interconnect@16c0000 {
 			reg = <0x0 0x016c0000 0x0 0x11400>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
-				<&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
 			#interconnect-cells = <2>;
 		};
 
@@ -722,7 +722,6 @@ ufs_mem_phy: phy@1d80000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
 				 <&tcsr TCSR_UFS_CLKREF_EN>;
-
 			clock-names = "ref",
 				      "ref_aux",
 				      "qref";
@@ -912,10 +911,12 @@ pdc: interrupt-controller@b220000 {
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";
-			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x400000>,
-			      <0 0x0c440000 0 0x80000>;
-			reg-names = "core", "chnls", "obsrvr";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr";
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
@@ -925,9 +926,10 @@ spmi: arbiter@c400000 {
 			ranges;
 
 			spmi_bus0: spmi@c42d000 {
-				reg = <0 0x0c42d000 0 0x4000>,
-				      <0 0x0c4c0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c42d000 0x0 0x4000>,
+				      <0x0 0x0c4c0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -939,9 +941,10 @@ spmi_bus0: spmi@c42d000 {
 			};
 
 			spmi_bus1: spmi@c432000 {
-				reg = <0 0x0c432000 0 0x4000>,
-				      <0 0x0c4d0000 0 0x10000>;
-				reg-names = "cnfg", "intr";
+				reg = <0x0 0x0c432000 0x0 0x4000>,
+				      <0x0 0x0c4d0000 0x0 0x10000>;
+				reg-names = "cnfg",
+					    "intr";
 
 				interrupt-names = "periph_irq";
 				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

