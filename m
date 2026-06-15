Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F526ED3D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519558; cv=none; b=C07SWznDlUSK/2Jprt4opOYArUo5s8p6XFQMVB5VP+G1+x03CPg9VU492tnPJDAjc/DlBVvVhu9PIz6U/YGSyRfCC/aojwNNzBH7QtpbKbExddU84VxQPXWrfszXMCqeBeq521CppIH6WWiOPMMI19HZPIkevzgvXzstOsS4Yw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519558; c=relaxed/simple;
	bh=5CS48o3NUE/p9tkz1ZXoPwHkU23aA9WjgEWkXpewHrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M9yDgM8sAF1EEOzM/Sy+iAFisvPJFszOLmakDLyxQPUlRdB8U05FjpsB/kMoz+t//U8+Ykb/vKnZF4yKMk61B9tg9Db9wnR2+53wOY0UPqwSWtPNjX18lFdMM4EtrRG9sKHdT1ms9fwrgOJejUoP+DCdcrn+n4TlNm1+HN2O6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAoRfxNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdkGKtBY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAoRfxNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdkGKtBY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAIdbu3813922
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3VLtpRKJqYk
	es1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=; b=CAoRfxNv+UkYGIlbCbZzzknqAcA
	MNH6riD3rGagg7aqRK3LgdVcG8xcUqSRzWQyxeMy1e7sXLpc8qBwZ+WYrSytfyce
	e/7JESW6Uwy4zzYVoqbMjK82mKLPDvChGc4aFb0XsL2Q73KXf99G/POgrTCfVub1
	DMlFEykYuMBVnDr9XYiKhbsCIrAtHw95YUb+VJvoLq0cgiGNW/g5L7h5H6DhC4iV
	c4DY4ICuGy6vhWCh1rwu/tpaZktjfs3yKBIe24fai0iHfuPgm0BZIr6Uoamy4yBZ
	zh56D0lS5z+wgPXmRIOZtL88JDkA7o4BJKN6jPxBsv0mdzkb3n/GFf35EDQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjr7vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:32:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ec2aaf5eso218170eec.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781519556; x=1782124356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VLtpRKJqYkes1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=;
        b=LdkGKtBYS2nxWj+fHvoMSJlhk61IMa2Y5QCHLouQHgp24pOBJvdZ/SnxT2FpkooJsE
         bw3wSP95G2TiE4sulHpYs9/itZp/P4Mp+36PJFuPJr48ZW09gBcqc+awU5lYuCQe8Yu7
         3Jw1Nm24x8+gtKfmQIrJaSE1j/ttLltw0LYxe8k2VI+uEgWmff7UizQvS4n2Gszw/WHd
         paJ3lyk7H9lWFkAyslnDz5QV5Tp5+KibWY1AjdZjOg+YYGzcaaYp9VOe6Mg51ZvbGQNf
         g8HAYbFF+GwwqwrGHC2fqki1PLcya80v7aPTvrM4D6AVemTMRZ4d9PX/eGCVawY+4xqp
         4n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781519556; x=1782124356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VLtpRKJqYkes1Jb1zMn3Spr8QKzWjGNJukQtiigmVM=;
        b=etxfFJJqrMCzE1FlVJNufljiiALlHAkrSBslR66jGjVT3G7y+gkx3S0H4pRZgkkQxi
         RdqHzUwxZIel+y5RgIaEUom/k4XjUzwXISvvSQj4oSs/6X3n5UGNul6u/V6ag+cga4NM
         Wvtc+hmRD9EQujLdBciuNNUq17D+e0ApRocA4WWCXV2AGbASKdt9iUnSUR1MIexzUGc8
         +1W4nthvsGC0GgdUHxxAPNOBiRomAGs9/e8kJqEP/S3B1G4HXNikqm84xLg6UaEMB9kV
         p4vFsAU2e7JsgLKIX0svnSDbppjzNtqfPJ7V5uSObyIVsaZVzl6lMjVG0taXlxGFdFgO
         +Yqg==
X-Forwarded-Encrypted: i=1; AFNElJ95PnXEDt44afKKdc7SNSOZRnGmdd2CVOdhKAbKwE7lfR+/QwzayCFouX+TX3GhuPXFWf/uzUxE4Xsx@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVst+l/cESe5k/exQ+FQfpTOvTt9r4zoHAv/GNJZUWJvFTNqx
	nLcyXJEVltPZ+3xcFpqONPu5q9oKV+DaB/JfKPVIHJh9IydShS9o6hwQES6apHmS5Zokpipocsy
	3KYr1qkB4xyWlBCNmDGM1Fc7HuQ+KqPewHhOi1JrDkvXX8MdRj8bre59zNr9/Gg4j
