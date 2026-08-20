Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993273769F3
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237462; cv=none; b=O9SFnXbaNMqqPIz7tbFjXhuJELE6fcOpX9A5PBBA7DLavb4CaEuAcRh8/zcXtnDXcGJEJkGOTtAdn5wND9h0NpWYqqIvFQjPDI8j61fjiCTY/myDAVE/ROLFZayrvQxetbljIN65LaZ8i4Z9dD4gmvk6inHKIE3aZyT/leNYGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237462; c=relaxed/simple;
	bh=Lc4MX2W1gKBJynhVE7aaHv7egreYozMjsKsBGu8V3Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nK2RlPCvYAToapPYa/+ht//KfrNAknljAR4uQECT+kFw6lMCOYIdZV/SJTnrja9PdhM/FxF+1XluyI6/Tp3cBXVNXJcjlLECPUra7rBt9Gc4ZadgPNp2BVqRO0MYckSCSXkhBzRgY12JxDAWYHpvlq+Z6ZBEZskcoX78mPC23Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANWkOVVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUtOfJkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANWkOVVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUtOfJkR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7txH2700737
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wMrRjxFvV1c
	ygDeZj85BWpgzySly0rCdcgagEWM/Y7I=; b=ANWkOVVTa1e1MQ+0jh5xM0vND5p
	47k82AuJqxbmxfJ2GStluUNsM+5r7yhgo66D2mGRiR51Ghke9DvKo6dPZXuHooAW
	/HkpJ/0ifx6BZdZA4aqOWxFGHhjRBxQedouODHfD59ippGupADbwM/N9AQNlpS2H
	5e1X/YBqU3VtfA+6d/B/CcVx8lQuI3RGrrgfMLLkSS2/wjZ4gY0eiaswe33+ax4a
	V2R95GxEeCEwfFxiUdCPY6NRkNCQGyJequ3GrmDJSf7XBxfEDe+INUcTCpTH2m/q
	0joPg+JIqAbxMwvV8G2XFaW6CHt4V3ccGnMkBz3umCmLtTs87Ip/7FQFzwQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc92re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:50:59 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f36427abfdso3490311a34.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237459; x=1787842259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMrRjxFvV1cygDeZj85BWpgzySly0rCdcgagEWM/Y7I=;
        b=YUtOfJkRYtQlTdiy1/Om6RCjXuE2t5nWYwJGLDZ14qW265mJ5/HAM9GEkUs4uUhKFL
         HSdII38GZrotsiXLa4hAqPyx/V7cuyfJ1ezAOoNSYPK34wBbyNAvbT3Hx/jm5EwWxb5q
         kcZl0ZGCJSqGxIY6ZxC8JyTvqeU6g6bExXhE16HxRe9v6daRb8Kq/YS37/Lnopuy6dCi
         LZ34XFcK4J4bdtnFCIx11bPYs72l6F32IwMwjxNGpr/xj0p1/vw1XUzNNmCYh00utQ0f
         4L5h5QdMcZ9hDCUTdku68jqNY8vDMaPjA/VQOEg2cCvReOrjH2qs/399DLxwK4Z73S1F
         DdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237459; x=1787842259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMrRjxFvV1cygDeZj85BWpgzySly0rCdcgagEWM/Y7I=;
        b=mS9ZWyizQ8jUvy8gPWg+lQspJ54KYLecgzQl/oFMl9U2iOfJEF2xN/RkrAalGGQVSz
         KyKWxmHbuFH4Ml3B6p5XOHCk4KNF582I5zRrIpE1clV7GXTV11rpG7kG/FsRFvPnHe+X
         q7DHm8OvrJcH92bEjteGDsL9oX6+kCsPY9R+9emvxL/KZm9VHR0R31LfMG6lxgFM4WBZ
         FzuLaWebljplWXKrGoC5OzD1otQ6njw6qbXLfM0SWhYq7x9ie6cYVcbq6bLcvczE0JE4
         uksxYgUNj4Me7nIVgqc+O0fp9rQS8WRcvZEFewClfo4NhJiXxjvJbyK7ck1IPvwCkYMD
         1CYw==
X-Forwarded-Encrypted: i=1; AHgh+RroQC4BFDGHEBpvDhkPqNzHUi0xjQd76AueHNPq+WlHWkk6eeX6AhyYNpK+N0Em/UgFExg+YfBz1k09@vger.kernel.org
X-Gm-Message-State: AOJu0YyyR8I7HHYY35juV+GIoTWnv0LoEgs4toO1U3a/eSDbPs/I6JW/
	ygSefHcwPLhWVcvJIcyKwzg85cHjVTJIArLZO5KdHejPh/xAIeMekgqB26TS6r5nsRu7NZJBrsB
	56EzekYnEHygAu7VxovHt5KZSju4YFyg0WLmx4sooszQwvmxOP/P3LuJyiV8iRgKo
