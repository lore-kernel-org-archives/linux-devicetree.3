Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572336;
	b=kNuvLCIuUDlShylid8Emanvnd02kwkdx0D32pMpDmEum9TufOIhzFOv5ggEojRR0zEGz
	 7SXzdLWEO6cBkcjk530QaLpSNlZMhDJsURR+81DGhfCCScmHTskxCWZbnpWOg3cIk9NsF
	 wQ17OgQLDRlVvsSRDmHcrs27wnNK1/8B+a4629R7Eq5UUntWO5wPGBNvctMjskPctWV+G
	 V9JTJSKDkDjTbjJme80wHsrBBDBnOrFpPGUvaIl2i8Io4AmXYyts7SSYNEYcGNZsPQKe8
	 xQcGENaoXrCmiQYtllTmZxJtkfbRqC3qVz0klgkDwIzsaElAGPv7I4V3jZT76Xe8UGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
	b=NHllS/bGrkjIbf0HXTwj133RieecqqAytIMkaI1SXx7EbJPjgHhdGzWn4/JmcJh+9bz4
	 9CPoU3BgIrKsXyxvH+o8pAr5ODgzNNOG/Xw1GURMSPzMSrgX7SLO8ImFV4jLWwmf+wGu+
	 B7WPSUx64184f7GpogxOTNTymf9xbpqTIUV9hdUaSWZQdbAcd/3Qy776+TzmcJ6lxY5Hx
	 qUX/8Ft3lzlWvp0xivG9E/FQBFlJkqB9tdfrNyXfINe0XC+q2cCKouH3D2sb03ljFOkoq
	 3q8P+sZ5vTtllg2slrO2BzEiWABGYFnVIFJwQi1xRykUWQxiFViAQYjeYJhpnUr8kyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1FF606A33E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1FF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so221171266b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
        b=XWJRyP31bpWhJAD3KjcgrZUGei4r1gSB7PslP3qhm8yFt1Y2X1puQ0cd342XloIGYw
         XNf2nIKfXd0s86R7SFcbS78LZVlty77KvrHR8OEGP3xJmNAv08Yo6+3jhd7ywMpbs5GI
         Li2vQpUWcoKNBHspmHgEcFx8KjPIdaorzi8mDDDj0OXI9rtsPkOItxkaj9c9fbryzBpz
         hXH7PLsjTrV9EAyEGkKjtC0SdQxXDCdTzi6cz9du4OmWA+MxAjVRFh1lKYG+1S9m/yt1
         cP9BR8DssikKkbeib3uDrIzTINprAHPLhl2EZ8+T+4ghs6g0qxHlxQPTLVbTzn8i+27d
         XZ5Q==
X-Forwarded-Encrypted: i=1; AL+hErH5L1Ii5+bDIcCbq3FU6nv6yAl5W5u32YoYZVkR6vKDYMg0gJdl11Eh4UixqAfeSwRTsCMQVpab4zDL@vger.kernel.org
X-Gm-Message-State: APuU4Z9nw+IK1nXid+NRn174yjxu0OaPI3QBSSDQF44VrUsdg5/h1z4p
	GPGOJosoS/zUDiNEavKCrVv+3t9enTpGkszma+mpPMP3D7LbsuFFgvmK
X-Gm-Gg: AYBFou2EonIteaEnwMWGXfIHEce/fQIOcsJWi0u+w535p+6E0qQfmMBrSvvEEIG5nOC
	CiO+LJuU7DEzfFAuayGEPXjK8WDNMR5/7WfAThRAVBizTxvVRVCMwqL7fLn9HvXFvqAbrRd+urj
	FLP4stH0Gqfg5nk7EoZ2FuY+9QFM4HoDzValtTsFlByrYhxLCQ5ueFTjElTs4Z9mIZSaVCC6enb
	KlTaKxY9aHrEmZ+3H0y5BFENU3avu5q1nHczJZjL8DtTEX8eKxEvifja1SCgio+/tTI6Uahz8Hh
	1HSn5MyOLS5MvjM38V6bYxfnutt+f0uw3JeOccI99SjcNzu/vNxvjJPgWsCuLpK/8DYg504szv1
	xlb9m3JYYlOTzSwmWABLh4XI//abpbQCSuzcqzZnA00dKFljOYBbDiU3QkPoZwStBMFXYJfU2a2
	tJ3/HjwcONLhQZQzG0kBmGOt5ohiZYJueSlqYwseqOngm6EyPGijR8tiw4UuFlVM5ABREr8VxlZ
	J9RMXdtKoZi6qegprfQYsW31TD+8EYNSy2BQSW0IIwn+AJ8sJcKLCod3P0o7B0BUgbjjqaGdlnp
	kpItDms0h8d9hXiZUB9eFijXk3trgMM6SxKdHL6bF0sS3K+cj+BbhkLRrodD4S+GI+Qhh0PC/iG
	CgrZfNFVOv+/UAQrOlKW6XmrmPN3LBuplc42Xd3sZDw6/xw==
X-Received: by 2002:a17:907:72cf:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c5096398b58mr185619766b.33.1794572334460;
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
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
Subject: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Fri, 13 Nov 2026 12:18:46 +0000
Message-ID: <20261113121852.334604-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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
2.56.1

