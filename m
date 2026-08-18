Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9301F16B;
	Tue, 18 Aug 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078027; cv=none; b=O7A/3wcMVRBjA+svSFOGxvyXpqOcwLpARerpWlxo7+skRoooHfPOqP/6rgdUFKpxIeTAIuznyDu5nIu3XR8KU1oXdLXIDzmFZswHO0nsgpK4uSSTWbRcT6skK8UwfrjG5EmEo3bL5rzmTVdKj0BiIBTmizIr4eXPrFh9K3eSdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078027; c=relaxed/simple;
	bh=RawiKeaiQp0wVGU3iNXoclIB7Qsht14En8z5xGCZB6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnfxVXuPbFMKXBPiaCskf+JOw+/hO44VsQXshZxswyQB4iB+wr7SgHdk+cZ9MYrfk0xXk3DxnqqAcBJuVOMfC9B0i7NgH30nwmstnzHrfrOpKpzYZiVV4P0ZjRi09Yc9BD6XhfoTij7MYgrPmA63qZMf6M8ywjAxaHQSOpAXBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=IIuTWpLK; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="IIuTWpLK"
Received: by chaosmail.tech (Postfix) id AF84D1C87E8;
	Tue, 18 Aug 2026 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9jXpBBpw654DWT0EXGMe8PHXyENgl8j9ZoBhXENTas=;
	b=IIuTWpLKqT6+BAl6H5w+AuBIZO0VsRt1ajlV1r6mVbF69Vd3iFMIGBjKWQmygkJwjY6WDA
	xaE/yRb94mlixFxf59QmBSni1UpV7+exDruX9twPPn/xRKXw8UZ/10K57rjdcoKt0K9wqq
	2Z5L0jqAjCp79Jk99av8lqZj5Pgmu5w=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 18 Aug 2026 20:32:40 +0200
Subject: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
In-Reply-To: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=1733;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=RawiKeaiQp0wVGU3iNXoclIB7Qsht14En8z5xGCZB6E=;
 b=soWJfG2qi7oTedu0c9ZXqdftjr+xco8nDOfoi6AEOlVklhqYazuoIyf4csjirwcc0yrveillB
 USMBLUvTZ90AmklyZVDQtiQ/om67/zSNTgD5HZtc4rziJ1+u0GXQnPl
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..1d14025b44c5 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,9 +37,37 @@ properties:
   reg:
     maxItems: 1
 
-required:
-  - compatible
-  - reg
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - compatible
+    - reg
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+else:
+  required:
+    - compatible
+    - reg
 
 unevaluatedProperties: false
 

-- 
2.55.0

