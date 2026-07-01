Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16141404BF3
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902246; cv=none; b=ZRltLFnANyx6enVKR+YUmvo2KphqIdaywk5O1nqdbTfJwH4imFq7Z73scvPdYkzILIUJAanMQ7lSZ4O2KRiB+3/l4rbl3PY5Bl+B6jde/PtmgxIvmCGwbNdRsfIjyS5gHgpqDmtiVDr46czWEpuAGsTQPZMD72wU8l6l7/HR1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902246; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGjsegCeeCOBTb3v2eexWO9s9vDdNczLkns2wUog/Ad1jFnCA/bAqHGWfuz84UQuatsAplyZwR/ZlH0eQwJi0zV/pQTq2SA849v7s1lllzp8Lcp5z4E5+lRHkMHpRIi4JO2Fw8EhuadaikSuen3+4eg9IzitrBXHew5CPoib/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tb8Dtrb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZhLaOnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tb8Dtrb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZhLaOnu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8tuJ763068
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=Tb8Dtrb6mHmHsu/O4P7ZHbfvIfv
	3H6oPUX9iYO1v+C0s4Qilq1y0kw9OWhssBP1mCJak52VPfUv/2WPmkrhOn8wFdjF
	TclKgtcw2qIsGGHPQYox7ip5gBik9tV1Ewyr/7Yo3Mdb4G9uRdiNLKcK6zfbty82
	fQV3bABk94a3Nc4STZPBuGdA2rlCOBYrkdXQ73MpYEtu3Oq7UbzBLqz66aahoRg0
	4SJOzmECF6wr2JcD53JClb1x55yw8ibYSyynFNMhTu19ZVFqzao+MQ6PYXZhj+jq
	tOw/LqEDBULu2250ICK1X7TLr+/JKZRfXn40Itx4LjJ2mL6QbnE/Nh6t1+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbp3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:37:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so46770585a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902241; x=1783507041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=eZhLaOnuiXAUZY/x51WXGglACkjKJdbbjqri6Z70RhHi45zUcwaZgNH64Z4bY5cOol
         +y/VRmCfViRRlk/VyicEqjEO2bs0bqVdMsBP4EXJSikA6fwz13g5dq8bNBGClAJFHWch
         HokZD9EQskrJr5Q5aD6kGJQBs9o3aRll65pepvGNgWb4EcYS2/ZrEoaljQrjWcI08Ou/
         NNi0V4bdmUcarkrqGt9nyhP/Q+znDjwwSHq49UNlQ43hOysmoPqZuhFpRGs7mtMul/pz
         58QGx/3S1qXNAEBXiPQ3Ai8ojgoTlzQ1WmqHYDiQPWVr2AF8M7I4E6cUUh2cK50CSDcm
         GGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902241; x=1783507041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=mMKjLagD0b0Xz47HPgiuAiJhbBht6pwbSGULPVPwe4Ni5TmEVdllC9u5zS0SmR8wRt
         oPpl1wxS2erEdtWe7n3qXCH23PwZYtBgJSMrpQN02MmJ/fUQp/NrsUTO7qE6JrIIefCB
         rKv8dT9MKmtvHf8IX+bqvFJKNDVjYY/RGlBRQ0TUUIo5rTVXb1NtbEKv34WlxxwyNE9c
         RvC9K0UuZ2xNUXtffjtG5lo8UunB9UAdZsBT21JMgRxIZDJg6VzRuMownJ26veJyK2h5
         eFrKwiKVWA2uwG5jwaizC6n31e5sA5w7HY9hM38cZj74My77f5TvnkjGUBpz2xDLAeuV
         kXbA==
X-Forwarded-Encrypted: i=1; AFNElJ/irsVn+UbPH615UluIQvd7nieUGLFuMpie7PnCXZNsvO2vw7mvnZa2HAmQeA6ZjPYO5uKaGSh4RYxf@vger.kernel.org
X-Gm-Message-State: AOJu0YxVxEsFfnid2sOGGFWfN9K5BKU7T56SpqOxCTE1AQVEsU0jCuXF
	uWRMXzJ4LxizP6EzTtMs0fG/MnpRVh8pVNVE2l/CcDBw0HJihD5EsXtSNIXECa0fZuBFXnFbU24
	loj/yG31FU/orqu8iYE3QSM3240hv6KYlF7KdPl6hrItYmaEoizMVAzFgt2ClMeiG
X-Gm-Gg: AfdE7cmIVQm5whRY4mZ42fULeDGJzSVEyvX9VIbMOyPAhzqo2Na+vZE1Om74Oq1Ezfu
	miTbzFBYeAFyz3ld4neT5UKq2RLSV6YFGF57epxro8e/2cDC5yiLq/yD+s0HT2lbOvNNsnlQPzV
	aE7HtWZPLb39bSDz67uD8iZt3yETZfAOEkbFi/nuDZTRFqxuAJUAk9kU8w0n3JDRM+enBxF/3yX
	iYdzU7+TKKMDi+76rI4yIgVqnqltlBOQMgr73m1izy0Ed8f01fnHy2hDDOcpLwdtqn7kyLS1wUH
	96PqXiQxaTT1gkd93MjEqh5wrOWf+6NDrvUhq5XVsq+ZpJrnqYl4AYp/lKN+4R9uLyueT6sdcJh
	JY5G+GXVisrymj5CxrXp/lS5JOpTEuCAfEoZYyF+Qr0g=
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126747285a.33.1782902241398;
        Wed, 01 Jul 2026 03:37:21 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126743585a.33.1782902240831;
        Wed, 01 Jul 2026 03:37:20 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed,  1 Jul 2026 12:37:11 +0200
Message-ID: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX6h4Yu+HF+pHE
 f1hCVk3b4Y3uh9Di5BhXTECYyQ4IesMru1hXXNc3LcQ8hc9LZP2Npp2jzTGHyKbdzvIB7HxC34F
 /G2VXjsvEHgu4vEoeeXinPi+oADTdXg=
X-Proofpoint-GUID: KmqD-eeeT8ogAWXj9eS3dYMVC9GtYtM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX6ghR/LBu8cx7
 TlD3I3AZVU10n1quU2O1Fhi0qqex75vnXd7rBPKE4fUMTwaQH01QKlIFBUXoPfjYHgFm8Vu6vFa
 XtQMDU05nXIysEp8xd0FGNJhexHIFhxLHOJPsMIVTtYWWRfbXV7P9JwvLFNKwuyt5fMBcHIIddJ
 tFt5jS1Z/z1HDB/G6YV937UbZZpZCbmahoJOODOT85W1Uo7LUUI9dxZo5BT3Kus3enWYY3zDaCh
 d81TuyGMT6obh9EN/txeXAEcalpr84wF6zzIh8U3Xha0Y2SUbKzS27RA9wz6VhGEGgJNE7407gt
 DCP0UWzRz7vCtkpP36cPURfR7ACIQgsZ/o9+TsINVPIHku2bKyD9LF5oTzmfbzADlNzEROtOCGe
 7k4vzK+RRvx+VUUyE98GtvolpzdeCYVUxRUL/qRsWtogpvnB+P7et1lGCbWPTenstaHma3ynt1N
 9phjsYCE5VM8YhG2/MQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ede1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KmqD-eeeT8ogAWXj9eS3dYMVC9GtYtM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

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

