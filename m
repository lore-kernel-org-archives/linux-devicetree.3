Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA136AB56
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418060; cv=none; b=h+KSYnnX7XTCsGc88vC8mBHTJjRQ17NGI7nwGbVKUCGFPY+XFZ3LehvLTtw8dc8QjHk2N748K16shhz4z3AzRhnfDb762S1FA4rmJGadXan1sIHBiu5e2m+dyfoLk+2LbeHU2V8co7qkuBIjj71926q8vwFBuoNBDyPXFNwKz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418060; c=relaxed/simple;
	bh=EjEZ2emUERpT6JtYoYhY8DbdoiOV6CqX+E2v3CbbYb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUsxUGwCkJD/QSgswocAfpGzlx712dCzYY1lKWh6bkbVkFyUqlV9FB5vnA2Lv2df5LwCj3s0R7Yoa5IdDShiZSWjIGXFoEoph2kVq+D7use00uCnR7slEO/Escpuo9HvnFkw16y55wRkAHmqzW7Il0HC0FznnpYSNM282IOZbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5y4FSok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy/fut3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5y4FSok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy/fut3u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CLfd71855019
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 16:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=; b=c5y4FSokzUQMXTyQ
	3yvGNdHxcbSk3crxWcD6BmflkpmwFNyayOrUB7A3+NuXS5m7wGvh74Xim4qhjRMh
	Ur3oqFYxSAXo0zxYE97xRkkuZC2eElbVf9u34ZRuEUh6ia5XCJ5zehvokLmWheld
	Eu5eaZQ6gI6MuXEpnWKip/mi2gt0HOkGSvzRXG+FP7JGcZc/c9hatg3CkiWLwbmq
	FzB02wnc9xS5eKHzckwglSxRVWgb2phk5hXHGT8BsHcXYuxAVdfmlFmO95rCvJcr
	f3waJBBsEchj7ovNwjVz+/8n6D8XGK+wlYKfuPQmJ/8wH35WuPfoagugKRdjHQdR
	tfCgVw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf7amxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:34:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84235f9b91fso2319663b3a.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418054; x=1781022854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=;
        b=Uy/fut3ufTLXOsxuZTqVnoNR9Uy4G/ByFb0CU9cloHxaoXvtsRANynzbAbTFX3sw+u
         12ASy9wbi/m762zk4g5/6WhRotVdVu5u2ADv1HWde/a0SnFSM4wU5l676npRRURo2x/7
         L5RIGAGfVL546UaPSZMcZmntOLtUNG96jNMEnhcqYf2zg3CzArXZhbMmrcFBuwPZ9v+H
         IUoK2n4tavo1QkZ0m8wpGfynElJtxs/DqQ3sMkhJqyBzld13Q8dqgdv0eSf9mRJEl4LK
         BSXsTYlD/SigaJdjjADfnuexFeacjqdjYazOUFA0MtoOcv8Tx7lWWoRNz97v5osEAJYT
         LDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418054; x=1781022854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=;
        b=n5lEo2xTQqDt+iQWsynbEbqx6l5Z95R03r/vvpAU033WzdXsjRc9YWFAGc4khUplYr
         M9L0xnKOqbUdDdUVoIc0KBm7HLUVHs79+e2fLYjlSzqsq2h9RO4ZkY4kB0wUSDqN/3qg
         qCu8a5nOYlFXlRhdyh4S9jI+rdH+8BiWPbV70Na3deS3KqC7Qeswdw4Uenkbze3XU2ch
         kdNVnhW8kBUKfrYVW0obv1b9DOA3Gmn4FA0BD2cCTo7oINyHWe4eA9/hjjrIYWR1Eat9
         ebKtO68W1QXjoMDCiy8ShkcrGj83l9uQek/t18mSZD9Ul75LTeQFP3LryacTwZqEsu2y
         VDBA==
X-Forwarded-Encrypted: i=1; AFNElJ9pVNaBtKdR6Y/CgAVTq1VS240DwdzXKeh776dFq6Qfo4H+xVupvHdfiyN5I9c94zMQMeUN1wit4YIE@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZieBM1VJyoeIL9fYifVvan93aQBjJSxWdFic2woDfEPx2JMA
	wxf06M8nDHsLgc6D09iD6CfmXvsKr+NCpeUYB4V1C+AT7o/59dZ+h0okBhhEGwLRkkjZ8MOknxN
	arq49bdxim/NZPtiJUcsKyh1kTqrQbWYP9MwJV5uJx6yJcRaa6XCYGmiY3huscEku
