Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13E3CC7EB
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749928; cv=none; b=KHKPu+iNJcn7K9MTMo0V5i/PH/fjGDw+pcJVXr7j6h/PSHKVo80KzyoRGhd3Hnno1OKt3Gt7pIPvl3NGrXJVuxASvdc4eo4rZq4v4whGSaM2qQ6lUTlqETNctPERkL4R9PlSt/No23C7Q8VgbIXHjyxXH7Qcj513Tj2Goxu4Wx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749928; c=relaxed/simple;
	bh=w0IgUTJpexU2mo803F58SI8x9GoeAzh/7aoCONuqABE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maJrsPXXn1i0i60QuVKfYKwZkJmy//XYkNXbfTRQYHdTAlE1dKhTSWTS+t80ryyMA/P1vHPETC9nBidSC4B6QeU9hqdfufgGtzZjcrOj42LNDAWE4yk6ACbk2ca+OGGR5iPplGdwma33OQ+UXtcXImdPbAX9FAkgEX3jHDkUC6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd0Swesm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjvWgdXn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd0Swesm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjvWgdXn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VhF21887832
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pClJae28EhWNFQM4d7Hy2thzB6SHofZb7x+ATa3AnqA=; b=Gd0SwesmZKTKdMU7
	i3s2B4KqnEH7CZ+gsRtyvvO/pKqu5jXQGSW1X9WKnnP4ZawGpI7C/Wx2aPY0P0oT
	cZIV8hGvO2Fk4UGlCh+zxIv/c3shagGI6Lr5QJwamVb3FQ17x93TqdFT9OJzzA3D
	P6COeaH/cNa5KCrmrl0y6KNXyQBkK69C2EsuS4tGjTYGmyiqU8BqhvO1nCmSz8KL
	/W7ozb9QjNOWSACqtoJd0JHGyRzte+7DTYiCH+JrvSEejWLdImrxoVU7ZFoern8X
	znTUuMDGZQyODgfuAHXMJIXlYXVmE+IMbbBOtUYk7esSNaXOEwPHNu0/v2P2Ves8
	BFVSng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0n2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34afa104860so2164289eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749921; x=1791354721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pClJae28EhWNFQM4d7Hy2thzB6SHofZb7x+ATa3AnqA=;
        b=hjvWgdXnsMKudVBpQRVTYr3U+9pAS0N5jFAFmUxCp34HCD0+EFX7LO5Ow75vcUzCbk
         QGuzxk32EEzWgKBu+Uf2gIuxXAjqg0UukGdZwEOoQx6LDmAP+vCHrOdkKKslK6ARfstg
         D5NhkmHRxbcGkuosqgK+LFx4x6sW56c5oGr+rF/M8JmOfnPxys85D6KwtNd1rz/K6ek1
         AylSXTbX77G6EAuLHKSn4oHvbGocb2l1PaowSOQQhnBcvWlkVFHpIc6sO0lTldadKah+
         aUR6FIIStokOuBHVUquK+N/erkwpZtcN52vEDiNJeIlYHIHaxiZNutO0Kj7zCX4kE+o1
         6DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749921; x=1791354721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pClJae28EhWNFQM4d7Hy2thzB6SHofZb7x+ATa3AnqA=;
        b=JvLeVGJcDksE8fWs4hzILNFuBY66IlhN6f21Ln/nH0Vuv9V7WEMDbv/QVc9CLDcMg8
         v8oj5vM9P/3YJhpjXvkMJUJ0hB6oXrNWaHpuL5ceXHLxMta/ffsEWWJZ442g4fUrrTM7
         Jxhz237bh6hfA8QTN/kdqXtRFXlJVNZ7YsgfSFB8pqVITaHE48BMu/BcQPhpaWDODVDD
         MwQzaQr6VCYwg1QzsRQznPoFifz0PPjPsUloJe84uG1vi3/y4xxiXCM4JwoWByTEeLPm
         19mC8AlnJ1TcbTQeUl4bNtUbKCfc8RYvxJ7L6GmmbJMt0R8YGfAC7UTLsUpo8IiD6anz
         u1vg==
