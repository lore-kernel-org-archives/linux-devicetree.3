Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC54FD792
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675336; cv=none; b=po0FUcurbGJXlQG36hvvClu+TdN/3cIFGtgWzn1f36MYM7+Aa1oVFeHWn2sVPE0wzIxRtPQHiLnRymj7TT5OAFHc9St3UsXTBdDiVsP3hby1tyBhKMFIE+ziSJPJAKNYx7IEPgvaKwEzYkWQNWbHKkIAHUpg1VKZQKqz8b8xYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675336; c=relaxed/simple;
	bh=AfHO8BmKa55rMJwC9Z6OIJCGOHxcreSI1r4oQXYYJlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0rGbZuz0gKnpN64+U2H2aRjdNHU5P41fqr++spgAAMx16s/CynnPNehfyQZ547VwX0TtzOP/qhYeq45zxFqRXd2nw6LaPworRB6JFA22S+ZxfkLBs4Qs/Pf0qTWUqWkFc2XG4cOdcJEA5ueqfUZk+AkJ3dpXfgVVQVtHhKmnuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0pd/Ev0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARrJLWJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0pd/Ev0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARrJLWJf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tndd3435103
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=; b=A0pd/Ev0L3SBo6aA
	F6xqd5F0m2zXrAMhehv88KPNhuv2d21TxbnhgTUBVyqtTG61cZN8sI91pPExbVOl
	0J0zfLk/tJkPA9fjVkcK+6D9zVumZQuU+xR7JcuB3oy0RXjRcxxXoBXp/mYhYE37
	tI2btw+vHN/ziST7ZD6ZeXuvrJqSzuh6c+TsheucFHVfskjcdZA1wblofjF0eNmo
	bix9iVfi75WT9/e2PnHKu36oOtloHYD3njtIAUepVIWa9upKqAigJczhPEAFO2jK
	HPv1TJhTKpsf5AI1/LvrU6wTghDoHQuk5HJzw0ipeF/Kzmx5Vw3FnA0rT+AupMfP
	KzXaJQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbbyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34318e88ba2so2658671eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675330; x=1791280130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=;
        b=ARrJLWJfQkxn4s+d4/WA1WX90eON0hz7qyxupBlfaJOn/UA6f5Nxijv8YdmUO/TQzL
         pWF4qa9gBDV56AKXzXOyDEz6+I6FFefQ1IHqM6lTtFFnygLfjgUBfrmVv/FKS1RzGx3n
         vFZXRTVod/dL7klN7M35y9+NBXHLikb9K5SUQy3DiftgA0w6KNxC4dEBbI8B+DYZVH3J
         brXEr2OF39nDymKtd58fvpHqc+uIn0cK0D/Q5NZdSnbU1aK52pJmIqrBsjuckGBzdBAs
         zFYBy26UzspXzQp0artaiJuVaRrgzFfAjoQRWn8ZlinrT42Eb5h8G9OrSsEnrYnJOEPa
         /mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675330; x=1791280130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJ0/Tt/kuxDEq0whlqJss+EhIMv/omiTAfRt3e6XHWs=;
        b=kHX3yC5CY7/RmUfIyNgqveEq8CXSNQFuq3mvbEWHjya7bfkN+B9QED146po730k+iZ
         B2PFu2HOnjmWmddmROP/KGeS8+vgRpBb5YqJUZARYbKwvBPbtFDx8Uv8U9bA/bWdLDNi
         kGKa7WxBoA1AZq3fe4KmYfQWPVviVpFDdXgafsJNbZyo8SEwvmqG33daVzEBqET4FA9X
         XZ5eoiaASjHu/wwLNDMRbQkfuGtAzQi/eHB3gqib59Kw2AN/tjgHbACzkDAJcrTbLaoj
         dWtZiu1eZEdA7uF7JYB3MUk6KPwubg91SmEHCR/4VVTxoKZmjdEeQ2olnEiVBXYyLXcu
         2NzA==
X-Forwarded-Encrypted: i=1; AKwUvBzgOAjB55hWkEw63kjHMagNkaanrzs7IANMLuXEMAjmuJgauqGc6PwcWb4UpqrVkaA58EeNrZeP0e6Q@vger.kernel.org
X-Gm-Message-State: AFuF++mMzqgR48MW6e8DMbWW05F7RntLsEy6YP2Kh1Zq0y+TTRRykuxY
	jyVI9lUQvT309eZ04E/kqMxICyWKoSVfl3yjK55qe8HrvUTaY29beZII1KZ9vhzJJxOm+i3Pww3
	Y8LclZbiNmxIFbWkmGbionndk2BcferYHGDjZSL41WE7XHzxe1MtWWdLtxXv3XmeO
