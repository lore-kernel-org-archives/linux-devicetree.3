Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082684D37A2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646156; cv=none; b=oUWIIpT/DvznuQUKKsdr7q5cZlh1PvCH7691y0UHnjku2BPxC2ri9s0UXALosqT5SAFBfZ+eUmXd6DZlCU07OcaC7cbX+Mi4KHwF5nnjz7TcR8KGxA11pw4jfweJKK559U7MdBI6TuIDVxoS+pVo1CPgyc9/f7IvcmwHddHw7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646156; c=relaxed/simple;
	bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCMF1217rwZIDFIGrDgG496mn7TnDgIaeuNr/+BVQO9eVkCJeobAAxGMUoRGFVG2TEZk3yjkN7bMLVKMpVn/9Vjnb/rpGmzoeB8wOrpT6tL6p9qY2DzYrDQggKD4r+KgULbJMv1SmH1QvWHuyShAKwZYBjNdFDeJTLNjcCnWC9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS7cTf5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyHVlEeF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS7cTf5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyHVlEeF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrwC1863444
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=; b=CS7cTf5qs8kyy2aS
	c+yFBZTEJGNJ1eIZbIe3mpKwD97gIo2rWzC8JzXce98fHHnS6pH/lO4Jlwq0VRun
	LAIMhhq0BtGxQCrxxMCaJSmg9UsWIO2TlzQA1JrEEKttHkc5cZ9shIPV6TCK2Scy
	bQellJUrvjga06V6xl///nkz4caAPIIjSoIpwGQJFAcR7Nu5Jh3JqTHhwYJdFZ+u
	N1wF7ldUmnmYqxLA1YQRsuilMXhJdpjHK6G2cBwxNvIWI30ORoxgh7k4Th3Or0Tl
	0oIyAx6vuIBXkQ0nG6USeoY2wxEmcB39+El/lnz5OGIyycWjBJKS+bFciTSK3UEG
	FzB6mA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av2vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso15298735ad.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646139; x=1790250939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=dyHVlEeFpFjzgFO6G5dHJowJwlzVYQHE+8UMjHgUj7n04OKlcjMyntEdapUabwBEns
         sTrAcTgFoepOpL/KNzV+T5jyYSeor/7QnfdCC6w9UlzqaK3v64ifvMcFUQcHRZby9vNz
         HeOle4530gURG0OijmmKkr6EZF8ZczOi8N76DAkX+IInetCYCumIuK+9ulyTuMOHCafg
         rmfR0ka5zwD1G9UK2Ul4z2ByiEzuo0uVdJnK8nIEK4BeXOLnuRiWehc1L876Dw/h8SUB
         szciPKmac6D4H6IGt4d8eXhDk/NbFrmUKybZU0fuX6olVR7YKe79Kqc5QVgaiR2CDnAY
         sNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646139; x=1790250939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=jABjXTfD4ZI0lieVxFgasLbW8gaTWflMm7dGcosyLqb0PfJN8Pju9Ont4bJTLQVmdw
         HHie1XtwCC2pBi91uHOrAUdTmfgzZ+wnt1RXcboaYKagnqG4u5Y0+0+8bMqJuwrFQ2Ik
         Tp6ZnOHpwWAboPh6qQCGuFn12Ffs442wp7egZniItWVwnCHR/F2GRYgAo1I7bF3TaU0G
         TaYTc1toJyEraXknpLPNyIkJx1mYTJj5Wb/O3zhaVM4s4II4JVHW6/3weoAqgyUcDC0Y
         LQ7iF1uTyGPhyv/FemJ2NZfhiRBr2f+CbvrA53KJ1IFGnrITlldzgcf8b8zRtH7oBhEP
         934Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQFQjZG9PCF32UFzmqfqQpy23buBJ8zxRIznMTWGkGkFrN6F6E262t7Hbv6s9qWKfr1GLsAxewXMG+@vger.kernel.org
