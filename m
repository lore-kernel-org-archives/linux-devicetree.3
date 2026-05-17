Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FEB3090DE
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027253; cv=none; b=ef4wP/qhzHy9S7tMKOen5jqu7C0huyZhq5ZVfkbdCp8a2tGo7trDt2JSErDB3JFfyRTAooqIPjV3ij3ksx+7ySnBME0tQxKz1hazD478BKcwqb09R1UAHXgCICQyPNgKyrsACYvPnmS85sU6S5OWZInK2KJ9jFOBZi1uzakdJik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027253; c=relaxed/simple;
	bh=J1TWtwjyathQVzLOqlPAy45y/P9JtYt8NSeJ7wfuJ1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgwiIj+IqX6CvW4GP9i+vE5nq+/l17B9soWtVvO23Yw4kIsq2ly8ojJTTL2l0bvnpS9NJo47KR1k8qvjv1Z7t+Jx8ZPrEj3IpmjEXIfh/n1aY/9pn+nd0sgnRN3JDBixGUA+A2O6UPM6D/IEXrtUoN5sfZjB1+QBnnNjeVGdkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJKpm2Zt; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJKpm2Zt"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-838d0b7c950so977405b3a.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027251; x=1779632051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=HJKpm2ZtmV1pwI86ClhB00RBHacTqccJ2b9+GtobSqeuzT1tjQZQuQB+UFw/FkFusg
         JLSUrNg/5akI6zeuhNq+xjSk4HcPNkSR3hPOdFVCOwErRdnWJK4cxNXE3HaFo0AAf2ln
         eRxp1NoOmtX1fYMib3CS/Qgm2HqbfJjoXN+2mzdfoq4YOYQ1F/rLUCPwPqhN+Y1gyqQ5
         MUI7loOYn9skbTOE8F3A2US2hyvM1LW0iZD3zsKdY7DRS3uhYo60a8bWMcOdpz+69jr0
         ZAzlX1h5SlYfNAXm54J3OQ+zOV5Wtj6yVX3Epoq47V9CWhzXAVBlIlyXgVGEWbR4Kuu9
         HcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027251; x=1779632051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QuKxsb1CbpZOKkWQdrQrH9Ys+UuCjZlO2N+4MPQtab4=;
        b=B2Jl+94yTQ+tN4SiEcVuFUfWwdBGpTa/iH3UoYhz77UX5Y4HVp24pL0sYjIpd0r3Wc
         inXfOzA5MJCl9RQplBxWqac2RhWAWEazvqAAyI4eulpqyWnn89RIGbm4em+bxEkPkIPp
         TXCf+HaWVebSwG6bYTZUCFueY4ESpVNk0jRq6CrJeS48VNFjijCWskr5wlHReeWsOAJ/
         ERzCTXRHiDSOA8jynn2qQqxCgNqVn1M+tbJ76ZCMl9fVmLaGLV3byT1OoP6YR2RYBwk4
         a0geQYVuCe9cT4YAljlvNrFqnXwI14S53SBMyZPldAzQRCt4jKyGhI4UyqwjeCaK9/+3
         QBvA==
X-Forwarded-Encrypted: i=1; AFNElJ/DQ5qhrxZUrRLQqdq89tQFklwJh2OEhwXEZY6FLc5+SWkY5wmTbA9OMnRcomfAc0xcRRjpetb6v8LC@vger.kernel.org
X-Gm-Message-State: AOJu0YwynfH6KR05fyUPpqLyNsx9R3A03uhQ1ZfqLlR+nfXlC9msLUuA
	xZZ9hVSgAM1/s8iQdlddjQA7aP/wqdlH/7Fkf+KI8clpoMEw1JlHfWuk
X-Gm-Gg: Acq92OGJBifwAFBT0c8Kfuz4ZVwUkAxXEWpFgS19Qy01gLAf5303BN6HSblPBzfAJVw
	4sUu+8F0hQOQ+e+h7LATfbkdC40kTvDyjm+jfSi0LkQMCoTY2adNlfNT6qBNAFIzgU+P8KYJWyY
	x3TItV3KLr+kHwJF0JyeO/AVG1LqTxP1/P7HkIBRC8+JR0K2gygIVua+3feoJ63NOFNFZr316mS
	t2MRvBi9ENfUfeIrZJu0+HFvyQgeWkhJzqK7tInn0mFhf+8uGri8DSslOgxCZZvezJURvedm7CF
	N6jIKEL2X6eOn3Ah94Cv7WAtF2oMtkwZPkpVb16aMCPO0C1KaZYFAyJpq7ffQsyyIYars5KszeU
	5NyV1gAmGF+KG7LKCAqC+GsbbHUypooxjbEG16IShwLVhC5gZQj1hMTiIUUs3P9bKsMqVY9kE0v
	d6QDODt1a9cntyk61f9oHnDRD2mfoa
X-Received: by 2002:a05:6a00:a221:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83f33d9dc56mr11055934b3a.30.1779027251056;
        Sun, 17 May 2026 07:14:11 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:57 +0800
Subject: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Add a binding doc for the top clock and reset module found on Siflower
SF21 SoCs. This block provides the main PLLs, high-level clock
controls, and some reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
new file mode 100644
index 000000000000..a013d48841f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF21 toplevel clock and reset module
+
+maintainers:
+  - Chuanhong Guo <gch981213@gmail.com>
+
+description: |
+  The toplevel clock and reset module on Siflower SF21 SoCs manages
+  the main PLLs, high-level clock muxes/dividers/gates, and some
+  reset lines.
+  Available clocks and resets are defined in:
+  include/dt-bindings/clock/siflower,sf21-topcrm.h
+
+properties:
+  compatible:
+    const: siflower,sf21-topcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin25m
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
+    / {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        xin25m: clock-25000000 {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <25000000>;
+        };
+
+        clock-controller@ce00400 {
+            compatible = "siflower,sf21-topcrm";
+            reg = <0x0ce00400 0x400>;
+            clocks = <&xin25m>;
+            clock-names = "xin25m";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+    };

-- 
2.54.0

