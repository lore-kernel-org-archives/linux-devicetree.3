Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462362;
	b=suflSr9EaVNa2hPKpX01nsCsGglOq0/iSzYJzwVK5Jz/Zk2BS2Mv49oZuKZOUOd7GfcQ
	 cKow5HXZRGBMcZnBte8Qmq+TmJHY61vCO6f5MKpzYur5hWt1Jt6v76t/MIzfVKUZFT9O/
	 zx+dCEwNGpCe9Ld6Z6kA8hYA1x+DOkuNHO3UHY9HDv0QTlxWIjdFf+xHTOUL8fExIbebp
	 g7FcAR0pTX0Dt27vYycJfokuDPv5PoyyL0fKRtWt4he+in0nrTOq5xvnF/zR22f98w07B
	 PJpQ4L5ojMQru3Gg5HA9N3n7gWcQNaEdsaULIu7dJdAljF3Hcfz5YANOumELiwhQIOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
	b=gaYAeiu8qfxJae68JXi6kb52BO188qF9ScWDP72p3anMvEwLX6+c4D0ueeRgpRs9Hojd
	 OMNO5RGGNi2d77NQrJ74jYPjNv7gLZes0CzD3Pz8DsxSCtYUuohp8vnDOCfSEixmzgT5x
	 IHpmtwDTogPITHgOXNCUa7k6qPAR/HpdFlczb2DoGSomwJj8OdElmFjl3gzEUelwXZ4lr
	 q1xwSxUvw6S9ltHmYKX5L4VaPmj+iWraI4L4gxZnJSZIXXk/AQ5PJXCejN3dqOJSdltXx
	 HbbtzU4DADi2TeGQI0NpDpDtmDUYxdFkLc4EBBH2yHfrn7J2o0mfoMdzk9dI34QSkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XcTKBA/l";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EBE606A330
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02EBE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XcTKBA/l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zjls4149502
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ES4raCN3aLHhgz4UDLc5j7
	WzxJZvAOaMMdlxyP97cFM=; b=XcTKBA/l/X5PQWXChbcstZOeCJUc7dkXnpt/Pa
	b8IZWgh1jC6tRllbt7s9y7qz8HqIaCt3VD48x9x6Mh7atzaPSZPsRmLi/OgB/wEW
	/w5DNpTGqnVhw5vY827eHO7VWvsHiw3+TiYHAQY8bC23zUhkbu5csP3NZKzw2Eo1
	3rWUKz+xhRaNu+g1V9q7lZnBWRMHL/Ub8GIfgghU5DHSmHWkw/nTkJ6rAZQGUyvY
	h3n6wvAoFWdHhvQYoTSUxbMrz6u13V/xqs7HJtsavjlsx8DxU7Ppiq7IRSRnnqPN
	mPar68103OybumnYa+RtRX0PzvHBy/xoifn6vuQ1VJF3u7mQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61w5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:46:00 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-49e5451d6a5so3893645fac.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794462360; x=1795067160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=Ptgz3xq8scrmlOYtYbHRxEAULtvh7vbXwV6rShbbU9Iip0kXwqG73k+80cQPML4v/1
         XlYBz5fKpZdazzUXlLfRXb1Hnc9BOMpGxFaB7dv+4Mrf6LI21DMIrjQEjoqpiovxM5e3
         dn94PtFdN5cLRMiDVBIfFUzv7TSwSLJ3X+jHHzY3HDTFrWjtC3tg03VBNCnzzkcB/0mJ
         yTB7QLnjCc9n1+e6cstpVC8dCoCnopTm/ugWp2qWqH+qNmz27JM7Ckp9usAr7LHPzt8F
         KjR0h6WQ3mV9Et5LSweh1EA7HkyEdhCnBPqThAxdYcD4O8s6kc/owdG4GqzIBM+/am41
         n/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462360; x=1795067160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=Q9AZA22UEbu9Pa38CGs0wQiyp17RIs80g58QQXkailSsSKV+z2SDLXSXvT0xhmnNgG
         AyWOXKCNPr53s5pnMvMGpgKGEoIKCX9oVjMMUdmmJQ8vhFVxbAXfe3luLUApft2vS4xL
         YljYtpT7j0Q6An5FKBwiZ1L8kTNvkrbLMGSciCbGBYo+Wk89s5dG7ziYYMHlHP81mtUP
         X0Q8dVHr0mlPjz9QQrpPbvPHKdcI4xIDeKJSo6uuHxNtPPWGAcz48+uPCXKf/9ljf793
         dPjcO2rzOaWYJigTq/6RI12fHXV6vYirCNAqdR061N46NSKFlEZnwtuFi1VZmNqpJFSG
         MZZA==
X-Forwarded-Encrypted: i=1; AL+hErFWs0GaAB1MWKkXWpcnIfUTw/L7JTbYHyZygfGFKwNwowfLxjdq+wBnNsj09t8s1rauRiGXlJUAFI2M@vger.kernel.org
X-Gm-Message-State: APuU4Z9qO54lyu7DZ6JKLlC3jPAgIFj92MJNy7a7iWy3bHy+GyeV4wmm
	pOpvETKVdS4Oin9wl9OwXZrMfi7ct2R8sPd/IpkvIDfOoltG8N2c8OYizJq2b9jjjYVHT0iCjjB
	YpGSfTr6t0LjEbMtWCScTJCjr0a55tXd4aX03yFmzWGP8MOcWpitbchHMes4WX3Zz