X-Gm-Message-State: AFuF++lo5KoleKmnLUw6jOFnhP1awg7S4Q6EqhyF/ZFKAnuhWN0sB9Ib
	c+KEqkHQI6rqunESXfABfIhgUd9nY3BhmET4YzglZWkyDq31oEvnB3uh9T8aFU6uy4zzvJm39xc
	pSjJOeXLnfdlEgFBfA64xUXti1PynL/dTLKqOjk1eBO0MQajJy9PeQhSehGYfITP3
X-Gm-Gg: AYBFou25GGQCyD8vD8bpaJ3k91SXJwla6r5fJ0CZ52L/PS6LE4t+eBAB5S4VuwxUebJ
	DrDtBAz8RNLPUyqygOaC/jiyULZ/7dIQZxmKX5PC2QsggH10NhC+x2liA5TyqJy8zXlkUMY0U7E
	WiYRX6AfT6f9p0fuQAzzxC/e6DtuMmBUJLD3qwNbc+Ms/4VlrBhYmiFGf6nIA5rzI08Bk3Zw0x3
	6CHH+FvDbSjxKb6okkd4aTkeOjLQIVO+A1gk0pHXpQJPSJJRQV+sRiIJ1QasFOChZkqaLNnmW65
	mq/quM9l2EzuOtEp/2T9QkS34VI8Y3hC0Sg4nFwz1UzQvC1H1ifa6M7ee+D5XPXzjTGiCdFpYWO
	5b58iNyyzZApsrMLUhXOd4vfLed1QSQ8KWg==
X-Received: by 2002:a17:903:2443:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd8e40f0a3mr133804495ad.10.1789646137433;
        Thu, 17 Sep 2026 04:55:37 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd8e40f0a3mr133802615ad.10.1789646135551;
        Thu, 17 Sep 2026 04:55:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:23 +0530
Subject: [PATCH v2 15/18] arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-15-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
 b=reCAW2SHxN9n3dqYnoGgvyOOeS8l6CT+sj8tP2iIVDgGcBMMEr1Nl4HcXYZiZPj8VC5ArgXQR
 Fm4uwSkaTuuDnzP/fNOY8kqSuIZ8sHPrjICoY2k9TwmHmHaWRJrG3wE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 3kqPN-7zTj8zA2LYhpVLBeC_jNJ-HHdh
X-Proofpoint-ORIG-GUID: 3kqPN-7zTj8zA2LYhpVLBeC_jNJ-HHdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/jJt5Edt2KmW
 eF0TdarbEEqDl6ZZUWJ5rOxZ2yItfmt+jx/lmqQFRgQwcHB12D4A8ksxnJfvKGxT/Yj9q+RQkQ8
 4ywODrPZRhhZnOl+SmutfXhiv6cjDx6qXWi3OqvkHEANLpAU9gsKWANRc3i/wX5kNz2pFm8Gd1C
 vR5DHXzmP+uWUFaXzDPg7LxG155y1/6ppbLnq7UqfnRST9zeyOwcs0y55XVEgSI1rqxmwbQuoF9
 +MVVhJld4YwWCcMesrdUzVEFiK4kcQg+0vHrsc7uM64XWRNW6LE/veVqqDLSe11rub+ii6kCeBL
 QlQDHht7HoNnxmI3tM+W0hArOrXTi3OYd16l4LoGBPIEOh+lck2QGd/mnAR0CCiwTKiqwMdeqUl
 L51MWGDe12ubC+rJkVpe0m1Us1IRKDY0jcK4IkbeJaI2F/dF694tBN3WcVCCHTrDXptu9aJY9yn
 zMfpXRPVW11ZyhmNKrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX4k/QleQn3WIO
 bXEg92YPFYATZd9WBZbVogREoAifMAdUw1VPukAUOwnOtnRHKGGexiG0alUUbWSQ2QsV8MNuGDF
 sg6MecGT8tVEFT/AG9PHiIHN74+PVJI=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabd53c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..194e114a12a0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -840,7 +840,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -857,7 +857,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..3ecf3d464dd7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -962,7 +962,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -972,7 +972,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

