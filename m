Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596872;
	b=INT+88kDjulLu4MrxBeWerpj9iaPf61HeYCfTvKyUnZSEB60Ie0xF+Dz6rACymUjetGZ
	 m1mzWJ4HQetKSQ/xLqWDew9bfraj+OoLCgmti4Q+3Pfvh3wbxnzi2nX0Vb26oIWDEh2/I
	 TlayCoL0xnRttzTsvUQDWfpfmLmJGvduRE44b2oIHQk+ORc6VzjeEXsgZGlo/ueurLbi4
	 L/BGBa3V6G5MggqmOXRdC7Z9ThmovreU39Ky144N+s6oRWmrphxjzO26Mxl5iJkJF+U+F
	 OhS1qqtNsf6FqlMI8z8iBlO0KToQJdbuuc2GUCDAQCrG00rKQBqn+eK9QDyes7rTLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
	b=pXDXRhzRDMzd92HxPbiFRjhsPpSSs+cubG1H5EFeeP7VxIedWPZ03DocfNMbsAWIDtbJ
	 zUg9PSYaqP8XdOY1WzTw+ozyseUyyeOReFmVV9V13Ky9bqDut++mmANnL8kV7Cz3rbyQk
	 UHqAR1P0LhBEExne6CiE/Na20w7sb93r3zzKyDw/A4X2DVGRCu7RADEZGWgD+S4SKVmTH
	 HoUxi4S7C8xqpR9p39NZ3EtKO1t6Muzg6kzJDh21DaAwVTlNGgx5CBuzlHlWsf9JDdjWY
	 eNglJ7aHuvi9r5fmPaXSfaOhjk0ysdu7Sb1ZrJ6Ar5d0GF/fxMn7EsogmOKiDygXYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827960A261B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D827960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d21051042so291222566b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596870; x=1795201670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=HePccj35FvhTjvXwtdVBJgEGNVeh2KrOUDPZqigubVdBbr/KLsuRN5y64YNXHBWId4
         m5z0PK1xgJg2mvVjc5PNTWLFyq96goUIFhvhIPhZLDaMHVwkfH1EPNEemnp6vzvRPKLg
         Yuy1HRPofIJAEzZc6kSFJD1IKjUzSort9TdQEdO9ff62aiFdDCjMk7tpoNy2qzHJ8s96
         YMdgBD2K4ZYcf0zITt9tCnTJE3UbVZJCXEo3J7dmh0cYnycfUhsDbPWzieA+Tru3tD+O
         CE6bH2un439G7EPfZMZmwydwevOgw046xvR0kNIjHzWfD+tp7t1hWAKcpujb0Shia4NI
         mV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596870; x=1795201670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=K4mtixnioBCdZGa2iXrzZoT41xb5UrIG1AhQYa4Grn3jsXUIH5YdiXbxDBPODum2os
         jAyL/n3KqSxMSWQVkkkXs1QSaSjemfMK4hg7638Sxf51QTnp3KtfS+R07M5bfSSWllS+
         kVPhxRZw6TD3CveFCWmxKiDCVwE8kkPn0iwdFrn4eaDnW9leS10YqoLszhGLe2CivQtg
         Tct/VlxcMmyGTcfAGWpt0fetqxu0mrw1mh+svL/AXZb0+7r5bI3foJRrq26e+qXStfnb
         AmsoIS2cGI1efEsbiK0v6e4mQ9wz7j+snjXEGYAeAf4EhHNciPo6euWjaFs9Eedx9UFb
         A2tw==
X-Gm-Message-State: APuU4Z/88LF56sxigxZcB4lRpWYn1pLRvgNbJn+MkKXXE5PXAHmVnkfl
	IoA1nY2wKVUR6aYfhs/oeuJmtUi6MpKKJ6asovOQRvwSOl+x5qt8WELIM3U/4f3NSOBXfg==
X-Gm-Gg: AYBFou2RnK2t0kz1T2WbcGcGRZyDnTwk/mNsux3hc8xY+rzrp17nHJma2RG0tfndESi
	CLI91LVDoiWL40Snq1xhCGlG+MAjV4iDRuwotSLQoAiflOfvWKU6ysqpw0LfQI2Fc6axeNc8DoG
	8ZvXKKqGsozeg9MXHNyl8viK8yOH1xVelXsFcDWqdqOv/yQELt5sXPKCguxfdElMr4eQVFvyU5Q
	v/K8zDE6zU7Vb7zJKysCuXyDYHSjD7SWB4NM9SuIjTgCtTFx43cP4fhMNBETKrWIeiZxNrKSYSR
	Fj14lnm1ymer75146rUGNujaU/8r/zK8TepuFxVaOjWFktFGAmRl/xEv1lblN9wQ+D00UbXOhLT
	W5sUrVrSrnlwdjrgtB2JJ9y4Ag4yWWQZG7XCCRHfJpzLyhIrmk8Z968sdSnwFtx/PP0yG/27PaP
	bU6Dl4beFLjjeTbd2HJQ67MB0sKiPMJchy/1CY+HKvwmm2QgNm22odVidV+5stzmDbYppojLIE3
	Xv89RyfBINq5SVAk5rHxww0U8HigzompX06uLC/CJ2bKMseqmnM4iTlzPDEaVVSV+mFmyU96epx
	5ze0ykgqwuA/L7irOVXHiS2b2SUM1lODKMxUnBWZS1KcLnpupeZktjJW7vg9Z7HI
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr389984566b.24.1794596870123;
        Fri, 13 Nov 2026 11:07:50 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:49 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:59 +0300
Subject: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
known yet.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8e8991ac95ea..d0a73b9c81d6 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6895-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8163-wdt

-- 
2.56.0

