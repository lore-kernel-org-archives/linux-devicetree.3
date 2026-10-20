Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462179;
	b=cn+RPS/Yg4uTcRDXOyvdylSu+92U1mKf6+WAdkzpGXHsSsjDJxbQf9mtU1IU1FA9bXgO
	 KcNoRcroUqMDt7SxyL4zDSKKkBtqTiLMk84+9c8P090G63Of51dsUj7kmUzlK3vKEDj6R
	 An218licOiTazb5X32o7k+ix5IhUoJo/1xViHYCLjE4Y6tfqaMyS3LviUL2o/gYJz2fZI
	 Njxek84z4625jPUgXYWxozJ4ZunxaLLUK7/SqwYzWBJ0DI0mYKklV6nGoknelByJT7OYn
	 9REOo4UHCwk/BylCngvXUNtgsSOpgnz5mqgwqZUd93CafBBp+6asYY1L7qKFF6BL/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
	b=1gOJuELGp2S9d7Netnl5ey3IHcrip4LL7vYoBa7wnrAwLQt7VxlgQmpHjLannoBy/GRf
	 YpRx6PvXhkgFK05Xb2fVncHmJRPmpx9bu3tGGYvbhSYbrk2XldH9+hDQjy1Zq22caURqE
	 uF8m5J7Xc+ZJClXLH/NC4OoEJwcqcp6LIPYNzMSHieQRfrmcoWCNvJrK0mLNfKIEEfNWB
	 HwlyHdLgFWMsGAJJ84o6UqKIKfVl+GwrizRq57XEcsiiH36I9GAewfczaXIgV/oowPo6c
	 u4kWU3+kZ/wgbiNJG86e7nx+slQMsNW2UItkwsn0IGfMZNNQexPrqscQ425Foah6i1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9xQvdNU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XRwzP2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D64606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9xQvdNU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XRwzP2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tVHQ4178316
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xLCSD6k91Jg
	j6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=; b=V9xQvdNUzt8OfaIBNDAfOa6yfyW
	39NdKz4ebA53VYHznFf94sHLB0JtYgu2yx8mG0qo1O0RRVI55rbHjFlU9hQt4XaQ
	nin9Lz6vwCt0dkngR4LeoWksugNO67omLIrhdvDheyPObW6ROwYVGvQ1XnNuxWK/
	Al7aP07/q3yB06LmsuCQuHuJxfU8Jhk6cQFUKMWg+SSCEl6hE3Cq+BMmco9VFDVJ
	GSW1UR95jWZ1VLMtgN+Fv/hm7LnHpAD7vG/UgbrzvF0sN4/B8kAqF4qbP9K2rFhV
	7ZSTNVbF8/f05oNLaie5f8kUNbgDxQIqdxPgovBPloLlQD9ZH1mxlz4WTqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n0d3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:09:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so775571a91.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792462176; x=1793066976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
        b=X2XRwzP2v1GuIhPxTvknuxk/+EAIvSMdQOGs4t4P+OjI6w/z8W1Y2j25KPiKNV3Ypm
         tqfLhQMEZqeTMtWJLYMW8huXUZUWYaOB1b+eVCflWIjiyLBk5XM6RthdDHITohH72H3O
         eDbWmxmol7ce3GqNDIccsxfu1vzwKKWUsKfWTnV+a7cd02NP+m7V4fuz8kD+MUbLqTOO
         xle77WqqvhXEwRgGeU0ZWWN9ebNGIQkw1izmPqsbwgxvKQzswESBkX5mN3G8O9442JUt
         ijgur7HpaKPaZ57Z1+Nb8sstiH3KgZr6bN0eat32TPkgyxGdmO9NPW9oHIjp8WSuY9Pz
         BGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462176; x=1793066976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
        b=Z10ClRZs8L7+POM1rrwOS6i2H5Pq81RsnGB+SCJPdUNwabSshSKilOF6dyG/IVO76O
         yoyZZPjwNiT23sLKVdxS38aRaCbXHHLoJkdrKg1350hm2rvlBHahqJNYYoJGOKv/rvj8
         j2b+7Uzpg1Dm0HcycYAz22wHikQy1RoIf4591U3FWTKwvItJzsFEg2zHUel2f32kX5tt
         opfYMac3xNBffXpO+WFS35gOQd1pvdOkLA+MIaEEtXPUyK0SAK3UUMlsgb3TAEzC0SZe
         EeksrmaskBM+5R3LMDkWaGIOLLWP2UUZ1JZJGH7liTgDz7CuB813jLbBCfkGGzBqA1Ew
         WCXA==
