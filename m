Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3437B41F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162237; cv=none; b=FpOSjNqDhSAu/n54m3SyVfTkYinYJcKqySPkmkb6CcGCf0ED0W4KX04KMLi0w+cFwRDZa6I5gXIqk3xk+CXQAWEO0eLN0eDFoPDjb7fPsxzpsAz23yFlLrZVljUWfeFwe0MUwYUOaG9nNeDEDP+uWzkP/w4SCORUqC9KiC+/8uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162237; c=relaxed/simple;
	bh=ElaZ19YrpVxQ52reuceZ8prrArwAHPwBWoivNbvpem0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieK917JyqwtErOoj6DO5FhBfUIUjvPVabqj3FLYLgj2YxyWUi46h7Kt8Dmm3Ki4WtdObhy6XQF/+ObHZ4ixffNZCQgH/o6938IABf4EAWY/zZ76Bbax2dH/hYmU9GH5AeD7S5/R4TTJFfGCCfBekC0dMcgebp4qTwOU6T/NBJNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efLabYP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkSpY9FF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efLabYP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkSpY9FF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlTjV4065524
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2kXRYvqDncUdt5jNg1KXYjF5JY92K7gbJpqCK3jads=; b=efLabYP9QtrM/eIF
	XovUkA/VgoapjOUzYvs/LH1TWF7FwrNbGWB0WytMRVe3OVf82XsoP2cWmjZoCUbU
	+GBhx5HMrnVJxx569vfgEwayOXE5Pwt1EciTULCeZaQcj01k4TUkENJzZtAx2D+I
	Z71y0mx8+FPWXcjJfbddlfdKOK79LvminJ2+0yQSy0MDgyEOV1EXf18WZ/WLUbaC
	XlDTCk7OB0smpIWkNlxjRWGqFJC6Kzrpnyq0av5tKsoiJGVCv8YXu6lzrjLjlqfm
	Zbj6PX48E813ldh42cVfllspofnFkX7+Wk9FMn+zuKC7ldd9rHLWMOTfsn6ytFo/
	PjRGaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuv3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so13547205ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162234; x=1785767034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2kXRYvqDncUdt5jNg1KXYjF5JY92K7gbJpqCK3jads=;
        b=TkSpY9FFYJ0MR9ZCRX3GtQzIJgWgV4DsAIJVx5fOUPPD4FDBmZy+k/DY3IbnTD/p+9
         I5AMeTNFOWNRM+EKph4aBuXWJ5VfwCGL5dVF+sGau2/wCQRs3kruZjSBJ5yLuWXZ4Ky1
         nLuagyuKMYAv1HOXxDEKXK0k4gTGxW40PiaLCSfLsposWzcSRVb8f0H3Nk4i/L0KkDuR
         NE/QoHSRC5OLvPzWv54UHwbkyj4QNQqnwmCriqecKIVDrbvevmiYeeUImAgVtqN62my/
         ScL+f62TcjhSgjohd2JVnQisfXiO/igbbAFd3NxdgQBJSrerCg9dHKs3pMIkl54WireP
         Vvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162234; x=1785767034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2kXRYvqDncUdt5jNg1KXYjF5JY92K7gbJpqCK3jads=;
        b=HE7xf3FeWjSZOWvJYjuzADXSbEgaCfruGeG2PYgpUOuYMPNSiBdYu0trP2KMzeVYaN
         ZPSx010HZ2zipVoQOsQ5yOUWNPTU+81W3WCCFJ10xCxZgi2Bdpud9xfZrj6KP5sBywib
         DZNc1xBQE9kFZTmWNiaJJsVxDWElQnkbKgFahPO6b2VZE4uGYQBsojbQtN0XLZf7YbwZ
         Ov5ZTa4tnYl9/08fwz73d+RzjfOzLZw71DlzrFWVfluGYOPWvg6MPXk2rOWlijxGId1H
         jcSpKe7CbMywMsJmLlMiXsNV+IezHYjGXyZW4dIbbRADK7tm+pl0V57Y3PyNyKNA+7e0
         fy3A==
