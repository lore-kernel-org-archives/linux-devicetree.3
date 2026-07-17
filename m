Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE03EB0FE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306520; cv=none; b=Me6j7MJD6LKOqiT8IMBp/W+Q9k9CBwbztGmcu7kYW/ZTcfw4TUnadm/S/mlAsbMHSA4pVj1RThXsrEWDrMPzlcfQi5n3akoh0UV9dcxdoK0XJW65GB0pjiVO5zVOczA2stZ01BH+ubQY4+PIMBEtvGP3NqNrxgsbjSv/HUThhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306520; c=relaxed/simple;
	bh=FU6qDeHF6G2wnG84JcolMJ3imCNMGWHDGr+KH2C0qSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bq1KqYIqSN3C9P9hsGWf1e5aDfegMWfi+toEFoQGoRa7nHOOPg2uYGy+HCVuAfOCHCxcqfxuoSbCPfEXrVaHaCpSIFblueHaMbhGcLIy/agUK9vBRjcXT8uyCV52HZnmQoRuIlgyjpiihZ9GRicmqbtZ12cSMOIfFj0ThG5/o7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMHMEI79; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMHMEI79"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15f360851aso680688366b.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306517; x=1784911317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=lMHMEI79xtiZMjzJUUD7A7zwZz/fLtVIimnESYUCO66V9bjuBLOmsspeyO4wFEGbWZ
         0+sJyFfTOvm/tCL2NRF9+3nkVGQkqBcChlddMiF3RuKyVX0RQE4aX3CiYWeo2NG5ZcF+
         hqKCdDaRxyVU6FJclYN3a3arOr+AICbMCc7b+vpEuItSqpfPYTlW4CqyiV8KB1U9iosp
         2gcAa5i5LgCTIaP117b9TgAjGsS24sUAuw5IPBFeE3GUkDEBM7dXHlQ1Uk8HEbu/6iIv
         hC1RXWq0XUtfmAW4j/iWyYZnziB8iC4VwJFxwG/XlItSBn0f8xptgBAMC6FVq9OwaDOv
         /gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306517; x=1784911317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=UBAoEJlX7Mjc2HZBKsCJLxALzrOa53tCMGYgYfExz3QCMT9KSutyktO6Hj8VYn0Bsd
         pseDQSjkQcFrswVhJkZcahK88OM1PeF8WTzbu6l7zHtgWX6Ai6C1ZP1M94M5ZEiOAfYO
         HFJsO0kc/ffjtelGyLic4UTxY5CPY567z7Po8RMLNXjg/Svdlv1wUwQ5DIWU9UGHFt7i
         SrP2hHGsLlOztq5A5j222SIxwYylaphqUHp5dur2NCmzBKSfyO9aQ2WpDTBrNyO0ILH/
         /0g0dCREaUF0BpPNb5YmwiJ7W+AxhDl0F9i8MS+0haw6LSLffP3GjvVD1rwD+Xk7kmK1
         E1YA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6qbOle5N0+7sY1OjQuPqSUa70/1Bg2HiTVfwrcu7vA2g2BpUHhRqfNVC80i9MSgrDsDsE7hkgUSrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+bQT+Y2BvyAylJqcymYYq+dy9hABWIM9KQvfY+T3R92s5HD+
	gyYsDcLe4pGrTs7CuMdvGbR7jS3jC4T/DcywjB4vKbccoqNeNiWSsPTh
X-Gm-Gg: AfdE7cmDexz+Kq94560o7kSvpU51UsDitCHrqoL6GDssGV35KPqwHurggH6nXPdXXqC
	DyAfdAV1C4lHNnEzbGvFHuM/6duQLcQjnJnGnxNY57KwkpsKsZ64lAIFon7J9l7t+iZF/XZUJFq
	o114Yx2nBt5U47uyhx0bAXcONG30hTnj5t40MxFSs7yXrwDJt1blKzfMs1KLwiEpXFsDfFrHORa
	TOr/9SxknO8USS+3WTEiPwp8KpcJ1qzykAwty3+A6z0pMtgE5SAMdnBft2+S5uk5kwrqcVxtcfd
	o64PYNRY4y1/ydhepDtJ4xmMzEm7E52h2YWtCjo45Am6Tqd036WYuXhwcCFA9PN25l/Jp0GrUeP
	TwE/ShGeFSftCHcOACm0DyT/gWllPQd5UrQ8J+vOhngbD+JHISYl8P9tfaV+MT5GDG4i+L7erLA
	==
X-Received: by 2002:a17:906:eec1:b0:c16:2a6d:86da with SMTP id a640c23a62f3a-c16b48533ddmr153955566b.54.1784306516701;
        Fri, 17 Jul 2026 09:41:56 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:56 -0700 (PDT)
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
Subject: [PATCH v2 3/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Fri, 17 Jul 2026 18:39:14 +0200
Message-ID: <20260717163959.714561-4-l.scorcia@gmail.com>
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and their order is different
from mt6589. Update the wdt binding to add a dedicated compatible for
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

