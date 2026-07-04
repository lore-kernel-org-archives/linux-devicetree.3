Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D039D3DA
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157679; cv=none; b=uk+iUBJ9wsJcNj/zZROAQcjH0gY5T01C8o9KM9tsnl+fCim18QaOg0s2PbHApEyxf8o+aBFAK3tp8K6BJAiwbgEyPIbGk4iQNMnQww/2pH+o8q9/nBO6VjBp672En7Cm+vnMDR3tGRAmDUBEp5YvfMQwUYngpIaxFViMnoBzawI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157679; c=relaxed/simple;
	bh=9CkOkak3NtkBlSf4MxiSsL+TiDBp8RZoVM1VYImOVkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcutNmbbyrCZhaw7Lp1UyPmlvQ662ff55faVhvQ6qsDrXieEKA3Ir6wEV+38z05UDuOOOo07uLajkWOefg0xvPZQOa/NClxqms9sudh/XT6X4TFiDUCInY7xEKcjNP9/FsFjuoWRppD8R/P778eMM2EFBUw1EjuUGPWt464nlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7HHe5Uk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7HHe5Uk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso7545315e9.2
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157676; x=1783762476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXSXtsaOb98EsKaQXza0t57The+nbXRGOe9BEUF2+xM=;
        b=C7HHe5Uk/L8vTpiOIlHVfqF4vAprVf3dmUqbxhipKCZLxbcwPGah6DoLNfBQVefjC3
         9jH95OdnqO8oVnQb4zePfypK87DZ9B8zHzt46t+ZUxVvSHMtVd+lF0vIm3Rt+6LWimBQ
         SHubVaYgUIpla85LznfdZoYOy02LhYxNpkDE9A5yvY9jgbqxK+Qm1douVvVXwQ8270RT
         5ox9WHfOkyYcngd5eyQeaUvJYczka46gRAcoLFaQURL0PVBxUe6jBZx1pck3JBCCFpvH
         cy+BrSGChS2ugWPHdvYYs95BVsr8d5mouQxu+MiZ8dNH5fF92EmmH7bFGYHX6JA/EYKj
         0xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157676; x=1783762476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXSXtsaOb98EsKaQXza0t57The+nbXRGOe9BEUF2+xM=;
        b=eyFdu89kqzEMJ5i7F8jsS8zk+HMX1ICw75rRFwfLAosWYW3AM6S16VDZMEkAmM19/h
         JxhK+bDd5PmIDMRCZreeNoSQFgF1NkUM2ZYwmaXDASsHQUvKWIW6uBDkr+W7t/JZrhG6
         BkStSUeJrVDIujXY0dal681Y8KzzJoZc8ELYT/oQAODrqXCXSnHgqDfwS/vFzBDMXbQL
         EK4P+tFRx4vnWOKmYMlggL8d/EwGfsoJwSCcXytQ9UafMmHFOAXXBpYbiycfJpit7BX+
         cGnOlzY2b6N1Y5X5gNG/AescPzUsnOCIYrd3Osd9N46qh/jfbEDsPwzfA2eYFRFk1LFl
         K9yQ==
X-Forwarded-Encrypted: i=1; AFNElJ97vtPVyhYedlgkdUu5KChO+kGAaLVRTbShy7bYduQMomWfFNEDmSjUHj6hl+FNNVf+Af19kPYKau8D@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkD702Nu8RdR+Qc8pPsyjD7/p1anLHzSn+jHKVQU4KKaGAGW2
	3k+WBfRQ1YugqvvPlKCvU0oB/gb9nZkO6HABJ4a88tRjepjBGzPcO1Am
X-Gm-Gg: AfdE7ck6F1RIm7Cwf6hruiLfv6HngC+l14FlY3CYpDdCDiaz64RPyoSZP2AJ4yzMZ1s
	CxgaNPc3wuaPRnNMr4W7T+2aVi0CsohLtbaVMX/AD20ClOasPo4exlizF/9hTwqnE+BC2CNAlaQ
	OZAF3cSnNidIt0mUxvL8msagw+TuCgnjJTDpQ8/WRXlCp24Vfa/SHLKNNDFiOx3GPGhdfamVmCf
	5rqEeQRwUWoSEqf2DOC+FNGmy/Eq8RUUGBm1QCBTNr1LcM7L66FClbR6X6CuIlt1eJjx5+VBNBi
	t4/hw7x8oqo6NyCM2CDj3EcpEtB4JGr0ppZX6bYlBBV2+fdMnSKyiu7VS6GPg5vtjAqAdcYIX/I
	6owqXJNlEsuJWGWF1iXM8Go2yB0KJcIARyXthF7YrJQn6/nlH0xAiakVrADuo2Ct4IfPhtTVrVC
	YPA4axfDqdtPsvxrM8P4uL
X-Received: by 2002:a05:600c:d7:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493d11f7b3cmr19319105e9.26.1783157675922;
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
Date: Sat,  4 Jul 2026 10:34:11 +0100
Message-ID: <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
timings and also the PLLCLK is ungateble clock. Add the compatible
string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
Document renesas,sysc-pwrrdy property to handle the power control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..b114ac3b111a 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a08g046-mipi-dsi # RZ/G3L
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -108,6 +109,20 @@ properties:
   power-domains:
     maxItems: 1
 
+  renesas,sysc-pwrrdy:
+    description:
+      The system controller PWRRDY indicates to the DSI region, if the power
+      supply is ready. PWRRDY needs to be set during power-on before applying
+      any other settings. It also needs to be set before powering off the DSI.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description:
+              System controller phandle required by DSI driver to set
+              PWRRDY
+          - description: Register offset associated with PWRRDY
+          - description: Register bitmask associated with PWRRDY
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.43.0

