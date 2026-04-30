Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1F23ACA65
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543785; cv=none; b=XjvI6yseyuC+ciucZZjAbrzoA60s3ts+jkmx6963+wjUhRaAetuZ0ibqh5s7BQ12yO8pVkyTdClnh02uV1VFRNDONsCEOqwwMrPoEjSNpdZRNSPzrHpvi9NlrUhybi5wZcqppjnNbPASdzISC1WmBAUnqAPlcn0J1LHzewYuD/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543785; c=relaxed/simple;
	bh=R2mGUgVgDOXquc18MO2nFUnPiIUFtzW2JSwhhXHeA20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwAjbUIhUBZ/iHv7X7u/jWW4JjXQQ2nHopYyEH9QdhE2v3B/j2NOSL3D9i65NvTfhgGwcyv/zZgynL2n2lpsTLzUWx1lGu06LAtZ8obo8Xg2NKTFkc/SQyfyz1K/MnL6yVqgfCGoonYgR2lxLPjqt6RAIEtprSyNZiLAzZqBHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER2bVgf3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER2bVgf3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso8912375e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543782; x=1778148582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=ER2bVgf3syhUBnYlj6eIo34Mc3DUsBW1uXi5EyuXGpvw5CQpkSuw3/fZCWZHzadJzS
         4uh3U8XHpboAyl5LM3JaK59VJ/XB1Lf66TndL38xWpyDkD6ND+9R+Zo+mXy3F10JYB0V
         VEZjldXZcN8g3avG9lbVLCaWIXpaWnYZpZcoT3VUOQgjlXQXDLcwCRDuUUnwuX9GuhDl
         dJcYRkwGNEjJw5889AdhDzrk2ubCx/u//t098iz9/dhNwFvMWoMyVimKT7s8qzHlKHHr
         n09+ZSXVO5V9M+yZToYfLULHvHpFEJGOmOfiYQxwiRBRVum5dHc8QCTzxVG0er32ufRr
         +0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543782; x=1778148582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=AR8t1tApBRSDUzWY7hTBiMUnEOFvSlDIuacEWycAGbMXjBxwLn5n1fq5tJAwvBR5xq
         zu97yERWm0ihB2bmABrer+C2NUdyAFndCrF3NjN/oreZhzCzwKL+/BxJf8DumbMB5ZZ1
         WgUR8wKhdhGYqWKOhqaMUddGQB3cMZJXdKlK6xTHmlEnYNftV+EGlYaiKjG9EYxu5sN2
         iiHA16HV4NNH3u5PmgEmhX+uTKdI/jb3O8IKLLIn02YCp/khM3Krywu5Di5TEPyMgEjH
         C5vzI5vBFiGUb3O2apfdXlCq80i1AA8GeazgLLNQf5t7CtumoAfET1gsro5VhKEEdskO
         HdTg==
X-Forwarded-Encrypted: i=1; AFNElJ+IE4BzQ9Iw64fiFcwSJ6Uv+4tg0NLFuQ4qL9iogCE7CG3u+1Fh2pRbkQ2Jd4QyPPfaAyjH1y5CxzkH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7w74SqK73peNCl0eKEgprK2jn2x4MWFopb6S+7a/fxRE6yy3d
	TAD0/xLUIefUuTT24mJH85YIdn7BXCYaJLMnPePdXlpGlQfVcbsEqHZ5
X-Gm-Gg: AeBDievccNoCAGr1TLFnE6oxRqtNgEn8YC23VO/PDy0WnkvvnpexLxwmtddBDRQb+Jg
	XR5NbYodTvydpSBcSpWO1sU8WZPEfrwTO2D14RqkGum9JAm+TKKBh69SstQTrcycYpAIzQ/BDH+
	mWtbl4q99x/NenhXY610VGlmKj98zMI8B00NePJYSto5Qphrl0fbYs16QziPfRBKypylWOAFeLJ
	Tpmi35CYQZzhtW/Q6C3ExhsSKNLYa70Hq2vpKcpt+Ca8rmzY4j8viJEI19a+ri2KwLMb+AVKVlN
	4DxxsAq8PdG6R+x1XeU7hN4vhkljzKc8Pj03xIQ5Ld+VuCm/oymwN8pc9PqD5eKKdfvKYRROxwc
	P5Xt4Cr8hVd5OylfgTa4iAGDzXe6KjH+Y/2W7tRrs0lM0NWAro3PRKS4N7DexFIGqV4Q3uHITIr
	6fcsGch+kn28y01ASCf3Q9xCUFzxKIMTL2rypG08Lr0jMo+LGcKRALB6hb5HhR1j+1Km0qFP02K
	nC08jOnBUNMzdE4MJLMTqmsDZ2K54bQ58acqc/T/rY3RHoW0AcKoriP1A==
X-Received: by 2002:a05:600c:4fc5:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48a8445dda3mr41087235e9.27.1777543782165;
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:27 +0100
Message-ID: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.

The FCPVD implementation on these SoCs is identical to that found on the
RZ/G2L family.

Update the schema to disallow the "resets" property for these SoCs,
reflecting the absence of a reset control for the FCPVD instance.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 5e11ae0ee456..cbb16a7a5481 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -34,6 +34,8 @@ properties:
               - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
+              - renesas,r9a09g077-fcpvd # RZ/T2H
+              - renesas,r9a09g087-fcpvd # RZ/N2H
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
@@ -66,7 +68,6 @@ required:
   - reg
   - clocks
   - power-domains
-  - resets
 
 additionalProperties: false
 
@@ -83,6 +84,8 @@ allOf:
               - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
     then:
       properties:
         clocks:
@@ -94,6 +97,19 @@ allOf:
         clocks:
           maxItems: 1
         clock-names: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
 
 examples:
   # R8A7795 (R-Car H3) FCP for VSP-D1
-- 
2.54.0

