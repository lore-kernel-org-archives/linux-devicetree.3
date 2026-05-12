Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C923BB685
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596904; cv=none; b=fRv7fsHHXayqhtz/Hg5WC4Dbhc6OwMkZYsZ6qYH1vOCLcDVJvO6TsLoo0Lms2/oAd1qjNbQarQJjtJB/uv7TyrbSPiP46zYfCzZvBR+rctHl8/ETla5e3fZhvkjIGRdTW7kVwVPzHmC9z2r+NH7o0D9O7DaFoui3stxxkbtHjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596904; c=relaxed/simple;
	bh=Las8n2PhcqMFxQgtnNLWKwatngfWthlZ919/bJHgRUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCXlQkYyKz2urFjrlnrrXuZlcrMPHmt7rS6Ift9ugE/ElCWYkYm27gLBLICa0soxyIrONQnUTxOR50QNGu5XoBVjNdT2DoTNpMg+Dx6t2dpDbLx9ctE2cLBsR4TL0CsWYTRHw9kFgcBgm1FB/JuyWX5ybNgPaFy1uTSeZ7qgLj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbPjPf4z; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbPjPf4z"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e1860558fso3643595f8f.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596901; x=1779201701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/kJIKcZqxJ8G0thiFyFX6xJiY+UhKIMT0pGQl1UUr4=;
        b=jbPjPf4zvlQEnn6u2xe1X3Kny3lGvIG+JaiwfoxGtnjxGkQB/JujWmLLZK7X0e2cJH
         3X1QkmPvoIULqQ4KHs4b8Hn17nq8B5mDfPCZM6HjlUUzrYBCwsrcS5x0DI1ZSI0AOuK+
         Yt+wL6WsYHL3h7pdmhhEA1jqNU3v7AW7A1SFw0At9AzRu/1v7ZlRJmppun5Wir7PAlqp
         yBK6V2YOgK9vxxD8zwbT5dq1OGdFPMifUXXQkuyq+PFbK2cSfuJixgQ/4ikpzungybgi
         2Lw8QgIfNk4Lz43iLado3L/k43RwlVnU6BmOnbogoIqrKbQd6iSRdlRdadPm0uZL3pkb
         mBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596901; x=1779201701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/kJIKcZqxJ8G0thiFyFX6xJiY+UhKIMT0pGQl1UUr4=;
        b=rH/qPE4PT486htx6F0G+/gEVskuZB52kl6xeFKhzYNHkNSPqJB6M82NZ1Hi/oUnobC
         j61KB16SYwf/fkLad11qRh4j29XHCeNrKDyiLyafzoTAWiGniFeWUIdNQld8ogUdyk1g
         +bkFyS8KEm/2+20ASKs0i67QF+OZLC+KbVZ8XRWmEZirEn88VQK0ElMQaRDa5KQO6Chh
         DSoP5mjMyQulYlktWqT/1ZcGe6nl0eAzItcDXzdFu3zQEyVkTYPgAj4kSA+q6mLI+qhB
         GGoP8jspU5pMYQ2+MP3d9ocUykcNk9rZGPRMxKU8b2LnPMTumzxEpIuieN5sJkb7g9Bn
         YuiA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZMUlM9WI8+0S2qcOlgVLpCBZ5p3f+bXCgyHLf2WUM6LHS6Fn8kuxGIM86wpF6mvd4nlqWbUVCkCdP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/BVhHbxzgLh8/QpCFPou9tLFndW5saPeTZguJPEIDRIZEZBL
	7SlSF89/mfg/CSVgkMonziKumILgEUH01ua1NJPDCv7vxe0XVux7zalO
X-Gm-Gg: Acq92OHuaoEwzf0CxsYX7xEymRj86h1pvE841U1337bZhxg/C1cw6CpnUgaLW1O6Zhe
	gWydjwQsoSODB9n1w2+LbiMgONe2KE4Dq+hjd2SDcGBetolOj9PIK9DmTrR4oumpJlhfNzN4RMW
	pGcyDp/MllHt5Nz0+trkZhX5iG8cHidELXB767We+BxabAnYrmMqDHDeFB0htbyjzchiLgA+QP/
	v2kVS9fdOL2p+UBtz8lAuRTlVCaAeIkXT5VgamfpspYMlTA0rklAKF4XPyFOHT5wuP78W1l1b9/
	gEC3ckwuHz+VOpmWFoJws47oJMFMsCLT3BtJ0Az2DQC8foqeJzgZ5SBJZpl2Y1Y8PjpCaTxK6Dc
	qTbSkZcwK0v+GsKzybjA8CoAPg6NLUbG6Esk6cP/jRDpu8vCyImFS65Q7/7RokSUbTDrSYjsp2Y
	tFK4dHzt3sosdPZO6yrf57gaMNriTNrS0i6MOIlHv+IobSXF+kntvPQLGEHtRNMHeIjTIDTxDY3
	QF0mp4pbuPrsybSOaVZgFcoJ7elCbBuWak=
X-Received: by 2002:a05:6000:420c:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-454637c817fmr27827468f8f.38.1778596900791;
        Tue, 12 May 2026 07:41:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/5] dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
Date: Tue, 12 May 2026 15:41:01 +0100
Message-ID: <20260512144104.761531-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Display Unit (DU) support for the RZ/T2H and RZ/N2H SoCs.

The DU block on RZ/T2H is functionally equivalent to the RZ/G2UL DU and
supports the DPI interface, but includes SoC-specific register differences
and has no reset control. Add a dedicated compatible string to represent
this variant and update the allOf constraints accordingly.

As the DU implementation on RZ/N2H matches RZ/T2H, describe it using an
RZ/N2H specific compatible string with the RZ/T2H compatible as fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Dropped the "port" property in favor of "ports" with a single port@0
  child, to align with the existing RZ/G2L bindings and simplify the
  device tree structure.
- Updated the commit message to reflect the change from "port" to "ports".
- Dropped RB tag from Rob due to above changes.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 5add3b832eab..7c84a9ecc7a7 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -21,6 +21,7 @@ properties:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
           - renesas,r9a09g057-du # RZ/V2H(P)
+          - renesas,r9a09g077-du # RZ/T2H
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -28,6 +29,9 @@ properties:
       - items:
           - const: renesas,r9a09g056-du # RZ/V2N
           - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
+      - items:
+          - const: renesas,r9a09g087-du # RZ/N2H
+          - const: renesas,r9a09g077-du # RZ/T2H fallback
 
   reg:
     maxItems: 1
@@ -83,7 +87,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - resets
   - power-domains
   - ports
   - renesas,vsps
@@ -95,7 +98,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a07g043u-du
+            enum:
+              - renesas,r9a07g043u-du
+              - renesas,r9a09g077-du
     then:
       properties:
         ports:
@@ -138,6 +143,17 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-du
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
 
 examples:
   # RZ/G2L DU
-- 
2.54.0

