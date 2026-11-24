Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513766;
	b=gYjKhM5kM3nChOmvQp7OgjoTv2vmMUYLLgC7Jo6DUMYjyKziNPyGN4Uony26vfrXaEKM
	 FfQbm50plMEq1qWCs227sABk4CYCAWON3WwPsZ5nGw0Yc77z7WrAC1GHoREKdLH9x4hix
	 RuPFTmSJw8IhCUnIVRB3jKTWUL5OyMbXHHtlW9Shen7IEljUEM4gB6aq4PZAiYl9KQ9D0
	 i/aX04nc1cQwr3djTvdvYiR5uGgq705xEKQHUaMjicOafTwhzN3SHfR6L5mKrzammBsA4
	 W1nrqx5UKYbFWnZC3Xg8LD2KwXGYTovOmaZnjqesh3wYLDLFcpsKiHkos0jn1oQHIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=l43n67eUT2OT16J/R9bTABH3FJ9aqcZpVKqNGZFHdV5E7BFJ1SAYLjoBPSQIc4OfjuOy
	 EQTuiik1yv342rwaTQO1Nyd6IHZKBI+hS/VwGmaqzGNC4EVY7MT+C9uHWPWoQiKRL7CKP
	 ukhCqdoC13o3Dx2h409kq5y8IOoj/UrTeQOKzeYkzgfE4j5sV8eMpg3vwgMPK6r20PvS8
	 02Jg6+ckO5+e4crCnS9NtfNSxNQO8h3fULT5vqTV3ThfuztqxBMo22fRknAqoylYNMdE+
	 la8G7jHlyXxyKd+zSlXXf/+GHTEHCTIQP8XbUGLJbHsWjG7cpaJflvbIB6aw5xwZgrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tARb6/Kb";
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488D606B72E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C488D606B72E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tARb6/Kb
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so33887511fa.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513762; x=1796118562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=tARb6/KbEc1oHqh665ucYNIdzhbedQsMYGAiZ2+yhTVzC1oarcfoj9mv17AoGmvK19
         gGHAXYikpEgSpq9sfxjOFLqgj0HbYSoYC+rc1+idN/tj7kj335oTRcuV1y6dngZ+xPia
         drT2iFui9YbiJNuZnJh/DFzi6OiLh6saRKBaqQlL5djLRgZuLI+vEziKXebZZkfVk4hz
         g/5w+iMiJt9aDWN5usdy5sGd2/iBXLMk7YswiorB1L05epFtEYq7YT0NwungI7tepLaV
         1cThsk230jxtEt0a6ikCSiDuasLrUN2tFRQiz4K8F+sjVG0MUoaeaobDv/D1UEOtUn4y
         8KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513762; x=1796118562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=sJFVTO8SLzdFLoWh4Cgsp8cb9H8/v/ZYdH3YAsn9ge3w5lmecLNvbOR8nMDD6BQRfs
         yoA/XlSsEI7a1nO9mlocezQlmBL+waJ3xWigopPzbEPFKn48Vu0nxL+z1UraMdJixkra
         bMFfDfE/JBPHac/puxs7laihqcb2SLG3xuip3B0bChMyTWHDbiQw4eINmlPFqkTxKzvt
         +oUtVfcD01Yz7KqMuFQkeOC6KwoUJMgnWzvy+9HJg9ZACkJYOGiFQ7wmVCun4Y7+21Iv
         TLPbOy+H77WRQTsn8kLzua9QpMqxFzA30QeykTytX+GY0Q1oiCQyqxyunaIY7I6SAgYO
         +qww==
X-Forwarded-Encrypted: i=1; AL+hErGXTvapvEKjqHx9OwuaEifP+FgCnfQqGUpVkwF0q8BysAIqoabQ9Nrcie3bmJVO9p+GQVnYRhe6UIxb@vger.kernel.org
X-Gm-Message-State: APuU4Z8rwodpjqn3a2sfMFDOI7SY6hP2aaKUjjc6LybNjrIUeeGkgv1U
	qqDIDTj2sgXzAwtZEKIw+0zkQ85IB8HHfqo6KFxm+jV70W04TX01Rr0f
X-Gm-Gg: AZFdTZfa7vpsJIq8ObDcKBXkFiCp2YvjMhWOfFu/0GhAMt1/OMEcueYe6KnMKtlU0oK
	V6BsTOi5xGHbgtfdQ/Cy848AgDNCv9PB02WIc7XaabIAQ4U+lmVcf6CAu2hXy2F6U43bMNzAOkq
	lAk6txfj/5EeOn/ap/fogAWrzQE0SQwhFw+CrdbuGrKRA9M4eYCBC61t/PIAEDt90wQgii2xepA
	zsOQyC98KWC6pWrjGzHQHn/6eyE8iVnbMJBujnppWkrJpDOeNVbKBYfJZnDoRWTAqczvjj3VKjT
	RV7ka1OprD3iUsVnG2yp4j4qzWutnGdbYtnNGc5PdS8nAjviVMtKW5ZgnRP0bljlJGr9ywIINIh
	KjkwoBVOvy3/05yxIhbClGbBabAOK0gaaLnNn8g43+NPv56XRO5INmfOkVg/tgEIXTB5mnWLJ8m
	0hcn81TQSP1fcQbBOmXefz0nn4k8DViegbe2bKkk45XqGsYgyFIH9bLacXD4SOuVAdWLWjFzk8o
	WNJBEnG+w/ilDaxPxqUuJZUQH1/iuyTvWdfGOfwCIkL4iIDRD+rdkKoYl7o2c2K/1rO4VA+JUbG
	L4YsIWs3XkudTP5F6XAzMF36kPNnWRzAxPoQ4FoMj9kjL+I=
X-Received: by 2002:a2e:be26:0:b0:3ae:25c9:f5d1 with SMTP id 38308e7fff4ca-3ae7f9d255cmr38992341fa.11.1795513761797;
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
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
Subject: [PATCH net-next v5 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 24 Nov 2026 12:49:11 +0300
Message-ID: <20261124094914.2993988-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dptel,dap8211r.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..84efee27400e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,31 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
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
@@ -58,5 +80,24 @@ examples:
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

