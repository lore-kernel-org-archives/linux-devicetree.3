Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024284570CE
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918606; cv=none; b=Rps2K1wtQ8wLEkQI6iZwQOA0SqubOAVotCa2MamT8GD6ETbIqeQPnfqHgAD1RVAAVUSeQLeJ6Uu9ADrLBqDmWJXTPI3a3KXi8ekDpuijy+HnlBgZNoAN8sUQ6Q5VtWz8uy495VXmGxBptiKOMwMp47yCcAGwdKmYjlAM5zsDvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918606; c=relaxed/simple;
	bh=S3Q/+d2FsBlN/P12XJtwUtJEKsGGawcHMg9yNFW2tL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0WLSbci8PTrbsm47KIPYrIVA9qvLategOEkW/oktXfszMGg8jelcYp6ewBhoQdHJt0osiG0ACisUPFzlpM0Ovz/npWxHanGdiARqx3LAdnZ0/3JRMjmX+Sav84qNKIjaJQcbbyyjGFzUAgwGxcMByImJaOarxjGTlRB/2xFVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMGS2RdJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMGS2RdJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so5818425e9.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918596; x=1785523396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crj6kaAmoeOOOLVaGiQbQt/QdMV68EZw3l9HAE3uANU=;
        b=ZMGS2RdJ0GtqRkA211F+SMByk3aayyin9mlCmoGtbusutxbss4XSPX+o46CA8rqO7v
         v0vdGlCH+E2k9EHIh6hbQox9D+UDAbbTcH0wj6ULkxr9n/I60DFJE70SxFFgHLrVeObS
         5jfQDkakgHGEdhmk5v8mxmjqrzxOqfI9Db7QqqEB8iroXWEKwceowkgIvUVKUgdYYYoF
         End0LE7JK+zhYFMxYUPHQY6Qn5cz1eKTG5SUF7bG28Hxv6Z4wjIKRjkEBv4f2I4hEmO4
         KrhwJvANOi+UzjeSrFqoRo3usX5/8aIExYkoBg/KORA3fXA0T8qolVURRlpTLcYlxfQE
         7Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918596; x=1785523396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=crj6kaAmoeOOOLVaGiQbQt/QdMV68EZw3l9HAE3uANU=;
        b=EG3yE8mjsCra3KoZLhUAaOVj9zIyGpyL4Ncl7vdf8Tcrgl0d5F9YdWl6+6YI4am/4J
         TvOKaCxg+u278rV4dtymsUu/imb45VE243n8A6ALhBoGahosRPfaHm6XC1MQ3XfKj6Vx
         IF5VwPH3lj1sCf9jalU5oQj7dn9azRzZV7LX7kpVwP3TZzmRlpXFC3LitCd1wu5wSwFm
         DC6iM+Of3UnjQLffNvH6Rknol2rQ3EqchoZTIBc+vkyxtEgv/nTOopf9hvhXnogtZZlX
         Wx3KW+iJJXaiAAvZhnK+bXFDJThX7iuKgmBLg5f6Kw7MYqm5rW2BH2CuzaaL01pOaGbo
         rSTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7eqaFhOckQPsfQ8UAgA1ffPa2t2nbr9MU0mxtwhRNELk8tsZIUxJvL16iVRBcKcl2Hd2kDO6u87Cj@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmZIteZmvHvPkHIvEzfoQzs67eOqpDiiMb/XZbCULIC7IXuMt
	gSqDrzJcdH7zo/NhfTiPSppEcCi59RiBw2WYdrlUVrYJElPc86aFSWGy
X-Gm-Gg: AR+sD13pI1ajtYTYdnmYG4+rGljOAfWnp4SzXiP7PBGKO3AJpH0m8a1wsieX3MA7/24
	E2kegSyN+hUos+t26giK2pSp2pOXBqaPKbMw64CKtbPhJeVQccCUqIWx3MVabKR7W4fOLXVN4tH
	yPUgxx+5SuSf8WMVqJay+Ogz4CU9N5Sp9ZHDlZEztLDxC8/jFcwcDHOmyNCuBPjPdIyjR9UztK7
	zkAVRod1h5Mgcj3w05MNo1D3Hd4KD4juYy4qKVrDNw9z5hvbPg0TaoAvX+Ua9TKrp9wXhLQc8SS
	GDNyt4jrh3AUTU5AWBil+5i5289ENgSPt8miSlajDMJCCI4XMq48DtSzjRCEEeT5jSRa/heNYVy
	PoV/uEgFo9CizrVW0fUE6nxBx9Tc0SvSMFkiaZ1LimNzTi3hRP8xYbIMBuE93I2PLfcscn6pwll
	kYmECorAvWTJiDew5B/XXvF+fYHwx2OOnQ8z4uEuEkuw9JUzOa1+3bFfIfBJlPD4A9
X-Received: by 2002:a05:600c:198d:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49573cffcdcmr98305755e9.22.1784918595771;
        Fri, 24 Jul 2026 11:43:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm25701300f8f.15.2026.07.24.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:43:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Fri, 24 Jul 2026 20:43:01 +0200
Message-ID: <20260724184304.192962-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184304.192962-1-ansuelsmth@gmail.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
 include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..fc37786ac7ed 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,12 +72,23 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
+  - if:
+      properties:
+        compatible:
+          const: econet,en751221-scu
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-          enum:
-            - airoha,en7581-scu
-            - econet,en751221-scu
+          const: airoha,en7581-scu
     then:
       properties:
         reg:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0

