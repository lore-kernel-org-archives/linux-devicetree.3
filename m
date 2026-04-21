Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A336AB56
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776766573; cv=none; b=gTzqbNtezQLb34rpqQZ0pOD9TwZWEaqhz1LVPa8Unz4N99A9d/VidPdsumZ/Uf886UZBVC4cZRbO+w9/mLMmetfrqyE8oeVVZjLno7RVwAUYnp2nZq8a5AtipQt/7maOqN6sG3UY7YyaoTHPz3ukwJ++nrF2fvaT060TculnLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776766573; c=relaxed/simple;
	bh=kbJcICYnHAbrzJj1wFp8jBdoXwYl/PBQjV7QQx+CG9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OdRV//Kbxvk0wE+dp6CS3NUrUbCqOmLiuOA/69R8/aBKGdpDTuQABjc0fwd9jn0NzR+TuS5BtuFF6+d4WdR7EGdIVmZW1O63QiSwEM6jNwnpN0n7ZIzv6SZE1Azt3znpIOF2xI4yS8EW8ppnpyfvz1RAR97lgQfMdilctWZ4OQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPLsFql9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTX3vbYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPLsFql9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTX3vbYE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9UgOK4168833
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6j
	wz6YoSPo=; b=EPLsFql97R4fvImj9rj7vei/uA4pC8ukNr+4D2IgkZShOo61FWf
	mE7UHtai7ef488iK2tRjc1YxsTuu7eTt+IbkplQXU+w2d8cvMAgG/ct2QGosln9k
	ioRgx0GqCvw4d5QzAPS9VpHrsFfDzq60YBhPPaQd5ob5z9ZiYCKEgnC+XKxZiDH6
	0rI82wNF3pWzpwGS/Mlx6FWJDZrSSqOJR+5yPY0FckbJKbZb2yyXBo3GG4QMspFu
	feXbPOjwIOGzvCK3Tn3p1lkIAcdFtV8sp6G7muJqwIDmY7NMekT34pJcZ40NLixT
	+xPhJzQueUMSSL8sUw0Wddgwc9KAUHMXkxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1gjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:16:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso112004161cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776766570; x=1777371370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6jwz6YoSPo=;
        b=DTX3vbYEFtX8JlKPI6SMqwsTYlngB424Qtv6rqSBFBhVkP32ZToDbJcUXMtBk0QHZ7
         JteJ4ESSjDBYC7qTrrQA5DT3nN44dkbpII4z0Xash5dA5RF2KcaVC/vH7bdXQZD09/hJ
         ZJMrMOatPlHbFjyxYazWW24F3LSmXgwED8Uez36ZA8tNcOV0jeBWDJgcwQJPOd7Q/MvR
         QZ9thqLbguwOUIt8bu6+G8Knq3x2xoiJoOiX0b3zpIPBFNE0x5jxi6NmvTo/d+QWs+rX
         ySVI+ox5Whg4zL0r9fPHFak47zW8qWwatyjBJ36ZuTrzyZx3LkZjt7q45Xxz3UCxYF55
         Gq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766570; x=1777371370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6jwz6YoSPo=;
        b=WOVAcYFonfZb/xrBpYLP3vXEjty9t4RT1uldV9TGuyq26Mdr/Zy2uoSPr6VXhuQiEw
         yqEwzCba4T20Xtcc2F4M4WJ4Amng98AFd1qc0e+I9TolHrAxJjPXEBRGRNsbmPcT6vn9
         iWLikocc3GxHbOt6SQ15s3y14LEas28UpFw+4zq9Oxyj4D1NLg0gJeb9yziQyV5sbXqR
         1kzGBtw55387dgMe1ewbs96OxAbmkMdnO3ieIFhdL1ahmaVqDhJmrqYAcUsQj/YkIzHH
         3DxXHA/7t9HHW9aqVi9Rzm5Md5wS1SKpNtLar5nMWcG33C1kSEiQzQaXptXXT7pHP1Xt
         IOUw==
X-Forwarded-Encrypted: i=1; AFNElJ96EO7Rn24+dffN9v+CV9YUsHPN6TdkYdgEraEEINI5CZOBYLCDnnF4cErpoyTZl3oeWHRnRElJdY3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ErSQWHhhFrz+tPaHyT4ZWo6RW4773RdOqwI7PE05bEoPoZXT
	WbcHVmFK5cB0ZrLp9d1i4OIhlC7z3CEj7pzCzlAE5/9hTO4LjrZrnulmaZ1ouCyKNZ59dlMHtwp
	B9JjPIoLWwUWR3locxazzyjacqF2KXiO1tDRjLsfNX4h7ncirsDjZo7YHOGlTYzRI
