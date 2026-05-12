Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE9399351
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576066; cv=none; b=SIdbA+2Rxl92j06wLXyINoZ3sn9AtES3+um9wrOLPCdIIhuId2wBOXDJBC3qgsh2IGGdcO0ns2kZlfCevyTywqswD/lqTVhIerlr46sp60jBrG5frb/9tI7elaRJ10iVFIVXQJnFfDCqMxgNWn2WBL/0cZUsCnjYbr3NNO677rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576066; c=relaxed/simple;
	bh=NYDrnOOOgn8Ef3ZRO2AcZg5yyYg/Eg3ydQPX/Xc/pDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMopTKzFR/WQoxBYWae3amZJjc2l1lVPQjOVaoTdqG/RVXM8EutkecF8LwtEhHulcBx9gtKvNK/KXOow9+fx5bZwEhSf1oDGGitaGbAkakY9Y+mUygG/aWx9T6FRBMN5ApPHOVzAwtDXb0m/BY7jcBp79kJnRMP1UlVXsJzT1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kVU/fXGt; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kVU/fXGt"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso1282109a91.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576060; x=1779180860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=kVU/fXGtkRRBUgDRJANLWzYGBVuTDs8o3iz9hR2/wfFWqoLbbBAiYyl3SYeNjengWj
         MMJ88aZBsXQF6Y0ZXiUS9SQl0FmjAiTM6prSqrLY65hvHF7a/fh1XVj2Aew3oEZGGjyy
         HycC/ua5MQvkKelz9CN0TsKo2UART7E0e0sxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576060; x=1779180860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=VvTiP2eSdh3zq0/dQCWt3gI6jYzuqHbeuwHe3ZkE/JXHyJaxBXOn6kL7TqK6Zd+xW0
         GRuEIJviE+wjvlcL2Y7Dpc1dFOFFnTgaR1rJtGpL1WtyWN1P+UIHiNgznKkwqfQTskqH
         r84O4o++w2msb1IhlFAGBbfTs1qdX0hw/oaTFmYGsdN8FX2s7YVam8fnZSDeGDXFY3QI
         YS8imf0STv/p6D5MAXVE8wgpeS/ywJDEOydfUPiljG+k50/knSLfRq6cjlX49xbCetKv
         hjxbF29xZ4d7N6njcMEcpycgY3lI4vkBLBkxTvRmTnQjN549CGy5YpGBVvWHcXujXxW+
         +SZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aAYOA3UDwDSUGmXl315ImRvwYmPo/LLxb0ONm8/NMa6gAAN2+BsFVCblVH/cHAp7jgHfoC0cw8RWv@vger.kernel.org
X-Gm-Message-State: AOJu0YxqpHZLeCOkJXQpygFLQi1uZ+5N6e0QSy6cSAIiZtyyt0fr+Ok/
	EsSmO39RwBYoftB7QRjUdHkDHncQRc95ANVlqijUNy8KknyOoHp8k7sFAQvGQ7IGMw==
X-Gm-Gg: Acq92OH3272EYNmPfIj2nFkx+Ozj24Feo3GyuymZjHeKWcFJpZB6GQ7NUsKTPdtfOGz
	oohRi6nHQRNbaaqg+Jmvekb7m8tKd5x+6iY7Q+14j0KiZM2n8okfzQaWK9dbuXRNyGAnGSU+MhB
	lpaN+4PQklmrQ223OINFOM5mq8YBtqQXe7hnx7u0q/TPRoRdJpsec+9Vwv22ZQ7OB+fgFlOwkGq
	5yTpb8TBtYH3CzaZl2oHA6pK+af90znAAFkrdedmikVGcBVRtCO8CI+X4W6OPbbEJz3D6b9V6JB
	aiLQmN+XQF85LD5vfaU2KAsX2KtREVbn/cG8t5hFyTDgcZ8Zvpfd7Vrsf8qpo5qY39aId/tJLI8
	O0TNU1PhRBvGLYeT16KK16KePAky1H8x4OhAslNLJAYwrITv5WjcKCmPv4olLPgmnvgH4cPPK3i
	T29w/lZdTkvfdMaRRrEDi8n92yELmHVBJyiU6fG4zrhiIpUQtwDCCad8wNcgMpJPZ2RYNwge64b
	qGERpWyUA+SlpaTt9w=
X-Received: by 2002:a17:90b:3fc3:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-367d49bc472mr13305606a91.20.1778576060010;
        Tue, 12 May 2026 01:54:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Tue, 12 May 2026 16:53:49 +0800
Message-ID: <20260512085358.1693208-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Lee, request from Mark:

Lee, this seems like mostly a regulator series - OK for me to apply this
patch and send you a tag for it?

Changes since v2:
- Fix vsys-vsmps-supply property name

Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..9e6053677981 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsys-smps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.563.g4f69b47b94-goog

