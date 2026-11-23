Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436260;
	b=aUfikDhvZzv3VVuSUbEIWMAG/cEaPCOugrZDY+kS0HZuz+J6bPCZQbztbFcfGK3KSlPZ
	 nPrMVIb+njh2N8DXvQ0UbjQVgP67o2mFEkMuGzgfVRgqovjuRdWnWzp5MJhq0INanvlNi
	 CsN/dH1mTRl023nGSqogYH1KStV0Rx60aPJoEuxdTAjdpQQ0Z+v+kTs9kVn6DSf4H/bi7
	 cmtS8schHrynVXve25zm8ecOSFVaUvDNU1IUtv0jN66ObynHj6wPtTmWNIr5y8MDpyNAW
	 k1pdgI9bIUOmQwsNHnFv+w2RkynKMugd2ZhKB+fjln5nh1tvFm1ooyQ6hlXU6gKzajw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ENIBo4TW/TNvgyJmwawzafOY2EW2zkIQk5w7ugEVjzY=;
	b=wcshcYIvQUSIkjFJM3FFeucGKmEs2Be4x7O7l9YOpHc8KMVG+qfOA2TcKYz5s3lIEC4G
	 vZwJ46bb8Iw5/1JGJJZy8msKIUTPWKH61J43+ZUcC8PKyrWW+yyEt2wlB5DrIKhph0YaX
	 eQkneKdOMzAk4ngFBqbnneG+MgMKEF90/G1Qa3BXVp08FgFjPihavEhYfauvkgc39+3Cq
	 IN9zgv8eb5YXUUmhy0UvtZzGiG0xgiixJUhVUY6wATzAnxgbz2sAbA4+6DmV8GYr+mDTc
	 +2CNveA0CMOZSIl+1FlfZwWVryNCzEHcXVi7rZs2GIVHNQRa5e70M8Nx/7YR+yGfikQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XS0+RJtX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etT+Bikg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76603606A334
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76603606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XS0+RJtX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etT+Bikg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCFwSN1317035
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ENIBo4TW/TNvgyJmwawzafOY2EW2zkIQk5w
	7ugEVjzY=; b=XS0+RJtX105nSFxgAukR6L9PMcjowkTDVLfpGA0AI9qgnMOxQq4
	C7JcSK24Hatf7WtNOJUqcwiK1S2v1bDB5IIE1HvDRuboh6Q41O+QHYsWpWJXsSFF
	taDm1FBtoeBL9ZWbu1GXSWPoL5mGEcH+peg0KQVK99yiNxBqrTVqNV50xJ7t34xL
	MoiKfxMeM2oN+FR19wwJgu3eZOKst2qDzN7QJ3WIWzzhItt7G2vDm/bXmWvDke6s
	mG5XJskkvSP7ft3Zoc+n+ikobK9SuJh+pVgD9tTB19SCK9uf+Paz6KCxB7TRHHpj
	sx/rf6M9CjjgwHOZA0hLjXnwSLImDLMPkBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a18wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:17:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so1660048eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795436252; x=1796041052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENIBo4TW/TNvgyJmwawzafOY2EW2zkIQk5w7ugEVjzY=;
        b=etT+Bikg2W09oGnMwrz4e5x7MPh4HI4IZaEj7TqA4oYLvUEpRwazwqIRAM/KMlU7xO
         nIJ6jRA6rEWTkU9YafuASLT9QoHD3Zr1BPC9kHTQ3NSBxmZ3i3LCQ7q6FOdqlkkAKSHa
         fDPKuoxmKPeBISkqMLf6+ZEgrtt4xPcaFszYW5jR5j3FjIBn944uVkOEL3DG8Q0Eb0Cd
         W+MImVoxsCCasYS2JZPthCiFqQj34vXMbkTxCOQT7WrTy60Nf0SAMuy775ajjzPxNG0T
         X9T2Jf/Pk31wc15eBCYzXASe1Y0rU5vLJJa/muw+1xzvCNAwWgWa7VHkBBDFnvjqec2A
         oYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436252; x=1796041052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENIBo4TW/TNvgyJmwawzafOY2EW2zkIQk5w7ugEVjzY=;
        b=NdkOAkkfEHDfyYjlM9hSJNqfzC3utvt1hWp+hsj1uFm0MshPnNFGiLHfJgRVoqChmN
         vOjo7JFofihg95XuGFxNoiOrpQvfas7BvZvrTDT8qodmue/y8Q4+XKUzBauWul/VYMdd
         /8NPhxdxeSGFNBcyyrFPsutQWtZPh8o5Ci1k+t/YZuq7qlYo4c15UsGiOQqzMAeTY+eP
         k9N7byVKrX3E8l95J5Ce24OVJhMpAW4dNQTHlzEcW8DbtTRaKbooe0TYLhEOhRHH3B0D
         ogCHqtrXxhRzdicOm60fDeYrHe1AfZJefpSbkqWspUgQTXv/YovgL6MZr3zL/PpIWVFH
         MM+w==
