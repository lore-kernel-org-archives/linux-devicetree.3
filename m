Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014194;
	b=mjHcLYWWsfBNCyph/zVvncFPdYCVGxb9ovhXw0yGGKAMl92zi/1mjQEDuxJ6NigBn88c
	 pBFsyY8DkMVmm6hftJcQSrvTgKEWponngC9PM6adbE7EP2MfCRFQIIfUJYwyY10klprB2
	 04TqI5VVOIWCmqO9KkJyHk3woXnBEAqobNCrd8S17olbGSQoPbHtIEUOAa3mJeW/4H8VK
	 1Xpmo9VvSNN6iBIOIGPqVEcLemQ+xFh4i/Za/T9TtQzIt2uSua4tISIU1UOOc2IXHrLNO
	 O4lDCpEJZLuVfAoBe5LT6nIG2HWzNMteLKp6ix56RhORogX6ddlqv1aB66UiTlDmEUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
	b=ILnJcmHmB+U+ct5DDCtS36uCJXXudGgwKYlFK799sxqgAZzRbSHcH6MgEYEO2sjAQ+HW
	 jxyjVn/JO7mI8bYzbmll01v2cM6oLCxg3kFeTwcXbNC/VWTtFFc0y6o1Y0NTewgB3MdDm
	 RPjlmC++9STJNs7GVY5enHKJnxOWiyGeASmPISp7AviEmadAy7/ntv4eZJ3l68aCclBQZ
	 r1VZUsuAeiSjkSM//tZR5Q6KiP+IQM0V9c8Ih6ZDdSc5B5NiQhk6bAdCwHvjQ5ymG660r
	 aU0IAGgQhO56xNYtvHC2n3lnYoh0M4BJzEf7fOxgBLmUe5vreuB4STn5gh4PfjDj47w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSBdIJ14;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WXdZ6mv/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B466606A323
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B466606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSBdIJ14;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXdZ6mv/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMk52009907
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=; b=PSBdIJ14bS1Hp1tg
	oDM+hArGNQohRg7tl2vF0jYsC9Cq/365NOI92DKiVjYD8RBCFn8G5K9Ri0w2elCc
	3mwZI7DSPuiiL9VTrWE8xioJTSrszzCuChF1MpqiIA+edH+UpPU88rRYG/3lpzP1
	ty4lkf4JS9cDm7COpQpi7xtEZ+kicKyyrsRQYVbLb03Yp6XCHfHqlM3/ryYh/LJS
	QmrDJa/9oIFnwz+I5zu3DjABE6I9L8jyoUcxbthihG8mm8XtaHqWFWhLXGvFRQex
	NEadaHtiTp3O9rR5mNt1CYVTTBhqhoDu2sZQRAJlgpWRwUJZQBVkAJHFVnAnxBY8
	TiamZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x4um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso2563964a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014192; x=1793618992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
        b=WXdZ6mv/+wmqXq2Mx/tjCmZFhC1BlV56OIc16HqcFf0I9+/CeSx93/BfZRaPVBi/iP
         D9Jc6Kj88jboizhklP1ypEJHezSJNNKmfh2p53e71Acgqq+YIrG46f26/6UBs0UcghYN
         EslIB65EAm/E3Eu2rD08EW04w7WNhi0tYRhsgpbtYrRMYVBrlgudagZEFNfqzpyRW9Ye
         igFO0baiRrLohsPdAC+UUhMcspwD9HFiTwO2PrcFdWY4VVV890vh/uEtDPaAlgg2KzOm
         WEur8GZQhFQjmWI8hLqHfTywWi0Pl55ivLc5hWHk2SvtAcnMJqhOn5I99aLQClnFch0M
         WYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014192; x=1793618992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
        b=JQTi9gYWY2Dz09px264UCwOBdDomOutqe58bfB72Bv+JMIqciJpABaWzwaHjsQeYh9
         3Yz4Po7fkSRV/r5MGAvoeDAIPcvkJfG2hbK+522U9wwbsSwL0Aa27idJl1i79OH4Hd2V
         b5pPUo1XcFAAoNY4Aee9tes3toDx/eoFolzgz4ZemNLV2NUjaArGBI9r6vYyvDsvtE8N
         4BTrn/A9lAj302/5JHa6rHpM2VPjS5sgoFHcveYkBppNKrDZmxSQ1V1cn1KTFDmNPRvV
         f0nr5f0rlCiOutVbRlSbNs8Bt0BdtVtbJ9kVQCF25A30k7a3h77onfpNVRvAzQ9Ognip
         iY/g==