X-Gm-Gg: AYBFou3cc0PUWW5jlF72dJrd23/R78KVSg5LcJSMaWDrBhhiEic72Vwq4Gm0tY9261N
	lvPU2xlcUv1YVkSxLat5l7Fu3x84Nz8sshAR5QVOsPx9AokJD+L65IdxSQgbUsgOVMniFxpyj/1
	QRmwY2vQWLPAHcNUtGXvvk4sQOL/8WVcfBXCEjNj3ibdO+jmni7D817GmRhdwnCx5NCRVlU7RP/
	fUTQUN4k/prtBb/IIZz/cGUSFs5fFnWdo2qNijmlXyhMSP1iYFSY0HVh6dJ9WMi8usICo80OdWX
	CVaTh+9HmQV2GlkD+yu5u9VLZg6hvI1q4AqdyG95iBqZrS+zxOb8C/l+duqvp3R1yWNls3nJyvd
	sK/PmHeNtUrXJkfTcgSDNkAUnlekfIGMlpX3pquQJAfBsrXYlqosRmv1lMgccsuGtQMMi6AcSQH
	eSiDlTNvj6uRSjmIQsYvWtB6Vr
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934204fac.59.1794462360100;
        Wed, 11 Nov 2026 21:46:00 -0800 (PST)
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934185fac.59.1794462359570;
        Wed, 11 Nov 2026 21:45:59 -0800 (PST)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4563844fac.6.2026.11.11.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:45:58 -0800 (PST)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa-advantech-som-db5830: Enable DisplayPort
Date: Thu, 12 Nov 2026 13:44:18 +0800
Message-ID: <20261112-hamoa_come_dp-v1-1-a77597e29e04@oss.qualcomm.com>
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
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261112-hamoa_come_dp-40a7a09236fa
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vVC3RCo9MScEtL0l6_9KR7kFBwZtYHMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfXxaUygtVFr1mx
 ExEalJcertrDJuJ5S51tDR4feNHKoUxK6eX98yqRkvyf8FHpHB/H0qFJrJh/3JDf6cKtgwvl6OD
 L9k8Sp5fV1AAWqJ+SVC9HTE094746GSptR+E+KXwC0j7QlRQ+G8KQMwVY1agug1H23Rw9jI+3lK
 ulu9Ook3h9fO6FG8KtYHWekI/etiBro1FHtU5mRpd/e4n7gXmo9IdZg0Lrccdb4NpTbg7B+a+Uq
 zY1n+92tJlHUhO7ZdDQhKx/IvSEpib4ChLjKneoKnqAj7XHgoZ8MYutGobMWWHh5aLS7YKDaCKS
 tOCoz7dTr/RSPygqPO2fhIFJ/acTp7SP0uMMxJg/erYS+UoBAX6xQ6XRxZeQqrclSfg4ns7o7DI
 9dZnOTxivFpxdOioG3tVwtokOYJqX5hgnyyaIZJNAhey0lBgOQ+Xc4rw3m9YCeIMuUMM47df9Ml
 oWmv3TQa+k6PGo+CQLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfXxtfN5kNlltH3
 o6hMv00wcIO1tYjF4kINu7sG6kW43r+jgPhjpdufnxZeZCshuO3Rg2XzQdD880P9j9+p3eLwhJc
 8rEmHWzwP2g7bIqFxEjnrhPivq9n1qk=
X-Proofpoint-GUID: vVC3RCo9MScEtL0l6_9KR7kFBwZtYHMs
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af55298 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VT6PoHGwS4LR_UsKkTUA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120022

The Advantech SOM-DB5830 exposes two full-size DisplayPort connectors.
Both of them are driven by the DP0 and DP1 controllers, with all four
lanes of the USB_1_SS0 and USB_1_SS1 QMP combo PHYs routed to the DP
connectors, so these ports are limited to USB 2.0.

Describe the DP connectors and connect them to the QMP PHY DP output
endpoints, enable the MDSS, DP0 and DP1 controllers, and configure the
DP hot plug detect pins. Drop the mode-switch and orientation-switch
properties from the QMP PHYs since there is no Type-C connector, and
switch the corresponding DWC3 controllers to USB 2.0 only.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../boot/dts/qcom/hamoa-advantech-som-db5830.dts   | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
index 9d87c98befc6..e2c2a162c999 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
@@ -24,6 +24,55 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		pinctrl-0 = <&usb0_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss0_qmpphy_out_dp>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		pinctrl-0 = <&usb1_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss1_qmpphy_out_dp>;
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &pcie3_port0 {
@@ -112,8 +161,80 @@ trip-point0 {
 	};
 };
 
+&tlmm {
+	usb0_dp_hpd_default: usb0-dp-hpd-default-state {
+		pins = "gpio122";
+		function = "usb0_dp";
+		bias-disable;
+	};
+
+	usb1_dp_hpd_default: usb1-dp-hpd-default-state {
+		pins = "gpio124";
+		function = "usb1_dp";
+		bias-disable;
+	};
+};
+
 &uart21 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
 };
+
+&usb_1_ss0 {
+	phys = <&usb_1_ss0_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss0_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss0_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp0_connector_in>;
+			};
+		};
+	};
+};
+
+&usb_1_ss1 {
+	phys = <&usb_1_ss1_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss1_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp1_connector_in>;
+			};
+		};
+	};
+};

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-hamoa_come_dp-40a7a09236fa

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
