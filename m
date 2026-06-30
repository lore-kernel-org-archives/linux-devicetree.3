Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316E243CEE7
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831219; cv=none; b=QOoGFN9LM6k3FY0gQ0xAFGumTCU2gRQ8NUQ9NjVqYpk32Lb3ZCPBBxeJgVC75cbw7Wg3EGQLpK0Q5Lfd5nvc3+R9GfY8cSh4JRGICRO8kgrNWbNCOveqV1fDL3Q1VV4ouofN3688v13ErJo+/mMg68JD4OUvrHn5P/WSN1qWixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831219; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4W+mm7ZLiXtGTGSV7UQpMUH/FCseY76BMFwxazl93OOYXs2BFiCh58XybmlZGnYIr2cVdT/dW+gBm7dK2dW4UhEu8zyQ16DdVAWGi9VsFMhc/cVMSHg8lmIcqPD43ZtzCnRVKUm7AM+rS40eDJwhsJUOhTnLDZ040q/DRvYqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndNCcwjH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrKZVce5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndNCcwjH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrKZVce5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEENTW2202145
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=ndNCcwjHg7Teba2kMIrd7YLPjER
	SLcRRQAhlHXRxXlm+8+/ClO00MCeGLopp26Mpn9ApnMH0jpgwU2lD/x+SWVLgBFE
	kYnaT2PBdDOC684WY9zpj5NUSu4CbcAlf5ws7T/p/Fh6sI+0CRjLHJBO2u7NuRsN
	u0ZNfDj2ximNGT9aCRN1+83dVZ1XncY47IHjCOECCT8epqO2lNQaq8/5UNQ6nZRx
	iHpsBL6123UFk3k0shETgMTFhh/a0fFoplz4jfaUq0OqxD3ipi/BGG4fMHoQb+8z
	25YwrVJxBq85F378lhdmNdnRsSU3sPE2CdODnNvkqijQmFf+YXbI8Bm0SQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc085gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so367632085a.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831213; x=1783436013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=WrKZVce5erS8+zUyI8F2VTRvVarJdBNpHG9uVXdm8K2QrRDVc9wjnWdC1dKACGXYkM
         CtKa3CWihpoHQlrlMkHDFNNNIuYCGseDTorLrPojSrSrbVMma5ki3tZw4T9ZtYtGg5Oz
         3ZK8iEerFrdQgFgc1ALa5rzpBvSmEQSiBo7HijlaFc2JaH3Au0d9rD2nLk9j7yPWYOps
         Q5fSctSlOGxiAU352J8C0UD5MQb7dBPwkSqiTCYbOpkBDujdlMqzdBKMbOXfRIKtLPIh
         sNiz1MdZagBeRJ6KF17ZtZJsS3+ZOZAwDoLIOg36hN3FWcW+zeePOnkn3sPM6lpxU/4J
         xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831213; x=1783436013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=B+CZCh1QNGh4RNbSdK+ebJjtwo6NdaX4H9lxw+Kppd+hLqnCfd8kG2/iv+t7WhmVlu
         f9Wc/Ro5VDM09XBkKQ9GYKt49S7RebKooYOGya1yGCMtUoZaGnJgKi3hcnUv1gHdgs2q
         CHDeeCNR6xyLRZCSOC1Wwn5WZGZFWqEDZfbGwmLhkV0lgtiyCaYkxAJK8fNVlhYOCVP9
         uM7maJJWUK0Y95dapjEThWWw9dLQwxYTEMUd9fJPXU7BkiXDfXPt5C1uJJqShqu9KfgV
         MbpqmBl+0dtHPjdJQ9LIBf8G6OxJm4rzNe1qFngVlgtEht6VLPnmLM7vVMQ6sjsnJJ17
         ruZA==
X-Forwarded-Encrypted: i=1; AFNElJ+u39a03Cj7B+bqNhVz+o+x2siVyHFmEK6Lj7LrjEZHF0fx+Pa73DdCZJs4PpwLFTOWQLMw9ek9cixd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6KL2sVliTJ+hI6C+gjHbP/mHYhczWgyNATjPgIA6uZwRa1x4
	4Ck6tMkG6qE56xNWIwPpV2L0pBZ35geIV4rDv9gNB1QtLZx5UC5NSAKPiWsTTo+LmN8+EeBpfYg
	vlstK8/mCJL+VV0ZRCpLj1XxLrDTSHTjlo8tz1NaCm6/pcQW2QhPGTnlEmY+wyH0O
X-Gm-Gg: AfdE7cm1ZpIuXklfo2cyiEZN1HcJEFlYEbI1orO0IqDLD95iKyfuFTXn7mzFoCL+Tdg
	L9dDHb3QXsSC8DxsRyZduIFLclLcNfsFitL2qkY6WrD37PY3iD9xPTudfUQrV0DPZWRNm7TMOKx
	MOFwlfsjB6rDeBiG7Ag1zCQlqwG9liwF8o91bXwACQEh5uNLSaO916J2Vs16T+u+h/nSfUXZUzj
	A9C2W2vzDwVOSjWwON53KSb+yJJwmZTPHDGRbnUvslval+SzxZnLtNHYk54JK0P6yCtBNC2caeq
	8b0/r4dIQwzoUR6PLgLqgOraPtAQIu9dcnUDlWtcmNxIkq8cEKWJm0MuogTs1z1T5wDdHkzZCj5
	jdQs+3h4TRFKYhEoZF6axF8eLYvT5j9fDzfHI/3+Pd0frfA==
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679862585a.47.1782831213388;
        Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679857685a.47.1782831212865;
        Tue, 30 Jun 2026 07:53:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:31 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue, 30 Jun 2026 16:53:07 +0200
Message-ID: <20260630145307.10745-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX1QAJVnqvGJkV
 Q3zfd8mjX/zjHDvu6Psg6vNQx54/jxPrcFrmAk8bBZuty05IdcBqIFVWjGMH9VaD8vJ5Rd/t8Mk
 e3/B6ykVMN15o7YLX8rV4cm4wNHUIVmCwyIoWGzhUUUN8r047BXPyv6YkL8Qbl3GYGfPOlqof71
 agsJpYfkpP2l+shfpM6whdcFoxICbcXy2WLUbFN6P4ZcfYmCx9kDdE4NpfElpcaSnE9detBSWA3
 Blr+TI882mDbqbubohgF849kHmHGRsm5ZVDz3XNurjTXSMH9GQLqOuhKYGxbTCKbjymNG5W7Pzs
 YHAj9PpY5Lim5mysZWiDH+hhwbjc7i4NUymgeoT7EMG8GEqkRloH6IPLJe8PiF4IMpHea4cIIiS
 p7EYabkJHkjQS8GRPvhX6uQ6nawz8Zm3yPLZiDIS9+A5LJpRdR4iD12UM7unlVA7re2Fu0X+45d
 cRTk2cAlyJkNvXK6jCA==
X-Proofpoint-GUID: aOZFXFOHzdykCXCY-nyl-BleR3fTrT0D
X-Proofpoint-ORIG-GUID: aOZFXFOHzdykCXCY-nyl-BleR3fTrT0D
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d86d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX2NqkcNzprU50
 fgBHfXA6dNSuY4uZi/pnHttnfdoDWUOkVoFc5NUBP7xzWCfAWSN2gfcw91tPVDOmL/G/HUkhCQp
 WX/GhHrQABy0zAw2MyHDay6xZFDBr3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..a19a363da9ed 100644
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
@@ -1729,3 +1731,67 @@ &usb_mp_qmpphy1 {
 
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
+
+	};
+};
-- 
2.53.0

