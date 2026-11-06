Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956888;
	b=qzCT9EKKOwOiJcUbPMwO8vAjm64Dhdvq+1LWOfGHl7yJsL6fxNDXRtDEAt0wJ7Y7MPwa
	 8nlIbRAkF6QQVPXi9Bsb4+DMGMrcgKuxl/meLZ7DEJgI3JnQsIOaRB8jhnxStqXyL1fc3
	 PiyMtf2G4+/VyCPYxyHs3IRSf5R6t8ThILwAyP0zo/escLDMDKTD4oGP7DJYca/CfHhVh
	 MleGVm8agFtBqfZBLg9hXhWXk01RQgtJ9/0vaTFIFrEBKZtMeqM7th1zrTSQyuauVGd/Q
	 Dp7oRrgMCp5AKUkr3RlznBsVsHPB3FGXsCb9rDQtQrpu7bq464+vyCUheUmdIoCuAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
	b=1OSm/9akRYDamJBlyqHaK4SpQOXvgq/vTWDAQwxMvM6NZY3tVnDJ5A8xEfLlw7XVEPQR
	 GS1FekPp1J56232/eDcOVPMP6LgxpJnmjafK641j19S4egnig8M4mQlYX3YrHEouMunNA
	 G5EhXRbQFvUce/65vQQbtSNg65K0k21IC6UMfekP3iFvSR4TWDfFutH+xCpeWEQ6NuLGx
	 h/fbTb6aLF6BSVxgMjO8OJf2Y6CZSwvDevyUUZ16adyV7+Iz5MFj/Wp52r91bcPtOX2OE
	 0TvLl3LcdAdCoWcmwyNLejhPqaY3RTU6jHUtWH1/OpPrt+Gdk8AnWcrmLPpIGfZz+vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2A606D810
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B2A606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9BG2333818
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=; b=F+RKZriTo0yBRXtv
	zui1Q4ia0oPbOLU7Xy9JPdG/vHnJDXI33uS5+BINIMMu/P1W8+30K+R72SFbqn1X
	/USq5Vqc58wECksW0HjU9yXlRhGCCUQFmg07rNigKFR0aIYsozmPsa4WpOtNOOYY
	uwSo3ux4SyuUp6PTANbcbanKVQkgcutvrsY++a+5MM8jbKDICJ5bbAeR+SA8IJrh
	Q9JuAcv6cNIaWDm6SzKPxcqyLOXXct/xy3Ky3H07yVKeKyrnic9z8GZta8y3/TcH
	MVysGgrhS5ULUV8faO+lRxK+S9niGwsNqhB6i4YkuZ7ZEoXqo5EW8vu+Vv2O+cSL
	eUtUMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a5kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso642848eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956886; x=1794561686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=WRKoftLdUIgZ1nF41SSYJ7pFOsFqZVlvLJirVOWMKd1convu7aJotPlK736RqTKuYM
         gqIdLBxkyvgvG54Iz1h5Qux56pXDaEJpFCdfyWwE1ph97QSQXMXTc4xLM1qBscm+Ud7q
         06xSR70ttwQiuB6XcVuBymEpArkskEc2LfhRmrSbmXIbj5f0Ux749rxAN/nj51IbUQwL
         78Chg8xbjaEnQwzVC2tR50n/R4Du9enrHdPyQlt7Ul2sZ42NXYN3nb7ondVPU+9r/k6I
         JJx/nLMEMQVNWcbDNDNwWQ59+VVEVszpt+sXE45VCBn6sQ0W7WM1NKg5V9AQ59FNlW8b
         D7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956886; x=1794561686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=Nhi4YYAwuCaiEmqB+x22BegrarpicOnNnwFrPo/6lCWVXtXWq/QxBB+jyc6sk5pQCv
         0upKg+CC9WgLeUTQhlIraXHHyzJ5VPIsFFCvNxTMOUHfsZUfdej5sTSuFbxJs8ytum3t
         s9mytcG6V1me+SxfojPMW7jfRDoBNbF4tQ4pO61DXMboFf3S85LSX9stqoimX56n9qvz
         qCpF+N+wD9PXUIrecUfWq4Gjk0J035jkbpFnYdJZMBXE8AdCTCFn8BPg6Nf6nZpxTQrS
         S/pKIBaRsGEXVEn1G3lN/isJhcv8W9ARhugxACc3sl0p+knsNktPxPYvPFbAcTCIvm0o
         HsDQ==
