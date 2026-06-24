Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDB3DD51D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322554; cv=none; b=Zgz+I+RJklyh+lGXNOdnLkTHU7mUfnDUE5IahGtYhNFAwnql93wTnv0fUcQ7vWa/J0yOMcnEHSpTvryVeRoJUFltgJGrScUNCgmtWUn0n/KurxZ5WQJvlEMdUHd41Z4Rc0zJ84sjd7hBJdntSQ9dwW+X2+oIHH0POLQMbcQIDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322554; c=relaxed/simple;
	bh=+kM3kPDWNiXgNtUJVg8ywoa5vnULQyhWeCjppMaIOL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMRJ4uu+FttseU2Q08jLGexANIAk2CO4+BT9sYTsKxsTzrjl+CS3A0bsYKYaJaKkDESg5d+4IbPqf2VkCF29XTVZllHHUTRniyAn8aiah4Pcrv1W84OoYQpFLduYkCLYgWsMOiuvRp+7WCEolt5pvTJnqzgTEnqz53RsEE3SwsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkMUjFxw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkMUjFxw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so1326185e9.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782322552; x=1782927352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3ESHjFhIcPG4hvwDoMj3pKaSJ5JAGh6fCIgpcDiAdw=;
        b=OkMUjFxwyGkbTekG69wnYSuAOf7/+wcfG4Dl6S1mPOQYCy7li/wn8RPj8FunDvfvtt
         Y/6jD992dXXJDXdlRyeuE8aMcc7uXli3zKBu+KR4wbdDzHIhjNdOO6rt/Vbe8kT/x+Nt
         34FlJMQx1PgApv0ZxPnL1W3JebnWOgA+uF8R8yi075qwVepVEYhUpCevv5PGLA1MQva5
         TTtoA0FfBGMHnhLvMnH51855FefrHhJ+VGVDyUg+u6BWXbwfTVc0XpyhTNFz1FIxlO8c
         I4j2fB7iv6yxfXA8zqNO1NOLP8ixJxBZL6EPxdxvbldl2qgZGrWeNTVxmptW553ZzYui
         FhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322552; x=1782927352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3ESHjFhIcPG4hvwDoMj3pKaSJ5JAGh6fCIgpcDiAdw=;
        b=VFz2hcv3wXLw67RpIsCFosGans+wSR23ovq2cY+UB1VAwV1+A+tOuHyit1HUeoGPQY
         v91Sc8pCho0O4z6E2QUqXAGAWsMbQI5eo+WIn2ac1vL8SLLrhuTWVbgu8hPOjcG/wygg
         iPhVMSIwhY7TssitmDoAzo79IWUnso2wmgC840YoeeyPnCpdT0c5vGo7xZXO/ri9/lFr
         RJa33/2MIuxYGJFDzH/tuUzRqczlDtZdp+pv0ncqjqZr9KG07+xKsn9Avana6LMlQe/0
         zM5M+3d4JrLWdbIpd5PCXLfMMhn3O5dIH1Dq3i4T2UwHETnS2UgXlNWQqaqRBe8otyw1
         tImQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ytuw/6CHJuiBHVMHWw4X9FLVKSJefS+7QrzMIKSwQAlGMfcpUJdeuHmWz2U0xfibIBbINptScek1F@vger.kernel.org
X-Gm-Message-State: AOJu0YyKrs3FcZM34349wJ4bF/KbHDXRbBno7psic3ID8so3GPnnRpT5
	sGkM7aM6Sc6kHRyAxdp64PXz1S/7wY1MMmoPLhf87Y6vYIyj9iSI0Q23
X-Gm-Gg: AfdE7clTNzA+sWFKVPIN0ARnITjQpsI+azGybmfbdoUqQ5ZCYElAj8v116d5zLPAKkI
	BceqJ2psU1AAcRRjAZL7IZkf83bLuPWYkW8Bf3ntHd6M9XJzBrFhdEi/Rtg9J+gcPtp+M40q3MT
	1gogTmBLN2Rb0+zlQ13dVvuCnHjj1GvDbVy+9POop5SEVEBMY2KDJUuwk9tAFg4MKQA44b4AjOK
	HatDDQyjODo4dBoP1kIW0dy5I1vt+byQGiddmXU4ixaTG4T1skofIRTUA+J97g3hUhvBmt68hjm
	n+/f97/H6CbaN5sLT5vqYuvaf4GQYcPschtDXJ8Ofg2bFdNZkIC6Ygomvfwkg1FO3fiHnpBFr5q
	U+symQEcYdcO8yb1D6WYmkDJVB2F/UGoLgI4QITFYTkAudi8uugjMBl/bVB9tvhSfENXp6rjtbM
	fPdZARBQ==
X-Received: by 2002:a05:600c:4503:b0:492:6348:d7b0 with SMTP id 5b1f17b1804b1-4926348d7e5mr17448505e9.18.1782322551566;
        Wed, 24 Jun 2026 10:35:51 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d917a5sm41336865e9.2.2026.06.24.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:35:51 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
Subject: [PATCH] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Wed, 24 Jun 2026 19:34:56 +0200
Message-ID: <20260624173514.19752-1-l.scorcia@gmail.com>
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

This change fixes the following dtbs_check errors:

DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
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

