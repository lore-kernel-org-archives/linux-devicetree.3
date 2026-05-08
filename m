Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E8372662;
	Fri,  8 May 2026 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225818; cv=none; b=VtJDl5sy+adA6xkxRmVwrARzKlp+w6jP2Fho8LJ3jRHF2RgckK7mW+QxwxfHsLUMHY614BtwuF9bHDPRaNIGii/D+1oAwrzwqewzC1WwkzZoB604qPamA/6MiXEtm4MYXZqAZdMYdmgkZ0kX2h1CHE/cQSkLIvtINICqiQATTQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225818; c=relaxed/simple;
	bh=KzRKiBbR6C7gp1fPdQcsXZjAFHQM3qTiU5u+nEQqa/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ivm3BY6HM7KydCCazWqu75zl235wp9tiPzT0qoOUz0my5PrgLmJkuudjAvfpFy5lPOOP7ME0if6unog1qYHP7pqCDu/0O7v83gY9rn9zyR8rPqPQ5aBeeI5yl/tYS2o2CyKYi8MOkKADrZpdlunEEKqs4T68s7Xforh4Uvpq3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkDeS5oC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkDeS5oC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2F6C2BCF6;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=KzRKiBbR6C7gp1fPdQcsXZjAFHQM3qTiU5u+nEQqa/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UkDeS5oCrNrzxKQew+G53HGTxB1MYTx6Co7IWuM1XckGXng9KljcoUY9S/RSCW/tB
	 j0jq8sEbjzj07FjhVVXSMIwwMARkBn4uKKiKlu7E+TMyEIcbOa1w8mAwNQam2YUkre
	 ZqGtXWltExH/LLOYNnpJpj3drEvn5XQD9onjUnVKxeMwlbDXfElz0j9s8WeyAZ+btW
	 IQn/D597gzVsfopuCPhQ2a1ZlH+is02YtVWTmgKBks16RoOVpFIf0IFrfPXrfdLteE
	 TwNQWdlwlxZqF0/+o1mYK1e4nS/zGQgI2FSu1ISEzaa6R/bzDNTqggy406akahzia2
	 m8NIJjjdyGS4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5573CD37AA;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 May 2026 07:36:55 +0000
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: Add support for
 Amlogic A9 SoCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
In-Reply-To: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=1795;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=6Ljc1slqURABvNOkxflZQUxRIhozTfJrbGsFoDMyXeA=;
 b=FGj3PF7NeRbke8xYI6Q3J8mraEC49BIYBCUw3ET5JId6vNWy/5ET7h6d/GXrJJR3ROg1CM244
 Ix0Lkab3dU4Au7D4014LTpdOow2YnWClYCdjc0VvCspyBWm2aqbmrT7
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A9 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index d0fad930de9d..d26671913e89 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -38,6 +38,8 @@ properties:
               - amlogic,a4-gpio-intc
               - amlogic,a4-gpio-ao-intc
               - amlogic,a5-gpio-intc
+              - amlogic,a9-gpio-intc
+              - amlogic,a9-gpio-ao-intc
               - amlogic,c3-gpio-intc
               - amlogic,s6-gpio-intc
               - amlogic,s7-gpio-intc
@@ -56,7 +58,7 @@ properties:
   amlogic,channel-interrupts:
     description: Array with the upstream hwirq numbers
     minItems: 2
-    maxItems: 12
+    maxItems: 20
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
 required:
@@ -76,9 +78,20 @@ then:
     amlogic,channel-interrupts:
       maxItems: 2
 else:
-  properties:
-    amlogic,channel-interrupts:
-      minItems: 8
+  if:
+    properties:
+      compatible:
+        contains:
+          const: amlogic,a9-gpio-ao-intc
+  then:
+    properties:
+      amlogic,channel-interrupts:
+        minItems: 20
+  else:
+    properties:
+      amlogic,channel-interrupts:
+        minItems: 8
+        maxItems: 12
 
 additionalProperties: false
 

-- 
2.52.0


