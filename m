Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93742C51D
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 23:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489920; cv=none; b=gOy+7vTGk0BP95ECUC2GPivUen9pPewxSWfCs8Q/IpXb065MyibQ2Oj7mQXA6AGEaCiK3960dPydPqq+VrH/d/Cgy9+82IC4IyzwOpgg2+p40g7KugdwxGN6fYTTjVIgEptFrtvtEnp3ECvgR3ytlpiitinqYfzBefZyz2MnwAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489920; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfOVMJ9qHAsNwOhg0tovKnM+SIditJV+W4tf+jlGOno6TupnyORAye1CjkSNnmwEkOjT47Mllb05crnY+NJLLr2STbGDNbfHrMtKcXU1HHEdtfTtFHvOQjhPu5GDK56+ZtxoZuw6YJoJbtfVlrGi7gnaM++dDY8gMfH8Is638XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igUCVefx; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igUCVefx"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b051516aaaso123515eaf.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489917; x=1787094717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=igUCVefx1AzcSZblw9VKn38CCn5RxuRd+dqa0AWkWHzuN72JyTDlTJYDJICfwSylvo
         nO7MXUIGyBFShfRTOocXZoBiC8TuQU54anGoe3dqTHnhmPDq2rzojUb3AE4FZsAxk9td
         yMCo6siO4nxg95jvl6xaTyy01F+TYruhb0touUrAcBoAjo13nCZAdE6JLyp5+vXUpkLm
         YvK5ndVeJx8m7irErj3PYNq8afE/haYqWrtNfceTX+Ta5rbR1STGR3vqrERB9uGdDqJI
         8dONwTJqYpCoo9YCJIOIZKT1g56ELY+nc4Oq6otIXyfHwOsKvZL/XCnnwwDX/UR/eOMO
         ccqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489917; x=1787094717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=ksNce0RmePyrGG1THZNJGzdoNYyqKnESRXwcNnp8X/ni0o3lYzZZbuIb6ucm2/SoCt
         GNnbI5lRMhbQ+Hyti8luj3Ir4YxJ960ltXiBYmULvZ2Mhd5WTA2Z7Ss5ttWwaoy10RAy
         5rB6NDDKFouQJyIb669BwGXW4FIbeuWkdyzpMNAXCrc+lcIZuTnS8hx90ODlUTOFYqYf
         d2zEa4i0+igHNmX0qxJbSZFUVSwZB+FNuBZ+qqVa4Q3omZ0FHvEBFcZ3VW7ZuQMV+pb3
         Migg3PC3OVpETon7uBB43ih6R69LxYl04r/THZbWiy3jSsPiCRxQNgtkQIyrR+mHiJ6l
         94wA==
X-Forwarded-Encrypted: i=1; AHgh+RrX/NcekKMMcbsKIPLiQAwTpcXPkbBQVKuA+URDINIvzh9XxST45gcgn05aJH/pXyCeo9uFps7ka4eP@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6/SJQc081t9ntZyKmxTi/n0ngjlHWX3lZal8gcGl3zhhm6BY
	DPjesGtIiv9o3zl2/LFeAoQtznDzYwfvSbpsY8fpZJPDsiXfY+d+jJ1z
X-Gm-Gg: AR+sD12rjWt/yA7Gut6btNe3wUEgV4Ds9Yksqb/P/fT7+VTVTXEaVAgg0lNKps3axKJ
	gsW9MJrumTN+AqmhgekcAuGa2tK9Gkc/UVb5I5eLkSmBPQJyZVmcYFqh510/k6WHQhV5sDf2DCE
	iLhu5CGdZTHtwVo/1NeMLoZRkzbcUaEkB2e+rVafYcsV37QkP0yrDSxIml9NfbezKE5G0G1VfBE
	a1G0CtPSHNmhm5JLKY5QxyrHaa/uB0L024QuI56k6Qtf05Gq9O8AOjunO/aAQCuL/JVBkEu6Fki
	Dttua6OX7YGUVe99Ydm5jRdjLxycY9XxRN+x1PImfcdFPhOC7WpzB9+vmqBG1m8Su5UWTOI5oEc
	X/+1l7Hm1emvpylZzUAz47mE5Z/VMI0Sp+rkZGEQoW/yh1FxeSfS7TeeeHZnnEOVx9Bju3fWpMT
	fHcHcAA2LnYirwPmfBDhjKgH70TogEoIokUQIxmolAhe8K6pysIQnr/pgFPKl1ZHTyiWLPk55w1
	8bHZ0Nm44DpiUu8o6JCneVZMoZQIUfJchABu9G4Vj/gzN/68j6hORv8deDSawKY8s5leqTMIlUx
	XBfFmgpuL07CEAziMmVL62RCLHfnAxgCxXIZtLHEr38HP3Il5RDK2EnlsS+AYEc4vUKU9LLTu12
	IlLAJzTDN4qdo3/Ooje69/M3hXas=
X-Received: by 2002:a05:6820:4b91:b0:6ac:c1b4:1a21 with SMTP id 006d021491bc7-6b0b24c8b4bmr559916eaf.6.1786489917411;
        Tue, 11 Aug 2026 16:11:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e3510fa5fsm713176fac.1.2026.08.11.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:11:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:11:30 -0600
Subject: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