X-Forwarded-Encrypted: i=1; AKwUvByTbf7K+IoyqRlNJbswIDTiP4IkZhPhwIDHKIfL1sE0HO+xoWvGe29/kPQlwCeY7Uvg8NuDtcZyL7YU@vger.kernel.org
X-Gm-Message-State: AFq9FYJq2ve2aTPIRvDQe/T4mr2mrMnKChB/Yf8rO58Jl/hzyq2MTknE
	7MxH+UIkrmS5MLBJ1TGvAPc/79QgWXg6QMqdAUo4ZgpKLKu1VTw5N1n7XjpqQSjzNgpQvX7nW4B
	rpWz5u6wLtsThzqOjQQ4KIrhUf3cxFRzSYsIjn1xbJ8h3D0FPDOTN/CVotzx5PCeL
X-Gm-Gg: AYBFou3xdRRja28M0Vhiomjxr7nBSLhJObypCgdn0146gdP+8FuXziwvPVoVJ37u/3H
	Dcejf+qmLPDx4dSkkkbeRHn+kAg+mbmdbvBBY04wRDgE0TMaWKL0SD6xwZ8JJflOlMisaB8rKMb
	XcQ27GH2/lcPncJg6yKBeeuvf84hlwVxRKZKeJcUT3j2gUU5tF2rD0VZbQ6zWHk8wPm/RGABiSK
	DDsOBZmHsnnYru7cVQpMqewsw9/0SB7845zEJSC8T7tdRNyLPnmp6itp19JaGFEUxWXry53ZU0O
	Fe5EUCQkZiMRpNGXxw8Hqkc+7eh3sLaq8xW5Mh5WM/U2lIIagxP4bYXcXuq9GnS03BsxwPKIamM
	62CLHk5qsF3YEYIXcCEVPkTw9I0KK
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr13645653a91.5.1792462175839;
        Mon, 19 Oct 2026 19:09:35 -0700 (PDT)
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr13645625a91.5.1792462175410;
        Mon, 19 Oct 2026 19:09:35 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60102ebdsm1668101a91.1.2026.10.19.19.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:09:34 -0700 (PDT)
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
Subject: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Tue, 20 Oct 2026 10:09:25 +0800
Message-ID: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-GUID: TjC-72Q7D1dYiv6LO4IJPI9LKanarPXo
X-Proofpoint-ORIG-GUID: TjC-72Q7D1dYiv6LO4IJPI9LKanarPXo
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad6cd60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PXjJdcURLqaX-Ux2mcsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX0cfXl1O9Vlwr
 Es3IW9DLMj03ThooIPelvdjO9MzDCp0JhE8Caz1v9JrmnB5GdQqz51nQAOe/obNRxA4pbdsoWX3
 2dUNYQIYKLos7ujb+Tr8HuTAQfD+Hp+20jtY8B4++F6egY/pw2Vx0nvCJYfsCsf/nTqM6kBmnVj
 zoWMieOJSwfcdOOyb4yMSCYweYiVPvdcFn00ZHMEQnnI7Fewf+QpBW8ZbM1/r0xe+1Z+gSxnHAI
 sSKrnR/GZYJWnlgEPT18Jhd7jQXyCoApBDSF1MdE/YrAATiq4YQlKkjPPjOOQ8Bm0FlQkf+fdn3
 gYqfJvnPgbJSERkMOcJz1zcKnQ9nEmOtNB7hQlPX22etUx8VHbjNrA35yNWdQxWoCAaq5gPZjPw
 mp73N7ODbnXDJ8nZ+3QycjHbF8b58L43oHDhim/bQDiCESFwu5RnVsRwbVHjB07MiuqOkbgb914
 iO61isVBxa6JN5KSx/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX746ik4mMkI9J
 6p5/SSVeB4yl51IKq4iZ2z7P7bpvpPHUnsFr0mCWSjWh56TZFIRnSgkOCk3e4bNwbu236uTg5GJ
 7iQkkcPOoSQzndTchh8Qd4frbRGtoFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200008

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
Shikra IQS EVK.

The M.2 variant uses the external module connected through the Key-E
connector instead of the onboard WCN3988 devices. Disable the onboard
Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
matches the hardware variant and does not probe the unavailable onboard
connectivity path.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

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

Changes in v3:
- Drop the unused reg override from the disabled TC9563 node.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
 2 files changed, 106 insertions(+)
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
@@ -0,0 +1,105 @@
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
