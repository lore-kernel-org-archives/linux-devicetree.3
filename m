Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BD4908C2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678965; cv=none; b=RSoTbMK4BJa1v9WecxievTu+sxv7GtvppHY84ngH/UQ9tnU+67iXc74VTsMEpqF9I34qTUC1/fYGiYoaS9svcNhqyGJF/Vk8R3beviUNCWxL5exnxTORVVvgAnTd75X93ZOjzdqURAM5GNRBSWTr099xNxv2nED7b6d/VzZQMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678965; c=relaxed/simple;
	bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdiGsTytUzGWEYUKxtXfbXVs75FbWkRXL8gu2WeuxfVTi9MwZcOYu15/d0o7nSMawpBalVxKkW9Y5XwOpSqt0BOXBcj6r0c4AtJoEBJkSBxA0c5yxqiiDbTW2orFq0IEACI9Edx8rzbN44IJ8rLHKy4Wp2nl7lMEx41nfTGgAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a7VWaH2Y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a7VWaH2Y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so639825e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678960; x=1790283760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=a7VWaH2YtBBOzNNg9O5oBuirnKPuT9q6Shtnl2c25hnivyG8HheSxYJbAXjYhkrZ1d
         45Gc8+wVZn6xM7tyiErDO41hQgAwK5C8165JpuGJITkVn/U09koKoLdIc/aOIaFWClHp
         LL5Ka3JlqHpPsIGJcsp/dyXW65Pel5RlukokTd++VpcL22weOaHzr9MX1VE8y99249rr
         8ewTl6CUsBIFXpVy5CmymXNpgYU19SW3ggF/AzJ1/zTxGN01yBCKiOU6dRwcWA8TtD80
         xqJAv2JIgHq66wKJRwZA1k1lwgXxTNiW8E5i2LM1ymC4urYEH2cp4tpMAehjg6bdAZ53
         UXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678960; x=1790283760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=HH8h+6LCV3CR65HktW1/IOo+cORYxpiqc9D9bFmiRwFY/XavCYUEHNgqs1MsC54NoQ
         5WA1bAoQ4jmRbk8lK5HrWcY6i65oXc3smGpaeTtdYHZANWNBkDachsRXCfUssydqk+Up
         tBLHtwS092obo0WML4xkTeB4dto+4IgcwE6c8ZEAhd56g3u8xEP+ym5R+GtwA6KLC7B9
         U4qrqfnrTxJbVJXoMezSSJ+UFwdd35FverQKZb8ii6XPwIOrg30FKKErmcJ5i+N0AMkH
         sGEQDjt6w8P0tFdCEOT37z7uAnyCWFkwHugstzwrvM/WuJQU937rn0u0YC7N79y7RVsU
         gyPw==
X-Forwarded-Encrypted: i=1; AKwUvBwqFWrLhbCCOoo0DLmH0j+FXowyWXGPoDzUpbd5RUozQZlgR7K9I3CjQTTduMrEfOLGZqxUWjoD2QQ0@vger.kernel.org
X-Gm-Message-State: AFuF++lvq7h8lhIO9Zt5AFQnFftuF2UWF9JW+vJi+Ep1FfzOjsFRGq/7
	FHFvoDErcq+GTLD8hOKi82oIW4mK6WJl785VWataGAqFjEpCjlfh35KTu3h9mSnwkLA=
X-Gm-Gg: AYBFou0FKbQUqtkOJXKxLHvGtRBOTah8mOM2HOpAFLWTriSkUxoP1tqkABPRE/p+167
	SQSV45QjsFqcZrGbec75zOSSf1g0xHyXIHoglgByMcMrwcXyAPdvKuRHpNBHcVU1V6R92r9Rm1F
	OCo+hbjtJ/cKdiRvZRuo3zhjEFXY6aiHYa3jc9NrkRDUQZkkdOfvzdGlI700RuXfgS8vBW5qN+c
	LL8UHy0ino9G3NdB/XDAsUcaoYeS9lWq5KF1c974+4yoMmc8McHb4Ilge0d88bBxBdoQKiEgbVX
	LvIcQT8HtS8RucL07xvciUDVVXU8IJ4CJ2rkIdZsFcus71i0zt27lMByNFoIRecD+uvznkVB8fy
	9s5hoh/elzzMw11Okhlv3RjzTP+fiZt/ek8V/Rf3VsoOlH2BciP5b2+Plbf8c6/ujtKZVx3qpk7
	s2Lt1e2J4Roo1HoqPeMy5uX2R3hOhItYMURrRiZ3lNV9gzhwGVnGaALowj6NVnjMeIiw==
X-Received: by 2002:a05:600c:354e:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fc56ef4fcmr2059135e9.15.1789678960500;
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:31 +0200
Subject: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnP/iLUayjLtvv3w1WaL+o6/q3gtS730b2x5bv4nd
 NEio0nXOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1lBGhhv/lF3Dql31FD5P
 951y7UhLXb9bXqdBKoNG8RaevrMxhQx/5e75/EuWX26jUxHwt4L/5y1eLaYPe2wDn4ooN2QzxW/
 hAgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

Note: GXBB and GXL are not known to differ so the driver binds on the
'amlogic,gx-audin' fallback.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gx-audin.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..76e6a6ddef36
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,gxbb-audin
+          - amlogic,gxl-audin
+      - const: amlogic,gx-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

