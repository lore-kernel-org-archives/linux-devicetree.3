Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D03E5A10
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335333; cv=none; b=WJ5uUIVVETl5gTuPih9+KtC+4wCUQjGiWhZAFd24NiPa5sn0lvEDs3q/LojwV43o9bGgAa3SQynA8IIJEua1SEGVid08ruWR6IRWwhkYvly+pl+znbEWYx6y1ccCA3e3HgsvXc3wpwXuRyHOqk/9L6lGytn4BNJ86gPzfsv/3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335333; c=relaxed/simple;
	bh=WLYdUaTWVpBtZwNr3HlNaZyWKT1SmuJRkQxVpfGW8Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqfN+mC1LKiLeg30aMJbCXoHVzjxIpn3KlKA4lzVWelHgR/xJbhdVTq2i1HYJUakx+0vV3E+EXbAqqrAwXKYciLE7sBaPS3COq57hkYSd0M0AOVLB0AEfdyrIWecuvSoNKPKY98lXCTIIlBcgzX4w5r0vodEB0UmMsFf5gTz6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVursoEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuTKB7L5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVursoEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuTKB7L5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjgNk185047
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4mZazLNplc
	RI7UA2lzg985hqmjiwniHBuU0w4DnhHw=; b=JVursoEorsmNtXPLcrRyPc320K6
	YuCsFBeCRo5KNYdCnDR/YCHW8JIj9IOQV8ABEkfyHoPYJTN/2mc5yovMBAKQ4twC
	C/t3s0MVIVaum3yytrsaxYXdxdvJLroIe5h8j8Ie5oaR7Oyv6W0tcGBmsPbxPqsS
	bh8Il40tqvDFD6WLWGxpwtc8NZO+EI+EVs3PDfDda9fQd5DsPW93P46Nuygob5ce
	gDFHazQQv8taF2VIkYfXXbYeRMeIrudFxGA7ykzSbWn8CBscWNHXfb5sy33umXLT
	uqk52F5V3CWS568yEbEwhc9R2C7Vx0cHCR2ZV1GgTW6R7WNcCcMpI0Eebhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajm92j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso195941785a.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335329; x=1782940129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=UuTKB7L50nAk3HKd1FcDjK3lchUNdX6eR1/YiC9WeSQyditN3Ylewyzn6pfCkvy7F4
         nz4JScNLBht1VMMLYnBuCh4YlNWvR9vnyeA3dLhCGAlR76r430HcIN08THpQFonPJUCv
         0wg7r92zMcwp7YJ8h1foknfMG+OQjqDc6dKQXTaT5qwHgzfWLdPC///Se3iSzvWnbFz/
         goncHquwbR2+cY4oYP4plL+7hXoVW7QObIf0KaIFo6d6Hl8DMuHL2SIgmsGIgdNWDlYF
         t9pZL6wjlG/mYy8+UsWcXMeKf2AMBdmKzbXH4P3tLu76rViyvhg0wCh31RrZLL2GQ0/D
         iO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335329; x=1782940129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=jojIeTGryi6r067Hw0frgcwJhLG6LwEuj2A/sShNDlYenfdvJWqgLho5Y/rCgkbJ7o
         WT7XOwlgfUS5SHpiZudeiESumczyfnQO+Mrn++Dc9l/CENL0uP45BeKLL11DAaXx7KGf
         7yf866DuUPXtJFSSnqNSFfC1SqNH6bFhWSxN8XEiBcD5fMDkclzHXRLhTURcKHHaWZT+
         6OhzjqrFmwzvpRNopQzdF1KDKRavlWsbCQ9h2PnTsBjvCJ8TTIl6L+HlFNPxG6pFvQ/t
         oVHE8gyKm3VQhSd+10x6xr3ufsXzfW+oMkSEN+TdE5EYExI/DyTTuf7Bjx1f2p1trJbM
         3I3w==
