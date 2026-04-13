Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3AB3A3E81
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067356; cv=none; b=iR51BVu29WA5PnMDH4yEtqtAGn4+OVvEn+cVa+GRVrKfepzLmpCZ79mkZgID2HFsUVOxNo+kFrR6nEWM5fAUItTspXMh7wuXhR9HFrwUD4pgYY3NoUAxl4QxyF3gTk+CU+0NATC+Va2bCW11laDWpaNWht5WcOEMbcqIHNhSxZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067356; c=relaxed/simple;
	bh=VLqXlHYEYj6QD9rr227aPs6s/WneA13bYBUQMaGOG6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKGrq6QU4TyfAMn/SHoz0x3tXNi8oaWBvb9vag0bWn5J7+lEwm4Ekb+GpljY9vmQqB1aDuU8lHJZM3Yfmh6o3xKUZyUZ6Jm/32RnXVCvSOXUU1w/vvORYMH9NsdAF3GaKWlB1WXtwPGoEl9Sr7+njGd1wL86H68sMk9voo712Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8wo875l; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8wo875l"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso4115294e87.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067353; x=1776672153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=C8wo875laIK9HY9D6ybCEu5xIZxBN2w2JJgBWQUkFWaMrxdsRQZJxY+WHUQgGraqZi
         Z8nofw8GFontuUpm+LHEq90Er+6etBcFV2QoamyA8JynPPQ+gQPmObketRgUOCNOn2HS
         B/+E8iORZXjEBY3A7yWmsND8/KFbGN0JjEHEEqDyrBBekmMqIXtyksGsuvMZUVpFQ3j5
         BaLh1Bi05BiiECCq/kBllzmWhnDd70/desQz81Iq4Hv3Mxim6EICD9eTxacYIjKFzyT7
         pxRealufinfuV1XAcGynzfYXmRrKY1bUpy7QLsAiziMGfneBdRu/8i+8tprACCnXUlLI
         tpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067353; x=1776672153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=bkdWnpudzeKMlW3JDhenUD/fx2aDfRXJBkjZaYlHpAQLTPJ+m83CsjIhiM+9TgJ9ST
         Tq6Kko+j4zlhGgnhNmC0GbhEYisNmIYKFnCqTLANOttha0V1Aue/+8n5M2tIAPyLzjL4
         32nFeypSe6KEdTibVAx+zEzt6zzwlzAP4ZB6bcBnqME0WlxshxNly8TcTbZ6UhJcSrpc
         3PBbQO+mC/1rNBbGi2+dBGvr7Bj99Ock1zxsm2NYSYovetnJOLCXk0y7Ln8Yb3W/G7X2
         X4AXjqUpdizLCWYDqL4WJnDxsC6oyCsUDCAKvgHcBVGkIGaHTrk2azWJMGliC858pcx2
         Cglg==
X-Forwarded-Encrypted: i=1; AFNElJ/Nz6IuEX++X/LLr9TWgD2RRRj2kOzA/wmVq1GkR8GbpbZio6CTEF1OcsE+h1IUd0rUA5QUPCTU28LK@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ1K+itY3rSOew1p+0lmGSce2w+DaNsZseGJema1LeDpblRils
	CkCG94X3FkZ77ybYxB2te9mngfM3trTCCEDuRpzC5+TK7qqy3YqqrVuYyI4CLA==
X-Gm-Gg: AeBDiesfpfFeTeq5c5UsyNWGucesqrxYiJE//cd1iBVqdEpI80ZDy4o4lMmZTM9qfIi
	/rpSYUNZWnR0vhGg3y2+moaTr+eJxY8K6EhAZSsM9YNrvS9KCuInhV3UNu+rwguZy2GuFXkrlM2
	WX8/n5gmCzO9iapgZaDbRNl1CnDipUtTn3e9Nuaj0+6AYcLWz5H030EJGcjRg+1Nn5bNwbzxhaz
	JveuIE1SVO5zvYntvTiZax7zxa/9r/Ei0Uypby93IA4DGH1/l4hOzv/TdJUqPsKzlJ9odiQBiDP
	8e5INyUERMECUQQoduQ5yMhEzSTn2B0XgjtU6JnNLAQq7UO0Srgfxo0wBTSPSlG5QYzdguBV+RU
	tFLe1hnLBNDu1Tbj4bB3EMOHtx7ZOQkPxvyDh1PDJ6QPaxl0HyQIAWA/6ygdR+c5MqGUKccX2CJ
	Wd9YFReokOqfZYujf/F1wVAedC2hBucMIY893hEU2YfYYW5FE9W/aQuRg4esrA0ryu
X-Received: by 2002:a05:6512:1395:b0:5a3:7528:528c with SMTP id 2adb3069b0e04-5a3efb5620amr4070325e87.40.1776067352455;
        Mon, 13 Apr 2026 01:02:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:10 +0200
Subject: [PATCH v8 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-1-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f..34d202af909f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +74,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

