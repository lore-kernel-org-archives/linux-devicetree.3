Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45103B27C7
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907801; cv=none; b=cyApgORkH8eKiwTlXnJLMDGKKa+EyBRMM6zSY/boNisz1tnaFPRXHiuDZgeHG5Tn98P7hIfuPHBwCa75STsIsjBHxOsZwVGW6DIfj4RTxl+lJe4rj/aECZJ1Hod6btfzMyg940MjYT0mcxkGFX4bTbvIkzX5AVxkWEC5BRSEfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907801; c=relaxed/simple;
	bh=PWcx8/Dn+2xQh7F9PERadP/6V3dIclTt9+aSzlSjToc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=FH8uvVQkz/2+saP3xGdTXyt5rbbSfKSvWRsdQVxcRThnHTawLVBMarXPEXQDqpuX47Mz+voa4v9RFj2oAbgV0g9OTxhgIVWEEc3nHXBCXYcLqANKu1P1tgz/7c8pZ9MkIYpWt3+mVc7pIzRndEjmr/XHI2C/GzGlA5YmRlhaN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A267EDF00000BB8; Mon, 8 Jun 2026 16:35:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 5B284E84CEFC4205A5584B854CE328A2
X-SMAIL-UIID: 5B284E84CEFC4205A5584B854CE328A2-20260608-163551
From: Michael Zhang <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v0 7/7] ASoC: dt-bindings: ES8389: Add members about HPF
Date: Mon,  8 Jun 2026 16:35:40 +0800
Message-Id: <20260608083540.12581-8-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260608083540.12581-1-zhangyi@everest-semi.com>
References: <20260608083540.12581-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

From: Zhang Yi <zhangyi@everest-semi.com>

Add members related to HPF

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
index 75ce0bc48904..eb4639f60f09 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -38,6 +38,22 @@ properties:
     description:
       Interface power supply.
 
+  everest,hpfl:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCL.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
+  everest,hpfr:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCR.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
 required:
   - compatible
   - reg
@@ -58,5 +74,7 @@ examples:
         #sound-dai-cells = <0>;
         vddd-supply = <&vdd3v3>;
         vdda-supply = <&vdd3v3>;
+        everest,hpfl = [0a];
+        everest,hpfr = [0a];
       };
     };
-- 
2.54.0.windows.1

