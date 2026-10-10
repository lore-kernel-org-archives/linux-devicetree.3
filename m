Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8714AFE0D
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648099; cv=none; b=F15GMFkq+Q/r85ePooLWRUNkhpgtuABgZ8cIci7HsTQJTqYg8AmIkJOR0OXBiQvaR2tpdR6BhDp7ayNNC0UTNMbRznnWriQY/Ugg5xEIL+Pja80EhfbGwLVCbSJmbs1D30NABv3V8WQbaNyJIWSOJu8JBERdIHZ1iUE1YiKA85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648099; c=relaxed/simple;
	bh=olTaIVcPcxSF+UJRn0PedfbY2FR2T/VrbrYs3msL6as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2szdtiAz0xMaNDDEbo3Sbby8RKV9MgOlnq37xEDWipPnKB0E3x82Ejc3+YjyWfXM2oFq4N/nMU5ZX5WVa5F+UeEbs/rWOSxYCyS3eGAa0XbgcyASfNntmyuR35rUmsLsT7lOuA48LvjaYBEkJCf6+GqV5i544QHx+lOTqVBQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFW0ikIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0whx9x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFW0ikIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0whx9x8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPJJU1981914
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=; b=gFW0ikIpREoo3Xsf
	IJbtoVrY/gK5nAQ26cFNEXxDMsVzkehuZI2DJt/fn1MjgDu/Zt0D3wYJbiHBTGx0
	QrKZeReWneipKmOgg0fgguDYt5n6dM0XIHJN9QBVblsanWW/KbfUQaDBT0eVYr8X
	owXvpFDg1O8aS5HHB7RVRwGgtkXKZ78TjTY34Al5OwRkt6iqFjiwTVG/2LjM7HoC
	YKSYnsrmeayo54SkhoDWqMD+NrFsUn+zUBSRDNp+9N1K8UdIsOjx7GTpZwy+8aUj
	K0LF1EE+RLEGqB2rQpX2oIic+vqeOkVBUrOjB0GwlB/lEeR0GcsFMqEUNXG1syTW
	MSuk/g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cas9gxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1259873c88.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648096; x=1792252896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=;
        b=E0whx9x8b6Jml7JdbYKamgG1k0KVzDxTrGOV01fP3js1RixPx7cgvCFpMWppV9MU68
         9zbhE6DWbtUT7kh2clp1IbV7wrqLZspDbUAuUxYp4GjqoxPMY48A3NiIyuHzEelmZYa6
         mAJ7h0DyCCrFh9zcDS5R3fwyux0v9reyeDRp7k4r+h1vSi4W4rs4rm4AzNxNNGVmpivR
         wDFr13kNmuOQW7uUNyLGk1/DMjHoROWvf7M66gdJ6lZy1NeaIRKO+ocQVKB9QypdaUKW
         TWDLXQXfQDqbyeTmL1Dz3luSwdLzsy+D1wPeeQBhZTjiDWGH6kUt0SNjJD4KXcoWUojj
         AmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648096; x=1792252896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=;
        b=ceC1ks2x6aTbRaXcqnBdyaXckAzL25cZbMRbLYOQQihuMIqpibcvqQExZ3BEFJA2tm
         BgfTnBQtjeNfYxKHaQX63oTn00vTYxbVwCw0LK0oblvEHV+ndVWXV16CHuaOcguzL98E
         RKhtOXc/XITqUmrNsxeQ+mDEnX5bMSCsASSEdDQ5h5to2V1S6nAGcbhTbFyJvWK+ov6h
         eWM2aRBppOD0lTZGXWRmO3NGmmmxIirdRkQSqoiG4B1VgxiJUUX3OsyjrhWOwWprcufq
         R6Lxhpp37kOtPljM6HHZ+whs1H8rxCKOu4n0eRXOBpL1d4bcWNZq+BO9WBaGkFcYIO3E
         g7sA==
