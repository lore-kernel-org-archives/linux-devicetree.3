Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC7431486
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354125; cv=none; b=k1gf3UFRzNBhkc3mHziRv4PBJKGKoIvVDfBi0bZG3enKIyR911QIYpCs5tE3XMAE2obsEF2jE3VHNVjq3zmtJFfujYaWz3QlTMFdqKZ/BhX+ArHEtuIf5xiQfobJoKh3isLX895OAO04bwgsCkefHpELT9663D89QHq8lT96O7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354125; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOqEF4ikXOQnAsTkRtLfFOUqwpID8qnig4DqEGkiD/9tEL2487tKM6SyQ9gHF0yo5Paidtpf3IRatgtLlpXOb2v/sZRdYUpYDFWgwxSMv6kerO+fn0cV7XXRjBma/9bh9j86J/+ff30p+epsmXohAgHZjulmcjAuUn9Sj1QDLkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luuWWHrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vm3d5oX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luuWWHrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vm3d5oX3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF62B982438
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=luuWWHrDauXffYrXZz+3PTl5Oo5
	b7BJjiZC0nvv9fiRSF1FWrI0sQAQMxpaVwjcFNDhAKnEgPTDwB/x+IHoNioOLxao
	m4zN/K/QSoEhVrVLheLEfCXx8epxa7zOngYk67ZNIn6b4KRJDRFrXyjH6icqVfli
	z8/msNB6vD3qotRRIkX3GOa6NTa15IqUlC9jOo99cOrE+aka1E9J1sPGImQWpVFm
	+j2lBB6kXozaFD5Iz2V23mBfiqzkhj2XXiPd7t94L3UbIrpmHuLmxFe2C7Erwrk1
	/iRRavwKzSor+H9REBO4dST4JQ6c+6EiUz8ZIpuzmghDUiK35Lku55+6swg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphsrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:08:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be1b8bc876so1828510e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354122; x=1783958922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=Vm3d5oX38zUJJKKUWg/24w5hk0XM7b1K6EAb+t1rbJICHg0tPE2fLlu/nL3UBTGRAt
         Cqb7EWWnWz2FahsRvqPKHembeq9+atfviRhoxnpsI6FpsOBaEiEJpGqkGFxU2qVtlo8q
         qQcyr1LVLRHYa41DEi9E+BY8SX5uADhutVffdIfN/orGfm/0EbA1DL5MEuCxjFEzbXKT
         E/A1WlatD/n8HWSby5iOCvZR5L2DF6sbH1fvfgl6vktSmuBxfG/Mi3T1VBTT/838qR+p
         K2Hmns+wTpgAOJP+EeiSMq4Gh9jiRyAXAW9qcA0HaSYByFa5azxxrv++k/AV5EZ5mBAA
         eijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354122; x=1783958922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=diFJcGy41f1L4nBZJDGb4jevnEVE2e6OoApSBfBD4XG6k0oDC0FYOZxXHggEL6DaRV
         Oe+fu7tO2ezk8cKGV+EDIkEW2Sd6bu0YywPFabjuPesKugHmQQr4koxaLR2yXHDePOep
         fKybsc+e4NCP0ATJDt2C95tagbLIz/QFyvtZsE/m/E+eBMBKJsdg81wfU4Q9JyduKPyk
         ogK++/Y4uN/c33MZ8p+citls6uj70jrAvIiPHfGGAbcX321oQuNcdwXf+/OlRA4JzNVO
         wC67f1czhIM4J5mDWJWwGnvpYDmhnwtfXy3T2moV7xuEZ3O1c8FMyi8tcpkg4SS411IE
         nEnA==
X-Forwarded-Encrypted: i=1; AHgh+RogpFm2g9qYg170nXyADI8EL+LQ9N6CLoGlgfmFMnS9DaQkcyrjjl+8/thUSlH4O9wIJCeM3LH+K440@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcSTuU99t3+t7IftKu2R1N6RVhEnDcB4a2nYq5kBggennm2Av
	ddQTsJq9+e8PI2TAfq4y40o/C19ZhGzyT6myA/LWpOA2SxXqiuAqLLj9ydMcsJFGcavih8Dlm6Z
	z0PSedBY4VSgKjid9ZY+EZQqXI8VTJKzROAuNMTbBjOWJNcNdxxg0wsK6GxVXmuar
X-Gm-Gg: AfdE7cmbM5jaXKXj6IQ95PZM/Lo01GDr3QGAbLe1BAfeTRuCd1SgP8+Fx2J+BFqI/j/
	d/CD6R0pyDCKzwpNYkmGAOBVlfBtIZ8oqRrFcx+Rn8+LQXnTpM8gwM9AMRMMTa/tcmvQi3/fuoT
	7Sfi/wDK4yarwCB9H51L/aMXzjc4ay+RGGOnOYg4D7c8cdZCMIVwSV+4bBAlHxFhFfmT/COWwOL
	DZuQYpNKPlvDXmWZ8YWUFIC2KgR5FibTgVdFtPJKctKGtHc/KyCtaUgTDV8r3u1qg8mJVYZP+fn
	b38yKveBJZRfDpzgWLLBm0yXuj6pj/tCGDA5SFTLXlhHXcjMPthqhblmh5PuaXWBDHJZpFpu6I4
	MJn898efsrGGC434AIFRr+oRey/l9ZtYFd0LmMJbi8IjVoA==
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583411e0c.4.1783354121454;
        Mon, 06 Jul 2026 09:08:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583381e0c.4.1783354120941;
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 18:08:29 +0200
Message-ID: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bd30a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PbOEnBqqUc2v7fj_yub278vcB6fePxT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX6mmslovyD4+P
 ZOPhm0cgD9XCaNdga2qqBSSbwZAmyT+59l5aMNweT0v/LUpKxEBHJwP91w+tF9/ss27qmcJbJ0/
 cS3OFxD8kb04FMvTMNGszv7GX153nvJScOHZUIy2UN5mwPjABbaB0afA6iCoyQxjNAF/o7sNXhX
 W6cKnVylEKQt76nGLP5uN523S7j4Be9ylljErXnKQchzL8jp3GXleFsg66NELqHNG3LF7Gv4+fX
 wSGa/7R2TeZ/x/EvZX1TbQEmu1rJ7ksos/Nmxgs/Bjgi+MjhKCI16xcwQ/jhOfF5L+QlbXFaIiu
 9BlmdQghJpMvPJma0V4PxAB1IK+XUH7+NhPXwnEfiOhGVemRHllQK3pNm5KQS8U/pBXxiocuKur
 rc8nX7vdfipaJl04xMqoA5Df0m/k0vJ2xOZ2UUe6DcvvV+tAinbx3kOGAxzDuCAfFuAxCmKcuqS
 A2XsDU5MBXiiDyZBwNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfXyueoFpIvBLBp
 5eXscJviuPQ2w8xV0Ee6q+HJ7xaMAxJUIbPYjs5TbUYLyxQ4nDvE3AcAX2MyjRuZ1EP1KnUZz1u
 DwztM6UbLad3EhQwGDVMgS4LuftwNus=
X-Proofpoint-GUID: PbOEnBqqUc2v7fj_yub278vcB6fePxT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060164

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.53.0