X-Gm-Gg: AeBDietWAmlnmIk6RC57YlRThWCeXeBoyCPNx0nW5ol9QenjZZAwG/LosEcbD4Cqd20
	Ky7zha+eEGTp1GVo/KZbrE8Q/CVpEzgqLwlydoOdmzwNvEXMW61cN24A91LNnfW0icw7/S7Cla+
	DCYSglBzE1q+a1zo8chukJUQ3ByJZ5i5LHUP1U9PgvMMKlRfEX92FI/mcCM7zALfC5Xdn/qbwyW
	Evspx05ibyBqWheAaYKpNEr4Ip1BuR+rSWGjWK4xD6bB3h7JBcy9SX5/rriPsaUsbx92id18TLD
	itgxLo2LHjDvjvGGDl73lJcfr1mgAWcINrOMRKtOpo8/IweV+bqnqdMzHX6k1VWDx7Q/uvQXEtw
	rzBgxqClt+LRuiVnvy8+3/1jZhxdHc1bjLaOXdS7vPnh5w+qh0rnpfmchT2it74zCNimnubJPBl
	7nWAw+qPE1ok6pd69TfEg=
X-Received: by 2002:a05:622a:82:b0:50d:91e3:b668 with SMTP id d75a77b69052e-50e36bf6b6cmr246921311cf.20.1776766570470;
        Tue, 21 Apr 2026 03:16:10 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:50d:91e3:b668 with SMTP id d75a77b69052e-50e36bf6b6cmr246921011cf.20.1776766570056;
        Tue, 21 Apr 2026 03:16:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:34a4:17b9:744:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1c38csm424875066b.41.2026.04.21.03.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:16:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and connector
Date: Tue, 21 Apr 2026 12:16:06 +0200
Message-Id: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMSBTYWx0ZWRfX+/+85JdIhy2w
 wW/A4Wsq/0WRXY8RzTB3CkcDltt2FgrTanqOb4QRH8BLEPEMePf6q3essdp65GCp1aVYjli3Z2D
 gA5AgSqZGDmUyYNC5JxD++Ji0ilm00gPuqwX/AvDO4mfATEea+19vyQTNLop4id9/Bm4cnTaou3
 piUVc/YMOuR6b6OLKZZv7il696bdXZgEOJ8CJM/+tGZhwW67eU+kvzW6vXmMaKs+2KZIEDmC0zZ
 3GcjYIKLFH+Ly8oa/WwLJhH2hEwtH1EzAJHdPt89Zyxl828SSR8Ic5MAaGG4RNMg1hH1UIrvFTv
 VzR69QF13RgdnjuqBDP1u0wZ5V8JzwSbdt8md/evI85f0MxrE9VDjbzqtWjeayIcSdt9k9TB3iU
 NlZKi8LmmZWv7VSzB3VXJtjqPBagJzgQY0FKxENw1F3blrMjAijoH7qwFQ159oblgbxbaueOhR7
 BJS37iKL4LIMOu6Z6WA==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e74e6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: taDIa21IMSd4uMMp1p1WQhMzGN8CyIlg
X-Proofpoint-ORIG-GUID: taDIa21IMSd4uMMp1p1WQhMzGN8CyIlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210101

Add the Cypress USB Type-C controller and associated connector.
The controller is connected over I2C12 and wired to the USB1 DWC3.
The USB-C connector routes both high-speed and super-speed signals.

Enable dual-role data and power over the USB-C connector.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..cac081516844 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -245,6 +245,46 @@ &i2c12 {
 
 	status = "okay";
 
+	typec@8 {
+		compatible = "cypress,cypd4226";
+		reg = <0x08>;
+		pinctrl-0 = <&typec_default_state>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
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
+					ucsi_hs_ccg_p0: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ss_ccg_p0: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	max98091: audio-codec@10 {
 		compatible = "maxim,max98091";
 		reg = <0x10>;
@@ -392,6 +432,12 @@ perst-pins {
 		};
 	};
 
+	typec_default_state: typec-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -458,6 +504,14 @@ &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_hs_ccg_p0>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&ucsi_ss_ccg_p0>;
+};
+
 /* Internally connected to the MCU (e.g. for DFU). */
 &usb_2 {
 	dr_mode = "host";
-- 
2.34.1

