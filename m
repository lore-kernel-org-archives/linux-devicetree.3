Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F0F3C10AB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804185; cv=none; b=OpAglFPwQg6yVVdGSTO6YMOm7uWROfxT8fqax2yFOjImHIdVdTQm57mQDimOAct6Y0zGWb49XF1D1dnPDqybVHXqEET+pWeHEawMProkLjAqX7QGQfXpuQH90jNte+OaSkqE+r9wVqQOnEXSE4w3qWUya9cFcLMpqD8br0izId8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804185; c=relaxed/simple;
	bh=b4dlCrA160M7CtMKajEn74UYqfbSy4cQVRHpsvUUOw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg6MXOC1FwihOWgdx2+MGCnvgv2EVxb6d3A2AXoRgTe2rOXgbIZGQUxoNLGGdgYipF83vVL0BoXMrbn+sCXBLBLtqEgR1DLQlukd/njLtV6+IHUjrrM1lYbLe0ooU7JymBtuedcRQHaHwubafK5YOOt9XLmZbftXS7r2RHvS0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxr/dJZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUxSs5ZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxr/dJZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUxSs5ZJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CK3U1096358
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=; b=dxr/dJZXGz6zWzaV
	q354thBXQU/63VDZUXAro+EigFto77w6hM05VkTesz3aidebNJQJRMHeUD+KsoE3
	5RfmeMniTgTgTBQox3Hd0+LsG4wDqtBMjlZj/rpLfxQTEsAHzI4TSMru9lq4sJQ/
	T+2exyyIwCqUa/Q9pEx9bJU0zK/rc3Fujtpb0zDEOGTjTUaWf5kN3wbEgsssxjXF
	0R++Iy9tsbYagEPrkYzXMFbYHRe1Vl8pTvwIk3nr+ur6Rk6JIBGiX+MyPT68eV7S
	2wFL/45X5U96jSiCmNkLITYCt8FB1ej0qbqL2WL23KsTWUB+cnl5eAGDJX70RaNH
	Yv743A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gs7e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so341508085a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804180; x=1783408980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=;
        b=eUxSs5ZJob4M3BNfimC4CAzzzJlWqH4ycUWNS78SuqYFeQfuO9+E9/39WELbSUMdB0
         DkyL+X9qM9GkEmuHXATZrxNOiIpPTfxSpyV9z4SACjzarWPaIpc+Fa9Fz0mzcav0opLq
         /WQGVsIs8spc/+0EWPz+X25iNu6fyGSk+mH8xtHSxLwrZNysn1+EfqAPzXCo6pYklmua
         o5Ioz8SvuBq3HpoLNfl7rYXR9W7haZ3kX9DKoOJk6XynI61ePAeiD0Kv+aWRULF+cGtF
         Y0b94QpP6EFjBb5G1zTuZdNFfAEimk9+Bkt4sQBB5MBa5GAaxJl7AGRFe3jecZ/PrWuR
         H5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804180; x=1783408980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uzFHjqc5qdAQfy/5iG6g+X5h52z3b9ZOTOLbbvEn70=;
        b=YBoivtq0V3J2swTdw0SkKijnVldJYuq0Hvj3xpUozmhL400xEM3MBfJKsUZIjtmo4e
         pctrmSlvuQUouObPctuZCUom8GYya8mgRIVoo0OkWsYtoepfHT+b3NOnRB2tXMBzcAxL
         dgxWp3jN06kuPSNGUNqqXsR8MykWaqCwnEavAOrtND44mYbg54l5eKQtiWD5rc9JZpTD
         9U4yC2imQ9zlOPWXqOU8Zb3iAjtk29zho5oxYcvVcC0Hxhz4snuALQ1Xjydx9l+X/ti/
         sg9N37YOSyuvD2d6U+jZF56zSe8Wj1TvT1zbjuZzyA7IAKC4pHfZtVnuTiXMLksAUZz2
         yYqw==
X-Forwarded-Encrypted: i=1; AFNElJ9klG2S/X4o8y2DwjW/Rl65PwhN81UeF/fgNH5zvB9iIQM1akdYu3pQ19sADIyG19kBjb9ISXFoV3uD@vger.kernel.org
X-Gm-Message-State: AOJu0YxHN3VCeiyJz6BjiBRS9y5F27qUNDkZi9Kc2rbW+T5nIclrAZrS
	Yuu3jW/HfmozoDDBbeiLfWz8uMybqZ46L0qn4G0bBpErshJN4HeVfMk446ptiUUadZ4d9bMoZkm
	o/z9zXX2pza8kxjITyjsCcJ2ddeweSmmRziqb4xw4lWQI8IMotbthEQ9scoi42Xxj
X-Gm-Gg: AfdE7cmGo8fpKcO0i2k1AiaKg7fv8AkTYa/l/N95hB1RMXNw6h1OjNBPG9kNp+1AnLS
	CClJx8TGim6pcMHkkfM8OtTMpF0LDhhs0dalaM1pUc2SD0tNGz0hB3ceZK9f6Nvz1/w8/NB65Fp
	YZ7NbzmhJCMilMi+gRKJfclOFNJZz9CYyCjHB5ICws9G8/EZxO4UE7n0N5acWclk3cNQXprr5TD
	Rd8VWCC3fRRXuqQ7bonRHrQzF8Q2efGuTmVnsWrBLrkY+qgz+IWIWCHOhJYTPvj6FtpZRMW6p4w
	pu3tyIRFQF86/26PMzFUf8Tl3D9XpviMiPFbntj8PgO0tTfiVu5H3uRJ0RPDHOcD4OXN4Il3RcQ
	Ec7b3rcNq9XfhN8A=
