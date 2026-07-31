Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B98449B2A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514202; cv=none; b=bQAu0lL5i64dfW7Auj1rMB48/JSfGwYdFf1X7KBcKrzTDAgtZHRNw2hV2eR4asXrowKfL4oJFb2eIMWoxUm+5KDuDnyg+PQ7C/IWsCzyxtlcOam2mhDBT8iz33VMTsp1pXU1SnSDc6W0o3Z/tlwVyCNpF1NwXWfFtgptwsgipEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514202; c=relaxed/simple;
	bh=c1BBB6bs8QkRJGVWb9VKH09aVOOWU4p3wPWDCQ5h4r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QcSIALWNJg/GIeGMYPHugZSxRUOf6TqL6OXlMXEKFmVlchRUjP0vR+jbsE03gwcDgCY4xREEuXFD8l5qoYfZlRYil0YKALmn2QCq9Ly3MF7sU3S3hXoY5VOM639SjWzCYPbtkFEgUuXM06btYF9v8a0LyMGRTQxNya4vpDEQZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IoBht113; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IoBht113"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c197f968b3cso189633066b.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514198; x=1786118998; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=IoBht113dsuhP+xkyP+x9g5wics11CEgxNdfDuz2jnKusDOIVPRooT2O3X/GZUfEZ+
         p+IoktESQZaKPs3PKEEt5H+ULK/9/8Inlc+ouKiD0+jR6yFrJsOn/OBJth3LYWQeT8y7
         04lDNn16Jde255R2ljXq+H1DxfaNGXBPf7LtOwAL67HwecuUoA/E0NVKl9VLt/T5n8Ub
         bjjeTcQgzDuKdg7M3j+AfPSxm8K3+xAYX2pMgzhrsQwXneXdFFy2RQX/reEnpFTk69kK
         6u9pE73b7Bh24P6IHoW752kvivqmU6V7aNrqyBlkMpY5Y7511dMRnye5sC/fix/Fy8VS
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514198; x=1786118998;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=peZ2ciRHC5DS98UXe+VyRoJ94AOb9m/PGN3GKmEVigurATK3nWVQ6MA04SuO9fGt/K
         BYeu3/fn4aRlGFmAaHdqANBeFSw4D1VxeFQPvyCyGP+wJwcrfhu72lAklhw12zjEQNGs
         p6UvvN6xzvZ5Vi6J8OBGi4+8u941MVz4w1PR92fTUj0ElDywSEFKvP2oCPa1E1+Yg7DD
         fZFKoJGFkGTjhn5HaSdCqHODChhZU9p3opOkRfyyyj560996i4BUiJHnJv/B5q5HOd0p
         Jba59cXHW+e61B4QzQp2KyyiifHX8fXgstF9MAJG7ThEraS+r+rE4/rJCpH0/UslWl/k
         MaJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDY+L7NMHTESKv2LXJyCzl+G/I1U97sQmtdEPMnNqbtfxQWHRN61Z19nATmwgi9w8jLM8TuO0qtw+z@vger.kernel.org
X-Gm-Message-State: AOJu0YzPr6qFCPvwCzwwc0xeTgtdolyyvWwX+c7IYWENKLkyRvxDK0HN
	O1hwwym0HGlEEZp/pYp1KGAySIBs/klRMfoXu3tM+cmu8D3r0utrauEI/idxcaIbjUs=