X-Forwarded-Encrypted: i=1; AKwUvBytqbuCZgEtVAt9JPG7KX7AuVxTVkpENftJJtzj9zv7v+aPtFBV4jEQefSXVM1AEApV4x7vIJiJxAUs@vger.kernel.org
X-Gm-Message-State: AFq9FYKVhIbshtI3Da7Vg1suTFWzAx5NMRSslaS6YVTq776wibsC86M/
	IEdJ8DsrtTiZnfCeOXrZ1mKqPVEPsRebXNV3aIM3cmXh1kz0kiQPYOcg5/RjE8apJMqyOLMvFtT
	FDvBSRgQrOFY29it7aimWPWimIQ4KD3Vp4AGqftsXuhwrWi0AFSuX3D7xMVa8315Z
X-Gm-Gg: AYBFou2c8Y8lXF2g/HfWUwMSE0uG7uPaLUYWtEJGzjzLn14DpKI7cAi2miXjC/nzRDu
	nBhrBHKN/hwYplSW0Z3b1g9xyGjCGUHVCre4BUIy5S8h2wuC8PmGnphva1Y2mUbC55zfG2wB0TT
	RALGVwCj+RU+Pq9t9gKyO5Fs74yEew+7Vwn56vDbWlaBpE6BhxzEfY+7RaBWMezZxaaKz80fsJj
	VXjH76/udnN3yrL6QYBCoSnHW178ud9u5BQ0ZIfm4StKHn0ODA56qrVUH/gfGpMJ2h6hEk7rzIH
	9kRklnPRfO0wouiPSOoQ3yZ9FnclGzSLOGub8WGKSLySks3BOxvkUqnyQfeSJlRH1tlrYsKQ6do
	7EgF+mzyWD0Ssgx3ols8yIT10G1X70g9XMr6KHPU4IN0RQhhztLm9Ze6uq4DmuZup8ziITnH+16
	fOd7O0ksRanA==
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr6701369c88.24.1791648096237;
        Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr6701314c88.24.1791648095519;
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:18 -0700
Subject: [PATCH v20 13/13] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-13-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX3jsyI9w2nLW9
 V/Pw6K4XhfelXPg0D0k4WM08Dz5r/kGuROpKhqa35RS1pOApBkSDNsm4S1Qh1BqR1/B1FHh0ubf
 VUmgOhQDXBlM4/hVhUJoRrt5Iy2+kko=
X-Proofpoint-ORIG-GUID: nYGKn3QpUkXPLUp7B83mqx0TO1xzz9i9
X-Proofpoint-GUID: nYGKn3QpUkXPLUp7B83mqx0TO1xzz9i9
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6aca6161 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX7Bo2I1U4RobS
 uhnmYhd4/aiJoZ1NL2x/BU1wDbZlLenqUvviuUb/MmzWD5GXV2fIX/yNjHdQ3I8Xqj/TrANN+hx
 pPXwYvl1uniPPgWLrr5arueOWgWxnsB1ceVOB6wNn8SwjYnJ+RXEG+i3nwlAtGKboVRLFwN95Yb
 HYp8qu1xngAyvwRhkd1I10SscXT7dV9urU8T+qIOV5kS0QpDKFQleuGbY5amN2jUBJQPYTIq9Yu
 idrQLYMuavHcoc1bwAIiRk7YrO8W4bu8VF0LbtDWJ1ZqGrlgMpm407cUxX2VL8QXiApsplIyc2k
 hNIkBM3alDETQX6MvNxqRSWyxvWf+g80mm7o1G86a+S/rKqmtID01CWb6ooqfnCC57WKLadYt6w
 WubBxBh2j2fxHLo91od2giWPOliq54i2ksniYg7xT5CavmHXjAKr9jbaZq7KK5B1eB8og3YP5MD
 D2FywxOjYp/uAvKQxIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100063

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 78 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..7b574e2ed373
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

