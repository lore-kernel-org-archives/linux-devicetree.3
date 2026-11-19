Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112046;
	b=zrgRriqwUvfbjgkrsFP2B5joKDYkJNQERrCZFNe3ucDQD7hz3ir606aip28RB30pfUri
	 q8kjnG/ocwZJD9lFIrwptR0NxFA2q6o76criwK06MCWlhX55kEdP0dLzJFHB2KHAzrx6S
	 f6nVBsSjeBAkl5gRw1xNM/NRiw8OeU4n1eSvdTPPWOzW7Nnin5Pe54luOP1y0QQHOdXfM
	 7T2fAVQ2uluxeqQccAapHH6U6AdRn64mP557DdXk69YDyzyPcx5UDIqHei5LOh1g1SvyZ
	 LPkxrmBkNZHNXk0UgkbyE19ECszf9bb7F8eRLKTMGdpnGVhoxmrMRsOd7HxiKoXK6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
	b=S5Xk826v7nDlnsE/1kOkP5/Zf0EQgd4k+HDTY0/WSTwu8VFy1L3+/eMyAoRovzNvHkQE
	 foVA6xKFh1obyp0tI1ojWh+fUJ8owtdWFDhAI/KnHLpGubhtj+4N8MWzDj4fPrhU4ldKg
	 VAl25M0cXoETvN3d7PjVLlQvUPeSDKdC6vu+68V/iMeDG9fpx9Cr/urrx82l1VO5mgGgB
	 DO2h3Fa4x8ayK4M7cd3BQydM6VkaIGMG4agIWV5iPn1PHATVBrI9XByGtcov2pvQDDkF1
	 G354NomDoPhVmeBIqWpWU2U7YaRDSx0t1mCktOXdgj3GQDCFcf9/KdgjHX7iqz0DAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPU7jrc2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E87606A339
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E87606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPU7jrc2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrepu1385554
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RDf5fdxVFMm
	XXR9kDYGrHbNYwMq/wZELirJuHE5RruE=; b=YhV7AfcLvYe7MNffEXW+q448bAt
	ac3SkrsEGtk/t/0njuriT1rm0QqqpoxD2XRHwPv2jaZJQS76VmrvGNvWE4YfdAvW
	sOlMnd3jdbn0kEUdGeMSsdWNVnwjw6ylG+V6+Ga8VyvK3G5AGc10RDHhFdLOg2KU
	6KE62pYgM/EOlyvC+UBRaZbPAB3jM0VzebP3YU+x9HuO6dbnRbfG1iLGgi+pNu2n
	WB9Zgp2X5UabEC9wucXLJsCdz3jcCL+Z8lyVoYTJKTBkP/TM8VhuSogdB/rnfD0N
	4kV6yOJiWweudav/vjZE784N0icrrigpqfjNWHKeex3qtsF1GEJnR9qQtRA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70agfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:14:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b29df78132so30185c88.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112043; x=1795716843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=kPU7jrc2wtaDqt+GchX68YU0LpdiOtjh6B1I5DzbVgd+zwGf+2P07ieo8MiFpK9B9G
         w5R9W/0PkCvEAm62n3SAGv150pOkfagxWzr8aG47fFKbxK7Kly3/rRg9OKo8JjxVWqpB
         4M8ZaI//qnIIPF8iDvc6efgNe/mVAEWDcQKW1pLf4qi8C58r6vnd+I5fOq2LR8o757Rx
         v9MXHSAr11hLv9fUNgA5wafjwf+vGdVl6iNYn66BXR8jrrEzPpZBlAxNlET8IsbKTTSJ
         01IcbOA+JHPtXM4cILHKl9LtGQ+87k05sP+X78NhxryXBbZNdClld7dARfwVu1eHQH5E
         XH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112043; x=1795716843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=Ez2nmYJbzTThH6X18qFslG0r2T7HJSTw0ZLyJU31m1FKDv9CYsO9ey3BSpyorJwuaE
         TWzVWWeEyOidxyzYpRxgRtkOTvXLfHMqCrh+H49I/Wqky7ZM3dko21He/W/ToCs/Pfsw
         lNWzdzI9iUytP5otKk6RrpgZAlJVtb9O7BVUdiR+UtMBkgMXtryt2F9HuNeGmaNjPnV+
         RRzfgSvFMh+rZ6q1K+ZDU2tPks8vNuC87C5GbOb7e6prqqH5saHL8mxLjPK+5rHdjLla
         43dUru6lJKiz3yqnVYenHILDbQaMyM/j1o0hdIebPUAD6yS7kXHGDiqNpYq1SdIbufyq
         AwBw==
X-Forwarded-Encrypted: i=1; AL+hErGqxQBi9+wmp0PsvH0QabeDeMUdX+vr46KQ4bAOauLoAXYX7VcSOzJKjo3yd3G8iZu5I0NsGIPgeu9Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9ukh8LDjtDq6VynblDXmglIQ8rSlJD14ydm4rxV6AY4cv07C1L
	7QF+P9TBqGBis41IklmqqZFbwjak4ORLZXg4Zbnp3L71GwUdVbNSoIvQq30ESdWSiPrfBw9Oey6
	hyY05IGrM4pFYb2zQiEzPXFAs2bJ59xpYmH3wMracsX2KbO0H/lC/GQzajy2Ol/Ts
