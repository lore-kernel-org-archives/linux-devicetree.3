Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C93FBEA3
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533305; cv=none; b=sawbkIGlrQIYB4CGoqY3SKrvSC0tGrmxm6pkoPB/CkjhE55ZYi8WmMcjHx0DCUYunmHhnO1aT3T8enaJumfbtdxxdEEiwdIYP3aQCmzlmHg8/pApt2K5wZy5kJj2ah+R6r3wA7CT9+XMl3LwP4sr6fMO71Lbh8yxRt5fNkwpdHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533305; c=relaxed/simple;
	bh=CoNqm2/IKzxHeL4EMhoqsMiSwsbvySEkzaTN57BAct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcesYE8Rb0JxWk6xcJK78+OEku6zb/mESyU0T7i3ny5C8VaIPEdJoHg8jkaSy4u9y1GhGwlEy35xk2k4yhX5zrq7gL/jBw1Q2FNCAVklUmCj5MshXpAsR6bfkC1Lum9Np/mQEe0u9Z2zqcwAmJIH0neG8Wdf8WCfMhzc4nQrG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zq+EJRtb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zq+EJRtb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so2160396a91.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533298; x=1782138098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ56rq6Rsc3VF5U8Hu6dAL1RpTeX0JyCUsP+ibErqoE=;
        b=Zq+EJRtb0LZzhck9iNl+zLvafBrwdnTvxx3ih9AajitcBZd3S9tcp74laHz1dnBSGC
         VTWDVeqP4sl10Nnk3h/PLx8p23TsFuxdNAavpSbc3xnQ/jJYaQXDpwaWriPDsyHuceJC
         5qvurYCSbBNZYrET2OYjohfdht4nzNSrFjfUfoJ9O1WApucppoCLWuaxUvigRHH9egsD
         NrPBiybrv5hd0cTqsI3QFglCq50hQc3d2L9unIO6iuRj0ykpnh9gcbeBnGJMHcj79zaW
         qAIr5xzbZZZ/CAgiEAKCEOqN3+B1AM6/Al//YVzrxB8kdU9OvXP1OC0r1AsuidkGG9GG
         df0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533298; x=1782138098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZ56rq6Rsc3VF5U8Hu6dAL1RpTeX0JyCUsP+ibErqoE=;
        b=Fy23Fnh26v5rTI4gKeT/5o7kKGjtx2V+wUFHLjJOgAuSE8UjX9RuNvesNumkgK3KLK
         0qiP0r1flqQdKB4PlDeQp4vcfxasXhZ3kti+dMpBCaLzEbNJm/gQzi/HmQGxTDl3hWNO
         Vej1yVh56kFYhT2fLvSFcPCTst6Afn81QpBXdID6EOKKomUKUkenUygyARzXS8kSTzUA
         S0FhwF/S6RXKhbnN29Xpp0BP9q5/i3tlvE9BK+YDXeTttN60YEfuEZB+4JmTRqXkuYnR
         hGAnx8sOI+NZFgNJlOeqo1UOgHlOqXTj1LZSuA8rC4fnYwGXb/qjtvAQvwS+ySPwF7sI
         IIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NGEhDUPo5crZj3RngoenkUBqGVsOxz6rY/d08paNxQ1JC2Y6ih6SV6LkSxnj1hr+fKm1FcKS8QTe/@vger.kernel.org
X-Gm-Message-State: AOJu0YztCh4VAd9GjOAQoF1zPwzDyd363kQrQ3RSYF04OuI/y+XBVSQM
	ULsJEp/7jKZMkpyGJJmMDbyJl6G2+8Av8o9D2tH74KCv7MuAStXJSQZd
X-Gm-Gg: Acq92OGISsR4V4FnGLO+6vLiWfErRWyloj8gsD70pBPCCGUF37yMOaIT5dI5T5i04Qv
	8J46WzL4vbHzYGsX6kcb9Rw1pCtf1roNz9MJsp59WqFDsJgDiduU5frZ5nRtbRdR5aAR5kUXwbj
	d3BjwR2oxBRxFJZ1ZQErwP67aUZ5tEPEOrCEBnZSvREq9aX5UmWmlVnyGJ4zI6TzvMUjbEpqpG3
	oFyxQxKzX0P9cCgLWiSjbYz3SN8OGq7Y63yNe7CeOtWbWmvjTymHtaps9ULRrK2k4cV9BmlRfsq
	yWYlejhMPRh4tesMhpxMrsdEDo6/dlsCRHk+JFZ33deNVyVguClyV1maCUzAo6BombUtN134zHp
	Gmcfr1Ye02NtOF9u3ag+jLzbYA8HIF0px/7qWz+hWfKmfwE6rn53XjOLScKaBtMzpSEEctDJb2+
	gnMnKR1WRh9I1IpDx73jIF
X-Received: by 2002:a17:90b:278b:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37a01846bedmr14854691a91.5.1781533298298;
        Mon, 15 Jun 2026 07:21:38 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:38 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] dt-bindings: input: microchip,cap11xx: Add microchip,cap1126 LED reg constraints
Date: Mon, 15 Jun 2026 22:20:30 +0800
Message-ID: <20260615142103.352163-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615142103.352163-1-jerrysteve1101@gmail.com>
References: <20260615142103.352163-1-jerrysteve1101@gmail.com>
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

