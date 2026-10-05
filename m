Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7748FF88
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232101; cv=none; b=SymeDj8K6DvZWv29HTUwBhz6X7AimjEiUeix9fuhXBDzgEJGWdcR2UlVGucjjk9tl5J5BrkDgpdkcx7IxIeefK7YnTSUtIdZ9z8KE4VEMeJQGcTb/qDgPpFwAaSGgj6AzMJccJnnpZmiWhANo1noT7T3wANupSVBBgntbeUCmKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232101; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVWAN27JaVhCXfe3mCInYw+v246aSsYHjXP3tXwcX8/UnDFqT5+4SC7+dSM3J1P4BjWrvnQjKNDetGnnqrFSBSLDGOAAxzZDRfzwulRDydNDqcl8GNbFSkm1kO01mhyQtPp+4xDzVANHRZIRKMmRCtVH+Uf5AM8J6x2bOKu+9y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm7sDQFC; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm7sDQFC"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so2961371a12.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232087; x=1791836887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=nm7sDQFCwhbhz2fmwEF6zqLMwKE7kqgonfae//3MFeljhPCOUM6HKwAP2xpgLLvVz1
         S7XzFbWE+yLEic7Zplg4DaMC/gmdN3OuRaQAlh61ChaemqP7hgOM5F23rqlfjIuexozP
         V7OFXvr3mKldNnJWGPCWbUW48kRKa2B835qmcgwYsAdZtQZNHxpbrm7zVXm+9jsKS8iN
         C8bS2DyK2l/a8YiYq5qHFkLGJyKVLBkkpynHj3DKhxHCLm0gfYRukptMWrmCMJprxwWe
         vBoFtx+GD696BPJybMj5TvAZCkA0QU/PO1neiUA50cg3UvOeEFacyyzsxShnhKWGTI2j
         xzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232087; x=1791836887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=1hmUoMEjCo8zXuKQGfaOU+BmDz0QcbG0vG8rEVhNzMu4OxG+M/YXmyjKkjcpSHLs+N
         0pTw/u//2cwyLnJMgqgsQg/6Ej9GcnLQMIlYgpA+i8xY7WqkPhtDB8D5LTD5zq91xyPq
         gtZ24QSgk/lgOn0DjvZ57EzPRxv1mLAwPKM7n3eDARXZjwSkMQQ/syiw1Kd3OC83Kopw
         hunn100tY0WBVKz1BGR3aYHBzxs1LYeLzuahIcAeRkFp0pb/pfGpMUwOOK3RVvhCrBiA
         Ot9FIAup+RNCp3S2gQ4cgHpzo52/UGJTHAKDP6o0ON4GiY8XjHkvsFLaIlIkJAVEk35w
         8ESA==
X-Forwarded-Encrypted: i=1; AKwUvBziUoKDA+tAfODi/3dSD0jcnWqjcihBKxkH3T9wXMKjvkJn0cVD4rk7jVnEff5eqoU4qxHZtgh02G0U@vger.kernel.org
X-Gm-Message-State: AFq9FYJmENZyEj4aC812wJJCjMR9XjDST36lD5r7Ca2g2NiLXtDzAvKv
	Jn0aZ5dii5nxfXXTquhafsEhy92buspwoCF5yNS77SjZqla9jLrjAtrMNrn4gcsMpTs7gQ==
X-Gm-Gg: AYBFou0ta7b2ehFIJnl4IUWJu/9uUEu65yZski+bBD7vVfohwyXJY71gJVDZxkP1i91
	7QnrHiDIvKQDgUQExN7BQN6U1hExJZ3trdmDvXqZlPoPPHqiRyGpLn5Bdo+0sJPKSDIOrQZz+WA
	G0pT+ERLQe7PQoBDy5qpEPziN94KXsSUTUr2FoMRecXfg5B+uzGCSgy6B+LFdgmHE6TtU6dtXvw
	Bo8QOB29lX7qr73Wctw/x7nvp6fM0wrKRZqEIeV+rqirtMLvzk9Uc6eNoVM6wr4MIVrQhaqCrGZ
	6oNRw/aU+LV7r3HifUy/8lb8L1lrHB32h+BEuw6MRrsKMvdJMbruEG71jB4CCB4CADrVOigxa2o
	4ert4IPMY6f0SpTj73nSYgIdqh+uK0Djav1cSzLPxp/PNB4M6kJQQxQmP5C91PeLwg3U1vQ/6UI
	jWaREIsnSR25/wYqYsdD4CiU0mxWzZVqE18kZgQ+a1aX5vusMEYMCvPfHy6PYvksHBeN38M6Jfd
	8qv5C3uB9kq3bAmyWAtLD5TNPD2qziOtg==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id 4fb4d7f45d1cf-6af9e03ded3mr10580275a12.5.1791232087424;
        Mon, 05 Oct 2026 13:28:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:05 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:23 +0100
Message-ID: <20261005202731.153971-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

