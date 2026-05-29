Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2E3F54DB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077769; cv=none; b=riIsuqnLgyNRFMflKfyj4+NUl4+50moLYV1Tj2RRW8yLkSPFyVZHX0vb8XcJ14bruNlSgM07Z+eek30BJVZls0mMPAi1aa2j2GRLV4yxQ+VuulswhRUEAzYC+xR823dVHcJlq9hNVczN7ywRCDYu5c6IS5elQrBN0P2lxSdnjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077769; c=relaxed/simple;
	bh=3+Oa9f4QepMvcag731FY22cwOpy+XSYq5QE7o/iB3lM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DhgCnLXoZ7U859W5CZk1o9GJphnQTzc21hG7tXn1RgKccTK3YedRLi8HOmkxNkBLZ4svqKKT1OMgi5SnT/I2C3kBbuSrQGqhWqJTS6g7kr21qN6mxQhCqz0EbdAHVmz6tv62AcxMllhZevBoNtmSEz3l1DllGgH/Fq1O2cxByqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5t1NItO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYE4qtQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5t1NItO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYE4qtQ/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2Pbi3409691
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 18:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/y
	TLN2j3xc=; b=o5t1NItOg3BAZLJhdKmYEGQjlh+L4y85rvNvh7XQvLN76rQbV1X
	SntDfNfMMU4OAxRjGboRPQE/wXclopGgh7kGsZ59tWN8v/49mSZA3HgBcIkWw+1S
	6kt1Sb/SZS5O9GB3abnoueV1B29Gjqo3X57MUhC9RyP/2R04PueH/Obdx7/aeOzZ
	neYcrZ3JynNLthRdOwQYLiMDEX/gZxMmvvjRH484qRI/66soUd348g6m2PzQEpFf
	MXoUkMm41W2YR4rGxnpHzyBnRppSTWAJN/5E0vVoq6YnyZFlwr4I/cYcungj+lHS
	nPFuOWyAPdOwasWC8x6gw/NeYTAMZW5ywvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug5b1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 18:02:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc7f9b2213so105914085ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077765; x=1780682565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/yTLN2j3xc=;
        b=jYE4qtQ/YOv7yMB4hyhJRD9AwIVcONzHUHo76lapSy9vJ2A1VqxEsFBitRaOcOp+qm
         2FwxVfjr9BUqR/IYYtxWriIktlBGGyKLyDc7XpdxtiKanqgC4sl57JP8DMQw/Edk8O3A
         mHYiDTmAXFoiEQTJh8X3uo8IkRRp6snRq8cgcpiEMu8YWe/OsBaSkmw743NP5Cz+5sPz
         kvCvHX0W32VFKQWb457dZtMxTkT2fhnEPFjdbseE3PLrNW0X7UKFXFqdMu3gSN9eUi+2
         lvUC5OEpJZPDsEhJElOitlYUvMDthgOHfTXhmy0okVuFMFDXVdpwnR1dzmvnumfUbhUB
         F/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077765; x=1780682565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+4GT+TR3WQGdrrJ6oshyZeQyk4XOz4zR/yTLN2j3xc=;
        b=ICHLNW6jtmklN8ZZ1Ov+WQX8/tWNNgBhUPSSzyvH62LSQ9EUYqkLq8GnDqEQvIndpZ
         7OEbZw/LYInHYoomRqYpto9EX84cXIhWbHhhO/dM3NCEJHT94FO3buFiyFvENIOVdyay
         w8y5ffA0QmxLmhzERpfrPaa+i8mSOwsfMVpCNuZCOO7Nw7R5uLflx/Cx0PR2ZEwyS76l
         YLlJmiKvYDYAuLoWGJRoakr7NcyKRLtycJv9/VnIEM4uzfDgzT4ySrXEr+VEkfZcAiGE
         NgAm2FTSVxvf3pqxsL+k3O3G/Kie42bfHPHrHmk7VhG3jqNvTOxbtKzT0Ke2T1T6l1+1
         iYog==
X-Forwarded-Encrypted: i=1; AFNElJ8xuELSbG8CoU32u+J+mqd1NgpDZctCA2+q+r8XwclEP/z/dPMD7hvPLV03crZcB8FfAn8kV3WyZwPG@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUXXLZVgJ9kS54Gy8jeo+oESth4p9/KnuyfdqXWFPM/VnBNib
	trCVXjsFUZWCl8ko6XC6/XaepYjZ029xKdnunkQfNEDMew+KcopEGV1sTB0qxfEnS5fU2UCfTK9
	hAWoSpPJOdh8tPRDbcvPNAUaNk8ceOF0CJPRKsf3MTRxCU4QoG+z2Vf8AgzLvyDR0
