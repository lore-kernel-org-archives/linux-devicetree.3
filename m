Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A63F20E8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590276; cv=none; b=CPElJoTEASFUdF6wXmiHx9ggVhj31f1kW99v/BXJNo9tAy2TU96CLxEYVpbmAUQodBCGvAZOgFsNJCPkQQi+YiZQndv1H0nhCKG0BuUVWD/NyN5PWxdIB6TmjClCS/JcPlLlhn/hrcMTF+D1+M8QFyxeAPQQ0j9QRzoDHgfrrvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590276; c=relaxed/simple;
	bh=JIZogu9bJnT/zFiHz1aiwXu4faKX6URoW/DHrVEJlbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaWYl0u5mM954OWsh0gJy3bkjR0qhVkycIXpY2vdLwyjtLhZuAlWH9BRrxdr7E4fWtIjfPWoC2QBXJahmrCYXzVBQLtIyM+cf1vZ7hNMtND9Ibw1HMPByDiZur8aQKJOh+EwLFBn+yfAhmd3xTyq3I5kXg29To2nnNNZzBdFIy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BU2HS19U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=culeqtfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BU2HS19U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="culeqtfs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696kfKQ1020615
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=; b=BU2HS19UFxA9MIYl
	huX9cmg4Zwe6xxydgr97yh6cnsILo7EOspPHzEzR17y6U+WYUnNrvXvDpP8X+OZe
	ppAtAHnFTz/coVbctArMEc3f/DNgIN4dmAXS+qF0+7wuaPWQ+gco5+8Y71NYSiyy
	Jlhgg4AXri0pum7OdfPvimhSu6rGYfsQvNmTh5XaKNUeeSE2IfIpHFEs6AOntLN8
	w8MU2xOi+m+Xrs1MTxkpwGtPkl3Szg7+EO5skU6p0qzrjBlw+Ugrfz7QO9t0sE7p
	IYWCFiaPir64Q3xvs3iE4GktpnLe2xctPeKBcr61aIbc3+6KNJ8/CAr7Z1EnUcOk
	7n887w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3rsw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:44:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso659837b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590273; x=1784195073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=;
        b=culeqtfssQAfNHOe4Y1Pejf5+EWFoXldDy12ICD9zMM1EC4pz5tMQkt6WunvdElHOH
         8cJ97XNk5pcCqp821qgUPbzq3QVY12S8jwIrtTWJBbKYDkaIbaJcosdbjdLxagPVyAHg
         O1ONpG4JL4ZApR73xUhbFbWqQbq32v0jhh1xzKoes8ElW9UmQqUceQjJHtQMrXLP7BFA
         gfVBA9TDuMC45JQNnBeeoNuKNqFDXDfZUx0pUVjkWUUtfteVZ3UwWKYvHyDjwyPWxU9+
         VxeILqks9gl/NVyyrQqCpPz5VEeDaHhXRBfUtlcajqGKr3oVoQ2iamwnoty0sfQow+bn
         Kksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590273; x=1784195073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jc61CE/BgaR1jiMWtBHyJynqqIGHWZMuWcAIaYoSMkQ=;
        b=gTsp7PjmY4x8k+3cg799/wk9LH1FBgEuLrCj0p4iOwM4nUNHxYSod/nwO+fbuoW4wL
         vUgwHdGeYodjnGsxjG6grE8YjFGmuCfwqeAuepMKaNJYBgOFElRqW9Ffkt6xhqlbmV7c
         0AF4f8oJJqsbOFSPB/0k05yR1gTV3ioqIFAThbe0BTKPI3XTYACsj1LlnsiPFgRlcga3
         kxz2HwL1BiorYx5MTovD12I/5SB0+SBwPXqgcDwLYL7JwM1jOvEqgxqB0idhJDROQXQB
         fF+FZVy75WfYh1RGM8yQ7TkjIUYGJnuMj9SOxl3KCeSViQiY+591Ib3b5cIM9NEv9DlM
         DG3g==
