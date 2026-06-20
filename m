Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E09234388C;
	Sat, 20 Jun 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945653; cv=none; b=fhHP1XQa/BR5Lq4/y6NgMZvQrDfkJ0T60ltOfQ39K4aYTSxHZNRU1PjsKisb9cfudL/HGk1CfKbq3xUOcpq8CJMHusPdL6857ZXlfKxRq9+9XYOhZywLzhR2DZzyW0HmRype7OKfMR5M9SKvJo/eowb+h/Ja9HnpGG2WwF52uzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945653; c=relaxed/simple;
	bh=VmHPXkpXapnHavQ8VmdyeO9QqMrfcrncWaJhDMVYKy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DexqCis7zYWd/kygUYuKDWtlvDwjivxfES3ewWDHGkBr81jApBENoU4ARTTIdv5cDi6HPLXofwzoqZpJGxy76f6Mok+uI6RuFFEQVVcd44vkVtbxRbjosXPAPQXfkpqRfuzwF3fk5XxcJMorD35sl+9Evq7o/HtPs0HWiSrY5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=LF4K4g0w; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="LF4K4g0w"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdf0:7400:2cd7:7cb2:ecde:c017])
	by srv01.abscue.de (Postfix) with ESMTPSA id 9399E1C6F50;
	Sat, 20 Jun 2026 10:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1781945647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2OHFwX/Tsh8l8Q/zMA4KLqp2lnKUbklU1kAVQ61I/h4=;
	b=LF4K4g0wJbkdpKX2ANRwhtpTtj8QuiT2MkOISoslymPG07mKVo6+6yFdXi3OpslQMbnu+1
	/HCq/gTAZw+Ex04d/xYWA9wAx0B1JVL+uoTL8jwXGzAgDTWp4CIYabmp303+ISAqeBqOOd
	etLeBcNHa5mOE3CW5MtGQp2iAF5yj7XFXb5fRgJrGAWHfwsBIo9F5xy8WEHH/wVSvMlENj
	xm9/R8LLzric4dmvQiUODEwfyVC2VtKdAEMu80wX+axA6uD0W/xMqlqYCPbPZbkHzDaOYa
	Tvz2avL+qJ+w3Dd3wbe0Z+6jaf+dXthtYDEFwf0P26Ga6cfm8XcjTLE92uh/GA==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 20 Jun 2026 10:54:00 +0200
Subject: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
In-Reply-To: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
PMIC, used e.g. with the UMS512 and UMS9230 SoCs.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml
new file mode 100644
index 000000000000..ab945c46b08e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml
@@ -0,0 +1,44 @@
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
+additionalProperties: false
+...

-- 
2.51.0

