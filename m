Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3C2571B8
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281827; cv=none; b=PuqVPajBcAmagnC7qrHaAMz9JicTTAqbR6WtdJkUpP6jbKgnjE39jb8IpYfkW138MFuwKo9NuDjtA+cOK2IUx0p6do19f0VgAxiEPc0elwD1ckt0yzNVFC7bCEtKuajRzPC2IeubQGrVKvxuUgiiMA5V+jZsqoSQb/+JZOyvGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281827; c=relaxed/simple;
	bh=9lClfTsgnwc/RikmQlb8aHCrjgT/WTWoF1/omlJVHIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WGDxuLz0/Qw2Wkd1nuvmiuV7wbtYzlxEjrxst+64/fN5Fgd8SOCdZX0IAHpegEKbYAdnZGB9mYp9bvjR57eYVY6aMHNzTI4A4x1D79JQKJJr9JQK+VBfo7CH0K3TW6k4PKiqQqrI4sUCzslOqfskkEFQzkwjIE3SfWaUdNppdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2SA/OgY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2SA/OgY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so529004f8f.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786281823; x=1786886623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=o2SA/OgYHEqq6AwsCnsR0cUsD9BgWDoU0nXOeewis3QmhVv3ZDWe3TofZWa+u55TJU
         LrYCplHEcO6MsTZQvMiKaI2IGKZAj47UUiV66cX+GM30VtGAxAaaj2NBXIzE38lgcR13
         cF26nsMSOzUyqBx/FhlcNbLKlM6dSbJGVftQd/M4n+kdmLiWcui/gkSeMZsCMeiYOtj/
         46YQ+u5lIaVHHxGDNNNtBD2jiUdn1i5lJAXdE7kCGCtiesvxKcLyU8D2zKps2+5GNO0j
         8O3rqXGIC5HNbDKfBqsLMPpsJFmIKtTUo6QzSFS3coiu3qFjuu+Lh9R+BI7FJTNKftzU
         XXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786281823; x=1786886623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiE5KveVgNl9XkJ4WjLCf6DiWT0Rzjhuj8+wghGG/qQ=;
        b=Q1mQjHZg/u9h5D3BlhVJlHzQ9CVI2Nu1aR1Nv7pMMDzDLulVBEAVjtovQkgETTKt4l
         E8bvDDT000qCW5AptL37xfAuvc3W/xmE/+NZzuBs8xIGrls9nhEghWsW2WD17DN6AEYq
         CW0qtIuBLA2PmsLIfX5oyuMRCSEdiFrUSkX6Omibsm3sL8cASAJ89OJT514oB3dDNB5P
         sGunUeGfJxxLqWnCpolJPupYqYI20Dbz0ICt3OC4OQM+KzOT0mCDdZnMgrLB1EXe6cW1
         Fw5fxW/Wke4iqYx7m+pzk96Tp7ZRAxNtTQ1Ox9DdGDIA+94jtRigMOD9w7WXAKgLXC/w
         suOA==
X-Forwarded-Encrypted: i=1; AHgh+RqfkUTQZWE5mLsshxoOG/0r/fZwuQpkuVE62DHd1mTOIPzSfCJpPvS4To7HB7Gxi2sNMbKin2JYPpmf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bm5kcTnqIWnevnyKUMLGvgVBMiBENuz5UBQpe1tjAJx72gtM
	muAwHk7f8BVLoPVAepE15UZ2D2NiwBuMc738CnuFmuvtEwpYW5WqpnfR
X-Gm-Gg: AR+sD108ucw3mj+oGVuOJF+ISC/OH4MfUkec/lH8DWZczEJvYRGnvfF3q5Q2sjNJ5za
	rOyY/6IoMvlXLe4whX+B9kIJw7IRFtmXAnKX+JOHF/kGrlrlb64b8wD5x1pvSsbYyT4i4x7If/Z
	HRDRzGQ+yAG+LkrW84W2Zef9U8i69S/IaFO/iC21cb2NgDoALaXGQJTfRDdbjFXZ55PBu2/kMOO
	PeGnGhw1sJ6cUhjeh/CmouSXhcRp5kS3+IO+l6U7U0hEQf3uJwijwimhLaywTGj0CbvS7F1baXt
	U5brWbm48wXZEw0qm14E4+FUkkLMKzjR7HV2vyzt305SrM++FhWeCqoOSFDXVfdqlcuJ2tvEsPF
	+vfvOmFdmhaWsMfXXZLv3etbA8U1QwGcv2b54YtzNMQUR8HAh/m3/ndwbZIuN74jHNPuN94emqe
	j5yM0is06ZTVPYhmjMliVdJExMBrEDLOCWVQUZFU1TJwmtunwZcuWbrg==
X-Received: by 2002:a05:6000:2913:b0:47f:973b:71c8 with SMTP id ffacd0b85a97d-47fec62e4eamr46608879f8f.21.1786281823240;
        Sun, 09 Aug 2026 06:23:43 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm22476356f8f.2.2026.08.09.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 06:23:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Sun,  9 Aug 2026 15:22:24 +0200
Message-ID: <20260809132241.6153-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
them as separate entries. Correct the binding by adding the correct
fallback.

Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2: Simplified error description in commit message.
Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260624173514.19752-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index bd8f7b8ae0ff..966127e1ee63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-hdmi-ddc
-      - mediatek,mt8167-hdmi-ddc
-      - mediatek,mt8173-hdmi-ddc
+    oneOf:
+      - const: mediatek,mt8173-hdmi-ddc
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-ddc
+              - mediatek,mt8167-hdmi-ddc
+          - const: mediatek,mt8173-hdmi-ddc
 
   reg:
     maxItems: 1
-- 
2.43.0

