Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB66499F09
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046996; cv=none; b=YCzpSAiwTx1tW/R9vPeKQI4FiRROkaf8jURplPjhlE60PCw5mTg5BkwL3RoJlT4o+R8/L9aio+DHSz4b4HHBRo9R4J5pos+HZo3ggHvb2KB442JQTT5yQim7G8Z5OlOFVRpniXh+J48yBAMEqJf0ZpIsqExyoGe5BJ+FIdewhuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046996; c=relaxed/simple;
	bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F55mMwGYl+PHUWqRcyF7sQoty9QH56FqkqpwtEaUSOTGj9ALfdAuxoE6dEQ5Kse7uXCeOJrPuueH2XxDXvkcvs+IiS9s4WD4+tlcyDU995q6hujpC/MpkzOfSBP+pjVVp7BYpZ//aiS4evm1Gmk9FJSOUdHkdrrCZu42QHEo/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM2GHJJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hmwlf++k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2GHJJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hmwlf++k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ibj780825
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=; b=hM2GHJJ7m2zXjgET
	lJ8/Wjgi3xwiE6lm9LYvk4ifITlzfnqWykzDIiABteRF6tbNEWFKzGx61bl1wDcL
	1ntp2O1aiKFFKt3xv2OmDHHgbTKf3w3Qxh/HHPhq1QypWIyy8rM9ZopsKcMtTxzn
	iOXR3KNnmKncBjQPi+fxQqzEk4JTVQzi5/5zczCEjnxhUi92fOYblaaPEcrrmM/6
	PGVYJW/z9W5fyWbKIlw7mW3OU3SgB9Pys6nZs/cm1nj2jcaMteJWLS24iCTxVe3v
	lGV/ou+04v9QEyOrpl/omJirvQ6bB/P4Ln32z1KmZ/05TPGCNBhpx0BNVVbkiBsS
	M1Cwig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9au2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so6674112a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046992; x=1789651792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=Hmwlf++kd7dKUdvPmXcbmy4OnEyGA1xzHCNpgy/6qlN+Wjq+s5WcHyqGVWTjjXLKMm
         ACOGsEFmog0rYnhC9VvBPEUfpSSt5LD4yxfEFJL5l+nHrEIZW+ZuBz/ngydc3ZgNN6SJ
         FvqIYo89+ZbGalBdEb3xHsLEW+LPj/x6yA4S1l0ntcDYoNOk3VT2HGx2vlOsWItjJ2hL
         xdO9RGF8JxNazZgez6sM97yHYSM6PftTrhUWakosDQOY0HbtshdYhUAgKx1usMau86l3
         q/nRiUjRz//8LLW/4BwijRLA9oUuvT7XH1f9hPVL2FKZcMts9HAZ7s2hXDDnGl2waYrk
         AglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046992; x=1789651792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=HMkki6FjwB1JiBhyOx3YB51PRkvpN37DVJw+r+aZkwaNhSFyKlcIsyC6gTmj1fTTO4
         l0pIGh0BigzBNAMbuqJegUR5YrZT8leDdKLjqs/R2cri6HtYdpq3Ce+Q9Hun6fWpbQ9O
         aPICbZJtjg8FrGwDtS++C2WYvdg83pA2fDQDST2q31fa2IG0a92yBzIg8XnZi/bIkZX6
         U56KMmQbV0oaUrOC08/V/DRP36FBDkafzwsXqrwNMHUBIBCeqdfrlnRvUGMhoJEJ6f+4
         wOBXqN/io378ES0TC29Cy+OWIYyQqywystbZ64Vmi/1WFpfC6mV01DP5FqvdfuPIrC3h
         gwZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjg0K3GJPnA0kV38MivgGLhrS0S01Y8+wig9/LUoGvO3rgzSaNXRvKwALMEAYNWo3F/w8jbVexSq+U@vger.kernel.org
