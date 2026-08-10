Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D593C108D;
	Mon, 10 Aug 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361287; cv=none; b=PDVyNheGrXX6jLjgUTtpgDEp5QDBz7cPc/YFwR96AxksSasHccoDP99VZT+DER8A3gc6dwiFkS59kRveUyZzxAHXbmgSVyDwnc2Xp4PjsXwEpyal/okJTp8wu9O59G3heXhP36BsB5xuwn1g2c75xisdibJjUo+Uj1llJaJ5as0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361287; c=relaxed/simple;
	bh=mNmVJswHDxPD0FFCtiAy8txBvM0L8+vlZhAJhxYP1fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2eZKvLbko/wIBbenMHf0WjMVnX5pgGpX9AosVwhGSubA6Gq6zq8D2k7JgGzuZpTOoM5gzTvFNgRMq5mFJw5Ia6kKQz8Qg+xEmFOmhjBWeqzW8tglspGjGBvZ2MQlgGv2iHF6VfkmSNg1miLMbHIO6oe8PeI5CRt/QljbVuznPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZU+GIuKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU+GIuKA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SBgr1189838;
	Mon, 10 Aug 2026 11:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uHQrENU2Ccz
	o6jNvt28DCQbBLJfWTht2Hv2/+1nxKaY=; b=ZU+GIuKAnUNSaHF8kXfA/L1IuI9
	45RSVfZPIcSPkKM59kivh7vlxrXCb0WilLL4Ao0DGOH5w7zGHj8A894wTGavL7ze
	Pb8pDigNwdcmD/qu0NlER9H9WhQkNeKj1Zl50CwtcH9jhPVAj581KMh6ibsFjfCn
	koBGaoOIAvjij6z1xa3V3adsORLnEM6WPr8TnaLHlfJ+gkVtDcLq05albY8y1NDu
	NnOrv/6VZUZJDHU5QXPhilak3DZAw6W1Umzm9f/VX3EijEnWl0bozHtHU+wzjbj9
	AjF84FcY+11R2oNiIxougry+yN3svQExQOfLPyO9zROwPOxDCrAJlzvTeiw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v299h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:28:00 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ABRu54026817;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhvwc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ABRudg026827;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67ABRtW3026792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 84AFC48E22; Mon, 10 Aug 2026 19:27:54 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
Date: Mon, 10 Aug 2026 19:27:34 +0800
Message-ID: <20260810112735.1326807-4-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79b5c1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=FwB9gf9yzOQQr6sl70UA:9
X-Proofpoint-ORIG-GUID: 81_HjQyCAU2gx_L0cn2EVmOOmXGuubxG
X-Proofpoint-GUID: 81_HjQyCAU2gx_L0cn2EVmOOmXGuubxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXySEbIIFnclmK
 Su8O+M90eu7QydTsslm15NakzMvZsPsDo48sgKYzRy/iH9oCS5qpr52o06iObRRUWeCYD3TlI4V
 nRwa8GumD9XyKgKFGfhto49wfQm7vkz0KgsZUDxxqO0ZBqcizr9NdvCGboCiLdc917utcAERKeQ
 EumddD2mML90I/hVUD+Mfv5iBvrutYybVVywqJcmC+HzjavjKlTRptP2uaNgsblk7Lm9dTr5qcD
 QJ2naImzxZxYuKLs7G2xJfzgOeW2snYgr+ncOUCD7uIkU5T1AFsh5yv/zWpftIRWcH2S4yZfbew
 tNHGTrHGjfSML5gC6IValJ8+/nMOtoh3LNmGe4Wbq4OpnZBiZ/BQ+hB4bmmYUy/MrU8hDhaGtUB
 nIqw1JnroyvrgLeQVtCvNCg5MA7vF8D//VM3ts8ecN399geawgR12JEWcsDCnrWEmq8D96ZCt45
 8fRKl9h6stcKbNdhrWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX2Sn2NqLNTlWc
 T4R0lOMk3n8RfG+1xGIxiZ0Ern1i4lPJYXdY9uu3XAY75Hhyh6DYxdTaQmguWwx/oiXC7KiCKlq
 brPRbKPb9Awz3jqerHaSsRI+ud+mySQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

The QMP PCIe PHYs on QCS8300 require dedicated qref and refgen voltage
supplies for stable operation. Without these supplies, the system may
occasionally crash.

Add vdda-qref-supply and vdda-refgen-supply in the board files
(QCS8300-RIDE, Monaco-EVK and Monaco-Monza-SoM), and add refgen-supply
in the SoC DTSI (monaco.dtsi) since refgen is an on-chip regulator
shared across boards. The PHY driver votes for refgen3 directly as a
workaround for a hardware issue where QREF actually depends on refgen3
rather than refgen2 as documented.

Fixes: 33967eadb215 ("arm64: dts: qcom: qcs8300-ride: enable pcie0 interface")
Fixes: cdb613a84527 ("arm64: dts: qcom: qcs8300-ride: enable pcie1 interface")
Fixes: 41e2424651f7 ("arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1.")
Fixes: 5238f4e7169f ("arm64: dts: qcom: Add Monaco Monza SoM")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts        | 4 ++++
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..c1f63a4ee243 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -623,6 +623,8 @@ &pcie0 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -637,6 +639,8 @@ &pcie1 {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d..b1b3a7773bbe 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -211,6 +211,8 @@ &pcie0 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -223,6 +225,8 @@ &pcie1 {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..a8e5f7abf686 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2433,6 +2433,8 @@ pcie0_phy: phy@1c04000 {
 
 			#phy-cells = <0>;
 
+			refgen-supply = <&refgen>;
+
 			status = "disabled";
 		};
 
@@ -2624,6 +2626,8 @@ pcie1_phy: phy@1c14000 {
 
 			#phy-cells = <0>;
 
+			refgen-supply = <&refgen>;
+
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..c7b36feca4ac 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -638,6 +638,8 @@ wifi@0 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -657,6 +659,8 @@ &pcieport1 {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l6a>;
 	vdda-pll-supply = <&vreg_l5a>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
-- 
2.43.0