X-Gm-Gg: AYBFou2InCVFG/V3lXmlNHjYacFid1wddBMJ8sSeSWWFb5YFtRnM5M6sRljMe28NH6A
	L1+Ng/FY00g9CHzIkzvjqALnoTYnyyta52PK8w0BkVPuWqfA+mnKlC5Pj8BuVC2Y2fQQ4fm6EMl
	Qot3JeC3cMk7NCsi9jUtM+r++ehWhOjrXsdvhjs0MWmfozTmEttGluagkn+Zny2XXKYk7MKpYCe
	GWm9fBWWAAzOhQtGD6bkHYIn79uXce6VYQ13QWH43hZwcO6gijBBxag7RiqfbcsIa1MveO4CqCC
	rlQmX8dNgQdXSPqWfipQZFkfPvX2x3W9lTrH5nyAX8bdZ5dxu1MHmQgjns1UdgqYT4LL22rxsZ+
	Tqd1FscIDthrqnaEZLITW8Z9kOUEASPZcSaw1T4iY+uX9tjiETL44VIZUQ9QlJ+fPLE0MYb5e5s
	+SsQ==
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353341c88.39.1795112043461;
        Thu, 19 Nov 2026 10:14:03 -0800 (PST)
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353313c88.39.1795112042713;
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:49 +0530
Message-ID: <20261119181349.2017404-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5V3QETGgrH_bMGozyaRAEvycZrEeqq_e
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff3c6c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=N0a5BPbhDuVZEP_7cpEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX/WX5v61RCTC4
 2F43o+L3QKpJQRfqVQh5Hu1p1Lf5RdYm2IqKV0RaRFT6RuufLh2T/jFgWZyEWf3H5+12B0ER0/q
 PsyyusIPrJzCo97fSn0PLtfiR6ke6sE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX9GhvAr9vNmy3
 CkkZugdfkJomNHWVET41arvA0Ghl/cXyuBL2sQNVy311F0dx6yY2kM7rOYgOw45QHY+qSKFMdjm
 MPxODsw4NXKJFv5lD0UoHSNEiTawxa2T9V/gfbqWppzJEkr2e97K7swPxHPf8o3xeJ8Ad5OZvSl
 tDm/CKslSqj7hjdBcPcpu4qK1FNZTxsm1m+3JrRsvmv/bJzXMxZRTnGtzZN1cysaO8HGGnBd3SK
 UPikB74gv6P8KTpRPBoDw7ecgxKVsKY+qUHOkrA5goy3S9rwCmJXNG4P+6FBSGsm4Rl4H/d0WyH
 Yw+LLfFCY+6+g4O3cL/7smKzlZQK7k4M5BuuK2BSsqi/i38jVJAvlbjepWyT2vnFX/5DHWxx4Rf
 lGwFjItGBbGvlpYWBIRSzRHyo8eipU8K7Nq/xqTdJDkIgIM1xrKeUHQLAb6YHOnlQsyaZjbS4uj
 RgtJLaNK4hZAzBdCFkg==
X-Proofpoint-GUID: 5V3QETGgrH_bMGozyaRAEvycZrEeqq_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190072

Add the CYPD6129 UCSI PD controller, reached through a PCA9546 I2C
mux on i2c11, for the two USB Type-C connectors on the Draco EVK
carrier board. Hook up its OF graph connectors to the usb_1 HS/SS
endpoints to drive Type-C role switching and SuperSpeed/HS muxing.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 7ac3a867d29a..fe7c676b8035 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "lemans-draco-som.dtsi"
 
@@ -351,6 +352,89 @@ queue3 {
 	};
 };
 
+&i2c11 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			typec@40 {
+				compatible = "cypress,cypd6229", "cypress,cypd6129";
+				reg = <0x40>;
+				interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_LEVEL_LOW>;
+				pinctrl-0 = <&usb0_intr_state>;
+				pinctrl-names = "default";
+				wakeup-source;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB0-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port0_hs: endpoint {
+								remote-endpoint = <&usb_0_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port0_ss: endpoint {
+								remote-endpoint = <&usb_0_dwc3_ss>;
+							};
+						};
+					};
+				};
+
+				connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB1-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port1_hs: endpoint {
+								remote-endpoint = <&usb_1_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port1_ss: endpoint {
+								remote-endpoint = <&usb_1_dwc3_ss>;
+							};
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -636,6 +720,16 @@ pcie@0,1 {
 	};
 };
 
+&pmm8654au_2_gpios {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qup_i2c4_default {
 	drive-strength = <6>;
 	bias-pull-up;
@@ -776,3 +870,19 @@ uart17_ep: endpoint {
 		};
 	};
 };
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
+&usb_0_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port0_ss>;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port1_hs>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port1_ss>;
+};
-- 
2.43.0

