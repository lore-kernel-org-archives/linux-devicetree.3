Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E541F7EA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494130; cv=none; b=uxRH+vAYCNEbJqpj0QvaibshOpRMyqI9qaeUFsOE7QO20LrNBfHp1vdyKdmmkJ297L0GFLXIbGTE7oUD2lp3XrI2O++AYp84Zcem3L8Uk9lWFsockL1VjuaeWELeqRHzan6Bk/lFkjCkTxgvjsuIgyLZGiakNAYb6YQBVMXwEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494130; c=relaxed/simple;
	bh=A/ZlkhpKXOXspcZO+2h9v+w/LUVpdAPN+/yLddIsV6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBLheqoQCKqejp5OfTzLDWxxUiU5xVEeYNUzjBiT62UedAr3XUFmMe+NCXGRD2D7pQcPBbsgpOlnvfd/LuIg5RTI9e1gm+xJweu31GoXhU0RspAQUSKOcZiuNh3USwF73+lyd1uSNvZDzkfgABv28SfBf7ivqiZgiqJXvgCUdnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6VOScih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoF6vrnG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6VOScih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoF6vrnG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC1243559990
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=; b=Y6VOScih8JgGFT3U
	l1dM7GGDI8GX8US58P0lTVwALcjVnvbLZfSh0z60UAbV8XnQ3tK2zkjE4UXWifBL
	DnAKN5XW/JL/hcQkF9iw0PYxLmOTvEImEiKTNzqZ6WYzwWnWQLXayDDxNtDxelX5
	BnbaVgCXh6cppDnM2w+bJoqp35sj2OzZ47OG9Ul4q1vdaUZTOyDn9XXaqNeqdzfG
	HHjqIOVhJX+ZNw7W0c77NmEJL8fBfIWJkN7FKnpJ6OysNLLyRgbjWWBbs7PGpyS4
	L8wVBBfXVNakyYqSkMcneQrxkQwaXRQzAWRFDeItiHMHjHluIw+/CnppFY9CKcyE
	0B2QeQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frse4050f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:35:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so677314a12.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494115; x=1786098915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=;
        b=ZoF6vrnG2N9pBTTgn5e0ojn8mFbsQgBuqHT7l2OePHdWYH+zI7BL06XrFq7ZO18q4H
         xIFVOD/IC+ixd4xw7cVDdaQDqbYksPVfzeKOb4GCUlPVtk5xKSWvMRDjZk5Fcg6L0KT/
         1yHvwLj7YAJlc0nGUDjQfILhG+BOjDTZS2vJswbyQ+MEJ4ODgva6xrIfRmTZVGF4KR4U
         mQK3xZbD+nFcGvzLsX23HVsZvpSU5kn1QUk4tBhrdDexigX/Df6nkolNjHn3g3l5bnej
         0pV1m/Tyug63/THPY507fkdvy3IymLpuF3RFJ/qXr0fAiz+uhloaMkC+pOQz3Yy6PxOJ
         VsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494115; x=1786098915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STAmXKRhhM1PNoYloH77abYDI2FiolvS4IlxwlZE50k=;
        b=AWA28k7VfCZw1qoXIS98TnCCBdt2uGiE1Hxy2Cf4DmIMgFdVX0HnAx3Je4Ry8ZAcRj
         2FWKTVP1CkFbwOjEXUVE7HySQ7OcRJ5AudxB7n3L67CfbcUqrkDM+u/gX7MJNVYDbzQy
         wbS4eEsCf0URcJiAwvViMcILaWgbbMJ5Gn9MNH0aoT7X8jeajFFVdipSfGyhccFA0Xau
         KJel8hSdn6eYvFVdH4kXxeY4V3bdbqev3/Q0RiJxOhlWzhQKioF/TMeubcHwlwkH7/NN
         qJIHhnJNs79+e/W5m5tkwk6DJIUl8vTuP6U6dFNjLwt0FCc3ybuzBCMn8E0V3++7h3Xu
         cbrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHh+eQhkC3m2MuTvWSGfltyJZODeq0fDfqi4LESriNAzQX3mbu0PSG/kISHDm4lkHR6D+hGdNpmr7r@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGQDaDrpnpbhgC8EKp58XQsbb9QhMJSX3OLYi3j3/nkaAXJHL
	kuowKsDaNbEPMnu1G+sT0Uep04L8fxz9MITzpgudxDfCclUa4v5wyoSKFKOOcAakZIZ6CWuPnzv
	acQDneVbWS+GbeEXAwLN4JaAeUAqwZMSEu1EuWkywUI/NNHYmsDUckxIJoEiM84XE