X-Forwarded-Encrypted: i=1; AKwUvBz1vsnizJLKBFy8jxGxciTO7Xn9fIBbv0Fcj2QxrtueJdYOPOZC5GkY2kUxg9eMK1MRlwXiC2wdJ51r@vger.kernel.org
X-Gm-Message-State: AFq9FYJIruBdEvHioB5i7o5M/E6uOq1IU46YN+UHjkbnwY+SsY+MKrXI
	apfmpk3cPcO4mKtlVL9xVBwm5QLX6IM1f95QByILfBpMCDdHsDiNkeYjjPVGV3WUCb2ijt3Z/2f
	yu7wfKjiWxtXk3TBRGt3X8IJu0MQiLS1A5F5OlrlDZ8LH0T2cG+bs5QVkjmcOnAgo
X-Gm-Gg: AYBFou3+QZIZ4wdxXYMFmgNx4Gbb9FDXhxhQ+BBUSsT5TSdLV+X5bk27FCC3/szpNxh
	Zb0lJC7Co34yYYED3SO2BZs14+yMma5MpVHW0xIoYAehMEqBElUK6l6RKXUfz9wrK2Cw1z2DjV1
	Ogw2CM4Ckgq9H/ER1WbaRZR5ZV83ip9S9O7ZrR85YYN2N313cTklUYzQXf0XWeqfmLSnuuWVzNu
	vmGP7bdJnGexQkL/smw6ECCN3vYiUDisVNAx1GQ3aLurWHjQZGbctHYzxEYD9EEeUk0nZPimaPh
	JEvXlC11AjeptGk3mclLi5EbenPxWSfBRUqaDXb/xWk71jxhdxqNr8TQ3JoMBtMs9m+Ft+FuCI4
	YjHziuSC7vxcwOmWz9bJJrlE=
X-Received: by 2002:a17:90b:2888:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3adea8966dcmr5277134a91.13.1793014191356;
        Mon, 26 Oct 2026 04:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3adea8966dcmr5277090a91.13.1793014190683;
        Mon, 26 Oct 2026 04:29:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:27 +0530
Subject: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf39b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: eBfnDY4_J551YI-oNQVTYNxZRAHNYupD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyt40Hb3lhla7
 aLuxlBN/de6Oi0b6SiIZQb1sVuyp+XIFNdNyAFToVZbbCgiKc10H07tFkV0NHbctMr4kqESczoo
 ZO8FRLXemdVCbjuZ3IkmdNwYsArhoTU=
X-Proofpoint-GUID: eBfnDY4_J551YI-oNQVTYNxZRAHNYupD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyAJCoOwDykkV
 BYWQvFj6UyM5keiZQIkiS2vR3jl3F+n2lTaoTZPbNWM9YecAcndaSER8uXJx1dEhue5obcjVjaX
 g29fmxYuuj4s4mqjlIRXhSR7ke/RDSBhaPOisZ0kWRiBTulRfTPIK7P33Bp4/mES+HWWy6suHG1
 g0jQgGN774AB+ZeyeLvLgnLWBmdL7H704yADoBOuquP83mfrLk2F02DF2E/iIn4v87pYeNkXySm
 BB3AtRFyEOJhLO3oBznsxlnrgjb6yocFEBcyUswX/C84km3nAAV+5MWlU6stPlXTmqT2ngn/8vA
 5oKrt38Op7IrPE535WrkZ66mWflpUsZq5DE2P1bv4ZWAyk06tPj9Nh2whYwKDl9QieeRq8zLzCG
 INnoaadheD/1wA70O5dSy6Z2x/jY3ftJ7dwpZvV7jYYLDXxHYks3tO6r6FNnX+wIb+ARGJjH/Mk
 jMv3sBLzNSuDViUObTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sc7280-gp-mnd
+      - items:
+          - enum:
+              - qcom,sa8775p-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,qcs615-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PDM XO4 source clock
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm_clk
+      - const: ahb_clk
+
+  '#clock-cells':
+    const: 0
+
+  assigned-clocks:
+    maxItems: 1
+    description: Parent clock phandle used to set the input frequency.
+
+  assigned-clock-rates:
+    maxItems: 1
+    description: |
+      Rate for the parent clock in Hz.
+      Supported rates: 19200000, 9600000, 6400000, 4800000.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - assigned-clocks
+  - assigned-clock-rates
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    gp_mn: clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm_clk", "ahb_clk";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

