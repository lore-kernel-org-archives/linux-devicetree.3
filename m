Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567954;
	b=q3Tt0RQ1vAZ3ZFJJl7Mcrjoa9DfvrQO03GwEX73sivW2xxssznCKQdaaC7r1iTOG4wHX
	 whWxJtyXDUCyzkSzqse0220/ZN0AJgubG5ETTRQ3Qb3wfgrwbKAFeMpxZaW297Y4mtCuC
	 SBzf67CqmmHMGyfGIxdVmBMrJLzVGKNRQHDfSLDe16ULeWOR6P4mRd4l9G9me8DJJLA7e
	 I5eSWeAvDPt2oe+o1h36WSlzXqrNnE8ccBUff8sLWo4CdoDAQij+bPA/JtY/xhJDnU7SO
	 gf2vBhyoLvZzDgfPg/KSe0fhe62TTCb84fYZ3mty3WAVx7IQLbAFq7olavzGno600Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
	b=qLlUHmlqPvlyc0Aw6FcGgHF54ReGONOdtkG1jrLwC0TRQvwbwLighxNGP37jFKvtyhjJ
	 XT1CwJuGTzK1UPoRw3G9+XNfp1fDMHbtt/8UK51xYUMIFzL1NQiNLiiWHoXUVnRIpddkX
	 scBIgVOwrjVHH/TOcd6al9kirrYjgBBpUy2ZokL1tFB+uXbcE3d5MfowFkcro6evLrQY3
	 Zm+nB8IWoQcJEH3/kPw7/AYB2Bu8d2/2JVozqg0PzSoC8ivyCaSuWH+7VSbgabNMgFjOp
	 GjOVF7HlD2yLh7wzXmy/D5cGiOtC5ai2Zo3IUJ05VTVuxdByOJiNJcY7YWAMqbtYIBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09D606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D09D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c15956ce07so1880085e87.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567953; x=1795172753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=BvggJcHFAroFul6B/s8V05DSEmo3NTfrJpxWfO+JxblHI8WNlizqIMLtiemMX2fH0v
         7tiNn7t3OUH8KBcRvGsku4+AQMCHOI+ZMBiovaswKSQoTqKumgQYkWHk+Inze5S+Xzd9
         Pm82LolSRrWxcFEsIkwfU2m+kpThTQr+VRWFs2OG1xn7qcQriUV+hqJC5/t3xyMMvkTr
         6kOMWDYyAozsAUZ9tnZR6dhhFK/SHb0BcO01dQGc+cgYdet0l8zoKVKEDGlTGUafIsf3
         MCfEqpkvBbO+URvD/Fca5/dzu0kJvu+4wq5M+bji1hcH/Tvvi3rfXT2jcdoFbyrwGXY6
         0dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567953; x=1795172753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=f1Y2RBGUJVLGBSxkYFBVx7B1QM20IyrnufBIByxhY1A+Gd7w5AUZJFsITBhNiGuSoK
         NXOUbg/e13H9hc+rhwB2rTLt+ZNYKmHzdST/U0jTPmZz7cpoImiA3eAq0eHnA+LOAQTo
         rWLsf0XDquzm4LlrIx61iLLjGb5+V9KLmXPejELwWJaeJ0vhrnxgZwZRywD/GMW75V/U
         wI/Qfejorp/uhv2hhDcs8fyGE32AJF7BvFzWsPLHXUbTyCRwlG8n0/0VrxA6/uc4fN7B
         pk9Yae1SvvsvBAqLYVqydQh53OcUKwCc1X2rP4UyJD0ZnCm+rjCnk8Q/zMIUwkbmbTNj
         K+qA==
X-Forwarded-Encrypted: i=1; AL+hErGPX4bn9Donjw5cWXq9EruXsaQMczwKrR6dKeB2PhC7PW8lkNBzCXX3UO8lGV/u4QSP4T5W814WJoXo@vger.kernel.org
X-Gm-Message-State: APuU4Z/k/rpLvovL3eYVNQEZextSOcUs1SOuuE3wkyNVmWqYoRE2GC8I
	pXFazVzvsMrPf6nRCdYyo0TLHKPBlhwJw4vVy7wkQMjrr4kUC+eCBlDb
X-Gm-Gg: AYBFou05ZfwuAGeMSgsd4eNpct+hDMd7aDq5JKnGpHDJDviP4M/409Dzvnl6rlWAKYd
	xNh0QS/nLGtLeUHQAWkm4RCogNmyOVmV2vbcSYuf2YmPl+uc2b3xjG5dqQasGLVKkR3sy2sFu+y
	NpzKtAOgwKlGq0TvfdLNmjxbsVSOqlNX+IW6Ngy6MwZnHBflVk7XezV7AXXJPPLfuS1eYXThz0a
	pX1rAQKYm1wX65KjfCUKb4oi0RBK+PP+RgTfygOJ0kl7IPHTamxrh6h8E6VFP+/Fg1DvqQgn1Qz
	d74Or4KXQtUUS9vMHWLyP7Tg/AfG9bhdg0qn7ZqVZMQbC4R3ghCRieOhhKQbksy1jgbidxGRJ7I
	GSkBCnxvNwEj4PcR72ICwD6SHU255g+TNsqB/9Agsk06hQ2qMI8UthtI5dig/0LR52DEB2qUKC1
	wFn+PneCQQqKzzo0nJrXne0fnkypGZelFw0st8fnoKaq6bcHfuHHDSwGrQ+qdFwT5DAlKq9cFSH
	O6HuOdKi+dUqHJ8DsaSjtyOFh5zGyx14VxUwDASQjIk0pju9EQ7iQTALkLtrR+SddfjbtR6lZQ8
	C5VwNHPqVMz25LE82X2MRSubHmdelyo4z9Kp47EYmCdLPmzK9MqWUsD1QwQlbIQkr0on
X-Received: by 2002:a05:6512:3c9f:b0:5c1:56f6:2e78 with SMTP id 2adb3069b0e04-5c170b36c01mr760155e87.24.1794567952545;
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
Date: Fri, 13 Nov 2026 14:05:43 +0300
Message-ID: <20261113110546.173624-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the dap8211r phy.

The phy exposes three configurable led outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..43425fc8e96e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -28,6 +29,22 @@ properties:
   compatible:
     const: ethernet-phy-id0008.011b
 
+  leds:
+    type: object
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        properties:
+          reg:
+            maxItems: 1
+        required:
+          - reg
+        additionalProperties: true
+
   reg:
     maxItems: 1
 
@@ -49,6 +66,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +77,24 @@ examples:
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