X-Forwarded-Encrypted: i=1; AKwUvBxykw5a2jr2HyGu+czSYCAOX9+QzK1i64HTKKBwl1Rwe6qKet+gvyo8Sl/LY4W61dY9mpm6n7IC80gv@vger.kernel.org
X-Gm-Message-State: AFq9FYLj9PwMo6IM+kHb+I0H8jV6rMqEaDEA9v7qRl5faaVGw9TsBhoB
	JU9DlzdrtkThJscbJdVssWsBnQSmBRs5P3clMIxXpn6bbvUYERkpZ+sAglFvDeaqYXdUejaRtY5
	LQWeDPuIc3GO0d9s29VEdyf9O83TUgNqs/an8AKz4XEclH21RapBpsSDr3dZgNxn3
X-Gm-Gg: AYBFou1FX9ari80wPiU6t/vu8UEfVWt2N57xGn1hozZmPKgTmdoa4w0anukngMP31a/
	rrFyPvFrtYfh4swbehH0Ldd0rRyge67g/90h/OF39geFABpgI+6orlSi0EsH4rL0OmSoBgBSxD2
	7USWB2b/cNFMVHTY5+biue95Jvs6S0YWqrLupVysNeqc9ENddW8dQMv7/akGOLcQv9ZovsVletb
	2rLJZKVKvdHvmf6rLRrN5LWkqLV95LZvpNkTbg/ZcuubjY4VHZyW9YQm3ZHuHZN0f/SbYn4YyYp
	ZhXF2DtVdjKlMKtcyeFMDgSpHrWpspB50TGda+lyCHm6Lo5avqODvL5R9CQGvirEuJCJkB1vpUW
	lyxd8+X9BlFc0P5aDM4eOnjLOTko4eMP1nc1dNLCLBFwCugaSaEs=
X-Received: by 2002:a05:7301:825:b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34cdcfaa20dmr798254eec.32.1790749920681;
        Tue, 29 Sep 2026 23:32:00 -0700 (PDT)
X-Received: by 2002:a05:7301:825:b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34cdcfaa20dmr798180eec.32.1790749919434;
        Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:27 -0700
Subject: [PATCH v2 5/5] arm64: dts: qcom: maili: Add base MTP board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-5-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=28026;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=w0IgUTJpexU2mo803F58SI8x9GoeAzh/7aoCONuqABE=;
 b=T7oZ/A4cT7IwNlZr3fkMkU26zRUpnZO7ZR8brXTTCXK4W5EJvgylnMxQp8E5qWfxWzAqOffWW
 oGjV4rhnUtaBscAywL+4fSOaWgNn5FnVXkxz1BGS6gJhFT1dNb5fobx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcace1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=azjsmfPmHcDX3kzr_QYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: fNJhLOplERvY9uyHJHnxabW7MApZsdfG
X-Proofpoint-GUID: fNJhLOplERvY9uyHJHnxabW7MApZsdfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX2HhoTfrNgOps
 WFFuY0SlaI5M2+VKaQL+TH7NiqYXNOqfddOnhac7X4t8HVaFZJH0csaPJWnYYjR27/ph5o4TEtS
 txE5qfBaGFAABgl8ngjM33NmFOgZWY9tXRdLa8CA7I9++ozKX2Vtf6hfcJ1n5lombcX/UXzn581
 6QBHFtVAUoq/Cxmq5Ie0TNTha+wm4kGeBURk0GRHZ5rUPAqB/o5ueUP00JFzCiszu7hd2kBkhkD
 54iNU5x+t5hyaceJh5f7VeFtL1kMlOkocYMxl5DnwVzDtH0XIhVynbAcxj6F+Adou19jBSWHFRv
 DtgIo1B9Elqrcmb5qbsAccOOwRPn9md6OGXtvH5BQab/zF8tefoil/kgDt4rZSlduIxzmNqx5I/
 2lZH4ZcemT1zkt5FOUCGcgKxbdeFXGb7K7yZPuhSqwTuW+vOardyKrqeGLyl58QNXzdnEtP8WRW
 sZxtLtrRCTzQL27okNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX+83i6e/YnkrF
 kVD+Fi37aUrBZHUAG2Oldx3qOb9uVIjdJXWMcPm0OAc7unGRIXwNd2ICJNSbsK6ypqdHFIczLmo
 Gql9hSvp0F7wGz0dtLyddu4co0zSzJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

