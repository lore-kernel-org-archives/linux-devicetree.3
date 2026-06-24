Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209363DD519
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322599; cv=none; b=iqOxEMNtq6R8iQ8ogA4hYvGTZ3QHJM1DCNUl9Ei689JnSLwlfI5qN82gZ5yavg8lYVO3lvOomu8DSjrP8YJgloXC+zQD0RbeBvhmgGE8X3wi1ySjRVZk6Cwesi6WmVEm+GSp8afkM+TLlN16GoKzr6GAY+yFSmFX4dQFx0eGAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322599; c=relaxed/simple;
	bh=YWmTXO1Fa6ALM804M4S0oiKW6rp5tf136fWjq6VF5sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMdE0xM7scbmq6EYvGmyfx+OJwI3V4tkwubPVA6AQO89xl8XsHX/fd1FKKSwjMbXUorS/xLHyCiiz2Rd//cJiVPt6zrYTBS/LDKsmKasw9eceP/0r36MXki3ZcsfUo03pizEA6NOUijkGC7sV3mcftJTXOXOCMZyXlQY0pBC0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2jGzvdH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2jGzvdH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46cbf263113so778098f8f.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782322596; x=1782927396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=q2jGzvdHOieluiPGwljicDVsA2G3KAFdMRZxz2Kip/3EumF2thnSxH9uXDk9Jx6lP0
         +WTwvQLdeg4B6v47yabvsgIR/V1FL1ij1YSyt4D610xOfUNyT8yhzIXADmtuAo+ln6vT
         9bk7o4FFmoPdvoz95vQnM9slPKvDpwpIYkEpiqVTd5DEVw5Y815LHmh5qqlCr13Oxqjb
         JnKng+zSKbB1zxMCGhXG/MQuqwr6mIroWpONjtaSvpOXs318eGF8mGLBS1rZmvcZlacu
         TcWMtt3JzybTotL/+AzpUsN9RNxlvmhoLy5pzViKvq7BcQCH/FvqJAVE4YSCw9bxPPY/
         yFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322596; x=1782927396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=nHbuD7ivHrUv2gV7rEBxNi20eIWK05ej/sYN4wnd5WXeNaClvlx+B3jeZqS66YFhHR
         sJ3jbMOcyUfq7UmcvUu846LrMjkV+pO0VnXN3ano6fhwrEYwaYjwmi33LiQ1u3okc9pV
         Vt2Nx9a/KDxZh689onQBn5CNFzRD5bmP+VCqi2fzaWWaYcJ3xrBi4oLicWU8zEzPwz3L
         0vLBXruf0C9+XXS9OQjKzXHo0u+bg2r4tvpp8YykXNefRm0RKWGIZp49to27dn0X9dLc
         GGH9WsxO2J7x5RO1Vqdw/8BzlnsJdt7rDbqsgy216DWqeEtVys+umVm0Jnly6ipkWbaL
         6rLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9TLPDeKU2SGQ3T8x/0y1uyMoUr3fftV3r3pyvPA/MJ8uoWMLLkIyJHeyNBeX5/eY1gZO8pA8Np8Cb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8HYDtKgw5ODkvATuhDbvlHYLtWEN8DhizNEnpOvnvXZhBim7
	Dj6si1ljvrweN4hssxPbeFhvztqTRbGcFq7E3xEzgnrJH8DbtUlq1g0Z
X-Gm-Gg: AfdE7cli6MKS338MrzUxM0r8NPIRThKFuXLFzeSWo5umIuxUBOjgumWYmqFZLulfXbs
	zdn5Ld8tHhmdf2EJlauELzUdwQQQKRXwsEmhp4H2NWSu037o4Rwju+RCLKETVaUdJ+JrTAjgQiw
	Wz0dcA29eur0ZErUv+rFeJkMRp9XaE7KN9GW5bbH9p3TN+ocn1uSRV8GbOTZsJmWLScKCv8nzaA
	KIldGcOgYWfn6m8MarOfnWoq4AVq9LYw3j7NDi5eYHp3T6oFynr1SNbTyl5dnGYrhaZ+XOiVekk
	ND9GvP3nhDnxuo5RxKs3A4rg4khVq633tAVQetauY9SwyXXLAc+bTk4vm2K15Qo+o+HZ5rFCAB7
	pvEgJ3cUKO/rnHCPaXe3Rzgo8c3coTG6tHd/tdeDl9bMKpF5lg3ObalBB2J4CeENrUxdQMYwbgK
	svPtoYKg==
X-Received: by 2002:a05:6000:2581:b0:45e:d8dc:922e with SMTP id ffacd0b85a97d-46c0b3e3a86mr7091212f8f.20.1782322596297;
        Wed, 24 Jun 2026 10:36:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1b754471sm8165914f8f.0.2026.06.24.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:36:35 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Wed, 24 Jun 2026 19:36:15 +0200
Message-ID: <20260624173627.19785-1-l.scorcia@gmail.com>
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

This change fixes the following dtbs_check errors:

DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long
DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
* Fixed yaml indent (sorry about that, I ran checks multiple times but
  it did not show anything - I had to clean everything and run them again
  to get them to show...).
* Added details about the errors that are fixed with this patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260623135757.5111-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..bc288b1c6f07 100644
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
+          - enum:
+              - mediatek,mt7623-cec
+              - mediatek,mt8167-cec
+          - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0

