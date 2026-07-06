Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43BD40A938
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344043; cv=none; b=EK6R0oLQ1LbynWrHK5ObutU12cJqd1Lp3T+WFwUVXnNVzVac4iNhJkd1gEimwAXKPj4R3xfxVog3BpipoQoIi7MSb7DStAmXI/FPWpEx+SR62CCj/cxitdquIyj+5k28oNaEaRtYi6BOyT5CmGLtkX7MD6bHzth4jDi5LvN+Jgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344043; c=relaxed/simple;
	bh=RuoW/FXZwjJXKxjWtApQABvJWpziWxB5IlaGCpbDBZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJBQmIXebQnCJ9acAcoWVIZtVa6yStMtMZEX2zqEzzmSiTP4CCtd2zbOcuPun0QbvVl7JriNjcIjklZIzvbna4KPS27YE9M/JPR4TuXCxoteOR46UlpflI+SBoXvc0kFAltS+R2x2+IgWVILKBP8i03tLGMswRNDQA61h659oa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAAECANS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQH4EPzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAAECANS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQH4EPzC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJX5316461
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R34M5+VU1Dp
	tfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=; b=fAAECANSXAw+UojNjil/HMfomuO
	bGnEaTiI/IzYZ46yKlRDMVo063u+/emfXLGbaGWsE7qfIQkpzoEl3YfBVlwUPhLQ
	xbTOKWXCLdca5K4rQuA/+LvcGbeWlHVXNWwvj+Fh1A8vZKVjJNYUsHA00txHPjWW
	AQIORcaRAz/QlxJyR8mnLc4qysCKmC0uYEXeTz2nZxWmQHevvjLOjhCYEcsKepb9
	29TzveTi91M2YwkFgvR5NWcjnTQt/YIYhRhSHv3iPBEnidJEceashQhaBkQVCJpj
	whZp7TI12LZdcJq7OPMYCl0p/oDNUZq0j5fv/paIRvbYNC3aTAdCYz3Geig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7he20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:20:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a20348ceso42326845ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344036; x=1783948836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=dQH4EPzCodbv2Haik3X7HihMkcTS4WqU+J7OMvqGcm0saT2/grAVItlMGYtp7Brinv
         qWoYLUm2Jv+PSRcA+Yu4979gR7z4RZukl3jZ/hGKsWzQdp6hVnmNNmvIhACRvnmaNRE/
         1VkaMl87XAjJaT3zkWOp+TCSbBhdAi4EeksfW4QXmJixIUqWh0HLFUIcGOyDdkKmEQ19
         UTGgaLRpQV99MqVnkDgRtwOl1exHKyolVwH4dNv/THX9oWVfmx1gfDGCmtVQEqwPbSJl
         U+XUbLuZZOXtgPqYyYULNEnzQyz9ClnIzEOfV/MBWNzurcjT6qgjHVKeeqPXRfRoYtpm
         KlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344036; x=1783948836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=JSKI8StO6yBRWYlEZwrUfh+B4rNsKFhJFY/iaqv60NRjsPG0busLYlXZFbOD1Rkeq+
         8VpBIHobcboArNpNcQ3ZOKjjosrLj4m6wmW4kSiAxx8qa4tzXdA5G0f78RcEMFE4jvOZ
         34BQvRXiN7/CEUSYcvgBm7BIleRE0lj01ABmX4A8JDkxrZAra+P5Qjh/5g4Xls4ewEhy
         zS4/lFshFB4Je/yZWEmAg6wLDG4xSEYYbEWgv1l38s3lkPip9mzJOJBDmACwrCQw+1Ig
         H5oHVQYWxq2o4BKrr5Sd8bgnRULhtv7v5CbVQT6ULetXpKer2Rvq/kqOZUnfehvrOEvS
         19ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq7McSIvsbwBN4Xh0EJ7D3SBiJBjewCoGFQ2myXomF36FWd5FdwlXqpcEMnvNuzsDHTy9AgyF8wbXiP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9DTtKctPmNH5rQG+BUc11FTPJ3Cp8aPjbaTZxlCaC9mpEyZ3
	C+F+PASvTCaM12WTXjrI2BsLWxGAIGPDcRqTNb28EsWEHLiWowmgPtq1PrjkbPPzpic+muH6He0
	OOWla0IQpP4zyLdJB35eIypwCuWptqFh24W9HzXLus+hOcx1CIbwlxOa2l1Z62jyD
X-Gm-Gg: AfdE7cmuH6hZEsHNdwAB0P3Mor8sOXQe0kG97WdycL4Fy1ljJwm3saKuIuGQ0IGy8iq
	RChinNO4A523yfZl5J2Us6l1GtK+qgm99rOtj05HyL+wMddBhoqW7/+NzYutGId5lxdeSOpOcbg
	T2TdjAr79IH18iUXHa2mnr/KDR8fyWGfSLTdySdAtf6WKtR4jJU0mzHk6n1jRgdmymFjZJQR8dL
	IFhzmGGewccjlXhXwg4c3Gu41H60bVfkStxQcRhdq+VmP5STDUt0mSRo+FdoQFjgWGoKv0JNq3p
	ntAMsuyxw847mef/8YCCigH76smBZ1WKq1OIlgVHOHIEUAHaEAebtcgo1An4WQvq5AcQaAFuZuo
	sQyDz3c45xp9K8BDJIQlLpDGtF3xH+69d1YCkh1nFRHWZmn0=
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4818005ad.19.1783344036020;
        Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4817395ad.19.1783344035455;
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  6 Jul 2026 18:50:07 +0530
Message-Id: <20260706132009.1496321-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX23wt3h+DIQTW
 KXcrVgrSr9wVIkZvLQxjReWDSEtcP0FAT5OM/NiwLtf93kXEfOWH4+8oVsjFKQc49ljbxtsnZwb
 uzQY1xVlDoLOya4MBzNUqf8pt16hPn272bNPntWoHIUwGGogCr3//VrlSA8OPpZ5pZ5wfpzM+1z
 Qpi9do3LjhciE3k06AiIBRTcaprQ7KiUkZiTQHlZs0SNWVbuLDtgpvhvo+eTMuieIqNh3JEC6Me
 HXmOk1S71GVCPrWxuH16+NbZR3nfmdVpX9wwWs81+S3PaJcshekfogzWQhQfB5024UiGcT8PxQD
 L4Gk5G9xmQb4e126oDDC6ucMhrQJKBhBiQF7KU/hfFlPcQPwVgRxeh6rNjboNP7ceikWL0loP4I
 cL467WVlFTtJdnypdJA6gr1JA0Bpg1To75mIoQxHcJAXB8Ds7cZwKa270pUj/YDn8OmhFUXJRk9
 TTstauVSZ77T55Njpmg==
X-Proofpoint-ORIG-GUID: TgGDGIuM3pxUYY2vsk1DXFqXlZB6tBjp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX/lAS1dN9CMGB
 VNBFInpv5e50uPGBZtgKdqTBofXw3EXdaoIGEhKQNR1luCwVSnxhCKYScwoL02fMaPK3NYw7ZNL
 BIySGgimzPx6EQ1qtXbH9yDBXFFaya0=
X-Proofpoint-GUID: TgGDGIuM3pxUYY2vsk1DXFqXlZB6tBjp
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4baba5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..42d05334bd39 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,47 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        items:
+          - description: MI2S master clock
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: mclk
+          - const: bclk
+          - const: eclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +70,22 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1

