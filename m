Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7492538F239
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318569; cv=none; b=GYAyS0kdGijtLZyilAtCEw/rvS+z9SMZ1TcTv8MJI0zUWt4CyRf4lydRVjqkRYp9YmzoN9sWax1sqesakD2y6rmMejE3Fb5ryBFnLI06Tymt1EGjkEHvxAvzl1R5sbXoj729ZbbBATLViG6N1DdO1N8YG7Wt380sLaQZuk4Q/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318569; c=relaxed/simple;
	bh=8CNewaz6ysb0yOj7npMCemP+QV12Ecsvd1busAKDrHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5gmEWBDnRpRvfHrJC1bvycbr5JALv7aQGw4u6YkDLWTdfpvv3X5n+bhsgNwTo+B+hV1Ei1AmjW2kwHEvYI1e7x6+pO/qBjUQRskhoQ+0FK2cDmhdJesif5v2HFQkxn755WLkt0+qoBu7/pmqyLdDSoI/78pxPO3nAnA1H1xEzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJpeFKnB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We0xOMZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJpeFKnB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We0xOMZG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBeLD3129399
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljg6QncM4kslF0r8lBAtPXwQOgZ/kk4lr+BM+tIVpFo=; b=dJpeFKnB4GTvomm3
	8SvGshjhKVqsQG8EQvsqrEtBqqiBCl4P5r5Aomv/JHRkBAxpIf4p680aS3gBYU4b
	G1MR4/YLHjK+4vS117/2H+qnDXLJvhEWTDJgFzxNoVJawkK/w1nNW3Fjn8toYnPs
	2oiSEiBw1lGUHKyYjZree6v5hZa05cYxD3Rq/dIq6Rilg4UfFOOJjJDJPwcHQpLC
	7UNFm3lh6kS3wGDMby45XbVs8zjWVxxnJGwmdOLYBDXMfU1a9Vu5ez+42+pHR+mO
	JcWYZFMKVAy1DD8q4DWJ0rbfP9JYNUQJJFksP0TOxpZUK0ViUI3/E/kp6ajPKfP/
	bogeBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9010cwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:56:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf004bf8beso55188595ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318566; x=1780923366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljg6QncM4kslF0r8lBAtPXwQOgZ/kk4lr+BM+tIVpFo=;
        b=We0xOMZGoKHwi/RLC5iNSx9OSIX8HL+njJGS0zLKuIvhbW58JmwFCORW6zORxUXkZX
         PDLpPT9ZPmbwvPv9iRLjKbkBIOQMEJbcumubcdI4k1Be0TipEsLNBfUYKS9mNrDxwNMu
         X4HKAMTA+eA8T9S3RfJAWODepyr5AauaJxFpqvii+pHoli1WDizb4yiku1E4wDYg+pMc
         14vkRVMPkltqjgWvQv83bpDmzTbsvJB6BPsSG+YmEoG//FBfaQop+pSjq0zxxROu2KyV
         BRJvzTC5Cs8FG1Jt3c00fi+7xsY5CvbBcsA98Q5+VYuJd6mVYO5Er5pFlwX6Texv6cNI
         d9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318566; x=1780923366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ljg6QncM4kslF0r8lBAtPXwQOgZ/kk4lr+BM+tIVpFo=;
        b=lUMthzRT+1Fix8HSW+ZeTd8WcJYJwoxoCIQ3vcQ90OPuo35tRfi6pyKFlEaeLnzmFu
         XKLgVYxbhN+hD8v8jwjjei0czxwDHEEYrDhzS8QfC9WxLEOJ2CAZKRPfd8sRJPiNK8nz
         uYC6XtLqsAmQ/fsIdiK+O9ehWm7ksdHWuFMhAsihh/ZtvTImMeorKRdsBdn48JfyHFWS
         iLnCiJC9vlfrAPChMnG3GFDGX7emF44BDsHxVuiOoBV+S5UYL7bCRRs6mjcKxpWVatIm
         D2dRJ9HN6CNr47cM3OBjWeNsxFJFn1E2RpLXJI+kVsvw2LFfG/7lBahKpk05qLNMjL5V
         HK7A==
