Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690844A412
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134753; cv=none; b=ffk+g3I9cs0TGhIPgSn7j3AYiJcGfZUOzv2GQ9+lm4zmUNRdUu9z4v2yvhk9YV5vA/o1xv5ZVujDMIaxVYPVkREDCS9ahn+VwPGbXwPcX4SZ5Pq+CRTGmy3xNS9ZaS4N4Sfk8AYvhryldGNRbWR57lA0wWVbyaAMDvB7q/CE5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134753; c=relaxed/simple;
	bh=YIP/2XJjUaaXh9qRpp0daB35u5sffzJAaPM09TSptAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pp+zkBopB9e0wwQqy5aJexq4coTU8jRXZg+6+XoB3+fqKWSnGisibMbS9BFQP3+gr94ArxRPNwjXZY5JYA9lPL95DNMqgnWf2u2Pt3MBouQ2xKq33fE0QDAw2OLfcC6Ea2mKxCWd8UThqJCTQalFI4IfWUmrTtCGdgnQIN+cIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzAKUmks; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzAKUmks"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso6784785e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134749; x=1787739549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=;
        b=UzAKUmksk7YyRl9M42B7F3qMuzqdjB0Pb60FyoYT7JgAhigDrcPK7Ee8TJf2A0Izob
         cCsgk4yeQwoYxe/wh0pec4MAs/niBCiOIc/PWioajUoNQJ80B/TS+qyiV4i04EnkMQur
         3YeIuKlEWapFNdhxbaOVKDTIMcz9IPaS++6CWwF1x+v5AuS9iShP5ciEZ+Sm+eSCZR1p
         9C0/Yph3l02b6VhVGrLVSpE9WVI01cD/u13uH22vRyeqZQ4Qy7m5LXE6sXSTytf5hDVz
         SxssEL1MPabNbrbbkaAWgkWA0maADQqAdaOPiwHxqMzkfzRjwjIjb4QjH/Dec+TT1J0H
         BkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134749; x=1787739549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESyY6mS85KjCUsI5x5vm2izKlsP3ozPFYVEFc322MuE=;
        b=fGYu6+1L3HM2Vw+fB/d5uYDHVNXsFOsxHfhwtqMfZTWvmOl4Sq6bpv+6GdH/WuQ2/L
         DObT4oY3qDXUl9QQ9ylJ5mp7QH5m+C78uig97TXPjwEAnkxiixhdrt6Go1eVch8k5nCk
         Z5VNIEDsnZ5amb4QJfMVvq4yjsa33YYAWaSpa0kPoeUYFwz4oEIMkBPrVuHVRo/3XDN7
         Mnfs7LMWcBOuVaIgY7+xL5UAsiyoTZwGsAxw31FnuCsqFLA5dm63fxKha/BUEjhDg2lZ
         78w8/PRuA3MQgiMgZcWG0jXYLSmYidmYGTo8iN4kUAEaR9z4MJV80wiOYtxE+WkFMDhj
         GQhg==
X-Forwarded-Encrypted: i=1; AHgh+RpHqcsrkft/AVVdcPcKqmbtPm5MEwP0zxKq7A6g61NZdw2N32D9tynpG9B4ZTiUpVrgivcQVawazAP2@vger.kernel.org
X-Gm-Message-State: AOJu0YwPLosibbdFaqGNA4fDpcj5kE2vsA7l5DTWyK7kpZ1n27YNOGrJ
	Agr47IqEbJ+GzOBjIjhzf1QoU/XRJ72fesESlbzAdXvWtYLFqB2XJpU+
X-Gm-Gg: AR+sD13YupXMBTRnDOJcDxgjTf7Hs9R+5reaIND+Xh/ArYNzGMpizOMBlqpB2GNk/i8
	uqISxKl/MU4n9ESNq+2b7bJsMQy/YU0w/DRn1b11HAq4k4tmG7JxDGa8tkdztHDiuFaFo1dvm6W
	JionM4gwmoJjcXIfUNdDmeqXfDABsIgcCJNuzKG/l+InECh9oQ9/HCsF6aNVI5jB+/V3zYzrYIG
	nIweg9hAB9j3e6doZD7PKCR9CEIO0xZSAVmBRBdTB+FT7qXnNJNBPXHYRIIjtgJCUMxanQeS7It
	L9zJV9BgHpuK1wGqnrm5kOuDoMeHwxXK1WfOVpaOpPi2imCTuO9LwnIMp/N05InepxNcX2ocLXK
	Ti/nIYVDlYbHbkOTx4y0ofPM8sd55YIhzBj8dg7IzyGDWVHvsHPSiA3UN4KAM2/x+0tDtz7SAOp
	nnRWvGqhhQdXnCUkl6lv3/7Jr171DcG8BkBI81L36VIz8TsmL+hCD3cQ==
X-Received: by 2002:a05:600c:528d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499aa17d6a0mr69083305e9.6.1787134749461;
        Wed, 19 Aug 2026 03:19:09 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:09 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
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
Subject: [PATCH v4 1/7] dt-bindings: reset: Add mt6589 toprgu reset IDs
Date: Wed, 19 Aug 2026 12:16:22 +0200
Message-ID: <20260819101853.44681-2-l.scorcia@gmail.com>
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

Add IDs for the 12 mt6589 toprgu resets which can be used in device trees
to identify subsystem resets. The binding for the associated reset
controller mt6589-wdt is already upstream.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../dt-bindings/reset/mediatek,mt6589-wdt.h   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-wdt.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-wdt.h b/include/dt-bindings/reset/mediatek,mt6589-wdt.h
new file mode 100644
index 000000000000..5e39c8cdd718
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-wdt.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_
+
+/* TOPRGU reset IDs */
+#define MT6589_TOPRGU_INFRA_SW_RST		0
+#define MT6589_TOPRGU_MM_SW_RST			1
+#define MT6589_TOPRGU_MFG_SW_RST		2
+#define MT6589_TOPRGU_VENC_SW_RST		3
+#define MT6589_TOPRGU_VDEC_SW_RST		4
+#define MT6589_TOPRGU_IMG_SW_RST		5
+#define MT6589_TOPRGU_DDRPHY_SW_RST		6
+#define MT6589_TOPRGU_MD_SW_RST			7
+#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
+#define MT6589_TOPRGU_MD_LITE_SW_RST		9
+#define MT6589_TOPRGU_APMIXED_SW_RST		10
+#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
+#define MT6589_TOPRGU_SW_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT6589_WDT_H_ */
-- 
2.43.0

