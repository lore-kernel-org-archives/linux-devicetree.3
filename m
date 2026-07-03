Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF5E25487C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044670; cv=none; b=Ubyk+neTSvkDFruahayJF7Nje7aEcSM/3ZAeHqmUhjzlxp8tjMA9bZXSSIQoQTXiVUS+iTxlqz/I8AjVXaqZpUXkIbAX5NQ0kS9ME1VuPpjI0WmFX4k5JoL/d8SoUxH5qD3yZqYvx8YIkFfm55t4LzEnFqm9ZI5JPfsY6jc3tIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044670; c=relaxed/simple;
	bh=aS6ha+d4/ARpImKQaz8GQTHAOozMF5z/u2rWDl6rRGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7eHRRp5gTv+0pIt9200VF4jrwl8BuC27JvfivgB1ILvI9Ii6Zr+vkEaizZgLN79tpzownw7+PDtQxDcYrcIIIYYbOXGcyljVtKLrmAZRhPVanJY05TBpAzV/hvXZeeHNyd0TEaVIBUuin9LH6rt1Q0CHZZDw6MnzA4MPnmoDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUyWnSmw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUyWnSmw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso46229a91.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044660; x=1783649460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLtOt0nYZtjUYJXDOkZT3LzWT/GyJY005mggTmWgITg=;
        b=aUyWnSmw0qDxV6iSXKHztRrmoowG+XP861c0WYExFnYdveaIUZt4HM35cjlWujPCaZ
         V2MAm6wdCifwQ/M8M7decRTPBsZ5K+9d2cKdsl71j9N129vapA+PxvYc+leznFoB2PFY
         kZuYvlrT6F3Ne9TePFiYw4dGdALY2qdKOOD370403r/cKxkXmVYQzHEMneANyd7xYBX7
         8x6RMUcWBkMKaK5GjMrKYlUJiOJ5QLhRFHk/DeKIL6LkID3eQEPBg0cgv/tmx0ZbqOmy
         dmUH6twycPifbQQLBlGAu4RdmaXfn/jyEOiA6xMKvJJBZ7NaPM6H6bUEiMNqNHVgj8ZA
         YxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044660; x=1783649460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLtOt0nYZtjUYJXDOkZT3LzWT/GyJY005mggTmWgITg=;
        b=W0cyTMbCV2fIFm1Cj8KGG2xSabhHABghGslP4/6EV+wCo3+iWd5kDz0ziwZG5vi3hd
         6G5wFkwY62TmG3MZg6D8yFqSx9USYOCEnMSZHyDx/IjUPGHwXKxkk+lXlhFqI2f7Tt+/
         qDu4gOjsbidRP79yrmGErJn35r2lvYgmgHU9EjOp/XKSXuK0t1N9ab7YWO3JrbWzHkG1
         R0gA+tK78jxnWinY29XZiLpKJs7Zj3a1NK/ZEBDrisYeWrmE70gKSRe2zv274nWQkvKf
         nHWlgq8WAxoORpaUqV9d9o3sShBBmA7tEkQn84COVrCK76soVnkIqLKmtnUhtsx6TZsV
         iW+w==
X-Forwarded-Encrypted: i=1; AHgh+RoQo7WgyGK7LVOTvSkHT6V7tBEhAk/xga3KoGFHGiRprD58arGtatI7AT1WZEE2HH8rU+Oqho3F07bB@vger.kernel.org
X-Gm-Message-State: AOJu0YwNyakUH68ZEi53bXxzNBEgY9+YezKRpoahhNUf1frPgQ4TyF5n
	eIyiX9MRwbyba1WRtHxLvBHxH1OgMjTSFAvIYZBh/Jmcikeh/YZWXJTb
X-Gm-Gg: AfdE7cld07CQfptRjCktYtLRD8OBj81yC4U5P4K3IPUpDqyv7an33hNFU/cqSVU3OY7
	TqphbAQO6l9WjBmhMuTD12dHui6/yDoYoWq7KUhAIsoA/t9vp4VXeQEiF0pjmqO7O5KoxbtPHEe
	yV7O8bTaSY7DKDgEg7D+zzOwmdIuqPUpDtqvL9+qG2n/P8sfUUa9i6GAnlnsBWD8eXWPI63vida
	R2G0lL23+uZ1dDjzfX1ehBU3GdRVxlGOVNBFkcuOeUxDznPiarIOXt0qENMLn1Z2b/7QXa/+vVe
	3wyaPJrz2bDkulVywAQk91NnZvXJfjhAIbFGo1KdIYg7cBcFJAvq8gLq6eUahM51dcH3bF1yYbq
	xCPaH0vJ2HPT8/nzDf2FZRq2HyZ0QQjd1XIkh1F1cqIco7X+VL1s3Z2aAHco6hThNOfk5zZ4dPt
	IuBCYocfwLBYo=
X-Received: by 2002:a17:90b:4d88:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-380aa0952c0mr8804402a91.5.1783044659714;
        Thu, 02 Jul 2026 19:10:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38128174885sm194920a91.16.2026.07.02.19.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:10:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
Date: Fri,  3 Jul 2026 10:10:22 +0800
Message-ID: <20260703021024.495433-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703021024.495433-1-inochiama@gmail.com>
References: <20260703021024.495433-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB3/PCIe comb PHY on the K3 is a complex PHY group that
can provide multiple phy for both PCIe and USB controller.
Its mux configuration is controlled by the APMU syscon device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/spacemit,k3-combo-phy.yaml   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
new file mode 100644
index 000000000000..ed820cf697b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 PCIE/USB3 Comb PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k3-combo-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 2
+    description:
+      The first one is phy id, the second one is phy type. This
+      only supports types are PCIe and USB .
+
+  spacemit,apb-spare:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to APB SPARE system controller interface, used for
+      PHY calibration.
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of APMU syscon
+          - description: configuration of the PHY lanes
+    description: |
+      Phandle to control PHY mux configuration. The configuration
+      is described as follows:
+      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
+      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
+      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
+      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
+      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
+
+      The bit[3:0] is only valid when bit 4 is 1.
+
+      This mux control does not affect the PHY for PCIe E, it is always
+      in PCIe mode.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - spacemit,apb-spare
+  - spacemit,apmu
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@81d00000 {
+      compatible = "spacemit,k3-combo-phy";
+      reg = <0x81d00000 0x600000>;
+      #phy-cells = <2>;
+      spacemit,apb-spare = <&apb_spare>;
+      spacemit,apmu = <&apmu 0x00>;
+    };
-- 
2.55.0

