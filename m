Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC184503E2
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134762; cv=none; b=XwtnMqSJl6NMylGs/ZgNzrIloyD5f94e0WJax4bJ5nxe8lQGC5Wvt+Z6nooxo66L99D+0ww09ssT4hxm41RBz9MDXF7Zhwp4+F0w/HRbnjMJBta5yl1Q3zPfb2EvfjDVGGbbG7Ha2rz9gTAL90wKbR3xGlma2DDuFrpy0mFmKF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134762; c=relaxed/simple;
	bh=1NEOgnSQQ+HAx7Rnjdw3+vZxC3b1RoMQyfHXNa3S5TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeCXnrp/1ibwYB7rU19nUvPOR8VFgsDb/RcJuml7Cu4W1KyVUMGncy+b8JH7bdYN33gjRuL3Sv15z/1nTHATytlsdUNX5yxXZcO1af4qNjazSYY2kEXmAcUwKzUIjKvnbv5Z9ITqi6jYGmQat8XBVRqVJtLnr7COqhtWN1bnfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHKiAXdd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHKiAXdd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so10156475e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134759; x=1787739559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPKoXj0537sjg7TtWfXNcXGDOvi6v2gbjQvu6MW0moQ=;
        b=cHKiAXddCtSbpU4eolJgdpZkzdMavZlaHeh4Y0tK2nzmHBntAS9CQwP7L68IeTJPSY
         yJaxJ3p14v5KEth/TruHk4maJ2RBahJr7Nv5jL2ZopHIhsD6mPnz9WpwTPGKI8xghaV1
         sZ0snb1MAcLVtTfsJysSysctSwNhJaqdNBbA+fnnYSSszuZOeliQSIuXmwOYSlHTL0Vr
         pjp/qsBk45ZIMSZ7Ei1xuYxMEy1XYcyRy67j3o5zVoeiPuwS5BLaEFgKQPcve743xEle
         fle6V1/UIhLQ91eTMIVcn9DA5Q8i5sPufy13TBi/IUfovhNmCxDKl7h8k9yY2zpZyqKL
         RZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134759; x=1787739559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPKoXj0537sjg7TtWfXNcXGDOvi6v2gbjQvu6MW0moQ=;
        b=BDLegsM94jmc6BuW2rY+HlmlYjpWFWLjjMep6ByrS587t8AB7l+ug7CATCflsxt5bL
         V+5Atg7rRYTf5rVUr/PZEkLL39AFVM3QrFCc36WZXOP3fAhMrFX0SpFF5XIMc3jDrIan
         pexaTz/7trNo50cH4D663GsEE4jBzk+oAkGdfXgau7HVBY4HB0MxCGsZ/eacHpKm0HA5
         Zxn6Re9rDOc+YR+033t+fR1BoO6fRwYt0+GyNJvAQr5Nhn5fmShYJwW75tozzBFkehGI
         n9uQ1n5B4vjcRQpJi2oFDoldtC81RY4dLnWi02zzspur+sDX68sv4cuo1JpbLaaYGy7p
         6hvg==
X-Forwarded-Encrypted: i=1; AHgh+RqbjGSfOPT3oTdrvJpxb5Tq7tFwkKdwM6HOun425U6lw1CRYymOKGUkDVYotnfE7y+KLETedSfdB9mU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+yHjvgFYiOcsh/VP+JmE+54XkQr91i5vysAs7vFQphbN4T5E
	k9aeDs4pc4Q1rawq9VHv2kEwOn+WzfQ6J2ud9PVeHypC8wz6PMqSVae+
X-Gm-Gg: AR+sD12kDiSc9L9Nt7uPvSo++Yc6GqSN1JoLeo+8o0ZH1BcP44CuT0eFfmxzr9Cplea
	DJ+bTKoEgAY6Z4k0onXHHcWW4kANXgfZwxtHtLnACBli1vX2jvrLJTYn9hjE0cybhOzntL9/aS1
	v1FJ9SaAIw+LI5I9s5xZO61wldouKvUOnm2LEEq7Gx4YLRXuGtbjVyOfswKr9kDBZMr+G4sQkjE
	36Rz66U+8oLYBLEzyXuyKJefGZ0pjFkvnfAmi3g0r033JD36zN2/tJo0xt3MwnprVGPmZKDs2gi
	fk5bjEo6oKLmlCKpqBT5OmUBIeifw5Okxj4Ixfblw1ZMhwV3dPEqm71FGwuZ07f7NQhTKeErAd4
	88hGfP881/5NBWtIe/AmIQsSNyOlIhvfB17PYKxS1AKfWTImSnOfPuBv2NBoa7ElR/TWtGYm14B
	b+bYLlWBKE1U3Wjbst+jiUtEVkDXi6zlyt09H2CuqajeGuOpnX+nylE0jgsOXnOc8J
X-Received: by 2002:a05:600c:1f94:b0:499:8807:345f with SMTP id 5b1f17b1804b1-499aa1b6994mr52091595e9.13.1787134758588;
        Wed, 19 Aug 2026 03:19:18 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:17 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Wed, 19 Aug 2026 12:16:25 +0200
Message-ID: <20260819101853.44681-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not actually compatible with mt6589: the latter
has 12 contiguous toprgu reset bits while the former has 14 non-contiguous
toprgu reset bits.

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify toprgu and mmsys
subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
new file mode 100644
index 000000000000..b21f67b3b55c
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+
+/* MMSYS reset IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
diff --git a/include/dt-bindings/reset/mediatek,mt8167-wdt.h b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
new file mode 100644
index 000000000000..1a24bfe079ca
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+
+/* TOPRGU reset IDs */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+#define MT8167_TOPRGU_APMIXED_RST		9
+#define MT8167_TOPRGU_VDEC_RST			10
+#define MT8167_TOPRGU_CONN_MCU_RST		11
+#define MT8167_TOPRGU_EFUSE_RST			12
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		13
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_ */
-- 
2.43.0

