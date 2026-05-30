Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DE317160
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153094; cv=none; b=KGOMCGcMFKoTIDPbqnZ+PpChUKsJXhlcT8aTASkvOJ7Ltmbo2kQcHRyxfdtCb8XrUgiu0AB2V2gjE464MX0oH51UsQJoUyPBTRakGD6Ag02DDSr+1zMsUE4sowNYs4l0WPAYYirztOwwGFbJ6kZwO/lMVFwgAgPf4vAFGkg10GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153094; c=relaxed/simple;
	bh=Q2dM1RFym1OfrINK+LVMiRXtIN6rihS6sLMgCqCHGOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwWaTMZvlLeisZlyYlCY4as5twUwYMj+HvQ+oh/eDafdlezGQe1YgJOL7WULJMaHwkAu7x37TcyajiYnX9wm7xS5X/ZtB+W39bTjSTxBc25yvGcS/7wm5nxek+CySmN8zvl8eH/yMAWIOJbpNBh9Pgxj27iWjVO9XN/ZPaQfpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHK7UGSs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHK7UGSs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso91451005e9.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153092; x=1780757892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=mHK7UGSs7sXfgjRCktwK71k/Ahixb0t57RsnlhYjk2flhs7ixaIytqbFez1p9u2LA3
         S5udJpY4h+06gMkO4cvd8urOvPgGVDcFdPws9k58Ni33utFEf8U8SxnW7ara5DSvg7x6
         0IEY/ZGVi1SVHJYS+DIcQE5TIxwFwYxgaT5/YoM635h+uG+0AybDbuY0KSBvDESvCk9c
         zP7khnSqE8zrChlfA1qiZaldvqFFL7ZWMMcwRhbcmocdB86pEovSFXSzZwfC6simzOIM
         dDwES8Wuv7eoICHybVkSan1x3mL5uzBDn0P9lylvDYuz4L383L+hoMO+9MrgYQKD0I8L
         9dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153092; x=1780757892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=HhY0y0Q0Sd2cgH1qaHAiai6wxOGXHLo2H3kE1PxnvisCIgcMtlTNFqMG7rEJMaI7fW
         EGxwpmRMpSJxbPFSs3H0b28g17+a6nflG1nrWxAT3kbhUNvDa0TH3RLCcCGN5StKiFnT
         ULhzI4wb0mfMC6+ZNPesR3dKeXebvXSS1Ff5Rqbk94LjExFy3fdea55W6t8kAokpTu6/
         CcVyeu27TlAj0VwEwDfO4KNm4qQn2Ak4CHy23OSCSjqCQhwbWokAtVNDB6V96MxFbwxL
         NHG9NoR8Ox6ynoCYtxY5Rnbz0+dVnnraW2JxzaWt5TxLm1EbImSMHvyO4sMCDwz+xabC
         5BRw==
X-Forwarded-Encrypted: i=1; AFNElJ+pXyMGive5wsYfEiI3c8ENnEyQ3KohG1q7+RieKKrCjqshc4xsa1uIZLSNX/q7QZBNCvnO5dMkBF4H@vger.kernel.org
X-Gm-Message-State: AOJu0YyBT5mV5I3TiC/j1mrLEZLY5FYdohFLODKBDA6CZFnsdOZVgddO
	vHRW/kyPhaWjD4fidTTR5IRso/liq0MIuPPG0ZLyu+oLJ9PkvgPAet4Z
X-Gm-Gg: Acq92OFo8DAMexr3ezn48zjWSQMMKpgnrlUnh5p7oUhuTXhNDXLLsTjAXLQIu+Ypum8
	H1/tdf3NcQ1LYvou4HKIqdRZa9hrg0lsM27bBnj7j6ogsXEaqqHkSB3TNSbCgBzRfmrFR6uANPi
	ct5jJvPpraKOhqttUceX4ZsEGsj3vT3lfU+1XJgvbMiYIqtmWdBPCVlTm+vjNeW6q3rXqNTVC3b
	E2ZnsVtGEBwAy/zJdSB9uZViZPCxTf9l+gHYcL2tFRlInk7Zp9Ez7xGe1jblSXeWWThHULP3dHg
	mzEjvWNY8cHMpbQFBcXSBbZp1xsbPviWjVIJd79LtBbPlWf07o/MzPXREyC6J7wm0bQGRjWIf6V
	oyLehYpwYyF/kMEuoK66OYb4njex2F3gjc5qywNPWTv0ibCStLtWMa8s6LLcTzqAFjWDrkRbOyR
	t9m/7kpj5a7LCU4GHKLLN8Fe20cc42RLQ=
X-Received: by 2002:a05:600c:4f53:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490a2958dc4mr75086275e9.16.1780153091542;
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Sat, 30 May 2026 16:57:54 +0200
Message-ID: <20260530145800.1029920-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, capitalize pinmux description, wrap all descriptions
at 80 characters, and remove literal style indicators from descriptions
that don't need their new lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 0dcbca5ca8f9..4dc9504e24ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing the
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
 
           bias-disable: true
 
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.54.0

