Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F07C598C1C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889474; cv=none; b=rlecYGeSq+BFqFlUkHUsi2U1XZSnzlczsorzpMkgUpEKPTswDhvyLmLJdh7fmk7JJeCi6sclKV/r1lEQmYYY1FD2OdaU/xs3LXlmKoOEldDZrTNeRRJOZ8yOkcV3IB6S5jOUF7MmiF8S4NT2K6wD7W6ecE7+etaOmMi/hfvR0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889474; c=relaxed/simple;
	bh=k1Xs/1I6NO6Bw5Ze9SDuCelPs0wH1AjSc4OBHMNhB/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjRVKFBzjtRYHwlDiS9R71mXO+ojQyytmf6ejXViau47XGoPWrxdXqOBvIKg/T/kiWoPOfD1uyZPfVndktrZ7ZzY3Fys/Hcy+DEdcqRkEuETukviczZxJUl+MLdYoVN24HH82Zl4X2oJtaBSqUxUgVv4orHvw+uHK9wO4URg6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8CHm9BO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8CHm9BO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27595485e9.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889469; x=1789494269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=X8CHm9BONHGnGfSEWNTpenJJZrCVviOyjk8dZw8j884oRL6C4OnoPxAoyLHYQ3I2x0
         c4c0Xz47AnxJXJ1nzBAzOTBVvb1YYfYjhG9v4NiFENu28WKGx83oaO8vkNA/GxZuCxTm
         9FQcGSap3aQxKuAQrL8LG8hRNnn7xUHKkIlQq51GatmkjxMB20+Yp2IZf6c2FtjJDPyL
         WLa9vP7Hcm3u49FVtMdD0N51HS5Me/3sWHv+8gqFK50677IhtQYDrCpRILzmrRpboPks
         BwdSLAJ7APWCn+skTRZ+zGZE5S54nAfD+G5j8Q4L902MEwdcNXIQZphKMeXhlA0PJzOb
         e7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889469; x=1789494269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=IluJYa38TI2Gw3/gH5nqZNPElrB/KMKt/Ox1W7JjvVz8lUey2JQ2qhzBf3M3NqEwB9
         gWJYBvRtdHJDyxdWqwzkdJCOWdt5Vv9tc3THk52yizPZ5SPDYOV683tlZZSyLEuGg+eA
         YBB1hxyVT9HadGS4Zbrygp3jE54WCvOll7AVXDaJdzx4tq6tS8cCnugs5pnQQ7kAQpGZ
         tm2RXm1gAw08PSS0pjOzzXOGO+BuQcYIY4mORVjU2FWGS3qj+VLN5keFAlGTBkMouoY1
         0HP2lYsrosiqVF6CRJZUP2qd1g+uYq5DeUhXlGoHafFfAlhdGerJz5ovrmAFVmEZyXsy
         2o/A==
X-Forwarded-Encrypted: i=1; AKwUvBzbv+mO2jwGbVOfBNfehYV97CZM4k3RpJTvtQAkupHhXsOyNDFCQlQnpI2yxlEzIzwwa4J9oFEYDb9O@vger.kernel.org
X-Gm-Message-State: AFuF++ndv3tj5kMDkQ4YIOMj+Pmb5yAoNIZiPbIXxXvXjafiBwpKLAVT
	n/9hsDnl/ue6gTaLPRTjZwcmCzqKjaxxcazDr4rbwiex1DSYcMXshxyj
X-Gm-Gg: AYBFou3jCDNUoobSQZbLZAmN4RT5kd6ze1Ilkj39HoqOHOYMmroPiKm0riXO4MjrbCa
	w9ZSsFPBH0iUmMJApXGfFDN3yUkNkYWuUbp9mp/eiImVW9+JCjsURpOe0MBuQqhLmfQ2Q5jPfyl
	l1BOGv3AgC/8/TUbiNffxX5CdbsyB/WRRx05IYdcS/z4wN5dB1soXopt+au0OqLIr6RWX1T2nVo
	sfRP8V58mL3DLopEQj75UBsM7JI1oJlpg4glaXGfG/wxXc2EAWITTMY59B4jIWUFtvPCIQcdMWq
	l031SiI20/w6T7F2xZ9vslSdJTLpiRk1V9QKYb0+uOP/Lzm1BEihaZ962g/SSP6W1yzNthiLfTs
	WGRZbGVgHjBn1bJYpzxAYWvnjuCnQQJ3wET4Ste25Xc5s7/OkrP0oOrsNUlDJ7rqKo3u4b7/SHz
	sufTIYx8B8gPvt560ZcQFjYgi+A6bElZl3kTx7v+qoXbVyl3Firs6FklbZrBgvRSfk/AM=
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr202027975e9.32.1788889469206;
        Tue, 08 Sep 2026 10:44:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Tue,  8 Sep 2026 19:38:30 +0200
Message-ID: <20260908174259.9009-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
resets instead of 12, and its reset bit map table is different from
mt6589).

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
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