X-Gm-Message-State: AFuF++nTMejKa30E42gwxRSbUyF/8IGR/PIYf9baG4yJGGHWXcylQdHG
	gq/xJIoOFrG7xrGU9dGJ51ThKDD1cnZbrNh1l/qj2rufURpOaBASxTMhuR7cyoTRxiCDQPLK3px
	orNz4cVKxJ/pxJje+KLGTiNh3vpZ6pUJ6S+PlO+dZywjkvtf/0egt5lZ1uaRrAh8k
X-Gm-Gg: AYBFou0wZVfMuTF2962bdC2zaaJKCuq9BxPSJHgfcVOIVoveANqgoXf92pMeQH1MjCY
	7ef23eGxYKoljfnY5vKlb8k0Ptr/dWu9LizJEnAQotYpzv9Krwfs9ggEEyBXfa35WXpkmrd+/44
	OePoDo7XI5AbdFFC38EoJvoOT7qQj5y/vSVw3Da6Z7sQBEtMRBfpl4hmd4vVwDOmVtPsN4071SU
	5fHP2dwthFeCH46Y6UF3o/H7A0AgBF1DEokUIjyKwZMGybhQ7TjTDIIsfqpE6uIhAmsKCH0iPAm
	R1filR/ROCl4nQitRWi+4wDQ9Y5+qi6aQ8HCTU05WUyH+NFcDor9WGpTjsqXNFB0eLqljzEjfEA
	I6LuCu1NIMgLAYqoG+tanE3XFQV10q3h/YYU=
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257557a91.5.1789046991972;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257487a91.5.1789046991413;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:59 +0530
Subject: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1740;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
 b=vvvuJBJw2XVJcpjO+JG0qLAn4bWDQHHusZOl0uck3t28eDShAxTXWXxXI+eL+xRacXL6+kBDy
 u7W6aCf6DWoCYoYEbjvJtPPzVKs9lYbx/GoYNtxO3GTXH027GbF12Zu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5/5E/VxWM195
 iqW5pjCO23nExpTV3/jZZ8bVsANkTvTQ9/iMTBhg3hZR//BoNN9U2CesPJhWv76fuDdPwskZj0q
 SS/G/f87dnF+Tjr1tuo3aZn9u1oOFb0=
X-Proofpoint-GUID: lbAN3y5VDRy2XIiSBjwuV8RCoE9gd8lr
X-Proofpoint-ORIG-GUID: lbAN3y5VDRy2XIiSBjwuV8RCoE9gd8lr
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b0d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7GiOu5XLvw8Q
 QT0G36gdl4LNMDCNV7cDPdM3Dn3ehFY/b+tp4a7jFMN8zy8jF40f604rbNmVeOp1Ii5sbq+X4nk
 z7xFkItSCPWh6B0wQeq5VJxviv4t2jl/bWFQOwHf4vat7optQyV7K0w8bTrHrCmYdc2rlvcqhT3
 /iEVFgjoCH5HIA45e1vLwHjAD0GmwLX5/HDF/0f+k8mMkK/TYX22iLsPfRX5XelWg3IS35cIH3C
 2EmQCkl3HvOSMKjURBA0TEbQeQbsobQUBox8qtj9iexKZ401Op++61sDkos3KTtAVibfTWC/kVU
 iQlJDx9HNaGUOHiflNQ/oFUgjXk7JhWY0bOKZsaVmGJrbC64UoktHj9BYc9dWmuPSDgoYQ7m5Y/
 nvu1wJkmtPcZ8NqyCr8PWpZhv+gsg0xFod6IbJG72m5VByY4C7g1gGWd4dhDfSZ+Vl+FX2kb5Z/
 JDSjrZ3CaNKJDy8vi+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 41b09ab43d0c..42e3e862e6f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1045,9 +1045,6 @@ &mdss_dp0 {
 &pcie0 {
 	vddpe-3v3-supply = <&pcie_upd_3p3>;
 
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1074,6 +1071,9 @@ &pcie0_phy {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1146,9 +1146,6 @@ pci@0,1 {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1176,6 +1173,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

-- 
2.34.1

