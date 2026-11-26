Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681963;
	b=ogYcKkXdMFdAJ3J/X3pasPsat7J0g8ROcH7GhuoA+Q+JcTTxsQmzQZNoTI67iVrM7L2z
	 SzB6zcLywYILXK7Z/5hi6jf2es7lAImtfR/ARn8uuzMUCajNNTPOLO9p0eJ4EfEpzE06u
	 adj+IwnIzvVaICmUdcvgFmF6w/gzbAFwj0TOtJJj81MP4HjiCW5SOy2eXOJttM5K+FE+Z
	 J2Dx/+lsGhXI8WW9lv5ZanlJTif69a8lJTJewSK4RV1FQ0XB4aeY+vOMz1U9y8E4wXkah
	 6Oa4/tWSerXlh6J1sJjsFUHYB0J3O7MjEAp5qhXVJ+6qBHfqTUf3kUvWgjXMSn9XCgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A+dgf02sy51xdzo7bSmjVfnO8s1KIvE2LURRfwd5YGk=;
	b=2CelJuEeT97riuThxcWfZ8OjWMPtQhOCUykwQZ4TaoWYVi+mOY6fgkEUB0dwhEjL0GDh
	 P9ilzFO+ACBlR/q1wE0ykGpFRgQ8NN7/v5afalXMsbKl3gGO5B9VgbQnAo+UDzsmBdhoM
	 72svzxtQTpmKe3qwrmsBCihh4p3TlBnADXiiUx16B7fx9sUrOcmy2CQgXUzCWuNMSsb+3
	 kYFc9DrcwInVa0LcpwjwXS0fPlO4miS04OVdFWdMADpiiVSz0h5VGAtqg5C5RLJRvdFcv
	 FSAc90lfbfTW9/T+6bW7m77DyNVP308boN/P1/JcWNb5W7lG8t0DTT+Q4ZJ6xvmj/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erfKfxAA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A847606A321;
	Thu, 26 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A847606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erfKfxAA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvlN2594841;
	Thu, 26 Nov 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+dgf02sy51xdzo7bSmjVfnO8s1KIvE2LURRfwd5YGk=; b=erfKfxAALr21sc0u
	Lwx0Dq99rTWnDQmf/EQYh61EButL26ceG3gCC6rrOiwUufC1plRcK4n2WjShorN+
	bjuOC3XyQwgsP5jm9HeTl3F3Mm9zL3FJFV5ELwbf8L1707uvxvY4PfB6/S/XeE6V
	B93wnSJKWbaiP1KPULmGpZUaHPlKwZcMrnxnn0cK5FHhPfqtwQbKxGFIED2WxL1b
	e9WHmMbYeubVQLQa2TjE+dZRoMxHT3p7aht6lyjB7+6NLQ6yDZZyUqniXJ1MdO++
	YtFXD0w8+hOPH5kWxbMsD8eKGg4gr0vgtxuvH8vCoFpkGhAStq7W2Qs6QmXatZHN
	mLXllA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sa77x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WOnC3850900;
	Thu, 26 Nov 2026 08:32:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AQ8WOh43850882
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 1B404A74; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:02:17 +0530
Subject: [PATCH v3 2/7] arm64: dts: qcom: lemans-draco-evk: Add
 hdmi-dual-dsi overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-draco-evk-display-v3-2-6864d09e916f@oss.qualcomm.com>
References: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=2386;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ZJ3JwCenVZ39cx9dkM46A1Ni4winBxSRTyG+enBwmHg=;
 b=jhktdUgZONGFtzc08OmVm8OqAhl4DKvxGdL4hwtYDF+pjbQXarBxWRV1tsCL/LOXOFLE8uY9U
 mXIh8bIWBtFDu5DNmDmt40BfBmce3yhz/zHMdbovl0TZZjJH7iZ7a5G
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07ee9b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=70My5vc_s_PNq7TzDvwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vB_pokxx96DM-cO2_yvaqaRwXkaJYijh
X-Proofpoint-ORIG-GUID: vB_pokxx96DM-cO2_yvaqaRwXkaJYijh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXxOtOy031CU+f
 MCWF8kJdxOfms39UYloVENkNFO/GLUGoVZDGf6m8QslaucBW4Y9n5lpUSpjTQQTo4I6SszbQvkI
 ve7XbTJHw1xgmrzsFmjzwUp4Uc4epxyYfJkID+l9cCWU8CgiT7nTiQdyCSKUVgT7PcxnCtvH/L9
 A1q34Ub46w6ft++ytdZPJUwIL4x+fkp+J8GTBHXtnjJ4bFgyBBw96hk7WM6xRexzSV1NaLeMK8m
 /dtLjKOG/LA++mYSMkyokAcvqFusWpc1Kn+pwY1oYLFYfQUquGiDwwjdUYyqIxxB/tQNT3K0MuY
 LCi5nY6SWUO9SELbkoHk5pDecOBM8KAGL8kwfmRYzvayu5C0kmNMgxXGQLdzzU9GqRtDaPheQtm
 GmBjyg6kJ2k3v+Z+Ce5ewO5UHlS5EDf6d+pXPHBBusvJw41SQxUFOlF6F9A6Im4gPaQRpeOqZkR
 y8aAa/5k2VxNw5YQ2iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX5HK5suXmy9CO
 nlflNPVb/dALCMb50U6hY0ZuJTrtunJufLnrl64KSc0jF7K9y/Nq0bGc9zFZDvMlCYwDi8dRUKg
 DgcZx7wGmpu4ngVBLIAOALgQv4hKGpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

Enables dual-DSI mode for the LT9611UXD HDMI bridge on top of the
single-DSI base DT.

Enables DSI1 with dual-DSI clock parents and power supplies, and
reconnects the LT9611UXD bridge port@1 to mdss0_dsi1_out. DIP Switch
SW2.5 need to be ON for this to work.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +++
 .../dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso   | 38 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7a74f23f8adc..036fbd9f3f23 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk.dtb
 lemans-draco-evk-el2-dtbs := lemans-draco-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-el2.dtb
+
+lemans-draco-evk-hdmi-dual-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-hdmi-dual-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso
new file mode 100644
index 000000000000..ea72bfcd8224
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+
+&mdss0_dsi0 {
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+};
+
+&mdss0_dsi1 {
+	assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+					<&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+	qcom,dual-dsi-mode;
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in1>;
+};
+
+&mdss0_dsi1_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&hdmi_bridge_in1 {
+	remote-endpoint = <&mdss0_dsi1_out>;
+};

-- 
2.34.1

