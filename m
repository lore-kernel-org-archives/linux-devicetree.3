Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02D479877
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325829; cv=none; b=EW1c5iLXmLPMoR1FGRXwxxt4xZi/CmPv16ZQw9mGy6GOgWyxIv05TbGF7YXHrfHS5NfSSc0IfB2Oxb6wHpUc7N+DSu4PfC78ZrHZrlz8wJvzx0jNncQEOggVqs/qxNUEM/JsHWFCYT6kBkE+HsPVVEWmaNjzI+mLm7rsN+NUJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325829; c=relaxed/simple;
	bh=SBO8N8w3DRM6UtjYAlG5juEAPFc8YFeFrNEt8eCCPTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcyeIDMCOYxjCLuFU+YZz7RJLVjBAzJwDeVfl1Jk7MNm7OVhRUtipPk2Evdkqjp43fGVTv3+oVSSuUIrpYeu/OYC6w+BpN4MVFA7iVRUyN12wzR0qnlsx47nt4AG9spNWZGip5xT1349kthavtTv0IFZilA5UKkXtB4amM34zZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYu44dxi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYu44dxi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso6153655e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325826; x=1785930626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UQ/MDQaOKz7si4QdkefIr2ebuHiYck8LL+uFKCxX5M=;
        b=GYu44dxiCqp4KrqGI7AC2KtcpTPBX2xGkSYbjiiGNCtYHYuPaD3NmEHFg/bmGmACtc
         5D93uzG0grnL/7dUEy5Ru2XZL1XgmKx/zEpz3oSPBGglO7iJK3++ZNiFdkZVIGzEbeBI
         J2vqAcBE7wpStx70KnxlB/BM/6/ZPHu8yb/qMHq5/ni9De3TjX+wS9mwP7C390rB02Ue
         MN7K3ZDV7seG5Sp+80HHCrKG6Kuwpv9iBt6+Bbi1URT1GtVhbywX6WEP3C9AXxSq6bLz
         jZ57nUfJaoX1Su9SqIA7uUuvRUHcUR5IpFRRAxWlAWPaBnpEaCfn8BwaAOX0iujVz1Aw
         wyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325826; x=1785930626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UQ/MDQaOKz7si4QdkefIr2ebuHiYck8LL+uFKCxX5M=;
        b=j2rDPL7B9DIASuHi9AbgWvhZdvvzEOsJ8MU8jy45Wox0qC94G/xe6+neH131uSH3d2
         OSGspqZDJbeE3lsYL6DEJt5ELeuCTbDozxEnPkZFaD0y3EMt5KaukJDFESXExnAppG7B
         tLf8hLcdZ9LWEP84OEB0jBhm3Oe1qIs8xqL44c6yNzOeSq5SafZTNV/vFuwu9qGoApyu
         vLLiXszcMVw3BOaRnNCi2j4T61m7qL8u5Jn50URanuhzy0NFXr7h/ic6VgqHxLt+fjlK
         cxb0fo7cuEQh5jTfEHzwyVaLfvgG/GbfKWZeJ8PAikECNhklDP4ahEPiT2JfAOSbON7O
         jWbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo1rkW27prYEubJ0vp5AW8x6cuovXP/xivRJfVHW8c5INZeFuJlNGA75e9ADi6PKlPgSNiByRpaBkm@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNAEUVuVK+hwylbZCAJ0mcN9ePt4P9C/bizfV+IDbKKHCU+Ao
	LTN1pXY85M64zqjpiKriYuwq7xNbNhE/4n/AfhC4oTuoGOmcIiWnJbL4
X-Gm-Gg: AR+sD10hSRFzcqigHC4IshCd6Fl1SIKrabcW21ekiHdDSQ9MzBQwsH6frmLRmXKuq6I
	kvgmnsPC+RNiGxO0NA9DnCkcREN3O72k2EI3HMYA7pFyHg77I4aXuhz2Gzhrs6Vh3yB79Xayxsq
	fp67b1AK+uNWsrXWlWYe0r7OVy/8XDz3O0jGGEw01SQrDnuNu72c3CJF8HEU8u7x1/xInaHKcBx
	NZmfCs/V1C1kciz+q6jjaMni8ta4GaatNkpn6DnRAiLkXwobIGno9paMKKuK2kRg3QOKRvDr3JC
	YHeb/JxtYqHaqjIcGGqvoWjeT56K70Jf4EhTGqDlHw1UJz8U08R68Tfj2YqCrKB+7l4ZbTBovmM
	/r/VN63rn1Eqk2sUT+oQpAXApiE6ug8gCVyu6Bw0XO8r5FHF4rLyaR2H23a3lYl9IPIxngHVyVh
	8GHB1TUK0wSMPIyoa16EOmcaZsuyeuF67cZjekT1HsaSg3TtTGzzlpZ3ZSZLpXsmsS8hViyUIVO
	DMP4XXtx7+tAA==
X-Received: by 2002:a05:600c:e548:20b0:495:6a24:a92d with SMTP id 5b1f17b1804b1-496c658eec6mr45312205e9.22.1785325825860;
        Wed, 29 Jul 2026 04:50:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Wed, 29 Jul 2026 12:50:09 +0100
Message-ID: <20260729115022.222340-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
port has its own OTG controller, whereas RZ/G3S only has one on port 1.
To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
v3->v4:
 * No change.
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..9e0c45097657 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,28 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    description:
+      list of vbus regulators provided by this controller.
+
+    properties:
+      vbus0:
+        type: object
+        description: Port 1 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      vbus1:
+        type: object
+        description: Port 2 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - vbus0
+      - vbus1
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -71,7 +94,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +108,22 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      properties:
+        regulator-vbus: false
+      required:
+        - regulators
+    else:
+      properties:
+        regulators: false
+      required:
+        - regulator-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

