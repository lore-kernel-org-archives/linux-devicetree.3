Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461653;
	b=cQPGAyV1UFkhWYqhJmBayImCnrBCqUEn3DBDZ5kkAAI/9hZN9gHjIUbpunp5Mrd791ZS
	 btY+2sv7MYM6tlklkTqdBufliO6t9XpfFe/zTbdM43Y0Rwl159twMvW+T6ojfH0o5hWjt
	 v4fLYqI+jw5pJJdmn9bm4IVFiv0h3px0P5rzSG47qacp+9dPjsXBum2D8qoZRp19KWvgN
	 F4/v5cnVTpghE05CeYPmwSeYTcAm+L9afPvlJSiazZNLho5QDh9LJBy+qKrRoezmLNLmf
	 I1HEOu92mA7ZLqP/tGA2JbdDA5EFH3OqgEd51B1lJilYZESnZGjs1HeHgGbsQGXRV0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
	b=CgCAma6LPwWhKv23SRbd+fwZ+gFm+EcMO89kP0mkqS8TVQey/00AmizeB+2Y1PAlvTAT
	 hhVhvvpe4iYqvdIiZgTGB7I0OyupdqP6g7EogUjmCH6o1dNoaTQVwPbnWF0FJJ3Q0spYY
	 gykSXTEvMzW0HRmGZIsBWDdOTXeWceeK7UpaNsJFmQY9K4jhchpaBfBCRRlmnCTpDoURF
	 DgGt5uC4EX2IIQUPtqjmRpsBHhvIOS52RKG6TJ+oEZ3MrNe8pP7K4BBBLzOm8DBkZH1dG
	 pV6Y4zU/FqJqx8mp2dpTJ6EhOhHapYKOXwOk89g1cUDnwEprPwDVlgfWoxdjpxar3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoI8KwdD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dfAr/Y+w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A14606A324
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A14606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoI8KwdD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfAr/Y+w
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZOu64092378
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ME8In8jKZ3MBzjK9cpl6qw
	g+uCXfpWIB8rTznMDme5s=; b=hoI8KwdDW3MCzbBlltDvc7pD6oLqh7PWNnDln5
	KsFgC2ACwmsc+17LNe46yiksi2VVC9Ufo/fG5EtFmScq91cK4PDmVjkM7MRHjd2s
	6XF8bB9gWHjWXxijqzZhHj02F9Se+T3dhtdoTp2FbiiWDomDiy/qMtSYCd3teQce
	cdk5P0FxX7XQTnP6xiFqKdzzXk+sMiUesKy8OJEpzLDLrjerE5daPuPeie7VtG35
	Fa01s0+qcrbT9UNmx0fJDhZM1GkX4TG8EzoOcm+FSz7UIJW0SRVStHDP8hfcH4mr
	hAiuNQIAzsZ4pW/Gj+ST3Q7yUlaN/Mvg2KegcU7u+fmqJIrA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hbtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:34:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso2004813a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794461651; x=1795066451; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
        b=dfAr/Y+w6r5zUfjzGBMnt4WGl/qbbynZ6hJ0BwXfsOVb76fNfO0j8U3j3RWU2qRm5b
         UbLw6acSmEL/jODizqQxfpNDRrVLKvGVfGrjyI0RA2A1l2L9Po9JtvJHv8YZ7yVeg19s
         kd4vS+Vwaq8hf73Cv/O8SdZCa8KE3KKgqIqZL909Vdwqel16KsfLliIXSh/BMU+F5z9v
         xTPpUCV0peo06a/1PuuLRgWElxFjxn+h8g6EalajhlZgBLbuEcubbos/LAyCBJjBfjXb
         z+BFmr73eJNNyt7/oeFIiVclx2lxdZww0mMRBnnU1jj58YHseDHtP4lj5eYbs+NY4eWg
         Y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461651; x=1795066451;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME8In8jKZ3MBzjK9cpl6qwg+uCXfpWIB8rTznMDme5s=;
        b=jWUd7zEVNqRUIROP8r54r1hqIwoEJmfUycGXQ2n0L+OBbf4qLf1MceH2nnrjt+th2N
         XvzqZInVCul3GvID8DOJAwAOkPmO2Jj/Ucsa6KhxH7DFpPAzSmjKAzqwIcSeU1x5Iz5Z
         wXahnrC7PG9Fz3JBfpCiJQH2o523Z/qNSWJvsIlaI1BK6mxRg2dtRcOncd1lICDw06NT
         ewzsTpH2tGn3O6v64q9Pv0VD4KzisBPS+j0kKU5bwwLA6ngwSra2fQwD8sNxIuFCHwSC
         CxjXCMMe/S+U1MyBoLBm8RNRbLBcLvmrwllilDmbvj5WTfMLTo+nwe33+G4GaTQsPjEr
         h5Lg==
X-Forwarded-Encrypted: i=1; AL+hErEK005M4fQjG+Kz9jaxkZoxS2RghtGoJtUdPo1z90zXE2W7gIzGR1OQxjp7lkzSIWpP/zD6UDPzntM3@vger.kernel.org
X-Gm-Message-State: APuU4Z+CzRbjVBkzL1GakQyY9qcDlISXocusjgKFiM3hQKK8UpVwcWac
	0kl2dQY38l3Fo/kDVp4X2X/RA/3XfqoYg+OE4seWPIUkVa8UVhId9Zs8bkT6ICOpfJhfhyWQWVW
	YY+/RQTPNFVkTxlvnz7S+YUbFQqqvoZnF45VUgaWK9/Ml9FVxZXgl29MeIttL29WQ
