Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38224A139C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985745; cv=none; b=t31kkxq9STFnsP+ovFR5b1N1hB9orSZrRBa9OzlO5YNuLinHjh+Y1DDKeZw8PNUgOvDCRUCiFlA4ink+pIQfUuUlHmPGoTEv2l7GjfhfZ+EB9QnOKxAWQPe8afG6wb57yiCRMdsRVqzUsx7Gx5JmIFjpUMsf751NM4C9QP0LllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985745; c=relaxed/simple;
	bh=lB0Bes671BROEQ9VD1Y2AMxRwGu77UsD5N3peyamiys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QW/xrmTDyfIVualnrNZtdvInl2sQ8Yv9BnJHKoOKSthFo8J1bR0M5BWQXRnkIu14oBVmMH3CcyWbKGd9NoUlYQb2YCIf6+5xuyr1JnZ8+QCYYlw4z0H6GEav+1JaSghqlFRwXWlE+EFhb9Z/+x94ORRvGt75EDwg7eZtAewuHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTU/v9Nv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTU/v9Nv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-473dc4cf238so1007590f8f.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985742; x=1783590542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8iw1Xl6qbcQCxs4NT4Uomd3ECGsKeoj91RdXKkbkmc=;
        b=qTU/v9NvN88MScLJGmsxnArAgxBxIzQhAarCb5OSadG6RCuLDM109DC9GI8TncCnjO
         PLRAGdD14apXC4RXc0VFG59moW0OhSWpXairVSuvNJ7w5e5LIQBhQYgPu6jVpgZyDGPw
         Us10n3ElBsff0hnU6fm+IWBHkMZUT+V9ozllB0milw4uUJA1e2H8NPdZgtJrAWGm0Mbw
         gdKHUfxs2hMTzjFb/d+VuSSpTPCSONpUOLidg3/SprwiEE6hZxCY5kc5anoCvX4OJpN8
         j6Jwtz1IN5aQSno5zO6G/DtFrdxlFcAR+VDiB0kjBeBDLRsqNXczh9IVbTmRZDIxZkhc
         4Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985742; x=1783590542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8iw1Xl6qbcQCxs4NT4Uomd3ECGsKeoj91RdXKkbkmc=;
        b=FBbfvXXbSw+fZOGrxatEC5rFMjs8FYxV7RBOwg67g3p1R5wW4plWA2v33cTR5cX1on
         O4CWrkYV3GBJpZnSka0lIJRnxIJoaDaLGCkubzWTt3hpJqxrM5wA2I6ZJWIPPvf5ueaJ
         t9srtTUML0KGQ4iEugjKc62ruypGuSDVBFvDeCgbdJN6nesG0ajOX2wVQ0l5GMQfg4Ld
         PpV5QX/6nEiek9HcXEo+hwFLIViXn6vqgdH1hzzsd6G3rAPqEeX/YKaQQzsS0hF0YTRZ
         FDP6G+bmkCG1VT0npyhLWKvSdz2guFnMtkR/cju7BWyLltD6NzpJOC/BL09zIJF8pbl3
         UckQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQ3iwWY1g2Z3QMiLN8WNPRq881j9znbNW7jfaFFuPeXNxZsop8Ig6n/WSrF1H86PHiB40k21HYkG9H@vger.kernel.org
X-Gm-Message-State: AOJu0YybkKaEzSQBZBLIcHMhEXp0xiEzSRzKOgng7XcA8uFutTqGLVlG
	8h4u0StaXL35zXBbhTAS+d0MWvLarbjsvTR4rweNbvQrbw0ZtnQrZnNh
X-Gm-Gg: AfdE7cmEDz/6zJv/k1fsB83X6USu0lVtkg4eIa0Gi2DkpJYo6nm71/AsUjOGx9aGsRg
	nZ6HujzY6h4ysXKKTbgQ1WikhqvtlBy3fEhlqUjUJFtgib5nGVrtKyRHBbNwB9Gujz8UjEurIFx
	J8tYQVx2z2gKcu/60AyZTPRCt7aYpi+B9aiPNc5ykVb/utTX+ZIKkW991RrB0rsWFS8UivN9zXv
	+xGgATzcNELU2aiiBKTQKJNiaI75fhs/UEHT6eNtCxxfWPkWvINFnuA1biKpqYg0Wm8zMbMa7P6
	rfCPqtr3y5i1r/GvwjhBP02HFPFWnwb8KCtvODnAvxlhK0V6MHN0rgrysbSZVt/l2SSP+4uRChJ
	uwL9QZOMc1WjgykZRp+VkWk3pDKd6y9iXvOF5hIKcxQepIgH6NEbUulg9WhrX+4tmCYMjiwEurl
	st7E3AEFNTHCxh/RSqnQxsyZX9RqP/kOP3mFzj3eenEuajt77tIut9c1omikpLjj2qaQJiXpWMO
	PKJDg==
X-Received: by 2002:adf:e00c:0:20b0:46e:27ed:6d0d with SMTP id ffacd0b85a97d-47757f4cfcbmr5464018f8f.8.1782985742306;
        Thu, 02 Jul 2026 02:49:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-477dbe617b1sm7381364f8f.16.2026.07.02.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:49:01 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 6/7] dt-bindings: arm: airoha: Add the chip-scu node for AN7583 SoC
Date: Thu,  2 Jul 2026 11:48:34 +0200
Message-ID: <20260702094846.17325-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

