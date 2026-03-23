Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE973AC0DB
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273120; cv=none; b=iL6OwyH5/B/wWMNnyiGA8U0YQj+T5po0pgSDFMf3BJBptoE10D452yvpVSL+qRaUKdEs6keV5d92hGnvgjPg+Wfy7zViztn2fMpMkhpWWvMWrKgODj2g1nRwL+Oacfsi5FrwrYmoF+jcnM6BCLFOX7p8WkbkA9Z/qezCYjiKgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273120; c=relaxed/simple;
	bh=twEAMEZQuHixVTy0TIBpDgrHMP/lw6YTgCVvQ+QbrXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYL60YyVDS8nNHT9yNZ+yWl6BTg5ca2/C5J3IsNIj+SzqFcfqt5FZd2U9CRzSi/9cKtmEElP3xnyRDmvIfnpum7c2+QdM6IGSnhbilKxwvOuHibNZ6D36MLxxGu2WUevOUkkvvXUQCJNF+Zin1KpkjnbhCiVarS+a9spxiB+6Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGjr4zeK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGjr4zeK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829ac4670c4so3184614b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273119; x=1774877919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=FGjr4zeK7BNjMDd5ZFqt71eDMbzzpClQez1pipLEroPt4dobGp4cYsrrtQrE/hz6kz
         79edx6eWGOLqer63D670wxpXmUuvGikZ7RsAywa1qWawgKqJ5EiTEIAZpN1KogO9Sb8y
         VH6VNLotAlIqP20hj4gBXxdejnnVEthMa9Pj2rGejD4ghf8DTr6qAq6FpjUHDrdOIqGM
         NcUo+igufjIXd3KBzWPCo77cNpBPnRQa1fHc6CI0T95zOdg9FQaKcd6c3jTK7RHJD3l2
         yXrXrxv5FQrI04HhRa6P4/zb3rLvItUHXVH5H6wR6zVhFePCrUrnI1CF59mhhVVFAOCi
         wSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273119; x=1774877919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=mAOViE9F4dlRk6gAZdiW39Apxex+j6v95RdltjpYRueZh+YRchZOQtTx6kfHbEBSXW
         dmG4B/VJ3LPpo7QqoU7ZzlWbxECBsKxbZMrOL+MWJo9bGcF+t5Qfp2ISri24vRYJz+0S
         aDGe6JXT0hKySyVu0wSe0JO429qNc5j0LKFQrauSTM+xD1Wx1UND1SJ03u/zAR3Nzsr4
         0lNQJBWmdRQw3F8G66QZX7kDZ+yMlOzRwemyPjfAc+dklFWdDp4GWx7ifLaUfXmkKGWc
         Y7hi2YrD6ttrus6Symi04iLmnMEx1WHswgfdvkRBjlu1AOKUk9r+49f6xr8VihiufCwT
         23Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVu0P5bJSfrok5G8cS0e953GdM2FBjowbHvGMy6P+B6rDFmTqyiaBW9tlhfynz446CGFwQUr8aaDJCB@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlbllT/Evb5XSvsiIXx3H+VZ3Uiu6oZfeQp/5mVbJ4Syy87OS
	TB9OBKpldAZI1F+By07KTra17iODDkw6+NKo5TVa8lwwcC1iE+IXK/0U
X-Gm-Gg: ATEYQzxlSx90ybSVe+425FrRHAdRwfotFZZ8z+Ii4bblJQsSyflNdm2iL/yJzc3mskv
	i0DfZsQ6dOO81egKCeQp7pbz3/gEedQA+3aZp8zGKABQkIHS2zLtY5jLa1ERU7LNOBxT9C/nnp7
	BsZsbgLUJorZsgAcZzPLHn+bzdBtMpT/IM0gxSpyIqMTv09zezYLZVGPNfilMP6QD6yA7crUjE/
	nEe6/XS3TWSLADORteHUESC39y0tNKChKM9s9pmZ2+fFbvGo4hyiocEik0ndB6ZC6J3qzUvo5E8
	ZWIHRfiZvldoPvD5Fgb63BAgcfHmXfAYbQ1vmyA7q43B9eD4M8/PBqTzqLHuTPTsD4RCOklYLqO
	FhTauawgBk+YhMrRfuf2+8p5lVMs9g/X9a5trd8K4WK6J1lZrVtwrwfMoMhiwFhOoNLKuxacxPm
	QEglbLRwlG8jPEpkRis/GzktxhxLZnuSvOKTyKimQ16T3AcQ1kdlUXqUWeryXvSLCBBw/BnZzIp
	go=
X-Received: by 2002:a05:6a00:13a6:b0:827:3b1b:43e8 with SMTP id d2e1a72fcca58-82a8c22d99bmr11433015b3a.15.1774273118883;
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:08 +0530
Message-ID: <20260323133814.14152-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr Thermal Sensor bindings to DT schema.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

diff --git a/Documentation/devicetree/bindings/thermal/spear-thermal.txt b/Documentation/devicetree/bindings/thermal/spear-thermal.txt
deleted file mode 100644
index 93e3b67c102d..000000000000
--- a/Documentation/devicetree/bindings/thermal/spear-thermal.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* SPEAr Thermal
-
-Required properties:
-- compatible : "st,thermal-spear1340"
-- reg : Address range of the thermal registers
-- st,thermal-flags: flags used to enable thermal sensor
-
-Example:
-
-	thermal@fc000000 {
-		compatible = "st,thermal-spear1340";
-		reg = <0xfc000000 0x1000>;
-		st,thermal-flags = <0x7000>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
new file mode 100644
index 000000000000..125632163911
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr Thermal Sensor
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+properties:
+  compatible:
+    const: st,thermal-spear1340
+
+  reg:
+    maxItems: 1
+
+  st,thermal-flags:
+    description: flags used to enable thermal sensor
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - st,thermal-flags
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    thermal@fc000000 {
+      compatible = "st,thermal-spear1340";
+      reg = <0xfc000000 0x1000>;
+      st,thermal-flags = <0x7000>;
+    };
-- 
2.52.0

