Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E638DC7B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642427; cv=none; b=X4oQQyBTde7xtFt6/IEbefmRr/Idsmkcl4K8B89WfgDlqrHIWatNYLrti0mewPZRxHFr08fKJRIawMS1KbpIC5E1l5G3b76SZjIq7weW2068X8d65R3O6MOeveRghO+PRDTWomejwTLiNStvXTvmAWOG7P+mz7pN4C5Z3jPlthA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642427; c=relaxed/simple;
	bh=ozr6jJHNW4AQjukXGrFSF3vNo012BbJj6dwNTaMFLo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UmJ7PsVILrMleh1j68E5vS++JReqQftYKMTIKJzoqUhjEhU8MM7DuEwxFkDyso4BkHPnjUBdDXa2lkXw/5ps6NUcasSwU7RumL3GcgIRoD2/XENYr4qsdBTRelgN2g0gPS8idDB4rogKdtSVk3Nb5ZX1Vmx7TgOE3zxjUfD8Pto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oG6IRTIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaGJ0xFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oG6IRTIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaGJ0xFq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DH8IcZ3052536
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=; b=oG6IRTIMvDHb29lN
	qkVo+tnFGqsDSV5iKPOFn1c6ZQ9OHJuSIqBD7PZ6em0Gw9jVPSrIFxAqSHTWfSAD
	1rg2fOy4atnd7dDtpJNIDGn9EdIS340+ZphrgDuKYvFC/jqpeCO21G4arjguHI0D
	mlD8+HWcb0GXkm2zCntxhaqQRzef+8PblgkAB8e9bYnvPQQy3abWrcFUl6st4Inx
	MG3xaajC6xOXNdYBIPLdbSWHIRLKDYovahTpNI8cxesTXl1nnHwrRlGBIe7c3EvB
	+o9mqbicXxKslFpx6FuCmYJcwWnQxZqddbUCXi7HtBFGqrQe4fOIcEi3d11pNREo
	/6yUxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f03t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3809cc5dcccso15476a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642424; x=1787247224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=;
        b=MaGJ0xFqsz62/Z0ulxDlAtIMJ+Us9Th8s4dcm3wIZ74+bEWsO+Jp5ulKO2taSv0QMh
         YMysN5/YkFqCgqV66B5ghyvJbAgPVd/9hLAolZBBPwnoSsioIr+6rAhne3ZOulqQCWot
         EBKp4FbpbQxjUu3dh4by90RkgOcusfEOvjg1wekIG0IkkS9+YoXws5RtK1coEZvzGaYC
         8MbW626aSYGpurD1ICGNkSw9hJC2BQxLlUAt0mO3cBN656F3xTWq1ohNh7LDb9mqTIwz
         CXnGTxaJ1IgUvBHNmBB1TgiafqKDpa6exu4f9ZFNcbej80vncxhhtNh2jKlo3bzetdIu
         q4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642424; x=1787247224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU1YA3HJfX2gEXKNr2es23LDHUOXmyQnl5DasTgwhmM=;
        b=EswSEyFEw1R412CRUwvXAhe4Grwr9bDOD9nEL3n1Jc+N3epB63/ouFL53lsXC7co8O
         BNlTDJDp7V31VTn/itEd00JefUskcz1DkDgvv1KqR9drAUueYaieHKKKKA+At3WYmjq7
         RX0Uoe0kxCVzS/I3z7wSM3kkUubAKRMaaYWgCFAf/FV6RXxGhvVQ/CCKqaitztErg0Sf
         c9rkp4kNPXl3CEo2LtY9Mfq5iCNg6R4obAmvLgPz7yGi/W0IEus3z88Jvvnu7aFaBsGQ
         2i6G2bA0MiQxz+pd2oEeI+5IXWXrA51jCg2JYXhICLrY0JcVZnT6eT31PbUr5QGUQcuY
         bETw==
X-Forwarded-Encrypted: i=1; AHgh+RpeyOJbUi35aFwGvWEUj1ix+giX29xzkgKEUzwO75AUtt36SbJ551TLERvCC6O4UxTYT+7TdnOLLO3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxPua5JltroJklCnCRJjRem1Jn/pUv+pNjwmWFpSDuKakuZkbkH
	+KRCNp9xUVB9m6dA1qTFbVuMj91T9uu9JcrLwmKrxnnSF6g+PO7zTVkeuGLUJUYNXxsHQl/pndo
	8r5zXVcHRIASrlWRQlZ9W8TMI66S4FrvTLhVQl9ohDPcQ6d7rJIO6ymH4N0SOMniM
