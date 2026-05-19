Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCC330650;
	Tue, 19 May 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192466; cv=none; b=P/atjQwJemnj/gBsZzV4a3HuW88gecUVuC/AvXDXjfct9hAeuuYeMEEZroKVSo6xFv1aVwix05qkZ7LhivCnpa+VPtS4S8580q5S4IflatNTi03e8PiM85qrujSbUbGtL0MAFfsG6rjrCSYMtavrRfBm4ZXEL7VGKFQnkCHewLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192466; c=relaxed/simple;
	bh=T5h17CKK+o1FG6MbOzHExl6ZeMUa9rkTzZ+o9RmIVUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCm1aem0Mn9enR8rNFQNbIdcKHSI0uQVTMsM9tRee0GGBaS5Pe7z1YIQbV54GeC7//LToOG/IJeel9WM4PKkNcMbsQlkPRWtCag9UPvLIfvFdiQM10dyvzdHEoD08CeZwa+MUV2aIHE93AznQLQoIMoQrxaDFyMNUFElKlTqAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=guMfgYYa; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="guMfgYYa"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdf1:d100:2163:78fd:7eaf:4049])
	by srv01.abscue.de (Postfix) with ESMTPSA id 19BEC1C68E3;
	Tue, 19 May 2026 14:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779192462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXtYFcx0e+fRYLzByiemIUAtNCFyH7yxco7V/uaQotA=;
	b=guMfgYYaR/fy54wKiXGB0wK37w/C6Tn4QNLOCOlvXNEsL2skiWfT6Pk39s4IAf8CpCiBaW
	l8gtgy3oKbEIaZ1BwXf+NeEJwHZzHXg0e/8EpPAPQFFUxMaoHlHHFPSkec+nKCB4Tt+V6e
	3Dte5muVDaxuwUp1Uz3bCicETnsgKwcG0BFwG6PkGYH980W0Sz7Q3hcaZf7QK8MfyBcrjs
	PYHYM1IRP8y/lL0fQAyOcpLwbR6aZ1yMKakKrjCFW5ER7i6A6Du0SFYwHDArp9psVFD0tf
	FwjT42PgQAbuIaRorFgadD2RziUXbZxXeS2B6Vh5AmuB2bVdL48wN/bjm7X7lg==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 19 May 2026 14:06:11 +0200
Subject: [PATCH v3 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-sc2730-regulators-v3-1-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
In-Reply-To: <20260519-sc2730-regulators-v3-0-5bf0e02507e3@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.3

Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
PMIC, used e.g. with the UMS512 and UMS9230 SoCs.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../bindings/regulator/sprd,sc2730-regulator.yaml  | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml
new file mode 100644
index 000000000000..5b91c7b7f3ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/sprd,sc2730-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SC2730 Power Management IC regulators
+
+maintainers:
+  - Otto Pflüger <otto.pflueger@abscue.de>
+
+patternProperties:
+  "^dcdc-(core|cpu|gen[0-1]|gpu|mem|memq|modem|sram)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-avdd(12|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vdd(18-dcxo|28)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vdd(emmccore|kpled|ldo[0-2]|sd(core|io)|sim[0-2]|usb33|wcn|wifipa)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vddcam(a0|a1|d0|d1|io|mot)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^ldo-vddrf(1v25|18)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+...

-- 
2.51.0

