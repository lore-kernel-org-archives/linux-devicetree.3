Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C020B22
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850776; cv=none; b=i4uZB5klBwTaw4OY6MfcOLCprUta3gkuLgNYhR6bVbMJZgdUm8YudoZBHDaikbWsQkIoiAK7sDoR6yC1YjcF1ZIaoWyeuAWc6wwCp6yLczcPIClKdnA/EBm/IEqr0Zo9kL9wsSU1jKMmyCHo8o2OC/XhVP5eHKqYH5x7n4bMovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850776; c=relaxed/simple;
	bh=lYBtb/FXLnrKMGDRY9R5zWWqwoEjMD1L30jny+RJLSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cY4UiZ+c+6x8fzSL4U6FHSjIz3YsRimAeK6Q1aBdRr7BCNje5H5iLzrwCZdHAnFvZVpw3bjj40o2t5zM8JsnkTzvRBdLOYGTznSbjfKxH+e2YE4TJqdLYvyI5V8s6r11+NL/gxFcewm8yLRoT2gvW6ewGjPGnWbx8ovRE/WmX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRfczsno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnEUZiFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRfczsno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnEUZiFP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M9908C2639346
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0
	bSNcN+l0=; b=LRfczsno+Gy73PGx/ywrfzaDoeyRo5wWkJgMKsVePg2bBXz1efL
	egsSWS4rW2tIT2I//4+gP9cFGhPQHKrCppe58OjOwOadzVjqzQWL90kWuNQyqojY
	3/OAuFX2txcOBGSBPqCZzQoAa8umqlkHgY9H/1aRGsUP56tY339xRK+14jIbLBBT
	VAocVtsjrUdfGAuSrdJCgAccRl1EvOLrsZaazFkIMEZAcpLQno6M/7JdDSKljqGB
	rHpIyfSgDiNL/I/2S+x3XkRtHwmOgnfXcXa31CI78aT9WQkVoBuwe56cW21NCvpA
	r0RYCOChN/X4VEtfqdwqSmACY92cJUnDFJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhaqy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:39:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso5115374a91.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850773; x=1777455573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0bSNcN+l0=;
        b=ZnEUZiFPTdP7zF/hc/EDx3+/J/pyoeCX7HiDdUT9YhX+D8MNrTazGThFRFOdfkSj/c
         L1Tp9JqQJPG7eYCXA/xUgvdUND99SEfazVXK/NNf0hIoJ5p4KWXciViNJn5ARUpDFEZX
         wIIAHkKQYfrnSbXwjd/M/UY12P4mb/Y4U45vdiRjVEdBRIEJgL5LTJ21DUJu533BVdhg
         KGzAHUHRh6sZbkUgMnqc7VjsIWI2rBpwaPlm5/liY891MQj40ZVikH9kYylRDXKTDlmR
         m4rnKnpJeOjpCMQofS8hHDtkKUOtdVTbsl8ML9Hqla9bHHlxlATsu6QjQPJmIFjiroeq
         kDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850773; x=1777455573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0bSNcN+l0=;
        b=EysZEA8uxrZecE0dPxYnRmGeP5kGFmyrB5DyaXRb4vy+HUKCiwa1hk3mvbI7vD42TU
         hsU7++/CKdmDgd5de5QPXg0yzuYiYzQa3beb0BTlyAUsLicV5TUPfvE9j1pkvfAHKd0W
         od8cfYzX1yCgJnKEwy+6H3iBWy9DmTl7zcB5yt0tOBmS40ES/9vzLe3s4J9wcM8EXboW
         TurVoTeCnk6J7GZGz+SfAWvk9LmaWHRSijasvRVK3UmwNSjir8W0GcyaF+1YX9C4cc6v
         PXz8iji3z9AAb71G9p8ydrLil2Nhgfk5ICwb0BuMD5XhZfUBkwyb+/dLPpIjYgbJ2T/f
         l4bA==
