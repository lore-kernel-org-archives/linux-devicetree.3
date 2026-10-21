Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579935;
	b=MBvnk7rxmgeQcbvVUrv+os2N+PWCqGcjPK2j31mHfmOU3ZA7aLzvtannPwlV4VA6RLfv
	 77HNDUlnmH0yECqmHpSMW1RkjjD1yZqXx01l9PG5o+h7JOUwDM8lzBogJ6oAmgYJ7f1+k
	 Gl60/Z2/21O9/OY8giETzzGYQNo5B/3JJhyuXqHWtLN2kvIlYzVqStEgTWGtnqATf9NYJ
	 FtLRHMr4qYqMMIBEB5QVEk8DtGxjVZ+X85AufE/HENpvVAZBiuLNlIR9wxlUOEEN5sgz0
	 BQ2aBQIFibtsKfXqqvsPDeOgLh4paD0ztGtSfG04V3oISlyZqsUBukTVRCpZbdmuPoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=Rn7zBGRUev3DqcMGb72Pp94tkrzkFkA3FsPIN8W2rWJjn5LFMPrNH2vXQGenPNy9eETz
	 ACIo/bt9URLiZ9PHFj6D5Ktntpq/Ii3Qk5WiEKAT/k1mklEcvjeZ38IR/k59npiJEJxvz
	 FrWTqcI/9tNGpRPfbHIjGVyajwx/bA0Z5F5YLeBVuoLLgNhRzqm4KuheIvCf/F+PhCvra
	 dgUvm13nagJRpIAPe/a8bA4QPOZtCT/+pbvMUuR/fxSuSqq4XqvZAT3yxJob5UApKEfpE
	 R2CIz5eXoU6V8r0/g7RX1FAF1iAIZlzdjMn5ZdoO7qTAmcm58ss5UDwkRbLdOidnLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB9606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17BB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso2906415e9.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=baH1H5HU89i+T118hkko/06VcnYYiJnn4oobqwgCsllxrJMDL6Wk55SvW0p8z2Ag9j
         uQyg5Z4TStPauoAXQupNfY9XZVOYpzLV8q0NQ4Z51+rsYF2nnKLlDslJp7hJwrUXewam
         v5xg2r3ohdM2d2ua+xFgr4tjsEwmr7L6kw0runobEQ4zJwJKwY3Y/7SolXnI0VbNHkyg
         oz0GlPBkxD0y+iTmKgpJOx/yrTWcD08yYWS7A4dg6HtdE96S00B/APkLTb7uGhrmw6aB
         pzFhNeEo/+gJXuj/vZnGZPLL7iv2I/yzPoFFHnLoGBIQNOQp8EXBVm24d54T0WIsOZtJ
         Sxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=jn9BQ8sToygxt7kzdgXX4S8StY6RMZWwXaKrERhadWEzj+pNGcazsNhGvN/G9l04px
         fucQXZdFcIt6oiuY/+dYNQmBg0vGFWndh1KAGoDBbYoQUVTzfkUlh6Yc8lFqLGUPzk+f
         NBOY9RGKZnPkfodjNqT7vnjXBPq2Ch8nsHSbuw12WbhgxYU4274Samk050F1aU0M4FYh
         V2gBzQWoGX2kO7WyQznQUpgq7P5fXzkB13+11RUvhdamnkpkYLTqKC8CMcYX9e8obSYK
         ZOZnxkNtto6lScqxSTb7lJeNyEw9CtuZyB14d8Yk8cIHrp29RXcR6mbzBuLF1a4D++tE
         CyUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9oh1eWMAJJu33mc5PthNFmKD+bE8BGwTOqDQlZkIBOsJRt7PRVpS/JVMhBvlvenr073CbLQ7Isoxa@vger.kernel.org
X-Gm-Message-State: AFq9FYLQugNYZXNICqj9LzZ/GiJKcwoLjiEgGWy8f7tPMxUXMrSIEEvq
	AjYS6lwhgrkGs8YdQnJpBHrYyBMJZueAMbeFQPKOCzMIv2ZnrlHbnLWY
X-Gm-Gg: AYBFou2+oOMo7Q0btRtf5nR57RbiGMcSnf8O1USbWq5ZYJGNeH0PGA/llPZ9HNsRIZs
	6S6IMLf2q0T4FDyo9AScMjgOcykBHCHrrqHCUktoQJr8fbtmmtSaifRlPeQ2VsFp+BSQO67aaF4
	xQ5eh8/DhtwsbxZdMkseEZbkor5R/sLs9Ln7bPPpResphlEoIT7EcTTp8XCUxXdYKi5gFY/1TTU
	C0hZ+Bh7KZTmk+5J8ylkWWFhhF7muomOR2Kw1AqR3fBc92n7d4/iZjcJJfW0so61n+8kT0AfKQ3
	dLtipie4lEpVvBxQ82x86VbPYoeQwrqDXPYNYqskHjdbq9AkzwS0xd0Yb5Hu5O1lDM58/UkZ7eR
	8WU4w+xabTYkKgVLRdUVjn22H0j2rk61hCQRJZL/ArftZoOBJtl5XjNh10eon0UYMmRZ8N9LIfZ
	Hqa/u6Wtixy6Mbpp3JeH3HnJGuaHg5T+BupV0Zg3wjU1EbcF0sWAOpF4sa5mBKw0pZBDZwY/PyY
	He1ZWl1nB/sq3HBagNtrugyUb3RLkuPJQ5+ZFvtfbkSq8rjgGFq
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