X-Received: by 2002:a05:620a:4101:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-92e62791e5dmr367717985a.34.1782804179804;
        Tue, 30 Jun 2026 00:22:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:92b:c6cd:7f6c with SMTP id af79cd13be357-92e62791e5dmr367715185a.34.1782804179139;
        Tue, 30 Jun 2026 00:22:59 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:22:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:22:41 +0300
Subject: [PATCH v4 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-eliza-dts-qcs-evk-v4-2-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11627;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b4dlCrA160M7CtMKajEn74UYqfbSy4cQVRHpsvUUOw8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27KpS9m4GUQ08Mt/eChvyefrkLYyT6kM0UUi
 yfuSETCEG+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuygAKCRAbX0TJAJUV
 VioqD/9UWiog7k9VLjAR7OagmcwHd8qayGmxPFmBqn1L/eX8T8bhNxlFuehbYHeZ7BAgg4T8Li0
 6JQGOIV3WHP/7fvQcyNfBuHePi/LCeuT/dC/CzsKwo9gTS5TNy/muBadcYFXBuiCQ9Q5khNiOOw
 tsUUu7QBv+OGMsUNpmn67RTXbCYMvddMLYRH8RlDrvlWrRbpyDMJEiNUSL7vs5+HwyqdNto/xM7
 3aqw0T7XHzErODJE9N3rFNSgEvZ5L0555R0pnzuO7yIlSqWBKvJvMAy2t0wIU85vLRJdl56aqtD
 uqWM0C6OXpReOdfuukkUQ85BRz1QhVGAvvkSEEO8ODoZ23mbRzhBlsf7rtBhZHjAX3QokwZ+KE3
 /AVKcJNXOWxUrhr5xXHv5g1ESFA8h+aahqLZ3vEi5YI31VpMn8Gl0fo+cZfnE8wY/5X8j1vOnDY
 2dbJgWVidz2XDGcFol7I5zFmyRpieVAdqzHNrtNwaKmIFFhE8wCQkRlDY/WbGuzVgNiiFRlGerZ
 kAn8svPvYmOy26Wo2sHhhY/2pyZXWmDsr8fT5e8RulPggQQNf047BzJVd/Jan538skje1p+T3Vu
 yxKLqrjwU6ljk0nkkLGuzsk1Fw9X1nKNMlFyDPM6fmv5zFponNkPsRei5Mv7m/hi3GbmOyk0kvb
 jTzxNkAY5Pmeb2Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfX1UnS9LSYaB/n
 xjZMTMtrwCeUtiU0sCPtU9x4rh/EiXQ0yHdt4wvUUgUE1p0sEiIh/i8GhqeGZUJ/RFm4CWJq5XG
 ZBuiYriU4T7+IdXi3L1Hk9T8JLW2d/M=
X-Proofpoint-ORIG-GUID: EpOqHBxdeKBRCRuxU702d5v493WODkaG
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a436ed5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-rIHGyhvbnQuOfFkfywA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfX3eIDVOyoH+4F
 ZxU/u/t8gqgDxQWCPczDDVBj1yI3Vpr+44CLnu8p9OuGQMH/UU5qmfRyIiZZzl6kWdjjqiOiYtd
 v7IADI7UWYW+oO0nnO9gecMFivW++ocCjhMDQ3SIXfeOV24W8tnNLFMoyaJs2xXY6o5SYhAODKu
 EGAzda2E7rKnXJKI4J82y3pjng0u4w5BwF9p1ZUIZ1uKbJ4GapoDy16fKHS6RPHJkVrwXJFbEP/
 D6xDTK80CxCoxZqhycwhHT4MdxuAOxzRTDa28zHCHz54C+A+QWkZeLxicxaWVTfiAjrjRCzd1mW
 5D2T1WwmuqxnM0z28CE1Vxf/irZv95OZ7y4wwgi8KoC6ctj6gIJ2G2R6E+0agAMxLl8dWCV0sv3
 kFryjht6hbCE6GS+6oK0VqxzuJ/DxSaUDkQVZg+KGNbAwEoVDea4SkbswqxwBi1GUJ/7fNXUuZR
 e/s0qOYDhPnivN/2Q1Q==
X-Proofpoint-GUID: EpOqHBxdeKBRCRuxU702d5v493WODkaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300062

The Eliza CQS (CQ7790S) System-on-Module is designed to be connected to
an Eliza EVK base board. The SoM provides the SoC, PMICs, LPDDR and eMMC,
while the EVK base board provides connectors for a multitude of
peripherals.

Add the Eliza CQS SoM DTSI so it can be included by the EVK board DTS.
Describe the regulators and board clocks, enable eMMC support through
SDHC1, specify the ADSP firmware and enable the ADSP remoteproc.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 394 ++++++++++++++++++++++++++++
 1 file changed, 394 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
new file mode 100644
index 000000000000..33f4cd282272
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};

-- 
2.54.0

