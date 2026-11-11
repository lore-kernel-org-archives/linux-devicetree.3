Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408273;
	b=HJu3d/NCcLB0lBoGr9ia8IhDzOOcPin0vPUtgfa4A0VTREsrDVDspeibsYMUOFLa0SdR
	 H05LAYgkUmGkbMqpkUEKrc834splDCkmpvxrhw3n4vDCUEAixa2JCJs7rQhE0M41mN/vl
	 LRxRsN4VVPBLJWH9lwLyyR4jAls1wuawy3EKSV4NfO1CYQrHrEGMRdKknpciEdY/Bq7an
	 Q94ocMATLrN60nP/ZwptkKZGeh56jZAWnu+8fKMwoYYR+ODTxNyOMWfi3OzSiwho1Djzt
	 0zrKFV+8sx49TOlOHJjk/uWJ8P9jTGJ5UWp7MjOFLvebgxfqHpL4SzfKrda6/62Jo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
	b=0I0iLPjUgB5OyVEOOg7zH4dUgQcdIVqoLJ5BmyYOybItPxXdbEtJsWLo51r95i8jtbUO
	 bbYeZ2IeOMsCLwAHnQofBFtBJfPOsMOVh162ZVEVVcjmQu09yX1NXQUD/OhlG7CHB2djm
	 y4Cgjmgs20Ocyd5SmtIb4//JxLNpng1eG84d78MGP+5VVDSSqsH0Z5swFAupCZVz+/3VW
	 akXbDg+T1GDQNtAupBS1u9dtnmYzESj3PPY1v7tHMWU1f36KrxCAmz81f3eyq8iCWgWJe
	 GAJMJfnhA/+sC/pxf2Sbzr5GbV0PwmZNDWQJtTeq64OCf8pS2diFONif06pWtCzltLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24384606A88E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24384606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so36487045e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408271; x=1795013071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=B1yyVtKWJ5NV0CiF7ka9DSnfzre11MMuYuCtwZYQBcDWhpEP6f6UJ5spZq4Uy7MbM/
         oNtKHy0AyOdn9Ls8Oiu0sAIPTNYdKg5PRn5ldTW8M7Pn2bVwSvJ7uZgA5CeMerwaG08B
         gIJPqaXCCHRQ4Ld4niiB3+hypf2g6fzwMo4zbaJ2i/BGvbq/kxG98hQKQFoHv/+jwyxK
         kVslqCzOunlj5KMoI/v2QP4pkzWnGAmdgCO1yCtkITGNyNXn+gd/m+kfI3ddpBTid+JH
         JJ6+tI7PG3+CbNT+tqrv0Bk0m018299UuszXB99OJhoaTCSk6FHRS9Kd1F7jycJEafcA
         nJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408271; x=1795013071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=Z0WhqplAb606nhQaYI/+UD+1JRaaEB6ggNp6ZzlE2I3L8bMTRC+9/DM4NL6CP8O1M9
         ciu/XTKcFVsCRAuPJhyqBE6wTzxiaFyz0cd8AE5RUNTMXTupWgU867dqUHkJz5H0DPMm
         5sCADiGmKM9IHd4WLNoB3sPeURHcGksQHU1t74tVYhG2MLX18N3+JMjoNUzCNHL3oixw
         nrtj9ig09cHq9rIbF+nDO4ywm5w+ZDKDrua/umWvn5UmQ3wVBnttboLb+8+gmD8sEYLD
         rvv/JbPn4F2nAX9H5iQlcEtz4sox4zO6N/hbuw1eN/dLbX0kW4DAwIpt5J2586HSQuim
         r2zA==
X-Forwarded-Encrypted: i=1; AL+hErHFxVkySlIFX1QtC81oNx53lnnKW6a1GnOTVJFhzGzs0T5RCU42nrt65WzjdeF1eiUUxiXrwUThYGdJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9YwwEU2Jim0Au2LxtsaLiAePIwAPaIbkVubEbTScpvzgtRar2q
	691kUmO6w7pXUoJ2Le1ZNiOX3Fy3j69VDtpluu4B7A37pJKvdJHwH7wW
X-Gm-Gg: AYBFou1fRADuae2e7yrOZQqgm6UmgHz4ac83qYtZ9kljzKqokkUVJ2dgZIB1eViD381
	DibEEyAMKMZjQQRmRNMoDJgzi4uEPriqcWkFOoegbOgRU64EJtWwjWAGWfOZvak5/J/1zD45fS6
	HlfJQxDoitqkVmnH26sLMuEUxS07uzctnBeVIJ4MzK7Xz8LcvrrbqugsL9Ufjkez6ildCmr8RyZ
	sFwfRGxxuSdZ0XCmH1AK30+XxHja+OA/En73LyqGOAIVqwFHvWalPctX4Esn25r7EGDJ2g6Xwb8
	wrFmh7S6g0ErJ+I1KTKzf5CWbWKlVqz5ln6p7ag/AtHBmAHHk4zEJ3/kWVuC1/LWcMWwH01gPNu
	dFDqy4GuLB4+DsOn+3iQLVVkwiFaLq6zbEc2x29daaNA/6bfr5pJLBnTbxXV7DtckkltaRVbgCH
	F12KCzdp6lQtYZTiRpr/remWJa4CNkvtR+tABmw6j3ROu61tQt5dsRe3RvpHlXXBQP0XqxaQkC6
	mTBdGCf2GESQApO9tNKI9laz+ubLG8u3gAIgn7lEdCoDYzrHaoF65kfBZS2E9KjsG8kPnXjI+OF
	VzdehOvIkdJKHj2rFTDEMJu9adfJePhr6PN/5bNsDHgJ9vx7eFgdjaEY
X-Received: by 2002:a05:600c:4e0e:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba093ac8f6mr46752285e9.32.1794408271122;
        Wed, 11 Nov 2026 06:44:31 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:30 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/5] dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:22 +0100
Message-Id: <20261111144426.1321237-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

Besides the traffic manager's interrupt the switch has a second DMA
engine with its own interrupt line, the ring pair the vendor firmware
uses to exchange frames of offloaded flows with the WLAN drivers.
Describe it as an optional second interrupt, named "wlan".

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
index fcbdbafa766d..b9a419e5d44a 100644
--- a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -23,9 +23,19 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
-    description: The traffic manager's interrupt, which signals frames
-      received for the CPU.
+    minItems: 1
+    items:
+      - description: The traffic manager's interrupt, which signals frames
+          received for the CPU.
+      - description: The WLAN DMA ring's interrupt, through which the
+          switch exchanges frames of offloaded flows with the WLAN
+          interfaces.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: tm
+      - const: wlan
 
   ethernet-ports:
     type: object
@@ -98,7 +108,9 @@ examples:
     ethernet@92000000 {
         compatible = "zte,zx279128s-gmac";
         reg = <0x92000000 0x400000>;
-        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tm", "wlan";
 
         ethernet-ports {
             #address-cells = <1>;
-- 
2.30.2

