Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355EF386C37
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162245; cv=none; b=oFIhL80+KnLfB+5YZboeADGz83JGLH0Dnc1G6MvI/VfZ8t1kXj4XOm7g20CBp3uTg3CYDEKUUastxd9DXm7yTiWpmmMv7rzKjrOm8OgL34PrHQ3XmsSFU+5kSk1+ThLdwn847nChheYTeQv7Pn/jhVIUgP7xMxGZqS4FtWY5MLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162245; c=relaxed/simple;
	bh=8vbyF0r7KBo2gx9OMsxuen36V3/WCj3YTuhFogK4cCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAVRNaCEsOX9EKKQgnJ2SHGm17/k0yt/TOu8UyZYzBZqA2v+tYDIvc5ejiuuAkUuLgsemv2kRapSAHYqmFj4nMtoAn7oEYAuDhueiv01rku7lS39HET/0zKGH13GuIrrY1pK4lY4SrUR5ks2w1wAc5xm5fkluRmu6YaBSqzfYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPdASP6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZUvsaDl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPdASP6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZUvsaDl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlft8033194
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=; b=SPdASP6NT6Si8Pt3
	g3I2VydKqD665QRpzKe0sn+Cl1BoDBaJU4I2oi8hRk4T8ypeRlv9qXdoaC5KnOBH
	TB1tZc76VxyfDiDGHRhLwWFfOZ96UpGj4w/zEEgaTjNhCpBlSL48sXSdQ0SNJ8wv
	8+yl6Qyf/Vtuz2ex5Nb8NUE1FmZEf/QHmGjh9ekPQx0Ru6cotaGK5h00SwXKH/wr
	mCKEqmBU+Gohil4aoqzfBG6FGIipgCV3sc82zF4jI+wR8MXypQggR6HSf1d0IzAf
	bAx9f38x/eMPZs0zVGZfzr3eKF/sjG6W00wC8EOPGcHK5CkHgGkmKahFN/jVift7
	a4hUXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61782-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:24:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso76828625ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162242; x=1785767042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=;
        b=BZUvsaDlq3KjmSWxQVboM6V7scBtfo6c+FZdZuU0okwgG0zCW3xYDiyKdAwCrMSio5
         xhxxyjb7VGuYYhY0qKvO6mNz8/s0glHPRi1tO9PLBKhNiBCX7isDIDcykeXZKKT/Fa/k
         fDvcErAEGAPKn1E1LPNR+ul3dmWhbODdReGFIbTlzE88MdP+fortop2pabKRff73+eSQ
         TEuHEhEGsBVsoRZA1JW6NizT0SUe+KGgoXEbsZn+HWgXsmuFrxXJ8g5zktjdPFr5Kjqz
         L+XSik3N7Tg/b2sWiQe5QFYf4nKYSAl4InaQ+Rlh+x6MOMB3nDx5KVTxZ4i1kz2Xx0rM
         /3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162242; x=1785767042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=;
        b=AlmlyrCDQBl0hj+FZGliCr4HQgH0B4dI47sApAALMXKRw05lUZQfWFcbKW4mnljtf3
         jZlilaB5pYi1b3H7229Tfs/LTRVuQJ56bVidRP4AXhM4o1ZL/WydkRAzWK7g9lcgMerg
         kczDP8uLVmjZWBJuJW32y5EyJJQfV5YGVY08LWs5fZW8gQz5TH8lqkvr6gTzSVkPjy3s
         a3fOVDJh+Mw4Gp/HQTASPKUEaOVeY//Z7aStwpnqeKs3PhQARIXJ7rtprJXaPOuCIW/Y
         ng+cUri5jSvnuYjQOjNjScoAW1nIH2IRv/SDtxIBpc5/wAVwcPI5Lfuq0bRi1855g0al
         QccQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwvwuILS3Ce1SxcFOl8rZCeVRkZjv9/SwDYweAbV3FoKtwwcO4vGstLO0WteqMMGeqwdw+hRfrsUsD@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9YInsTtOLxIbOzvVlLV4XWKDwCszzaZsYZAyEc/ElEYcQ3BJ
	OFrYrn7vWyogjbR2LqTmiHX11DIZJqUIvbLAVwGLfcSBKiSn3PTp7xbUGipeqjktsv2gK0cUHdj
	MZx/UNUxAEVh+xpWuZ1INI384uwhe5nS34W6OK8JPyfx8pjEv9+5JnfiS3bD8SGY8