X-Gm-Gg: AR+sD12RUYlGqaUkULSsDC529wHkbwTEyGBBi5PgnOKgC+rxpZwUzxqlUvl5X+qP0vJ
	VWjOTj0Nbaf6ttqsHvr6jSGjr+pZiH6/B7CG0YXAApWjuSDtPutxuxrO2RJevkQhjhxlUk6q6Ff
	3hwkUFNUAdhupdW3DAbyOd6/E9k56moMJNDd82hR9kx4Qiq5XtXGIHy3FfXnNPwe4ua2TXCvCi1
	/b84k/HeCzjoad8RXI93C86v5fbBR7htN86oo72K2lxbs/S0J/JvVoxHT5FrPQPFzjWTU1l3S8r
	Fk2ArWCzDOThaFoGvmv6jasjspXTNmq8ETdt3tGJp9rXBWtSXfuHtiFdB1GyQZyIzYF9BpeAJPp
	oIBSVjpKhPa+OHS/jyQtAR7rk0ECQg2n3dW8/EzpUOJoJsj+pylyIWtlegMaTs9Pm6IwkWvGpDJ
	CQRAXDx7R4eAD8TiUfjztV
X-Received: by 2002:a17:90b:582d:b0:38f:57f0:1f51 with SMTP id 98e67ed59e1d1-393230b1d93mr4973108a91.0.1786642424355;
        Thu, 13 Aug 2026 10:33:44 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:38f:57f0:1f51 with SMTP id 98e67ed59e1d1-393230b1d93mr4972697a91.0.1786642419155;
        Thu, 13 Aug 2026 10:33:39 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 23:03:22 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-lvds-support-v2-3-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642403; l=4397;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=ozr6jJHNW4AQjukXGrFSF3vNo012BbJj6dwNTaMFLo4=;
 b=aIKL02GPeoRi4mjHZAdRbyTslIxfR8VgK0skfcnLy37LNCONZXv95QC24bFIVxIP/POAr/WT2
 UJbCOHp6mUIB//PbX8r9QmfzU0e6fXO8T1sJcAKtsq8OoT/EUTqxWfH
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7dfff9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iyE8_RcjCA9vqETsuM8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: kbsLLyGjBdOQAQUv7bbUEL3xntS3rGeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfXxnHexoqLCJbg
 Zbk7QM+uXP64RkBFmJhYX3L1cOIvrjV4/5Xl2fpdnBbg05qGT65EEzEn/KEjyjGLwBjrvapBofZ
 u9OPE8gXUt4XkWMg8Lj0jP77hzjP8PvBB6FF4P+7lKyxJ3+ql8VrbLYHswvLugwba1V5tnAr4KB
 RPsATwg4DG0H3RliRPOG4IvRYujUhJPePGaXP/4hOmQupPDAtD4omECzYT80YGozklW8VIKAPfZ
 l+S30O1a8COc+fBwo5P22i90v/YO7+7dyh275Zo07f9S/yYRduz8pe2TFJ1SaYeTo//wsDOydRW
 rxVMmQ/zuFBcd95Ag9JC3D2z1wONoxsIPSA48e8yFZzLY/dD8SdNilQfhfGwORsxG8SS2XChURr
 iiu5LGGvAu+iBR5KWrRVkJwvYNE4CYDruILC4XIVa2LVe0H5dPXwxqQ7z4cFB8YfDaR6yMcPbk3
 VMQvOk85Lh6/EzCCHRA==
X-Proofpoint-ORIG-GUID: kbsLLyGjBdOQAQUv7bbUEL3xntS3rGeY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX5aaHib+tcQ0K
 fIRmIjKJD+h7FsPC2j2yIQTh99UgbwZD+NiUyyKnM/uNet33jSITLvovCHOoelTKfXcl/QthK0t
 lgnXFrKpHJMB0N7tw8s+r+8ntGxN5Hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130126

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for the boe,dv215fhm-r01 panel, matched
against the panel-simple-lvds-dual-ports binding which supplies the
panel's size and timing internally.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   6 ++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 105 +++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 85ee28d8f109..8b147cbc0e1e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -189,6 +189,12 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := \
+	qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo \
+	qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..8e60b8631169
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&vreg_l18b_1p8>;
+        };
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l18b_1p8>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+

-- 
2.34.1

