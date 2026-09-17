Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E914E2F25
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647981; cv=none; b=OTGlWMZsHKqYuVaTdm5phncYvuUBZrfNsMjC/8Kgk7MeuvzJ5S6MLVxHp7edbjpmJ7piEYmO/7U2pu2RlQPsrI4UJuVvyWAMxVzKdaYAKsp6B09m/Csr7ji8aEPUVxOs8ZJyRGQkimlkSVkvPsKDx2Nlvo42JNlRONaINR71BaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647981; c=relaxed/simple;
	bh=Amj6aNOUQOMt2PsDq7bY3ArIqeV4Jv+WmJhIu0bjQSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qd8uLeqe/Py+/1wn/qg6FwB5SNnZU3Su4s27sTaedPKkVL51eljzjiq5IXTpb1CIXoH/e/73YL2/IxycpihoSlVG9rQQ2h6vjrZm/yCtzjs+nKMTAug9TlOxcRr+5MeOtsQY4g3qQEbvwkBI+ibwONv+Sbrzd8SR2qwBfrujbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3mj+mWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqkYfe/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3mj+mWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqkYfe/H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsS84186761
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=; b=C3mj+mWulfKdulcR
	C2J/p+5xCwZHTdzPxduDl3kdEjxLuxQKhSkpl2+w8PVxQ+1X4UO+fzpkN3+vR5IT
	KF6nppmkC1ZAeYsv8GINZ2Whc1ht/HIUqf59Kbb7PeSKXxraLLQ5EhPIToJZWO34
	rW7rKo3coZY+yuaXVRT3ecNqTCV/Yc9W7gVKK+wkwsnhGPfoJsnKfW7WDdof8aii
	o6AVofmRKfe41lLlv1wZ3pCBK2YyT/r0T9o163kyAmhxBdgr6MOgTBf6ODks5hyl
	YipsK0yA5ufI1vpXXu2mZ9HEdm/3oCEw15rjeNr1jIL6kggbroQCOJbh0TkMhSlV
	b6XZ1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca5b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1119309a12.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647961; x=1790252761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=;
        b=HqkYfe/HXEqQbI8gJI9Xmc4lxpLmwW/qQxJTt0Rri/MwcXsG4atV9cMPYB859nl4aj
         DJDl25gKd6lM8sHlGm/kMHU61qaikBllwWVHVX7gwIJn2Mj5RWD2C6oZHByZF7QW/XBR
         R9II2uMV3amsiP0wy0HGCp/nZlhsd32tnQjzVpEPeG5j1QDQglx5vRtcTjNZNIOS8GWg
         XSfs6Evwmc9fbNFRRJXHEU0OqmlgqCYpfbB+0Ze8rWWRg64Vud3eIXDiiTxH/ys9LEpY
         9aoorBUljvimR1D+GgOBx8o8mBCATEl8gU+0l9IbRWKvrFsZolSPdSHjU+xKi4Eg8UFI
         1l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647961; x=1790252761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asU847c5DnY2iWgPtCh0aBJyk947LRrDRZ6x/iOy5A0=;
        b=uBzrOMjs89NsVLaLNTn5OFi2JVwGlAV9tN74M90aSgmW+2UNSZD/htbguE9dKHvJFe
         tvAse0HsoBIl5iR+/rBHlS96nIyw00ZMgABqMDQ/FZ+FAj8krNuHjTibZrVZn6pKs31W
         rYF6695a/rMolsG+9ZBMAMV5VUDEoW3qxIch9aFnFtHDkKADl18Zajl5XUdrakV+/Tq2
         FnJEkLV+YoxNO5rWG58gmr+tVhCSvscL/GB2lpb8D3LE9a/D2Eil4+SX9PY+4RjPBK9K
         3Cl0rOjS5VV9FoXINIx7jRK7MYTlialtzUI9KhikrbTY4QcpDt35g6SCHdpsdKfFGB2N
         UFvA==
