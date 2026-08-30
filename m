Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2CB314B96
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=uzocu0fxtCEtYz4yd/pbLSLCU8YXYOo+sk8qO3SEdl2rQMLVsGQDuOUBpvjkqRZ9WSkdVJMFz2lhksH3BYm2Gs+mgEpQovnbbiDdsJnQEMzWN35sdmJhXdBPTjznLDOi/QWLbKyAIGaqy20+6WZYstAKmnxmEaRR52G12xCGWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joVdmmp/gmCPmGFivi4Efg/7kdN/ziD6Ff2svirmA7VGT3b/532d7y/Hssu02wZ5fDifZMP2oZLN7cxSgyxeuXUYPKEH62hjn85RMA8vKA64IXZf49DcNGwDBNk/m4jRXQ+/CHHOLjMVnt5egdCABPpO/fMsc9SK0uUQUyjPHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFHIAhn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7dlHA5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFHIAhn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7dlHA5M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJgQd734077
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=; b=BFHIAhn+mISfN1t9
	LckRa9r7KYHV+dr540xxO6F3mqGTYQASmmS7jT8rsTz+38yZKhip9zzpwa1qD6RD
	NXJlBFdeLjt50sUReZARr3OGBI7zShw4vYp/zH1mc3VqsuLo7hfIxlTV6f9IN3Tr
	owXNdtu3bOsnp62dn5a/MPNPYSKKHwOtybYSnUMSbcRgF9UNvk1WikxUn4OocwRe
	yhZuyAjVlLLmyBWSiZ4FTabsZormIsSx/ufTswwf+dcrZF/KyPOCiehkMqFW+i4g
	J+LpDUKvMo96bkwH8bI4ooDHQTYBHDYIcHIp7Hi4gb6n6Jxdy/IRA7tYtsnsOLxY
	mW3big==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq83hmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4528972a12.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123743; x=1788728543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=e7dlHA5MkQu77oR10liKceMrHONntO1t4ggg8f7n+y+abPjYhI8QLY1bh/RpzvXsuI
         2wrKsOnOqT26E5WL6JCLD5nnqCsc5UWyHxCtRU2WN9rMnKysT6AyPzdN8++1VVY2juAH
         zMGH85sJYK8k6THI05L/HXUCuL1zGCxxol9WaTjaoGXz3ungub17UmyZ+kuf2aZ+st7I
         LPZbltQhNryqPu/TtNWfxhB8ksx3frCGfVKEp7lWoE3lpkn5CDRdGwSaCJw8/NWsu2bZ
         yydllA5Tu2vODpbfhuUPEsjMyDwssfW3/OKdFsrxPXzQb4kkWvStCtMn3EDieeF6c/68
         oPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123743; x=1788728543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=PM4nJsiy2ZY7JKU9wC67hia+jYpqNZ/FaCQc+HwN9GrMZ5uqXuuKSAKbDbhfk+axFf
         wvR6C4lsn3lzkLMDxdEUw+MnHqPKljr0/p8KhiIqv7GeyE1upYPy+OdITs/bufJNK19r
         /tTeZ5c4JYjL60lP3BPjHyIlWlFIvTeAwct0IugPYBDvRAC1p9huUkQDLJy01ixjbwaj
         jJ0bJ+4siwKgfwmtyQjsQTtLCFM9CrmmibsGxQRkonG8ibnpsgpgfw9Ik4y8G+J1VaXM
         /BeV46QL1zyAx9VpkpFTbUdB5coLhKg3JkVTG2KdOINZYBiefhyhvNOqSMfXgrwyD4Hg
         AS2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqRMqSbLYdcmaxYMbORtdsOpGKWmUH7AGnmv1eHswFsuqlOkm95O2hqL99nSgqwayNdeFEwMAEPocx@vger.kernel.org
X-Gm-Message-State: AFuF++nohi8ncNCR2verYmlwigytsxq0mlENJx7kkrT6GNe/Z+Dfvk+N
	j62GOKBJ9IIwyiAZ6ZP0/CPBZm8QnGLbNbpm/9V0+TeQ7XjkfbMxgkmCfhE41CmCe6SVgaoXni+
	bk+Y3VDvnVUQFcR8ssyHV/tLERbBJmt1BSahjepj8t+6XfOyxqmlDLhP/HubqVr5J