X-Gm-Gg: Acq92OFEKwPplVB2TTKMiQzHfmAv+xfhrhi2S6MLVT/5gTjORihgYQBhf1vNOk/a2uK
	w2h/g27iXWLNXQmpWoaek7h4q7c0pNtJlVPntDM5e2w9b0eU6hOr6ovLO0oLzPwxASWhj9i5YRZ
	eihA0A/vgzHue6tb3pFHr/4ZodWGUpDEkEG2yU1eYhrHOZGmTOE2kvcZdPxWotGL1K3UtYEH45s
	bOsCuyByzAtRAIPTZQv2FygGhUwBeONlL+7RimPQ6tECJ7hstm9m0l/dAGEuZVI8jq2YN2TeVVu
	dEHngxrgGSwGALNswnsJMeCOIcKHkahi0y6iixChmuDerwM2zkJFEL4v2CT01wOAPXzjX6CeGTC
	KrRcTXcNwYDUQrq+7wf6D17NGNsKJ3HC8zJg4nZ8xYCEBNetehueMIYyvHbQMK5qdvQ5Iio+G
X-Received: by 2002:a05:7300:7495:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-308200bcee7mr3676884eec.5.1781519555510;
        Mon, 15 Jun 2026 03:32:35 -0700 (PDT)
X-Received: by 2002:a05:7300:7495:b0:2d1:9b35:4f03 with SMTP id 5a478bee46e88-308200bcee7mr3676861eec.5.1781519554947;
        Mon, 15 Jun 2026 03:32:34 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea43b80sm13594502eec.21.2026.06.15.03.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:32:34 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
        bartosz.golaszewski@linaro.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 15 Jun 2026 16:02:28 +0530
Message-Id: <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfX+8UDVp1MF1Gs
 TgBhcBm+WjxddRFUrjSHq/M71ELY5f+he0iMcqO+k5Kqy1jv2hZOPYYiTjWk+QkVUQMvgz6YYNb
 Qapamp8c08MVcFGekEFaHMoNWgiozHPsfQE/x1xugcxR/30gD2EXjzFBYzN93m3fEJcBKKEZVa0
 uwMA2E6QDfad3CjjUmW9NAX4+DvVx5SYbpS59/nhD6soo3z7hRGQ4Mi6e9G5mgrKsAk+D2hiSed
 cq+KzsYd+OEQ74OlBSKm1lUEXceTMiUh9p3wurIo8orefJDbDXBGWmsrYIE5zQZ1vAQ35BI0QMZ
 kjiaQ4mufY2Be4N5vseltetOillwg3f3rrlZHrq3JEbRBkilSYc43Dyi0FzJHX9gX+lrETPAXv9
 4Z1LW99IyVgfjHtrqKdldZ4sIUs7+oRSMs1/Soc0bO8oF23NPi1kHreZ2Hb3/e0LF2/bWynd8HN
 FreydLJ4udQORqzaLBQ==
X-Proofpoint-ORIG-GUID: fKARMnwcVXXc6Gml2a0XdYoXFc436TGT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMCBTYWx0ZWRfX7s82KQoiAolm
 7Im69qrOR580S3lF8EjDfadzIiAILiX4Dxs5HPjfzKJGdKlPyYQJQWJARZDjDvTuAVIL7PIj9+7
 M3yfrWJDWdQ/OUjhxTPVukZJ9fqqgQI=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fd4c4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dne0pE14ni_oFMc-94oA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fKARMnwcVXXc6Gml2a0XdYoXFc436TGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150110

The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART17 nodes through graph port/endpoint.

Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
lemans.dtsi to allow the PCI subsystem to associate the DT node with
the PCI-to-PCI bridge device.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart17 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART17 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Collected Reviewed-by tag and reorganized the patch

Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 34dfc8d22b6a..b2967cb53760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial1 = &uart17;
 		serial2 = &uart0;
 	};
 
@@ -88,6 +89,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
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
+					remote-endpoint = <&pcieport0_ep>;
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
+					remote-endpoint = <&uart17_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -178,6 +211,17 @@ vmmc_sdc: regulator-vmmc-sdc {
 		regulator-max-microvolt = <2950000>;
 	};
 
+	vreg_dcin_12v: regulator-dcin-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DCIN_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_sdc: regulator-vreg-sdc {
 		compatible = "regulator-gpio";
 
@@ -191,6 +235,19 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_dcin_12v>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -742,6 +799,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
 &pmm8654au_0_pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -970,6 +1035,16 @@ &uart10 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	port {
+		uart17_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l8a>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..9afd6e8ebcdb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2779,6 +2779,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.34.1

