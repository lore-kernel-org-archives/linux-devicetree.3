Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511767;
	b=bU8adjST+mFCX9lUfIrbxBiTD/ZeaJ7r3E+/C+HPc/ymTYc0ceVUxWaVPsOrx2/h8tVg
	 0/ek6Sy0p2f7gxM6vUITcWknkcJdVr5dpy3lzWQV1HQow8C0w/Oy9o9unwQVt7pQhhgeQ
	 w7Olg4s2bP9mBhPn7pPv3ngULE1N4iiQSTQvAO9KqNwe5e1rUtN7fYpAQ7NYNXLMdD+5P
	 EFGvRoYfZggskbBFx2O8hJ+nSfSklj/xvoy1kHD+9ia89okhCwwNbYLmbka54W+p5WB+L
	 Qx+pg/nSaqRKsw5yY86GZSjjYnqbzbtYCoCfFISSVXIneWh1yywZLBMrgvGkj+Ju9hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
	b=HYJGvwSmkvRLZFOEf/GNiHeLQzbLffTdvALYN5tTXVGWhVlRWe7E+M5yXVEW4lMmYnI5
	 YpFXrQsgRDgowQFDnX8DDVv/HsxZ85eoDk3/zCkdPXTqXx8MTgnY0LbGab4kjHzUNJBND
	 uVl+fu/al5gewNnhBi0YpUoY71uO4I7qY/qEClF9FWVtvt0nsF3T7n+Cfn3JuIZ0BPdnf
	 DvDZvGkWAHTswb+y/ZP+Vy5y6EWt09hm9J+0Q71B9fW8XWZbpKYK+TPPc9XxJxcdV8EhG
	 e8SrUTQ7cFdajFk/aR0eVFgYqDLHQHe1j40mLLdM3rqQ8akzoSz0kSgELPo8mrQFH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468E606A683
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7468E606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avMgDcGh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQTH24cv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Eu4d016816
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=; b=avMgDcGhJ9DViWB/
	XYqjFQ4iMAdvCvFoLS4XALfaeIuIqZiJVA6htH31cHhOSzQDOM3JWE93AffBazRu
	zPeEC54i/pa2YX8e3F/1cBN1FQDrovs8ajOdcs6TCx7TqFNE8oifIhD9Y2oh9usy
	lD7uYOo+slnHnFT/zVNkHI0+rAQvejqO7UJKtCIPKNoJrCM/GkB2rSnW9d0o+Heq
	aU8SsGNwSxPjIODdZEaA6Bgf/O/sgrJq/gr8dpAUiimtIPXeSE+jn+TALFFPLw3i
	4j5LeHVdvQs2Fz5/XZCsUwf0TU26D3MYMCAdnLCZe+sX6F2exKWzQOFweA75Dy3E
	ivm65A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ntyha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:16:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso3104142a12.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511764; x=1796116564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=cQTH24cvlaQJ42AyKtFdW26cM7+biAu/e9mccS2UT1vFNsURM2/HNI8KqKMNCM5Byf
         OMOTrqrZ2wbM4MDgPZA3jMp2OzcmY1dL01m/50kCxQvySaB1Xk7ljSVKA9MBsMbwmi0M
         +CxNAPlVyKRqLdyD63egyPXSTidfvtxcQiDaXAfDxQNCIL5eLlZyttE5S1WMobJ1zchO
         fEr9naE2Eu1qCmlScmZXkfU6Zf5LdfvP9+e1XjBUHMv2fafQ1bkauKz/HFpHM0EgfWdM
         /obWuiVL4MPoVzsI59qjOzeoHCA5YRWwhPpKnxV3EsegZZreY+CJVypLFB2W2Hw+pJMz
         Q6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511764; x=1796116564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyDaDhJrRNXgsf22haK3fPxDonsmKiOgnNSI49tEwtU=;
        b=tjTirofCCiIi6ouo/x76S80BPRh6mF7EcqX9pec7uGEXoRRCiJSFBqYNp9Dvi6SHTA
         OAZc9ZODnrO8Ka8L/I8zIaHUmSDd2NT8xdgQ5pe4tnil+qVnYkdeyQo2Ns3LtBDpxxeM
         zXBWZ56ho0zuCjkezBiLT7/fPaFasVyhHoUVP75XMP/99GNFreij4E2wee795c3mMjIi
         1U6Rmkf/wLoypjoy8oMqlKg57azGgjAqgcU9oE5bMUW7+4WJxy5RJzp/dPEiaz5WbBWV
         sLaDLw0KqijGsx7kwnAkrqGLPZ7RQrq9vsqbEV2aH6qitPOMOYdHXjk5D0A8lzBL6x5O
         zzDA==
X-Forwarded-Encrypted: i=1; AL+hErGItAF0ac2cS6k6Vn+CjFjrmlJqMe+4WPLR0oEI7xO/tW34GTtV2XkxsWZS3K88rs3yBxtfV86O+ydG@vger.kernel.org
X-Gm-Message-State: APuU4Z9yJkibFYhz+Yi7nymg9ap/0fQsZGuSZ/FxfeiFXhR2k+zt5x1J
	F68sghc2FIA240jBxK1/bxUBVLnlzAaA88uHMA+OU4HQcxjpmCYhiyemvGdX3vt+ia+CCku8DZ7
	96i1/VypnBx7Q+h7OhpAymJSh1YgZF1J27kN9HcGXWXzGLIYm7KGzpHXeKjubbU2Q
