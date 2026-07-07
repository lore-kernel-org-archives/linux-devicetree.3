Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63939388893
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452160; cv=none; b=YADM04FhoR0Yef6vdde7zlyAkQDqTunz52UmjfCyOA0n9gKnC3EyIv7EjGwiRc64GzdIYFOL7Mo6J5YYvdID7xkRfefaHa+XJidUOlMfs6CGoEjxnXZXmXc6Qk04yKV/DrDlBmRt75PNsedaPZk3HItSjgPT/SzlrB0nCLUuWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452160; c=relaxed/simple;
	bh=OLMI44Lp6GoBRY1rHghq6n1Fah+DXzoEhLtqQBP7V2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvacKUsm12fXm13VVmVlqhuhkYx0PpvfqhSHC3ySEfC6UBeLvmT4UQsePzufoV46v2WjqXFiKukNhg7CSCk8eLtZxqieekQz4kDQU5IjKwrqNZgBLjKYdzak9DzE1mpnRaKWrKJUpTsnuPq6WIpNk1+sFlWxLHuuWCOErAM7s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNq83lrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2kXaIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNq83lrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2kXaIB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Gv5495612
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PH9kSE6ElCx
	Spv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=; b=gNq83lrRtsUMcnMImKB7p9xnCO7
	ItfQyJ5pFR5inaiQEXi4axYHT0o3yVyyRj+RikIWjT0x12HXA//QpRsNwAjUM4PU
	Ow9pU/rtA0+35z+UkKzx9KMQhuAWzuI+/SbGv79A5gJFWJ2GL+LXtVC7EKqr+lyG
	vqXQsadcGUuA17B+bdiR1LROdt5xt78DbMohiIwWXVY3taPBZFncWfLWtJpiADq1
	6/CX5ysCPvoP5dz4sWNpz4M2NnpSFECX+ijZJWE6YHkX789m9qJhQHtDxLq2Qsi6
	RttaXrM+1dNQlsHD2acnFiEEO09ACefkB2r0Nep4FUUsBJrWMTD8kFYYBzg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0jdxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 19:22:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so58010776d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452157; x=1784056957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=EG2kXaIBGbpphCx+LrwHHeCcLAZuKP60ZyioeewXHJeX6GaXocr9OO774bp8hgQl8l
         6Jb8VuxzApY10/bxsHOWHxa91OnALHkAK5xbtLghldOZ0f2IDjPJ4n47VRQyJc6bw3wp
         FuyjYN1pd680WUe77Gf2XdRMxZO2Kc0PWSjBJF6z3SFeJd5tiI0zY383BHVio48K9mbJ
         TlwkttEJz/Hid/Ajy/vRIegoGXJQ+Ly+x+0w8SQ3viViHoVvB87i9A2T2+CgaSIUXIy1
         AWEhf4f2vyCcf9gkgfXAMsm8PHXCUfB1ypviavjNpFjpmkJFhSpLT5Z9JhxHCePKzrl4
         peRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452157; x=1784056957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=haeZ7O8RAvhIZsuqfI8Mnle12C/vGKkA/jC/MCT2S3LZ8JoG9zi2n+jAN7H67ZNoET
         FOCFylPlqEv7bDFerjv7t2U0um8pIfp5GwU94l43uMNxukgWA+QCqmKrgEo/2BTtrBdl
         v71+tHCAjoeqg8G/2li3NwmT23BN/+NntA/mDiNpvh5xaggGEfdk1gu1+WJ17fnXfJPJ
         H7SVEqgTUs7Mf9QgzbrD+9JML0J/dBW3dDno75Ckn0lndIKpAHV9i345jWITTXleVS94
         G/ptKZTlNK35wZllvypjdgGp4AUPzwsCAV7T0D35YckdMAPLe9yD9sf/yqG4ikbJ5kFd
         T3Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqTbiKkEvPVe2evZpBdgU5Jl2aL5KqaB4LiggeZl44ePMPcZGKExE17h18ZVyfjoDRveQeV0ayOh9gi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmpgq9ymJzHQ5X3EpGmHSS9TYVJoNUcHbDS5ldaqA0mFCMrvoy
	/dzZXsr2uhPhuzoFZdJzTDQQUdveShTk9F+rOLecEBBhynVk3tMVTXtL8h5hB5DPBNc6WxhtSfJ
	W0cNmCwBbaCdmgjdFhwPu+ixTqIdM2yNPlTJ9XszFw4lBsbg+VrD9iNLuWwPmb/SJ
X-Gm-Gg: AfdE7cnrsWXj9/LTKgMqqgSelSnPm8FIR/menzwT/Ty0WbXv/Ed2B7PoR9DSSc75u7V
	Wxrhn9/f4S30C8ApwXMQ5KPuSgRGcgBge4iyTyT+7Hit4hfzxWjrtM875kvrn2U1Bq4B8c23bVC
	AY/3WJ2O9BG7H579j451lg65KcIo9eJhxU9GL08clt/b7qrDrhYPTOeGweayeEXqyj5zgH8CJoS
	CYqbYZABSYi+g8+eNpraDIuFnZcTosywYaLXtIW+O+waS36drbngoG48hkFVgiI1Jb7vijk6PAV
	gGLT4xxvrW+PLTUuKk5JXne8TArzb0TdXXMoDqUnIsQIo/2DiO34K8qLOOgrQG8kgNSxf7sZmUp
	wnyXaqmQIb9cv+eWktQ3/dP5S4FXpUYdiiRkKaAW9jEI=
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85363071cf.8.1783452156476;
        Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85362591cf.8.1783452155901;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue,  7 Jul 2026 21:22:28 +0200
Message-ID: <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: It1HXvPFr0B6dfNUCR-GL8lU5cha0d0A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX7OP1roApEO/3
 ltIbBt9S3bHRpncz6Ty9HoFaKz7GnqsFBaMwAL3wJdOIiTeIj44HMZ0UdxgVR9XRxswfjA/cfih
 yoog3gMZCoB2eDc+99TbVerMMvno8XM=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d51fd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: It1HXvPFr0B6dfNUCR-GL8lU5cha0d0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX8XwI7cW67oix
 HQ2NSYJQkC+KdbaNYEWs8gA3vMmfBRBo9aUCTUuzpfQe7j5g093bGQ9psZ8yGqq2GVsb9SukWwD
 c+noopLWqtyAeJWdC2U1+ofH3EDeDWsDvUpr+mpl7x7xgO9xvrFXmB5yBiTh+Qz2f4m6V3dygcp
 dJ9YgZihimXT+x/6CWQhAfL32CFTfj5YkgEYDV7SrrudOHxtxA06+nvftRAjwfACjP8LApQ13KK
 MhtfiP38yj7PoWJ2DVYE+0+/t/wh7VTyjDgWpCcK3nyZstW2Yamu3b27DB/13Ist5dpSuGus42c
 dNY/iqq/OSooyknOackMJC4mWAbk8j9KkfDuMq/kk1AYwnNIDggD+sTHh5/0dG+aHZLJvBt+bpX
 sll1MlzatQGHwLawQc/I7OIfZk3G5yIHhBxigXvf/ydvZT1UdZAF8pLYbSccyAC89JMDRLYeVZv
 7p4BaLMwodMLMYOd5YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

