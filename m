Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762716;
	b=VllvMi8tKh/Cnm7xnwuHB37pLRsF2e7N4DU+ToYweeLrj17LSrJjI8dpBh20TzSt/row
	 XMUijljzebpo54J0IISuEiXuoeGOlgEWgI5OW4vMZNT2xpjKUr3r1LoxT+AoObl9GDadh
	 6pENIb/ygQ+KI+AbvO2A1zgus6DJBab/h3LXvvBOxv5ZNCRQ8vO0M3dAc3zu4iOo5hD7O
	 USY6iouN8rpPDNtifX4G7oixnUYBer/ewRXqNb7z5b12HmiBjRSKZfq2MvDsVaxicuJap
	 Yj5DJjxrEDfyBAZgQIFtrKGnQbPXIuXrATZqdja89XInElBOBtXyqDfiKV8jRli02LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
	b=Ou2k+ifE3SE60V77VET/GTRT72rfd3loYlJKSo5aqpCeFO3li/1a4BwV0CBP+kqa+za4
	 T2e+iSvsiz4LvpiT9zx9J4542ycQo5jc2ExoCnV5qsg1rIPomz7re7rm5tVK7eugVKcSS
	 9Ez98Ng6CAAjRQ0boGuH463s/FqOdCj1Q3HMWycAetEZGWeBENv3Wn+ZKqUuamV2mT/F4
	 r/ZfTV9zGPxp3T8RFSKe46lLNgnfelVZuqnEZI+z5ngZilAR37RjU7dMKUVMIPPDXIhT8
	 uQC1IBs0umOB8yblmkA18BW9e6eBKv2BhAwpggtvbtXyHw5DF/IHMyZwokEYOAehfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=eapHzAaA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1514606A89F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1514606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=eapHzAaA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5312175e9.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762714; x=1795367514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
        b=eapHzAaA6LfdTDi2XpzV2acZajFlvqIjQ8eYwV2+YyTjvOxhSIQWoR81b1lStVRbwx
         VDivTF9kpr+gBFiUJ9QCITDVgWp9wXt6bzacu3lflkaOYVLrKk+S3iAnf0cI7bh9BwS0
         Vd7BXRPIM5zgNmdAl8ihFiuaOPGBzez1olUXci3uYrpY+LQ1afTnYNJJLGQcAy8t0oVs
         xqREWrR5ZIvRhlB0k/Gn6C6+cR5vS3zLU3iVn1/X64A11zRHNJbelS3rvpilRuFJdflm
         D3Uiz/VQ5jLdhQhgu4lPgroNl7gRuXXagwatcHTtGzf7fes83oo2plN7xumo+immm/XQ
         UMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG9+hLmOKOGQqcT30+RWcvcEitQrcTtgZaflUnQk5PM=;
        b=cP0DhZLaSr8S5miyGB7W2awEv5qMDB9kvgXSplwqtICmH7sin/DqghPMoYlDQxtwHx
         Hs5fHxj1b/LmiQXZHQ/hOhklH8kGKgFV1+tT/xsi4tikRjaKu6ViZTvES7qy0u2whNKm
         9kBrYLv9KeuWb/vss0Aa+bmWoPXeDGlLk0hHv2FaAsE87Upgg5diSdVC4QgJFK8cj2rc
         2yy/wZkh9EuaP7pRstJfdF4LOTswhTJqu4lk1jZP1I1g6AL32AWh5pHmyoZ4V+uwnKOs
         B2Qb4+6ky2zKEzGftJqiX0Jh//6p676SsH7qQ90dr6w1DRsii8hJdjwYOSJZK2NIgUlP
         e/xw==
X-Forwarded-Encrypted: i=1; AL+hErEreTIAN0czHVLX0MQQShd40IRn/3PjsYdWW72VkXLUOAM+GU54mkVygHRlrpVlEQoTT0Rla160rNbT@vger.kernel.org
X-Gm-Message-State: APuU4Z8W/j06+4Hv1LwLUSUpkqeSJmxu0vLqhE4YB++f0va7NqM2qjkA
	MJHhE4sKmix4e8fHsa2KcbGsuJ9LTh8w7hwqPsR37oCWz66Od0O6hx5Z0Ax6EFs105I=
X-Gm-Gg: AYBFou25drnK0o5LJ+RF+sVaXksGdaA6OYlnRfhm4Re5E5ZQA2CzgTUk02ePzkqHCrn
	ENJbMiDDkbh7/qTxw9YcgWQpI/WwR4WKxgucSaUW/6BY9IocKbgZ7aD+a5V/JFvyv0Pt4n0Sjoq
	Uddp3updehse+U1GM7dFFVbz50e3Jwo5gG9OGJvQZMZCopbju96txH2LP/9y/QtDMonSGHIluJE
	N4KKdfVpaPBXQHdkbfkK4HA+CB8YZOa4d3JE4YDlOKX6Ch5YRYZtQqo+l9t8ctiYcUOp+jzw6e4
	T6iiSnsg8fHixf3at/uT6AtYFIxbgi/UYkNnEE26HSSLshXlw8JhlGxEqNz36LZ40Ur4oWyYbTD
	BUvGwUj30S/q+vI/4p5h462YYKSx3wXO4YpVcSlnfcV54VMy7VAABFWb5tCG9gbM4f3+XEtw7vL
	fU2zHBio2t3NcIDBAQIYshKu9pvy0SWPz8U+nLOaO9m+MovIFYhBiT+vgdOMsIb6CEx439I/beM
	g3sl0lcnl1Zt/4J0W7K9mwQNdtWHT+TXPHTMx14uM6gVi584w7h7UpRrNzqQlwlfKTlfuXtpsk9
	tczGJC8tivVyOYq/9HdunqPJk7VnNwNtxWNzUuK5MiC3gab4JBYB66TV7c42/Q==
X-Received: by 2002:a05:600c:3e10:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb6651a042mr80157395e9.14.1794762714298;
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171150.64431-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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

The AXP2101's USB power supply reports whether VBUS is present and the
input current limit, like the AXP717's; its registers differ, so it gets
its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../supply/x-powers,axp20x-usb-power-supply.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 2ec036405ae4..439b3ea6a7f5 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -25,6 +25,7 @@ properties:
           - x-powers,axp223-usb-power-supply
           - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
+          - x-powers,axp2101-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
@@ -101,4 +102,15 @@ allOf:
           enum: [100000, 500000, 900000, 1500000, 2000000, 2500000,
                  3000000, 3500000, 4000000]
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp2101-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [100000, 500000, 900000, 1000000, 1500000, 2000000]
+
 additionalProperties: false
-- 
2.39.5

