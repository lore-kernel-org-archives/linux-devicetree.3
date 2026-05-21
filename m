Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835BE3783AE;
	Thu, 21 May 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380324; cv=none; b=TJNPwxMnAaK77nrQcK0MFZzHuXleoX4pHqUrqnpI23TRTjBRHjRZudK3XtYWP7VJ+vMh5+apNkd1v9tykqYi0Jv5B/4MkTOZJROeXTqlWf2RNYHPH+tILtJMbkKlYcBnBluNRP8IaajtqhSf2tRy69RWxhhzPOXbyrwngxxA7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380324; c=relaxed/simple;
	bh=XzD44KZDsCC3Vjgdgd1Sj34ih/8aBN8rkmHtReURtAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOunhMrrbHwDSXg1Y5mJcmFFfn9VPR4RheTag39sE3XEjROodf0eSxurbT+k/0uNcXezG172kJtufHkl5NVioAarXsXs2T1TxiSpaVC7w8tWxZbj9XCJL5VJnRtpRJ48zSBJU5iqUXtfrh3vOwPnDqPTVZIADKJclJLZD5Us7jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=paelamEw; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="paelamEw"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdfc:e00:ebbc:d4ad:bda4:649a])
	by srv01.abscue.de (Postfix) with ESMTPSA id C5B911C698F;
	Thu, 21 May 2026 18:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779380315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiTRgSP8t7TA5kJ1tVlAvoc/XyDZMqtXipVnqisqr1M=;
	b=paelamEwXZSP5w4aB74ynBJYWNgqmaXXqAYIwlfvfGcOb2+UYIc9CjZF90n5DUXKAAjRI3
	oMVPZ1RS4SrAb7UlpaERCNEbB/1HNass3dyol6yuvFDiaO86WXtrV/XZdSBS9OfRPF9vy4
	T3MTb4qTaSqoLcTQSePf8Rhfk4DrpXTfhtQYEv6MnlkNFVmipGQUHte74HGmiDbNQW1Vxp
	db4EGJBdV7aPz0waQjRV1Mg8Zd6Tu0Ge+Whr+vK4V9STyRmf6GqifYs2JpUi/Ec4+n9nbC
	alJmFrLJi1CnLEPeCWLbqA6F3nP1n7Eh1z7ffUmmUfaGEB9zHVkNsjiY6wwcTw==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 21 May 2026 18:17:07 +0200
Subject: [PATCH v4 2/4] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-sc2730-regulators-v4-2-1ac8a3b5ed82@abscue.de>
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

The SC2730 PMIC provides a different set of regulators from SC2731 and
thus requires separate regulator bindings. Allow using them for the
"regulators" node.

Add a conditional to make this depend on the top-level compatible of the
PMIC so that wrong combinations do not pass device tree binding
validation, e.g. if the SC2730 regulators are mistakenly added to an
SC2731 node.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
Regarding Krzysztof's earlier suggestion to split the MFD bindings, I
would currently prefer not to make such a large change that duplicates
a large part of this binding. I am not planning to additionally restrict
the compatible properties for nodes that still have them, only the
regulators are affected by this.
---
 .../devicetree/bindings/mfd/sprd,sc2731.yaml        | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
index b023e1ef8d3c..39d26b6ab477 100644
--- a/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
+++ b/Documentation/devicetree/bindings/mfd/sprd,sc2731.yaml
@@ -54,7 +54,6 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
 
 patternProperties:
   "^adc@[0-9a-f]+$":
@@ -101,6 +100,26 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc2730
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/sprd,sc2730-regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sprd,sc2731
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/sprd,sc2731-regulator.yaml#
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0

