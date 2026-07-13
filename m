Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD2356762
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971479; cv=none; b=d+COiQGqPrzfIVfpGRxnb0iRw6nJF3sAKPZ88BbaMS2zLzQfT0C0pUec2ijuU5oFvAi397hLguI9En0Y8wUXzvcF78k0scejifyDHJ/qg6AGq/AFFAtnb+09HLdXlPpc3X3Dbeli5TvQCc6yfpeHBWCZxMutasCV7Zn/wlkgv7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971479; c=relaxed/simple;
	bh=DTChb5IJt941YLuPwOvT9s6H6kmZ9UZ3rgh//PZhp6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceEQn/pZ5zqY7JC1XR+QetHgc+lh6IIGj5cYfkAxs0zt4K+wLSROqzmWhvEFvz/1OBne+auOHCx53g6hl5JonPUPCd54xYS9i6dIPVRP2W2lNBGipznCCHmsSmPh9/9iI9UeiIoR7EYtvLhGlVd5C31CdBm3/cts4WKnw4QabPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9GhMNYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgyZeLST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9GhMNYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgyZeLST"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ97Gr2275375
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=; b=J9GhMNYYrGE0YkNz
	BaN6bWrZXr5tXZk0PZCX7/L2tz9O4n80QVpLnlPd5RlvBQXxv/FQZNflp1YtlMqb
	4/TtrsIEGv2x90eLwZij2awutwO/TGnZQhci++VSxuLJK+CEeCn2v9XjXjeSNBGU
	QxKTTG8D584psFrpKmp8U9gl1lPqtUSlNUyhTrHn58eN4PQfBKSwJjxnR8y+g9Fi
	EbzZs9fdmxXQICsyqPFBsykRU0GC3TBznvKLI9ra3wiripM5TFbkZhUjibKTBuF4
	rkz+YerrmHU0EZc680rOZCNCaYOZ+JOWSBjt3IBg27sPIlg+ilE4r9aR74MKx596
	Kppc4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p0hp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so371701a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971476; x=1784576276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=UgyZeLSTJHIewfsuwAKLCfhjQ7YS7xtuMy1o1jBqdaf7WkdZZcX49ybGG46b9/wvNK
         hb3Z7cPODexOw1OdloRmgFsLnUUvvP6g2MFD3uQcl40qCSsHAT0hjWxQNRiUritOiLh4
         OsLyamkDuWiznfzpXW1ZI3FYdEJsQ6W8mbLS5YU2B/q1iUtiwL3uHuyIMNGuEAUr/92b
         o7qylcSjVBN1fofpST2eb/Rm9JWiAvon5lTsEwlMRzPJg12vENp31TH/WilLoCKF8y4J
         KCuxKnZ0l/LEm3apiIXpGx+Xek+XETAhIB1ZLrTOki4ftCDCPWFFGUi0CqRaayvWDRzR
         v23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971476; x=1784576276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=T3IpKRpsq2IIoIDXNfI9qmWvCQAE1mVyeg62w/5sYeEhDGzmCNh92OH9B6Oo30kUJS
         Ad/UEQovcbjQKZ28aZW9s08DUU0CuZnUo0OnclBj+MQ2r/8sgPyColAzvPua9AKyhB0m
         zvcobKNm+09UUkZyJ75xe2Up3qQxIaGWE/WIpBsef8uJzGLr0aVBL9PgO43H3T6aQdFQ
         F5gIxTIUxsR4cCddC1h4MFF1NPRW6a+Kn9aAmUyQ3rsLWNkW0udNtOkDyC9HcuuMdeX1
         xyPP2xOLTZD53mT6O9DSuVrjkxH8LOzftV5nh8q1huoa2J9VenrJe6YNYfTwki8dFBH3
         CxLw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ047yvV5FcNTemTiquo4V7uePPSU44bFesdVbWosnuOk3IhEtXlZCNGChkUInl+T2SVTocot1yCF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ewTscKtwBJMRQyS3mdQemM5ImrnqU+a0vo1mllJWUgx6YdCk
	Lmmyoq9N1sJd0GCyWI4z7ETwQRhYlVsYyM5KJHZ4Js7S7M9A8IwxUYeYFUCPisCrKapOc9UfU6u
	J99C7F21OFutiTG6KRGR3YkCU7Tbn5VyuSixN5zWihHhuuYN+OcDRZhXD5qpa1U56
