Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD658FD0F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892903; cv=none; b=lnZktqFz2DWGyyUAen6E+fZuKUpakAFRSM2oaBGy8sVLbU/YNQpUgWmg3aDk5EgCGI6i2zBG4nJJm/RjLxPlL3WnAxkjz5xHsk80usyxGxrBS40vq2tjs5+X8tMUOT7WUSC7446gwKH/nPyLePbS6KeZd5/MaCaZYBeLKHwwgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892903; c=relaxed/simple;
	bh=QFDrZwsfKk9LFPbgnNXK7VjMPHmgc4yfPfxtZvvfD/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIgho6GuetHNSP8i/qsDovIQmAgZW3wKYuj6FT01Zy3llYM3SK1zqtHJjFW9Mnf5pZKriaxdaFvXkAsTkPy4J3qYHNnZD4S9m0DVVjGUGvzdSbyVfvpUIEC56j1n5daqKCRvhLD7A4Q5kwtKzKmzYsaeT0dHGhdFvjxcZrF90v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwhGoRvB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwhGoRvB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso28543415e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892898; x=1789497698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=EwhGoRvBxzTRE/ebXMTAz1lCvuWJ4zBwTCfaOTMKtxBuQD9jlhgSDC/Q7dLLsBRpP9
         OmDMplHSJmYELbHQSggv+4saH+ClT+6JpCO5GVDfdFx2ddAVa196yCS3rjO0KgOc5nHR
         qaNHUJEbitSsfa8no/+zG2PdeWgiDvumCdVNoqG2wzjpB8ELER+sXMskxXO8d83mSOsE
         WZVr3L6I9oN6Krwy4z8/R4fWN73XfxnE5R10ey4Vy8A/dpL5BDNHX4rdhO1jgRu/E+Tf
         Syl1T24NXNWEhlSzz+hSZ1KhXgYYr/5MCoztBiEkYXT64COPOVIT2WvSfhz62QNfaQjM
         vQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892898; x=1789497698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=duLGZUBcQIYLofjm2l2MAuvSI03jDwklFGRb3epTI0o9bci0yptnaYQi4GJYqeGpCF
         xtEmypaMAKK7frbfZazvm8cKtW5rCEGrP+fJHFgPBU1CWP533iD/vmyaU+TuB/zvBeUM
         AcQvnfcxDg2GkPfvYRAox5qaOP7lNd1uv0Tr4Dy/WvHDq3q6FlaGg9UH8sV1Obv9opxT
         jXil2s/OojRzADTDn59WlixP5hKYwZmmTbRvMRWJrZZTqJVho8ngXsaRwfT0H1bQj2D0
         wknYyAl9rG4trgORfbOUoZum5J9n+wfU//76eEqmRxEv9DEAEarR9Y5MBXUqpDwzEmIn
         yq1A==
X-Forwarded-Encrypted: i=1; AKwUvByOn0bAPV3NDKg81EjqpMwPuTcnOnV8Itg4O9WQ7mhLqBULg4AXGk58vXpHyhlLl7dGMhKQ1Os1h2+F@vger.kernel.org
X-Gm-Message-State: AFuF++lZL7nZ75Pd7NMOoHOf4oGcdl8Zrzr2mAXCoC4WthKrntRr4+1n
	PCYn8fBgyI8/6Mo0P/keDS1m92PQhHgCEjTfnInhqjm8BgnJ+NdZKgi5
X-Gm-Gg: AYBFou3Y4ZOs0T5Bq8NDr6xC3DFqhIuuE/TUxK60qyb6T1rxUcoqtdNW2dbME05zNKP
	5E9F6DbhqX9M3VQDcIwo/Kwv0P585ngPm79yMv+2VWx2hrgiY1g08BMkpXtIfsdbIoIR/h2APWM
	3ED7/3ADX6xRDYEU5YjdmmuPP8MjTbkDt3GUsmSVcGK+cXy0N4ssCtkKDfanNWlha1DKm9r28C1
	cc+owkQa5MJXNTEH/j+CLGrlPFN6a6SUJWaHRVSbezi1Hs9cKNWIPUOvwf/5+0ti+JYjls26grC
	Wsg3jIIiR74ivxrExVdXUs6YpdUypePKqWPYHkZNnuRzAUXC6VtOUx+NC7n/CiMm5Ubc+D+o/4U
	1DM4agemxs+4lC7Wzm5zX7JWDFk5/yAkeAs1hI+p2rR6DQYO5y1G2khrzxllIbzljDpSZGmPv2F
	0hgRbKG63BaoCwaTZhrBXFV1W5a72b82IhY0lSga0b6wOsqG8ojESwXIP8
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr371178485e9.12.1788892897552;
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm38558775f8f.26.2026.09.08.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
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
Subject: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Tue,  8 Sep 2026 20:41:05 +0200
Message-ID: <20260908184125.10916-1-l.scorcia@gmail.com>
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

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

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