X-Gm-Gg: AR+sD12LEs45H0tA/QEe4ZYsBPG2fbCQPEP5SKRurr9RlcKMvpxvjIrfPfkkfD7YjVk
	GpAwQbzhA50RntOA0UEaqmVXtKZqQRdPt7+eiupM/T5a+9vxSWmDbBG6HRycRpdMiBdUpEwAkyG
	6+etsQ7XdBgRstk4F+xItUgf7WlOZcpD4UqC5EkNDuGIY9QZUCGsJsucbWBII/tuWoKJ0wV3Z1z
	xyxNWIHxysPiza5crK4T26Q9T9i+2Y63slJyp66XZQLnilPFMmzEQ7iGAqMUnnS9i7RGTYzl6r8
	sVOWDIcHmsNJorEzXsXFQDC+67CtAqZ50yNFBkSDVwEyPaXB5N43NXw1oeFubs1xHc0v238fenE
	aVZ60kY8xhIyz0tlahUDR67dScQ7Gyw==
X-Received: by 2002:a05:6a21:398b:b0:3c4:147e:98f1 with SMTP id adf61e73a8af0-3c91b1b787amr1394351637.31.1785494114856;
        Fri, 31 Jul 2026 03:35:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:398b:b0:3c4:147e:98f1 with SMTP id adf61e73a8af0-3c91b1b787amr1394328637.31.1785494114451;
        Fri, 31 Jul 2026 03:35:14 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:35:14 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:03:48 +0530
Subject: [PATCH v7 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-b4-qmi-tmd-v7-8-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
In-Reply-To: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=4988;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=A/ZlkhpKXOXspcZO+2h9v+w/LUVpdAPN+/yLddIsV6A=;
 b=+5o2HRYkHVQPeDVqOC1L2PCMgamDI+SCXDu+VNafphfciyjIg1zWSRatSJTQF/2umIlVQNWrN
 DLdpDkFNhRaDjU17czVHOh+0byHIoQhmTVgsD2P3an4UsV2YmJYadjY
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=HslG3UTS c=1 sm=1 tr=0 ts=6a6c7a63 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: KqSqkp6NulzYsWKK_upa5aWq2KXpCb-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX/J/Td792zcTr
 /cHy45Tq98Han/kpHMbZ277qAzlgLc929k8hXRx5hn6MBZCbqN8S9Ce6K07w+XMSx1XMA1pyr0y
 t1JcW98COdOksVvn6W32dBLA2OKctrkk4jzqN9gXNF6kYul9Go7M3u9B9bxVqgl0lnBmHxX+NkZ
 l0x1nsVbK/zLqB37lfP505BDc4gG/tg/MAeMHJ4x6JWqjkWHu7JFMDTIWmM1/Hb2g5+Pks8yqyc
 53TkPOA5imgVUWuL6dA+D6oMkcVj8V6vU2wgMq1PzqqKwpwcfbt6bT5GwUrH8lwwW/PW26HnYrE
 ERZXnjal9encjYgLO5z6lVTxioJ1yPIEw+9/F+LKMDo3JRjfcZP3/0VNkfHIhG22pUm/oqUyax0
 tgHDIXXJAxAv8AzgI6KjcI0yChDfhDvfRw2UDbBRFHyaTDmUgRvAZk4N0Fl6QsYlPkyfBCm33wt
 2mfmpv2NtFIbsggsw5Q==
X-Proofpoint-GUID: KqSqkp6NulzYsWKK_upa5aWq2KXpCb-g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfXzG6xBc6TsrT8
 5u5/Fn4MRhjk+qN312BP2VhiRNsq9gR3AJ2MITq0qcQFMC51uxbpNS5+XVrvt011Krqt3uiuFuc
 ehADGOS4MLlTcw8hvRrTjfHyFvTg7Mg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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

