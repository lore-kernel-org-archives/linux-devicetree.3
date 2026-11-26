Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679465;
	b=Ru5H0rs35rAxki7zDg+PLtpIZDC0vZVvbvxENy9cq/aNAiS12ILySVoXucBzJAgJLiQu
	 j2nrzhDkMzciDPVAA27LnyHSkFbTa1Uf6iIMHzojtr7ur87EJhrJ37G7gdvyhLHSKuAis
	 97P93gHRS23gNifaUSTqsGLZFoBCtO6uVKCVdRoO5JDAh1ZS0k7ntBYOU/qJm1Pa43r1X
	 bTeaOjiuge13iPDvdJFTALBnYfiDxze635euMitgZz2NRWjNDiRsVz8WYCGTSoT0zl0Yq
	 x3aFTv0l4FeH2pr9X3zKMnxv2PfcVJIp3GYRtU+9gKTRdx5GxtriJHA2EPBlXvN1nhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A+dgf02sy51xdzo7bSmjVfnO8s1KIvE2LURRfwd5YGk=;
	b=DxPUgoZKRFSabj8AsoddbArMd+Z/x41JqZaV3imWMEoIwP9CzZFiC7QqrFZBvLcM4y3j
	 jD448JKaST7/AqK418wO/xwLPOz5XBKAXMXI0qEvj22ucoYZicUSnzVqf86Xu+85SAieD
	 hsjSPJ0r1+H/kPnorqVrFs5Zg2G9kA9B9arojAe1zF42SGbSTRoH3wTPFzi5olR5V8Vwg
	 sy6FTxP0SaoSdIeXCTOTFJyi2WSomBAwE/y5f+1M2MQNci0uK2vFsTAwOn1Ge/f+PSadK
	 q/piRa00CjaD7wAnyS8AGI1kJnqa6fJKI17xWb2cjuQYMHN1HrVpi+WBrApD6qoEnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOVNNTgn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353A606A336;
	Thu, 26 Nov 2026 07:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D353A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOVNNTgn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B8GF919520;
	Thu, 26 Nov 2026 07:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+dgf02sy51xdzo7bSmjVfnO8s1KIvE2LURRfwd5YGk=; b=VOVNNTgng8mwDYMq
	Fgk1X3j16xWXQa82VsCCIuoCKbo08adSbL7sUUCNFFtxc+Qn1kw9XQjzSz0PLRWg
	JyhaSXqmodN9DxdbmtxglCsGDuLX6LwlEUGenjKtD5pIx9LkjwMIMUIY4009Tvmf
	76Uxmg3ElGeudBzqgEgx/ihRpzUFxuJmXGcF4kA3bfun0j/aDlh1U+g5heVc3PGf
	7the1VkH8cjVw5GXoBI1gJccJ4QvrJh+8Ek5g6jal+0NlL/XytHF9PHT92U1mXc9
	IUwnhA9BXKgLBQWmUtC7v2t+4KXb8Vja3zIdNLvRniQccOcAMcZ481FlykkukzQh
	xryDpw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y20yr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:47 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7oh832051595;
	Thu, 26 Nov 2026 07:50:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ7ogZR2051577
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D15A9A6D; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:20:35 +0530
Subject: [PATCH v2 2/7] arm64: dts: qcom: lemans-draco-evk: Add
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
Message-Id: <20261126-draco-evk-display-v2-2-95395c5ee387@oss.qualcomm.com>
References: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=2386;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ZJ3JwCenVZ39cx9dkM46A1Ni4winBxSRTyG+enBwmHg=;
 b=ZJIbkKmJrbLpu7qxzOPOis1OFaRZSr+uZN3MSbH4XRCoMmQjndYX6DDZIUindO5TDsi/khwgJ
 XOkb4IciaPhA0poFlRN6kc6Y75bKTbP/3qaFR/0zCidMXfp4bVlwiiX
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfXzE27baRA30Zz
 MXycjKaYFhinxouwH8Fw91/HbNjxUq4EMaXwPCabKKLkNymZ1vxOwm4Y2Sh7O0LWuGLGAj0x8Qo
 rJA5N9fxF7Uy7GTjGQnN1spJ9AUPMqsPEAf5pijWopclXrIX8C7/lv/9Kng43qgii92Rk07t2wn
 VVAgBhoVPmWQuASUoBrarUiWB5mHfiPV+BHtpldfud0zvFo2IHmJH9/t36MrgSkkxwuHagLd2Xz
 p0NTfOZPfXobcKwyDp/rBIaSoCgLwWcDQXktdWF4IyTP7t5KGqvSQPSi7DSiQbwyT7Dp+/NrfGV
 rgZRM/5lgBt6qmDI0AcZZmXNGtDp+QbDcaLlACVfByT24LlfIWs8jgL9dJbLaRzPhYcNbgsBDKe
 /67y/lbwPXkQ+DTmw6/CWVtWGZbiBJuYJdcC5lOhydGxnDloHzlzCxkVDH4LoXVtE6IVLrVUy28
 6VJKNgWs+v+72S7kOHg==
X-Proofpoint-GUID: 1PZnuIEYZz7S0l-5IunNG9nLhfvwJwXX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX2DkJvEOcGD+n
 hGJZwzhjwEy+4B6JZjXpvjdxEkGn8czFOu2PYFQuR3ny2iryacR99wrMCizkaJSkir6hmWyf0Ia
 G0kjawcb2hyDAqxYB4dnli3DVSqhOHA=
X-Proofpoint-ORIG-GUID: 1PZnuIEYZz7S0l-5IunNG9nLhfvwJwXX
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07e4d8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=70My5vc_s_PNq7TzDvwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030

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

