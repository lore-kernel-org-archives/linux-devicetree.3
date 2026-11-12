Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472471;
	b=TX5+3RqWV+j2BUOOdtNikkPXP7Pq/PQv13GjwG5EzJwa+NW5a5e7teGGwtjW6CBue4Iu
	 vAyOEKm0WfRJllUmW7HhebbvH38J85JRpoPZG2QprKXZIh5xWIVUIGfYeXdKVDwedAQuP
	 KqeqayQ31niuGLrh7EoDBwqJjhMZ0Tgu25wsLJMWeJd1uJbs8TZOY9sgiFK/5OHYoTT8X
	 1x2CjeFkS57wd0xka2Xl+YtNCW4Sk+GQLWv6Yjv0WIzrQATFtZxmIozV/m7qNHDznswpl
	 MfG9tftA9/kNJ/XV8C0tgD4pTxyfR7k6C7W+U4+UQuxWCKDxmfty51KbJKOWaZTQEKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
	b=LBdjnOsXl3d32qKElJEPMKgWkn5PWjVO1ur9UggMc2bAilRwpgDGumHKAXcMuEvHHSZp
	 qMJnOMAV8wqrDrG+c1oIuWYk6dvur/2We/049uj9ZmWhQafIBaYHMiztCsa253JIYYRam
	 ylW/3D2WB47iwumY0Pgmmcc5pWedme4KGVMqIFIN73A+3ClClZJIjtEhkX4HRE7mC+nJz
	 MGIPKRhLfV57WKAl/3IIgtXdoJmV+yE1zYoUM4yT5tAkGV25ler6wL+lSiHEsGbEAsP9E
	 yur/DxSzl1oZgRm2UHf5S6BRdATNduloNjPL5TiXtmjFAtNvG6zHbxqfbWNNYQJj1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGZQS42u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1F17MXX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB5D606B262
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB5D606B262
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGZQS42u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1F17MXX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4lujw3893074
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+dBN3BYwT/A
	wSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=; b=QGZQS42uWHioF6dGt1+XkHDpseT
	lJX98lsKWrgr4tRp4jzfobSkUtRQRtBnCTStpXVYFJkRkIiJBsnJSTnCcS8Ag724
	unc48SkCGDnJAam4phJFC+PmrMbPCe9tVHwDhL7nSyCK0DSOmoynMCdNt1eq6DCV
	yY9neCiO98h0waKcQ6FSLMedBElpGHyj2BFtQFviySvoMdAB1UbTaaWZJBSlgmBo
	XECUZLAS3bD50xW5/zJTjFm/29jeHHkJaVHn3VUxqEZX999yuQSL5anjFIBGfc91
	nLQx8QNtQ4w9GOYkeIZT1msDOLYOjFzy8E4H/ZpxDKMEMG9Xhx7T2uxpXmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0rc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eacd065b5eso2177685ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472469; x=1795077269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
        b=R1F17MXXgG3nT8ErGUDcbARCVCb3xVysalxkbxVvnpBlPsQ/DoQd2OtzYLZ8fZtZSI
         9TivwwYK3GrK9QZTp0UU6RRqM86r5vHk6LK/gSl/CatRkim9/5O1WTE9e+70XCBLC/rs
         I3tdWtejrfx5BXXLslLdywH91FmklFdPM0tZpj873h6E0VC4QTmnFuncY2/z75//KZMu
         tms6JZU2ZF0VD6TBuWdPAC9EnOQXnql4TkKUYZUmMmL5IWpT9g9xyzSHNRpL5s/V8fkT
         s9qNhrIgGDyd5CqnJrxeXvWx3px6F7QvFaFJrI6PYdYGeEBfcEzxVjRbNiyioIEhFnTL
         bh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472469; x=1795077269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
        b=bxpS1wHVdfHXniIl8t1HNrXnz0BMD+XJI2ETaEhR8DLA8Y9OnkXz3XE5ywQMP7FBnL
         LLJTufDb4quBeRuqlJ2sGnO9q2IqwgqkJ3h1gXljvxqRTiK/qkvqwPKlf1FzFVGa9/7L
         WtJo+UdcOB4kazFkXdXX8NHn89yQa90wOwlH2ZXcMBh+ilZ/guiU9DjsJ/4mBCPkS7Gw
         uZxbleWmRYtuv1xaXtLHBsL8C/IT8sJoDZSeu54r9iMrFNPxWIBv9V4V9BgoFakFC6om
         a0C77ZXti90vGvBYWFSwIxjzgEUeWEI7Fvs8g6dzi7jNfoCWmCockvmIdCTjKxHnWcFG
         Wm2Q==
