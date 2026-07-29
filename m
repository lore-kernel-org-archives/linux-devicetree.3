Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992A484245
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329743; cv=none; b=chJ1qvtgmLG5GsbijP27H+nSzQKOVqnTa6Da8cG94I5v5C3Lv0pUonquX1r+hBB8r60bei8UMX8szsupAO/HivPRP4NKMK4bwM3jSPx0TgHmJPSAbOmiXuN5PxZj7mn45MN4tbFv5x8TUrUvzPuW4gkaUu3rnSZgeQnvzW5QrG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329743; c=relaxed/simple;
	bh=thYrugbM4d2KwbV9wG/VWIgAfkIOaVdnFynhoOLCrm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmH/pJAPbhVc5l26ea8XkFdda7TQkOZbnhG1P7XfcGjoiqjCfVHKcVMwO1USeS9aGvhxx4NQSEs91Hhl8AFRhaeNipn801EXVUWPD/lME71Fkvv5QivcGuKP4z3+eyFQq7+pyeD3iT3ebh2FxqTzeuZzC2P2jooG2CcBqnRBDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odU5+1IK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odU5+1IK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso6610275e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329734; x=1785934534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3c69RKvA+f6vz1rynv3Xy+wD041KoVVbloyxYN/KJv0=;
        b=odU5+1IKJwDpQ5e5r81S1YpX4bjT7lyMDgWnAM2YYqnYk1fSd2Js5mBCGU4sXuDTYj
         XhYNBuhuDuHshPQwrGdZpxe9FPF0ZwBcj4/Lx7guLotwEkpw6iX7GSf3/osOz/b4L5Z/
         +r0RGcro6WHgBwZBJHK2t74ZFC7TBdFRAVWNfKwmGgvHx+U4z0KtTU8g0aCShIg6sQTj
         w4w8FLhdTIoh4Vd4GLhn/YlbKSPHABPljZ7qyqJ3nIFr6oBYAhKbtqfDWC4wP3aDhoR8
         PapjCunO/RB9m9KIHsDq3tJGmJkE5cr7C8FuCGwTMobkty8s/zlsL2BMnwX/IjTIsaAC
         WvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329734; x=1785934534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3c69RKvA+f6vz1rynv3Xy+wD041KoVVbloyxYN/KJv0=;
        b=s8A1kgT24yTJ0H8Bc0TnVNgJOJB6ec+mLfhHxDnn360uPb85a04ICyJdP9pjhSp++Y
         B8you44rMA0dmdHYXz1Biql0gd1WO7/cnnOfpPDk+3NLRVYqJtPIGuzFm1Yep5L0+BW5
         N9a6krQzB8QV0loIROfC43vBXWyNwOqg/bUTb04PT0G0TuKWdmb8pSNP3KEf+M5C0c+k
         EXPlXK3xIfTpbR+Fk0SqPQRjRw3M4aeDrDGER07uXbLn+hVbZhY3HHNKjUFquKA1ui4b
         gSptG74n/YhqYQ/LG0uYESygtoB24osLLE6gwv5y8pr4s21AACB0yvboux03sjiPCPw0
         oyYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOUHjyKKQlEYkEhWmeYO7dEqiddp7HuwcKy4lpFDZmSFvZCTipUygdqjNN6O9gF9HzoJHnLyQWnVm6@vger.kernel.org
X-Gm-Message-State: AOJu0YxDB4ba+fZJEG0a3O1iA406x06wrNoF9hrs1sIBPRVoAqKkiZZy
	KlJs0a2YpdawH0kX0WJiDjOg4KVXF0ULFqz397YT/K3AlrMpOW44uV0t
X-Gm-Gg: AR+sD10yJhh52yaax+eU4G05NMjAqGMYc1SakPpQqYf/0Txnf3ON8PE7SgLexxUBsjY
	kzfiEg7WUUYhSF3FfG2/5LQuCw8aHg20lbldSyP37ZQDAlNpYp1mjJVv9GBuNJREA3i9LKfl6T2
	Zvdf9GOi5M1HPKlb3H4cqeLp1LWU4Efuu65j2Qz+fiqApTgzObtByyP6OBUMAwOfuYMpeAg+kSC
	EPeglY/WXQKcHhBptj+XW/g7qdKX2Ss4f8bTqqkufOCAthFoiL10/srKClk7bKmLkwmevZ7uwl4
	91xaHR8zeH99Y4FpLS3xSjGnE96Q3oE0/zRDNXCsVmLFxOwDPaWYwO/5JB14Q3OJ1toDXDAUTm7
	fM3JHd39WwdKuy3yAFULsPqgX+FMM1orlaTqLXQx0CmZFuZqcLvWcyXA6r5AGbZF/wCXYEjMTtE
	uvc3NmOom33tUUtK276rB3mqhilbp09C1EZLHAseiIdLMjnVHLT0fBCOTnqMFvBfscNJq7olcLo
	0hXsmq4fjtlVl1aSwi6iVRZ
X-Received: by 2002:a05:600c:1384:b0:496:c441:1354 with SMTP id 5b1f17b1804b1-496c65744f0mr79543445e9.29.1785329734116;
        Wed, 29 Jul 2026 05:55:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 07/16] dt-bindings: display: renesas,rzg2l-du: Document RZ/G3L SoC
Date: Wed, 29 Jul 2026 13:54:59 +0100
Message-ID: <20260729125516.230757-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The DU block on the RZ/G3L SoC is identical to the one found on the RZ/G2L
SoC. However, it supports the DSI, DPI, and LVDS interfaces, while the
RZ/G2L supports only the DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string,
'renesas,r9a08g046-du', is added for the RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Restored ports.
 * Replaced endpoint with port in ports node.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 7c84a9ecc7a7..5c9b15a09dee 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a08g046-du # RZ/G3L
           - renesas,r9a09g057-du # RZ/V2H(P)
           - renesas,r9a09g077-du # RZ/T2H
       - items:
@@ -65,7 +66,7 @@ properties:
       model-dependent. Each port shall have a single endpoint.
 
     patternProperties:
-      "^port@[0-1]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
@@ -108,6 +109,7 @@ allOf:
             port@0:
               description: DPI
             port@1: false
+            port@2: false
 
           required:
             - port@0
@@ -124,10 +126,31 @@ allOf:
               description: DSI
             port@1:
               description: DPI
+            port@2: false
 
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: DPI
+            port@2:
+              description: LVDS
+
+          required:
+            - port@0
+            - port@1
+            - port@2
   - if:
       properties:
         compatible:
@@ -140,6 +163,7 @@ allOf:
             port@0:
               description: DSI
             port@1: false
+            port@2: false
 
           required:
             - port@0
-- 
2.43.0

