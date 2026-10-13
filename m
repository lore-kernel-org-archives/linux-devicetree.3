Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A147DD6D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867340; cv=none; b=ZWuCZiej6d02pMJ3+XymIM4LBgflOzCcXkgJCKg1/RTY8ROnTA/YqOPWH8SNAIF9Wu1MU+wlkUXHrACy/zt7XJNzQhuDIRHd9HyV/Cqvr/VrtdzaPR3wh+4kHX7EdOcwUaeOh45IEOdLL7sdY87pMzx6eDEGmplrXdgsdIGqcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867340; c=relaxed/simple;
	bh=5dkfnnJD51SeeZaegEhThVSljf33cHQpicyTq/Loa1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+qBEAQtcndhmI8qnUI2jVBrZaMpmvO7+ic3hRTXWI5hQ4VcI0njnH77T2OWuT4T4N0Wk0l7FN8dtl4mVCkvNnwGcrdn7UVVKc+trPzzUyFv4q6IWm8rdq9i/S1sFXn/YUjs8XFeMbAPNioSvGbCgTOvqihePjnZUtc0+TRhMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDUPIe8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFMCjyVZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDUPIe8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFMCjyVZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21Mgv3509558
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5I98+ngzky6
	+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=; b=jDUPIe8SBUcf09Lmim2C7NxL0NS
	rUm58lnbqbNj9JcvbQtqc2nGTYGpnWrRbIOdkPPUCAozxLU8Af5ExvaoQDU0+1UH
	AphMdBXZ3k/hU1iJoLtHIOdC6iQEFJ5JH7o7jT/LZZVefBeLHgt3lJKDYw45blLq
	IFk2xX1dkZtYT3i7cTsT4D0m7txjtf4KiEj05HpTUF+aQBD03gb4QXKq6wb/04WS
	YR8Of6vzncX1GYlgG2GP7TqNdNff0NoSq3//a7GFD8nD9/51Hm6jTOQE/L7rSjDV
	rkwm9URdYA+Fcmt5t3E9gGB/0K04zZDC41ZWLyO/e/r4T6knO9UYNfdpUxQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4a6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7a44ae2f5so448794a12.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791867337; x=1792472137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I98+ngzky6+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=;
        b=jFMCjyVZbgmSuguiDq5sMeIrtcDGUthMctZuiv24LmDNRqpvePUUDhx+U1Nw1OWh0v
         vSfJfg2fMRe3njpTnVJH+Xp0GK3E9gXprYRBVx+DHTYHP7SVMLdY4Sku1jOXgfGt0z70
         0DhShphpbunc4aGzDV+Tqopps3tNqLUojUzpSix73/ywdxeV+DNyVxvgYOkKHUVzYjNs
         MU9L9G6GsMVjgjjt/JOLRj0pFUowI8M22GmRCWIoZ+HHqeP7n+6u+stz3fXkqG0fxmRI
         qc58Fc32IdTAxhv0BDYzMRB62LwyX2TvnhOrSoU8b2VzP3wH9ZZNF8EcDS1hMUrjxU0+
         EWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867337; x=1792472137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I98+ngzky6+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=;
        b=ZVALxR7F4uzT7FB4wYEQpnxbI69OnrT0B1iZ63SoLhIVLQTGynN40E8X2XYodZXTBT
         i0xFiRaP1Pn5qnT5jDzVYqUY+OiLftPEYgF3qu+tp6upd1CbzcPvzCYFVSHAX7pZ8OEY
         Upe5igJjoPyiK/7i1OB6+jQbohuKVjAjAGErY7SpC0lh/DLyRlLUvKuDTa+GFuCXG65g
         3FCfKvzJOgwDjpg/iVzqqzFf33djVbP9EbwxUMQGYO74b774MBQ3VRNu2A2XZ83kjHRt
         +bRl7rWCZcMxPpXe2sLNIRl1eN09vHILrw6Zgo4gKrMqHDkdPuiSkFQXpKRkXIVJ/KAH
         K7OA==
