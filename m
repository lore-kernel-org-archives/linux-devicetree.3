Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254333C52F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841414; cv=none; b=p0Up37VdemttHVkLg+lWhfJAU8CV57KwkLhafoAb2pK6S/rKmS006nBUna6Udy4oXUZo5P+ZXjchRTrFSAUkw/ZhaHushTmfDzwAc49hjniLFO3mStpFi6bdGp3pPfkwLuFTix5AmkfFBX7XxP5LbdYQLiWszmvD6wOz+vHYbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841414; c=relaxed/simple;
	bh=IwG2wo6BkstFh+qMX/W8nOYuTZdNYDK51l8RlSVJlIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wv8cQQptPjGrt9RdN+6pebMoMLyAQYaQKDnQTK4HhhOODYzweHdAobNPDgRYcWWmT/gIQH148jhVeKv1PKB7zciS/CEaoYxk3trf3UQmHMe4NFm/jyPrrNzjmeAxq2+VwaIhgPmxFlklgAhlnJZm1yx8Lsg0aNehpooWZJkTup4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKcCdnsJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKcCdnsJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so3484135a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841412; x=1777446212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=GKcCdnsJA4jAwK4go5WScOVmsFspv1XX2o9elbuNLp0eo1695GAGZ0OjHx9IxD/STT
         6qG6lfzjDYP5KyPVG8S3T4qPru0A8tkB9W/23G7/abp6svgDtH5lW50vNdJSGSh9sFg+
         xFSuX0CUZvVh2HJAuqWwyKZ9HcSvj7bW6HfSSPuybDiL0vDmUpXRnNdMd/ahRQ2EVyiW
         B0AZKdMtvXHIuTjJn6/6r5nQQtOLZxzp0OBGOw/peNVRnwOiEcSWUOi0eq8b320UFuZ4
         eXcCwCMR6YkD2sU0t3pqGpQN+sn3b0WzqOi7mg4OGX8kXQo+HfuPopdf7h6vEluCXQ1H
         YPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841412; x=1777446212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=RxJ4pU7YT36Yp3Ai6Tf0rhl/mF/rVPM/HNetftM7Ld8weQR7vby3IXFlbKc5hSD+TL
         12aPA5lB4Yue5Q3Yi8DCJSltMC0zSMX17l6OwMB9hIVWueUSVFqCK5Tr/8yOLADypI3g
         M9YWVahUqM0/vzT8x8c+duv6/rZZDUxUWAynExomaPbeHYsqXdCt7JWJOa8hJ+EfaYcU
         Egf3orgSd0+8eVXn08a3hzM4+AVA2KnB4bjjMEmmHHCgehc37NhlnrDzf5CG+JiXDUMd
         3VBhwSEIL9wm1RlBPZeOFQYMn7o69Qc+bbmdIC494iYgSRNTZovEcU8r8ia+xafVdSzq
         2L/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/DUVzk9E0NsQQbTESGVVDeTEG0vub3Hbk4HYimu08NK6Y1G+WJ/2tQFYaxVFJbtjYpgpWGcrhw7Q27@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNPgJCC+qx7p58EhnIiUZkAPjFEnbtBRAvEgDtiZs0VQJ5VWL
	NZr6YIw9EF/FhkkBvYRF4CGSJH9s+Bfk1pMI7DYhB10fvwSk/Xzc4mRp
X-Gm-Gg: AeBDietQ2vpPyz7ozc7qZGDy1SWcN4udUrNPzpbVNdYxTV/CA5MAa6lwcg0ZDwtvx3B
	OWgYWEOoYs32s0qdlv0PivUSfwHue+4j41AsZW58watzka+GtQ0uwQG6sOxw3tUfcK7SOOPF158
	Xsnihz8LI4Ucw6r42sURIlqnKqZBsNsyNhbgQoD/3T6fewXJHz894DjNu4ItNkNf3zMdefmDoVL
	ragy+ktfwE0GfTyhHi8+2R8Pkx+z34EBPLmyA1uNLzaqcShp1rfInM0avBC9UeC+HlyPBKf5/TL
	MvOOzpZh6Im9debXp42wYNCZIy3wmR28mcHqLln6FkJ8JOVsSsAgwQ7bHP6XwCNYo8up3yjL5uy
	PZgLzJzdvuhe6JTFG7NV/X8uOTQSUzDqJoS3dNyxRXcCyN9fSSZbVd9M0pDgjhC01ctHrH+vgOh
	z5jGpTJP5FlNUTIrECFbqSivR6+Cu0F5MjSyP8FbofRC2RVbki0kMPCiQIi/AnWzuKwoU=
X-Received: by 2002:a17:903:1b03:b0:2b2:5637:1480 with SMTP id d9443c01a7336-2b5f9ff44d3mr218370865ad.40.1776841411469;
        Wed, 22 Apr 2026 00:03:31 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm155088635ad.38.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 21DED416A043;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v9 1/3] dt-bindings: mtd: nand: Add nand-randomizer property
Date: Wed, 22 Apr 2026 15:02:01 +0800
Message-Id: <20260422070203.698716-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422070203.698716-1-linchengming884@gmail.com>
References: <20260422070203.698716-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add the 'nand-randomizer' property to control the data randomizer
feature. This is used to improve data reliability by reducing
cell-to-cell interference.

Depending on the hardware architecture, this property is designed to be
generic and can apply to either the NAND chip's internal randomizer
or the hardware randomizer engine embedded in the NAND host controller.

This property is defined as a uint32 enum (0 or 1) instead of a simple
boolean. This design choice explicitly supports the "not present" case.
If the property is omitted, the driver will not interfere and will leave
the randomizer in its current state (e.g., as already configured by the
bootloader or hardware default).

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8800d1d07..effdc4f99 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -23,6 +23,15 @@ properties:
     description:
       Contains the chip-select IDs.
 
+  nand-randomizer:
+    description: |
+      Control the data randomizer feature.
+      0: Disable randomizer.
+      1: Enable randomizer.
+      If absent, the current hardware state is left unchanged.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
 required:
   - reg
 
-- 
2.25.1

