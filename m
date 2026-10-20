Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489028;
	b=REewbAXNJLuRFODxSrZgql5hdC71dBhjLqMCUv3ZGzjdYv9cib7wTGb1QskAdElb0haP
	 K57zkLZqUspVlhVb01EvX50JdpUa0k9g0FDblXucuo/VHrw3RxYKN2lqZtYDBWrwqy+W0
	 ++Vje3TsQ/IYRLzcYksVd9z9busvoD03b3WENj6nJZ23GQbFFij1mAyp4Z2cuevqlGfGV
	 UPfwsHkIfmv0DPlZ9IP3pxu2+U9W3deoFz5Lc8z/H3k1gr/08a8LT4v8MDWrtZgxYjfdI
	 C8CM8vMobpkELixVosvvaQB6jlOrPwl+BvQ18GjTnFpwIliYDLyqVPHs60R7KwrjjjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
	b=lwLJXgaX4W7RwiSRoA81RvJ2sb9I5ogHnkDt575ECDM6Q8SBpkHglhAROItxsHelqp43
	 7mPIVydgfUBRcwBb4IMQgN+9bTY1CdXJW42lXGgAZ/Z5bOEttippg9s1fDtStnZeL7JLg
	 uMsSm0z7vpb2P2Kdh7lwjq4F3IXLRaVfG1NgQ3m0Xhw5Us5ktqk/qm5SVySmYGFm+h7eZ
	 Au8j1KezsoXl0lgdSdtSXcESx4xPid4nebMx+ASoZEZqqw+gw+U0DeNCXKWvDUKFyurSY
	 nDxJf60r2n+WkzSprSCwlWJ0dj+Hm7kK4CsE+ZnvHZa0Mot7laDJZr0GnNrCTQze2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v9e42P2A;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E6606A329
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82E6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v9e42P2A
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so293749866b.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489026; x=1793093826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
        b=v9e42P2ASSkihNC4YkrSR/E/sDVt0s2qV/m+O0r7dcErfSBASUbr8PPAvzNF8sIi8W
         tPcYDtC6my00/uciLmWKAehRS+R0yx8WtjBUIT6HmafA4G86s7RbbCNaeNqq/N/sUg/6
         4efkr9P/9ImAyEl+vDVR6JQIQy4Pe0Si6zs9TsnVsCnhbO4Pvvj+TNqtVU3OfElnx7ap
         xIEx0m0OEYj/7QqqFHrx7TWq/6ez1y7NOiu1HF9diNhOQficqQG3/r6ySMMCY+3Te8k8
         TZhj1ZT8OCglQyBklN7DIv5+TmvxgftBXRo8WJHQxb0V+31jn9q3RrWH2sNx5oh9lo79
         9e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489026; x=1793093826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
        b=LNTmjefO1VCzJLYfP1cauQksn/TebnPZ94Pe6+iT1+VF9cq+Vk8RijFVold4OHUg1x
         CAOcJynz499UpKConTWgp//4vOk8+Yg66dgkOnSzJ0CbZ+iR6jKJFi9cpNaog6+GeTmj
         GvtKdM+wHkUP9HLsEJHl8fo0UnShPG2AnB+MNjx/V8MHalKR+if2MapYJQ1E6oM1MeBg
         jq9XtRVxh3TKkPzW5MZpYey2l9ZRjf9lC/6JVpV2Ua0ZH7ueJ2YYEwhCCxU6NAOIFa38
         nKpduGo6TIT9qL/SUthmIWYcc1xeCVJ2KXIniJPPYBZ/snKOGmypSpnzdccD+kNwIt9f
         zK1A==
X-Forwarded-Encrypted: i=1; AKwUvBzrONRPsK1qSERjlAzQ5uia4R23sP07K9mLCkcW1+3Wxdf318TagNrQhYajqtthkziFZn2kvZmIyLRV@vger.kernel.org
X-Gm-Message-State: AFq9FYLgO6hj/Z94qtlxh+cljlOKG26JSdaLJOk46vSyaZUnBSCtxT6S
	5n55vjCnIr8X+yjSo95uMdWXaGXRmbVYm0DLKbQbQ3yYATgNOMvJLD2Rk8j7u0WoxGc=
