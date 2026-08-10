Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F93C13EF;
	Mon, 10 Aug 2026 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361289; cv=none; b=u6Bu8B/0iO8UcGTfaj8cC9dYYbN62/DtGiSyq9opB5dcCrOTp9VBfrsB2xP7Ktjb6OQIo7RKePG8Q8adrqQA5HBG9lktz3d7lSnJ11mGx769qF0CPuf+x7RsBRHMtCFziovxQbgm/G/4dGrwdnLsxvt/p7zJLYBlAD0xuXxrDd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361289; c=relaxed/simple;
	bh=VlCx8B3lzxYMc3cPnTxZPG0W+Hf4DDQ3Iz70x6YJFAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjNEZXNuhNPid4FZbMXxzo/xk17PPoYtqMadBba9r60kB4LGeFIHPCV3kLuXtgbbZzuISpZ2oJdcZcui/+34V4qlSTqWhJ0XjHXL7zMlv0cxGzcNbMdxvGYBhU6fh0uGhF3EpWrDRUX6Ujz4lyFgpsna7bbKC0LKDG6MCedTqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShDeb8gG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShDeb8gG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SB781119342;
	Mon, 10 Aug 2026 11:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1YpeNr508Bv
	nNTNr6BAgQOFpgUyWAKqW3EGBXIUnpU4=; b=ShDeb8gG01pPbpZ0P4WPX/tEHft
	LXKKvQIf8pJubiP9VXc9qHLJaGLhX3NwAk0/BIQGOjLLMgs4FIsQrq5noyr3ZTCb
	f0BOSJWNn3AnQt9ctdNfU23IRQ2CoEjaORvEjN1ICUw10Y9PjfMVy9qEXm33+pc8
	uxw47hU+6/aWocmtvKCfyPa6E6+3LOgktcSScp5KuvPcs+QBaK8jJ+ju8P+2WRwV
	3l6PXYjY4XGD+lFYiNQs1offT/JWNQX3uMh5NAFLYiBdTswI2cP/6kRMScCY6w+7
	4DvmspY1/4VK2ZZedaMgGDvdfWHjhQ3/GluUClRRs/LB09D+AGmkJ+6tEdA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6s8ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ABRufg004199;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fwwhj4wah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ABRuFI004180;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67ABRtOf004164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 89B7648E23; Mon, 10 Aug 2026 19:27:54 +0800 (CST)
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
Subject: [PATCH v1 4/4] arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs
Date: Mon, 10 Aug 2026 19:27:35 +0800
Message-ID: <20260810112735.1326807-5-ziyue.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXzgvzcWKNk+oQ
 Apf9KUyGHVokvXoa3lHPbOJDlt+33VzuUT7nDqtt8WKxryRIR2sgC6XdNFimN/AkoO3iL7FSJkZ
 CBsF4ZjWB/mc28Dub+9y3A2TKjf8N/E=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79b5c0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=R64-pmKpbGYxamP1ZYQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXw7SrO+EiiblG
 ybu8Xu39E+KNgWDHce2dD+9LKjUYQZAEO/QwRm9gUmoNj4TiGedkPyZ8Dc4aiM1P1UaH01p1Lht
 SOOr88VLpRwRuMp3cDwZVs4gRDzf5KBEs309GH2oAHcxr65+hRFX+LWG3Rm7n2c6ARrlTzGaIHL
 9tqc4uVI37gYEtfuupR6d5HL6971Ldob7kHVlD7hF3MXVnCnijCsHdIMvxWCJFilVQPkHUj8OOa
 9SSOJ88WMA/n1EzOMpF/K1wIIB6VdaBzwK9PE276WczU5KJcBgc5PQ931eVxRxvvIprzhow3MSm
 z+x0bFgw23sTWdyW6DIotuVjTrOLKCpIw2+cegwNuNWiMC8igvSO2t9cfErwe5UYN3JpTFG9p+m
 e32FrzJeSGdetyOcO6/cqQk6pY5z+Zd1cgOUtWWPNiNCYzP1OIR/qfBUj7Dd8Iq667MetaR7C1Y
 9OoM2q3O3Fe3S2LJZEw==
X-Proofpoint-GUID: 8rqW5uawaYrFCPFKSlnhglit-aBQEdfK
X-Proofpoint-ORIG-GUID: 8rqW5uawaYrFCPFKSlnhglit-aBQEdfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

The QMP PCIe PHYs on SA8775p require dedicated qref and refgen voltage
supplies for stable operation. Without these supplies, the system may
occasionally crash.

Add vdda-qref-supply and vdda-refgen-supply in the board files
(Lemans-EVK, Lemans-RIDE, QCS9100-RIDE and QCS9100-RIDE-R3).

Fixes: 94d7d37f6ac3 ("arm64: dts: qcom: lemans-evk: Enable PCIe support")
Fixes: 76326da895b8 ("arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts     | 8 ++++++++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts        | 8 ++++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a6..4bfea6148172 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -851,6 +851,8 @@ &pcie0 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -868,6 +870,8 @@ &pcie1 {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index cefb8ff00806..26a215e9a249 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -983,6 +983,8 @@ &pcie1 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -990,6 +992,8 @@ &pcie0_phy {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..1b6a4f9cb8f7 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -14,3 +14,11 @@ / {
 	model = "Qualcomm Technologies, Inc. Lemans Ride Rev3";
 	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
 };
+
+&pcie0_phy {
+	vdda-refgen-supply = <&vreg_l7a>;
+};
+
+&pcie1_phy {
+	vdda-refgen-supply = <&vreg_l7a>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..cc15025fdbc1 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -14,3 +14,11 @@ / {
 	model = "Qualcomm Technologies, Inc. Lemans Ride";
 	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
 };
+
+&pcie0_phy {
+	vdda-refgen-supply = <&vreg_l7a>;
+};
+
+&pcie1_phy {
+	vdda-refgen-supply = <&vreg_l7a>;
+};
-- 
2.43.0

