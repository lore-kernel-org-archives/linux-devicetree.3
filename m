Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FDB3D7D86
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291642; cv=none; b=WuupCvtfG1iw+kZ/n8CnvSMK1RFXstcWg5GeP69yvwUCbM6N7EEUEpsMGaSLr+pGYkGB9sODJqjYNETPQTTSjEU6VEOZzhqES5ow067qjMnkOqtjgZbFK93vO9Z08W09sICgNWg3vRcxTL5KLqim4oap6E2cyv3fS5djxTeFqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291642; c=relaxed/simple;
	bh=Zc6iAVEt0F7FK7wwFQYlFWdspxD2njmPlJu6eanWn/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNjDSHrRxzH1HEelXk1iJm0FkFL9p8Dim/u/AVu2g/M/zEGRB5DSHf+8brVQAJWRn8Xs3Zb7h/deimSWNcz/XHE+DZPlI0tevGws0VajVK8g3ZVVvl26BTcUieh7aXzyt6NW//L0+RLvmTfd43xauJCKl26lJxX2M9WsWxDv56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIrZRKhg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIrZRKhg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49553515a8bso16954355e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291640; x=1786896440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=JIrZRKhgxfcXQOhd7lNEpCgg+qQGPcvW5hv6kxYrMAimcgSM8iorHB3Js3qJ+O+VPK
         IuNrO7oJEiIyTqduCo1L5EYqVXhHKZwg2xKpfLY18exuaBUERj89oA9PVPZSEXuVGdav
         zCBuanEKnEmySrmYOihfj0nSy75GiFIMrGI8QUrNaGippeISqIXYwMY/kKiolLiV5MBy
         nwFvJlGxVacWDVlqraX8JUs+tImPoy3CuBnzJoBADG000w/bVV1fBrF3B/JEGmTfbGlz
         qhq6FvwLEfW+I0efvYgeaON4tEbnFb6popviqMQ1FUwuWafCFeKFE0qaMrjPUOIgMkUn
         yuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291640; x=1786896440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=bJa2xLP8Hbfrn7Ib+UtPr5Vlz9tCQigNqaDsSPA8Vr2y51YQs7+8FptKQGtroe/Mp3
         w672X+jD3FjMAt47Y492/5SdOCvaPS9/j4Aj+yq4MCSKuQKpfiJC/jUvxMoe5BVgTukU
         yHTaR0r8zq06EU4lUwlw8si8vdLnrukKzjhto18umuqg5jUPFm7bLLUawq9upqWKdO1I
         4gqgZhgv9eSbaHJRwzP16VBLIL9U1JFAV5o7yTTEIhz84Q3K3Gj9EddHZuL1hKc/ilBn
         28qxWkjBaTFJeykixDnF87Ts3Odp9hYajbrUnH11w4AGWbH/LOpwF74R0H0CFyVUdI3c
         XUzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqfPXB6dVx9cDfk41/KFBax9UnL2BbL7s1IIQnlTv0u1GcXnN4j9aFoMm6Y6OV8sgKFKkhth0Prgqn@vger.kernel.org
X-Gm-Message-State: AOJu0YzShDwrzjFpmsjH8/A2xAbE88+Pgypmv/cwjo27a+clAze5DApB
	HodosE+d9PpmsPEAflW0m0iB//O+CAq59VTTmYKbiz29S3w/LSaqLm2Q
X-Gm-Gg: AR+sD12PMbB/BxE6P/F+KX+8C0wJBeVqJ3BEE6MybSqPJe4r2YtspcKFxaZ69ZweoA4
	LK6QBOvJomHZZyVG7flYUXPc+b7NIj6VaSumWP+P3Oyo1bCOaXEF+TfKVooMtkfuqvYmxtiCBxP
	pggfvOFsUhIRuieaeGjwh90GgJ19FQdyyEKzcgecG+hoKJu/v7X2YDZR0dA6BWP8S9LE/cCg2EQ
	aU6ssanwOOUSK+zkrJ0Q+e+/EzQS/bINy304vXfFa71WhL0XOwgxKtZGOt9KTicYTNe+KBQ2DrM
	nUshEUaCVKxdLiL+pcfaW1wCLHSuaL33iJSaInHNOgCK5niGrF2MKe37qY/E/CQvECH43ltL46Q
	HZZgPfyziP+7jaJ2U4/Hqr0P06c745+UAQhGYuo7n2fSCsae2p3WCYG9RXzZpE1jJ5OTRs3q1kJ
	K4fG2CVAw0UBx+w0IZNkSQ9+zpGc5CuUxvoxTVvmHe38MVcUj3QxCoVNd9/W4+fpw4
X-Received: by 2002:a7b:c7d3:0:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-49959e2f01bmr250237915e9.12.1786291639315;
        Sun, 09 Aug 2026 09:07:19 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:18 -0700 (PDT)
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
Subject: [PATCH v3 7/8] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Sun,  9 Aug 2026 18:03:31 +0200
Message-ID: <20260809160643.33991-8-l.scorcia@gmail.com>
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
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..edfffe35ec14 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0