X-Gm-Gg: AR+sD10ZpvWUVFyXC2NicWiuiLkDcxoQHqoRPAA8HlxMRnWd5zY1zGvKUevxBCxSRvR
	18UM8w8XrUQB9WnyK45blVK/hIJXPZSaKzqzoelLv9PHkgmAYfRPjma6czDG8QOhD72wVXHWYnw
	RlyM8JMOhGYrbtcOnNYaVIDKq+EmhjAfse0ZD01QKbUEiH8kGAOFFxgR7E40MmVNUBNVBfHfkJk
	fdbyjKYMQ2W/5FUQglcz2Lomagh+Fs9mTeqV7dVdQFHOxu/386H00YhkamZlC4arRyN0u4TyT75
	/OFfugiA0PTncjGdOyaMdtaiSqGZ47UTW1uve1PlKTadRNJvWo1XcZKz2wDZs+MPRjMWK5qtOLF
	v7UEqPVLDoD7CarQ/wrZUu+6DX1KyQQ==
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr74094285ad.46.1785162241725;
        Mon, 27 Jul 2026 07:24:01 -0700 (PDT)
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr74093995ad.46.1785162241287;
        Mon, 27 Jul 2026 07:24:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:24:00 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:25 +0530
Subject: [PATCH v6 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-b4-qmi-tmd-v6-8-973cd3a226af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=4945;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8vbyF0r7KBo2gx9OMsxuen36V3/WCj3YTuhFogK4cCc=;
 b=FmZwKD8hmFpFZrioiPTaCE8/fxmpG19yUvJEvODGmNb0YYNoT2s6sqcAM+dxpYZIUZWLaUbb8
 XO6gxdw2gRJBi3XLlbJyD5s/VsleNrq4wwt9ANKeVjI1FDvu5vDkETS
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676a02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXyWzncQmrvJBF
 auUSiHsAWP1LGPHo1JGwQfnqxRSPdERXFrnLuhq7Coxj6j3DWnbQTMcH4V/6oMY1Mi7zRHYgbLe
 qtEmEzVs0X6Gx2afrRUhaExZjP0QOJQ=
X-Proofpoint-ORIG-GUID: pv89-mOE6mvUY4wKeb4w0s5q7gYbrBqb
X-Proofpoint-GUID: pv89-mOE6mvUY4wKeb4w0s5q7gYbrBqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX/NdB55TcT84d
 k4oeheknWkFdWT9/TPDItDgnPLQYnpzT5nDhNSl/uAcTIM72aRpZmA3xzBwVybtzsIQxAS5iFx2
 qzepfBcn/em60BZAg7FSPqYvnpVTR8Z7p4I/ekGPaSt5eSr8TgghTNmYTu0A1XCvqbRqzdWgceh
 hLbmAgn9jzCwduKQAOITOMcNQ5Ektp+l3DgxK8tKKX31oNwfifU4xZhg4EBSVQbPwQOKMF1FO9l
 GCEmsbT20zi1q8yS82x56uuWAXgHDOwD71A3B9Umh/rv6ytotsSEYEhUdGUxrlVGShPzcx9CmBz
 Jgnr9KceFIPlOsOOE+0O4GL3iXBqzea32t/u6nq1HvN+XMftmmJnumGs+VrJTM9bXAUEstT0uQc
 05KfJC5kOFKxv9N1U+vkQtKBq3UEaiG4AwsalG1SEoxcr07H5FdD1myXq/Fy83N4ylcHfB6BB9w
 U0RYcq4N/PZ1Y5eJiTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..3f388c000fbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -7738,6 +7739,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8170,39 +8173,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8290,39 +8341,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