X-Gm-Gg: AYBFou0ZH7HIV7Kfw3CTvyh1A/FFDwRqW/N44WMAyceDEeJNpNGY3kRSi6WdBebtAeT
	HPmTsEWjZhpVow/ytKdo0PlOwklzuTdb2Be25AqCI7SN2BoVgPyWpR7ATwTEnR23mm6hSRmRXAu
	1XrT/0hJd+zg67p3PVmc++jfxpnMcW2JwDmkoMAvd8Ct8vcwGkPDZPIAHjuO73A9aD+YzrZKv7v
	1aJ2PMAd2Y1aJTXj2wAAXK9ZJ9e468QLSHOqFBONUx51Py+qzRYIiFB/reFMmV+acWyp6/Fotan
	/JdxoL6rn7z+B4Op9Ml6nIwkPRjWIiuhwNSkvl3A3ePpT3u2h/xcDdAuK41sps/fYlEHMTfCbPZ
	RgXFPVXmzp3xAZM6UDvL9QJNZgffZZSXv4AQ+cV9FNxSDV+YmNWH3QIs+xVYeh0FSIjun30AoYK
	Li/zTpzZiyZDHEE6gyokvltgI=
X-Received: by 2002:a05:7022:f50c:b0:14b:588b:c80f with SMTP id a92af1059eb24-14b588bcbdamr2279018c88.10.1790675330130;
        Tue, 29 Sep 2026 02:48:50 -0700 (PDT)
X-Received: by 2002:a05:7022:f50c:b0:14b:588b:c80f with SMTP id a92af1059eb24-14b588bcbdamr2278972c88.10.1790675329466;
        Tue, 29 Sep 2026 02:48:49 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:48 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:07 +0530
