Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670770;
	b=Srg41266QOR3MxHE50W6ZDx/h3BkRuuVtufbQQWNvtGHNJQx2fI0yYzRtwlFiW3tEXfF
	 K5WkL2Gekfa+vYEUJrSGC5smMkXWTAjvio0UVSAot2Hee34bmIGHQr2G2Fy+4sA5s92p2
	 wGtjFq0wtFVs5MYRobG6cwNhfR/iFaCJr92VfrUVhy2sQztHxDu9UFDQUNDxefhw8ZkCl
	 D9q5eYF7CiYmC/rTRAOkbrYDFbMeNNK4wl8+sUiVsS9rXnr7XY23VOxSvnVu8IjoLvGk3
	 WF1hEOql2vA90teK+iRVe+wx7k2HIflMws9W5WySnr8FHQXqu8DZzuuEEQ04ER35arA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
	b=NnEG2q7lNQVRX+CPquHvVqPb63RCJ/wZIvJvk3/qsxjs3C8ICGb+vflf66tO0Y9GWS/K
	 oxIPZeWNgoYWfvSde2IsTSW688tcmPBx+28ysciQJzAW18+ENZHPmmg1CUBw9dipUd7gu
	 G3CKKclCbfMNPFY5IZqVeas2sXnjo0o1MZ4coavsawd/p5cf4HMVUQQ7Of6ezgu+LGrQA
	 hGBvGC2zTcP/vceeVewjGvGONPTRJarzsriInl4PlKz07T874kYN1bJ/z5ofcTeeAfHQc
	 NI1U1zdbgrbhKB5D/ngs7PrIyaTAkBSQkQ2BJx5FFB7xP+1zDjieGOpMJ79fwgDdYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zdhatu1Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9A606A8B9
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF9A606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zdhatu1Q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkSW53741019
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=; b=cTP3ivf6ECAC8YBw
	9xu4fuEKf2DVcmFkoxNpWJ6pwlOo53wu8N9R4HF9xBGmeDnIujobt4euOZIkoM4p
	9w8XNbByZ2Gz3QaVzfgo714omKWb9vOVQgFVZTbrwEsdfF5EjgQOBh/nOeOPSLl4
	uLxQzFB/UMotjUYj5LTrquyTYcT74OU7Fwps3OgK4ymuvtR7n3fhnVQClAI9Kady
	c9M/XDJrEGlqQTnINeq0PAis4eVSIvxKuImDi8tNmJJhTjmj9zymCHVrZJxC3RoS
	AnX6QrTZavTqveeCUKj5bp2EFrpRT5TrKPi94vyjmR0YyqYMip2JqFpOa9nol5W7
	m/He/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh7cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea4a2210fso24906326d6.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670768; x=1795275568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=Zdhatu1QQuNCElVdnBkUVeY3ZU/Y92N9Fii4qI299Y90NiNp7GOlY7Gc9HEWrDhroA
         D2nJgTcJkhd6gdD7wBTOFuedCveh+2g68ZIwvFWxtQB7QEj7xmZErCkNt8l5g7L848e7
         umEGeIsVZkrZpq5PbQ2BZCwDMcMC0sUrtmHVawa7d1h8i4HtD565wagZltGohLHh31ws
         3Igbuv/hJzzytg4G6cqG7+nd2UDWCUkeWv+ibxGAFlwghkmhVl+q8tNfV11eSsogIRoH
         ALrJKeKEgqAzK9InN0xu01rWZQMwgWbb4UdSRnZTxYsLiUvTOlq7zRNBQ4RepbPnXCBe
         l/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670768; x=1795275568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=ZHh5jkCeGcdKTP4RwiJrRBCGV3VETXaTsyHA+MUWKFNdEaS8JqVfq7cFZoP1zbixMs
         1PY6PiX5oVMZHdCpykNEbQEffghHIRPc2ek1msuRH+yLQwjr/g2PYO40izZzPntvNO6r
         oBZjDfKMJhOvgWONfL/R7PkRJHIz0KYatcNcnzJ//HTnpf/gaCkSPl6Z+6eg+UAXtlO9
         b65HlxAyazKfP101EV0n6yjInugd1rOIeGRA1X06/7LcP/WfribT8IT7hMMA3d1PPucD
         vFKTXQRUK1Vjg3/SAhRATcStWn6sMwecPRzp0qW34vZaay6miY+7FlPSQy4CZY/KyLtt
         /i0Q==