X-Forwarded-Encrypted: i=1; AL+hErF9mMqoU5qeKO6CsJDkkZyOEas1SuENaeO9DWypquutZxMD9jPOcq5YhIbZFxd9Wo303Rre87z79TqB@vger.kernel.org
X-Gm-Message-State: APuU4Z/QWGBIUrVXa2KUeyL3fStb6TW1DfrVY3rMFSrmrYjFIjvuHmAk
	BwGhbL/c0Pvud70jlOwXlEzaVHC0YSm14q22yH6IGZLJMJYe9qK0dIfRGWqt2uDTQzI+EpbpsiS
	UwdHwFCCzI4d7YEE34W4+Sbdg1KLVA9rQhURSA3N3uyOvxXLiph2LPb3fgN5crlXk
X-Gm-Gg: AZFdTZf9KDtmLLhppJ2DiaGnkcvb3ten61puGXF3SmLBXuFCcbjuJIhzYpjs5ZgbPOQ
	I+N348I2RG43Qpdif7PC32v3QW3MzgO+YDxXbA5/byCzICLOecaEk8tBLf06wbSl0SqsMi0T+OU
	Ewf+9E6GT0BnZwxz4Q3qpFupQ2+06mzTiWVxgTgdKynCYdUsS53zeEg1z62fB2yDQ5gp1bVlbIG
	TrjoFC7Kn5+C70qoXGKsKFo4Zt+lQ2QDGwS8bKKAv5GU/6gBwDtaRU0siEHRbGyB7u7XnLNLrSf
	miXPEwLkPjkSJPJmptjIMqapadM70v2O73orME/t0tD+adoGQzrY8Y0r8RIaxkzGsYoRsE18mhi
	+9Sgg1txrCM6FQKmwMXR+/2cwRJKo27A8YXOKl6uY+Ocurl0SXRL2yO65gx4BPfoDcsh1gue22W
	Ohbg==
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr10189050eec.12.1795436251676;
        Mon, 23 Nov 2026 04:17:31 -0800 (PST)
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr10189017eec.12.1795436251060;
        Mon, 23 Nov 2026 04:17:31 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm34338054eec.7.2026.11.23.04.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:17:30 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Mon, 23 Nov 2026 17:42:08 +0530
Message-ID: <20261123121729.2418019-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OCBTYWx0ZWRfX4n7VPSRQNc8u
 Ibo3aUScSmPG43/GtbEiSvXgOwAo1PF/LJk9n5jKabW7of2Nj0PbKHB0Qe66LWIXp/iPTugka66
 JMLeeq52dntdEbVKYlMmUG/gOPIypgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OCBTYWx0ZWRfX0+2iZLpJNV95
 M5ww/SvwtKt/ycSnqq2NUc4WpEBnz4gW5rcgtHeMJ9gbMiAlRNzyc328eJIg9T9XPI7b3WE4E4P
 KY+poh5YJjmQz7aJlqWGrQ0fOjSnOgkhBi2tGcZS36Jf7v/R2m2oHQbjDiFZW/eNig58qheozq1
 aXzZnaYroGDXMAex4AKdXfuJVMkZBSyxoDa9k9paI4y9gEm4jabKATV89bY6ajQQ+pVuPjwLDK7
 R9Cf/ht5CeCwrjZqYFOuz3ZrTQX5xdnexp4saLVS5JVumsL82pQQfXGGn2S+F3RMjkx7vzHmAsq
 cChzaASoLa+KsJzdAiuWXj7l5EXudPE1Y8l+Sc9IdOr94o2yPx7lWjX5y1Hb/7vHhkrEUK85hn8
 xizzDq7Hm0jW2RvRcqWBzSAnYnt+1j4D2B6JUIK6vbqIJxLJ0WePcJGWEsvNVjf0tCW+MsNwkLf
 w4AfkfboDZsCiEPvl+g==
X-Proofpoint-ORIG-GUID: BMzQtbsHU218teBlFbMRoRuvfnDcDjts
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b042ee1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3W-5HPClo8dsW9dVm38A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: BMzQtbsHU218teBlFbMRoRuvfnDcDjts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230048

From: Akash Kumar <akakum@qti.qualcomm.com>

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
driven by a GPIO rather than a PMIC rail, so it is modeled as a
regulator-fixed node, matching the existing boost-supply pattern
used elsewhere on Shikra/Purwa, and wired to both connectors via
vbus-supply, giving the regulator and connector frameworks control
over it instead of unconditionally latching it on with a GPIO hog.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 ++++++++++++++++++++
 3 files changed, 218 insertions(+)

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
index 5df30ad8211f..4fde2ddb5393 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -23,6 +24,84 @@ aliases {
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
+		regulator-boot-on;
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
+			vbus-supply = <&vbus_boost_5v>;
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
+			vbus-supply = <&vbus_boost_5v>;
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
@@ -67,6 +146,23 @@ &sdhc_2 {
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
@@ -82,6 +178,18 @@ &usb_qmpphy {
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

