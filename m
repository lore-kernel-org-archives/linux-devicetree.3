Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83534377EDF;
	Thu, 21 May 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380325; cv=none; b=G7fwe4HBwn92Aozdz78QoINIUEIifiP7bkK6Z+8tPhrwOcduXB0B1+8Fcfb+m07oKyAkOpRFz7Pp1wBY6+r2378AfQOIDVURNkjW8RNInkqFLgZmK5+YZVumSuHN/bUQyPs0IRGxbFlexWFQZM5HcaPJrsS3KyCjlD7mcwYSUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380325; c=relaxed/simple;
	bh=BtKJb60RH22N8q5bA132HNWfF01wxJbGNhtoMMQgXJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLCLJGAWlFLJkyqZ6CxcFbANw1rPGq3g1vOnA4khHQlxs4To1Q8AY/9vvAdve/W6SPQUWQNFVybIfNxJ71dH7DofGWSGmKb4q04Hk3i/M4weT2UWfQPNqJ7yVPuq9v3LPK6JAqf06UeumD8wXPFuxHqSJQFWlLZ4oMlLIvwLFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=e7m2TseT; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="e7m2TseT"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdfc:e00:ebbc:d4ad:bda4:649a])
	by srv01.abscue.de (Postfix) with ESMTPSA id 2FC141C698E;
	Thu, 21 May 2026 18:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779380314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZND7fks3TiIGjH/cHhuHXZ8h2Dnzuccv9iznYuslCc=;
	b=e7m2TseTmTYvV1eL8PrFXajVTt9hv/FMpJK+mp0kbjvLI161dNdHu+mp0it+5r/JJgoZXN
	6mBS1k6n79XOk08zNA/vQL+tvcqjK6Z+IFVfnIbkeA5R1SYNg2zJbGJ7v3GCwoVvLX1V8f
	dC20JTD1S1XUVYZrBYX32tCK0S7rvJOgsmaSHyTLhKBJhdR6jtTq72LMkfr/j4YYVO1xZY
	Be3jmEpKdkIx+PNjeK6AC1S+wNMNnDGcnC+BcYjqLmGN2xiLr0yf8uxEy9R26aT5IH9M3M
	cQpkY0Y3gUnrkpLgk/pqLMLb8IXQVuHL4SmGGRFMz0SdrQ1xLK/wCBuJRbbc3A==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 21 May 2026 18:17:06 +0200
Subject: [PATCH v4 1/4] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-sc2730-regulators-v4-1-1ac8a3b5ed82@abscue.de>
References: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
In-Reply-To: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
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

