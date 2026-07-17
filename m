Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53C42B328
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306514; cv=none; b=IZH6FoWTV+3xTQxnqoHjzR8vhFBggf22Y0cSQjz0csMuKjSEfvwV4ksvaj9UFGG65+GKJwRN4z4cbhq9wrOLr0va5GiGMfsmGYX/ubx4tqEZdgc6YpA3IcQwWa6ebdYgSmRywhzWw0k9ttW04klLX94oheNdJgF3kACqIt247Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306514; c=relaxed/simple;
	bh=lzDkvhh2lb30hMamVDhq/leCdMYgOXSSuP4HjE1UCy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnwUZnqrFeFbl+/L54IHUNIBH0sIJrib3H7GqXHUlL4IjjWBREZW2y8Sv5o6d+hDxtb7pUqL1POE/PXJzMKzlJ/MuZ46YcS/bnD6zWN61TXjiDYBFMkhbR4/BefG0Y2rJxBwAQ+7SUZ8SsMxc61jwtsGxsGcQdMgqpDPSlh4r/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfDDjFGq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfDDjFGq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15f6d667bcso1007482666b.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306511; x=1784911311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=ZfDDjFGqcaqW17LDrEJugv3bf0L7tkA5SgseBp0Wmt7IShKzn+BDGKVniZTCZJkWVC
         l9IPPvIj77w64stSTWTTdPmfhAhClJ//ogjvz0KwUATe6JIe7LYd2qZOC8VrtxkBeoGu
         Vn3fBVHbev/sEM+eefYbdJtgezliBdwuPI7QQh8wQf3mj1D5ycmZSnXmglYReeXD7eYc
         nP5fPTvagwJATr/GMej9Qy+zwubhcpxfs0X0AORxrXjbwkwN/HdBQlgXGOYVHnDz6ftp
         BhBsTTA7XweBSjIT1c+ABAXaqVe3XFMjkKZS1CrZHLFgvbF5v0h+i3WKIjE8XDojNPYk
         ARcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306511; x=1784911311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=FHj8YPcTrjq+OKqVnqQXukWNAI3KTPW/J9ztxZvGWdPbnajGiVK+CWSRseRT0p7y85
         XmDcra8RX2dR6U4sn87V3peEgbbA5zLO/mpQaAZitFRG7cLI/P5j3EcqwWvAUNiaXE5S
         OU1aV6CYsCa4WiytQBqETX8fRhrdXmPt0gPhR5TMRSQsvf9zpotfoXJGWDng4w0+hGfn
         NotYgiudGo0y0zwmPbEwbfpgmLjVfkCOJYE8GZ3p468+n4QYhaKtQ84cc5l25P5ttigy
         DYJk2cuELU7YXiQdSzo6PGJTG9rxUFcuQbaIWGXFvRQ/7M9od5HXmi3MGuRMmVSNFZRX
         E1vw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9MxF50SbNCZm/iUQbJJgGukwq8CZTzLnwooAGxTw+B6t6e0k4hGpAxvlRfOETwqMsuOjgFyDpBwNq@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMg5YqnP9itX0AxnMvgQbwc1SdxUw7FlxdJ2m9DMLFg/FHRm6
	kfoHKrVesu8fTo8Q+jxXWPMSj60hJSmTc3vJ+KftWP9GmkkktudJgmOs
X-Gm-Gg: AfdE7ckIs4jMmWRX1L24faX7W4HwqfUIBhMXcYk8VEx2LjgnAqieGDVvVHGWYSQrbuQ
	BSEvvf/KwhDD4hLI6YdnSxDpbiT6TevbfF7D29rlypbO6Cgm8HrbPO9BsEjgW7pdySGc0k20MVO
	fw9Pf3wqX/oPT0d+Pblb25WP4mJ/pfcDl6u0ZZagERZ5NzdqrTkbqgfj3ABefoGNPLVSNlehY4W
	yQTimTVB9HdNNF7Gv7laRIuFRpitPfb6YJgwmAF48Kl8GzMwrRL1Qbju7NZm9I1BgggqLTJofDz
	Mx9lS2d3ftvsCKMCX0QgkJQNwyWGBUPWqQ7pVChEYDiFcZ/3kptYEokWLc4jjLz1li/B8JSImz2
	Q+c3YgQcQCsmmyDS7jV9Lfr399qfO0xXkKbnNt/FmGjjlhZbcuHhEV3bvZxueuFLU2OTf/x4FNg
	==
X-Received: by 2002:a17:907:1b26:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c16b46e2b24mr154301766b.18.1784306511183;
        Fri, 17 Jul 2026 09:41:51 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Date: Fri, 17 Jul 2026 18:39:12 +0200
Message-ID: <20260717163959.714561-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset constants for the 12 MT6589 toprgu resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
new file mode 100644
index 000000000000..ee08c39df513
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
+#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
+
+/* TOPRGU resets */
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
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
-- 
2.43.0