X-Gm-Gg: AR+sD11D+ozAZPXkUnicyKcD8ihwQA6Hh9nySTXE68zyWR693h7wXjiqpYsW7Lm3Crb
	+FobKeXMIMJ+7oJySwOsx6D1sr3Hw0Vh2RfiuA3rmn66beidRPn7AV/AlLioMBTnlFMp8A/y3E5
	o6EYzMy15VfgkxE+SMEwa+3s50ymNyBHUY9r2usWWeTScDTBMrZYxc09LtY893fLQYLi6VTf8T5
	PKT+oEkQV91duZxP++5vYJsJhVc4wt42IyB68aWtc71IBub8MUuN1qYBs+gP0+h/+/UPfKDLoWQ
	8o6rNn/92EQEsz4/iDCuGAlQ8MUnzkKPykyh/0XBuRywArUCLoUa6gtqCXYREbR6/WWi3l2YQFo
	aW9jtujBHO3ySnFHh9tTU0ZYDCUxl1XU9t2Gq+qvOskTJmKSDupyejrao1V6f81cApVBrl2uNwe
	gmcYPsB6FXQsRuaqzi5BMYMph9sto2ve6lrD6mhofzPqHDFEhIxJaELcQAXA==
X-Received: by 2002:a17:906:f85a:b0:c15:cc30:6c74 with SMTP id a640c23a62f3a-c1fe816fa83mr13218066b.44.1785514198430;
        Fri, 31 Jul 2026 09:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd4562667sm6729424f8f.24.2026.07.31.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:09:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:09:52 +0200
Subject: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAM/IbGoC/yXMQQ6CQAxA0auQrm3CMAbEqxgWAxSowTJpQU0Id
 3fU5Ut+/g5GymRwzXZQerLxIgnulEE3BRkJuU+GIi/KvPIOwzy/WIQUQ+U9yoPRthgXXXFoU3Q
 p674+O0iDqDTw+ze/NX/b1t6pW79HOI4PZc8kdX4AAAA=
X-Change-ID: 20260731-allwinner-a733-nmi-support-fb026869d941
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c1BBB6bs8QkRJGVWb9VKH09aVOOWU4p3wPWDCQ5h4r8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMjTXlrz8rv5mNapSZHl5WcOPxLnYyYNtyA1v
 pQrskCrQ4GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzI0wAKCRDm/A8cN/La
 hZQED/9s3wGP6F3JuJnfZQb8AMYiff+jEIymztKBJmuUapVpEX1g6yG7VgtcuinzOj50NimCXST
 C5F4G0DVAjSJ0aNNtqfMnpuUHfZRGMers44mqlkR5eaUcs6ivK8NMAwCKfy8dW5HbWSKoEjM2vf
 BlpME3HnSpanmW90H5I7Q/+wYL8nBEtBrb5AwNV8eXjt1GrsVAA+QF2kTVZWNGWWEGTUol7I4mX
 6/9NK6wAnSZj5YFQtLfKH3yT5rO4dASNYXlGymkFjudS2R3LXarLSy/VWib4GF0d8KrQWUVLFeU
 jVQcho5P9+DOn16gFnf98uhRrW8O9Ye2HoP6UL43ICmUjNGuqaDEcA9F1Sja2Kls4G87S8XdewI
 4xT/YCKhbI3kf1JQvExxXe70bMvyqa/E0fE0OaUCT46OpU1s0CJTy05Abs6bHasfjp7SaX0hR6H
 vnvAB9ihBDboKlmfYqfhiLhDzE6rtPQq0PLwmo5VhWKlwGwKLt1myTUJbgFd9JEB0LmBCbDij1n
 GeGD9K/dzURhv7nXn0PDQph8Wde72L4swPxCy+zooa7IJPPUy/jJvtgM97FZA8oUi5EuQyPpvDD
 EbH6AadYG1kzLJOg5KG5/GRL8LK4khnWzPi7CYRQ9JgTna2edissvwBqYS769OE+afxoNzqb/FU
 mQLn7PvJkUM10BA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 NMI controller is compatible with the A523 one. Add an
A733-specific compatible string, with the A523 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 06e3621a8c06..bb9273ec2457 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -33,6 +33,9 @@ properties:
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
           - const: allwinner,sun9i-a80-nmi
+      - items:
+          - const: allwinner,sun60i-a733-nmi
+          - const: allwinner,sun55i-a523-nmi
 
   reg:
     maxItems: 1

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-nmi-support-fb026869d941

Best regards,
--  
Jerome

