Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A033AD88
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561908; cv=none; b=CBfyXtktz0Zh3g4yPRwuG0jUGKeobsE/CjNsrUanLxZJueAMprfQp/YsFMzHI0XH0ilkwnfBx/p4JmoSHBUiUPXDJprFQBlMWIl75whrS4c8Z1+GvGeWwXqCUUP/tRmV5K7w9UKgT2IX2hm4INYQ/l8w0xEb/NRcd0f4usVwYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561908; c=relaxed/simple;
	bh=QRPObjn0T2tfzHzHXODIwHCVbLKA/nQO3o1BxGgfRGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7hsIxHcqCwxu7SejEe/Pg1nyHTvryTI8iJDZT/LDOlIgd7HN5VBsayZE4sYndYUaDlGc4kB4qQmk19rKsHkGQQZFzzUs0bAFIKpIOE0BK/DU/5legQUQ92OWC3TVVbwZyTeU0On97ryzj23JjZzElrTZZMOi7wa/bV6D7G61oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwDYCRWh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwDYCRWh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceeee8c46bso3361685ad.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561905; x=1787166705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B7kXto184IfdvkiNtrKwwTv2Mmp7EHyOrh+nVPdHPQ=;
        b=BwDYCRWhz7LcVgEMPmCNUjIiLv0NZj/wCUiXdNz0ddKIp0b1PzMsdzMuQt/S34jLAC
         iED5j9bDzZtP75M/UHPU3PzDYs1sxfDX7TWtTtxGZuotEjJrEpI74Zp3a5MYWePjwt5d
         ULnd5ojy2r1UdiYeFnOoVv/Qlym1M6/U+BO37FMif2lTLcGt+Stcr5UjF/xYY1vNmGLZ
         AL1u42ldmEHATHeaWVtQ7UziJXZ1/0nIrf2xB7HPwOb5MM+IKBb0oCcRr6c2a/Dl2GDr
         IjEjl+/OosCLCQ3kZeIEfFLlEPAgtw93k96Ft84a57DM2UH740e8Bp0+WooUNiur5HFJ
         Q6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561905; x=1787166705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B7kXto184IfdvkiNtrKwwTv2Mmp7EHyOrh+nVPdHPQ=;
        b=aRqc5advNDehQHboU9S4BiS1N10TCZu7QgHH8Pa6e6CAlE+6RjIK8PujqX6axMFWKJ
         cGHIyaLzfBCH/TuS8EkukLIa22sGCfO1R3RjNi91jI8h93o0hq+A3jllsqGBQe+YtgsK
         xrHuJCqZNdtbdzI+YtPzY1pqW2vsPumoaiHuqVO7YrROqp/x99DayneZv7gOB5Qqr5hH
         fToyW19gksD1educmAF4qV6VxsX7z4cq2F6hfPlukqwxT9fUuwd1QfmDDr+kY3JC12Zz
         a0z5dwj7eyzqJJLQJlLU5zUZIB+WxqqOxc3afMp5B1becVKpxdMM8jQqAYOF4wlU4AoI
         +uxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3fpf+11mVf6GS21mzEJ+trQYnhTt6M94+caWpxdnTy1JH8fPAD83HUbxTwkIVpqAuBpLj56K46CMn@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEaWuCJmac6r8k1RgAudp61gHFCCV8mswSsI3CpNn2tqJ/cO6
	PeoSj1bDPU7PEJlF+dgSnI/vzUmp/tU5zuYMN+7X8Z22K+l4fTt0FOFfg4AaYQ==
X-Gm-Gg: AR+sD10lQSqFtKoaCCGQ/iuwVgDNnUYGpEkrQS8r4CygXa4dGN2SlnXklTxog0Ujt1z
	xmDJ+X0DAedwYSciN7BsYNv4GQfNcldnJwNjRBc98qOlDNRDEyMqkGxVgWnPoewW8PXbWvuNq16
	mvKgbUvTYQ9KL3VWJIEGO9C+2ZRjojZ6zNS3nyUDqOH/spgk79zJoN8VekSsbsknRvYAMRO6Vz/
	Jd2FdRLhXjPH1ujhBKcSIthykEWFMJs+UPbiA36hOsFv8XeFx/szke/q2CUebtTHohiZmdllWbm
	UsYexrSFcoQ1JITbidN7MA7o2Lr0gyOgqNivsSsDMVhtRr8Q6UULWRF+UUqsXhKsYcLh+J5otFT
	r/yregI7Sicds1W9+4SUNHHtzhdKWiEz9ES45J+oknSJcU5OHO/Bb12IFvhwxSVdD3x86s9hryW
	hl4b85pvE4M7gddd8H5PklQpD8FpqrEvH3KgAgnKzF601sUa5o0HuSk6/1OX+oW3CcVirWvr8=
X-Received: by 2002:a17:903:184c:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d37e8a68bdmr1263255ad.3.1786561905423;
        Wed, 12 Aug 2026 12:11:45 -0700 (PDT)
Received: from [10.170.23.252] ([2409:40c2:5017:a6a2:eb70:cb11:a19e:bd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31da7bf64b5sm9496947eec.10.2026.08.12.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 12:11:44 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 00:41:17 +0530
Subject: [PATCH 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-dra7-atl-v1-1-27b691f4cdcf@gmail.com>
References: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
In-Reply-To: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786561882; l=3600;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=QRPObjn0T2tfzHzHXODIwHCVbLKA/nQO3o1BxGgfRGw=;
 b=DFOrPCV2VjEUWtlAtTbng/bANfNCYOgDCWkZnM4nWP5LqiHMaOnTiphppFuA7aTCGcfjId3YG
 mURMRC3JBIuAAxOJXKPEoHHpqFVq92gQ8VRK7Yu5QjNKYtWwPMrfPl3
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the clock output portion of the DRA7 ATL (Audio Tracking Logic)
binding from text to DT schema. property clock-output-names is added
that is used by existing dts/dtsi.

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