X-Forwarded-Encrypted: i=1; AHgh+RpxFhyssncmCXdnqY9VTm3AwGec46qjKtPtaczY/IYqN+M05JA/P6y32hj8cZeNc2pgHtI6NcttHtOr@vger.kernel.org
X-Gm-Message-State: AOJu0YyQla/aWghnSSUXUTDfmqB45nbu/oYLTEO2exua0AAlZH99av9Q
	HvzNugP03W7wba+VBXiP3V4eJMsz0rtXOP01+73+Irxr3itohD/fB/nMKtCi9uM4/xNiNtiWS3H
	xN7aloCjcA2iKrH/sYCmt6Xn+qfpjyiDVTaYEqgce5qvs4b7xcfs65/ikpnun2JpN
X-Gm-Gg: AR+sD121TgihCN3rP3ihbeLQ/x5OrejCCLz+3OrXO7GGZgiqTJNkAJh9U/Ca9+OWwGZ
	EFmQzDVyauPiU7TSYebIIuIVnQG4VcQVPFy826pGuVWY4AsUVsYHEmuzbUjNAUxv5qW+ayUP78x
	yQ1Eyxs7o3ilWEeqH0C5v+x+UBRB3GlrejnoyomMIra8z4/zTPtikFAGmihaaiaZq2svYLurQtf
	BjReIWdBB3CPYyK08rfBi/m/9Qw/VwAfUjTwn0zFPmqljYCRNzoyD75JjeLqmjDHICjQuKIlaQg
	R0vk6QcmIApmk25cVeZgn1ngOI9ufjmAc3/QeGcACwsM95zwhdT9hcQlbN/RB1H3rkHpV++dc8E
	PJrL2GapUyP/dGo4pPTsjTRmlqm9Jdg==
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:afe8 with SMTP id d9443c01a7336-2cfde8a51d7mr76391585ad.43.1785162234490;
        Mon, 27 Jul 2026 07:23:54 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:afe8 with SMTP id d9443c01a7336-2cfde8a51d7mr76391395ad.43.1785162234115;
        Mon, 27 Jul 2026 07:23:54 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:23:53 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:24 +0530
Subject: [PATCH v6 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-b4-qmi-tmd-v6-7-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=1931;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ElaZ19YrpVxQ52reuceZ8prrArwAHPwBWoivNbvpem0=;
 b=K/dIj/MebNfsfsiIIixdpHpl99zMk/73OokUAh1mxd3m4OGFwVe1XuznXCYpZtuuS7IEovkIS
 5JD54ZWjqgHAW5ymH0+Iv0gwkbC8Y1QN1Nv7vOwuqFa6hd6YyA5oFmc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXxZfstcI+KutV
 btjZ8Gx8i7r94dIRCs5sVGZKVjuavM2CG7j7xGvyEARcgwJfOGso9IbhpusRFYxKlsgfOghRUzg
 Um7K55zbX10nncue198JvI48R91wFxsrCY1vKCFcFJUvu2IbmEv5bV+D4UThPr7wbs9QxUwcwoF
 g5w+OHL0eOhlPK0SjyxpexwiOFHm/xRx3rwB+nvhd6H0k0LSJU9sTjP3ffw8oFVC8WF9tEBrN8Y
 J8V5lpKm3dM3055/YYb24a72Bh9riPwRXVdm8LUvAL8VEHE2h1CV5OVNIYowk/sxMWYXqsHL0Gw
 4UnLNvvNH+NFvJZkVJKROHzH3mVVAENSHb0vaIGlzFDWK4NpHuOzn6mu3Pf1Zgs+vjGDCBSO/aK
 vSVc6JDpWHv78ZJa4AlhaVJEGm8/0yI72AHXumXmfJ1bExEgL7VTT8LHUKOa5JKSdVSEFjOatf4
 5nXze89Q/0WXRDKdS7A==
X-Proofpoint-GUID: _KPWvuRiS4TL_xabSm8Wdc2RbKM3L1EE
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a6769fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ptpooaJMTZRctn2qr1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX5D5ZVmrjE2fE
 Y17hmJEddcUBu5Q69Y7El3Aj4eRqrW+na5vKNkYwVbwdOHKh5VYIZJem6Wl0UnMr84DEqsqz2L8
 2iXWbqh1NtmX+Eiszc6I7q8dP7f6cV4=
X-Proofpoint-ORIG-GUID: _KPWvuRiS4TL_xabSm8Wdc2RbKM3L1EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..0fb7cb8e9f64 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3840,6 +3841,8 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -5497,15 +5500,31 @@ map0 {
 		};
 
 		q6-hvx-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