X-Forwarded-Encrypted: i=1; AL+hErHHetx8+38jQF57F5CttVOSAAKceB8dujlnIEjZeHMgWD16r71gScSKyGXdbNA+yFvx0dSGsZjaMNY/@vger.kernel.org
X-Gm-Message-State: APuU4Z+4MBstEhcnST1qRtifd3oUaZIk1rvfupVEIi9Ql68EkAkqT4Ov
	/3esY5ZPLBOqKUoGeZU5VBvugSdgL8IGOC+uXMzteRCaLko3PgobOqTND8T/kD9oaLr7iYm4sg4
	3fE3vWj2C8p9uc+J6LwW/X6fTfIGW2rscdlOWE++Q0XUAeSH/Lmcv0RAko0frj6UJ
X-Gm-Gg: AYBFou2PdpCJrHbF/gAYp4D5utQ068TkL7veBofBle0UkKYbNtOtls0sT5ngWgEpd7l
	vGpCjGWAeuUybO982GPF31524u4nTe4A2yLWJqic9d1hMu+y+qd/LbfznGFAia6v6j5VGWybJO8
	qVBfeVTSbd8h518sXDi58cHQCkLJ4BCiKyVwi8zFRvIEEZ4sQ8NAXH/SlDfWJq3LhqYLzgYsBZe
	ppwuaZoIISmhBQ3Ty7gR1PfgMnYiABEvRStvEnT0iBWb9Pcl0VBBIRCUiCmr3dVF+cDQGxeVjTT
	ecdz4dSZUW4jNLuyhw8TGkJ6eCjUCHseKi0W0TVarX68dlZsTu4ywCXL1E4s8i6iSk04PyzvsKT
	VJJmqdLerjTL2R/3rLMntsmSB6irwhYpe8vdnEaWDPns52imYuXATyZmnUiK5xCUqqtb8CmCC9h
	bKpA==
X-Received: by 2002:a17:903:3bd0:b0:2ed:203e:864e with SMTP id d9443c01a7336-2edd7451addmr81294855ad.1.1794472469517;
        Thu, 12 Nov 2026 00:34:29 -0800 (PST)
X-Received: by 2002:a17:903:3bd0:b0:2ed:203e:864e with SMTP id d9443c01a7336-2edd7451addmr81294505ad.1.1794472469056;
        Thu, 12 Nov 2026 00:34:29 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:28 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Thu, 12 Nov 2026 16:33:55 +0800
Message-ID: <20261112083355.3884737-5-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k2L8dv3F8KR4rTY3jpYjyZkCIK0aa_MP
X-Proofpoint-GUID: k2L8dv3F8KR4rTY3jpYjyZkCIK0aa_MP
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af57a16 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fwK-b8I7k3kQTYbNoNcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX34o94QMfvioB
 JenyMcqmI6OrsgDRfbv/TCn2h/Q9/d5HTEZLyuR5y1zn59IFqm/NDDFbMYhbLSTzEFpY9sQQikc
 lJ6o7q/R5WxlR7hxu7IWIoeO/n48wzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwAAxB0xUSZXY
 YJ8cfiE+T6MAdK2x98CHYFbfaxbA44mD4OycOSV5wJZD4NzDOqgoL3WKJGHIWxKhWj7gyHdABM8
 D3J23vil3tHuHF2WP0OO51Y6km41MnlJrrIcPjzhMUQmyJRVEFGY0b49NrJOBhAKDYXjgCfRKyW
 KhPUpKsucLwgjmcy1X/tpulP21SN2IANECaek7z1+VpV0orEnrBgxtnuQUENIZYNYmj1qk//miA
 8HaAYr+10eHCLFmvHPlbT3PQTUkpoHYs8cbqBwUqff0y2tCBAyp2dTObnj4bMaDMtrpm8uIK2ZX
 ibhFx/42dhw1AQP1a5QCXcDIXyB1Smmxtg98I7GbHLVrUfEMMbaPX9OIGk6dLYLiRG7a8M7t6wr
 E3lUNPF1J0C4QaGEQsZLjjNA9bcWlhiuBM3bGYVgnSYHeb4+MFv3ITLD9sCmn7nNBszQ5uIBFj7
 PI/OuxnHc1mFjkkCZRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the
Qualcomm Shikra IQS EVK.

The Shikra product design supports either the onboard Apache WCN3988
path or the M.2 HSP Cologne path at a time. The overlay describes the
board after hardware rework selects the M.2 path. Disable the inherited
onboard Wi-Fi and Bluetooth nodes when this overlay is selected.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

The series has been validated on Shikra hardware.

Link: https://lore.kernel.org/r/20261102045815.2938940-1-linghui.wu@oss.qualcomm.com
Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 122 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..037dbe8a39ce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -410,10 +410,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-m2-wifi-bt-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..ef0f197a53f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,122 @@
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
+		gpio = <&expander3 6 GPIO_ACTIVE_HIGH>;
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
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&pm8150_l12>;
+	vdda-pll-supply = <&pm8150_l9>;
+
+	status = "okay";
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
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio117";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio119";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0

