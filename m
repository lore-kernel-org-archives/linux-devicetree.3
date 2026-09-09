Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A45678C1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963202; cv=none; b=B2yR36jh7DB8/SCtkkwzTo/4xVHMgzGgrUjXcnjf7nsyI8vV1QsBr1adodPmwKdi74kbf8p+g5MmSiYQSgXzObbHu6geK9O7oREtrqGP8TFe4kh2Jc2unWQsWIuu0zfd9lM9X2ycWbSVDApDEUyYzUAvjIftrOw7Spr0ZE+gRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963202; c=relaxed/simple;
	bh=vbznnE/bJ5DXSUgov+9xagPRDM1Ymwg/65pTuopRG+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkbNOLvvb025OMjpFC16uQKY3V+qTCrUFqqw9qpT6OmVPhTwPzUZlamX+I7tlZK2xT1RE2nIsh+l1zOt/J4mA5YHwmQNYnZrjq559/2haiLRK46iJDfBYgD4ctkiit8+YPYSU1kgrOubFAXU2L3ug1CjdZLxWQCf+BaRdarhzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7aUbvX2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7aUbvX2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso72832605e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963199; x=1789567999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=;
        b=A7aUbvX2HU63zc/DhjCnUUxgI7+sxGKtYaUwuOcZ63Mxa3w3uURwjgwgT8wbi9trU4
         ljgRxhW61QxiIuYpw9m+U1AoZv4ockA836sgP5PEFQPBvCea2ROGtfSsWmpaSaTOX27o
         igyXHnWx/wvNOC1voebzESfk7Zq2vZpZfpnr2aaTyO8PjCstT4Vd3umvijaJMs1YC81n
         K436jSS6Genfxi3Wp0EVMRZkT2SMyO2uDklShjJu0VWsKlMx7Q65qCnGZ76hw1JIc1ZD
         CkcwGM4/gacSk9R3KGslpu9O2/EoaLhaUHiVA9oi4muvNsdacxDygElWjAxOEkK15jbR
         EDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963199; x=1789567999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=;
        b=qCP6TkLlusZL3o6/ao1CaN4wK2PjIDCq/N360TOkZZTTa2Hc1eWC3aQNqyZvYkz1pL
         XPB3YqEvlIK9TpgzAkRwHIWsku4PjErGfqrzJnCW0+wF/FfXF4ZSFVbDY3INL7Qw8wXm
         1hH9WlkRJxuAxV/3Dih9KKRNiCyqy6yyUx2D4vyL/dmzD7UyD60wx/yMlmz4+PCx2qAp
         AVkQd/ZcnvohvclfqUCP2p4oYsXUYe4zLzx6dbf1tRfQko3udi6m92+stPEBUOIui6vt
         5K3S+n8OlQDk3kHwHUR4KWJaqOytMTLrIj5AxT0dR94F+fI4ihL1Ex1VXxXVa/w06520
         7syA==
X-Forwarded-Encrypted: i=1; AKwUvBwszpTLXqlzdilhEK9ckEeZudVstbx6dvt7d1XJZCFz79jO6EIQ+pVFYxHvj6wqw8de9JyigLrS/PzB@vger.kernel.org
X-Gm-Message-State: AFuF++kxZRAzBByw+Q1AJbw6/Xbwtl4UYvzW9mTw3foT6a69FZaoOzTS
	Y2WktZENdB0bg0/pAG1k9zPScJXa4VgNs/b1gIEx5ltpq97MVl3rsKo1
X-Gm-Gg: AYBFou3yaLZw4oP27i8LfeDlGw6+pi7/SKNpGEo2wuV3LaArxY+ZXvbFkr1wr1PT7Kd
	L9h6BV0jT+EubVcIrH7sevWK8FIsBwfbkJ7Q9e9vZcB1r+kQzu1MEiimU8keek8i4nEnWa+Tda9
	h4McmCG0yWnBg4SU6jGuetw+ddO4+R8KeKmwMK9UgHi7BioOdhwRAqP93+fBMEUDK7VRvfq7NjJ
	FOkb6sOP5I3TRL4+rI07K5majD537k5ykPAio8d3pTz17/Eml6n+PEZFY8Nvw9uMKfZ8hh+ipJs
	tlG45ZNE7K1aPiQRG/MqTQspSZommC8UlajRi1XbXHKzD6yQnofem+IoaNPtVYFyFwwP0KSR5jJ
	p7gaZGBJD4db1XNZUJJvmGrC9ks7rl1GmFjFnvH/+44eoh7OUzxRr+3LcoKCZ2+YKf0AR06ut83
	xSpktY7Hak9dSA3W90CHHVvXcd1CAqRiKKPyJphDjYfX0Q8mQkcHzqgU/km1ZLPWizmmV3wUAh0
	6azb9sY01DwAPh9HTrS7Xt+hPMQB0UC6Yl5OOS4JPuUew==
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49cfc6cc0f4mr320969475e9.25.1788963198564;
        Wed, 09 Sep 2026 07:13:18 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:18 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 1/3] dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
Date: Wed,  9 Sep 2026 16:12:58 +0200
Message-ID: <20260909141300.1368790-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141300.1368790-1-sander.speetjens@gmail.com>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the Raspberry Pi 5 RTC.
Located in a custom DA9091 PMIC and accesed trough the firmware mailbox.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
Assisted-by: Grok
---
 .../bindings/rtc/raspberrypi,rtc-rpi.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml

diff --git a/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml b/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
new file mode 100644
index 000000000000..e9bade7f8c91
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/raspberrypi,rtc-rpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware RTC
+
+maintainers:
+  - Jonathan Bell <jonathan@raspberrypi.com>
+
+description: |
+  Raspberry Pi RTC from the DA9091 accessed through the Raspberry Pi firmware
+  property interface.
+
+properties:
+  compatible:
+    const: raspberrypi,rpi-rtc
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Raspberry Pi firmware device.
+
+  trickle-charge-microvolt:
+    description:
+      RTC backup battery trickle-charge voltage. A value of 0 disables
+      trickle charging.
+    anyOf:
+      - const: 0
+      - minimum: 1300000
+        maximum: 4400000
+
+required:
+  - compatible
+  - firmware
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "raspberrypi,rpi-rtc";
+        firmware = <&firmware>;
+        status = "okay";
+        trickle-charge-microvolt = <0>;
+    };
-- 
2.55.0

