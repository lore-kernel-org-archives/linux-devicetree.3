Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915884;
	b=ZL1VRBK+pG3GAZWSW5MITLmXNzx6NSj6W433MSgAqe/kf5a5HJKJXxUxi4SEaMjxm/z6
	 tPVo4Q1MCZzxMD5LkSbq2SkxCyzO+S8nBV9ZZlN6wdo8Hg90yW+cx+tr0YAJ41RWUGKGj
	 AAqymMMvu+U04Jg97YRB26QwaL70+Ojb7y1APsJkwLd3JYXS5JnwIHM5/OeU+V6qFR9QI
	 34hQOSkGE2Po1DNPj8I8rJCCf0pqeqte7yehh8FHM15Q58qMXnz0wN8qCA9z8EPqyEO+u
	 MQdlSZ5xmPORiKum7hnRb0E5600SM+5TAYpRro7hGK2gHq/cG/m9cNxLIJM3/hjEGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=ZIqkjisnZRDQsO323XFpH+gOrp+SBHDK08fRhWJPYmA1R0FOFDaSZZn+Rs6kK1mzt6Q4
	 YKKTw9E5Ps4pUgfokMCM1JHreYudihqlf5FQ3I6ODs7t/3eg8JpXxWOcGnVRciXf8dplF
	 txYSMMOoPhRJImuCFrvJbqVzviXYtymT+UMF6qaZl366OW/4r00TJzqlheNm12Et58sFe
	 mZr+7E2z5Zi1bl++YACI9qG55ZJLVkWOdCKgbxQDViPmHy+tGGQdn+EbwuUh2Cx4D+5df
	 SumoDjZgZofZJxPH/JAKM3decjbYG/BzdJoOlHPJPhF19n4Z0gm4w/5y6zl1vNTrhTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85D606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C85D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso449571e87.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915882; x=1795520682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=teAlEZjBHBOFG30c6jnESNVtx0dR+W7j/m6jBabIrj9T8QM78LmH+y7T2ZjbwACBR/
         WUxAffwVO+DBtGlcW9ZJ/66HIB5qLhaz/QUhllkd9YwUFFfbthoSp1PFjOph/4GyPzJ3
         GL+/yXmsuQ06TfLgAfx9pQDO4Z6bGTSmHIVWKpsLb9yj23esozVAB4Xul8AjWSkoAPJd
         HF7Pa8dlJrlKuzEdopGxYz5h+rd2MGyULvgM176kJ9fEHnPW2yVopR6q/472n72vsgYb
         UPkf+rH5dLC5jYST74IqM67p3DuZXARFVl0ztSL75fOOKOPSj+vNrBbo8pCOnxNpQP1S
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915882; x=1795520682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=qtXjEattqV3M5LhjwjVy6LrmSRMPdibWT6Z8pnsSruxp+BpvQWVafGCmXn9lqZNubJ
         PivbdNEXkbeaMf1v8KPfNibDoo6yrgedP7kPqFShcZLBteaINcUac5+CfCcVWyJ/3L/p
         FIzyhoKIqGWZgTMer4t7BVURiQKO5RC/vf9fTt6IcZ/tmiY6Q9zFCMRLIMQbSo+uI0u+
         t8Cc03MYlBUeL40zx+gVXGiPhHLXHPvJdcQfod0bNQRl95/DSt+eYaBuTixM3V2l2HJB
         J72xMhjh5yQ7X6XQeEDE2UorQfyVbgNeDQM8vb5GQl6R/VrZG7MOBg1PIdIPeC4KR+m6
         tzhQ==
X-Forwarded-Encrypted: i=1; AL+hErGwdFfs5sLbAmVB7DdJt9aqUw1F/3waM/T8s4/j8ibIAMjt6mqpwGqWzxYLxBewfvdgOoQRna4JfkmV@vger.kernel.org
X-Gm-Message-State: APuU4Z+ddFXrF9duXQJQz7FMmEpACKZmBFQQisrwdl4kg8zX2XlhoWDX
	sm0L6C2BR9qMTTp83AVhgEj2hR/7RPYyPFJ9dHjCvQvb41CPGKAA+FbB
X-Gm-Gg: AYBFou2K4mLN20Hjdv5SOOkujTTMQP71Z30BF5sM6BW9uop+b4Ej7C9+FEl2CkevjVJ
	CnBs7G05Xnag4qN6gOzoQlroCf8qHyNiyMw5NG+/K9fEUn60VgiMWbKF5/oROaTeVch6TtQ6Yih
	4tWpiGzebQ0SFIllm9sGs9S8Ls5DSNa9iuHsljBvyq6PZEQK8tXEmds5CJmPbR1K1WLdl1As99w
	zFHvXOXr3BMQnqFiVPKMKVJnVsQzkyPBRqVq3H94VMtIwUNM2R/mzokvAru1Qj4zowuKWFgV2Zz
	bezHKXHPi+ZX2H7w0sIF92sM36+VaGbGx4JslQUMwZAfsOch+LcPED6SLw2BsCI+b+CPYRh+ErU
	KVPuU37oQ6wH3cdbu3r11fmI39mirX8tv5NW6wx6+tV2MYL+Nb8xUa2RC4RQq9Sjh6ckj6WTEqb
	AaGD5ZR6Idowb830QqtMgWWX4vhnYtQcHgA1rO9kxYRCwYB1wUrIHkYZYcwSVDKgivWmCFe0bY4
	e7TM62d043TzFhSMZ3MXj7gVu9R90GBJM+bJ40fvqguoeVmTJ7/TAT2Fr6bcOiWhs/Q++PCXh3A
	r6pOhamRNzA4X7QyjzXs53ny9LMmy7WyKY9s10DjQLYh7Go=
X-Received: by 2002:a05:6512:1103:b0:5bf:f7e7:85eb with SMTP id 2adb3069b0e04-5c17077ff45mr4913190e87.21.1794915882295;
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
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
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 17 Nov 2026 14:44:28 +0300
Message-ID: <20261117114432.2794961-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

