Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A736D9EE
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229996; cv=none; b=CMssShonMkafjE/eoDM8w54lYq5TfE+gKH6OILW3B7NtxcHYakJToYn8eTqy2f2pjfAdqc8qraDP4tR6IlHH/UhJkRa7AtAX1+p+HhyyjwSGD4DN5moj+7KE1iRxkXzeZIE0OcPsUkMi9MCY6G7usVKBReatU2cwuqzATyjn9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229996; c=relaxed/simple;
	bh=NYh7GkAaQitazkIJS4x9NUz41kWd9WOoj1M6tPz0fa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spQcw5L8qPmNR1kIGOCwaVTi38/p36G71im8N7Mqjf1vRyyj2KfZHKdgOxiBv+SFzMeRPeqsC7HTamWpMLYYGd0malMMsHGPBt2beBffjCuciGkoAkxLgkVXtnjN4f3KDYkChH+pW2ACtZXoNLybEj685cfxP4nALH33W5YqMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caZbYzrQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caZbYzrQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso43715445e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229992; x=1779834792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=caZbYzrQdRftFV0MaNvnlrUK2RVP53zySKXI177wmGdV8fYV7NHtEll4p4B7kdY0B8
         ISUoK9mNIg3YleZ7jeLvXfF8VH0LVAOvjRq0pJwSlGY9vB3rYa5Osr31VZqwgu8zcBXS
         0a1ikzq59QIAX+dCSF5h+hc58wIdXkyTfKiHmTXQEsNUTdy41U8BS5nZSl8Md+dUF9uD
         CMvWLFw8olNPsxd5p9/n89wBdYmiAfy4/vFyQQmWihko/UHbyWTGekrxFG+Is0ORaV9n
         r1vLVzz8Fy+xYUkxHkAcxMXDGXfkRnOX8hUQMZU4Rx+6ETVIPADaEFYXWPYZWeAVSg7b
         Yklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229992; x=1779834792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=j9cq3luOIqa0uX1uEPlXIIimYw4LPNo+SHWN79e0kdBRnr1h6YJP7fgBm3QTO1Igyu
         dVsiVEtW3XL/jsAcosQXAXkqIofb03HVYiJfH0I0CJPDR09gic/UALzJSaNioU6o6vQ+
         ehmpXGg4RycxqjKHxIFhobXP4eQETahAoxDl+q5AKq5EDCs8qoWU8s0CryQxVy+3lOE2
         xS3NlNRtJsmofd6cEF0Mw401icGcIW0NzDHK/iOAQRrO8+pdoNZ7cNcgwXXQQnOcXA8n
         2hiMbL4ALFQbXr5IVvHCy19gwfl74RYRZq3wcp+E2LSDSuR/GdV10vQZBroBoZ4o6P/0
         eyfg==
X-Forwarded-Encrypted: i=1; AFNElJ9touSEr/QZzq1HV7aSz75XB5XadgiEjrlqrbYDVURwWhEDncOHSRDkqSD2lXLLDD9dU52uKkm9kY8N@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiGmBJrc4Hs63TwpjaZShtRKuQf0cHZ3xz/ufBqgUrRvUq1UO
	PG4+rdreh7iagluLhARBDlLBGmpIQiVNdbGSfk4pUy6LcLtSQyHV1QwJ
X-Gm-Gg: Acq92OGWHhsMiNSRJzHKBN3n/fBy8Me13D8+73sXsqGa3CISSmB5T866DHgsWy/jv/S
	jiaTn63/FToDXcqoOyJESjabdoiDvrWtZkMe3i5nAiZhJwjizym5+JSPgllx7DjmA+5qKgnMrvK
	rTAyDDsSRBJn2Lk+T7z9xZ5zsa0Tb9em8Uanr+382oXcbQTJdispeh3KMmP6cblq1qGacSoHSJ4
	ZcPx1DaV+ycNBO4dJ+zCZ2ytZI1D311EqpyFNX2soA7PXPB+IcdhevknIfzue4aA0EcYCtdK+u4
	elroHubVDa4LQ/pNPD9wEXIxONT/2IEpQgueWYFDFIznGA+VOxKvrc1GemlT16l76bBtlJ2OPCa
	A1VfvDv57N9cJmbQxPJq2DoJhnCBgci4c+lhgW3IA4YBWvXceuKNotBzsaf8ME82fXclA8cewrn
	5pFmVSBqyePLII4s/gxR3LPbbObmNmnmJneTtHmaWg50HEuND4hv4GhyWRZS/BxE7KpAcZmD97+
	PigNSh7cQ==
X-Received: by 2002:a05:600c:2d86:b0:48f:d5b2:7c42 with SMTP id 5b1f17b1804b1-48fe63259camr228600395e9.17.1779229991759;
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 20 May 2026 00:32:45 +0200
Message-ID: <20260519223253.1093-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..8223fbc74f14 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

