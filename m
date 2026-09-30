Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A953D3D18
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749926; cv=none; b=HvJOsDW15Rax5Rhapb7g53Bc1OWAoRxSllYEapvskIzyfe1+Fqk0235p9V4EI2FE3xTh7WKv7lLKmG1JW/8T1+hwiEhEzxOFlChInl9VWnW+j5e2P8kV0KZH8Dc1czQvWeMfguIiYjqIooYO06zv+/v/pW9yVslYSuSh+HoUmkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749926; c=relaxed/simple;
	bh=bbARdkrRuUy1baGyZrTM4q3SSSMqbiE+i9qs4b/uJ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uG6dKaXNCk+0M3G8Bc5N8rvAEZwy41X/xOmNRrC7x3ROSH+Goo8WQDnE583ninsRGnDwYZb8aaKg1mTZN/Chf8rDb5IKzKFSZZaXmVEbd2qxTGM5IpOtsi3g1eGHKhVe2BDW5M+mH1+N8lcGCGivPDuCXwYTJuPLc5qKm7+bxOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBPxUjfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aydyW3wu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBPxUjfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aydyW3wu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U5njaP2876404
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=; b=FBPxUjfwOungg+Ai
	tTTiEp+VUThgBQP/kBObXGPkhwsC+GbHr48RRUpjnAstwJGQLPILoPE/mx+S6e6A
	a4wxSdkNa5lDE/m2O2dud/TYpu7+7v/69xCyDnL9uKKHzVRDnAbx0MehwJKN/buR
	5iZ6A/adW/rPyhjxyEuIsMvoYz9v/+4yUV7NmSp7ivl2PBwW97ywgE7IRGjZeKmV
	/mW/zM9EVAhZEFA2ddeLP7fAcMlBzVtUtcXza8m+QeS8XFoIbGkSWVMJ3S8Aa2Oq
	50JmZ8w22kyT4HhHwtQadzmAw8HYGk714STjeFNZDpQFvbKVNQH9hMR/87NailQ5
	3K0qsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et2buft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:32:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2151657eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749919; x=1791354719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=aydyW3wua6YwKxhAW1GEyEoJd71IoraznwmMVw49vnWYUqVgHg8k7mIXsBToKpP9Mw
         YDHi5QE/0ykgABYVBKrdE1hmmIdET4gaqOvuj/WtbuH92E0rw3hVTAEAEOClwhf1lgib
         lsPH9gBKDx/QtG6ooDdH7xWUWuThlbeTcKJMD+V4xDnEGRuuoCoV66gcSEx9YUYmTLA3
         ovGbL8dQcF/KNccZXAxCu8/8Cz+2GRWm+oMndKSVUGKf5Lxh7dIIu2kAYDzu7Zdsk+DF
         rwNIH3/wFczyRXB1kXo1EpoT9zqhhYMSbk+T90DJFOeSTW/2LoDUhQEbE2a7Yzygb34c
         +WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749919; x=1791354719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=wY7ZGBbZ7vOzobfBP/RPO2ar82BPAdedVqOI4Q98ymDRkwgHsuq8IFUHYRSdh32UjQ
         wFWUkvGfZFGpr+nWAzqLYIeE707lkpZ9SN2m8hu96WYKCHautm+e8kIgbES055s+CHBd
         mGYZJU1xJuGBTorklIxhPI++A8byv7ygBdJ8EKGXjwawcH3fQkh36jksG81S53s/i+kE
         StQ8WrZoshAc61xlUXYEhIYQoWDpid+1erK5WvRJcYK/VoAwTFhZQBdd6Q3v4RR0euBJ
         8/70FWLMySOZmrnes0ZX/3TCXmwnx7OlBuYxmFGPlMa3kpVydm4VEXTOZDFg0aez9Vng
         4zig==
X-Forwarded-Encrypted: i=1; AKwUvBwi6jqabF0bGaTGy0ORtPtW9Gtk8jqYo39J0OR3qNc+vD+cpx40l+UdbVqDEzeARC48mFpWYceTSSaL@vger.kernel.org
X-Gm-Message-State: AFq9FYIdDfgZY91W0GDUywLEMa21xhpPYnkLRqOpKYUC9IQWkN/uar57
	NY+gJhEWfgLmIoT7pTrtxFrTeuIdxS2n2il8cAR5/EbtgAyTMH9W7ctyXcYoMNwAX8vbGKcuNw9
	yngkolzb+LDXuGIs5zwJGpFCMWHk/4ito7n+x5Tu88Ji50xWWBe4dFz0L88r9knM5