X-Gm-Gg: AR+sD10BD0ALeJnIyxDW+XLrnLyEK9OA9rsgILFqNRhML1Lr3eYii/jVANnpVw4LoWL
	gJV6WQzBcIVfk93PtNzss0W/SPP83n3sqDTbdcBRO6LWhvif4slyt83aFQ9jo1mOHyjJPgyCTX0
	s/QuejYRHopcIu603xupIxzVakZ/UvgsDCrzSc5/bCD9O3nxjgsbEmNPs/oXZFHY1eEsVG0zREf
	ZK/Np7qLP22hHN89ECZhnT2ogh81Xie1z9morniFkDnypJsqxwcqoovLfE8pZhvzPg3hO9/rCLW
	4/BtpdVrgem2MJ0eGtofkrpzML3OP2ST95seZ33kJOunD3wMFAHaK7buJlmDrIoFaNrFKjigCez
	QPGCRqehW11Ot/4Dnxh8afB01F09s
X-Received: by 2002:a05:6830:4116:b0:7e6:efb8:fe66 with SMTP id 46e09a7af769-7f43fb210c0mr13978915a34.12.1787237458548;
        Thu, 20 Aug 2026 07:50:58 -0700 (PDT)
X-Received: by 2002:a05:6830:4116:b0:7e6:efb8:fe66 with SMTP id 46e09a7af769-7f43fb210c0mr13978810a34.12.1787237457844;
        Thu, 20 Aug 2026 07:50:57 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:57 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports
Date: Thu, 20 Aug 2026 20:17:38 +0530
Message-ID: <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a871453 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_pKR-zN_RmEM7jd2atcA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX1NCx9+uS2z6f
 T6PvZ9ChCGTDGCP/Q6xNu3rE7C3y8VB3xprWn3aDooFcfT9k7lWeSPp4InMGQCkkKJliq6xso2y
 GoSPCh6wYqVqQ94ycRXpzwrOxpKPvf3l3aryqwOuItINs1/8j9jmr1/kMaxD/m3i278yWNhhTpw
 De7+GCFuYTpqRCrxenHuozXm/ty/3FXLObZvr7kqi/MS+bX96cK47YfHtJrQZyCoNNGAvbLH3vs
 7oTVmbcmxj0X7yNBaWHa5oSXO0ci5bT9lPc4N+xYncLrl4W50mflA28pBYipmzmfptaTBOccPxE
 pu+meTNFF15w6WI/XtCyaR7Dm2bO5ZagCw5/4YlVukZTF5QmodbdzRlJ0iPCrU1Qa83wrIg8HO9
 rIbT/apM+zrVozTDGO8G+K9jbbfM6vid+xqAoXJMWhVOrUoHTAJNxsEd98zM91UepXT2ZpE9ckH
 1LRiQYByHrgRJ/RexYw==
X-Proofpoint-ORIG-GUID: XQdfHkM6-svRqqGy4s50AXGdRjbpNDcR
X-Proofpoint-GUID: XQdfHkM6-svRqqGy4s50AXGdRjbpNDcR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX9OBfPwixQAcf
 6FZv8NbS3QMDpfg7uMtHAg2rw0RgGDYFoSYfp7twS08Mz73jdLz+eCR3UB6CG1a8SbzJaalTZW8
 poZo9VcNI3wq+qlTM2pCfHsXqMKUsYQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200111

On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
the primary Type-C port and Cypress PD controller CYPD6129 on the
second Type-C port. On Shikra IQS platform, usb-role-switch is
handled by Cypress PD controller CYPD6129 on both Type-C ports.

Add the CYPD6129 typec node under i2c3, wire its connector endpoints
to the corresponding DWC3 controller ports via remote-endpoint
phandles, and switch the associated USB controllers to OTG mode so
role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  64 +++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  64 +++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 +++++++++++++++++++-
 3 files changed, 223 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..c92ab8e6cc0c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -42,6 +42,43 @@ &remoteproc_mpss {
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
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			wakeup-source;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +95,23 @@ &sdhc_1 {
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
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,17 +120,17 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
 	status = "okay";
 };
 
-&usb_2_hsphy {
-	vdd-supply = <&pm4125_l12>;
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
 	vdda-pll-supply = <&pm4125_l13>;
-	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..8a3d173568a1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -42,6 +42,43 @@ &remoteproc_mpss {
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
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			wakeup-source;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +95,23 @@ &sdhc_1 {
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
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,17 +120,17 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
 	status = "okay";
 };
 
-&usb_2_hsphy {
-	vdd-supply = <&pm4125_l12>;
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
 	vdda-pll-supply = <&pm4125_l13>;
-	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..bf09d199f2a3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -42,6 +42,73 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			wakeup-source;
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
+		ccg_typec_con1: connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			wakeup-source;
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
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;
@@ -58,6 +125,25 @@ &sdhc_1 {
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
+	/delete-property/ dr_mode;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -66,11 +152,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm8150_l6>;
-	vdda-pll-supply = <&pm8150_l12>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port0_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +171,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};
-- 
2.43.0