X-Gm-Gg: AR+sD11bmmuMvecWaTHV9yIbQrh+wfId3YbkytNqXiIkXiUjgrMT1Jl61YuFcU0pZdZ
	Og6lutDBy/Y2abJIzMjaC+JNOoUTXsm0bBDvwqjYzIw4Vpgk8tA3XpC81ulceZk8ZQnp+6TOgp0
	+K+jq1M0hEt2p+8wjtYp2E1XUGUq49D6BpbexxC0PCJYubvm5XUnH8av8vdgxRDj/BtfsEtAOZZ
	2KZjVWdisBDST3sNuC5jfkG8eG/xKMS71L0HDyiq1xcPFZqCYbYHX0+gOpILP8K77UOFO3KZyn+
	2XeBww2ffFOHroEfGm5kPkdKXgV34f43tJ52BBavf/CwmhKYwqTESLiuVieQh/CG535skpS6V3G
	rYOXYaNmdZYE1ty551VUSvlVOpJyf34h9x8ddfPTldA==
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156602637.4.1788123742974;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156542637.4.1788123742580;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:03 +0000
Subject: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=4383;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
 b=I7ACeisDbTUKW+hx2+sYwC8SpI6bKi0sxAYp5rtPFlFB+PhBr9KWkjE/zj8zaYcjuz1ZOASgI
 QPnilAX/JrQDWAF7skXpUzN/buK4nWgNL9ekXHXS8M3cvFVfTWEAi3G
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: o1dNzjLcFYL2Z9KuUVdLJUKHHoibdCaF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX7AqNifQQSiuk
 ooGOeUhgU8Ge+qLDb7PY+ESXh4VvTi4/b1UhvRMFHni01c5iItvB2XxnghZgTHTubMm7uDAACFq
 +Ke8fx+laimJVeV11pAbRs/GK7ZYogk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX5QhylJfceb/6
 yShIkt+/xVmn9IxV5bGgWPMqZ6JFE6/PW8Xt8MgET3fYVTgQDM6V7AZ6935MQfe6YH6T/DCxZyB
 ljfojBeFT3ZdWD5NOW1ZIyPsDM1RIJoJEIGgxVmL51Rv5FetwzIpwW0LfFBJluEyp/5+zWrSAIj
 y/xkVnBR26Um0bmE/o2/8EALmnQJqIrK84w2N+DOgzbOfbG3QGmra4vt64zUFKG5c4LQWvx6HBf
 IT1UlcSBgsKvQRKb5jCeH0TdbvZmXQ/9iYkGFzIj6eqpC1ZW7gjeXQQStMlekpiWncNKCaQNKp7
 CS/FyGAAbwrujCPJZeMf6AYdmRVJ+2qIp2IepO1pC++F78eE7tjApvrzTbtIsVyAX4RRRWgywsH
 YF/7DW6o0FKkoeL7DC/vUXDuUrU0CV97+DH2O3+vT49wnR38M+3DO7lRZX3kQ85lwOT/GejTn4p
 CmfuS1ZO3jeGVLF/14Q==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a949a5f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SrWXOAHHq75Mue0GltgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: o1dNzjLcFYL2Z9KuUVdLJUKHHoibdCaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300184

The "limits" hardware performs rapid thermal management of the CPU
cores, but during prolonged CPU usage the system's overall temperature
need to be further managed by software.

The reference design provides seven "system thermistors", connected to
the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
thermistor", which is wired up to sys_therm1.

Use this to throttle the CPUs, in the same way that we're throttling
previous generation laptops based on "skin-temp". The trips are chosen
from those existing examples, but are comparable with the ACPI thermal
policy.

While not used for cooling/throttling, also add the other thermal zones
for temperature reporting purposes.

Enable thermal-monitor mode for all 7 channels in the ADC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 429deffcf3e9..065af18357d7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -11,6 +11,92 @@
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
 	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
+
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				skin_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		backcover-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &gpu_zap_shader {
@@ -20,3 +106,33 @@ &gpu_zap_shader {
 &iris {
 	status = "okay";
 };
+
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};

-- 
2.55.0

