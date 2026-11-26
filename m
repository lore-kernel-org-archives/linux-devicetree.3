Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689734;
	b=tlaaF9HWbkvWxZBFHobkHUDyHhR+RCJAyaXkq4d06cZV+xJERxZv69K6PZEWe694ezan
	 6FPz+G2LH5A/l0VmOo6BoIiVMyjGl+Esqd8ChlJtnNSqxRWeiDKKjSIJL0J7qKYxCB4XS
	 Wanmz26eOGEZ6wQpHMZPrgYRhnEd/hS63osf1mAHAwqdeCbptbK6ktOFNmjqqIWDiNZlG
	 ODVdAQ951NtTQG9hLkUfkV1NMTBQ/yUKkPLxV2a4P051YBf9qoOZ1smx0BNIaGQbVaAmx
	 9ETcf62VHrQiW/sn2D/VuaicnZ08yVIN0NltTYriLaSNLL7kDPtQmaeHHABcs8qooXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vw4cVulsHYazNOfeMhPF1VuBi6BInXZrwxnBFfdZuTU=;
	b=LOtPFCr2hPUehhFaUb7Qs8eTyfr9NDaXkb/1u3NB8QoFxt17f8tYnzTf631NEF/20h+A
	 IQNlq7oWPu8v9QZIJWf8krLzWfbCgTZqhH5bYaFuiL1B5eqWmeJgx/+VUS8fz1r/hEU33
	 I4x+S5BOvLh52cyQEaMdEEP1GBrZPJuNhBffXtqBVrQZQSLdQTGS4VWOTvutQzgDppKcl
	 Vzj7vYT5dEk84AE+Cq9WMMPnD9I6DZNnJwM2YxsR36qBEX1wvGrEpFIx5BquwavZ3cpVV
	 WlLQ5wZs0OLQrlTKYMx8O7ujm0RZ++ZFoLfjNNo8tmgo71e4UMQca7+dO3LnQLrOWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTAyuG4T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVCpb5gf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2953606A685
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2953606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTAyuG4T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVCpb5gf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXE7C3348328
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vw4cVulsHYa
	zNOfeMhPF1VuBi6BInXZrwxnBFfdZuTU=; b=JTAyuG4TFZoL6yfdwg2cF0FRM5s
	nYTx1+K2mfGWXWe0GCt8VXyH3GH93/M4cOzRTlg2BACnggMIzRa/WRAALmATrtdm
	diPvqYn6/Nrztgiopj+vetUbYHzk3Dh+b4YwaipUUH/2lGgZE/OSH+dx2Oy4WsYm
	RpEsol8HamjXPx4WldrF4KnogK0Gt8LzRZKRumrH2piNBXqdNdOfxpt14MzBWGaH
	P21J6WLtI+qgSrj8kZB5HHodly/c2Etp5iJlwukkgf3ZVAOiqesDO1onnnM6a6nX
	WtoLeAMYb6t5ZaSCSCTgFYN9ZTYnlwkTb8JGHVzTyz7yrubXlEuUNlzijvg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rh1my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8997268eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689732; x=1796294532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw4cVulsHYazNOfeMhPF1VuBi6BInXZrwxnBFfdZuTU=;
        b=HVCpb5gfoxPfZkIc78Ua7X5FNXgTcuWB+BdshQil1B1LPTRPTzxGJPg0c1iIG4QFOo
         SvQYKOtLDMIxZyzZBYz321dieDH9XpW0dRr1ua8JHCT54qvcmUdKQpccZt8rH9P5daB1
         ipIqHPosiy44rDUm34c+qDoi9fvbtyFV7neJ9bOfjuNSKZ/CainjoKfRTtKSLCk30bmY
         dyXTJFnK2m7MnibP8p0e6rd49okQCtvc2tqLfnr7lktjEK4Ar0ptEXIP5ls0svHMeNEq
         WGdFuBPyYek+w57FQrVpUZ2j3soOznXxJLGwJ7tEGrHeGNKfy52Yi+nQ9stQ8S0lDKGm
         7GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689732; x=1796294532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vw4cVulsHYazNOfeMhPF1VuBi6BInXZrwxnBFfdZuTU=;
        b=W5T/S9a06/itJXLmWlwdOJ0Ii6fv/xqibPlrRJhPSLKnHUBZIf5chp1sSH0eOGOTR4
         yEFZogCZtp9/JwgFBlkTfSZ19VPDWP7PzYz/EjHnmyRS5TnFEVObBPYiHBhUOKjyY8Rr
         oyEJ9cdPPzn02rF2RcZ7YB+7gzLhByhQFnpx80RyF/Q01i9eLiSqpLxA5USBLvdrNXcA
         G64hw9vzOfNORL20BKyj1fxHX3S5/phWmb78DTcjQqdQKXlNNnQsgtAseOlHw6Ygzmhy
         pQqZyIpGwzko80qy3YvHDwKJWcQwdrY2G9/+YoFwtl9BlFmvul4A43lTSRRoQ7jbrFFr
         VGlQ==
