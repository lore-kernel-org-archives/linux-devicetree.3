Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B23846C849
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793974; cv=none; b=QH4veaQmG3IdhQFu6R98UjsELSTMQe/8369Aojo9ktHuKj9pszZ5O6dJVm5H0nBzs8KpjkjTko446wec/5lGr48zYAhBNm2RnlgizUweTLeVcxm9ZkGVPN1CZMkhcZN4hK9yyBJjeu0VyYGU8AsYdNy+OlpuMJxdlutqZSvOd4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793974; c=relaxed/simple;
	bh=bbARdkrRuUy1baGyZrTM4q3SSSMqbiE+i9qs4b/uJ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSDmmllB6a244hoEttNARk0ePGa1a/r3IDXILxkPnATreFKeU9+4Bq5IDY0cm0ro1Xgfg8RnE8BUe/XU9KWWcw+NeEJ+Qc74o/tOj4AIMuLR4LQltMD/Fk5tkSBvXeHy5ut1Hs/P37ZkSueUp+gJVk2TCZpa/peeDKIuvkfKuos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3nPwN6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKWFwA+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3nPwN6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKWFwA+x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KmNh1439194
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=; b=P3nPwN6M5MIhBeup
	c3X3iNcFhWatAjpnsGO8Hld1hqhzDByJ9tZqIq8mqTG2ffnAgDkPqzaUSu5epUPT
	dAAc6JJH3q2S18tdUDg4UJHMrxk3qpf3p8xhifcn5DRSG5ilv+iyfYDYDe2LzIH5
	y1LOne0HNfEy8+2fRkEpX7ZelwwqSklbyCMx7+9Sj4hHu/8HHKYiCzHjI3imyqkn
	2B5RK0mHzc5YAgRZqc88uSdZLE2A09kyseD8Lmc8BaLc6kVx8WvwFbJvAyH1lnyp
	eKmxBb3SY752CD+7A5kiAslk8sgY/Id/mofW3JenFRbnVjJYmAm47PYpwT/DJGtL
	jpVpNg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkh2yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso928300a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793971; x=1792398771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=fKWFwA+xMJpc+/Ai73pII1qbvY4naG1COnHNhlHddatdXXFLwkl9XmtFpLHv0mvaqK
         Ij9DwpyWlx+8b55U5SMogtNa0wiIayKFyT9dFcTd/cruCO1iQxpszoKqGXtK3MRQsxta
         5SfTnjphCO91rrgQZVKsCBFWK5jaHFN6BmDRV7DQrD/Kb9DIMfheJiE9i7lPNv0wdS/t
         tYLDYhpdL0nDDOFLhDQGOrftC6TS05hSOhJsU5QZnagp/0vG2aS06IRGB2hazrvoe+oL
         9jttYex8mCiS08tiys0M/atKn7U5tMNzyRE0nhWPUsuh+q7CEXGz9vwnTWpshEf/nCix
         ohEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793971; x=1792398771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=pToyOI05GTw6vSrDmi+8t4O7zSiHKD53B2RJAYDByrYOQx3SgSUo5+cAGHF6K94qxt
         uMLBXdcmTUXxqlCp0pFkP4xjpAaEghAgObqj+gnDBC/Asu7UFr3U/VAIlTdS6MA37hNT
         bT5yGjhCGO+jTmYLtnt74TnIgE0BGcoexeRikPXlxWcttMBdLCRGHPCoduCakESQwd2j
         b4sJ+3BU3rAW5Wy8aCWGUTFWbehwtX9uaoozNtzBon72DH0nXsjEnKowBKuivj262kmX
         sJeUNY7kFJTq/S2d2l2CM1YLE5+2klAYrUf8a9PJ2dnriQEAiIgvuPKNRYDdPZdKVY8d
         a/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxbXPwRPRZtHvrJAWvtNlTWfzZNXybxDx6TXTOH6B51rLZfBbe39CKuSO1EFvc2id9rl4jdvvx6ntYj@vger.kernel.org