X-Forwarded-Encrypted: i=1; AFNElJ9m6Nzpzv6OpJNcfn8F4hDLFYMGR019u00Wsqc9Sx6QRQs7MKyr341kfnFYMk6WDMfHSXRtb7buUPfc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbto8p9FZlHGs+Xj1KC6Y+Lu6NEnOif5zh4D+WkJ7hCmZ2ceXa
	yCkXSVu55MssTxMvvB5MdXp1QSgT5IxR2T9CAA/TuphNJTBAD0kxV+kEFtWYeo3VB55YFMN8UyO
	cB3kXH0F9xH3xP58j5jq7x5pHWcXsrPXRukPXbja5mFXNvS2X0FLygWuFT62XyHxKpzz1AsuR
X-Gm-Gg: Acq92OEL3mUERk28j6tzvFdUVYdBk0z2nN6hKQfx+R8wrrmQH5C5c1giYg7IcMkTDW5
	96u6cmrdCMoISG08yiEwB7vZgFPMB+ZE2AIyHwlX3ILGDe39POBpeJvtRhlbigzJ1QOTCaYTVzQ
	VfSSYlGW6kRdyHdcQoyagfddQX+qW/9VrADwnSgjcdcAuG9p59AGMgxikL5Yjclg83VkM60D/l3
	vHzBy837qawB4rP73YVoMdo/HCoBc/l2nI+tZYzraO/hyQ8ZJ3AA0ZMb1yXjj7gUrwQPYtDJrtx
	d+qvFSIuQ5k0gbHcCUTkWIoMksB0TEA1Xf/VF3WSnBtu8JqLAokU1k3307F2Fxzmb05MVJ3+juY
	Zolxw4fPVmdtH7tFEVKUoFAuRXo2AQLMg3jo+0jJPysUuARg=
X-Received: by 2002:a17:903:1905:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2bf36803dccmr130195525ad.24.1780318566197;
        Mon, 01 Jun 2026 05:56:06 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2bf36803dccmr130194895ad.24.1780318565635;
        Mon, 01 Jun 2026 05:56:05 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:56:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:11 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-shikra-dt-m1-v3-9-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=6253;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ygYH80VGTldZTm+qIdOLxhatW9DjYu2Ft5s94EWNAAk=;
 b=ILR63sSazSBm6gk4qW0Jxbl+jidOAVc+MJEHK4/v0zJY2ow7dqG8vVhMkQdQgibps4FAoa6Pd
 8b9yrbjcDrXClg0nsX6VB2Kg8XcO6JXe3dPD765ZgstJobiJJwpl69o
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d8167 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RA8m1HTphegElRrk3pgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XqbDlFdI64SdBrebK1BC3dLDrpHY158D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX01GkvWrn2eGu
 TggSrvF+I1dz7KWkq32Tt++rvJie/p+CkSD0flwU4bKWl7AaGeuEiRb4QA2Y0REltS/K8/0YMqG
 2oxyg7C0dAVH5F0kullnbldaxrs+XexiavLo9StvtEaEWMn2FF9ML7Zg1jxrA4ZLb60ljW26kks
 6ezR9RXAUHFphzqhPwMoiD/MtXi55Fhc6hXEUz1CEAtFr4Z54KlGxvQGP7HI6D/OMimGZjuC0m3
 1BbpW1FDbtYo7LV75d32/Yx4e3ms10jHr4i/bDbYjRiTdKhfV+P6LbtRs03C+mbwbMD0c8V27/f
 I4WwBodNmHqRe5wPtDwv52NIIx6m7lcQaUdp+sFSlcqvDZ4earcz+orzzyQ5sqnuQOpykBX15PH
 2z9+1aWOHUySSioy63/Nu2rhJQxUReRotkS3pYSYoCmwTBGgj5v3HyxM+PEUMxLVI7+oXvdtGZo
 6EJqR31uIndqTV8/aBg==
X-Proofpoint-GUID: XqbDlFdI64SdBrebK1BC3dLDrpHY158D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 445dd8bb7269..c1f25ce89bb1 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -983,6 +984,18 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,shikra-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <14>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -2180,6 +2193,260 @@ cpufreq_hw: cpufreq@fd91000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu00-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu01-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu10-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu11-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsp-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu02-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1