X-Forwarded-Encrypted: i=1; AL+hErFhLilKjcTYGMmDmwnyOaor3CbdXWpRcYEW0J+EUrov61zkhIdH6VurVXlRq4l1UMy9JCGR9Ceml0zM@vger.kernel.org
X-Gm-Message-State: APuU4Z8zOaFuci3xVvQDo2krEH5m+sHFuO89L7XZaECKpP34S9lnzpF0
	yQT5OCXNyE7+tOGRev0W/SaW67NX5pT/XhLwtdcK6+ho7/fsM57zmimLGux5fcwpz851xhUrQi4
	L3/x0LWZ04AEJPSZVCUTMqhKASHpdlZEHaNBbwygiPp/IdBLogf4dDg9Ay+Tvb+5+
X-Gm-Gg: AZFdTZc/xsZAgoPb4X1OxijbvEkPAxKhKuBCM4B7R6FJPaL3aMparGZVnLnoL+fQ46m
	7hQ4QJeRa+FkfuaHfwBIP0JgvD9xSiDBM3ikKRBgQ99t3rMzzbbXqPBQZ1+ahLfeobnEqFpJEww
	c/FO9/iBddkaFK4pdRR/aomErTZepsAFhJO03gQhCn2l5qqIurl0qZEOrid37JN1cDcqXAgJ/3F
	otjM+wxvjDiR6C/pzGrUH7xjeMmv+2DzwkdtXOPhNi+rrT42uBRJ1JJPRFPTCN3HdCYK+yY3ejl
	78b7l3BAMZI4mIaLvNtKoQstIMiHGsnimTFu8floNRejVM39w4K0CBRM/SjsmaqmdjTqKHnPYUE
	IBT9qyAylLh6gojsGKt+LUWI/o1y4eBg4bhjd6W3f0lN/TL4EbsoCg7XiRsxXNFBJeL5rXpzWgP
	CtKg==
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr4089590eec.2.1795689732010;
        Thu, 26 Nov 2026 02:42:12 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr4089557eec.2.1795689731428;
        Thu, 26 Nov 2026 02:42:11 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:11 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Thu, 26 Nov 2026 16:12:00 +0530
Message-ID: <20261126104201.1613183-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
References: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX26HBbat7XT6n
 QHCyee3LHL1h1ZBRfy7OPjgbTfK18aukBqp3rAHDbLOJ9lb64niOzD3yyCOgwY3SmYUG3203t/k
 ohfH2yZTiJot4hFjdzZYC/9gGEe0YRtK62yI8Wf9JHzI58XJEffJzmuFMxCaSfmy3rz0kN5tM/u
 wNB0uhMeSAGWgkET4o6bvtiup6r37wD8h6gTCPDqf60rcuul1CLkK+c0qeiyw5jHoM4iUxZzy+v
 ZTk4L7QCE6QmSdc7Vso7qihtW3N7pL78r7xCViB6deebULhyNuob4Smut67agLd/vNvLyw2/VXb
 ivTAsL7D7AgghN+Z9QsbAcLJPVtyuE5hK3XfwRpfec3q16uNloREgC7OG5ahLDiB3lfR5psNb4D
 Sy95b7MmzQ11MTU5v/A4wBWNEVoSUOO49yNm286LzHaQaIZ0g9qjQ4mHr6e1ZvI5rBSIvw37NFd
 ggTIxLhYmZqjqmlA1hw==
X-Proofpoint-GUID: v_oUTkHL98Ni5-7Qbccmqv9FsvHH0MVA
X-Proofpoint-ORIG-GUID: v_oUTkHL98Ni5-7Qbccmqv9FsvHH0MVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3u7rlljIp+Nv
 r1vVgxFEqz2AYD3ovtNKcudzV/aEsSR3CR/0xqphWFoZt39mAhIbBDmJ/S+zUepQdw0+qNtx9LC
 qMF/K4VEHkAAfZK+E4Sq2eM2shaSFWk=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080d04 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3W-5HPClo8dsW9dVm38A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
Shikra CQM, CQS and IQS platforms, and wire up their connectors to
the corresponding USB controllers.

CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
I2C3, connected to the HS-only usb_2 controller. IQS exposes two
USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
first port is HS-only and connects to usb_2, while the second port
carries both the HS and SuperSpeed lanes and connects to usb_1 and
its QMP SS PHY.

Both affected USB controllers are switched from the board-default
peripheral-only mode to OTG, so that the role-switch framework can
move them between host and device roles based on the data role the
PD controller negotiates.

The PD controller's interrupt line is routed through a TLMM pin and
marked as a wakeup source, since Type-C attach/detach and role
events need to wake the SoC. On IQS, the 5V VBUS boost supply is
driven by a GPIO rather than a PMIC rail, so it is modeled as an
always-on regulator-fixed node, matching the existing boost-supply
pattern used elsewhere on Shikra/Purwa. It is left unconnected to
either connector's vbus-supply: the CYPD6229 switches VBUS to each
port autonomously from this upstream rail, and neither ucsi_ccg nor
the typec core ever requests a connector's vbus-supply, so wiring it
up would leave the regulator with a permanent zero use-count and
regulator_late_cleanup() would disable it shortly after boot.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 106 ++++++++++++++++++++
 3 files changed, 216 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..46835a44cfbb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -29,6 +30,43 @@ &audiocorecc {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -79,6 +117,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -106,6 +153,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..de058d2978a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -25,6 +26,43 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -75,6 +113,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -102,6 +149,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..0e770dafa9d9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -23,6 +24,82 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vbus_boost_5v: regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -67,6 +144,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -82,6 +176,18 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};
+
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
-- 
2.43.0

