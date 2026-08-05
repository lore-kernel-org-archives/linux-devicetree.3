Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8303C1406
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 02:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896915; cv=none; b=ghYFFYVwTv3sL9RyFQhQuAdfdwXQ/9YlNwiBAMwvaTpGHd9oZIilkTh+cEYxt5Pk7tc5EvwvxRuXSbZExmqw2ikBLjAfczp/sa6Rh35TdZK+4dsStXm5mSWc4B2U7qZIzZ/dEHgRl9ILJxd5/dB2bao82yfUD74V98G+9jWHxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896915; c=relaxed/simple;
	bh=R6g0JPwxdv7PypX7v84NybJBf7f2xtEhtnKMo6TTQpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1O0THBhlpxWLfmc0E9/l716VzKgNXNIIoKmvnCdhfIyVcZpa/MIwveyhPjJiCMU0DpfJsN31T7pIEnKNL/1fuX9I9XpHLkKiL2Mi3+yvO4ZSB6qwXpjkySOdP2PXU0MSj7qWQh1ll6IqLTrlffwUy/HCWs+aDgqPg22ppPa3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBMXR98L; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBMXR98L"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso384295a34.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896912; x=1786501712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=YBMXR98LJnxaDJ0cNfRUenkcy20wL3aYAYr7qryZs4aunEOFRG8muL9xKlEG0UHy0h
         OALhl6/acwJRtMqJCQhIbn6fDBQ63rGzl181pfbOhDLgofI+cC29CCoJPof1xZ0UvDcj
         Am7SMejkqGBaT0toG1a6mmCJzNTbjlNL8kIQqkACgBBoM35Vm9zw2sPvVMkYzbjlCE7r
         LvwJ1/+C/rH9ZdC/DHHtjsy0vdaRmEXq+dITZ6ajHE6GCnWqaa4Tlw4LCNLZTTZfiNuU
         SLYct2Z2jd6uNNXr+RdGX7Tj4z4/AiA+qy1hjo1oLpJkt12BVZz7g+kX1OKi+crFe+qH
         dT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896912; x=1786501712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azC4yJVvIjculgK3P7AokYSHVCXvbgOhfjCyepYSyOo=;
        b=bFw67k66KeYApmscJU44NtobZacsibOzi3d5D249DTKCLuxXWiPw7IY0m7eF1u81vs
         ftDh78RrfkjIfErRmXmksHOlLsZlwyTZy0mfNtIea8kqY34NAvPLr65CVtu+2ZOCWkGE
         XHKwbVUc1w63hDIualV5RANHTx9u6MpAHnOTVUgkJx61D9sQYDORT14VTCqN/jEPLfvm
         g90875Wkt2vPqY/Kv/wltx+LHlf1k/99w5BgohbFQgubDFBB2zps1LAJ9FzxDRoVf+cW
         R9gbvwfwxbt1SYuNdRlYNnlvIK+Bwz93zKE+UfK233S09r6s/ptLxu+R1gCDDNC9xXu1
         ssEg==
X-Forwarded-Encrypted: i=1; AHgh+RpX2EjM9lSadAVyWT/DwZ8g9SkXU8ctw+34qvUoLUxt0Q6MWS/SajoYgNpqPKp0GlPsw5S37iYBjOiS@vger.kernel.org
X-Gm-Message-State: AOJu0YxidJloGmvCADTWVG1wT+J5yAAsy8PShOBlG2bmtniFIhqrJEO5
	0JfYJs8NNlDdUrK0o3dAHxoymQ70ZvGpjRFbiAmNmL7IIJLnZDXyBjwq
X-Gm-Gg: AR+sD12iodtQpat9A1zQtPg2DSdL1f9wepOPq84lN5UHmWvosblPHt4vTevmtPmpIn4
	MlwhRIlJ8a+uyFPSjMJA0D0jRTTBwolfVYoO8UxxXrrFnXLOdxndFj/Zl6YSATHt56FA2tnPRp7
	6NQ0v7dpS/SUNhgz/UouRrfBo5fPQs21uSi3lUE7VSlip26zy4yqpjeGVbr4nmmY2o1A/pgptts
	u1sSUDkJoPS88krGRl/juOZxRTiXHGnR7zZ7PO87BtswnabIwKV+xBdmOd+6l+vJxT4F12v36bz
	imQq6OOowPdik5G+9RjRyxKUktLTIuvipVm23IpbUnsDJloyPiTx0/+xPkO0bTlbqDH9yrFq7n/
	nEQvs2mwVbzAeXAyJEKnjSsbw1Ic5xzcAGFHEaL0rrAbb5LKiGFbbUxp6/zcyFqWzZJiAtUvj3F
	2U6Kqu0YYxvHnSXwhYLVPopoRCwYLO8bWrTMwcURqdJk5edybGEP3KWL+Clp7qhRWU0omx3iVpa
	wRADQTxYyjSSvGahrDnKBLJihDL48TWFySCn6eqskxLSL2j6Y393NvOCQ8klOVY/AqZH2IbvTi/
	MKpHQg7B32qYfWtpk2JUpgptSk4omoweCvorjxJpryo5ekfIQobYSw57QP+xTDhWyqTDwrMlBl8
	C92sDaPeBh1nfbykr
X-Received: by 2002:a05:6830:2116:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7f1e5d0f2e8mr2637298a34.5.1785896909187;
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:26:59 -0600
Subject: [PATCH net-next v2 1/8] dt-bindings: net: x-powers: add AC200 EPHY
 control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-1-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 contains a Fast Ethernet PHY whose power, calibration and
interface-selection registers are accessed through the parent AC200 I2C
regmap.

Describe this control function and its optional SoC SID calibration
cell. The vendor sequence adds three to the calibration value modulo 16
before writing BPS_EFFUSE. If the cell is omitted, the driver reads the
AC200's internal copy of the calibration eFuse.

This node represents the package control logic, not the Clause 22 PHY.
The latter remains a separate ethernet-phy node on the MDIO bus, which
supplies its address and the MAC-selected interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..5bb60542030f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac200-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 Ethernet PHY control
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 Ethernet PHY control function configures and powers the Fast
+  Ethernet PHY in the AC200. Its registers are accessed through the parent
+  AC200 I2C regmap.
+
+properties:
+  compatible:
+    const: x-powers,ac200-ephy-ctl
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the Ethernet PHY calibration value
+      written to the AC200 BPS_EFFUSE field after adding 3 modulo 16, as
+      prescribed by the vendor initialization sequence. If omitted, the
+      driver reads the AC200's internal copy of the calibration eFuse.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+additionalProperties: false
+...

-- 
2.53.0