Subject: [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=12716;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=AfHO8BmKa55rMJwC9Z6OIJCGOHxcreSI1r4oQXYYJlg=;
 b=OqDzP8VEwoDOXei9+ajzF5PoPQ9stRbrtHyru15+6RAFOdyPSpbZS1/l3gom22avDBB6Ivfmf
 8cXmsjqcPFYByYyOiQxb0twWH0WLJzUmM6fkyxCDu9nS3T1hc3vBsTY
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: jgzS-O7Yj5FVWzORipG_DVEypnworhCy
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb8983 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=9-UI-1Rtod8VBy9dXc4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX5EaiYc+ngpAh
 IcVXDj05Pit+QKZvtM3UeW6lqBQVADIktyaCeAaYR741+mvJX0Eaq+twac6Xphm1QmvuME+ELN9
 e/JVq1UP5+AhHE0eP5wwr8d9gBc7PzH6p+7P3/Yu/wIrHfnHEdyZi9YIT6W52EDJ0avvgsTvf3O
 t93rQdNeBnXg72+hS2e6nsjw405zq3UVtk3VnlfdEuHfpRmhJFtl4x3UCnZ6tUOYL/4Rqz8PJIu
 TyQABLTbFu1GGlpKAeq7B9mOmttXgTE8rLuVg+JmpDxdSLhffFC83lV9DxwghokSc/BN3KZJlxP
 UCzK59/7S+0T60HZ8KervVgG/U6+gkJ6wbyZoayA10nNlkKG79n/ZuEhNfbT96f1hV3POo+ZhTI
 4KP2AGt+shh3fxi3g3r7HvvGFrR0JIkXDuv8kYmxQggD9OmAIZbigpVoqcLouTe7j1iOh8s5XpI
 2DEWTEstqTUnXA1UXww==
X-Proofpoint-GUID: jgzS-O7Yj5FVWzORipG_DVEypnworhCy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfXxHrtf8mq+qwY
 0uWeazqPkZBqKPwnYO6Wuoh2zSEbjQK4y6BuCcTqoybze4bxTAFFkoI6mW6VX8smLQfemeBY9ks
 fD5lneh4CBSZGcJVgb/xA5CBz6feoVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290038

Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
(qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.

Peripherals included in this initial set:
  - Single Cortex-A7 CPU with PSCI idle states
  - RPMh RSC with clock controller, power domains, and BCM voter
  - GCC (Global Clock Controller)
  - TLMM pin controller (110 GPIOs)
  - Interconnect (aggre-noc, cnoc-main)
  - GENI UART console (QUP SE3)
  - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/Makefile          |   1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 444 +++++++++++++++++++++++++++++++
 3 files changed, 470 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 026d5b682b2b..7327a7b8180e 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-kuno-idp.dtb \
 	qcom-msm8226-microsoft-dempsey.dtb \
 	qcom-msm8226-microsoft-makepeace.dtb \
 	qcom-msm8226-microsoft-moneypenny.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
new file mode 100644
index 000000000000..c2f6650d3fe6
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "qcom-kuno.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kuno IDP";
+	compatible = "qcom,kuno-idp", "qcom,kuno";
+
+	aliases {
+		serial0 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
new file mode 100644
index 000000000000..9b111525e12b
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,kuno-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&little_cpu_sleep_0>,
+					  <&little_cpu_sleep_1>;
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-pc";
+				entry-latency-us = <350>;
+				exit-latency-us = <450>;
+				min-residency-us = <1774>;
+				arm,psci-suspend-param = <0x40000003>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "pc";
+				entry-latency-us = <550>;
+				exit-latency-us = <750>;
+				min-residency-us = <6700>;
+				arm,psci-suspend-param = <0x40000004>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cx-min";
+				entry-latency-us = <750>;
+				exit-latency-us = <2350>;
+				min-residency-us = <9144>;
+				arm,psci-suspend-param = <0x40000008>;
+			};
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-kuno", "qcom,scm";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		/* Bootloader will fill base and size */
+		reg = <0x0 0x0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		quickboot@82100000 {
+			reg = <0x82100000 0x100000>;
+			no-map;
+		};
+
+		aop-image@82200000 {
+			reg = <0x82200000 0x20000>;
+			no-map;
+		};
+
+		aop-cmd-db@82220000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x82220000 0x20000>;
+			no-map;
+		};
+
+		aop-config@82240000 {
+			reg = <0x82240000 0x20000>;
+			no-map;
+		};
+
+		uefi-log@82260000 {
+			reg = <0x82260000 0x10000>;
+			no-map;
+		};
+
+		ipa-fw@82270000 {
+			reg = <0x82270000 0x10000>;
+			no-map;
+		};
+
+		smem@82280000 {
+			compatible = "qcom,smem";
+			reg = <0x82280000 0xc0000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		tme-crashdump@82340000 {
+			reg = <0x82340000 0x40000>;
+			no-map;
+		};
+
+		tme-log@82380000 {
+			reg = <0x82380000 0x4000>;
+			no-map;
+		};
+
+		access-control-db@82384000 {
+			reg = <0x82384000 0x40000>;
+			no-map;
+		};
+
+		secdata@823c4000 {
+			reg = <0x823c4000 0x1000>;
+			no-map;
+		};
+
+		modem-efs@823c5000 {
+			reg = <0x823c5000 0x10000>;
+			no-map;
+		};
+
+		cpucp-fw@82400000 {
+			reg = <0x82400000 0x80000>;
+			no-map;
+		};
+
+		xbl-dt-log@824c0000 {
+			reg = <0x824c0000 0x20000>;
+			no-map;
+		};
+
+		qtee@82500000 {
+			reg = <0x82500000 0x180000>;
+			no-map;
+		};
+
+		trusted-apps@82680000 {
+			reg = <0x82680000 0x600000>;
+			no-map;
+		};
+
+		mpss-audio@82e00000 {
+			reg = <0x82e00000 0x5a00000>;
+			no-map;
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gcc: clock-controller@80000 {
+			compatible = "qcom,kuno-gcc";
+			reg = <0x00080000 0x1f4200>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qup0: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x009c0000 0x2000>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0098c000 0x4000>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&uart_console_active>;
+				pinctrl-1 = <&uart_console_sleep>;
+				pinctrl-names = "default", "sleep";
+
+				status = "disabled";
+			};
+		};
+
+		cnoc_main: interconnect@1580000 {
+			compatible = "qcom,kuno-cnoc-main";
+			reg = <0x01580000 0x19200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre_noc: interconnect@1640000 {
+			compatible = "qcom,kuno-aggre-noc";
+			reg = <0x01640000 0x33400>;
+			clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01f40000 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,kuno-pdc", "qcom,pdc";
+			reg = <0x0b220000 0x10000>;
+			qcom,pdc-ranges = <1 148 6>,
+					  <9 156 2>,
+					  <17 164 7>,
+					  <26 173 1>,
+					  <29 176 1>,
+					  <40 187 1>,
+					  <46 193 6>,
+					  <52 266 32>,
+					  <84 249 1>,
+					  <85 256 1>,
+					  <86 315 4>,
+					  <90 43 1>,
+					  <91 45 1>,
+					  <92 154 2>,
+					  <94 158 6>,
+					  <100 171 2>,
+					  <102 174 1>,
+					  <103 23 7>,
+					  <110 147 1>,
+					  <111 31 4>,
+					  <115 175 1>,
+					  <116 177 10>,
+					  <126 188 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		restart@c264000 {
+			compatible = "qcom,pshold";
+			reg = <0x0c264000 0x1000>;
+		};
+
+		tlmm: pinctrl@f000000 {
+			compatible = "qcom,kuno-tlmm";
+			reg = <0x0f000000 0x400000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 110>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
+
+			uart_console_active: uart-console-active-state {
+				pins = "gpio8", "gpio9";
+				function = "qup0_se3_mira";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			uart_console_sleep: uart-console-sleep-state {
+				pins = "gpio8", "gpio9";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+
+		intc: interrupt-controller@17000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x17000000 0x1000>,
+			      <0x17002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		timer@17020000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x17020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			frame@17021000 {
+				reg = <0x17021000 0x1000>,
+				      <0x17022000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		apps_rsc: rsc@17040000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x17040000 0x10000>,
+			      <0x17050000 0x10000>,
+			      <0x17060000 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     /* drv-1: placeholder (unused) */
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>,
+					  <SLEEP_TCS 3>,
+					  <WAKE_TCS 3>,
+					  <CONTROL_TCS 1>;
+			power-domains = <&cluster_pd>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,kuno-rpmh-clk";
+				clocks = <&xo_board>;
+				clock-names = "xo";
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,kuno-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

-- 
2.43.0

