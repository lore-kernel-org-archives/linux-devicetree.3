Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA8311C36
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153092; cv=none; b=Egt8sSe+qZtZeJodFGnUsKwW24Mib9xxicKIJzBnlT85WkeirVXENIOto/H21/+Dzr0ThnEKZqI7Hia7ONoOp3S4BUlMZzbwSXjf8X8qpfLxtCyJ/6KFbh18H7o9U6jM60zn4mNiMuy+gABnkxi6tLEALQ7S0Sub5dpF2BjgIfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153092; c=relaxed/simple;
	bh=LaSZy4tAMF/OIeKnicst81GeQ4Uzqc4SwQUQiLMnA1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI3sGzMXew+GYM+8fz0ymVe6z3jErI3Ts7e+XOKEHfXUyGHtBGnwKXtlysUTaPvHfQ6B/pJiBYqav/BOl0rE5OTUqVC8xvCHVfv39YaR7caPP0/jpkMIiARdOLnlpPHbgxzR48OHyFb0BWyHN/djPnaJX81Q/HAC0j2Wn2YLzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myT0clkv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myT0clkv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-441209fb77eso9106069f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153089; x=1780757889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=myT0clkvizDLtb0TsxST/nea0ocUR+ILNbklafRTLZ3rQcshEHSj04lRl5teM+JeTN
         W1XeTDBcqLJrRO7wYYFI/ROn6af1+AQXBzEu+IXdhfXlOMkU/PRy9GtjYmoS6PcKjmaI
         kdCn3wlMZStpHORUzom55nT4hc82aQLNrxO3s02mzi1qOvrXLTpum3o5RVntuoYcPsNB
         MLI8f8NceBl+Xcqo/FEQTkjA9WQ77xEV3ovaxYQ0kf/PClL4W+V4n87k4ykk3ExF2UfW
         EUZLf/+VNrIsoRvZ9InEM0Z5W5emwy/Ny0n/Op748yuO0riuOiBW4y4B4PiMUQl18ltI
         1daA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153089; x=1780757889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r32fsRHaMPradn/MupXc1NKlCK5+0PUCZmgy8fvmlC0=;
        b=pwJr+/+yjA+LPdPuVQu9KDhmuL4UdHdqp7EOrWQ0XPC89sWMO0EGrxpbB4qZF+RBfN
         r7WjCzuOW6LaC1DCrSvTH7O4DLpQ/3n33cc1Zy+le9DL2m64ei4GCPGRbUnj3MS2Nphj
         GdhQktQl/+UTia6eSqBWhlZo6JNzKMALYrMeIJMmSm3A3rjtbGm2fvuv1M4962D7hwSx
         8JRcaxZm11jKd2GzCYNu73XbkP4JhsFO49nsVCBi1FC0LQDTU7FFexyqzwyqKz3lg3xJ
         pWYn30sCGHMGeaiqXdvpDT54PTGsgmeZcXGwL60DjPuEh7ipu1lMoJa/izH2Jgd6Mn2+
         IUew==
X-Forwarded-Encrypted: i=1; AFNElJ9wRgqoMW8BoQmjBkvVy5RCbRQY/QcsEfTmq3sQNp7B3K1E229DEu1ZyGxzY3/JXQrxvI/bKIOsVQNs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMN94TSa0qnPTDRj2qVzP1Qnrm1v8yuwgkBOHvilxGOoOXHdx2
	r9Lk7YJSKMWYphepEVdGwbjKetInmvqOz4N7LOE2hbkvtAQIvTlNIQXt
X-Gm-Gg: Acq92OFQvUDguYmZUANSfsGcLLOphCEcN8xUQ+uV1aKc5W9f+EHQVTHn56a4aEyNjIx
	vqR/6zzQQKI26M+lJVt9UJUa03+dV/nirlCDhiRleitXRgGWCqJPzPCakm49hrNgovaegIrtI2m
	rIF5u8uU4cRET3/x+2ITGmdTxBgzjMgWcvJ56vBuIuhDm1yuogcaCqwzO+tTnLQa9bGg3z/jb5W
	2gt1QJlpWySDh2/B8z0C0P9eMBBxGKsagQlW44h1llxyjl17fDSHx5BEKgiOuh5pml5Of/i7d1Y
	wn+M9LvatNXRgUwSOJYLlnnKqU6jcrlnfPT7aw211CEHAeur8iAJhIrzTld777ZONpcUkvC092H
	nd4rgpg/L3uEYFbiEsq4VPWSVAo68ykIbiHEKO9Kl4BGCVUVQbDMzoIVkbr9pKHvl5/vCrE5thd
	Liyv/HltgQd6jOE9mm7LVAjbCkm8qZvSE=
X-Received: by 2002:a05:6000:40c5:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-45ef13794fcmr12535168f8f.16.1780153089159;
        Sat, 30 May 2026 07:58:09 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:08 -0700 (PDT)
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
Subject: [PATCH v8 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Sat, 30 May 2026 16:57:53 +0200
Message-ID: <20260530145800.1029920-2-y.oudjana@protonmail.com>
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

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index f4bab7a132d3..0dcbca5ca8f9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
 
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
 
           input-enable: true
 
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells = <2>;
             interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv = <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv = <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv = <0>;
                 };
-- 
2.54.0

