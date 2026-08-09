Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECB3A4F5E
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291628; cv=none; b=KApHydykQKp0glGuDX/ax4s8J3mlFkx9kPYUAfwQ2X/Adxb3k8+qFARt7Uhnm4+S+5iz5Pxh9HNABDQoeqDYsbq9KxeBevYeHL4pUhQeNex2SffCz+/SbYv4RP9UvhEsP4xK+dEa0g1NYT2Nrubwy6EAxuteQYQjrIiv6SB9580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291628; c=relaxed/simple;
	bh=JhqLBdq3WIVPgiAIXgr32xpTA1kFV1wyKoQGDAs9nu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tfhz6hdYf7p5ijAMaWAK7iPJ8QR82qAqUbN1f+mtb4TLiQqBtx7JZqJAk4hXx/P0ay90GiI8Bg8e1E1LZlzTNzulhlAIxF0S5WXtLPBmRL77lrgZ8cKI6GXDF0nawfcP8WhGOmoNu1ppXDtDgr7Yx5u+Dpkm9TMZ+EgfpIz6kl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7FHFIdx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7FHFIdx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso16952575e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291625; x=1786896425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=N7FHFIdxrtvIshC6TheTDSI0hT3JHo3gh1DKlvUbeIUTTb9rf9zyjj+I4uvNxGoDJm
         M7qLm7q/DMEBnmp1zjuGaOXipPh0r9m80uVSslvX0cQLar8lWgTgQA43w27tvnnaTCNL
         5MIqXqzpHlYjFbHLyHcEDb04A9vVljW5Cm1xjAt+8X0Yhrr3rRxEgS4ypkSha0IRyipG
         X0AeZHbF8jejUJIwNzJ4TynWRHQWPeNU32ZeS/yPy9RbdR04HgSYZ6beF6F/4Ju5YgRy
         eByrGJVVnWIFabNqzi7DQwoZkdWpwxreQ5iKFkaoRkm8oZoFW4GsF3Ze/Zu+vhOCFCb+
         vxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291625; x=1786896425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=BM5l6GeL7RneeNUTKbUpfj7hGuK4ujR8PDsRLRWO4y/PS4x6T1rnLAruAgYxAtM4Fp
         b7j9yXOqVzt6CnpSgargHqP0NE3HAicf6fYhti05GOPTw7ZaDsXx6MlcgVtpMUEhYexf
         H/5Xbn1MFQNmIo7ZebwxMqAG6b1Y3r2IWXpPeMblkp+MVvSvB1KW+55c4Da32bzH9AgZ
         8ZHoBzms3ps9U20U5zsX/kmMsbBLdCd9yupqkXr+/PkeyySqh/MyaXBpBsSBzd95C3ZR
         IAWnDSW8rRyq4up9uZOnBWl7jLKJTBjN6ce6ZeU0ACQdw0XixJ1v6CRgKxNdzLGPZr9l
         7mHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTsWhYfCWHQaY0t/LwZm5k/xOp4KjoyGo8rB0WFzqp15Zu7XevAdgnTllVRwn8kJQDU9JRnUI1B/cN@vger.kernel.org
X-Gm-Message-State: AOJu0YyBtE98tt+hwWGXoQqPUBmZyuvcBLqLM68H1nw/X1teecXhOWkK
	biFTi8sIwwUPRH5SrpNWCnAMN9fQTZJlC+vDeRd7bSEf5IKShENmdilX
X-Gm-Gg: AR+sD117VDz+Q0aN4/LpKMr6+utpnfF4jtKnixwMMv0duTP2DLpynEXNYYRgx6O+tcT
	J5bJohxz70HlLWGR2RJn0CcKDPxT/OI8LYKqHhWVuEpc5vuq15jblu0wbkOuCa7a3TTS5cHdLlO
	AXl9YnIjuXt/tKTpy6uVCTsohS/5pTi2WLRchlqbUzFxhTQGbeI20Pvx3SV8MeN95DpEXmSfmK5
	72QPgMEHGiw8tVKkvU7wROM8lX4JbT+zBGRvzHq8X8OuiUzUZmCOE0P9ANudJE7VnfuiAPPCQ7s
	vidyO0/12JDrAHZs3DHQpeQ2KaC/jcvhJvkfw/knn7u0SXtdExSglhWG2zkNyyiT7UzuIVwud+y
	nCVMORzNXThdBwrneHOQu0+RG7dC2tdC8tVvE7CqPGeqXM3ZLTsRznd1NqFhW5CCKwbn5PND6yr
	uXWz8twoGwUg/OXOeoU3O+88xdcyo9JK+pEcuPEVfaO5/yIRg0mwfIFw==
X-Received: by 2002:a05:600c:1f85:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-49959e3c571mr301623835e9.16.1786291624921;
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
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
Subject: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
Date: Sun,  9 Aug 2026 18:03:25 +0200
Message-ID: <20260809160643.33991-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt6589 watchdog driver implements the watchdog feature, but
not the reset controller feature, which is actually supported by the
hardware.

Add the bit definitions for the 12 mt6589 toprgu resets, which will be
used in the following patch to enable the reset controller. Values
determined from stock Android sources.

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

