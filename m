Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2F501F4F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466211; cv=none; b=uQJH1WDz5NgODh/WoNJXNQyhM8mFDa9REYH2sXDymd3e6I+fWfFDYJHdHgwTYvxAUbrOBEh100dC8W5p+LWQrHRYFidWK0EDH+YIEnNFuHuCJvGk3scGJkE0i5o80Noa+fksoz8ppH4uEsJpZYMzx6ZcivxhKJFFWsWV04DYE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466211; c=relaxed/simple;
	bh=aY/rMmEKLqBf233eHDiUJ3zou1QJ7V8sN56XAz6YXB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=McG/z6wMblHFPVnM56k/4exOEWKEzuIa05bCR4IBUtR7o7p7w3hI+G1RcyoOcq7JeI22kLN1OKRyeP1eygVS46EELReGDlVI9VY9TBv0ZJIkAzYW4lTznEUrPgN9qdRXviCT5SsWt0hyZ9w+kA6eTk2pxR5TM7sr4CaEX9iby20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3KHNSxa; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3KHNSxa"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b21f09ea42so230893b6e.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466194; x=1789070994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rV5vJv57NRYvAfyYD49PPV4JWlfjLZkBj9GOzwHcEV8=;
        b=r3KHNSxavUcqBTpFFFCW1zUTZvQ+1WlkUa0aZSx0GuqyWMPHyIP+HbANPbh/mL3yD6
         5j/rkG3aHrPjHiWkpI/9Yp+9mvdfhL4cRFq4b25TWDUjuhYSVgnR7T8LVGPCZ9BWc/wb
         Hu7Lu9NWJLSE6dsN4vjmazQ3T+sUv7CqOkCpHLihzG9qYXXZS5ER+f2EpgWdME5YTSu1
         XzW9d0u91qFZk+mgQUQi5D6KyxrVJE+2f9C6475ohVPvslhMiPaYcz8hOroW0Aw4dxRL
         rVdnjcIYEsPkImD2PMPnJ9q6sJrGN/QjdNxrXJAB3PINpnaYIBHxsKCqTY9zRkvGEw4S
         86aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466194; x=1789070994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rV5vJv57NRYvAfyYD49PPV4JWlfjLZkBj9GOzwHcEV8=;
        b=QgiYUNHcp65iE8nHgAnfKeZ1rWaf2cok2k/EGBVuop+dI/GhJnMpSSMW4AYxCX29e7
         a4hUrhojnYGWIGnj/nFlL84rkZb2+keyrE5XxyFO3ihfCarepsASxGH5tU1lKTCddRZn
         WXJeDF1gnEqEQJBfqEZCnwCfj4Z9RcnAphTQoQM4/EEbltX6ZC/MEL9YJ14jKQnSYJtm
         1uAkB17PCKjP1wAlBWuRifqGoogqeaUok/DIgYU5x1mpQuRgZFNhpdUS6l+dA8VkqeJO
         G1756TrEhKctYGkcsSbYTyTjH5wTTU0ggMmOS9nF+ztIc3HmFV6s7tAiSLBjNyAO3/5v
         W0NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMLKV8Jmv+4HiREK6iHbH9mmVRzMAQdrDsDCpLTCax6BYULTlfX9xCh4CKGI3uopj7AqUb+86EGb+y@vger.kernel.org
X-Gm-Message-State: AFuF++kYppDwSWaA3t+BjMisdKpT8NtH+nevraVCtYgeRA+LvMG8xEoo
	FW5ITRLQ2sa8uoeOdXOA7nm6KUiaNmoNlDiG0ti1EPOERpTjricRSSpDM7WdJg==
X-Gm-Gg: AYBFou3RzsDbUD/1cHCwmZnJWqooXUxjVjADBybHEuYONfogH0FVIaUPPBZsNR29B7w
	8gox/Bw6Ml/LkhclBAKzurFQ5GSB0rB1jxt/80teEwaj+m8IkKwYWGoJq3b2ZY+Mql7geurssPJ
	HuFVh7FAyEZFRw/Kv6koMSyuM5Bru7I11cng4qRGgJrs0r+V6DJDVCyLM0EW6RrfoBVUFEejPQU
	C64K0PQiJCwf9NxBxdEW6KOKDMhtyESuKnKBc73WFZnXrJQe2PZ0Gj15DCNc8sz7ekDZSflx0DC
	O4V47z5dK9l11cIVOk2O2UIcwP9wAgzvbGun2xO3EJdemHKkkhsX474uDi9nh89EH4azZI4e47B
	tXCo9wKBECbx6pwcDkS8BFv1jSppGdxjsDL4/DkEfRNR+XP+JZvw7+0sAPPspImGpgB7qoDxo5c
	uaYXcicbBfqrJ1mRcK2jbKd3qzvV8atE82282eVtJhzkz/OBe31Mb2Ht5aGMU0Ly39Qm9wuAQT0
	QQW7oqEp7eFZqaizSdtiU5I7S7KLVOaeHrFehFx0d5zyjbbGFRqAtpzbA7sfD+mNrQmVu5rMBlS
	k5JFqJUBu50UX5G7Zf72w05KEG5hPNkcNvukw3m5vIaBsF1aK2MtATeAX4UFFPFRaNU0mUyFJZZ
	L4NGnYB1vrlWmXzPS/dRuEiC4B73kdw==
X-Received: by 2002:a05:6808:c165:b0:4ab:2c58:4514 with SMTP id 5614622812f47-4b95c5ba1f8mr1065523b6e.0.1788466193773;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 14:09:40 -0600
Subject: [PATCH v9 1/4] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-submit-ac200-mfd-v9-1-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
In-Reply-To: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..ca7a910b2c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,50 @@
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
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..419340093c9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29504,6 +29504,13 @@ F:	drivers/net/wwan/
 F:	include/linux/wwan.h
 F:	include/uapi/linux/wwan.h
 
+X-POWERS AC200 DRIVERS
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	James Hilliard <james.hilliard1@gmail.com>
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained

-- 
2.53.0

