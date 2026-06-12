Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A53D75BC
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249020; cv=none; b=vB42vtwRODN29vhvUarM+yGdv1bqrqBaE2mrmjCoUqmnqjgTebeicMLz+GJJ76DtahrV9e7F16Fr+Hbk2UF8YR1IxapQR1Uj8+WH3q8CuYJNvMq4xbzsKNWHB0u0lCCx3lbsautPfJmKyPwx92SkT9mTsdK3I6FlakfztA9VsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249020; c=relaxed/simple;
	bh=CoNqm2/IKzxHeL4EMhoqsMiSwsbvySEkzaTN57BAct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1MY27PTQNVskQwR8vqyIQm4GBnocPeZq7O5PuPjCjA8hGwTTU8Abgw4iYNM5IUhMBaRLRqIPi/9apPwI7VFzJVtJz+WFv2IVaAjSiqeCyavmBgFHcOzvNgpfFBexrVk1M2PdUm/B2MORsFd7e3qVFWhaaBKeVXQDaTufLlyIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBku9C+K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBku9C+K"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so3785165e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249018; x=1781853818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ56rq6Rsc3VF5U8Hu6dAL1RpTeX0JyCUsP+ibErqoE=;
        b=bBku9C+KTdwFzpY8CJ+eKSe0DBpqcNKhH03JAnHa2NwIh5I+xSvbRI04B0J4B3O0j6
         feIZjL/THXGSNvXPTxMffGJZRhuzWdqrBab5KIvqc2CYVC5z6UZwtQDco5mnhLrU4qrF
         8mBQZpCqsJbv4n2NA86JxnN9b52MIekm/fYUKVnk0mkNKESnSnJRDOYzEXqbnotgAGAK
         3jlySR10rl6+urVOrBLkHKmKRcv8Fw1fptmRICh5V9RAXwqIIWeFrL5xrNuTpdPDOoLM
         C1m7hgJw2lRwOksNgnJhxEtmO3r3QH3bqZBRrNvT8R5IIbFuIp9ixpj3vySGmA7nciLb
         iI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249018; x=1781853818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZ56rq6Rsc3VF5U8Hu6dAL1RpTeX0JyCUsP+ibErqoE=;
        b=RaRAh2NiERafBFMMd7R1KFHdZ18Y2il976U+u6AIyCaFjmx8dTj9SYH2m/JPKtw4ke
         07Oo51rJ83YstnTDKqFPjUzL5cCN2ZOSPao3XdI05iaDHyBP4NiRczTZt0odt9+J+A5v
         5UX1l1wZYSIt1Pgy6INXiCj1jkQiV22zrzibfYIkJgrWd+g6czsyHquMBSp3Pkz65Wmo
         rsu4NGRrGGjbLlExfBBoApCsa8uhCBp54i0Hfvusx5TSh5PGRU1L3mJ/D2Bry0cZHJ6C
         gGcMrL964dlK0h0vQbs65OgWpDbJt7yQSP0adtKfqtcZgGbWuDCaQ682pp9xD5n7jRKN
         XNig==
X-Forwarded-Encrypted: i=1; AFNElJ9/n5C0pMMyDyepDXAmoASUPoqWcNR2wQcrO22c+RI65Sd3C25i1cZdgYIausNNIQ1nuyCOId5q3rpV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TKRHhVCFzJoiIy4v7ft8Hy58+CghnUuAjXQ5hCCIN6u9NLzH
	1YVfL7y5SNhX4Qv7UrEU+pU2Z00cXW+JLWSfSk+It+7+5zdAsLn6whl3
X-Gm-Gg: Acq92OHcv/Va06Gqdfgf9a7ewPKvnkXbQeeahXdgiHSwqoBqclC7VvWgaMFU1qnJYFY
	KPDSZ4A06u2Qs6ZlDHpvdItvmT+yJVYFCfZOupRHa+UQAtC2Gc/XrGqD7CPxMKqgxYtBCpZFPmT
	JNnjS02rf9QUIu4PkvBZPZ1YLVO4JDeqh3Ricn//8+XbO8bD1KuDVZc7KQEFg6b71KWwLhjc/b2
	0GQ/TwLceqOkoDna66FRjX1et9ROyCNWgt6cV9o41EEgO9JVw8SB3SbuzAja96eVT+M+BiCOGXk
	8lflrxxC4x6nG5Ufa23g5hnlblMXjk2/i/3nYDwhjF6rL3Qetz0SAI2sswDjOEtAMek2f5XGkNz
	n13j86BVtnjwxxI2NQuhpmquEJbzFopiXB4c+l5ky2I9Gt/rzlb7IGgxMfWbjC5Yw3J5tkkPO4x
	wdIrhxWT8sncn2RtzMAvLW5kLhniFq2hXLw+RSqBk=
X-Received: by 2002:a05:600c:354f:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-490ec4fe74fmr17921415e9.28.1781249017872;
        Fri, 12 Jun 2026 00:23:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm28715245e9.2.2026.06.12.00.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: input: microchip,cap11xx: Add microchip,cap1126 LED reg constraints
Date: Fri, 12 Jun 2026 15:22:10 +0800
Message-ID: <20260612072237.1177304-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
References: <20260612072237.1177304-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply per-chip LED channel limits:
- CAP1126: max 2 channels (0-1)
- CAP1188: max 8 channels (0-7)
- CAP1106, CAP12xx: no LED support

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/input/microchip,cap11xx.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 9578c7c206a2..22a292d4a880 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -171,6 +171,19 @@ allOf:
       patternProperties:
         "^led@": false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,cap1126
+    then:
+      patternProperties:
+        "^led@":
+          properties:
+            reg:
+              maximum: 1
+
   - if:
       properties:
         compatible:
-- 
2.54.0

