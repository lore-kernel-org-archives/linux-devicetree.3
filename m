Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A12CA4E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525468; cv=none; b=fXO4miEq9UMnoaes+MR4BaEoUIr3NHMWfG3Ox1YLgAQhc01rt6bp2oWtvD7OAb5IoNe64eQ1h0dr6+x9RTZBGTI6oXjwjJ0uHddxmwSzYAqj7zqCd+7QjXwz/uc9EXA2sAisSEi6t1M7Y1PcqwgMUscFGSP0SI3uMyinOTWGks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525468; c=relaxed/simple;
	bh=L8qSGL7/R0cKnVz8Ctv0uV4rXSfX+m9YTi5M5pJ9WS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqNlGWf5peEgcWW9O4osj97UYDBwGF3s32bITQlHV7PsGzdWu/qfdJ/qugbCi1FkwSdI7DIj/FR+j5QAEJzf9cApLQGPg/EcySqe3YiVA3Z4aqiJFS9ei0YnU1hNtHIS9ribjWUQ+ulopMhFK0dYoXjA/mSJ+ELuNkbfts6ws9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wppg+EpM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wppg+EpM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d102471a4so46592415e9.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525466; x=1779130266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=Wppg+EpMpINu+lnhR4ET1GHIseBJKvpjE1Y0ron5Lu4tUfBE4MM6673SqBCAJLkKPT
         9vxTuffieziEhwRvWvmKWYj3n5A1N6aw5MlqmzftKk7t0G5ZoyKqt1POqPkIev5eWQyr
         7i155bC7JD29tF/WamggHcPqDY4VKpU8SrIS9BeooQA0BXvJNR50o3Zij6T+pJAwDZpM
         veUZaseS2NAZdAnDcYwOtILYT3oXsvBRFIK4jsxR+bjuSZx1w7FbAvVDFMHXx5Ph4UTq
         zXj5hNsvFq4K8hAOKxEJIlZokofB88ydAHj05/k1Xf5Fy/Zp0VdnwIrlDQhX/pMVb8aJ
         4evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525466; x=1779130266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=XAkTi+YM9jteGeRgQT2iTUEs/5JwzIoJmrghW9wcwMoZv9D9RsBqmKeQvwGLsiXjWD
         X1/mBqnBUx10RN/ncy+GnziKiYz2btkmj+j1iMVsHyhJVoMEjIjSM/g73XUDxvxZ4tY9
         FkFO258iFsMOdSLlIu2vuRcCcbaMFQWYq/z+6VMB8v/7zYok7Ak3pN3I6TSdFW/bWn+9
         n19dFlxaI1wN10C5KK4R3yhaZyMxc8RACtetBjiJXMY3S1wcoA2jCpsPpAI61/muCQym
         MIRretI3ILsTuPjqRLYhC+1kwFuqUqarRJWruoXN/+CihwaaW79jNShgtpMR8gBYQFvd
         PXHg==
X-Forwarded-Encrypted: i=1; AFNElJ9/QOCQQlwPE+HfKbkHJouQYD/jtRG31AnqwmM0tfjHx6KxOqpKnAGtq33B28JII7S5JZyYC7Qqi+g8@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcapvbld8aa3kY8uNlMt7qvUds4S8Y6yG+mbUfSX5TChc7uWj
	85a70/56+iEMbjLz8Sr/oMN9/qEoC5KB6WV/bY/lONPMVuOCLYbvbnLo
X-Gm-Gg: Acq92OFf2W4ozvCw9/TDrt2zQzlZTu0cqaVFaIoZTfC7dfJihXK/PGnaODbnXp/yOHw
	cA/G3Yu83CBttbYDfxDry+JaeqakuHYqCyl+ldL9gZieddq9WgF6agmUDO7Q+aNnrQrD6aqh40z
	gP1488nhgvD8NV1gH5Pf246Y0zYVedJfRQyYrkvIcc33uN5PdAwSmHM2Z3SHBKHkzlrJq6qtKBn
	zEuoq464L2/80mYrW4qt0pDN8hv23dk9hRP3JPEYG6E+FmlhUstm203dbWkzK1wAf6Natg5Jv3m
	r1vcw7ef0+x9BsCB/G6fVY5XsTw9pG1XK+z1HxBivsRYQMwIfg8VsUkMjYF8KLMnq9BoCop8FNG
	OdE0r2sFC8qW79NdOaV1468tURs00hlM9nkg5pYfhnQSJEtrIEndvDnp0YI+UrRlFk2dKMtHjlH
	duQKAlF6JToP4k/G2I12SfqbH6020PSnCb5yrKV5OZPkwwf6CGqFEeHWFVN6NAcmUCo/fS7M/71
	wIJv/mWzVCp912+OjJpN/WDypRhgaKbOi7kKg==
X-Received: by 2002:a05:600c:4355:b0:48e:85b4:ac7b with SMTP id 5b1f17b1804b1-48e85b4ad2dmr36220615e9.18.1778525465458;
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/9] dt-bindings: clock: renesas,cpg-mssr: Support RZ/T2H system controllers
Date: Mon, 11 May 2026 19:50:50 +0100
Message-ID: <20260511185058.1926869-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC features system controller blocks for low-power management
and access control that reside within the CPG/MSSR address space. To
properly represent these hardware modules, allow them to be defined as
child nodes of the CPG/MSSR controller.

Update the CPG/MSSR binding to support child nodes by adding
system-controller child nodes using a patternProperty, requiring a reg
property and a renesas,sys-block property to identify the controller
instance.

Restrict these new properties to the RZ/T2H SoC to ensure existing
bindings for other Renesas SoCs remain unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 655154534c0f..ec13fcaf763e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -99,6 +99,41 @@ properties:
       the datasheet.
     const: 1
 
+  '#address-cells':
+    description:
+      Required for the RZ/T2H SoC to define the address space for child
+      system-controller nodes.
+    const: 2
+
+  '#size-cells':
+    description:
+      Required for the RZ/T2H SoC to define the size of the register
+      blocks for child system-controller nodes.
+    const: 2
+
+  ranges:
+    description:
+      Required for the RZ/T2H SoC to provide 1:1 address translation
+      from the child system-controller nodes to the CPU address space.
+
+patternProperties:
+  "^system-controller@[0-9a-f]+$":
+    type: object
+    description:
+      System controller child nodes representing sub-blocks for
+      Low Power Management (LPM) and Access Control.
+    properties:
+      reg:
+        maxItems: 1
+      renesas,sys-block:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Index of the system controller instance.
+        enum: [0, 1]
+    required:
+      - reg
+      - renesas,sys-block
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -126,6 +161,10 @@ allOf:
       properties:
         reg:
           maxItems: 1
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        "^system-controller@[0-9a-f]+$": false
   - if:
       not:
         properties:
-- 
2.54.0

