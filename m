Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE5389E07
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994507; cv=none; b=tyvC+L9X+xdO2To5JldY4fMC5PzU4Y6ztI/INIrACm2aFlZUURd2p5qKF9OrrLqgjKPesAXXHR09Qars/M+BQ0HpkWCnlfHiTHclaN8YJV3F7TDLVZ2v8Z9pu5I8cAUHPswayvAdOODJp2HbYzfNSQbq40vjNL4Hu3szmIAHhW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994507; c=relaxed/simple;
	bh=j2WYAV1aNBU6qA06/lKr+zBb2ivHwzRVH7KmfeGLj8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMBsFI7KxPEqm63t3lig7eu1nEWK9tEvMeuOOzjfQ0OnE/XiNaVkn9IUkWK8+730WZ7CeUFxK2RufzT88xvqQdETx7Zw0OAet2Gj1PmzhNZbhG+MWCZ/dhazErf6Qa/omZseefV2YB7Qp2FAeZebUjx62loF4OyiE0m4L7JLBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vhx6+YR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrcfDBdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vhx6+YR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrcfDBdt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NcflW4140576
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 05:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=; b=Vhx6+YR1Le9oiR76
	bEiYQpSqEWzBOBilE0TdmwAXLUIqc9V09KHVW0g+zijp6f0o9ZGOjZtxLG5hvR1K
	omcQBYB7tADtqrNlYKxbTv6ftbyNPtifc6zX7qESHkWd6OAN0nSL4u0el8Jyj90j
	to0vJWjC1ruYwpVXeUbsh4x+5oyK61Oq7OF67jIkVCfxheKh+1MQce81AmYO/KcM
	C0G7RwTfUMVDIhkLNO8H58LkYK9crxcnq/FP8TyrKy68DgnHGZ2cnfygV2nHCppa
	e0LtSNbj3WIC/FiZXGlObb5RAGAt2qG1g9/dJ/Fd1WWsXaihUaANk6twnZxRN7Y/
	icZyEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9ur04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:35:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso32062125ad.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785994504; x=1786599304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=;
        b=NrcfDBdtwpgYtShXcj/PN9gRSAQVmbowHlrTiIZ2kxC7OPmHC+MZeWicyZ60WXSEdM
         31N8907ButrzxMb7MOkO2MvEOtaIOZC0R9ieRMopuLBsA1IL28I1XLsBLtwbPmFO+fHA
         CfXfDQqyGxk5HPpLIeWipQhjAEhMEyyJrvzVVompfUZqspj8F2P5fCTjj3gND7vJkyGx
         GmXLFfmRN2uksBEJTN8DX/mOgXb8V7jFNkGFMdJg1QJqv5ZypCsijP813qDZNRRwBxH6
         /ru5EfqgCHg3fOxJDE6No/yhCRbNe9HzpjcmrMG4HhHgF5tgMafcRGqdKPxNonOAYby3
         bL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994504; x=1786599304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=;
        b=HVS23tjThU4knsoniHpV+8YSGHMKHi+NZnbPutnPSU6C9g0AZ+WjVgEmaXsAYEj/dp
         jtP8qtKtNrMFK0UiJIu9NuLSL25rkmjSabS4nq4EZcjzCT5gVqsAosX17NKfWWXcL/37
         lVq0FZdk3KZ3c3pfaomTU1tnqbzfSqykfytbIWZWvPKGmZV3R/2ht39PaHCRaEpAbD2w
         PwdIrJgnxvpQvwLB0vXW7PszDHM+3WgSiMdxvWk+p0k5eB6Jcd5hdvDLr/zqlGuYLDTX
         taoKEPhx4myGqlf1+78gDrnUQzzi2TzRTqg/AsoEqDY8F+0eg0c7CB896j4INEeju8vA
         KNfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBEatvkY2HUoumyI51ontGXkSqFvYb+L1Vj8ObdmsJc9hlugN/JCEJqjdod1pIJidu2Anlz+2sQsEf@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvizujp2T7JSWjv2MEutCnHKEXIp92HoUOxc/q7Bqemwg1IeY
	KrT1BteWw1EIpoEZujBb8r2gwJ93BZkzDHzOscLrHMr2GoNp7jTfF5yCogVY7BZ16kRyuS4WoN9
	STI8vgW3Lj5mox3Hnr2mD5M+RmrePrr+Il+9KfXfx/CYisj+PjEdoEYGY3eQ2ZHAy
