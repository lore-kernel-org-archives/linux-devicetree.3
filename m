Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA239E18F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377337; cv=none; b=WRZAZcJPv4FnjbdVE6uvJV+fQdn7qaDaPMasPKN5JM3egpKJT9S8QD01jynCpbFAmecsR9r3pWOQ4rKwGD19CumlipzNZIs35mB4ns7nziv/vdVYjXSKbipvfRBrCZD9YGYkPoASUH5G7qPm3YI1cINoCFL6plfC+woYOg6YPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377337; c=relaxed/simple;
	bh=FM5tgF1f4gTluCeeCOhkUzBtb1GjjHUL6PkplRSqmH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuO7aTL90CMmMNzHsEKkODKOFro8qTd9OqroGrnvFHLo10lTUHCwSpq7dULHuPWDIOcbkjYfEqP31mXXbYPCU/r3dho1vz+oBLu4/2IvEbNVlS9HJ+GPxqOHTC9ER0zIdiSN053vXa7YCI70GGTjoxe8NrOy+E+rD+7//86Gdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmto7AL8; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmto7AL8"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43bf9548df4so1250029fac.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377319; x=1788982119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=Zmto7AL8e1cB2KwsRv30shLq8Ys8TZolrWtsdzIm3rd5vHqdDEbQ4/pfGSBF+gYw5J
         rbd9q/V36mzfbrfRpfJ46KlStQ3UFsy2wyH8uFejKbS4a8+KZf5kF8j+est4kThMnzM3
         ODlC1uFWdTzLhJPiEW9MDSwQxEtOOzkjF5XA5l5zGRIRd67Dgv+GWJlWKIcbZpHrDBIe
         QxlMdO+4R53z/kHBIdO6IEcA50VSUTzlrT6Ip3poh3Pl3jTABVWe4p8Z8SEaIXgB5nZ5
         r/HABa8SfCdc/qFmVpDkWlVfGeKxkas+ooBKeSqcEO3wDDxamEPAsG1mpw8n7b6IH2MT
         4C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377319; x=1788982119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=sGF5Pa1JhvbKYYxKGepNRiBuy8Q9ovJgE+BwpHCQo3P9N13sZ12k5qLbsLoG9lnrpi
         7JmMuHRIFxToSyqErPVgpQdyexCtDrIoEalqNPieKUgqgxP+bEqmhuLE7LQjfJjTbdaU
         5C4596wy5BH1nX6cSK4cgNSUzvKRwy5Mda+QxW+oac6IXQx7bJOEWEckkBACGQ/KOvxs
         mIuGpDnysqibKH6tSZkz3USvZHJL4jWiYL5j67Vw/PuEk0Y+Nv1T7QIo9rCWVxze1+Mt
         kyT5VgUV9UPuR5i5AtC3W9okALsH09S2oE3ODhvQXuh2qVpqWQJS8kxx2Lv3pjfEEl2R
         F+lQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT8uIKObuxqHle8zKOBIM0qBLEpFaxhU6yrm2gEseOuu6v0UsaU7vLdfdDyQgU4CFm9uUH6fkbAsJQ@vger.kernel.org
X-Gm-Message-State: AFuF++k4HLvjVJS8YYtqoxmKrcdA0TOiZ27X63kAaLyubAqOXBOzbaD7
	V29KI37EZfq4k5kOf9YpfV+HW6vd5rpGhCcnwHzyZb6MObUfPFdtmcWP
X-Gm-Gg: AYBFou32NoTOKm4LI4E11cWeSGjOCjlJWb+sQ2XAayq1K3ornjrHuKjYQCi+98g32jQ
	QC09XeAqfGkVvUzaMagP+dZg5S0ZZlYVfr1yAsD4NaEVFGb49xj9j3aCHqLUwZLPYHj13EAAnq9
	8TSvTsRyLEvGbqT3v47xmDqLcscjy6anKJ6jIaAiyMkQ9N66kUOLlThiuocAuzmduQlPCWEMwE3
	A6H1vCh0ZBVQgVcogoV4NWYgfLWeMo78Q4fbhDCDerjdGKuGIP/ggZcJKO/oEd75CKkl4isyZRM
	hIQTu8WJ6nJ6e+SZb1iXK7PUvfl/R5gRDzDahcaox/fHqxwcZ/fCXRmXTwXRkVUgEAPmYCSuUy/
	njy3Z7reC+mpnrGp3kZUhhZEO7tDPwaf7JTL6tZXmZ8Zg98QxYmlOdQ3BSi78ZBNw3TsWTX/KXe
	gmSjh0ph25FrGT2oUCoyiU9lrbRqCVfDLgue46As5qBtCc34ELe5tCwvLNzHV8pCatoUYgSFz3S
	NWCvOuIUbBh7YYe6Szl/+d7QfranTserzedTYDKgHT9krKUyydRgflb+HBfN9ANiWo5RxzMEJIP
	5go4V9yDtWc5XOEWWGHSYF4lNloKfd6YhVVM0qiMjlV3fBG1hR5onshhBIr3//gAKT6+4/KeR5t
	saK0EKUGGkZ2J+uhdTho=
X-Received: by 2002:a05:6870:1426:b0:46a:dfdc:c77a with SMTP id 586e51a60fabf-46f86ce6964mr6864969fac.10.1788377318780;
        Wed, 02 Sep 2026 12:28:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 02 Sep 2026 13:28:24 -0600
Subject: [PATCH v8 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
In-Reply-To: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
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