X-Forwarded-Encrypted: i=1; AFNElJ/SuSGGcGD7uygp7Pk4IA5IJCND6JvNF1owfLWpSFBgCisLEjDx+ruWBhfqPh2myX1ijK7w23Si7U+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwzBrHNpMf31VQQYR0Ue2BBLp5gm8d1CT31zOzNhCzbjEoekziX
	/GHhpHadOjXlJnDmyTCodTXCWO/5Hqs3MDA6zNaIv/cA22Tahg0+qqAfK4V1193gXGAVy+svqvI
	Xo0E33AwCSKXmS+pvzHlWjjnb7yfKOGZF8KXVglfsS7KB97lJI/OqD/Trct4dEDDv
X-Gm-Gg: AfdE7ckdkcLXTMIYsUapzL7qUv0yR7tfa3c97sElBC+UMrQmI/QrfdT0kr1yYhFOW6Y
	9+vyjZWufvRFd9V6ZYs8j7lPesDdX3+O2GDTmBBOtuXtEWpBLl3nmkLyVJNNqOuG1nrUDKhjsFr
	z/GKJO55PBqSDM82wwVpFqdDsrXG8EzseQ1w2B6nkbDnfd6Y3BMBjatDnxYJvfglQg36GmRSyE3
	miNOjIjvnds3v5RwCJE0JPXrfNk+ZDnJ+PWhDqCttkgNEC1kCuBqXdS/rau1//ShdYcdWtS2Ala
	9RjlVvZo7QNZrX2q/Y+UE+WPlszMY+/WkP4UB12TnzcPfBgOKWhoahW+Eh/6VrVEplFIU9tw7WS
	UUX8yi1GF+Jo8BPP3U+WEmwiOEvHGVJuIky+B0z8H/1u0hQ==
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431681685a.19.1782335328448;
        Wed, 24 Jun 2026 14:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431676085a.19.1782335327986;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed, 24 Jun 2026 23:08:25 +0200
Message-ID: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX8AP+EgoelsmR
 DNixA885pg+9NwgxvibvPtHkfp+A62Ak0beKejH2J8vbfS4l1KgJD/qNLxE5jNCCZJ53PBk35T1
 CDx/sk7l6WLTZh/gwRS0Cdnc3MQKwmg=
X-Proofpoint-GUID: cAq7jh4Uz4EK9osJu41IA2td9QMse93r
X-Proofpoint-ORIG-GUID: cAq7jh4Uz4EK9osJu41IA2td9QMse93r
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c4761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=MYPoBHUstc7QsOuohHEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX1Vrb3fDuCAst
 xzonb/6ZfbDxHII2+lgaSowriEH369A4ZvnNO12tc285yRmD5b1XPE3VgyNnFOE27snLM042zyH
 EC0TNeIuu/STXfudCtnfXYNHH7s3q4TxT/YZhtkwYPOBv50Uc55/OlpQz1+HDEpMxuqvJ5y6dah
 zjebjqTDtdDPCLw0C/kYummus5F44dckS/beaCEjFjB0dtLKwKaV+yfDKU6pG1s2OT+H6fHCN96
 Ituev57IBUHd1ovEhv66m2dKE7Qyo3ElAU2IUt1EO7x0vQBVBHFrxoC0V/I1VuyWrFrtX4TTzMi
 Hj7hGsHcx+JULXMTZhP7q5ueVfTq825ncn6W3GupVDEg9S9dv5uWbnk2tu3uIcRLWYwyEysO4LB
 H2AvnM/3lSzqH301InCwmWWn4l0MJ4JbFrlXZKGhHXkN1TH4ysSYjoKyIHhY5JXjq2fXIYZC9Zs
 bPg4sgHjhGQnQuK7hpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177

Add thermal zone descriptions for the keyboard skin temperature and
battery charging circuitry sensors exposed by the embedded controller.

Expose the EC as a thermal sensor provider and define two thermal zones
using the temperatures reported by the EC:

  - a keyboard skin temperature zone with passive and hot trip points,
  - a charging circuitry temperature zone with multiple passive trip
    points and CPU frequency mitigation levels.

The charging thermal zone progressively throttles the different CPU
clusters as the charging circuitry temperature rises and triggers a hot
condition at the highest trip point.

This provides thermal framework integration for the EC temperature
sensors and enables platform thermal management through standard thermal
zone definitions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..e27533665c8d 100644
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
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			alert0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&psv0>;
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
+
+			};
+		};
+
+	};
+};
-- 
2.53.0