X-Gm-Gg: AR+sD1334Z0Ykuwith7Oj84t405GxcyS4UmGUJxnfUc971rOvNb7WAxr4juUlR+4u8g
	Q67V2TPh8y1Iw6/L5W4PtMYIdnWBois+0+mJoxPnBhQaqmmn8xmI8e+2wUcBwF2XeyGHDzRw8a+
	7b5ApPvr2JBRt+GKAqhtfJFJbk9sDILDUNEh4P29CQ+VU+x0DlBpvjZZNqi/dokgbDIHWZhf9/r
	bwLqzqQxxSbeDi8seh2eZe6S4giKo54MQU3TU6DUhxdvSjRcm1SqmryiNl9Cwwg06NcUuXvPr5o
	kB/jWZzgP9yK4ePsV4X+wvTMvYXJ7lMIHVYydfQsNeCdGrAH1uKyufg6YC8b1YmOmpqLct4NROw
	6vZK+SgDEDqfnh9VCPHkWqUoAX5lyZVG8ymV7YWQjr5/q96I=
X-Received: by 2002:a17:903:2342:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d0ca711fafmr133353085ad.8.1785994503566;
        Wed, 05 Aug 2026 22:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:2342:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d0ca711fafmr133352435ad.8.1785994503003;
        Wed, 05 Aug 2026 22:35:03 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm25780085ad.16.2026.08.05.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:02 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:34:55 -0700
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785994500; l=5156;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=j2WYAV1aNBU6qA06/lKr+zBb2ivHwzRVH7KmfeGLj8I=;
 b=Cx/poACnVd5oi/juwQuEm7uJELcE+QyD5Uxkd9ZCXv1ngeO8/RkLbnRI/aPPC0NzAya/jBxdM
 oiu4d+Sc/ERCp0GFfRLWZBsiFXhtIHKuIQCvdxOAqN2H8z8EJTCqOJ5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX6+b8ObxdPl5O
 Pf6FFpT0l52RUB6iq7H+nF5yBXR18W56KKN6lqyGr7+zGsyyBV5A79K/QZTtuzGSE11Qrv7faaW
 ETQnKt83Q74v82hx2Bu4fUoSlG6LxX1Bm1vCSk+AlBe/no2bmBvkdRqA/7OOcOqFR4degqGisiY
 vopaL3USD+zT64gb4m83M/3n4zre0Ew16Ku1BSLbCuoPT2bbAWCjcfUtpLF7CBUxEOZP1UnJczm
 CEsJhladaTqPsBNAoQ9q+WGWR7wbZZ6uxL2wx31gJokgMn63E8lJUgkEyARVjtSlIWqJ+lFuAvB
 DP98ms9Gnt+ty9sY51t3Tn+TNtk2I8azvbsFG1pQCv6QU1yHjWZ3aQ+CZIT7EMvnkwkbZfiV1hX
 UGifCB1Q2zezNtF7Wa6et5/hscxvaHdlS9G+kGlnQKlEqvwzBKqHGSLViLJ9cWpP03M8/yF/1+i
 V8ZjXtOyg+SziXBu7FQ==
X-Proofpoint-ORIG-GUID: 44G_qcGVN-vTXepcddes_ZgoqO8pYVwo
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a741d08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Vu0f6eG494TTLRuRXOAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 44G_qcGVN-vTXepcddes_ZgoqO8pYVwo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX+Y3fm31lokUn
 ee9ypoxInCzijQD56XSPudGlJRdHN6emWkFUPTqc33XJrjwjqlfEyEKUKRcS/OeODX2bQ4SveaO
 yriqhyF2KB0Stk/SM8v2pCwAAinVeEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060040

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

These LDOs are required by QREF to provide a stable reference clock,
without which the USB/PCIe/eDP PHYs cannot work properly, so they are
marked required even though it breaks ABI.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1f3332275c17..f199655790da 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -36,7 +36,6 @@ properties:
               - qcom,sm8550-tcsr
               - qcom,sm8650-tcsr
               - qcom,sm8750-tcsr
-              - qcom,x1e80100-tcsr
           - const: syscon
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..55182cf550e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1

