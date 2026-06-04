Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784638F939
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567015; cv=none; b=Goe9gUceADL2G3w+mUwwGrAdI33rr8sImZrF2gp9gEdIeSxLiZQcioCESe9FcdmkUXxYyzkoQVoOFoJFRAxw2WX+7DBq6BU3AvHm2EcCdYsK4Lz9w2EmLwRnQZtpD2AaADCW2u1N6ywjjEpcj9OxRXq9J8GQDAXSW/QMxQQFSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567015; c=relaxed/simple;
	bh=GlK9ixHx54Su6flP5suqw3t57abQqWUB6DRE7SgXo5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL1tb6n1KnvEcKYNSABX/MrHjdOpjkpyzbJ+AK81mXyOBd1P56qaxQi0KsLN1bPSKwrCQ7qlPmLgMT1l+xX1DgIOH6veKnGhGi90uu+6hKvj8afuOjKh13kijRZJ7/+p6VQ/7oFaduhyjcvpZ46sKSRWa7NNJRsSR6BWqa9FLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USqgekZk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USqgekZk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4045465e9.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567013; x=1781171813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpnqT/H77UIaNdz4UGNV31fQveT8Q7DBDQnTYavMONs=;
        b=USqgekZkAxbpGQV2ymPvT1uNwjPrBfku36ElBt/jclzS/CHcGL/dTM/2EzLQwllb1b
         LK5klRIooUYTdjT1AXH3n98y1y0NgyVP2yM/9dsrra2nmwfKV2/BGyLo+RH4R5dgh2JT
         a3vbklzKhfS6rAUbSkxDoijh3FUcHIFBuoP1b7IiDu+hJOEISUfrqmFEwZUSo6dKOG8e
         +IF/13eVJI6NzLNn9qfp/xbXlnHGyezVzfhtv6IkJE3sUW8drNexJr4Ul/q0HXVb+A3n
         JXCtPyT3LvOlQp4aq2ub+LD35Ud/crSqew7XiLwhVxpIFSo436RyrcAIFJeFBvaac36f
         oTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567013; x=1781171813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpnqT/H77UIaNdz4UGNV31fQveT8Q7DBDQnTYavMONs=;
        b=VosMPv+wGW23AKxHtdbRGG8qo7wTOdx3ke91I4o0aE383C2oCg3nr4ooByVxYBFoDj
         hlwhvgFFgJpHtGb8bWYeL8M1AlfNILbfR0ywY+l/8z168s2xQIdEA+CimxL4mBfj8atY
         8AsKiIy4vkTvT+kQawAWrVsBngvnB2c3/SrODgpfpOXFSIdODpfpTR2OimB0F2758NEH
         SvX97x67YdSvhgBP1tx1tGnCYJTKpj1hRtsUdCJadsM7mWZXjYEhr1omxoC6QJ4dv9WS
         gzbrrE9tASIfxXf3hYVoezwOAiu0p3Wd4Vh3EqC6KJxuegYVG83F5yZbQtyfAsqF+A3c
         1Amw==
X-Forwarded-Encrypted: i=1; AFNElJ+7DXSF6L4YQP0zJqnezd0Gh2tuwhhtik1hzUdAqUNXSnHnm9Io2ZNnuP/klRrS/jfFVPvf5q1qTfOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxSZlhkc+EGLxlh334KS3RYVTY3bTpu/OrHlEclXyoN3ZJ1bb
	6yLZFXt5LuElC4sI6QCT30MlLQ//4B8tTylhVDvNwbLIIIWyXMad8WUP
X-Gm-Gg: Acq92OEDS1HdbsqrZMkRJhUw5fUr6pcAL+lXA6HsxLJC4jTPtvYOfT99eOe4Y7V/bxF
	zsKSQlAjPLgPsn/gir+QTL1PSFaHQvhyrJVZX9vZ8osIhGjm9mHkB9BLNQraG8XqjecHukpaX92
	y/vQHQWtpaiGqj0ytaTdABzhEJpW1wTwoh6x9OrMz56wOo30FTD9dHR+nk211nrI1SfWZ+utPeS
	TeK7I2DdK1eKM7iiOHXDFFQarV9yK4P/g1KmS3FVO2L2joWrK0qI/Y+4Z98/2IYTyedGuCALR9m
	libZg71r+ioRAsPIkghLoJRIcK2HStTV621wNCpeUP4b6dpo9khJkgfj6rhmp2R49GUJquNbixb
	l66l50vQVqw1q1ftLTB/S8ZxXLgRB95mLG29MEp5KftbVnb7FNIa8l6fWR/GzZfK/8eb0PPAAV7
	3rh8sGzHX8Lsset4fHeKMTM8lpY8acs2WWONNmgauOmSf0NvCvFMsMEi0LZg4=
X-Received: by 2002:a05:600c:4453:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490bc50dcecmr42162245e9.16.1780567012510;
        Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Thu,  4 Jun 2026 10:56:32 +0100
Message-ID: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0