X-Gm-Gg: AZFdTZebjxVztiPLSQrtrLgRntKJNcupDg9b7haKF6+0Q27eKLhOMrT1+X7A460H5h9
	sgdYBIDnS0HCEJVAFEnLAESG/nB7t9yvlh2vSgKWeBZ4D1yVCkJj3rpR5baxLp6HQGahqvFTumH
	lcyi7lFsEKT3ErCcJ1t4T9AlgTOA0/OhNgGnb3rUvPOG1SScvL+TLeX1g8yIZrpUU+4B8svFUag
	NPMvWlKnNEjiFJCgvaKWM2XXqFSERBro0fWL3CgZiIPF6G5Qu4cPhaH990elXz5WcVrQoLO/yOa
	fhNm/BVHvPKe4vQoY9v84FBBCO+O/bI7JjlsUlQsVMyK1yFw39J+5JBpQGks94/S151DX6oJZk0
	4D7QQIIcVBMM7QHtqjlW5iM+WOoKXTq0VOm4ov4KgNExZfah23LRjXKD6XWa4ZAyWvIdn+HQXax
	Y=
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080705ad.32.1795511764024;
        Tue, 24 Nov 2026 01:16:04 -0800 (PST)
X-Received: by 2002:a17:903:2b0f:b0:2ef:d8e2:8274 with SMTP id d9443c01a7336-2f03f1ae083mr138080385ad.32.1795511763547;
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm66371825ad.54.2026.11.24.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:16:03 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:45:44 +0530
Subject: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
In-Reply-To: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795511753; l=4863;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=JWQ+3UkdjGpMYJ0rMN0scOdLIJkar3ei6FpbBL73/vQ=;
 b=YVgsQ2lUUxYOUccMpu9jCB/zFyf2ltdzmB57JUBFeVhSYc8RuVdjR2p+M57sVKEhcZmX0mqnR
 KwvKYb4ljPEBetYIX2lDymafrSvsHTcCJEehq0ythjJqRB1SReWiq5G
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX0jEJMqwrZ9fH
 CCQEZv51Hag4ff6Y7AJ6KdWiopdNxfv0uJJDhob3JOTT6meTazYJCbqyM+CPQMYYkaydcjqqRt1
 M2t1Jul+jva82NHWOCu97DQVK8lW+wpZWyKVvxRXB+pEhyRa8eZmDVfhZ6tPI+xciZ43i1W9h7a
 SKSGLf54KcN0mYMkOMTjFm3uoRovtXedDP6zam6F99K5G3vNTxzUotIMCkalbbJ7p/ljECFWM+r
 oW5uuo4HLMfavdxOhr/nx2SXqS9UJE+6tmTZfJRGsUVw1iHuLCfUujF3810O/U9KW9WW276ECPn
 cY5tn+OJx8rhaJELhwDe/CKbLWumebncYByJwDwitOFRQa/SJ7ZGZq7T6Y/LXMDChn1SujwX1Ve
 3qCeFqipT1A7+MohdJnI8viT5bX4sgu+s2IAXOqxsVKroXeWkFFjD4UO3imHWZiMJ8zzmySVHvw
 YWMDc6cr2bYWgarJ2qg==
X-Proofpoint-GUID: Hx1oGoTX67waONrJIaGOzQGnJNdHuxgn
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0555d5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=B20DgfED3MDX--t0QlkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Hx1oGoTX67waONrJIaGOzQGnJNdHuxgn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX8sVnzo1FLbgj
 38mI+KfxeYGYoHS1LV/uY38ldEY1bEAdWpSxmtd9O9k9G02utVyATlc1aGqfe5d1Us+Qb1cBLhk
 gQWMCd6jeHjsu8sn6INHAhdZT1xvbBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
battery charger found on the PM4125 PMIC.

SMBLite is a reduced-feature charger IP sharing a common SPMI
interface with the SMB2 family (PMI8998, PM660) but using separate
SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.

The binding covers:

  - compatible string: qcom,pm4125-charger
  - reg property for the CHGR peripheral base address
  - Four interrupts: usb-plugin, bat-ov, wdog-bark and
    usbin-icl-change
  - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
    and usbin_i (USB input current via ADC5_USB_IN_I)
  - Optional JEITA soft and hard threshold configuration as raw
    16-bit ADC comparator values written to BATIF ADC comparator
    registers
  - Optional monitored-battery phandle for battery parameters such
    as float voltage and charge termination current

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..5651b428b0a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    minItems: 1
+    maxItems: 2
+    description: |
+      IIO ADC channels used by the charger. usbin_v is the USB input
+      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
+      current channel (ADC5_USB_IN_I).
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: usbin_v
+      - const: usbin_i
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pm4125_charger: charger@1000 {
+        compatible = "qcom,pm4125-charger";
+        reg = <0x1000>;
+
+        interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-plugin",
+                          "bat-ov",
+                          "wdog-bark",
+                          "usbin-icl-change";
+
+        io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>,
+                      <&pm4125_vadc ADC5_USB_IN_I>;
+        io-channel-names = "usbin_v", "usbin_i";
+
+        qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+        qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+    };

-- 
2.34.1

