Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012837EFF8
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223089; cv=none; b=TtaA7Roj0qlw6cqxfloP6m2qHPNpY+VBTw4fiHdtP6uDVaiAfQUr6x0pWefb3v+xTXMDjtPkXBw80eq89O3Z1hdziUjgZH2CSIna6FUoGWzMRWzA4Cl4HrslhNi0A19Yw37FiFbDYcxFwXQ5BiWZA6gH+b0+ZcFT4hVrCOe0eaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223089; c=relaxed/simple;
	bh=K0eDSr61tMBeB/CtX6Gq0TUcfZhQn3LMlVfv2m9GtBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4jh4TF9TY23LeoQsjb82XAsCvLQ+jQ+C+GRR7KorsgkBjEToUw6fJCQ/0tFXugOPS8cGZJxPnn8UpAcpx+AUtSDcn3EwpLNEvY7HWzFfwi0fZ1qtAQDyG56kNKYu6hWyzYWZTbZmNlmkYuJLurY7K6wkEmZV5A/+PHBa7p72Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEFTnnxl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEFTnnxl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so59154035e9.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782223086; x=1782827886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=SEFTnnxlYa1+ppZzQcRV/VhDPYGDobhxlnhEDfalL2Qfj1yszhbgY6rMz6GD9lYL/U
         6oAMZJZF+MzbLehm0TexOLai8/7VQypadACQNFvA1N37gBLnsfWimxm7E0PWxjbwmiQa
         p79sAvGMDtxCkPQq2TR4sB/mpTxEiAcCNllaI1idD5M/FS7yDmKduClqrq3Ni86kwexo
         h+LRkGHm+KSKtFRiKaeHPZYIt6IunS2UK6xGJK1FtDwZr1KtbCEcgnum1jqL58uZf+Mx
         7FDTFfjOGeEqOwP+n2CfbN4+ekhO5zoccMtx4hhOo2bVcbTXIYZtSyTRhCXoDBo0PF5w
         VIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782223086; x=1782827886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm9QBhEQ0YB2AXes3jM+Kp4ITvGr2+JfvL/tfEuQ2tI=;
        b=DXrKD0rGSWyf9zlnuxDIjGBKagk2U4X2ubkSPxj9n7q3qaCWjYGiLTFy02p/kuZmnf
         1N/kaguP0I9nVdu3axubpxhTfOLqLziJJysUQE7Rm0OukkuU6wD6hTa4NBzMuum9EA5e
         pXihly8CGo5Kkc2G0wEdazDBHq4kLA7iSF1NVb58NYpyHGyi97I7vB/DY/bM622Bg7sm
         d4O1a1KkmtAZgIVxRJf9nU0aA/RazdAf8aSazPe7HzcgjFPeVs7jmCqNGphWAcfOWJjG
         Ibz74ZNi8aJbZVcPZqCQFzepVJkRaMt8Lgo3CHc/G2oEZmJFOrMYl2zD9ZNxe4DZQyTv
         RjNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IOZaaXjDVpUm4x1vwWod4Ol9Cnp89fZz2CfLDtcwVueQchVT4pylr1i5N8JSk+czltP1m4eySalXB@vger.kernel.org
X-Gm-Message-State: AOJu0YxvkVxthJi3GaSai4zvxPR4PL2/ZWw6Y4s0DdzplNTHTg74UuFy
	5ug5eXmukFyA/LhY0SaURABmhduiI7eB/jxz4vXHFvgDDziw8l6tNCPG
X-Gm-Gg: AfdE7clkCRsOtETkJVsR5+gVc+Tb5UPk1ePHM+db9LRNDnkbg7tiyr4HrohbF+imzyx
	hWcp5N2Ey4wF1y+fIi6KkcFV9fQP4ymLHwYOCOrSoLoIZHzrcmX/9ZAvyMcn6YNNrcKb822g1xZ
	YhckKCodtkoQVCsCu+3JRQ4AdJbKw9aMwCHAz6jaJd8rUWqaCdYmNp1kPBPgvcg/yMfu2gxP6gS
	B5ndYwxHSZWvyabSw2DzLHWHOmXsu0ng4QY0zpfLnFwJjwIuetTW0ca/YXelQgMLj0jt53yxZVy
	BmyPOuartioS4DSwIfvTX41aXPtMYxiykSEwXZOUUyus2FbJJBJs4odRZSby22mGSiWrTycGBxB
	5griDfNskHAN5Cq9UaZ34OCkho3LshA2CAQnIQOgTk72SiCCRRbx82o/hTDWK2oWwympMJwn25S
	Sz/qA2hA==
X-Received: by 2002:a05:600c:3110:b0:492:463d:b2af with SMTP id 5b1f17b1804b1-4925b38ca04mr38947105e9.31.1782223086132;
        Tue, 23 Jun 2026 06:58:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm35145716f8f.6.2026.06.23.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:58:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Tue, 23 Jun 2026 15:57:53 +0200
Message-ID: <20260623135757.5111-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
compatible as a fallback, but the documentation lists them as separate
entries. Correct the binding by adding the correct fallback.

This change fixes a dtbs_check error.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..4d741ba415e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-cec
-      - mediatek,mt8167-cec
-      - mediatek,mt8173-cec
+    oneOf:
+      - const: mediatek,mt8173-cec
+      - items:
+        - enum:
+          - mediatek,mt7623-cec
+          - mediatek,mt8167-cec
+        - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0