X-Forwarded-Encrypted: i=1; AKwUvBxo6qaQXWxjO7fVYEOS4DvQNDwhneL/Pq0qZ+otX7C/i0040VeKGAkmLWm7/fZdCVCLHEb/fD1iBRJw@vger.kernel.org
X-Gm-Message-State: AFuF++kZeI/3AJQL4QF/6gqfdC7IhWhDkqgFgM7bAegtBX+J7CgE27PM
	qkfYlPP9xWQnNIBAEyYdYc/5qNDT2YSFpV/GBM7WOzh8eQvR2I34E9gvA+AT7dcRPEDDQI3r2+p
	XSJz6kmxkSGibGnEwsiEGCslPGXdheiwdfWJ7P9jCX0qkAAbvrUKcjjgzLkleblxM
X-Gm-Gg: AYBFou1DUmEkNcVWXD7kC7bm7Najx4l/+36xH9iBVm82T8ll1zHRghQSmLVh1hzrKgi
	VdueuBcQ0kH0+fpW/HLHWg3xrvr6cEqnh1xTx5krnDueQgIFV3y/JpjXfJt7F41thRs0rlQC7AV
	dAv2OvakM9i8C/ZnlPUFnOBsfO4lxMLVxracup4l9rsaDn/HEQgvUgNz/I9RfUvIC+Zl8P8h7v6
	KEigXGuqbxxCEhMBS7xSxwp5YGbBY1Lei/3U7PSIeL9jd88nmOBqHa/Sjhork91QHWDCky+u4Ih
	TMgUoClcpMiPkLCM3aDBiCNsOnXYd3Kjr3ozZoYslZKFP+py/oASMlfOUFQ+ltNEtEa5HCAP8Wp
	jpxex1IqyJz4qlw/A3i+XA/YdsmHzGhIjMFg=
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3dd5f405d6cmr15213512637.7.1789647960700;
        Thu, 17 Sep 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3dd5f405d6cmr15213447637.7.1789647960089;
        Thu, 17 Sep 2026 05:26:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:21 +0530
Subject: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Amj6aNOUQOMt2PsDq7bY3ArIqeV4Jv+WmJhIu0bjQSo=;
 b=SsfcGurVhQ2++NCRup7+VRrZzoT1bYUDFCnEceoW+VFkcwnP0tcCx8YGIwF7ezfxXzWuVt3YK
 SQ3lqVBUcl6Cv9K0Iw7Sqn96LoKPQ7JheQZZMrAjryZYe3GJQc1R7P4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX7dqe4wpk0iLB
 1V2B9izDPZ75g9RoOWdSWYg9ov93QIOohb2xI1y9RV1bXsG6OlrsnyYqOwwJwtsqSMkoYEkNcou
 MlAayHiQOQoPeMNhJji5PnFqQC1j51BxppFh7WdFtBmbPH8Mo63R3KY3acmW/51/ra6qIPBYRx5
 6TqjxMeZFqfswe1DdBLlp8vTyv/uYUuSX5hBAUOeKA+sBsa5y9Huey7+Ql8pkbAN9GipZ1sz6k2
 NEBDEFhdTR2Edr0UQ6yj5vvvbSmn4W1GYI9cJeeft9oyr8+iYzyb/qqU7jGZiEUNKmZzAN1djjP
 OIFsUeZlLDLi5kGI3h5cleIdSUgZbFxP0YhX52gIG7gMpdVnKeutOnGQU52bc1QvSw4XygEvsKe
 UFoK4lcx3tf2V9+3GNJdzkCufKEIO+4suOmRsTR6YDHBpea3xk7X352InJFd3cBxf047j7lRFTc
 veNj1SsU0/jPsHdWjkg==
X-Proofpoint-GUID: hiDpMl06oeVGlkgHFmk-zClF8FP7sQq4
X-Proofpoint-ORIG-GUID: hiDpMl06oeVGlkgHFmk-zClF8FP7sQq4
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabdc59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXzDmyolUfX/YY
 0MEa/3pF77YxlVywLZofvTt5EhKy0gIayZCa1aE46hWQRLQwdu9BDaktxLvkHwAz4LgY0G/oHBT
 GrYfp3I8chX7UEpQKzQwv7NXd8PCIKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 74df5cd86f04..50fd00bc9f3e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,12 +1901,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
@@ -1917,6 +1911,10 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -2035,6 +2029,9 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

