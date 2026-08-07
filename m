Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5D42C51A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133389; cv=none; b=ppd9KIEluvIk7jInCGy8Vp5pqPZQjE0oInaf6+PXnFxAHoV6CwhBmlh8a/taYKPthMAQXgCQqq37yNTtnderoEUovx7yATsHrHQy13doURF0dduDnmQKYnlxVqjKUxKiPFn9BOlCnf2AGbadbydLuqr24hqET3lsgpGVhHHmqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133389; c=relaxed/simple;
	bh=BbwwSi4NkYc+Qs1d3CvwqDnlgSJO4+ug+OKxVntKOjw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/vQ0aKJAE9aCwrbVEtMOuS183MVqpy3RvjYt9Yc6CKTjW0yt5WMMrEp0ADfCOgtx8i1Xyj6lH9utvVWFFFn6TKNZzkVhXdTiC/Jboi4fb90OIlq/GI2alm/C3nZj8o5oAVZlE6YneBcy+gEV2ghdWAq6unoQ+3Y1104pZJO1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwwsqN7/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwwsqN7/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so23345095e9.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133386; x=1786738186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=NwwsqN7/DDkjY7P9uqHz2aS3goBK2G2vqxeOWpjJ/FD/9BAiTQRGNnGjxPXKr3Q8mg
         llzCfZXJ20jz3Ef2jLfBcS6Wrlkh7J5761nS/AuwcNwb4pXU5OMFUQyuNSW/7d8nzOVI
         4ETeLRZbZ8CAxRacJ1DrxIDZ7MM3XZz+uPCsDE3U/fX6n/un0ZCq3WRBYgdrTrHYAJig
         ZyBuxGEFGfLE1H/0XrCpCXyaI4Pgm5Etz7CSOvHOoaA/SqexY0qLkm89QcRXtFP6tuXd
         gm//AvVZDn1qa5u+TH3+0G8TOXxfNrLhKutI2jyi4SqGSGGJiPeGvmz/TTx/xLzoS9tk
         1knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133386; x=1786738186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=jv6YottqDH3yBzZhjsx6rZO64gK67U49J30MQQvZWIYrdUhlosGV7iuR6R3/qYzwi3
         62EuuhzRtUJsYk5jUpe09b8QyRKuR76B/a+i0r9jt1JGKmeUIOBlTi1I2J7hKkRur7AS
         WjVfi88RzYBNF0uiw6AoIDaVJAlORLm2Z0SbjFSlm+qglPio/JVBvut7OXrl2ydULxeB
         HOvBnbyLvx/3QLsyoNFZo/kgRMaFyFcQelM4dENthuBh3D+SLnLO1F+C7oKZ7sMXBjGp
         rRC43v4tjEjfxS7WTkEplwUjeQvKj25Sv/vgYmT2Dbb2mIcSYUu0JG3WqHA35JkdabmI
         pXWg==
X-Forwarded-Encrypted: i=1; AHgh+RrNxVwenm4oOYgM6peurjAheXv5OBG5UiElKaADE82B/hQkElYA2HPX3Q5EPGMSWKPF42Ob8/moI0n4@vger.kernel.org
X-Gm-Message-State: AOJu0YyipQ1hxGIXP2qTeciI7qU7D7Ro69NmwqQlTXlL4prbY3yhTvMs
	BnoSIPruCBMd1tynInG5wJ+c5LopSemddFzQbFaIo3fOwrRfa7GZZBWA
X-Gm-Gg: AR+sD13VTqx05Lzu+IsJh6/Kl2VU60uZGpF93k3K57QrX8N17axscp1S4eB03aGaEdn
	4pJhVB5wD7lgjs0GFor9fEPW3kydsUnTUciQfBlUSvh54Be34C91ee3AAQSMz+vICos2xVbdgU+
	cgGKncu4BDtvSLyTRtjR6cQLf0irLD7r3CNlD0R7ye1T6i35M62G49SbvpNEITlnrhCCOekx7pE
	CMObELlJJ5zFcWNKJLw38CiRYcHmbpYLtAZ5LtWlSMDdPMXVLzF1G49B48GUMZg2PnUdwC98XJ0
	DndMMgcgRuw5tvKUCI5FzsqjKwPzvcKsTpnIASrvdhLsFvYRzyeNnYO4WG7lq7cLUiY9L+IQ3Bb
	PiYaJXB6DABgrAONUmoWsVHwB+W1ZLjkw3KN+YION2UeJytKS9nOx1xYUs+DMYn+zRE5GiIZaMi
	hdYNP++WhJrLXhz21VC3b4ZxJS+4QvaALy+QN01YiUg8NwNQjpduBskYOp3Rwswdw7smkMKShae
	92la/C4c+H3LG2WM9INq/XamqXTnGqZEVA9vN6bQz2Z4HQLUBvpq8sQaZH+LuIa
X-Received: by 2002:a05:600c:5791:b0:498:11b5:3ff7 with SMTP id 5b1f17b1804b1-4994e7d8a85mr280779925e9.18.1786133386236;
        Fri, 07 Aug 2026 13:09:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri,  7 Aug 2026 22:09:31 +0200
Message-ID: <20260807200936.201827-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0