Add initial support for Qualcomm Maili MTP board which enables booting
to shell with UART console and features including UFS, remoteprocs, USB,
PCIe, SD Card, PMICs and devices for keys and LEDs.

Written with help from Fenglin Wu (added RPMhPD nodes and PMICs),
Nitin Rawat (Added UFS and SD Card), Krishna Kurapati PSSNV(added USB)
and Vivek Pernamitta(added PCIe).

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 960 +++++++++++++++++++++++++++++++++
 2 files changed, 961 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..8327454759f2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -63,6 +63,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= maili-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
new file mode 100644
index 000000000000..1fdc91e03271
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "maili.dtsi"
+#include "pm8010-kaanapali.dtsi"	/* SPMI1: SID-C/D */
+#include "pmd8028-kaanapali.dtsi"	/* SPMI1: SID-4 */
+#include "pmg1110.dtsi"			/* SPMI1: SID-9 */
+#include "pmh0101.dtsi"			/* SPMI0: SID-1 */
+#include "pmh0104-maili.dtsi"		/* SPMI0: SID-2 */
+#include "pmh0110-kaanapali.dtsi"	/* SPMI0: SID-3/5/6/8 */
+#include "pmih0108-kaanapali.dtsi"	/* SPMI1: SID-7 */
+#include "pmk8850.dtsi"			/* SPMI0: SID-0 */
+#include "pmr735d-kaanapali.dtsi"	/* SPMI1: SID-A */
+
+/ {
+	model = "Qualcomm Technologies, Inc. Maili MTP";
+	compatible = "qcom,maili-mtp", "qcom,maili";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pmh0110_i_e0_gpios 13 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,maili-pmic-glink",
+			"qcom,kaanapali-pmic-glink",
+			"qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_dp_out: endpoint {
+
+					};
+				};
+			};
+		};
+	};
+
+	sdcard_vdd_3p0: sdcard-vdd-3p0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sdc-vdd123";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		regulator-enable-ramp-delay = <1500>;
+
+		gpio = <&pmh0104_c_e0_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&sd_card_eldo_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob1>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <3616000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <2300000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l9b_2p5: ldo9 {
+			regulator-name = "vreg_l9b_2p5";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l11b_1p2: ldo11 {
+			regulator-name = "vreg_l11b_1p2";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <2650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l16b_2p9: ldo16 {
+			regulator-name = "vreg_l16b_2p9";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p2: ldo18 {
+			regulator-name = "vreg_l18b_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmh0104-rpmh-regulators";
+		qcom,pmic-id = "C_E0";
+
+		vreg_s3c_1p2: smps3 {
+			regulator-name = "vreg_s3c_1p2";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <2100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "D_E0";
+
+		vreg_s7d_0p7: smps7 {
+			regulator-name = "vreg_s7d_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8d_1p0: smps8 {
+			regulator-name = "vreg_s8d_1p0";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9d_1p0: smps9 {
+			regulator-name = "vreg_s9d_1p0";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1d_0p9: ldo1 {
+			regulator-name = "vreg_l1d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2d_1p8: ldo2 {
+			regulator-name = "vreg_l2d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3d_0p9: ldo3 {
+			regulator-name = "vreg_l3d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4d_0p9: ldo4 {
+			regulator-name = "vreg_l4d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l3f_1p2: ldo3 {
+			regulator-name = "vreg_l3f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4f_1p0: ldo4 {
+			regulator-name = "vreg_l4f_1p0";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_s7g_1p2: smps7 {
+			regulator-name = "vreg_s7g_1p2";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2g_1p2: ldo2 {
+			regulator-name = "vreg_l2g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4g_1p2: ldo4 {
+			regulator-name = "vreg_l4g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_s1i_0p5: smps1 {
+			regulator-name = "vreg_s1i_0p5";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4i_0p9: smps4 {
+			regulator-name = "vreg_s4i_0p9";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s10i_1p0: smps10 {
+			regulator-name = "vreg_s10i_1p0";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p8: ldo1 {
+			regulator-name = "vreg_l1i_0p8";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3i_0p9: ldo3 {
+			regulator-name = "vreg_l3i_0p9";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4i_0p9: ldo4 {
+			regulator-name = "vreg_l4i_0p9";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pmg1110-rpmh-regulators";
+		qcom,pmic-id = "J_E1";
+
+		vreg_s1j_0p8: smps1 {
+			regulator-name = "vreg_s1j_0p8";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+		qcom,pmic-id = "K_E1";
+
+		vreg_l1k_0p7: ldo1 {
+			regulator-name = "vreg_l1k_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p8: ldo2 {
+			regulator-name = "vreg_l2k_0p8";
+			regulator-min-microvolt = <831000>;
+			regulator-max-microvolt = <892000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_1p2: ldo3 {
+			regulator-name = "vreg_l3k_1p2";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k_1p0: ldo4 {
+			regulator-name = "vreg_l4k_1p0";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k_0p9: ldo5 {
+			regulator-name = "vreg_l5k_0p9";
+			regulator-min-microvolt = <915000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k_1p0: ldo6 {
+			regulator-name = "vreg_l6k_1p0";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k_0p7: ldo7 {
+			regulator-name = "vreg_l7k_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "M_E1";
+
+		vreg_l1m_1p0: ldo1 {
+			regulator-name = "vreg_l1m_1p0";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p0: ldo2 {
+			regulator-name = "vreg_l2m_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_2p8: ldo3 {
+			regulator-name = "vreg_l3m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m_2p8: ldo6 {
+			regulator-name = "vreg_l6m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p2: ldo7 {
+			regulator-name = "vreg_l7m_2p2";
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-9 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "N_E1";
+
+		vreg_l1n_0p8: ldo1 {
+			regulator-name = "vreg_l1n_0p8";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n_1p2: ldo2 {
+			regulator-name = "vreg_l2n_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n_1p8: ldo3 {
+			regulator-name = "vreg_l3n_1p8";
+			regulator-min-microvolt = <1792000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n_1p8: ldo4 {
+			regulator-name = "vreg_l4n_1p8";
+			regulator-min-microvolt = <1792000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n_3p3: ldo5 {
+			regulator-name = "vreg_l5n_3p3";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n_2p8: ldo6 {
+			regulator-name = "vreg_l6n_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7n_3p3: ldo7 {
+			regulator-name = "vreg_l7n_3p3";
+			regulator-min-microvolt = <3130000>;
+			regulator-max-microvolt = <3470000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1d_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&pcie_port0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1d_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&pcie_port1 {
+	wake-gpios = <&tlmm 80 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 220 GPIO_ACTIVE_LOW>;
+};
+
+&pmh0101_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <0>;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmh0104_c_e0_gpios {
+	sd_card_eldo_en: sd-card-eldo-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		input-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pmh0110_i_e0_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio13";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+};
+
+&pmh0101_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/maili/adsp.mbn",
+			"qcom/maili/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/maili/cdsp.mbn",
+			"qcom/maili/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/maili/modem.mbn",
+			"qcom/maili/modem_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/maili/soccp.mbn",
+			"qcom/maili/soccp_dtb.mbn";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&sdcard_vdd_3p0>;
+	vqmmc-supply = <&vreg_l16b_2p9>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>,	/* NFC eSE SPI */
+			       <119 2>,	/* SoCCP */
+			       <144 2>,	/* CXM UART */
+			       <211 1>; /* NFC Secure IO */
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 226 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1200000>;
+
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4i_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l3i_0p9>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l3i_0p9>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.34.1

