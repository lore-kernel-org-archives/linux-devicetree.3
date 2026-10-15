Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61340963A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055743; cv=none; b=ZxSzZYVOdcLgtPHdoMb6HcqYEEPCTRhP6DA0W9hOLSeysHbdGlxV8EYqLMPOILWB65bOq5Xh/3XE8yZZZqbCZC8GFqjz24q94CXu3unW0ggDrm8XMlGhIBGawlYA0IX7SRJaQYHhdLwHcPYD/QfsOcW8uSWCmOzWTUYoUOUV6RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055743; c=relaxed/simple;
	bh=yikeYPp7xGRz6kX8ppNzHdYYDPdTK+F+8JMGmBs2Wm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIEpduuuSz6ilgGOCqQxDRLqwiSXAhjYif1lYEkwhHAzFQWWOANhFnXpGKP9Re4hPBUGHIjUZ6A3TkYoBlDUg5yQSWw4IQUZ9cS3ZalGfeBheAQVhLJPA8oN80wFAqB4pRwAXX6f9fITz52h1mcjOT6Alu5W3nYypS80TpPxN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcxYoqQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpr9HDZr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcxYoqQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpr9HDZr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F90v0W1640657
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=; b=RcxYoqQhwpkUezVM
	JbS5m0rS7NVHsRSx1cNm/bTXs4RW80IqbJflFe3VSOtycJi+bWaOcnnktbCPohw7
	uOEWM0Up8ahNnvHUS+vytOMDlncUANIthszfCm+hJLk7P6316auHExT/XO2xWtfC
	ulNOJes0lU/YRF8FBqWNfngAAijgAH/GZ11TljkezAGW88ucdm66JrILRnRZkSlG
	NbOfVpz5bFPzXi/rL0kx6X3gFDKl1JziLRnuX9ZGZJfGKhNOYBho4s/3eb5MewFD
	G7pW0kZI0eDsxCwUIEv5PEZF6qZDVG/FD1LxtmA++5YLBlLHi4AZJ2vKJhT0GbiA
	cBxbpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhh8rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso465569eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055740; x=1792660540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=;
        b=gpr9HDZrUGQRbQWCGkVzXgEh4RzybAvFtNCaEBPgCR7piAFc/CxwEXoPVf4PtQj0Qm
         UFVobMsE0kaiZ3ss3FEJvidpxBbDm6CF10VuN428DXska3DCH1e1EZYV2n8fI2uzyNYn
         HYgt9zKjS996x8YYQhz9mN5hP64WBnT94hjhsO9B5Lylts1s2sttaXsMCQPu1c7Pnrcp
         S7jxnpd5mKI+qNKeJmIFf2QLhPlHPgHcZUmpnBLm4wkQlXkUcCLoiit+9bBQ5P+ezts0
         SWL7hgHFogj3DzaWfZn5TrXi0pv2+n/cqSeL/HPU9gNWDpw3Zv1keJxJdFBweAfIqiQP
         QOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055740; x=1792660540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt5thQ9d9o5LKc+1zK1KdemDthUAS1s+ckxThk86NLo=;
        b=h+cGcQtHI/2Rq/U66MZNN/nOhi9TnSQKfQfU3jQZhaPvUeDyk5SBfU+wSrIcACX4uc
         8fPQmT76uqSWLO7x+TeSRbQKfIEHT9CZWfIATtfJL4/JLMpkC0eDbF2FBCOAfm8SRdcv
         B3kk73K3bnaPUWVqxqi5ezPxxn/eOFCwVLME/xQN9U7CHwGSTC3a/eYLLn5JaG15ZIdD
         uPHUJOkZuanK0uiPVh1aYyynba61tKSEYn8jps52ViCbhFVJb5tX9t7l7Mqg8+9KnxyG
         V2KvzgAVuBlc3dLPl4qDX3VpBF7ubsfYebn655KFQ9ijV/dWazvKgJafMS+ruSjgQZqR
         nCkw==
