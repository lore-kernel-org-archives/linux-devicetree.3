Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87F138490
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777087041; cv=none; b=AdPCD11IXmRWw8P3FrHV7uXwur8VRe+GxySXHlKblP3tu0Gm8Yj411X0fbQ4fF15fYgWDRbCIpxL5UJRn0nNc02EjBADMgodQkMRxc84+ZQ619IPPnLjI8amo/D/6eQYOLzOe3Bi6UKcLw7E1v9EZSD/AF+0s0R54YrdeQsf6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777087041; c=relaxed/simple;
	bh=F8kP+N/mUmZoO+Kd5edx3dpf+li6V5/c595X1BMnhdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RSBsrQCTdhozIfBVezbREic/a6ladC0agaBUYbVCa8Wn3wPzv+JkPoa06eDksyv8qYloXffXyvEY2XmxnxuocaSAf+7ova7mO0Q4TK1epYziVqNxf3tA0TNMa2WomF+QupRCXNAjbdgGtYizPX+do7K8hmNV7Za4Hca9PqYJ1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRBP7m7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2opODCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRBP7m7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2opODCS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P28nha1418279
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLM
	SwToVJZI=; b=hRBP7m7nunZzTgO9ZeJVarX1J9XuQqZXCj85MnVIdv9GP5ZV/Et
	uygRXh8pjDcU8Xd76cy5LboS526/mV+zGz4QuYxZLeCDtb443cIKdvBSjeGTYa2c
	Zz1t/hPAwGgB0KtEbfahxwO8tdRv4ET40kz8ip1OAqLAnGs3Qhc08KGh3Q854cfZ
	DRaYu4/8HIh8UL7yVmOCQAYbOriILiuEPB+B9qZYVzc5zIkbLA3KlDQZsBQbz3bp
	sDHdqs+9oTi07i2YNLJu8YC0NfupG1giGiERKt/Ce7M7JC+faSCXYwEmb4XI9OWJ
	zZ4pzF5drUi0ioUaEBl5aIgAcTkyT2n5FoQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drmju03e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:17:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f780a13c9so6142670b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777087039; x=1777691839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLMSwToVJZI=;
        b=C2opODCS0O2H+muq37eU0Zc/u9FetvNt1Jily4ZHdTKDnTNTDyk1vmcIg65foI4yz+
         5OznRt2HMtcNXD7kzDMOB0JwElKUtpGsoGpqudLKIe1LxGVP7mnGUXVMNSBvpBAl8ipF
         rqFGwNwxxEuaQnipVmnFdii04OpboQitQOdUsD5Wclu5r6USzBDZ9DNM6V51+z+rb4vB
         kvNgrFZZT+T62pKuhGtkmeYsSKWQh1kDgif2l31haKRmqAnconeT4NS/ItC5bBsCECVE
         U/ZEayQODsJ0ZuTwhjLwvRkWA5qPqiHTV6F0W2+teoWtO71SYWW7fjiq1e9qoTTtR3mY
         WV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777087039; x=1777691839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLMSwToVJZI=;
        b=E2PT6fECd0rdOjL8aCH/FF5CaYsYwsqwGia0hmzzbnRy2zUoRRLM6O2yTjp6Rxyb1P
         I3nHDcKT0OLq6GO2pe+Pu6EtY89SfOu6ApY2t7HcnY5/IxuDMuGquJuupe9kXEDzQMEm
         FeKUDkQKItqYVQSFULyUY2JSCy0cBgZzavaC9LWhyv7pTDtm8cJzU6FH3veCXjWXzS/t
         nP7vvIqury3KWg9VhklQP8nqOVkF645nMBm6yQjsAMnHgqxOp01aZODQpWnIFH6SiqhZ
         YNOQqa66o0/uOi3UWQQq66Z2Z+TuCfSe5vIL8VvU4+ZpwIZYBsa1agJaQDDRAVa7Qgn/
         xB7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+PWpu0qXQpxOzrz+3BOoTRGmUsPnb/CAgWtQhE1YWekGMwVTg5vJD2fEUfxfM7VeZwAVRlr6yJgtmM@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9rjjWs25nqrje5asexhF95t1wk163SCttpfbAXXVZnyduCzs
	MeqdGsEtVV37ukt3fHfQE+f3vc/FMO0RcpPE0oxQOGIhxBHAhroUcRaQQrUJEZVTmFOrLutK09j
	dye3+GNcS3p5QbG1jQ5Z7S08JxihdULGCycQ64etG8cbTS4TxJB/oOoL+GcyvKhwu
