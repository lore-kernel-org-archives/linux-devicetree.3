Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E301F41169F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629949; cv=none; b=hZxGetVzYoKJ12RvtGeHU2CTFoth932TDlv7SXas30WD1xJwTteTxIOJU0fdQBk862pEmy5XqRsuGB1/m28Oq7EUy/yMd+I2cZ59YOPwCTUl3xHpyeEY+94tc8xn6CqbOUKdJDTnI3J7TBTeQjAsWPS6iN4kVGCHdXR4iimX2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629949; c=relaxed/simple;
	bh=5hwn9dmZm2lL4gEzMv7nMKFRmoByFyt7ooc5m5FQqRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+YeRTuNNhUF7NoiiwMa9glafE478t7w5Dm7AjfFfVPTVknfZX//puWl0xnKH/JgTvc0FOSDjYAkFtoGO6VnT6H4dw7js+spR6dbzb5EcCZAQ8/MaY8Ye7QCfGEqR8YwI2Rw1iF7rFcGNx9Wf/93WnpNVFCvpQrEok528FdY25k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a061a13884so4632015e9.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629945; x=1792234745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=mUmhyjpfKcngQ9iMjO4vnYknAeoiSnBpxZkAwTMiRgldGLWFi7OH7Li7mbr0liq+MJ
         yKs9Pd5OjHYJWiSMOdNHw3pU88EkeEv3foBcke6oO/sKZ47S257mjDdhM6q1ZwGVGR1F
         vBBhhZF7YfsPGms8rTylwaOu86UJhArkukN08qjb95ub9K6LYQAGKJxIHnB7Ocv6cmXH
         AeYGVLPjeEF7d0dl/VaU1qC6OVslleCwXejhy1G/SyV6hm+PKlBJZGC1OYzEjPPZ13Es
         7ozmDoawfeKgpCd3ZwBS1YPqISMmvonk7WheFGBWPsFsKWVKdeXpLsz0sG2VapiMT2Im
         5FfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkX7Rox/+eaV6kOwIZhb+L+YHIs95QFtmnwZaSLt13fabwoecTZNU2aMS+GxqHvaD2a84OWKSoG6/Y@vger.kernel.org
X-Gm-Message-State: AFq9FYIMf91GjRN9WhkjBa1IX6Q6GneRM7aupkqsQX/wfRU3QEIzdKn1
	kKdNiTFdfbcsIKiMyouA8ecdNiAcGtEmB5QHmMsJP6ZihhudrQYazxay
X-Gm-Gg: AYBFou35+TVoeViLDY2EqTITnxwv+J/ljnthtrfafLCqDtVhH9y//bwvxMtWhht+wFb
	8eYENBKKsGdt6/rq3pD726xltfYKmBK2/nKc94HX765ZMIdCrhf0nEm2+FwkZw/BfTdtBMGSkiJ
	JpeHV6LNYYfFtTrgrUsGCWBPgrRI9rzifKUCGhS2I1jSzJmIVR2Gr2eJu26PCHoL5wuHF5fWAOG
	aBscvyp9CUpjB5vjzzNtYxhUqSJjAOX74j4k+CjQuYjnGiR/TFPHo+l8R1cDAB8T7gKgxjREVnZ
	F0V/Bn8PrAvVJloICORiyrV4und9g5g+WWy0HWU1Ia5RaZJNgS8Z1eBBE8FEfODKTYpAps69mxO
	defb7uTOTtoCuDNrLCprtWMwivUVkwmjFshrSt14gbfq0miHyhdQoA5EHJlqeR3sIbVcIsnmnLG
	Xrm1B0rMc8rxehXCxjIHu0LFT37XEDc0nbRskIeXShJGKwVgyLCFmsVYYoc2IsW3TGddENxmrzW
	rHvoOS6vw/1FA1UWHqzc7TOmuHXNAiVLhrIBHEcGbD+010=
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr71091115e9.7.1791629944857;
        Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Sat, 10 Oct 2026 11:58:53 +0100
Message-ID: <20261010105900.247342-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
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
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
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