X-Forwarded-Encrypted: i=1; AL+hErFUtzls9BLrNK+RkMDL4kY8kFTl8ArDULD+OHfiUaUSEKcyYkH6JXJWKXGlUyB67t5XyaSEvXy5iofQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9fd99IRpDtGMYIwV9eHV2cwnWje2+qgxBmT7K0jXg4opVIUa9+
	Tp2685XtEj54BYaYujUGdBpw5C3FVk8KQFyuwr4d257d3ZmbOPIBOszERiPRyyq+Ehta5H3usH1
	m9SG6ddO8S3M3Bq2IJZlYjBIhNxqMWPlYWGESuHF9kpM1JnwHY1cLqUzusAKZjp9w
X-Gm-Gg: AYBFou1lAA9qYo+0K82pGziqQQi26foOOEpGT86KXLLlQwBsQkBTZuIOylzvH4gfhcn
	dM3jAzylzgGfhVzg6mZ5XN9QcOHVCea1SBLmXFZCwwXwQSxKcSVKzIPUDqj9sqGR9ZzhMgnjJ5T
	Ac9q20WjvuhBCnH5oXOH/XarMLUgKNIT5Ifidwnjh9e+8Grt0fv6hLQse3eSJeebN+iG4A9hPEg
	hxVx2685/uH8F6eUTenSsCQ5Sv8goF1KggJmPMkXxHhO7yK8gk50CDXEiq1I88qUSfs5pliWHaC
	sd/J8WgBXCM1Z+wWSJ52dNzN2qo06RA27/lLKP9pbE9A6gxWsN2bbCffPwtipGMHA2vO512IpSw
	DRCYnMl0PWansHGdrYorpCcJt2+Fw1JaVVvWrBVsoiII0QEMvbgytK0WA7uz9RlVylDnGL9hvsP
	FJuinM400r+cw1
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926688585a.16.1794670768399;
        Sat, 14 Nov 2026 07:39:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926686685a.16.1794670767914;
        Sat, 14 Nov 2026 07:39:27 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:26 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:06 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261114-qcm2290-eud-v1-3-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af880b1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aKcbli_B80hdjCVHfU8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXxVXmlpbTZrbe
 Egh6J5Ad7W/mEmc9UijXW6ngq3nLCbA3dMMkdexIOJz2OXig7+LdtQ/T0hT18rCBw4aJDXOsrM8
 53iFuHQs43sPnpGxs/5qFriibFo9b3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXy2xGVPh0Y0xI
 aBtEZeaREuB1IG765UIdcsknU1620JhpyunfQbXl3Zo5Td7kAol4FT4g3mKPNFjsoC2IsjDReXH
 U/r1aYdobKB6IklU43ffacWF+SGqiGH8BttZRA62dgAV2o6n89MOBKL+otALFMcH1Op4bDlLQit
 jmFGorhNTY2q7Qk6SWhy49A//UsgCqCLKp4M2XRUxHUi14P5FfkeCgmIy+58vePO2YndXVp4AAa
 THbuaI4mL2oOszgqSBCzyIA/Yx6bXN+bJ7lsSrnr+z11ZZ6OS6edMgNlie27X6lnd38eDYiV2DW
 lBxcknKw9c7nso8DhxCBsueW4+6XN6t2QR5Egst9jgJbjQN8V0feTz7yExPF+WyLc13kfeTsXhv
 GOHEmp1a8lq8caxxYTu/V3aaVHVWcSevqtLfBtAu4VV1yB4ZlTrYPkhMQJthRInjJjLcV2w4R5V
 OdpLdg16ziLneiPCjUg==
X-Proofpoint-GUID: XQeHjeJtKsHcG6UQ5-dXmfmBHt2RdAiO
X-Proofpoint-ORIG-GUID: XQeHjeJtKsHcG6UQ5-dXmfmBHt2RdAiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

Describe the EUD: its CSRs at 0x1610000, the mode manager register at
0x1612000 and TCSR_APSS_SPARE_REG1 at 0x3e5018, which the secure world
writes on behalf of the driver, and its interrupt (eud_int[1], GIC SPI
189). Hook its port to a second endpoint of the dwc3 high-speed port so
the driver finds the role switch, while the board keeps the first
endpoint for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..a77a5bf87838 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,29 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>,
+			      <0x0 0x003e5018 0x0 0x4>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1703,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