X-Forwarded-Encrypted: i=1; AL+hErEMlqwSQ9FxFKbVm40tXZbmFtqQjiRFIIAXKIOzLRwObuO2INAmc0+XOy3Bpxx6/v1GIcLe4x4gKkda@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qw2cvH0I/gDab4LyDVW5MvjuRg6ZupuFr33+x9GfD68yUeHav
	oLMO6l84kdGYbZByZNX2HM69UMZfT/hbNUimQk7FcWBd3gvFUOPD38XsscWB7716dp77wRb68vs
	5+Aun569YyS6cBHaxmFvyGRUX+38P7d0VZN28utiCKJkk5Y6nAxG4LQhpl4MOd0pu
X-Gm-Gg: AYBFou2w7CrDopeCtBUmGYRri37sf5RuThno0bMGKH5UJXXjKdBV0/gsjOwSStp3yYn
	OYwzhOUypZbKkjYVhXkZZEA9F8v6T59M2vzQhOqM+LpDSuk9VcpGJ5T0b4mDnKsgvMIyLp56YuW
	LLVwiOWExIKK/O0iQQE+e2rKK7m0rHzmH2izoJGRbWagxaHRLQUugjEAopuozkB/Ae0rD/9Tfaw
	uQN5Xr/H9fevJaM3hHF5OlkitqhqkAM5IlAekzJFQR5bsHEpmWAK7tolwXlOvLTBhPaS5/wH6qO
	h+5QnqFYaRXAx5/Xb/N4lmWBxvAhGKr+oX58thN+Ah2ebFSDWB+orbWUkjM56Kwfs0udnyBZo9M
	mEG8Ftc1JfK3glwtl0qRZIwlJRXcovJ4BVBL82c0yLxFF8eCALD4iptO9nk8qnXsZmfTISUPiPt
	YveByjkZeeXuHIbfDLJ9oRPjbmftyegH4dX7Hcrf4SWfDQExRVwjWZ63Q9UZz72hS/81M6sXqpU
	en1aw==
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121420eec.39.1793956886489;
        Fri, 06 Nov 2026 01:21:26 -0800 (PST)
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121384eec.39.1793956885880;
        Fri, 06 Nov 2026 01:21:25 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:24 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:53 +0530
Subject: [PATCH v8 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-4-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: c4sD6Rz4piP01HUnAvUMvoU4WLhkOgAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8WPp32kgXewC
 XeGPKVJPNRBsdAL3wEjt5JSVUavpZUIGFgebOWJqOdUitwBLdm+I+5OUM5VtN8kicbNL+rQvhPX
 QkCJ0ow1dEiVQjpjNNypqmtyENYZIqUuclkX4aWQ/W1rB68fSj2ChklZZ2cL180iwNxGRoIUmyJ
 YWk5P7vW/6ZV+vzRTeEqXZz/xHWYr2gmeWOPVD5ol078deBnxANd86U3ydirfb8qulsLpP1Mo0c
 osqhySZWuKPV02aXhiClzSmuWA2iTRnFfZIX6Qs63B1KsObEjGGYOz09pBwiqjEbxez8U0llb0W
 Zv0ro1HkxZUGA0P2eKFzNqYTFAP6+Hz3vsDNQUExsXRk2kDrwNSE3eKEs/4mUZTQGFz/dVvcZ5a
 6YFncGI1D3T3TjeJNwbA2W82pomj3hImASwMEm6GTJ6RqmwGQFIGSC1pJSisqIb89EnbD+x9FBS
 Y3gw1wkDgqIJeCZrmxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX50Tb87FEAAVr
 RGcyh5Tg1oHIRc1vV4isp2p+dNM1PgKR51t8liwE0/Fc09BjLyk+ErIpb0upqhobbfOSQqKmtJT
 pnaCPTpio9Oe4Aka7rmCIhnEM4MyR98=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9c17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: c4sD6Rz4piP01HUnAvUMvoU4WLhkOgAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index cb0adca9a151..422e2766478a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -121,6 +135,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

