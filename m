Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330677;
	b=ZyqXEUFGLpu90bUjwfNDZjadAj9hgLDGybL7RZw6ZWnlAviNR/nJ0ArUUx2+9AVvrt9F
	 40IXmheRg3GQtGX5WNCp32HAs5QmWVWgsRyGkB/aUpFm1KFy3D0nErKia/HyeSyulPZY3
	 r2ST0i4TFcNaZleIf++N0K1CTncYR+HkUSfn3CHUm3Ot1XKAQjNeOQHLwXUxPy8YjxSxG
	 XyLMRv2m8KL30NkYMxfRu7izGZ7MNI2E76LttaOGBt8Bo2w2P0kz5EO7TlycIFoed98IB
	 NGQvp4UtH4ALvOVVT2h7SgDfxqmDss5V91gOhYrz+yYohZaFEpjpuGQWa4tFWU5/kGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
	b=yjKUZr91a3fDPTVQU3zIJhaCaiUjSAfIHSc9DI/iqSfEvg8VAT2gIU5hSxTddNKQ5fxn
	 egAs7Bz0vvOThklLS+7f27W8OR7yp6uqEKGMI8iqtKr4E1aTaxZG90rFeQewODqzhzqAq
	 quxb6Xjp+yZ44ZXKOj/VZnB/5k4irDWDj/az3CXSIcoSeFf2h1lh6nr9HnBOk5v9ykx4a
	 42hpZ4Luugg62aPyhPit9zqcb++HSi4y+lpDJQ2W9+xI/Jz5f0yypMOSZT+ozDGaXAdFe
	 JJY8hco1gYwVuMkO6wXycPE8k5MZbOrBDBS+El1vyJSn7joYSFTbjBQkcchjF5484lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dey65QKu;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF70606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dey65QKu
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eff92780daso17184795ad.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330676; x=1795935476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=Dey65QKuy1kNbc1nxtFjPImZEDLywOi7eDGPTZGQnoWTb8RdOm0thZ/x8vFm06CiAg
         QCNQE/eW2fdgDzs6TtZUk2xjpEHcWpDraKU9/V9CUgVs8fI45CeFFbBkqo4qfhpEhB9a
         1OZ0/QCfQ6D6SExkJQ3btg0bYDVBpTSOvYvAv6MMFjYM6Q1V1V+RuIUJseVa0ib3yA/j
         Dk+q8wD+2y2P5P6jQ24SUIGIBCG55L4DC92HrWeXIxTZ5On2RlhIPjwBnKCy7nGx0XOk
         BS6BU9JBhsaovZl3V9AsxilSw+sRKk/fdvbRt1sOZtMvnhHobGGYK6aByPSgtDWGergS
         dhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330676; x=1795935476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G76uwmlV29WfUfEk6u6C04FgzxDoxsMbvwdZwFS9cwM=;
        b=LKNgOAJT9nDRH+4AJWUnaAkHjjJTBwDPUbCsTlffZ/LxM78pHkTXP1IJy8KlQgRC0Q
         27xJAz7Yv3VAYK+O4xLhO/bU8XdEkJlrAbSMAayLc3hljLXBM9Mct0710xo8JntSddT6
         6JHZtcniXE224vKhP56DKtM8SXfIik88ol0K3xva7Gc8oIuFVGiAx0vqRBb4ERq25x1R
         Q4xcMC6vUN52vT5tnuoVcpYMXfmDV2Hqt77uK9FtsCvR+nyVjxwNWYYffqzm5hBv9xlK
         zOtslNzioDI5ikDMVnDnKJ7hR/gB80hWUQLaEhf+s6laqkXz+ziv/E80oeM1+rz3ljnl
         b7gA==
X-Forwarded-Encrypted: i=1; AL+hErEnvdWnldNvbg8e6J2Wqfntzx1oMi73lnEyWXV7kmOI5sROUzi78GYa/kVROZBKIVh6ARhWo7E4Xnym@vger.kernel.org
X-Gm-Message-State: APuU4Z++SZpdgAvrlSbtrCCwIqHko+y1XTJhw6kxGgmKaD39R41zzbHB
	/DoiMWHujWynMhP08EoI3IFi9zyK2Xew5lRI7PlfPpZ4m5ilI853CXBj
X-Gm-Gg: AZFdTZcxYcs0extDAlIV655Rp3Qo4nGVzhJeGAx+Efj4ooH5SEsoOpLoUYBKTc65LQc
	uxuDEnV6DTTwtuUFXiP0poKsi6ZHXi7umSmD9nGwWYUHiMDxURk2aj7BqTVez+gk4lZYwzHdB2i
	+80hUgSVUwgvIln3MIoDy1x7h2K6D85CG3ZFAsNgxVqWvONCq+a7GF6z0LA6qOhKFipC7F0949b
	8wddcsQ0A3JEZOltL5p9KDXuOY10BTek68+kJE5cUQdi2UlxriXfngfgJvKXryj4JQc3ietSU0h
	g1dGdIK4DWYmdvaifFEqnopKQ/8Es07afA+Sxz/wKisnAlrTuCkoZw6g912vKLMt0e7GK5RBuzH
	tigfYPuOOIU2amPwfDCTObuWJYP0ZsEVNVI3D0vr1+A9CBGeSvO/zVre/PrinmF27ciVRYqdAJB
	rJ26TZqXgJlRu1f/iuw1gfn+flccF5NjzX5tCgU0nFeQuxDOgRBnUtITopdY3zM6z0mPx0RP69T
	hydKK6TgzAubuT2DS8pyCrcyLoV2v9ZjXq53rnn5/4OtO9jYfN0pYovxK5M9xH/RHjc9tyB8wp+
	keIOsHNg1VeSici2TVMbVTbz3u6GUFMAN0mnNeQ9zOQIKvrWRh0Q
X-Received: by 2002:a17:902:dacb:b0:2e9:95c0:7c50 with SMTP id d9443c01a7336-2f03f271e00mr75498935ad.71.1795330676087;
        Sat, 21 Nov 2026 22:57:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: watchdog: Add HiSilicon STB watchdog binding
Date: Sun, 22 Nov 2026 14:55:20 +0800
Message-ID: <20261122065549.3265519-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding schema for the watchdog controller found on
HiSilicon STB SoCs.

While sharing the register layout of ARM PrimeCell SP805, this block
does not implement PrimeCell ID registers and has non-standard reload
and lock semantics, requiring a dedicated platform driver binding.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..c0a8ccdb482a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/hisilicon,histb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB SoC Watchdog
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description:
+  HiSilicon STB SoCs (Hi3716, Hi3798, Hi3798, etc) integrate a watchdog device,
+  which triggers an interrupt after a configurable time period. If that
+  interrupt has not been serviced when the next interrupt would be triggered,
+  the reset signal is asserted.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3798cv200-wdt
+      - const: hisilicon,histb-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg 0>;
+    };
-- 
2.53.0

