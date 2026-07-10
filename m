Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D23B2FDD
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666352; cv=none; b=f2QAYKchE9BH+HqKeGulkzvrC+J1o3Nj9cyEYlOz5gtcOSuFaQJVpNYIW/H/77jQbZ9+2OxQbCDllLn3JaW9y9/AT/w8pA1Np+YOHzRTtjWkp0D58WlwCQ5NvIMxZgEacvzc+2/dYSv/OnPwlzXq8SXvq3GhOmuy+gDGKc6fPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666352; c=relaxed/simple;
	bh=rGmKVs+f6Ak40d8/LU3jSeNzVvUOvDcjX+0asZlXbdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpqhXXAxf/bcmZeqo9G5u3m1tnadEre9oBE4jvDMEsa4tcg7b/jF44eXubeQ/8FCDULusaX4V+dweTR46r4LYUG0SugmUgoI40Qc+29owATh24cfkd5R1tyH86Mjteww4SfGjApWYBrHajybPyGIDIflXt21bxg3HbYcI6wGxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iloufvRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8E5qqJ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iloufvRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8E5qqJ5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n3783802161
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=; b=iloufvRHOBo+72h0
	K0jDrD+xLFvRS6kSkEeLq/HSwF7ZjZRrTm3KwIEDPTCUAyGb/oi65h7V4jz1Ee1/
	U0p3BRLytpK8L8BoLcT9kgP4yO8Rky98HmdcINUodkvHRVac4IRt2wVIt2TIsWgw
	+6PmDSW6OxuN1TrfmFaWSn20GCsxX0QVl+4hqJgvIopFW2KN3CHKRDwD+wFGtFjY
	O5J3MtTRD7Hx1wJX1tG0r0oriRF0yRHAZ7q2nAjiOP7rcLuExsGygLw8CH/OT49P
	0yHSYJfFsldGu5QxU8QwOKJPK/7TcG6izWRacKk41HcgMCnKTiQxtowLY7Vx+H8N
	xlmblQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpkru5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:52:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so974057a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666348; x=1784271148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=;
        b=i8E5qqJ5noiAFe1sZ6+fAyaDvgM/Q/J7uuFB6EVRZhcUP18Ya/wTr/kOKy5s4zq/nX
         n3LyQxdAFrNUhzgX9MUV+A6iJGOIyhn70jVTYh7d7cuU/QiyrjSiPvSCZLIsPoIEoeyZ
         J0UitClLej1OTDMKg8FUtZJbDCoiU9hN9PrXf5LQwPMKHm6DyPj9xaln8k/ackgKR1We
         TF7ixPwRgL3/oxUbs6CxBs0JZnQZZsCMUoilfSEAfefD98I937xRP/hv+Grfc0U+mLXf
         gQgV+WMjex2smHNU3o/lJm3DS4UBIK/6QC884vxFiIYRjvOO3+xMwLK9G1qCMa1ucIDh
         2qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666348; x=1784271148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0NHTrqbfmobxLAcWBY7tmTjS7WED63v8/j5Zk6ECYI=;
        b=CASptjrRDUEODsCIXamR+pV9QjDkvRgRTmxSl3ulBYFXQ+5PRnt/qcxA0hcNx0lOpp
         2ySCwj9VbIVyNBCdal8rDJbpE0DQ5M9kB0sB9NAdXOW02OqjGcJyBu4o3AkS2X78btOn
         E9JW1VPUsdTcBxKFqILO2SKZGovkmjNm76oVt4hltpU5PkzVkr/SF5nDC8+lPOIPhYYz
         fAkJ62TQY5C5h8IfCm3wWCZ/ZKt5c6/kbfKoSDd3XxsMKD3PHSWCwSD5D+eytiRdPolC
         96EQrGuxbnarOdHVR2zkbf6yVThylc4UXIEe5iugJMNvldS6cRiFTWOMUapNOCif6qVA
         HEjA==