X-Forwarded-Encrypted: i=1; AHgh+RrBi5QgvvAD3jOWqrtpIYvY8uKEoenFum/HvYxG01mCfkr0B/gj0+bvuT14yDwQnL5vz6S1trRCJ9HI@vger.kernel.org
X-Gm-Message-State: AOJu0Yws40IB6JAs3HJIhaeNP8mr+JufLa8SAwzt8zqf8vRAQAXoE4b+
	8F1m9QnIStbJzM9DbDbprOLy1T96coUYRaKrBx6vhWc1338AyyuzER42MLQ+BbL0DAC12cSj0aW
	l6rBIsNlN83r9FoCW8PzGlkvN89ecS3x9ZIgzoN495fZoW0twtJ/Vh1Mf8cOACiiT
X-Gm-Gg: AfdE7cmbLAl9Jum8kJrHPp9Ql6UBcHd3sEoAk7+5/3LJ4udlY1nmo4k36+p2RaeW3Lh
	TAN4IBjRsFkOjKkskBWDU9Yg++HBW8TaqyAJVu0QG4+DuZPfP5R2HRS98VYrd33t7UhG6/0Zz0B
	BpsNIi7D+jQ8bcjxEsGacGWCfjnCcuM3Opf8l5WJjYHJTCCGYQ9OgWCsMySPzM1IZGPHGg6JvVT
	avVeHQXz47RVlnM4aXsp1zHqrZajMlJiKcatDjtLJ7dGF2/GJwHlMtETTP12CI//GCnMKo6SuOf
	RoRnIdR7owlAGDjGdawqr8KjYHorg04jrHNGLQXTYg2rItvrdLrbPH5qRlb6dLWAv25sugib25y
	WDV98hWLR9uD8dIA2fx/Xumz78kOm0Q==
X-Received: by 2002:a05:6a00:3d52:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8485a9caea4mr2268319b3a.4.1783590272839;
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d52:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8485a9caea4mr2268294b3a.4.1783590272290;
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:32 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:02 +0530
Subject: [PATCH v2 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3233;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JIZogu9bJnT/zFiHz1aiwXu4faKX6URoW/DHrVEJlbg=;
 b=2Er58Ot+Fy9YELjJqJL/G7MtF5JKO4NwTogGe7DD6uY6XvAq4KFgt9HM78yBPjvyyY8AGOnSO
 MhDoZXmYQqOCz5AFkv8wLURTMMy1XwKLexvm4nbqapdnndtuxkQJ+JZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: jdlpw35ZDTqxfEwsFtJUlv2kaw7uOw40
X-Proofpoint-GUID: jdlpw35ZDTqxfEwsFtJUlv2kaw7uOw40
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f6d81 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX23wlkDtYtybN
 Wxh3CB+h7DIhWdsz/OR7C+d2vs2OPbnHOXB1dnR79PGuu+r7ABtP2Fg30ltr8dPuk+lY4bNhX/J
 vKoQvnFmdcsCZ+DU9EhBAB1JFglqasQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX7vlrnDaJ7Uv1
 ou+rOcMqxIXz6AvtGW3Mfmw69dH8q+gqEcGS0pTyyxVTvUvFczle7fMDucQhFCZUoqvhdYfW2Wr
 B0d5gdbS50oOl4DNle4F99lnS8CrZuxXsY38phve7vSfoChiq4DOQSFGoegUE2Doz/khkh8uEMd
 Qr4xEgOlW7u4tbKcvANw33ubjSAqcFU2roI6rv9/LvTrA7Io8wmSwU4IINe2NeK5KZsd31Zv5Uh
 M57blV1KAB+7C1x+J6ZQ7j+6fCSBqDjWN1robjGbM4hxmXl7Y9+j4apegECW2VptCy6zj6KF0Bf
 nBtbs2+AGbF2DwUwq7JmfiVZkk/recVOaogCyJZNJxDAaB0YAxSd6927eDcCsLgABNExq/NyCbz
 timqMeh6fWccOikMOhmecrOX7MYmtXSh9/rUn3aqi9txwzZ+VkZ79Klijy+HtNsdWAGF4xWnCjg
 fRiSvJYbaf04E5LXnMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090093

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..62f101fe5353 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,36 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +95,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