X-Gm-Message-State: AFq9FYI9iy5wEoAJZgg5FVtTjCDvaPhf0gRwrYhCmZgrfGaAO/t0JDhU
	hVOryFW5zxzeq/f0D12n1uY9xFpy0jETPcL9BwqTg90FamOH1SRI2H11VlQKCpu4/VS7zFZr6Vp
	JfQCctaUdKzgAfy+ENJ5YsT8LbCbDT2pdC4JfBckfdkRzWhjJEAjOLwXMgB5TSfn1
X-Gm-Gg: AYBFou3bEuQMUuTG4IJdVU1Ul0qEF6W1q3HVVsluryWXg41x1HoRKRiQbJEs2Klc0ND
	mfaB/wMQ4Irx06wcSJFOq+cUD/0AkQ0HPg5wiCDxnOnGjq+5cc+IDdk94+gD9VpS7zF36Ore7ui
	IRw9v+RL6mC7ndnfbzLkvU6AsBn68+Wl94yEKlOY52gp6llvmIbFeThmrFp2IfqQQ/kYAkDIAZn
	6tbPM1c6Z0dN56KGHuyHOh2kXXtbXLbjR16wSiyrN0NPxoe0apZaQbRBzrDys1T+lc6mx9viiyA
	PmmoQf5DXDgLrWxMTxzEImo7G7Tgj8X5tqsp5+LF5Edy7gA6cU0hN8qurd79NY4Jt/duQH3g11Q
	BDc5e3vrTMPSTuZhJbJlriaeekaHzG4272kmWb060OtlW5jtH8Q==
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr6805446a91.66.1791793971353;
        Mon, 12 Oct 2026 01:32:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr6805433a91.66.1791793970833;
        Mon, 12 Oct 2026 01:32:50 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 01:32:33 -0700
Subject: [PATCH v3 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=3595;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SHZeKzvusHFNFuYOntdlEiI1S4ayexSEHJ2wrStFqY4=;
 b=5ALF+rfy9GMeZYKuvAV9hgPK96c1xzDo1H+xAUYbXCDnZvehsYJNlSfv5neWZaL3lQ966TBkd
 QKHd5GF229gAiIQtpA6vIsbJGzN7o+cnMxnzYvi+Miouu0zCNaQvHbA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX1edLq2a+Ev63
 LTv73jyo/ybYIXHVyhozrPRHVsq3hNkVd2jhBjFIXZzAeYmn8xevlp2lYYr4isXrS1bg3zirRxo
 PtbC9j8vIE0vNXQQd5RhdQjisdzQYPHa8HP0JjcNUwkvS5Qx4hvdXYYk1mOoMROjwhL7s6MHmZA
 iXC/US074977nzaVJey0XlMMyalbLQURrVF9bN+ZEulAxUz7OxYWUqZmbxmevjr9AP1MbA3Msy1
 zIBdHfjx/81vYvKoFpzRidgvxpFZyCa0aFj8gNmMQ/Di+oXDsLlttTjSpF2If8alMhh5Nx24kwl
 emqHJOMo1mI1AzMMxnTS8mkV42O5AUgQHvmT/JdOKWGwzvgwTVoWe94VLgpzN6Joab57syetnOI
 H80MBt/3zlu1mMHFLzaCv7FQ1TFvngrF+KtiuKAuNGv6xHiiVJsdQL0oTychg+vLPQOiXqa6khd
 eA48vChoLAAd1EznNig==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc9b34 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4ECTE-F74UkuUx1KzIYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX2C8Z1RcNSWmp
 OKhhye/xnPakHFqPdR2X+bQE8ip69UuVdjZYjZ7An8WIgpfO8ja/wqROG0gEWytCv1Ayo7PXkDA
 DHour59QFUbjZprC9u7ASlOP86/F1fA=
X-Proofpoint-ORIG-GUID: Mh9vt0KacM2VWnWG271-u6V_bRtsZgWP
X-Proofpoint-GUID: Mh9vt0KacM2VWnWG271-u6V_bRtsZgWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120033

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

