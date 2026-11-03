Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723840;
	b=TUJZclegqMPiFZ7deb9SW+iM5z8GTMyPHzJPj1lpucZgOBRLVnuzXCoQCQjgMlMEGeix
	 Mob4f1USLKxkvzu9Zby4H6LrYFmgZwM/MUPaNfnou+3QvWKqXCXrCE9DzeQx+Z3ykq38S
	 BNiVlQDm3UEFid0Gvd790ZaDzGXG0gR57jjhlfAyPX6c+Fo/AcwzxbZJsa1JvqwBuGgpp
	 A2Pf/EZ4GawO015nap/Jb9wx9604B95vVMLWRZ35a6OVRNQrdp3Y7FDjWLUaBxef6QA4t
	 vt1ief6UsMB1F6LLSTQE0L90QnLRk09M8fHxmhC0dsXBsZrn/IiKdNZfzso4j8aRm4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723840;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
	b=3RgL1eH5m9bEAuwh11q6aUaGfnLJ//B7ywQVPn/X2xlBgzTwvCnQuEu9TPcmbdNLqE7A
	 Fud94ejh8MI4gW3JMcSY78f/Io6LzUgneeHOrjPtxrGxNOhMB2t5cTi0Lj9U9FdgCNfNx
	 0FuJ9z05VveWKlTkOpFJvEZ2JtP2LORbMPn+Q5CYM/UxGXpiUGWhK7XTOaO66y7KFlvrh
	 IGptF6DD8iy4XbcmEnzXpV7OUytLViCYrTOGgoQt2rMTYk7xLdfuGvj4kLsmvV7feMdF9
	 tknJEGzooJX6HVuN4rUgRg9YvQcMc3OhXxFwJ8AQfbrQvIgMOP2HYhLTZjLX0572twA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35740606D807
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35740606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759902f8f.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=mFrRy/ekS7rRAVAJsN0u+5FgyvwilbVOiMB3KavUKgX+rlEwYsNPq0a09m6v4xn74d
         OSgxOl8rMu0NUR+iChq/NrsD6Wu3ZN6W6alA/7BTOT2EGemeI/HMVZOMt5fTEB9Gw57s
         gqfBITdcrwKMUSss+5PbOO2UhUL2bY+N7Kbk1rOcq2dcNIRSJpi7Tyj3w1+XKaAnyo2a
         ruGJaiMtKBtdpjiDZPTQC5fwf1+W/MfD3XFRn0AfvZwuiqh4AT6e1beBZ/fQAzSLL+q6
         xpxBVU3QdTvrUMzExRTdkmIpu0BXENxtT5Wux3UUxU4HCMTFBhyHOrrmKpdz6xN5TPJ9
         bQ8g==
X-Forwarded-Encrypted: i=1; AKwUvByJFv7P5OCePBqITiLLhS7atQXQd19ze+ii2tqQDmJDCUfn1Uy4yA5uL9sTCYHhsf5rzqWoIpF9EZFP@vger.kernel.org
X-Gm-Message-State: APuU4Z9K7Ny1MIPAC+SFg8yKXrUWQbmM71Ptc6ZemJlxUjz6eBVl/IoR
	IEzRj6n9Vc3R7zRxUR8R4mt6t1hpaRZxiiA3qD3dYrp3jElbD1QhG7tH
X-Gm-Gg: AYBFou3SehALcGbUA//X+rbVZGndO7aKm2mZ+DKQo0Nhic/oioDpGKTZ8k7XFTP3Yv9
	BD83hVPQvc5wpVRnd8/u0qTdJhUypVV9hjZaMp35qKpagN0giKlgANITDdNdV2FCiyIAvyTRmcx
	9CxjMBR1GtBYmVMOjmV5G7yy9FPWQZLixFQoS78Ij9+8xQjq0H5QP8xf/9EYYf4CJFyPopR4wjr
	CPlpLv0Wjbh+bv4Iiz9MTDsGa8HMoU5MqocZ545zt2JxEFaj+gX4FPbksiByQzUSHtzrqF8yfbf
	sj2g/y2OcGFrDe2tDHxDu99Nj4xb99PEFNUTqjDGd/v/UqJHb2JCDSiVH7Mky6AJRk+KzY6k6LP
	RYpYiDX7Au6b0DyiVDWz5Uzn/jmctVS+BXANpiJ2XXUeMOfM+81Hm9yGoQNhLuILoYzvKN+0muN
	QzAL2COtIDhmZy0VZ49xMowrLgKfxLMn5Qh6ykAH9IgnP4HOtx02nzy4w+Z2GIS5PQn4DqQXH+L
	wQ7gBrcjyqr+pKpnJTmAK/D9HgiCFNnh2K58waB0sduq/ru+wrUZZDyjUo+Pub7L/qlFsJ4ZpSh
	IGpsDgTg8SsRd50dU/K+MKdru2VDjhDgOo/Bpb+PULxVH3oqsWUYI1vy5kjKv6M+6sgL4T/71L+
	jWeNJo8MdvC1B/evrmCOSM5K4JRNJn5hIuLc5zCP+7ZXHVX4=
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-48e76ab7f04mr25543431f8f.15.1793723838237;
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Tue,  3 Nov 2026 16:37:09 +0000
Message-ID: <20261103163715.385394-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0

