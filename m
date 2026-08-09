Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A13D6CA7
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291635; cv=none; b=N9IDPnNj8nl95wm0zhSnc/aZfaC4nnZxh5T4fVubRedcNLqCHF3Z9Jm4703RbBkO8JckGoyMZuZNwK1qImTz+41aLkAf9+M0LMpI3TMMmMIZxk6nZVVFuyOh0ZrwBfUyQ1HyQ89Hv9VZnpIQOSIjbzgSlnbHLdtdljpKdA+zVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291635; c=relaxed/simple;
	bh=tW9XEYPkRLJJiOTaVjuVTwHydeZR9DbwvyRR6aSkAbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5nHDYFOy1WoYb252ix1SsWJX6c94l545pUp0dnP6Sg9Vt8f4Ox4EY9RdDSpb99axVCmsLKPIipUITaWBXQdmEvXMOfXkWxCKP/M2QT8VUrw4AN2vAZ49GDIHtWbck0sa+Z7islnaCWCsJPFJ+jD7N+R6D9QDaM8qTbyFY09WhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOL9fePS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOL9fePS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980dc26022so10693665e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291632; x=1786896432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=bOL9fePSIN1ofGxNTBsLp/J9JYZIezkDGWMrItRtaEcBkJMujYXldv1WbCvD1XWHN0
         LXbUU/sMGvkhVT+aR9wkzbEaBvZZIqNUuBuil8tnZmOBrQGoyQqSElytkppaibLV6bkR
         SdoiiX3kHrWvySoHjVaHy5mtHyVoX61Xdik36PbsCMP6oy42efjmpb/6vdfkDX+K4LLo
         JwqfApRF81cT9qOlYHkNEsPukPDceqXqOMTNaZTY8I0vnAnRApgBNzmP4HhZFNucsxPr
         vPWpghJmVZ/YSSDuxq4NjRugunVFIxW/hbOEywGHwIICcnbtdZHAn+yYfm/wpdZqyxAD
         3Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291632; x=1786896432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=p3lg1wuEd3VQ0Ysz0EHKHITyyfKkX62n7+03Z3kNy91PJiUZ8wRn6N/rf2QVf7aAWp
         XBpqezCtJOSUzIVqqoPg9W8zQPouUw8MKS+OE9MHwCqtvc90kUQmLAXaA7PF7M3GYlob
         j/4lwKSLiD2xNorfqK1sclcDC4w4qgYeL1n/LMcjXYaPBZtSTBQ2xB/eom6wx8kEFw32
         ugS2kZYLEbATqcnK6rBMCgXqoORIJXIxFEVeOJjrU2rA1Z7kmv4ONLOVqCOoDwE4XV8J
         +1Zrx5wekcEOTU0ipI/lIIkueiQqaqrM7j7TFj97OHKCe6/8zgaSauWO3jQ6XRjqDC/J
         +RRg==
X-Forwarded-Encrypted: i=1; AHgh+RqMhbPf+kjNxhVeJ9aUUyuvH2oDXLuZ1PKa3kTXknHSHKX7z/NbYsN+v/C7cv2++UXH+7d8khw+jB4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SkPqK4Zeq0Qv/Skf6hoZl/BvX/CpOE7u9qa+8m5Ut/Akm83h
	RTkY5IaW00capccz7BRV5QGCfGxj6s60tVuJhTu/nEhBCiglXAVHaAhF
X-Gm-Gg: AR+sD10vH15QQF8pD4IeVTWJvwl2wD1RSctZchew4e+cMzmpZVg+HhyKQVD4pv7LM1S
	CufR+dd9c5TWUdEsIbUMzVpUwe+dnj4WDbT4SBlOkfTQsljhW8uIE5TK9X8yk0XjhwpfxtX76tn
	8VRasKbMainpUWEEzNoieT1Hcq7bIXA/BcZde6joMeKtU12hNdlM4A00eNy9gAsUv2XzFekL7IF
	sUZwVB3Y1J0rjHCmOab3vWblQtRYhs9Qo+a5syQA4EeofHAMOjGYYXHvWZdf0OcZgI1evj3GLHA
	bK8q+Lf1m6vymLE6zKbE3DlnFSjogF4iXHZrT6zXLzNYM3R8qvFwVmwAotDt5xDiG88RD55NUMq
	vbpFekkIpiKVvjX4VgnGHU0rroXYm4wbQl3xsT86kt9g42KXdQ48Ci3mTcTgMBCs1Xb8pQ1OvFK
	ix09qBg6b9aQmRxwqyaiuvZfjqgn6455lori6Zc3QPKRJB1l8uqd4VoA==
X-Received: by 2002:a05:600c:1c21:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4994e6fe377mr488271375e9.0.1786291632103;
        Sun, 09 Aug 2026 09:07:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:11 -0700 (PDT)
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
Subject: [PATCH v3 4/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Sun,  9 Aug 2026 18:03:28 +0200
Message-ID: <20260809160643.33991-5-l.scorcia@gmail.com>
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the systems to which
each reset bit corresponds are different from mt6589, so the reset bit
constants are different too.

If the number of resets varies between SoCs, the watchdog driver becomes
incompatible. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.43.0

