Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353549;
	b=v82LXhAmVLODBKB8bW9bgWqwXJi9pHfCW37YdUDTKfOhMj9RmPmR5gKM9/muLbwCoBzK
	 RV0SHh6AVvZuWsOyoKG0p4rYicayyMxy/p+drerUyJp4oP/02IBEKiAEsDT6tBnfEXdaY
	 oP9YCl76YIIkgqaO7FF0v8d4Mb2mu3aTQgj+zKEGSycJWB+43zvorCcqiKBT7H1FWZZfy
	 YFH/9qIHMgjcHdMdpjazJDIEtK1D1uJx9jBaegc9rvNp4/lidMebftxhZOB9hv2ReW5ZH
	 QK8wQrqjViZlZfVWqMG6aNVI9wfDnx2gsyJrnC/FTH1zxag3j85BYwCUcs/wBzYIz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=kZ/oPHaEuS498S+K3laUphIaYREJggz1noduqjLu0TKPo9ZobYXNydZfoTpCLEgr22XO
	 kbr4+/iGpPyfaIpF/P+rvuVKgWm/KTYmCfZJbLZzg+MeeMZjzMCJFRHlP3s8N5QdC/bgJ
	 kdK68gobVHN21D5CBiLaWZHabj5N6C5DfKoqUMS32lEkBpI8JvxmKtDMMMekwLI3xS+FY
	 sq6Esp0qPCoZ+9JvAcvOJ2loYQnx1+ljydxHvCyoP58zoCCofmIAR9v6q5TQHpiTcdqiB
	 7fhhba2GXBXiNz+w8ty0rXr3iiOQtHs6yepcgSmTZpOJ4zlG6vlh2qyggkrIoBK9KaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7ED606A68A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7ED606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3333064e87.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353547; x=1795958347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=xHbcg6i5DphML4jkCzhbweDh0VvOde0E98etF4ObufaDQjVTr5VMlRA/A3p7fH1jbW
         gw8KgP+5ZIXvPqFxNivlV46WUQmVfM451XW+6KncGJzHE2bK2CleBZxAgKiTb14NKgnj
         tiHH/UdgXZ9vBwACxSLj+P/kbYlcpTdsyBj4l0Xbn7PxletaQUiHbemw/k5lxltJqwLw
         DMWYwr7FCNyjsUc4edtceV5XRjyGzswlwy/X8QK5sgotFJQlQI6zdJxMCJ/4oCNz/LJt
         pWsNo+UXcx1x9VOOvV3oGc5HdnrGTP2fXhn4dGDZcx/aPg6W9F8Bshp2Zlp5qNHael2W
         Rk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353547; x=1795958347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=AxdFOuTM04d+nih1KpU4COY4kGagfdMMUCNudnFl0CRjGTEmMY7mwyMcse0RdE+Jxd
         8xFcQzDNdL+/WI11JKYvfM+GhqfdKIIwUK4tDMZY8je+yi0zmGtgjv6aeDdMdjbZ8ASh
         mbCXhlB72nG2M05x6SpFyeU9fX94ZGQ373/JWUyuMDredx/xK3zMRH8Yvws6FViuFlqM
         g6wc2GfmCVRd49BDLK5LLU6ETE29aii8KkKYLu0cer1gcFPlY6ZrDCk50e20+6fgHxME
         yFW+8Spqu6EJd4c9E1BChA5YTyn74ED3Fi2s6SbPHkrTKwHV40+aIKZ9+9JiWRmKsGIU
         a0kA==
X-Forwarded-Encrypted: i=1; AL+hErHzy+lGL+giTqrsooEKhcWjoulkhJ6pDMo9bnRYwZmCi+v08fnecAhJhCz5EqYsanfl6rY829H7TVNq@vger.kernel.org
X-Gm-Message-State: APuU4Z+iythJnmlYCiuBYB7I6N77mv+BObYXAZO6gGxF9Y4GzSt2OP/b
	DEYt2I4O4usVp1A/m56gzui+WFZrTxlcSlKiQ+bYnRZ/FzmiqtMuX0Qi
X-Gm-Gg: AZFdTZcOL1BFUbTFfAnY11DKMaoVfiD+W2PN+8cZk2GSmaUP2J8fD+7USs1kcQu4YUE
	zmiFn2cu2Hzm4rvpCJ3VmiJZzpe52l8wS2hq1Y9AtrLG+WfH3Yjy8Hu3//DWfEqdvaw2Ar9lPWz
	VhH8/gYOTjHHrNNoP16toUJRb1nbyrlFxp3fsFrDNawuu4SoRRivAUw+Jrz9wNi8xbloNB2EU0D
	/Ss6E6A7xZ85Qgtaw4QUUFd2f56pBUSD3INcFSlltytuVJFFjpyjbme78gHfoR/BnqW7phV+36J
	6hmDvJfIZ/L0m+Kfvcfl2K+kVPFv085U9WyDN+DDFTly7iI87jYuEP/D8BAkjG1Syukx3lWLjhq
	umuJ0YImAmTGR+we/SdIH7N5YmvnGoY6HF3hPgNf0u4sSES0/x2xgsPfrefhDiuR6PVJnG35f2l
	KTkSjHUQaJrdwB1FR0lHH/9PA6+9IWBoAV96bBRpZaTo8KY7X2lbNJcBcrH6hpDsR/2NFELn/gK
	0rbWZLfYOB/BhiMIIYVzcF3cSpEUmsyalnzaVRw6YGJhKdECzJTgTpu9ue4n3nEhj9CeGvcR/9C
	EZ7gf4f8zQEZ6OAublSSam3rWsledQ==
X-Received: by 2002:a05:6512:1042:b0:5c1:606b:ae8f with SMTP id 2adb3069b0e04-5c1bc660882mr2748867e87.7.1795353547092;
        Sun, 22 Nov 2026 05:19:07 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:06 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Sun, 22 Nov 2026 16:18:55 +0300
Message-ID: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +89,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0

