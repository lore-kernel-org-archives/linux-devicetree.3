Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37C3033E1
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372271; cv=none; b=l7Y4x9BfqJWP+29a87jRF4DwRVClRC0aAMaOxEh5P9H17N2Ep3GiXy+2k8Wu3UN/ON1Q6dIrjq9/locErn52db05KuG/N0CMl/tmCkZW3u0NUX4vtYK2JTYZ0yqnP321z5ZdREjcBqAho2ZaYlsNX6IZmE3b22e2Egl9aj2OvTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372271; c=relaxed/simple;
	bh=ve2/3Qe7TzCeiCFTIJQix2+e4EjyWcJh43zJia6ILwg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YjWtzwrY/a3MNFhUKmYNIQ1DfSlBWFadvfNlS0Pvd4zPZgCu3p0KHW0ASmPat+0mHhIlrC932J9m5LNQjRbW3aAO4pV5CqwnPtby7AMf4YBR2okC9nOQLXVkC6tV5rslpW6qxnCi7IBUeYDYEa1K6W1ztk7JqIeWxlN60klBLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9H+zz9Y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9H+zz9Y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so16429455e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372264; x=1786977064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/C2k4gMz6ir480aiTbVOqg/q3uuCJAvEhu30au5mPM=;
        b=D9H+zz9YESGSaoxDbMGeSR11z314fpkrTMNiu/BXa7PUtDq0747u7lRIUBtgGsZ2lg
         4tAOos5+WXQSxAV3Mk0Cqq5g+RGbjsJCL3bItQ5VChKfboKxsSmEoDKd46FURurhiNPG
         WkNsa2IBr/CCrmQH0orCF0IQsYO/WFkn5rN/NKiX6Q40sn7MuKhjBwGE544LLNHSCd4G
         eXt7uZh1qomlXyygyn7NFJwr/XtGqw4PNKtRMkuJu390fXrG5+nobbS8j1VbMUlI4B7S
         2m1u419SBGNumbvHakidJHvqngumPMldSD0+zzJicLq5ttaaWDEUOnZRf7ytiyuW8LHr
         FzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372264; x=1786977064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8/C2k4gMz6ir480aiTbVOqg/q3uuCJAvEhu30au5mPM=;
        b=eDHnhe5WLKlvzadAOuV5PqOAaEmBzADDl2KWQM1AuJsA2jBQ8vaAfTc+aI/ciTFB/r
         2ARQefTVBAVW1WhJDY/XffZy8Yx9JFl2vsnd1jTWEeL2KTXS7mgzM3ak+ZY3KFn9pCai
         SSDdxZWp6Zg91MIO7IgTdLZIZ46x+9sybPyX8DRFu6cNWNRPrV1TNP2WT7NVC/DTHUeB
         974qX2unZrTPX5Pslpe8cWXKQMkExySCe0/dXf1/Ks5Mc2sCN15o/mA9Ac8ZRxHmWZ39
         YxAoVn5BKUL+IB0A5YT0P9PU5G6CxUt55N5EcyaGI03xYOpbMWCjW2GWaFM3/p9Remw1
         GMHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR02DdkO5xXGaBLyuicNhaVckePF2sJtywke8liwUBOO3trwkX+EuPkFdCKcole7tOh3OYSrtGrHnO@vger.kernel.org
X-Gm-Message-State: AOJu0YzKZAmZGV/Up2cUSFAkW7r5lb7QtwxC6X4cJ7DHZ68RqcnZwR6K
	krGDe+ZMIJmJtTSfK0ePOYHxNj9UQ0hyWeBqRccyyaOao4rHFDGEdQBY
