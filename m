Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934CC486637
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962586; cv=none; b=nthgnnjHIl1tjzEOG1y04jN6SVthf4siT6z1nxYXWB4vVde1IbxeAuRA87iBO20AemA3adGGyCGiJEUi3w3YIyfzbQaS96WXIMa6FhxxPS/itcWsUbJlVVn5tY6LQ4etZQKELZsb+iqQ3Fu5HTDeMyh2uzrGMyBGHd8yLEBuAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962586; c=relaxed/simple;
	bh=fSNDOr0MMjJ6MUKZPg9+bicighZuXgJ9O1lxVLqM3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBVh2OTKn6azLPn6RZz+h4BQeQ017aR+bO03jqXeawHQFskycFlOJ6IjeL/nmynUf4YggkDZ2+PoecqU6TqYSIa3xmIVv+sWTj/lQAmJpJ+v9p3bF5FcYKbpjnfj5TIWq8KVTrujl6SXaa+BZb+ixFVfkpkP6nRkLpkzneKf8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8VDxiTS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8VDxiTS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so2824023f8f.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962582; x=1792567382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=R8VDxiTSHSboHzB0OIrpg98X8QmYJhiyRdepCcMJnxfGBnW9i6B6Awr0/ll7OTC899
         Unqx5HxMVn+Bmnd0MFffLi6AlMGiJ6nqrVJ3uRMLKJFJXo/uA55TAp49hBKEcj0mHJLg
         yjTeP6JYubFGwm/bvzU3sS+umsydAb5yaTWjDc0hRbDCGasZPKeR958V8+q4MNbvICIT
         o6LeVT2M0BF8GITLZ+hD7zuaXeEyeUWymnT4z6K4XtG2e5jiOjJagh2jExHYjxopLzaI
         5/wRNVnrII2GZQSYPs4ZHPGD912GbAZUHkVAiRgjp6YDcLiGManEUIPlRjIdrNh+uo+G
         wIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962582; x=1792567382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=CTeumR8ZJEVq4dYsll72ZqI0tyQFU0WTtf7LKtwMTA5EpWj2ojVZGQpnjF7oEjobV2
         JgNZFLxTDEYWf3+N8i/uzONcU0XBGb1O3ZmWTdWYk/69wKJBH5ZW4Eoj8ZwRbAkEDHGL
         7xRu+i43e3HN9FGZGNV5mRQgpVuUmoytlY5xYhA6fkp6pyodZ4irLWVl6qm1h61Y2+Kc
         leh0p/1L+SMsCfSNsTxZuVQ63Qy2T53DDDq3SdrkIOViSCM0sR9MO1zbqRn2KKGV48ff
         lMUIFHMNrAl3o44kveplx2Qi3PbZsZnpDMFbhEmXZq6K1lKICOHCFNqJo4Q5i5emWXTD
         CLVw==
X-Forwarded-Encrypted: i=1; AKwUvBzUM1DOKBAInzLnkbPSL0GxZ4Ggm6pXcrxFVabDrm3VIRktKObzy5o0rGxVPJgW0shdKXgsyPho6ZAL@vger.kernel.org
X-Gm-Message-State: AFq9FYL2FLl1njkrVWkHG7paFW7gUBRW/fV6QcJWWk6opomI9WQSYFfM
	VUQfxzRep/wRYj877Ad/+tBDRmQ8ywRaRDkGOBiIw0FwBZUiPtNvwMOf
X-Gm-Gg: AYBFou0er5SqCjyilHVFhFwJH44rw9lQFVl5n4XiBK/hdsev5HFAyJcptxiMFEkH7Ce
	mHmY9qP0Snk+Qp5YkgymlLpOtq/icKOpW7arlQ4i6QfAYn66wdQxfuFszxAAy5bJlOJyIO6Mnew
	sgWs3MkoT6eNJ6KUFtUAs74pQIgXMUWUtkVP3xWFSRG7MLTjiRJfn8A/ua7qZBfGNorMmvZWB0j
	+JAn4YBqv9Cuqd3QoE3uZNZB7kh2nytGoLESRnjbnTHfy0EXF+8X9CtdTULj2FJf2ABeNlhivte
	8K3+9GK6Qp15AulwHuo06oDRVWygPraCAYD8cPtuTG/vYwd3jMDMVqILMO7B1wkGmNuBeeI+0tf
	w6g6gCp0aVHt4nL7hHxSxdgF9uj70sKlpWsg5DoR/9e/WtvOrVrcJLY66yvfs8z/R4BcRoAB/uB
	wGhx2xdbkFb1PjNzkxKM+fT0KTIDuSQUatnfgeQCqXVQqkZBjQiAl6p7BsMHMs+4ZAe191AJMYr
	2D1zhrI22iLeGk/+mPGC7XnNAwWfku0CTrD6Ue4EgYo/1kTxmyNhcowBLGkqvcrmxm6+ujcW0wy
	N78MvUrkLai2js0RmCZnedv0Z8qcziVDo1Mwfmsy0/MpZQqqfCGeB8vLasDZEg==
X-Received: by 2002:a05:6000:2dc5:b0:48a:fb26:23a4 with SMTP id ffacd0b85a97d-48dd6517828mr15172799f8f.31.1791962582334;
        Wed, 14 Oct 2026 00:23:02 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Wed, 14 Oct 2026 08:20:50 +0100
Message-ID: <20261014072109.1759502-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding for the PCIe SerDes PHY found inside the
topcrm block of the ZTE ZX279128S SoC.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/phy/zte,zx279128s-pcie-phy.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
new file mode 100644
index 0000000000..7bfa363294
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/zte,zx279128s-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S PCIe PHY
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  PCIe PHY block inside the ZTE ZX279128S Top CRM.
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie-phy
+
+  reg:
+    description: Port index (0 or 1)
+    items:
+      - enum: [0, 1]
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@0 {
+        compatible = "zte,zx279128s-pcie-phy";
+        reg = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0