X-Forwarded-Encrypted: i=1; AHgh+RqSGkNu9EpbpTvxhWAqDUEJbi0ZwfbehNu9SmPXlb26scQJmfaIZexDOu9EGcAAvMxs/h3/NKLJCyFn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyanss5BUQ2s/Zt1Q+B38VYHtfwiHRUAHjfjUtVVlXkCaonqmsT
	CHI/0dGOlXlvoLYCxK7UQ3IkTQIRgNiZkThoPjQEWqBhvXphOMnyszvo5G0VMG95OQ85+pljje8
	StiO6q79PtPTjzLRpNAUZwvNl4dLO030mLla7kDjfvyQkrfLDMNSgK/C2H/hT57vi
X-Gm-Gg: AfdE7cmcA6wq+haXFlGgp9l4BYvOhkJ83Me3qNYxDQMbnhaxuXR3MGGg7oA0xfvLVLC
	aNmplo0zR0irWMnMylJrE0WOYGiqMN6mQxRG4i4lMSYjahGxzmgAzxp0KW6IeIeMRfcFRcjDdzq
	ecqKVBi4p369h/N89GibUfJzZS+gDCYTGnWs+dscQILMHT/t7wxRtaogX7JcePvA8c7J83B36nc
	b7a7gNmT2IJu831vSvFOSSYQI6PGvdHpUjHiphfuav4OTII8Ts2OF8z+eA/UpXW2+idnuaHV1/5
	grHGe0Oxsy6Xjdbo7zcmiltmc5MDtYKoJrLkvM9QVfEzPg+tCMZIm0Xa3duW/no/4y5EWgOKTef
	KZaOgmLdYwsRwrCGCav5QilyaMYXhtg==
X-Received: by 2002:a05:6a20:9389:b0:3bf:a698:ce4c with SMTP id adf61e73a8af0-3c0bd19f143mr13812486637.58.1783666348404;
        Thu, 09 Jul 2026 23:52:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3bf:a698:ce4c with SMTP id adf61e73a8af0-3c0bd19f143mr13812458637.58.1783666347841;
        Thu, 09 Jul 2026 23:52:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:08 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-1-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=3207;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=rGmKVs+f6Ak40d8/LU3jSeNzVvUOvDcjX+0asZlXbdo=;
 b=CMu57w5ZkP+ngxVlwuoh7OS6YDAP1Fb9Sw9FD6+DT8P05iXIMP5tHt73gEt4b4+g6OdbVDDmD
 GPeF39Y7dFxAuyI99ySyAh3YZb1/962587fZpJBj/qU7lHVM3SQIpeu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXwNd7lHS8NgUT
 iQ+TFBy5edR0wSTFKhp8//HWgucptqNLvUHuBvD2AhbRSY0QVRznxoGjjeVNC/VgOFX5N6ykPVS
 0XNe02BdGDmaXDi1v0mEvMDSm6aGRPbHluMcc/zQqsLdfXFCtlYwAkUvjJvJW5GVfRmSy9RPqRQ
 3BSdV0zPryE7ZtJmSu/Yjj59nGPwMU3H7HJuybZ9TjTRgOE7lMcN++SNnG01MAC6SqsAngGm5gM
 3Mw1HQev8l8wJmbitW4EVMiwIZKWMcYuhgx79luis5UixXO2qcqfZF+XDZXaSSrDf26DLYR3jQ5
 uu7yenobXpBCv/hTrgZaZV1tZCRYeSV/b4GB4Zb5FCdL+jtGMnKeSrl/bsdtJoWmOTkE2xQ4CQu
 bv7swL383PvMWJwLMNe9eDPLx7oS4MxYIo+aPkdTPcKQAymweGapx2QRDauBj9gknDK/MwV5eXc
 uINDuj6sB85W5OIltSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX6uW86WGimIT7
 pgLsG3bBl/tRM+UbhMAy7j1QCTxWNM/+dJQTTc/MdJ26e2N02Ffv5vnyg+DIfytLC2cvzp0VzLq
 439JysG2cvWulYDRglLieHH/oVZj3B0=
X-Proofpoint-GUID: AAjgWf3JCC5OIp-39DHwiDgTdsFpEPE-
X-Proofpoint-ORIG-GUID: AAjgWf3JCC5OIp-39DHwiDgTdsFpEPE-
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a5096ad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100063

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da..8148d2752846 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
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
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
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

