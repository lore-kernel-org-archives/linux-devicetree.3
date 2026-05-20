Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404035201E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292562; cv=none; b=cVWNI1jQ7Hvduh8Fk/JzeMWLzKHCTUb5bpZuikhSMLEFg7FYGboZBpN4Y1F64kLgwPwjyu8L5vGlF0lEA4KpzIALl7fmQ6IBnSRKMgsgCPjlu49KpunJT2DKWNsfVL8WgJIWG0Tlaxsv0MpHr1N/hI431nvdjQ/3wbXyzod0z0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292562; c=relaxed/simple;
	bh=fuJ7RYob/XeS0IiBQ87VjGhOgfOvaD8Chjbj+Bos3PU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1IhS1jsTxBVoNquWRn8vlzh9XHRMMSh9GPO549cHhyKjI2QYNI0rJ8vN9Dm23VwXkRUlFU8xqRhovqB481LAEKIwWjXfG7zvcYgrjFiPPYsN4gjaMmAwF7bik9U+DnSqOGcBVHVtUi1u/fM4ZcRhlpNvj5oEy4IHq4/CQT3BqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVAQZkDZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVAQZkDZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48fde648a71so37470875e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292557; x=1779897357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjMonU9wF/NQLoHYxrgXPEmYrT/le/JonEK29SqHe4E=;
        b=LVAQZkDZXdOZrCyzR+Dcg7Gr/EF3tIpkwR6StAFXpNoFlaF1Kh0+czNEmh35uon0+n
         +sycTKTiS31yZESSnzs4CMnQqkRkwUtKL3Wc6ppNYQK3hKWo8vGkiq7APk7SuDWmTOeD
         +13w4UXvBwDwLR+Y3Nli4SyphN+RPlez5m+BV714WZl9BEHmOzDJYNjBoji7dUb/al7R
         q1dAkHqRXGpvz2WxaQxwv3SewbXvsGI1FX8jtdLySdoRsffXfVkR0GB3dempPk9Hqz0w
         gZfRrPsp/g9EXYAxmNoWMTtabiwGKbvZ2OVmTj9LzAQDNshQSs9hoWj83ufasg3yTv04
         qFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292557; x=1779897357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjMonU9wF/NQLoHYxrgXPEmYrT/le/JonEK29SqHe4E=;
        b=hQmM3F4VEF8n5cpzxP8l7Wn7nM1J5DrSF5z1l5da4DxZWWvXnMdCUOPQX3LgNZuQ2+
         gHpj5eY1a8cx54hlrjhVloptlp/DbjewtjYE2XgIPvwFEmAuEeiIm8rFsAklyqpwQSH/
         brMr2xREuKxuTjj4fFAOOQM7/D4Z7WDyfZkc4n58I9V5Pap9EOwzHIvNriF4bY/dwinO
         izuUGYQ2zwGt3AV9O1EA7t0uWJFoQJ6W3gR7laQ2M0awDgG00pcFS0AUWDNRbUnoTOFU
         ih4g8CWr60QmUCKJVHDwF5v5T+EoEY3lCpODv/O6dnWow1I+XgpOBXpqh0W8K5khJAt2
         6Jsw==
X-Forwarded-Encrypted: i=1; AFNElJ8WK8nzrxhsgX7rBSpbJQzVW7I72VPEX+XRJi4i//jqXYmh3DdBDrxzuCttVoQ9DcMD4UvjFnL64+KP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfm08m8/ifisD5scAq0PerIEJ7EFigjeyrXqWdd9b4NLhC+ca9
	b7tgWteEzWblZksb3CDpGsXVCQ5UEr0RQSwkbHeHE0LOd7lm17cqXKBI
X-Gm-Gg: Acq92OHKgrdcOGF0IkpMFfjOcsvDEc2w5Ty+kBvdqHnPt+GTPqS68bV+X3KY5ww/BiX
	29cp4E3Unca32EMcdPjuLWIDG1NVP5Y/ANNpGU3uPv29VlbCa9g2dJlQgyzMfi75rCqODuLxnaM
	DIT0DcM/QIQZRCi6OkUxUvOqb24l+jPcL/xDb3oWG6o1cBszAgQm9Jh/fvzhf2PaXu6Y9L8UtZK
	VjUJX3/keakXmpXyRiQvqSiKID71uJhOFVyUFEMngN2lAK8J8esX5U9kxRVk6jOnsu4epax2sHa
	4Lm30PsbYLi1HVMNtMh+YNa6MX7M1TooPEfeI7qM8ja5CU8NeUbRH8xgdarBvfpkVJomite/BGJ
	XVCzJ9cIa/jPRraHcZrEuhdEFLIGmFwuxGh39EKKeYDPz7TmBH/H1dKwxfArh3AiXFZ6Lfd/2PQ
	IT6DEK3EFQHeyPtd0xYr8octSyxZqUn6DnOAhUJ5WGYs7cKMyoPr8zCTyRZ5YzQtA=
X-Received: by 2002:a05:600c:c4b7:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-49033d46279mr995145e9.9.1779292556741;
        Wed, 20 May 2026 08:55:56 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fed253f93sm132123215e9.16.2026.05.20.08.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:55:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 6/7] dt-bindings: arm: airoha: Add the chip-scu node for AN7583 SoC
Date: Wed, 20 May 2026 17:55:19 +0200
Message-ID: <20260520155525.22239-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520155525.22239-1-ansuelsmth@gmail.com>
References: <20260520155525.22239-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 chip-scu node.

This is similar to Airoha EN7581 with the addition of the presence of
thermal sensor in addition to controlling HW PIN and other miscellaneous
pheriperals.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/arm/airoha,en7581-chip-scu.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index 67c449d804c2..cc564dc7b414 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -19,15 +19,29 @@ properties:
     items:
       - enum:
           - airoha,en7581-chip-scu
+          - airoha,an7583-chip-scu
       - const: syscon
 
   reg:
     maxItems: 1
 
+  '#thermal-sensor-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,en7581-chip-scu
+
+then:
+  properties:
+    '#thermal-sensor-cells': false
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