X-Gm-Gg: Acq92OFL6K650U52qL7H26gzMJfYgCaiKm4+N1ZES/GeaBTpfgWCzxyfZ77RysiRVBG
	dv6wqEDxRBXwX92Pfo7xegSB7hJ3y4sOApTAwK10B57VIrzpaDq7qcgL6fk/8bo4Zj3bVXLjAVm
	HIQjlhCyZl0RtR/QgFkcPEo5HsuU+r3Cz30Tv1VzIwurrwNHVwsBzS3NOzMEAjQCGhc2W+Vv9jC
	gsgtMBu93D1lP8zJ2FC8GO63L0Ew5xsVpHfu8FlR4dQuISagcQh89qMq1Lb6+J8Q4h7HXGdDpPS
	JMOmZaSkmSQSdJ6qZWhcEmW7AgZzzwHSKEJw6IWJ3izt4PQtGU4AKbueR5jMMZmePM1WrVDWdN/
	9b+Gfc3HTN+oyZGCn/WPoO8Nit9U3En5W4N7DmuJiUVcS9I9vuZ7Z3MQhvktjNA==
X-Received: by 2002:a17:902:e88c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2bf36879045mr10387745ad.38.1780077765140;
        Fri, 29 May 2026 11:02:45 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2bf36879045mr10387125ad.38.1780077764618;
        Fri, 29 May 2026 11:02:44 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm27268345ad.52.2026.05.29.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:02:44 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
Date: Fri, 29 May 2026 23:32:34 +0530
Message-Id: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4MCBTYWx0ZWRfX8kqPhPehZhve
 xoF/mH20YUhRfv2LfGGAk/H0ewCPW3Jszk0Bo41EnTfNzRw/AJCljObBbyb4YSrDtRk6tyUXf7L
 Ye8TiLAPpOpSY4mto6trWcVxzSrSCz9wBBSmZHLYOzc65pM+T8VnMWofTuXR4Gw8TJsLNf6x07b
 QLOvEJXaI+qnKEO2Ry/uftFTdz5k1xEF6mlZqi/09P4BKOIFbhmTKg3WaOkQ7tc+18cZrixW48n
 4Koz4I6MjJ18oOyh4bOGZ2MOXMH1XhuTsx269jfL3Q51cXU4ekeEyvIFAC7eQgQKBmtImy1RAKx
 /f/hsRCqveeuyRgP46EgKjicUUKnVKH2TZn3Ne1WWY1tC6f606sxHdIPnQ5fUZJf8wgCnMCvprj
 E/YRhvAQLf++ZqWAhBuzOq9REWBvcj7gPbjAI1/WDpM4Bhuu7pLh+ScQduz1OvamEo0yYXHB6tG
 kYbI9WKvhslV2H/i0qQ==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19d4c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=86PJZVPQ1pRugi-lMccA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YpeA4PBzF-m6-vnyshmtkP_r11zF9EZw
X-Proofpoint-GUID: YpeA4PBzF-m6-vnyshmtkP_r11zF9EZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290180

Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
industrial mezzanine board when populated with a QCC2072 Bluetooth
module.

The overlay configures UART4 (gpio16-19) for Bluetooth communication
at up to 3.2 Mbps. Sleep pin states are defined for all four UART
lines to minimize power consumption when Bluetooth is inactive. Host
wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
SW_CTRL is mapped to gpio86 for power sequencing.

Disable UART7 in the base industrial mezzanine overlay as it is
not used when the M.2 slot is populated.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 ...3gen2-industrial-mezzanine-m2-cologne.dtso | 110 ++++++++++++++++++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso |   4 +
 3 files changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..98b2d6402a26 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -173,8 +173,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+qcs6490-rb3gen2-industrial-mezzanine-m2-cologne-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
new file mode 100644
index 000000000000..905a40f4b938
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+*/
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&tlmm {
+	qup_uart4_sleep_cts: qup-uart4-sleep-cts-state {
+		pins = "gpio16";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart4_sleep_rts: qup-uart4-sleep-rts-state {
+		pins = "gpio17";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart4_sleep_rx: qup-uart4-sleep-rx-state {
+		pins = "gpio19";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart4_sleep_tx: qup-uart4-sleep-tx-state {
+		pins = "gpio18";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	sw_ctrl: sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&qup_uart4_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart4_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart4_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart4_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&uart4 {
+	status = "okay";
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
+			<&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
+
+	bluetooth: bluetooth {
+		compatible = "qcom,qcc2072-bt";
+		max-speed = <3200000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..c96c7f52ea7a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -288,3 +288,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 &wifi {
        status = "disabled";
 };
+
+&uart7 {
+	status = "disabled";
+};
-- 
2.34.1

