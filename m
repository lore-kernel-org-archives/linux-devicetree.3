Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912259;
	b=dbxrtl311BLvIUOUb3w3SRhmDR9HJxfn/jArZmCJlexSlLSuNmkUn1qA+jog2Mk0nLga
	 YP2hYIld/g5roLtE7m3zi0iRkOxKNrWFqxpU7qPo5j5zmxuk6l2SzPzAZKmSM6Ur5a0wd
	 EBAsNER2NEpfec4l/S0TgBCAVEaZe2C+LgQsUeyKFD0x7N9MouCS38hgMu6dlzG/Sos9R
	 VABGtd0YVWzO6/pKPnnyuItRcFRPgpNn0GDlpmVNUCqyEwMyFUmEtjdXcEwZEz2Ng2Yxb
	 i/PYk5D4v/QohsP8YDaYXsDLy8wEdslClUm4VvutcP08HHQQlzaqHwjIB/ReKN/ejKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
	b=v5CHrI3j6LklmPg4Lnid9wfIJrOuPDp6vFO6AtCEEt3srdg1fDhl4+MPND1mCieIVysy
	 i38dqWobU2TbPROR7kbBGzTVoONba6DAczMCZ4M6jPBtlhF8EHB0ME3PzJk5AlaB16q1Z
	 z4Bpye6ujO0WIZgXvanFCTU8xIdAIhMNzg/yX/k7dDVZPQ5Fb4YcSHq+UoKCUZrobGG5i
	 SYIDK4fXLzL9t4svhAwCpkKieEgpmN3n7HamiERn1+T491qiEZ1dnGdk/dmNzyocHoqOY
	 4KemPDhhnqY/ayjUzeQgeCYCBvBwuyM+fFeZYQaoUp6+eEQrd308UccyZxso9gezkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZMc88f;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2C606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHZMc88f
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so1820482f8f.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912257; x=1795517057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
        b=OHZMc88fL0Y3ZOM7HvBq6PnkbDMfe2WWSDzt9S6xySiq1ZMexL5Cki0nMDoLFTh7+/
         zkaoirwpf1n/fh/f+V8+B/g+QOInR5uI/ueS/emwC5xFWWbO+syNYp9A0CetBSXEdiWy
         qbwuLzPUTNZn9AOD+gUavFgKhlMm5YPJS2Yq7DKsGAuclBE8Y2ydtoZCmPsG+iuLpCUk
         fzs3fe4utARTlNuWFnXLZQ1+G0S4j4y37nsva/FwpRke5mvaD+Vjl4mk5Q5MWG+jQUXU
         rc6HtIN5fASzP2LGxFSdj7s4bir6sRq0E5AK+NulruDhYw77Za9sZ2d982Ibt+vCkdg5
         H/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912257; x=1795517057;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4P0NB3VMBLnpdAs1DFprR1jE/RwnP4MqbaYmn8aT4e4=;
        b=RzJI3mKIlxOqtqIwhfDd9xaO4pjiNEWwhyuo/WcBZfKU2ArZTDa7X/Xb6z1c+kJg5r
         P+NtXmSRbLRm7Cim5NRIZzhP3+i5e5bajdDRl8GXp6hQu0DMDFX1sTpXaYmuhIBelXVf
         1n4lI9InxDiPGiO8fn4GzRM0J7sQH3Kpv+slxYos7QX83eJ8BAuiXKy7ANNsknRkyMm2
         LLnEYIE5S7Pm8U81VE4VSPkwvqI9LIRUMqh6q3/GwktMslIoN6E3mOyk+3Op3NDAhtH3
         6uO/iHo8GI217+QtgPRYoSr9pAzydvctSVrdRuVVmTLGySENNcD7oZWBjPTPH9itjC1n
         kiNA==
X-Forwarded-Encrypted: i=1; AL+hErFa08iVqL0H0MPsNy5X0ZSQTsFi06QFBVXN5e+HQ4uEPy2ZEJVKWGI0yLBZTP6dc0a6ZIf1ZylODSVr@vger.kernel.org
X-Gm-Message-State: APuU4Z8H6cPMES4fICYp4fbFkk729WHwECl4iBLh0DkDUfW8eaWysP74
	e3PNqpyLlZTIBBP/4K66B6/AzJZs1bRhDJP0XUZcbxCEQYq5soZ3GaK8
X-Gm-Gg: AZFdTZd6ae5wD3zwC3KStHTRWkbb6bNEoGN1p1N2XEEXQZAMl2yjCOcqjXDPy6kIka7
	QSNnLS2UxNvpmhBAtXYt3Kqxv/7uoTUqxohnUOhLCXVP0HGnEaShudVe/lRrBMfLeS6Wy92ysqX
	0QW8PDn3+WAIIR+WeQFYGT42guOHpaSkMwIlJ1Nz4C8ZXD5zs8neIEd2Nr4g33UnvTIUMLFhLGj
	79zB6fSbDNfijqfs3+RMNB1Bf8Pz3jeEy0ycZ07Oe+p85buq+PawGdMwzym1DaO0j3Cuxr7gl7O
	YDakHBjwzbze7jSMi0n4haow2tPl95vO/6LKhpwEEXVkw2hfPcsM4BZbOHg39BW+6HshYbLof0A
	Zp5xD+G/QHr3k1lCnkwpapWxJHTqvKeAmnwUg2A5gTpiiCSod93fEaFZttOiE7CVZ0odS+YppvN
	L+yjJIju6Yji1xo0maKU3Dp7qyZsBVFpR95uFP1RQSKQD5EDPRayXEuQTfPt+EhyVWEb+FSzyZX
	gQ9DqOM/OiNzVCg7eGYfbJ3d4Xw+UBSJZPhsSQaWfQuQ/LbtdyhTauGvYbg+rrCM7dJRMAePftC
	gQ42izk4wcI=
X-Received: by 2002:a05:6000:310a:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-49c712ac8d6mr29895302f8f.17.1794912256903;
        Tue, 17 Nov 2026 02:44:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm6167711f8f.33.2026.11.17.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:44:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Tue, 17 Nov 2026 13:44:13 +0300
Message-ID: <20261117104414.1182364-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116074013.355363-1-tadilhusrev@gmail.com?part=1):
- Document int-gpios: the driver optionally reads it during the reset
  sequence; it was undocumented in v1.
- Reword the description to the chip's own characteristics instead of
  how the Linux IIO channel is exposed.
- Simplify vdd-supply to "vdd-supply: true" (left optional: the
  XCover5's own grip sensor has no vdd-supply node at all, an
  always-on LDO not modeled in DT, which the driver's
  devm_regulator_get_enable_optional() already tolerates).
- Rename the example node to "proximity@28", drop the unused gpio.h
  include, and add the blank line dt-check-style wants before the
  child node.

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic) and reviewed and
validated (dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../iio/proximity/imagis,isg5320a.yaml        | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..ccb84b29f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip proximity sensor, connected over I2C.
+  As fitted on the Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  int-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the same INT line as the "interrupts" property. When
+      present it is polled during the reset sequence to observe the INT level,
+      as the vendor driver does; otherwise the reset falls back to fixed delays.
+
+  vdd-supply: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        proximity@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
-- 
2.53.0