X-Gm-Gg: AfdE7cmmj7dxUIAEBpF1ZCDlF2XMClg/Ps2MSX2dv8HUgS/opqO5sleAc08wDswLlqg
	ZNbk7L1DUPDS2TtE232ilt07DfeZ8HsCFKMUgOg5GZPs2RO39ndmzYcko0HvHUC2TaWZF3UpFAU
	bU2lYg+Eh5h2oEwxtrUG/IkojwuRSYdVcKFyPr4nVXZdmDUvxi4bmVzx0uw4sNduuM3qd5WYA/Y
	ffo9DfeVgIN1DVGXEsz1VPW3nkUHNvEnUAU47V+l+/7KFlZ5k/G4z+fmWpPe+YL3zTKHHxm5f0j
	TtUfhSnu0uzjCPyNFHqQbFtJ42zTNXqbNa9rIU4QRgCtMJZ95nxE06DjG1NnUdrkqYrQRcKh7xq
	UYQiYpTgTd9oydRCqd8JPMITkWg==
X-Received: by 2002:a05:6a21:a8e:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3c0f0bf4341mr15371827637.34.1783971476524;
        Mon, 13 Jul 2026 12:37:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8e:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3c0f0bf4341mr15371801637.34.1783971476032;
        Mon, 13 Jul 2026 12:37:56 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:57 +0530
Subject: [PATCH v6 08/11] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-shikra-dt-m1-v6-8-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=6381;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c7IkaekY6O5VmCRVXe8bHxUYf8Y4vnUM7egoEzFTAkY=;
 b=uaIPH469DMRU5z6DvbGQIs/Ubni5ag0PqHaIXSYESzFrV04R46zUEAkGhanwkCfcAhTx9uVS2
 ykoGyO1S0HaArL8+BJGrBAgK54yOhNxocUxKJWkzzeMTu0XD9J5Hmms
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX+Qq6v6TesIWQ
 eEDP6ZUXU7WdL1Ohibrca9FlI81dPeB5G5+kDOv950WB0EKjeYMvlQ86oYBck3q6b9tcs5IjDy/
 tTFqIKs7c2rcd1jW6eIlJUqR5mXGXcQ=
X-Proofpoint-GUID: GGFYoy6uCppTkMqxMk6CptR_9orsMsOk
X-Proofpoint-ORIG-GUID: GGFYoy6uCppTkMqxMk6CptR_9orsMsOk
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a553e95 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dm7ITHKX8Gmtf3-juREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX/Lh1+kexpD1u
 Xwa54MejWz1Zy7Be+wKk7BryX0JlPn8YlUdPUTYJD4VwjFEyymSfPhlra8xV5+Alnrgt1pmQQDy
 B5MfVX9LLHrmPNvhOmkeoYx+d5H/w4eKUPM74mOLMhubyoyT3dS5KJ3JgpCQcN2DERz2R30bbEH
 rdgDxVnUiZLOIImoDvKs5PTTw71YvNQ6qgzXgpImW+uEpDgPOE3fmMe2N0w93s5nAOWsOAi1tsx
 LzUcDVzlV6m6Z6+t8Dm/R1sZA8ZbbtMt5444j5YPSmdcWPTmrW4lDZZwXdIk2+B53kxl6MG6Phd
 Tb1GRhtvc55AVGXwNq8f/FIw4x0JdCdIKSEmjInUtDjvNGQBJSwG78/T6ioPWkthbereAvPhVEB
 8jJ7Kx2xl62EEqfKffcWipMScflcdhA+SwTQfISOIk8+jofIJ9ITdhTsDQMb/hH2FmPz+Tpd39R
 K0zH+pDgHRa441QzIJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130203

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 12e4281f7b35..3abd0a686d0e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -998,6 +999,18 @@ spmi_bus: spmi@1c40000 {
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
@@ -2195,6 +2208,260 @@ cpufreq_hw: cpufreq@fd91000 {
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