X-Gm-Gg: AYBFou1IE1N9kTDISSLfC9zfv00KLynVHQ6527e6lal+M9dQWxuptgJC2L1hb7RULEv
	XFNHXZ9mFJ1x88dPn7in73NVVRfXHULaNxbTIIU0eD+44/ZrD7ctM0bYd84LkSX7TU+UhtsKNlT
	uoJslRu4eGhirPlyPh25hQnBHQco+bnz6FL0AUI9sPmkFGKdgKSUbsBKuRGYMi6LzRcy2bC2P4l
	+slwX7phoVYdcs6+Kkt0W9EYNMyFOK6JUg0uBBCU9JppI/q4ZlsPEYrkWj/dq6fc8jqcXMdpMsj
	9tUtHrg0yaUYJfgDk4GPbLBf3hrw4L1BUdg6ITaXlEXFlVeUUUn21KWm/9LIvMdCGGSWvscHq+A
	PhkMyKKonjzn3quaXyjNA4hr4O4k7ev6U65gwa2Pfv49elQ37j8qNoXXoKuHzIjEnN4NbmakXtp
	j4AXCgfIeVlzkcvNxyqz8h5XCAiXtxTcua65U4zYE8sFfxE8L3yaJF5o6RojhdX+9CZL3wHa6TY
	3LaWzfW7vVBO1t0rZTJtX21aNVKX4tGqvOC4Zn7v2xdfIzeym1VkKJ/yTH1dc3Ouszc+PmimJ/E
	xlvV3yM7F8zts8aSpZkMJzJWzD1EoPlgyFMDcHCBIVqLwg==
X-Received: by 2002:a17:907:3e83:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c466a504adamr73352366b.39.1792489026177;
        Tue, 20 Oct 2026 02:37:06 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:05 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 1/5] dt-bindings: net: maxlinear: add MxL86211C VDDP supply
Date: Tue, 20 Oct 2026 11:35:34 +0200
Message-ID: <20261020093655.344585-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
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

Describe the optional VDDP supply used by the MxL86211C PHY. Its
voltage determines whether the MDIO, MDC, and MDINT pads use 1.8 V or
3.3 V.

Existing device trees do not describe the supply and rely on the hardware
reset default. Keep the property optional to preserve their compatibility.

Select the MxL86211C PHY ID and nodes using the existing MaxLinear
broken-interrupt property, so this binding is checked during normal DT
validation. Restrict the new supply property to the MxL86211C with the
compatible conditional.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Make VDDP optional for existing device trees.
- Select MxL86211C nodes and nodes using the legacy MaxLinear property.
- Replace the empty then branch with a negated compatible condition.

Changes in v2:
- Model VDDP as a supply instead of a regulator provider.
- Select the schema for the MxL86211C PHY ID.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..53f430e121510 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -10,10 +10,37 @@ maintainers:
   - Andrew Lunn <andrew@lunn.ch>
   - Michael Walle <michael@walle.cc>
 
+select:
+  anyOf:
+    - properties:
+        compatible:
+          contains:
+            const: ethernet-phy-idc133.5400
+      required:
+        - compatible
+    - required:
+        - maxlinear,use-broken-interrupts
+
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ethernet-phy-idc133.5400
+        required:
+          - compatible
+    then:
+      properties:
+        vddp-supply: false
 
 properties:
+  vddp-supply:
+    description: |
+      Optional regulator supplying the VDDP pin. Its voltage configures the
+      MDIO, MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -45,4 +72,25 @@ examples:
         };
     };
 
+  - |
+    vddp: regulator-vddp {
+        compatible = "regulator-fixed";
+        regulator-name = "vddp";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+    };
+
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc133.5400",
+                         "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+            vddp-supply = <&vddp>;
+
+        };
+    };
+
 ...
-- 
2.56.0