X-Gm-Gg: AR+sD12CJ5O6UhgZdC6sTdA+ZFpBU9UjQ19nsrvX7aXF6Jf+xIozSId4Tz/NwEfyolH
	z9NdN2jy+nNtNpVJ4H6WTtPeiHyCfm+eEdT7dtwTRfQ2S5SvxSKO3RB7gG1ah82u7VF777bKWp7
	/5DIAgMugBhut/6Lcz2oJRQa7NU8tbehNdwvFa/30fzfsAFsoE0j0z/dKDUTogGLn4R4roDDONz
	SnG4GRCY2uZ0L98Wsw02eTP5fauXjmLIY42UcDdaPr3V3RYrkluB3zWr3Uk/hhCrOd2wNn3RuJS
	DMiqO//6KOrrwpHKeEpHuTROmDBlM8iisLtaPjQJ4fQRrYDWdbS2LIXrNDqEg5soiUK4TIuXWCM
	vyCphoGfvksWcoyjIIF5ivx37+IhvMwg90iKS0B7jHjqElQ4LIFGBXBwnKlrZkM7V6zOCMIzgAB
	x7t1NuSxJm7PphqxJXSueYTaTtoGAJjGq/cvasqM4r8sqaBi6Mfv89VjmDiZS+eEM1GGeFSF5UI
	vQArSdqUck2Sf5r4QojMGwDZU8WEAa/IuG2bs+n5EEXP3jo
X-Received: by 2002:a05:600c:4e8e:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4996247e640mr219037545e9.9.1786372263301;
        Mon, 10 Aug 2026 07:31:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm438950695e9.3.2026.08.10.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:31:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: devfreq: Document support for Airoha Subsystem devfreq
Date: Mon, 10 Aug 2026 16:30:54 +0200
Message-ID: <20260810143057.651478-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC contains multiple subsystem that are scaled to a
specific OPP taking the CPU clock as reference. Such sybsystem
can enter idle or performance state based on the system load
and power consumption conditions.

Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...

Document all the required property and provide examples for the various
subsystem OPP + devfreq nodes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/devfreq/airoha,devfreq.yaml      | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml b/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml
new file mode 100644
index 000000000000..2f84486cb209
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/airoha,devfreq.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/airoha,devfreq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SoC Subsystem Devfreq
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha SoC contains multiple subsystem that are scaled to a
+  specific OPP taking the CPU clock as reference. Such sybsystem
+  can enter idle or performance state based on the system load
+  and power consumption conditions.
+
+  Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
+  Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
+
+properties:
+  compatible:
+    const: airoha,devfreq
+
+  clocks:
+    maxItems: 1
+
+  operating-points-v2:
+    description:
+      OPP table of the related subsystem supported rates that referenced
+      clocks will be scaled to.
+
+required:
+  - compatible
+  - clocks
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/en7523-clk.h>
+
+    npu_opp_table: opp-table-npu {
+        compatible = "operating-points-v2";
+
+        npu_low: opp-400000000 {
+           opp-hz = /bits/ 64 <400000000>;
+        };
+
+        npu_high: opp-720000000 {
+           opp-hz = /bits/ 64 <720000000>;
+        };
+    };
+
+    emi_opp_table: opp-table-emi {
+        compatible = "operating-points-v2";
+
+        emi_low: opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+        };
+
+        emi_high: opp-540000000 {
+           opp-hz = /bits/ 64 <540000000>;
+        };
+    };
+
+    bus_opp_table: opp-table-bus {
+        compatible = "operating-points-v2";
+
+        bus_low: opp-200000000 {
+           opp-hz = /bits/ 64 <200000000>;
+        };
+
+        bus_high: opp-300000000 {
+           opp-hz = /bits/ 64 <300000000>;
+        };
+    };
+
+    gsw_opp_table: opp-table-gsw {
+        compatible = "operating-points-v2";
+
+        gsw_low: opp-200000000 {
+            opp-hz = /bits/ 64 <200000000>;
+        };
+
+        gsw_high: opp-500000000 {
+           opp-hz = /bits/ 64 <500000000>;
+        };
+    };
+
+    npu-devfreq {
+        compatible = "airoha,devfreq";
+        operating-points-v2 = <&npu_opp_table>;
+        clocks = <&scuclk EN7523_CLK_NPU>;
+    };
+
+    emi-devfreq {
+        compatible = "airoha,devfreq";
+        operating-points-v2 = <&emi_opp_table>;
+        clocks = <&scuclk EN7523_CLK_EMI>;
+    };
+
+    bus-devfreq {
+        compatible = "airoha,devfreq";
+        operating-points-v2 = <&bus_opp_table>;
+        clocks = <&scuclk EN7523_CLK_BUS>;
+    };
+
+    gsw-devfreq {
+        compatible = "airoha,devfreq";
+        operating-points-v2 = <&gsw_opp_table>;
+        clocks = <&scuclk EN7523_CLK_GSW>;
+    };
-- 
2.53.0

