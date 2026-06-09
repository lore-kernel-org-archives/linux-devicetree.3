Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F13F8EC7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000647; cv=none; b=ByQ5Y3XLzPw/vp0SfaQ5XXHg37s0d+PrhKajMwzZ92346wYSwzh4lR3o7w4GQ53UsbzRkxnik7SSXHFWyfsCTAxKX/IM62JNwuDlvn6ly5OCqeQNvMnrEhAYyBuCCOa77LTiOJ1Uh6oPCSZi0C27YV6nXujWmjjQv/n648tK3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000647; c=relaxed/simple;
	bh=wfQ1JVa2OEIPjp2oLJEIyFWQZK2eWFd9pxIhDg2ya5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i57r/F5yBd/5pJFC/LUv/iMlsqYz4KW2lalq4lf5hIV9eqnGlPp+Em6D+eu14SbepVxDHLeoFhUVCrldwVsLIdsVUB+q6IZldYrekSQePv16nQrLyHsC8UvN+VuiHNBzKPPYjU8QVD3POKSM6OyiHTG1ouSe3bwIA4tCLPIN+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHnBmgF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXctiO8R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHnBmgF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXctiO8R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vgWA1868192
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 10:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=; b=JHnBmgF445AFD8nf
	2A4chtlAG4Rp5NNybbcQLHLyviagAFDTj8DF7JkTO5NnIfB2Fla7BZg4GBhmIIaU
	PdRzgnJ2kr39ZAB9xurKs65xI+Hj233u4gYr3bvIDqF90eUEMkyLc4SVbbPAnu8v
	CmoTL07g3N9rO2x61jxDarDe7JWbHrOLkrfIhJIO3t2ozJXuesCS8ckgX0QEOc0o
	8vUCPGykbPnMBC58DPsa1Xll+B9AgI8RpPUlWE1QpM39pFMDBKGNBunRO6zE6dv8
	iOYYQMculLZX22l1oKo4gxgtxg7068GxlNmJnJodi73emOG/c/w3SXRapwsOec3T
	PJwvIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdees0f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:24:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so41026135ad.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000645; x=1781605445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=;
        b=WXctiO8RuZJ5Wemw4pQjB+/nQLXpIQ4oG6cZC1LA0PxZ83iIcdVZ7qWOJoFsG/yEN0
         OK6287hh9oe7MC4OI/ugzj7Ug+nBUJJad1CZ8+6teoJKmUpUd/kRQDRnUCbXquAOdRKF
         f3Rvgr2Hf8vLZUC90Hz6QtUxXEFczr+wxZ05LQ2HKsiHthJk7hnn08KniLT9MqzLhKaJ
         zlLq2Gov+Q1mca9JR7nptBHMMUR/TB73AID/xeav9kA7QQuR6aNlz90yGLcJC9jNgNYW
         +k9AYRgd5m6dTuB5S1sXqvvWg+K1+jz85PB272uLPVtFArJAFkBZFL42BJHUI4UADH+L
         +y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000645; x=1781605445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=;
        b=oIWsY4t+BPQmEt1vU9VCKWf1+am5fkXkHEjDBFOj3WlWuYrQdHRUeKZrUjaKoM7Bc2
         t66BwTIYT9skAz80QYy0zDuV+lY0dah9db9cYfQxOJJmxXpHSOFw3THRhkQUKb/OUO0K
         EDlP9QQmnisElNT8t4LzlqLV7GICOZEkFv0uY2mjQ7i/BH3PeblvmCYQy/Ecun/uMi6p
         spbO1mEGCDzwQNER5ChrO5WntpWfvkVuAEeuEWDOFkYn4aetAcgxsPWbbfUIJxyf9Kh9
         qFYntTe6gJHFyMj8ZylnkTY/zGjqWPNT5Z2lf9qrep60PiGSNo54GrEQrH+rSaZsGP5X
         7rBw==
X-Forwarded-Encrypted: i=1; AFNElJ8YUZaStQeCQJpY8hYU4En4G0fp6omIBQRZP22zrdRbb3EqBsL1d/bVNWlW2GJK+RZC34QCOWj5Qhji@vger.kernel.org
X-Gm-Message-State: AOJu0Yygw9g8tv3dCdwEJjg4kKuH459StLpStFpI7absbIOTzddkdmqo
	VXBs9ytU84mm0qLzDTiCI8rC2Gw0Ly2kxE8tKNwOI54abj5aVuQEv2DmFu0dFx2kzXk6z5ymMJX
	Q5+HC3OI8FtfBgftbRGpuAC5tnUAmzX1BQb7u4v6E6xXglk7y5vliY35kTEGQaDqP
