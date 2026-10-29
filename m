Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309135;
	b=cC8M7P2AOObLrF4rMco2niIXvgYPf84amFacayhd3B0RFzYk8WtmBTORInFXXYjUHWAK
	 WGCvUuGfHQL818E6s7GdZ4cQsNYgs/rU8QU4EdhXktIfU83a6DQI7twP3Yg5ZT4jW9PdS
	 guCWVZDMSoLTUSvAu3LuqS61cYJlOJYZDmvOfNeWbIXfCAJK9x4nOkY5QzDTl+fmicrX8
	 v/OMpMKnP+cGyhiT5Rpj0RoKlhyf9E8Ag3qnUXqD2wJtXVJtYJP60uTwJ4ZNHNSHP+fXd
	 17BB32dBX8FquJtuF+JyGKGysC9CcUmrw79Fajfnhfqr/oGuMF3APTAr8u8mpqTPQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309135;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
	b=YedD0oFbKcFLINCMGn1VVEQdakkbc3wdiL/1bO+bBWQz0Uj8Jpu7sIlAayFQQ8b3CJhf
	 PpqWJPB0dzERTTN5Fg4IhhIlLbwYEwQLmt11dqemnQoSlnii+12skROKSYnShDF23/IwZ
	 hAAAPa00yTbxAluaR9aUWROmFXrx+4QIf88IgSDdFR2ve+YvMcGtjFzhIlrG/G7aY0ZeP
	 ycinHDioZx0n+4V409ReLgC1mqPrZ6+vorK0/+bfyUbfQNYkoB2FGeGheA/kaHCYpN1xA
	 towg2clPM3Y3BniX9GiRqVtVBUdGSWjttbZ0uxJE8zuOs2uQo4yEtrBXjAQ2pCtj6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esZ3xhWL;
	arc=none smtp.remote-ip=209.85.219.98
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FF606A334
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851FF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esZ3xhWL
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-91c7b00a75fso783866d6.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309134; x=1793913934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=o3rMdPJoG7vsSgHbTh35SGszHBrbUsHOZndPxueyt26I+cAj+JmvtenwRj7X+xnDVk
         3HqlzD9Pjrb016HA3bP0Bq9yjrreDrRELLQtuPWmcZ+FcwJ8B7kRyI7KtJV+nCHscT7/
         FxI3oKpTidD9xh+sSvNWlck8XATdBaChJIZ1lg39MVBP4AM8zDy1Pxrh3+T8xnwKedhT
         z/LnBA60r9IyKIuHz4dNngbqbIvT5J/o/qv4kijki9OPhjXugNNnz+s6BnilpyMLfzvd
         W9YKfLXpESxz69N72oCK57ta2L6/UZsR1H7dgtSfRe2Oi1C+7P1//vmQOnbl+8nvlE2S
         sJzA==
X-Forwarded-Encrypted: i=1; AKwUvBy1wDsVpj+FVwojt+zl3w7YwwU4fpEXtP4X8weLgUJomzMJLhLguG5hSbb+TbVAoOi5N3iPa4pUjPya@vger.kernel.org
X-Gm-Message-State: AFq9FYJCnM0SJyiwcj2XvnKV1ta6h05WbqGR6PSr9zt9CBE1/6zh0ln0
	O9AzKw0HJh0i0F9Sw7fgSUJC2ofdCAObkFX2wkM21W7Ge/S0Pv0Bz3RDbw6b1o68/3ipWcDFctR
	aMghvfNr5sAsa9NOwSyByoXh5ueE+5i6rbuXzybyo3ElRKxbzHZOhMZIuHFgjx4zBR44vsV28O5
	FPl8TRyjarGs2off2rVYwsX/ruqlxMO5/OdiwaGtvScOcf7xlnqo+Y1IjkCKrF723y/WfvQOyhQ
	BRY7QR0r0HcBN3gbMiePVUN
X-Gm-Gg: AYBFou0KgioEGV3ia6cAb/o4iy1ZiPW1AGRqDD2iR2Mu8/4SKPhVACwthboWevxcKok
	2flYZ307acBkNBz/N/HxUzY6YXaL2aowcuyhzgE/FbgmC/GAmF8vLYZHSfXuWCvJ54HGe8AVHar
	ban47KfTWW0dNzmSQNj74c/afAzd8prjnysjPfLNWi4ZOzZ4BxR2KqfU/+nVcsd6djto73dCAVZ
	Zr5FasF84fQnoqYF+Nu79YcW4k8TbmaiuMIPMfGkoZFA9oNN2lJvzuzW12HN1VH7Y6oBUBIPVDq
	3TVSZyRMB8m8XMxE32zr4z+mqWbSat1Guph8nTWoJYhgtI8S7aJmTqqreM3m2Zr05mHFIvOD8BR
	PUlc9/o/Cz8Y5X9VeXTiLUE0ZTGCwBQV94fAV1qpQQav9QQcH4KJ/CH/WPXtsZNZPP3DqDhtKba
	QEBfm5hdAePgzEsGHtQrlOPuIYBWdSEQ/00Igpu15Q
X-Received: by 2002:a05:620a:2a04:b0:93c:735c:2477 with SMTP id af79cd13be357-94421744f36mr86678785a.21.1793309134480;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94421202296sm6060585a.3.2026.10.29.14.25.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so543902485a.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309133; x=1793913933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=esZ3xhWL7eCwboTrxJ5JgLLXbb4w/M8uCzpVTDIx0W9WWnl/8Ed0rsqXublHWpo55W
         HstwpmByDyFZFiWPmndd3U/y4G9EsFGeFbizP7Vv8W1FPcLQ2ebbhPCi4CR2Cm5gHvlA
         xCqK/QDd6x66y0ZN+AvhvXhcjJU5Wt3AXNPYI=
X-Forwarded-Encrypted: i=1; AKwUvBx/I/Xwtu2P5Ed1tPB0h1j+19UBjsxvqBWo8aQ+RrJnYsF/4ujr8BpqjTZeIBWQ3RzlyPIex2OnCPge@vger.kernel.org
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65352685a.76.1793309133078;
        Thu, 29 Oct 2026 14:25:33 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65332385a.76.1793309129450;
        Thu, 29 Oct 2026 14:25:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Thu, 29 Oct 2026 14:25:09 -0700
Message-ID: <20261029212513.4126083-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..9a48f7e36fcd 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Florian Fainelli <f.fainelli@gmail.com>
 
-allOf:
-  - $ref: ahci-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -30,32 +27,19 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm7216-ahci
-          - brcm,bcm63138-ahci
-then:
-  properties:
-    resets:
-      maxItems: 1
-    reset-names:
-      enum:
-        - rescal
-        - ahci
-
 required:
   - compatible
   - reg
@@ -63,6 +47,39 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm7216-ahci
+              - brcm,bcm63138-ahci
+    then:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          enum:
+            - rescal
+            - ahci
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