X-Forwarded-Encrypted: i=1; AKwUvBwuOPvPJfFZfOBZC7CoCQ7aR9l43aLKM+YMfKLeKWVF3wZNGPd3v2rAag/PCTOp99yGUr2QfLV0JHhp@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ1+F41PmW9eEGT62ft2GsjqTInk4OTWY1KrveE/yJs0Pq/ZBP
	n3sruDCGB+rffc7Ygvl4Co4219Nymm130zOqLtBz6cLAWH6ufCfubCJHZNNnzT/0iUIzEv7IYBL
	PNPN+Hd2oa1Nm2jWyA02uhxQ3OkK2UrIeqvOtR4KuW9SPDLyjU/J9/F1b0W2DYzAX
X-Gm-Gg: AYBFou1Pqm1o3LFU8fCgsNg22dSlrjh81jMgbbzpGIKaURM/zF0B30CUH9KDUioHEgJ
	0WqnQGKKudo/o9fSLQJZ9sJoy7UUIs/DqeUSTShx2DZ4ZdokWTt0LCVlI+MUcoxHPWQmwjg+4KD
	lyoyIklsqqwBTZzo/Hyxu+sJJwtDIONdtdbjjc+0kVIMODrpeES2ztNiSrfrph0TD4vcHlFYvOC
	+SbZNGnlfrlw6sEqm1/WAhC4t3Hh2yOtCaGvk3g5wDohYjfxr65Vs8Od767ZbggNxZaoOf2A1Jj
	xqXVD1jqo3Sp5uMFHfeQwdDvweJj3a50KqH8IssujjTC8u3QBQrFAjeUDCdqlK6xVgmGOoR44DA
	eIiJDYGSNWKxXsXVTTtsNV4qw8EPK
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr14421860637.2.1791867337416;
        Mon, 12 Oct 2026 21:55:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr14421824637.2.1791867336842;
        Mon, 12 Oct 2026 21:55:36 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-899b738d03bsm2438382b3a.41.2026.10.12.21.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:55:36 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Tue, 13 Oct 2026 12:55:27 +0800
Message-ID: <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxOSBTYWx0ZWRfX2yttL9bZ1IYY
 dBiTCAdZWxVF2h3jOHXKirzv2qPdMKaFHdnGqS2LaVTaQz4j6zJfHyBDWduenwQBcKMJIyRbCUU
 j0sQnHF4qMwd/zG4vV5crjGrR5enpAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxOSBTYWx0ZWRfX4ARJBid0VPfD
 Oy5hg0Gd2cPq5YyDWGPZQ7XiOPXB2e06a1fF+HbLnW5rIYgrkscMkbCEtC2aHMcQD09CDnUf/ZO
 pIdTF32YPaPVbuQC17DTUpkWO/CNph8zfHOstduHvzMbTpqWUlXun87u1EsyrJQT608etvixlZU
 On+UG6eD61kF6ytfOXxMMaWsv7KYArFGMEFnDR0w3SpQ+IchflFuSzH/hZwOXPkRaEGCGcpRUbV
 L/uz7Eg/AeNFadnirhnpoAwfiHpdkzSO24JZoa2gVwdItLwDboDmq3lmWBnO8I9VY9gmeNZqeN/
 E+yWQ3KNdWGIYgSfPWzoEetnjQXvUFpuTQ4ZAsw+mxonkcLkG62QbXq6przPVFbqYWYE5/W3BDl
 i7nX3vAsaVYBXN8INyKePZkFpNjv/nZGicph32fTMdrLwTbS2HNDEY6DE6VCoNIvz+pSmXgsoxP
 yRl3On0pm/TQRg12PNg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdb9ca cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HwT7i5cL4_BIIXZyjbQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: wQQ6oSe2D3CGI6kg1pFBvi0NuyUGRxpu
X-Proofpoint-GUID: wQQ6oSe2D3CGI6kg1pFBvi0NuyUGRxpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130019

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
Shikra IQS EVK.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal. Disable
the onboard Wi-Fi and Bluetooth nodes when the overlay is selected.

The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
module. The overlay was applied, the link trained at Gen2 x1 and the
endpoint enumerated. Bluetooth UART and HCI runtime validation is
pending.

Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
Changes in v2:
- Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..799faa32e2d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..9496c6558eef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&{/wcn3988-pmu} {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0
