Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E583BB112
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476758; cv=none; b=j0rslARalTzvXtmvdgnJhpErimqbRcpsPRtUFSZLJS4QrRoFbl8h/uBR3TxJ62LMJSrHfssu0g05B3V/HIv6XlH1l40NpHutSOaw3Wfjo8PdvqM0T+kp/wH97IQZiH7Bty+Zx4tanCsPDcqyrvS3gkwl0hDGK6NngabQlPPXrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476758; c=relaxed/simple;
	bh=m8sAzO33iYtVKLXrd+2NaUjzgG3gzawYUAd74pqePhQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhnkqBKeT2Fp5XqKVlGruQHZ3xn+CA7MaM0pe6L1nrB18VTVupTorQcOieYy5R0SZlUYx+HxAZsWRkP0G7IL3sc/gyIycN3mWj8aTH4h1ia8jhAKV25YRlnYPkOqjycOD6DbbrC3vDe5vyMbP7ee7cgra/vGHCTUaxvIEUCpQiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1TMNnOa; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1TMNnOa"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so353514a12.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476754; x=1790081554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lSkFSVGa/dllH5JEoKe0+pLfgUwm43MOT22pfjYzUoU=;
        b=a1TMNnOaWPkCyd0PRw2yfor8ttdv8V+icIEqrnSBZZp/NbT1ZToUPALVzveFb7j045
         jk3uhghFYcrRfdotIYtVjVDsjYvYdZRDqTxXBphdOVg3i8eWNXAi4AkSB5f7cv7clNVP
         evMPJv05xelxA7uBW8GfPB5VA3aq9Jrf96VkbW/R+5xrmL/WPINWNkCN4OQymr5lVN5O
         5AZkdQEF4NfsdTluVDgfJA3wjxNVf/NyggjXSaCHqiZEEck3OojiTL7uBpXQMpo5lKFe
         Vk8kO9le9hgtgmNrAoeU/C898gYXg38Vlxc1yeeI9naM7MmtVytAh34C6JnhoYWfC0ok
         jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476754; x=1790081554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lSkFSVGa/dllH5JEoKe0+pLfgUwm43MOT22pfjYzUoU=;
        b=Y0sR5xSbovxd2SVZ21nu/eTNY+OyU6E0xVowEHD/OjVy1uvWWgJFf2cXWYToElZACq
         b32YZUms0V0pGdhufvtS6KJL4SZs42liRYUbI78fKC8zYYQKB3IjRDkdijARN4NSMTRG
         pkD6ALfGAcC51yJoZKZlnmGk5L7YFvpwydSSBH/B3yBiuQCHbE1O5DzjALy6LE7sQlx6
         9NNpEnwG/+F3zAnD45WHYmJUzx9VDXnpDrIgL0ALFLvysJckZ9wvtGn0jvKWq8sdNn7J
         nmd8Pv5GKonQCYieKZqoCvRqHbG12y4jD8jvAoAARM4mZEFJ+6j8lktPIAGuAASEIS9n
         PBcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXDNX+JV+1EutJERcU+iNm7V2d6jMbB5cHU/Yx4udahfeHicwYO3/U6diOXei2EAe2dXlcmGuUuhaU@vger.kernel.org
X-Gm-Message-State: AFuF++moiNcJGUrY/s0mNwr72dLSjI75nGs4yriEzLNC0vkahteoCJuB
	E9HkZzb3aE13aB+s5aRQREeagyfhJFnpI08OTIuJlNRr/plXQAYXFcdf
X-Gm-Gg: AYBFou1vCCEVFf7pkXGUTFf2oiUHAv73Qhj6SzC7teGz/VIM/GhbnaTPnqdo0xLq5vG
	QM3qvA4jhPLn3og1uzDa94AFMH9JPCk7y8JJbEYyL8wY1fuyTS0J8l+IJv1nABWLFg2jns3i5MN
	BAQydDmEG9PxoJDFKOvpesGEdocmzxvZ8tf/cajtQad0twiL9IMc1+eHkS65Fqd7b4MQJ4oKXGs
	NeUQnOuyn+v9gGA5o7Y/y3N/LfszIY9v90OwnPglxokvC3SwFIs4fgmgM2GSGwf2YHLwNN1So+e
	FdTeIAQujd4noY6OPXS+lPMAxCEb5gxweH8Ybj7EE2s1hek3zz0ND0B9EtPZhSUV7BhsunE8frb
	pE7kN6dx7HjCE5gboySAY5w4YvgWFpLPiff+Sz0m5rMYaIaZR7VUGb+QLVoRYlhDRqsPInIH97G
	LWjIgGIRB952KzuzHJS+RyQE48sIvnZ3I8PPYiGvXwNwDTvw/kcNpA61r559AEJM/LiSPPCBDF7
	TaZKIzgpKdOMhbWT6yowUiac8k835yJcfs0otafdyWjVecFC6VltbNuqrSt0czg
X-Received: by 2002:a17:907:724a:b0:c29:4cb4:8582 with SMTP id a640c23a62f3a-c29d79e7c35mr78298466b.47.1789476754036;
        Tue, 15 Sep 2026 05:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c296605b9a6sm587969266b.25.2026.09.15.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:52:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Tue, 15 Sep 2026 14:52:23 +0200
Message-ID: <20260915125226.20579-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915125226.20579-1-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

