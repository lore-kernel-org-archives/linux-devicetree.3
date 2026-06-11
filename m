Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDD36A37D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154085; cv=none; b=qOEA6PLgTf4WLHpbKlTy2vhjeKXGkeElouyDBhKkDNCdulP7YFtpdurl72wLkXM6jqT1niVt3kdWMyKXtLixGSu9/dN40pYZEdWWsKy2QxxiIy/x0gknha3i+C92xIkqLWYduZEqGYtwC3UeRvNaemR8AIs8AtCaM1acOdOc25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154085; c=relaxed/simple;
	bh=CRhjsZHkD7Sl441bFPGjztZUbbEF7q5Uy9WgqxTnHGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZojHxfCu0JV6j33Rfjs5ytMH8BTxIADBQ8RDihc8D19N1850ceofuFuLJTQNl3bHWAOAt52sDl8ts1MDN1bAqBkeYdhCHv+0tJhUnepXyV4JP6Wsc8x/aMAbwkSVXBp2xv3T/T7a4KwIS4OYY23qhygXQp9RYAoik2qZb9XmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCNBQAjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cw/UJUWH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCNBQAjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cw/UJUWH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NehS1614648
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=; b=LCNBQAjEvlRnnjWD
	y9xsVWkdCTRs1AHN0WzK/kd7rSL8Sfw/6RBbLUiGdQjMlkieEkZu3kmzRIlNlwg2
	mco3OACnHkDIwZbUmQ97bn0WC8l9GIIB14mOMbKlmqdDm1A8F3Cw+z6ZXjLNoEHd
	dkU9SzsS3f9YRt08rRqSy8NqnctmEZi2NXU3K5Vjop6H2CuF0d6YnSJ9YRMAlooY
	FX2ggmQ7mU1YJGqtkq9McMpU5vKFEQcP8iOTxgjpXW1ZVUJrhJmGw1OBlJb5qw7r
	fn9fy0K7nRZHTNMPI59PmEqfMP6DILZ1Uu2hGgP7c9X5Ad+3RO53BeXKmKhNxCdk
	6pgx0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hngg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf55c3f44aso4735975ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154073; x=1781758873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=;
        b=cw/UJUWHyF3HGpWA6r8ocKfc+Ql354KwGC1rSMuFkEij1qjo89eYMrr4IWqfpq07Vt
         Eee5bXkd4xTE2fSqc5DvpAnH5BXWRVNt6AYnrsV9jyvthuy7rRoqRkiHIXK0K947JiEm
         xXs/feQmPKEFZDFbnfS9R9n43U7SzQd04kEd8Ncu3NVv4sVKHWGciaUUVjDuRnoJev7I
         a3GbynlK4YE1TSt5xv8KrZxIIbVGFsBW/KeyuU5Px6wvkX4m8Fakp0/7bIaspXDRrWNm
         4j2YAYNVhAut4K5RtN1/J2ZJwOHJc5GbyT+FnpdFK7p4lTRamtLNJeylFBno8tgP0iCS
         3AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154073; x=1781758873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=;
        b=AvFRUIQmfsa5GMRN6ZsPdSNMEmTdRY5dn4GDjaGvut5eP1KOgnoQqkPdaT44g/w2i5
         w7yVASfYtA5gig5QsW1Zx6cmwaeSU8S/aK7zXT1bKL3BOnBljFRAa1y1kjPUwbvTvI8Z
         5aOqX+/D0WYAHAwKxpS76bPE/LGqMI/hBI6T61xtWTuUQCXUI43Yq1b/59+8J/xHudYe
         /mtvD7v+jjzHTkF4mvlrS/m1ozjAB76EtokoNb3EXx4xOFou51iXe8yUtL81VbVcVpsI
         CYbflb+R/ZNM41ze6ynGQQJAq4NuZgZquwSdHEGm1DyjjGI16yzo9ynr8eOENCf0po4G
         TPEw==
X-Forwarded-Encrypted: i=1; AFNElJ8/parcK1/GjfW0Ui+GBachzCmSJxHX5SxSiex0gFb6C3hDsWrJayyZOHrZx668C1buyCUEunSrQIg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKagl3cZc/XalYhblQJEcAf8DzxXZLsVQug/ruQ4ev0YkagJI
	zSncEAFzoXF4fBHoP0fxy6Zuc9tuo9j/VU6rU7OCgK4j1/3/CKAUqxMOSLZaoQrDWJgEYAT4RS3
	2Y/FRrv+M2QvNmtAhFT/24IIu3muJGxKQ3oE1J9DyZuN64FhU8KVVbDtlAm6ZSfU1