X-Gm-Gg: AeBDiesupRqKNM1Q1ecXvRp7+QzBQWlIAtLVcjUHIj/+l5kvcuXim/XeqCwVat9R3Ak
	EPdg8EVARuSUotGb1TGT1zSIYiRD1Msyu0zJx17IONGeaXe9shUOCRhtMZP1VCUQH+3JgfcOdwA
	iWwliTafiWXnajwRDvlOIwKUdIMd4XyGWWn0J06tPiqBbclkhRTue4XtCFSPyfTGAQgx3bBL/FN
	hyOMFbsvV/25j7McNW3fSrbi/RmTCN4YEyfQadlsXvey0prQbhSReB9zRrUCPiI24XgoxTpTAia
	IxCjkUzts9yV5zOdx+3IztGpPQ/o5deWlHG5CvDOUDe98ErBIKFT+S4gHSnhV/RKpCKu0oFCzcM
	LLPMaLoQ/mQDc36RfK4vmho5pyCtdWwoyzGRWRPYjkQ9XeHNnucaD
X-Received: by 2002:a05:6a00:984:b0:82f:2985:2094 with SMTP id d2e1a72fcca58-82f8b554ebemr28643342b3a.30.1777087038813;
        Fri, 24 Apr 2026 20:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:984:b0:82f:2985:2094 with SMTP id d2e1a72fcca58-82f8b554ebemr28643314b3a.30.1777087038264;
        Fri, 24 Apr 2026 20:17:18 -0700 (PDT)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec23b19sm29189952b3a.59.2026.04.24.20.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:17:17 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN supplies
Date: Sat, 25 Apr 2026 11:17:12 +0800
Message-Id: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TYymcxQh c=1 sm=1 tr=0 ts=69ec323f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=OYB4W3EJkAgPSM3XL0QA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDAzMCBTYWx0ZWRfX1Pu0RKbjiKvz
 RTYdhzdwMZp+HLjkWnt7IlnEQSmaJurVm80koPIa/jAUy+iWH8ZWu2S9D5Eh4sYU+m0yxQuALx6
 fNFzGCAeeQYHlmIC7WXgul6orYg5Gg6Up4MN6fSOKYO2qI8rfCxdjK08gPUdwRjKtmgoqa49TDV
 Zh4wL52WnD4HbphxQ/Az9cD4Wt5SQObIWyu2MDdOoxoFvae2+2bQIJY2TS/sAlWSbMfpaF8Lo56
 NUaTjTDl9YzARorp4ffq3tDUNMAZLg1iMqvtlqSrSr2tS7KFfZjj5JUCkwwSKCPbu1ZKczJrtk6
 AvA3XFxsa6hfOexhKcpGkS+gL/XxybkfHmRxFtRvmboOB/UWqXlRUzKqFIx0GJjr5F+hCU33YZI
 LwuCrXTxTyMG8y4nLCiPm9hfZKzF8oR8IdO53/+YyDqgQinF+TTthRJnQHe+sMzoEUf0B9ZaLZD
 NVn9s7jgBz2Rk82fKww==
X-Proofpoint-GUID: -iZfPUvE34obVqfIjuNascwDYJ3NE80a
X-Proofpoint-ORIG-GUID: -iZfPUvE34obVqfIjuNascwDYJ3NE80a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250030

Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
power rails for the Arduino VENTUNO Q board. The regulators are
enabled at boot to support WLAN initialization.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..1a40ac5bb4bb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan_reg_3v3: wlan-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	wlan_reg_1v8: wlan-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
 };
 
 &ethernet0 {
-- 
2.34.1