X-Forwarded-Encrypted: i=1; AKwUvByFid9S2k2IfcMWSdPXKOtL0/lqBukCnq9x6l1rUmaN9DAXj/mOyWtFLfs774AuylSghckTqcRIjTHX@vger.kernel.org
X-Gm-Message-State: AFq9FYLjrifyQOxMs9ZhFPUVPKOUbDIgpJV/mq3YkPxbZQL1KHzALP0R
	E57pt2CFWSbWjD3lYVgTbjzUUM7v08sEdpeHmITmC6qcEf3vzQzCYiDOjCgNN5kneloAC6PUX4H
	g7ueD1NnToD5us8dS3NOWAFLSzf+N99HRYqzI9naopP7cynInKqVMpguYvIMH5ERR
X-Gm-Gg: AYBFou0ZNN8CejMabDVmkviowNPxKndtb/UNgndkUoHCUy5/EtMlFfDkPzdd8x9oc+P
	WIaA20Q5JVxL0UBB3MeRVV+1RC9v3vnM86nUOlpoHrmtjTftT+bt1Si4fIw/dOU2LK0KdQtAlUA
	5samtKNZle+CcxpGZLfQ5cH7L5xefejP9npemZKHX1NrN34IvLSP64cFZ80tS31jFoQDmVylYOR
	/o8LA7kZr8kXuiucOngwXmL5Rw+lJ4MIdY+6v/gBE+Ee/7W/t0pekiTttitu9vr/pMtxHHYbmHz
	+4zxQleau/Jc891YxirhVZa2BPl/eFpR6gWI3/1byCjXezusm9AjeJYph5ZwLM+pcoCUqG+gmUp
	AZaEgVkHYOet+MHJMzWfoyXuw+A==
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr27217341c88.14.1792055739849;
        Thu, 15 Oct 2026 02:15:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr27217315c88.14.1792055739302;
        Thu, 15 Oct 2026 02:15:39 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:39 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:45:28 +0530
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=3629;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=yikeYPp7xGRz6kX8ppNzHdYYDPdTK+F+8JMGmBs2Wm0=;
 b=OAsOfCqUiHaJp6H5mVJca/rgpCTRg4+FriWGZm+B2LKe+vQxfgIt+keQVGLrcjSYiZvUimF8h
 Mffi1nN8+doCwi7jOskL3gFC9erRYhf6mB8X/O8swEeLrpfiFKYQRnM
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX9pu+23VMG5o4
 LvkDlg0NlfwdWIy3Au8KWjMaIpwqdy/XcclmUzgG6Ui7ZhIaxicOs8+qDeYbCI63IrXeabKxW0D
 a44nXnrWGTb6xThbNgzsZ05wXpWLpWRYyNXe78Po4wXFkwuE7K6HTop/ZrKnsDdhiXPyptf8PAS
 8wECwCk2hqUtYwdGNvGYgT4brZjYpXXm4RLMjT/3qBUhHw7NCOocgqs/Y6QBeiECa9KBu2GAHaQ
 SQ3n+LGqFIgXWarat1mmxTLb5FGU8U2Mo3E/HuS+WJk5q1TtXHzo4WaUiBABMnpMs49sK/Fxlii
 XvfLY1MYdqHpv8WEZMSr2xrpXTgJvG8BJhGGcWSbWHIbhXUgUXwfzU7nV6m+i/e/WShgNccDxMZ
 /27yAws7K8GiXJ/W4/ujpdxUVlPJV/ZgInfPBvn405wIq2TdQpkpx5PQGFdeCx5nglfzoCyRKJg
 9rYuhEfhOTVIeZeUIwA==
X-Proofpoint-GUID: pPeeQtTL1kCBxY674ZF92-oYSjUamPog
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad099bc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX72k/Hxf+JJTr
 tSIF5wSouCSdu485jnaiFDn8GHx+QIPa5Dttjv9srcimB37Wd5Z/rtO7iCqxtnAWExVLScGw8yM
 ngtmquPvZCagpBFVKYCyFjTOaEqVpm0=
X-Proofpoint-ORIG-GUID: pPeeQtTL1kCBxY674ZF92-oYSjUamPog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Regulator and pinctrl labels use generic board-level names
(vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
from the bridge chip.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..996f645a3628 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -8,6 +8,7 @@
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -23,6 +24,98 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&pm8150_s4>;
+
+		pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_dsi_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&bridge_dsi_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -67,6 +160,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;

-- 
2.34.1