X-Gm-Gg: Acq92OHBcK5jicwXgCsQ1KWXQNlbU5ZsJsdmJ5cnL5UJYVyo/22aL5/zlNu9WAAtlb2
	2QDMr4TrpPjIeHpZC0I19Y3jQFU4uzV8dqMlxW8kfeOwQNop5ZHGCPYdZw64v5SfRXw6HYTqZ5Z
	JxPuhblxKfHoGllYcOBrxkxSnuk7uwJIACaWgsZzMfOSUlncIj8M6FW03Q32krErwExyuJTHyo2
	uoLsmgoR7fj3Ardr0BvI8vmOlDdGLWxMyMo9CfaXYHrkGP/xj73QhdyKT+U9E87msoQVhL1KF8y
	6rz0794SVvl0Wr16ei8CjN7c4UuxgCMEMkMiYHKTheAMVs9/CRKZpYaH4QnIieDy6+djPInDNPC
	bTBGPm1Gcvgeg+HzvXwnG9RMHgw7xQo3P7rhRi443h3+l4Bc6VZTcica/lyuCMw==
X-Received: by 2002:a17:902:d2cd:b0:2c0:b74f:a58c with SMTP id d9443c01a7336-2c1ec7972e4mr162852245ad.16.1781000644707;
        Tue, 09 Jun 2026 03:24:04 -0700 (PDT)
X-Received: by 2002:a17:902:d2cd:b0:2c0:b74f:a58c with SMTP id d9443c01a7336-2c1ec7972e4mr162851915ad.16.1781000644212;
        Tue, 09 Jun 2026 03:24:04 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:24:03 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:03 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-8-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=3485;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=1/EBgOpAhJyMtBEb/QMXo2jKvBNr1eZw42mUkkravA0=;
 b=iBqU+QWhGahbBIaNjO09rqJvQRFgRBcByvlyNfbQAEP+QpP1HG4jrGCr2q6a3/m6X/IV9HVxf
 FJWa7KNPGOZCkmc7HQx/4W+J08E1hpNOvFIOkmZorftZLVyueq/oVkm
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27e9c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6B19zR5QVkII6VYPc-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX1XFMv7u07h6j
 SPG6zhZhrPf+k9VQw8KtZS/IjK0navFEiQ5hy6ku4hdWqtncPjEzhmbcsauaJGNGgbrxC/X4wZW
 gbEn4uL7Q5CeWctwI7Na9ls2QeMkgS3Oy/ZQvNMYpdRXLot9Kzue3zjXvTTtMBDciIkGXtOR7NA
 CWIT0pSIl/4PN6NdlIkx4A1WtNQnM/p7HbJVbsyPV6+IgTrlA3RCYghb9WbyV8S6uQBSAr2gAlk
 Rl7YOwf2sVTKR4Z7Hr5k47UWLGtPn/itxOR76TgCKUWWtkoAK2M7xsIPMjO89xb3xyz6/eal9Gd
 +jAMFF+bV49x07y12k7UZwuWRMjYBE5Tl7Yb9HcDXUz9my1nqTWitpRfMfMx8k+PZSO1RoZA/lP
 RZ3sry7olYNZ7EKCyzusKvst8Fo4V7JrmF954T/VdezicDbF7rUncA4JGREpttWl4TI06XsOtzM
 QEYB8fTP5hemfztRxBQ==
X-Proofpoint-ORIG-GUID: DJkSYc0NPR-7R7fVCB-SGdu8XBH1PPuM
X-Proofpoint-GUID: DJkSYc0NPR-7R7fVCB-SGdu8XBH1PPuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..92daaf4890aa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8815,6 +8815,9 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9402,6 +9405,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9411,15 +9415,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp0_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp0-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp0_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9429,15 +9448,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp1_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp1-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp1_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9447,15 +9481,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp2_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp2_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9465,12 +9514,26 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp3_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp3-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp3_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1

