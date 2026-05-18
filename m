Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562C3E95B8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114057; cv=none; b=N25aw9zGciFhWCnJSpQl7yw31v20hvRIW7IqFkuuYapgDbkzQiMLLvqcE+HIe5Lp4IQFtGQEaWQytAVMQXtLzKOrhp0GYcrs1YmCfhtsyGbiVXbaQWoY/8L1T6GGHXCw5AFWKwJSNWmjibgiyNe/WQ5ow9qRWtnsudQpJm3Hb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114057; c=relaxed/simple;
	bh=BXR1guabdFkXTU0pewTHfayRrjY42kQnfPQoGJ/jZok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2vf7KKc5/gAqx1CcZi2FCppedbpk09nRfi8DHozsy5kzUsS5hBmmsDqYbcxaBuNELnQqo5yLStxYBXskAG+eV+6qdBNaG+7VVWkLASIo1RmfWyGss/1YauxSYg9A+pTV1bGckXkyx0PiuhKfFW0ayMR4np+ph5czT1OHwBSsWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3aogkLy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3aogkLy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-453903ee4adso2029160f8f.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114053; x=1779718853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfacA4QRILcKp0x4kch3e/wxFubsy8hlXb/wYlJDVIk=;
        b=p3aogkLyMQ4P0gmtfgoBQIDJ3PsVHp2rEDUHiWatOrXWxa6VpX1XVC1bZpSYU0LuQ/
         jImXEm+cKQFI0libPFXaFwxw7K5FYs1ZyHp99BP8lVsrITiqKKMDVNOVNd1yIM+RfYOC
         6uxlEulajh/r6ZR8Tqy3AyADHOCj4FkBRDwXgVEEZIfMWvkRWQHFxzo+JZshgV/clFHN
         mknVZdQ532lbkFcqblVBGcRcrkYuPM6TK+rzhmXDaz1aE+D+/neIQgcNZBdhB7RLTevY
         xBGBqUEumIo85IPA+6GPoEqmFmCtPKkwPmxKZTUFPY2Abtoqk7Tf9RBh+/r8lUc7OP0I
         KU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114053; x=1779718853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfacA4QRILcKp0x4kch3e/wxFubsy8hlXb/wYlJDVIk=;
        b=azN6W1JEfm5EUJj4hZFmjXVZSAMaL6jwPL78aho1L8Ym/thL91QAu9cespLEpybwwL
         L+jTRslMH6IimV1STyXlo402MloYp4EljIzTAKMXkpAfNBXticvaGQ82W7PVjeOmURLk
         xspx/UnmwHVEk/betWt0l75KWZrWJrYX0GCWTsBJfpdBtIDMimPHkoVDuEd3+hOOz0PA
         mu3nLq9igxgiZgi0fyh/a+94w6NlIUx/Tbq8Meijl5yTc0qdNR7Z3eAxL+aKhCVVDjep
         G0o96v/ZMjY8muIiv0I+6crsYZ5nvZQa/uSQqUIIBPYLmZg2/K6YdcxbjYkruXbCS8QN
         dtrg==
X-Forwarded-Encrypted: i=1; AFNElJ/nCn/GJgvwyYiyCbt54s8vrbKpuDyct4+9G/ceUiMvBRXN9WKXmuM9J8tDmMQ2mJ1rati8mfUtC90G@vger.kernel.org
X-Gm-Message-State: AOJu0YzjD8sD5fwRHgQlO9oE+ZiJjliHPpR3wpctTpdLoFFXqC1sSyHo
	jaQiJKr1DhFfuWD1Arg5IdNOAqNKj0FouTj7EUKFyFk5vC8d7mbtuxov
X-Gm-Gg: Acq92OGBV4NE6hYo021cgmMJ8nHyOitQCyj3LUOyEHWovzfvCDEYicH87WY4DItSGZt
	/jDanBqNRlLfQzkYTVxmbNScde47iKFaSp4vAyrBzuxuSg8Ui5by8SZOwe3sAYWhQ00nqymLZPj
	TtB6Q12MRIIY3n8C3tv5lgjso3plpcbSuV0viYpn+4MKPK+oGB4awc9fwQkaHRkJz0L+VbWokYR
	R2zObaOYIx47iBwkUW0PsZnXBm58dEqX7tUsQohEUFrYhGfKmQqY8o8Rq4R7mqSbGx9kCaAnEXh
	NpIdk3NmiCcRnjeQgBg3575KP4Gr7yLdqB/JhclfZkruftz/4cKnJb3HSGxfg0BjQYPvtCi/zdb
	Q4mzDP/P6NnLVlwzj8q2K7o1pfYBlRltNts2RWi/1xTm33OYbErTuycJBRUHCaRBnEvBvWbW32a
	UGhXMfmG/7EdolPr7hgKDvdbKaJefiH8w2a6iO+08oZNyecjP28w2bz69sskpjkMciE+DQypfz0
	QVeUt0LKw==
X-Received: by 2002:a5d:584c:0:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-45e5c587396mr22645755f8f.21.1779114051690;
        Mon, 18 May 2026 07:20:51 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm34905626f8f.26.2026.05.18.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:20:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: nvmem: airoha: add SMC eFuses schema
Date: Mon, 18 May 2026 16:20:31 +0200
Message-ID: <20260518142042.8331-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518142042.8331-1-ansuelsmth@gmail.com>
References: <20260518142042.8331-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Airoha SMC eFuses schema to document new Airoha SoC AN7581/AN7583
way of accessing the 2 eFuse bank via the SMC command.

Each eFuse bank expose 64 eFuse cells of 32 bit used to give information
on HW Revision, PHY Calibration,  Device Model, Private Key and
all kind of other info specific to the SoC or the running system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/nvmem/airoha,smc-efuses.yaml     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
new file mode 100644
index 000000000000..e21ce07c4f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,smc-efuses.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SMC eFuses
+
+description: |
+  Airoha new SoC (AN7581/AN7583) expose banks of eFuse accessible
+  via specific SMC commands.
+
+  2 different bank of eFuse or 64 cells of 32 bit are exposed
+  read-only used to give information on HW Revision, PHY Calibration,
+  Device Model, Private Key...
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-efuses
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^efuse-bank@[0-1]$':
+    type: object
+
+    allOf:
+      - $ref: nvmem.yaml#
+
+    properties:
+      reg:
+        description: Identify the eFuse bank.
+        enum: [0, 1]
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an7581-efuses";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        efuse-bank@0 {
+           reg = <0>;
+        };
+    };
+
+...
-- 
2.53.0