X-Forwarded-Encrypted: i=1; AFNElJ+x/lES1DX7XeV7cXyRKCDwKVWfWWmPAKDkvDYw0AxNXpAL8goCUKTk1MfpOKEFmnsSvMF/M7AYfUR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zewiQZsD4DRDuN3UjPuHpHpCAymt9pkeolfYfi9wOmEBLieI
	tbEtS2uJKDDOsGAlL13NwagHzwwewBZp3YWnIAkyNBVjh6nR++AYojk8E3aQIFfFmC3E/2yjqT4
	/nQUavojj9WZ3ObBXwK2crGKP1ohPBBk6AWKLFNQ/TMML1oJrltppnljf9CMIJJD0
X-Gm-Gg: AeBDietBm21TvRNwn4V3+lVkhGcE7Z+u32O63R20qXJikbyPN5jvfExQ9Tvr7BWp/v2
	77yuRw8Nbk19FT7bx0bpuNmZNUopCmJEsCDE5jw+zOe338KByQ8RIe7vUB/goT7Gg7ow52IqfEU
	hlEcpcWFxgrZ1/0RbByyxe+ii7quPAVgKN+v25VglExjvARQwVQ9NXM1RRUPskCQ/H14iY4RouO
	3ah0YAtoAiX9widcnLlNCIeHXANIgzLQMnWAujRYYzRDMpP+SJB5Md/17zgP7o97l6wr/KJTOSO
	vD51clWlpLH0teQisuB8hyBFOovP5NgvEwwptrontLvnlVZRcem9Rx5uflais0b2G4uPOaHGlAQ
	FSxWsA/BbNH2xLZ8RWqIknaXBbzEBjlrkmQjsavbxYU+Mt5HTO8UAgnkwnUcL
X-Received: by 2002:a17:90b:5203:b0:35d:9560:3efc with SMTP id 98e67ed59e1d1-361404632e8mr20112383a91.14.1776850772396;
        Wed, 22 Apr 2026 02:39:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35d:9560:3efc with SMTP id 98e67ed59e1d1-361404632e8mr20112345a91.14.1776850771789;
        Wed, 22 Apr 2026 02:39:31 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361417748aesm16097037a91.0.2026.04.22.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:39:31 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0 port
Date: Wed, 22 Apr 2026 15:09:24 +0530
Message-Id: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e89755 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UU6esRB091ZTEFAXl-wA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MSBTYWx0ZWRfX/+SB/Nh3ZZk5
 0oyWh9cd1GNEFYMX9ATADFaqUGkzg5MNf2QERyGAELYHNcadUQLvJ5wbEpvhKKqX/XzAxCaPInq
 Eq/Cizk9vhdEjsaHPMoRipAegHdQCPiRFaYVzNYcbbv3/tYWvL9DZZbsRe59ARoVc14bFXxqo1M
 fSpWeWp46EtfS9SzRnqTC4S5gK/sPZZakEFHslaCOwRh8UnBmL0O+UBLXL/x6X/DQZJUjwdI5AM
 dfeZcL/jgQjoLHkvajeWv85jqgDzfCmmog1OxMKUJPtxs931pEGjnmAj42XTYKMVp5oxbHTlOJd
 DMnr01wK+8dN+8voohNtgsU6LodTlVdvxvPa8TCTVWtEoYPNbLRI3ICjvNRbEU4W1S8N3874BPv
 JTJPeoieS26wuIZjk4rzcwJKp25fK4HklIUPlqF8Hq3vU+mSlJgPhGgSr/35AZn0fhsYo+BmRgp
 WrHuGfq7ulpB2QmcF8w==
X-Proofpoint-ORIG-GUID: 7Kc5kD6MnNznaMh9hzj2bAGgwCAJDzlY
X-Proofpoint-GUID: 7Kc5kD6MnNznaMh9hzj2bAGgwCAJDzlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220091

Add the retimer for usb_1_ss0 port (USB0), in order to enable
super-speed enumeration on that port.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Cc: stable@vger.kernel.org
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a9ad05bef5d6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -118,7 +118,7 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
@@ -785,6 +785,56 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1541,7 +1591,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1