X-Gm-Gg: Acq92OEeMxarqv53AzWshho5cmXSVDJnXzaccSM6fkmwOMrg9ZR2070IVlAW1lFMI+S
	rDCP+2b4fJaiEQfk3xfp5zMFbQlgleIBUAsrXpAzVICOWENAX8XdgFtGm3Vb+W3byR+C85LCH3V
	Fcg97KjecQsASePepIvfwBdOfg5Dl3Q6c4RlBaGvJlIcLEExZoQuTGr5CZqzPRG5u6U8Dapp7rI
	bZg/1oWL4DJDgiX2ZVtRK1kBijEPuZTv6stq8pw0AQrnDVqoJIOWZwi6ewLOYNzZAAJCDBZ9MlB
	ktoJF39Ja/RBDBCUVatpw+XTtl6oIF1P5BvciaveRtGWETNShGI9acLVv21Ktrx7mWooB05FwLu
	7J6qSogcmuBj3Tn39Hbybh48ERzXNIrZqcNmUpT1904/OyviZTDAnT1q6R8X09szy3ss=
X-Received: by 2002:a17:903:3d07:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c2f57ae62cmr10413185ad.1.1781154072916;
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
X-Received: by 2002:a17:903:3d07:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c2f57ae62cmr10412925ad.1.1781154072453;
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:11 +0530
Subject: [PATCH v2 35/37] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-wake-v2-35-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6180;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CRhjsZHkD7Sl441bFPGjztZUbbEF7q5Uy9WgqxTnHGE=;
 b=AsZHzER8Ew0hYGscBoraPzd15cf9MuBuhuF3A0BL6Ws0y+3do/eDZR1XHkYy9AMxh0Fu3Quee
 1F4stMs4BpxBXICUfvTYf6kUVrxNHhifr14aZsgu1NW4/YC1/dO72Sk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: v0i0Yc486imYtFPq1kbkO6nbu_j9bRc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyJhy762XBXpV
 5T0bU8UHdOxWq5LjB+/2kRH63rO6TFiItdQPP4GrCHNeIur3fRKJvGyKJ9KKInag3qIeoEhMmeC
 OTYqJekAEaWC/kudO2lAzkfOlYUkPGT+HG7/HAEss3fBLYzHN84QAfhl5bpywdx9McKgz6X5k0R
 h3/hMW35y+0Uzmj+hqzS5CoN64Emm361RZTbLwjXWFUzISVMaNy3H0hcm4vTuXYSSuacKSgd4aT
 VwIcs+olJ58lzs9xwu5c04BKrlf9tHHZUyOJ20yLGMjwPi6Q+U7Zqn0GBgAN/cjBl35ySkM5ZaM
 RkIZocaXs6LhVPXsBOW98sDHnQfTSXG3e/WkoFSR2fgr3Oh0UZTBe+OKRClLVXBezRQUkfLpsHv
 3glyEOqWwLfirTrMKofphwWz0nQGqes5a3Td6wN3dzrdRvs0e17Zbq7vHOx6Myd1X1BlSvGFksd
 MDkvH5WT4oYc+3SZsLQ==
X-Proofpoint-GUID: v0i0Yc486imYtFPq1kbkO6nbu_j9bRc7
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a4119 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PQP5rm17eCTiIiCJsb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2kowW8wRIZfh
 WfADnGhEEpt3eG70tgE6p09O34XvDAonIXXWGkd7wlQsaIGA5HwlZn/rB7eSzSe1ykOkrLrtvTY
 xvh+aUAga43pefwA4x2cuEHZso7dr48=
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
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 2123312d88f6..74a286bf7696 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,15 +1108,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_port0 {
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 775ce9f2dba0..02f8760212a9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,9 +942,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -952,6 +949,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -976,15 +976,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 8cc0d2cb3515..08107a559292 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,15 +642,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -659,15 +661,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index c302996a7857..a18c01a48e4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,9 +936,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -946,6 +943,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..fc6fc4d7e39d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3644,9 +3644,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3716,6 +3713,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -3837,9 +3836,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3925,6 +3921,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1