X-Gm-Gg: Acq92OFU7raQniGIwR858EEA0uJ2pJPKqPdOn7jvkyET7Shw8rM5wj+51wXpqvhZ5Kd
	8gZptu4tL1KzqpDPMXM+yToDeK8EmQkZsmH4R1iXlhh32PFcEiHXsbsK+32rnLIP4qvhPRwd8it
	kHQ/cHNUjs7/Kt5v2JwUcGSCtfD/wSXp8u3BGmc8ksNt997FMkxDsN5n5x3/BHUyh5kLmNhkfl9
	VSutu2Z9ydDK/vGvMZyEQo7XpkZFi4HmIupNMzNlPeBMsHiq31O06p450k8WPpqgcNjIeBFv6ib
	WnbTvi47WEv6Bn3cxf1qwLWr0CjuwCVhMfL7/OHf2Zw+OYuhDS/S9B+dRI7/p2uS3ofVdn7D6x4
	3xAe4jil2JKGTXdqSEHljwlm6TLG1i1ac+jnqTBokoId31k9j5P792aw55/Sy9JBuKC970kWlBf
	iw30xWp8SsjGp00sWGS4v6x08BluAVA8yYCMtdb00orGiDsAK1bH9l+JAlBLxrIdgi7os=
X-Received: by 2002:a05:6a00:1406:b0:842:5719:455b with SMTP id d2e1a72fcca58-8428302cfdemr288562b3a.42.1780418054352;
        Tue, 02 Jun 2026 09:34:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1406:b0:842:5719:455b with SMTP id d2e1a72fcca58-8428302cfdemr288533b3a.42.1780418053894;
        Tue, 02 Jun 2026 09:34:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 22:04:04 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
In-Reply-To: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1f0607 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=85xu7NCFztRxkIpi9pUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: mv_bl6n2KLVx06JXw9xNjOLKjSbeO1Dg
X-Proofpoint-ORIG-GUID: mv_bl6n2KLVx06JXw9xNjOLKjSbeO1Dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX8UkYWwAvDPG7
 QXKi9coFOFwEwOIbNJ1ELggu2FMWZmPcsSVcaa87CGF6AofDX4CoY7FbNspppeINi5n5YTnr74d
 D8BFv+VR+dN0la//rT+4PwMGzrVwJfnx3UGb7SLD+YZT79HZnzYnFv0oB/yik9hdcDoa2t0QTYJ
 ewP2bmCjm2tfI1/i5q1Hn6c+h0Op2lllBjus1C6ec/XqfFGniACT7TlCSn+l/FKwLUxqK+MPpgy
 S943Qd/34Fo7rjQYIA1s84Iv09c/Jd+CR9GQVUxa+HY9TBvOYbb35hloRxbK+TZspzmlafmcukk
 M4y54IW2BoXEc84hRnp74OwsHwtqyaqJnzg2OCW+VLmi1p5/sB37TqPR6xUVuqFdX4MS5eNLfx0
 d2iUpwoDgbSxFDANw+mBnlMjoFBgLZascnYLb1JDGdbi7vIrJGjaUfj+YUNTl20S+UrC+U2YEbj
 OxKDW9gNV4Nl4Y03xnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020160

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 12 ++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
index 79ec77cfe552..7fcf632e289f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
@@ -36,9 +36,6 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -46,13 +43,15 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-0 = <&pcie1_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -60,6 +59,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio29", "gpio30";
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..bff5e3ea7831 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -704,22 +704,20 @@ pcie1: pcie@18000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_2_M &gcc SLAVE_SNOC_PCIE3_2_M>,
 					<&gcc MASTER_ANOC_PCIE3_2_S &gcc SLAVE_ANOC_PCIE3_2_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -808,22 +806,20 @@ pcie0: pcie@20000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_1_M &gcc SLAVE_SNOC_PCIE3_1_M>,
 					<&gcc MASTER_ANOC_PCIE3_1_S &gcc SLAVE_ANOC_PCIE3_1_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 	};

-- 
2.34.1