X-Gm-Gg: AYBFou21vsibJ0/I5wvSRa5PhwHpsifQUymnNZ+NhE5/LLUHLUcWYNvlH+9Tdrb87P0
	BoiKk8glEo12ZZsEo4oPhBQ2HDtLA6DfnFvqKToenU43djMK6l2MdNPDljc1BKe/rH+56jxZ8pi
	2P7+1WroLddp7qk87OInwJxVzi3rBwga2oc4mdFJzx63cbyHorH9oOZSkMPaWV3hwDWjNk+NFUV
	4pjIvgH7LevABhWdL881un1wha66bzYJKHA8dzWG4vPwUHRv4aVk/ZaWsjhqONl9rvscStcdd5o
	QK5Wv30po/i4UU3XuSzs7VMUDexp77yNstPWUegKh/4VZsKysdB4sY03q6wzdqbhXkvj2Je9qUB
	94TsAYEkcdnmr20P0k8K11I26lUVlrWoVvtCgju6Nm6NeJvUHN2g=
X-Received: by 2002:a05:7300:3e91:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-34cdb5f6424mr752992eec.13.1790749919216;
        Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
X-Received: by 2002:a05:7300:3e91:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-34cdb5f6424mr752958eec.13.1790749918483;
        Tue, 29 Sep 2026 23:31:58 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:26 -0700
Subject: [PATCH v2 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-4-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=3595;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SHZeKzvusHFNFuYOntdlEiI1S4ayexSEHJ2wrStFqY4=;
 b=oprSuHK50cSe4r2Xsl5Efs2xMwZoDochcJYP04fW1Pm5XGJ/ZJmros7EAWynzythjZvEIWThL
 XF11RJ8RbazCpEc9OTXiaa8Ypy1QFUniukAsmWNoL49jEXrlKfvi7cv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: jyLHKDi3cQBdrr05AbroqsTThdhZPTmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfXwvfuU09qccrE
 ++Qc95cLP9+PLO7/fRVGavTAdJ9OjIXiS/2BISlsEfACE2XPM1Cepz4XWdjI+s4Nvfj6rWnAuAK
 ckW2LhGp8sE6R4mVIQkTkU6MdGaMmUWkMF79kZjJL6Qm+a+Wt7p7OMhorBgba3nNC3KLuE+O8fd
 XoBgExJjyg/jrOtWCG5jdCPcCAAd09EPbj6uLqSFZ4YMAijWXkoYyIW8JvphZBoKLcWnskdIBNb
 ANDbCBqZBFOpGgnCmlM7X9vQ3QOPtsB1Y37GdG4JUVnO8oFMci31OC4hf2UHc1g/sbWgMRaYQzD
 4OlZtkhhaF1Il5DKEtHS/Q9ux7hC+rIe3XQ3wmRRC8ebZtsSiMx0EcBP/sQ6pqd5Fpke9qsbYV8
 tFWVUAKOAHm+RqCTBsGpBftODuUmxok1qczIGhJyV13ikVun29PI/BN2RjyVUYiC0Zy6kKlHIhZ
 V+oXP3v0NBWTBSlqQbg==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abcace0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4ECTE-F74UkuUx1KzIYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: jyLHKDi3cQBdrr05AbroqsTThdhZPTmG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX/iop7u2FwYIc
 ByNYqyed1OFPYbcgjVz6jT1RkvJ1RcX4ajniB2V9H0JHb4WLQufsgJRFqDTWtyDlHGDXzM4QMic
 v26oRU7Cak8wxEK8jH+tjBalpOkWUOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300025

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
to support PMG1110 usage.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmg1110.dtsi       | 57 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi | 57 +++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmg1110.dtsi b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
new file mode 100644
index 000000000000..31b05003b843
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmg1110-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmg1110_k_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmg1110_k_e1: pmic@9 {
+		compatible = "qcom,pmg1110", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmg1110_k_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmg1110_k_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmg1110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmg1110_k_e1_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
new file mode 100644
index 000000000000..2f3906ccaa73
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmh0104-c-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0104_c_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmh0104_c_e0: pmic@2 {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_c_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_c_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_c_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.34.1

