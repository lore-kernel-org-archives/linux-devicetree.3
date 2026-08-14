Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0833E8C70
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742503; cv=none; b=I2lLMw2qIePjd947MZ9rcgfsxtMorSbv3bdFWxHLc80bsIPb+qXB04G2Yp2QlxP8eH0BhnjUHCuOMyZVrdnA8TuCmAZyxyXJIqNus0mmYqc2ketSqrx288ajnZC5zzK5mXbSmub/YcaSqyKx0BTus9Qyznj2MZqlWxJR+jEadP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742503; c=relaxed/simple;
	bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkXEgfndOLEFLCioMTgXATMaHbhEwhELpq1tWtdi2UukzGnWiqxg4dkMM0PLmIrFxbDjWBureX6nHZ0bmKhy2kUYmyzpJkH65eW+Nf7OUf7TZLZTuKjWeQpWWraMPtmhxukaKzcRwc8+itj3byarN1nSO18tATwidKug4fabBSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmI4/gmS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmI4/gmS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38fe113c792so148509a91.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786742498; x=1787347298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=NmI4/gmSTiLXYjP1qim4JIIR3WJhSUyOkVY9I9qKlHx/0W0TF5riNMIgSPHqYk06OR
         hAbthlhvse3OBVwfWwCWZKGeQflwxron7mFCYhiuEfeanjSeGMqpWvp/Bmuk5a5N7bW9
         VAN1L37eHWXmPWN/SNXkmzfg7F3XKbquK3n0HwJXZ7pKnSTKKXsBT8ksV3ID5fR1wvfK
         S8nlTVJIACwqaq8F4xf5Ndypr3TF/p516MlSmnMT7ajeyykUPsKj9MnQMX5RDgRkgrJg
         eHQgz82VDJrrwd+WLYqi2JAcmzso71uNKNQsFUDTJlESgHxp3Zoe8xvk4vmjSTKqM9xb
         ebfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742498; x=1787347298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=c4paPZQ2BUMy29YO3CR5uJwL8UWgMe/JoywZVFecDnKA2Jb89TJV54K9l5Lcc9pNHZ
         HZaDcHCMjEh9pCVBOaZAm0NyIdf0WzApPqhqRhtAIyOCAg/o2RD9uBiN278kdFfAaICU
         T2hhI01bIz5DLhmLTqP7OVGFfUgbZLVTImYVjq2H8ngmIF7H1FWw63SXPhhU/iVXq0uQ
         hWTDzL69XHdsFHib4iANE8JeTCOnoMiAo7V955lvqqu55rKX+9MEKU4xNuaFwG8sYDkL
         90I/6ocRyi9T1pG3k83lfk3A0oY/LZk0ZGYf+Y3ynWcbrzElWefmFbk3OkAkG5od/M02
         1Nag==
X-Forwarded-Encrypted: i=1; AHgh+RoCGYK2Dneawgg9H42XS7hhicbyU+DRdjUN/6yPbtubceHRdG0F7TOyb1A6Kl46alWIZKv4Vx0UZJ3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyIafrgudGbk2++W4jgnQVSt4eZxt5RhtvsB05aOZ7H5BwPUpJu
	bWqBaqIDha8zSgbTetp+5GirVYXWnVTs6rV0AFAs0nAcy9tiWDTLTTKd
X-Gm-Gg: AR+sD10kQGVnf49ZR671efvabHy0cVstMF4B2TjIUJYNYcWqymuy1kMhmbwQt8E96q3
	6t2tULinU/LyZO8x7IX3RnHsHGi6ufi/vgURHrim3f2krQM7QyteJOp6AH0xKAuiCy7Sp/Q+XC7
	z/5l7pNv6W7ORA6tWbuVF5pI8/OXOq1QCdYEiEJc6R4qgHlPqQqkO8vYCmOAe4lQJmanLCKunVq
	KDT/h0+Z+VIr4yRJpnFpif3TmOw6BE26dUrdqfreJ4zZa51inJevnzzi7hws8MaPo/ppTjmK1Ak
	D2e42iyrmB5F9U82FLQWItLEvRlzcSJayW3bAUuBAQLyKc45x7S2W9dQKBK5Yhh5AsgvQdoQcFi
	CiY2jlmcLHR3VvOGEc+GiGTXhyuS7L6ccMdGFpUfmLXnAzsYxCVkGI3LNktGgZdLGbSbSvT9zJO
	vkyFVbqGqOQihcNjCnKTZ2L7j1l/j+saPXFmBHsDWkV33EJlWbEnDiywFJyPJ8OD0EN4nqZxfLd
	A==
X-Received: by 2002:a17:90b:4c47:b0:381:28e0:6248 with SMTP id 98e67ed59e1d1-3933b6fa584mr7435398a91.1.1786742498536;
        Fri, 14 Aug 2026 14:21:38 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504f:ca49:504a:79dd:fd2b:ca2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm16678893c88.6.2026.08.14.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 14:21:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 02:50:56 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to
 DT schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-ti-dra7-atl-v2-1-db64c147c2e2@gmail.com>
References: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
In-Reply-To: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786742472; l=3650;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
 b=NxRGxjBC6lb3qhT51jyu5o5aj/7tuEIEWGRLSdfZMZtkOpncHoZvRHUUH1XfQNHXASuhnw3e1
 b5++ip9N8jAB2G6TgmpLLhoZavWozwfFfJtlwxLXDeRmqTWIvQbzaK1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the clock output portion of the DRA7 ATL (Audio Tracking Logic)
binding from text to DT schema. property clock-output-names is added
that is used by existing dts/dtsi.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      | 38 ----------------------
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
index 68504079f99f..e3c05844ae86 100644
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
@@ -9,20 +9,6 @@ signals - can compensate the drift between the two ws signal.
 In order to provide the support for ATL and its output clocks (which can be used
 internally within the SoC or external components) two sets of bindings is needed:
 
-Clock tree binding:
-This binding uses the common clock binding[1].
-To be able to integrate the ATL clocks with DT clock tree.
-Provides ccf level representation of the ATL clocks to be used by drivers.
-Since the clock instances are part of a single IP this binding is used as a node
-for the DT clock tree, the IP driver is needed to handle the actual configuration
-of the IP.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dra7-atl-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles to functional clock of ATL
 
 Binding for the IP driver:
 This binding is used to configure the IP driver which is going to handle the
@@ -47,30 +33,6 @@ For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
 file.
 
 Examples:
-/* clock bindings for atl provided clocks */
-atl_clkin0_ck: atl_clkin0_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin1_ck: atl_clkin1_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin2_ck: atl_clkin2_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin3_ck: atl_clkin3_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
 
 /* binding for the IP */
 atl: atl@4843c000 {
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
new file mode 100644
index 000000000000..c0795f4abcfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DRA7 ATL (Audio Tracking Logic) clock output
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+properties:
+  compatible:
+    const: ti,dra7-atl-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    atl_clkin0_ck {
+        compatible = "ti,dra7-atl-clock";
+        #clock-cells = <0>;
+        clocks = <&atl_gfclk_mux>;
+    };

-- 
2.55.0