X-Gm-Gg: AYBFou1xuKfG7eQ4fJzFYMYT7OnBO2h67tQzVnwi6jCT/VUFBXiwerJXav7QJpjSJgz
	nVZjIDkceElttvSEyCUUaW6Dm/gGHMigqUMIxMm8gtHjR9Q84BuQezzHB1gt1NU/Qg/LoSBsRkb
	St9bfAkzBcyy7VUqkGzf/KEbtD2I37T+x4vgFB2d7PyRDmGIAfbW/djMGdBC8PFFasmznC2WJcX
	AF15LwkNCY7IJowk0nkRJN2caEFC7/ByG2/aLcBzwb66Rwcjm3aBf1W2d7XL7jEd3pee0uqrk9Q
	PH/rFM1erKgCGLKYgUCISB26A8TC9vLKarFv2BrCK2ZuH7YgdRy0u6sB+IaLLcrHt2Urrqa8Jfe
	ptz17EV9/pr7LCH/e5GoWZYzS5vEEEPLsjIQDc+VQpbxqphQkE71CJGSTciVJHDtPXnkggRZCFf
	kQqRi6fazOBA==
X-Received: by 2002:a17:90b:4c50:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b182ec2106mr4744148a91.13.1794461651180;
        Wed, 11 Nov 2026 21:34:11 -0800 (PST)
X-Received: by 2002:a17:90b:4c50:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b182ec2106mr4744124a91.13.1794461650555;
        Wed, 11 Nov 2026 21:34:10 -0800 (PST)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm2661873a91.3.2026.11.11.21.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:34:10 -0800 (PST)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:03:43 +0530
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for DP
 alt mode
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALZP9WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINBNzcmsStQtT07RzS2t0E3LrNA1MTU2NzRLtEw2TLRUAuorKEoFCoP
 NjI6F8ItLk7JSk0tABinV1gIAm72PYnUAAAA=
X-Change-ID: 20261111-eliza-wcd-mux-fix-453716a9c1a9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794461646; l=2340;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=baa38kPr+hJAvV/xF+9iBrY0f4mwj5mgcjfVGbGjZd8=;
 b=Hl/+GuJtXuyNOW1pShiG2PAlTaHyD8OhvSgLvAlVVp8LP7QFAeZE7luPLGNUsyMmqOfRSNuqD
 5YR+/hGA38FCCAlxXROXQNpKd4q08JIyw3Th1rs9vd477/If8Mg3xb5
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyMSBTYWx0ZWRfX2DPnXwfjI5Xc
 g8epZSP58ytZsW3vqEp2mDSTx+SnD1ACniUyztsoxQRHaz9EnPEyQcQUD85ibbELOKj7VwGlgMR
 XpyUL/fmWT8Jp5Mk5m3kQUr/u7h2mn8=
X-Proofpoint-GUID: pSeqK-cz8Bf_CAsYpAkDeUz5gczYaqDR
X-Proofpoint-ORIG-GUID: pSeqK-cz8Bf_CAsYpAkDeUz5gczYaqDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyMSBTYWx0ZWRfX52OnE6SKMecY
 BS20QTOrxD9RO4UYEUAF2MwBNTcXml7++SuJupTuBKHkvxLO1ooTnm6J5NK+3iegZbWP50BnjZ1
 YUS7PowGpQ+8GDARQfGS+/aPrUCFv/9wcQdP2YYsDa8NFfQ4UbX2ucIqClCCylQBnNwPDt5ywbq
 pKl0Fya6BYHjO2ZTQyxbDcky0DaMQizOd3/szyZg+iH66zBhJQr0cAKptcmCM9mRca20YMQlKep
 pUwL1pB+ioTPU57PsAOBh8JpPoqyIJLBbc3dupXlsKPyDX4g5V6F/75qUfCUDJYUUmf1Z5EvBY5
 dqeDC9NS7KKEwt3/c/G3x564JhvA/tZDA1NvsfVawuhJQWTrFwRmgBSK3hnRdXY+Daa8hdZySXB
 SV5k8L8HsysJSExWTfOlXqYISVUps7+Kuajf0MpsQybuS/YLwWgYk38zwh1PS8ndZAjp0CauGDZ
 IdI91riP5N+lF2jWC8w==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af54fd3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jVEDQz8d6yieKVSr1KAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120021

The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
connector and the DP PHY, but eliza-mtp lacks the devicetree node for
it. Without a physical path for AUX, every DPCD probe times out and
the display never comes up:

  msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
  msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
  [drm:msm_dp_bridge_detect [msm]] failed to read caps
  [drm:msm_dp_bridge_detect [msm]] aux not connected

Add the wcd_usbss typec-mux node on i2c3, along with its supply and
reset line, and wire its SBU endpoint to a new port on the pmic-glink
connector. This gives the AUX/SBU signals a physical path from the
USB-C connector through the mux to the DP PHY.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb..d848ae77ab85 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l7b>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm7550-rpmh-regulators";

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-eliza-wcd-mux-fix-453716a9c1a9

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

