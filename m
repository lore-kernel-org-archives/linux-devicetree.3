Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A43815C5
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873916; cv=none; b=lbsnUhgv29l7bXDphRXEeXzaTBxBX5k5w/pZQTX7MUxlq1ILRJOrg7ByU6Zb2V1vOXxHZuT3CkfNR/3i9RRCBttohSEB/KUtPU4x9a8YULbrMPVcapuTgS+NV7USi95lUPxTa9jp+cp9mhohdgddaN8pVKYxInXHu2aKODw++oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873916; c=relaxed/simple;
	bh=0oF5yLnqueqC9tyouh3AcpVVlddHY0rpyMWXyvW8cHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bKVHjziw8r/zkBYDrSTiDRjh5H8g1HbTiE6CX483PTVep4ci7RCMKfWhDSoUYIV/CNQktNa41DYir821P7hh87Ed8pdGFT6aJcFcs8NAZLNM4PG2ncgyAFpfRcKyGnp9ARkSFXyU66KsoKddCEI+ruJJUpyEJClJI1BsY3w6xt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma3Yr86C; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma3Yr86C"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-827270d50d4so5147021b3a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873913; x=1777478713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxb256EBeZtQyoihRghLekjihrjtRwmLsvJYxZ59QmU=;
        b=ma3Yr86ClFK61Jn9bZTfZOHVCGyoV6k03Y4GxmyQyHGMxd9fVcEtJyZgdrMmBKGsxF
         4382zRKrlJNkg5qdiyvUjKi9vppDNDgZKw/ecB1gF856ciP5vOhuiBnj+nrZwO/RAfb4
         MuS988/lMMY7sshPvga1A93U2YuCG589vdUWFRlOslPP/QedOI8ug7SYQtf4ELIJTObQ
         Qv+tfFuHlEbG7stq7a2eyy4lhlD/rn8/P9uG6rmuAapNUmVcLtZXpMJ3tE52ZspTZxrF
         7T8ely/kEiAEcxC7/C3c5mBZxKyxDBJLf9H/aP0WeSXEfPDhWSyvV6OgL74pOxhYD6+b
         0Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873913; x=1777478713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxb256EBeZtQyoihRghLekjihrjtRwmLsvJYxZ59QmU=;
        b=je1WC0Tl3fHzRAuBfkuRfy6DzLqToqhHqFoK+uh4m/zrQc6IXpt0g7L4d++iw2G9C9
         qLnwaQJIjXONZ8IOtWpQjxKZckemAXq/s05AH+oGTIGaxfjwjPOTl/2FicxvuKYbDAi6
         I65JmGkdSKI0pdM3ec3bFycq+1D431p5uZP8UoywsqWZBVwFZqOGP+AQhpOMWz/q4uIR
         ccHyjaGx5ZUYLFARZ6YgiaVqchm5CiwBuhJULQ3PVUZPuuPVjcaJE4QEhnH5XPhz8Q0V
         cwMfM5n5E9kQoyfIbFuYhBW/RqTinXeYsEZr5a2bLGGsP7oN+tT7NdyW1kd1J3aNIE/S
         RGAA==
X-Forwarded-Encrypted: i=1; AFNElJ8MRfW9aobcxe1OKAdoRIPhO7yOj2QCdVqIBQ/EqOnamxG68EtQNf4o8YPJAedL5MQJSw/10HSBfvDO@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTcmmKpv86ocFotwM1J47rSsFsEJUtNtMifl1gNLG234EAgPk
	IEgqVQQJgjxaBQN2VOQpxy7jgzRV/3GTRq29VJwp+lCdgvp7Ge5Cfr68
X-Gm-Gg: AeBDieuJc1ys6jMQBHr13lJ4hLVcCfLXsRabQVqm3YS0fUURUt8CWSTGC9MIR1+HntX
	dLq16nuuLM4otISraJ5zaM1Pk6uSCGI6rcTz334jDG0P40vwfhUO3WG4BzBtHU1tWwcyrlVZXdR
	u8YtqmCzWJFcOT+JDDIQTHVg008j8Hss/DKSfDGS+wrYqyOsm4IsIoJX3CwiXWUwejJfmwgDbnO
	y7TBuqHISLQFfl2yTTFcNbVIbaM2pFykT7Y+nBv6A1tsxU7G71uVoEoGVlcUNT3qedSz1Wr6Ujr
	bT0Z62RTruNP+obIkfLfiNpCliHdB/h877Ud4MKBv2eiiVzDz6Dvnldc6qDnqnx/AjTCSVHbGhU
	I0MSFdQTya7BAi1lfVp7G0Zw+8kuNVzRC7NgUSSbo/NFwGJPsMPw8Sn1OiFf91dFpVEG8nYNeQq
	cwKH/NeK9BvMRuLfCplHUBLz8dKp8Ji/zO6+N1HaWaB3QdZCGQQFtiMnuUIbxbGWXB
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr24045763b3a.1.1776873912716;
        Wed, 22 Apr 2026 09:05:12 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:12 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add registers-default property
Date: Thu, 23 Apr 2026 01:05:03 +0900
Message-Id: <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 74HC595 and 74LVC594 shift registers latch their outputs until the
first serial write, so boards that depend on a specific power-on pattern
(for example active-low indicators, reset lines, or other signals that
must come up non-zero) have no way to express that today: the Linux
driver always writes zeros from its zero-initialised buffer during
probe.

Describe a new optional 'registers-default' property that carries a u8
array - one byte per cascaded register, in the same order used by the
driver's internal buffer (first byte targets the last register in the
chain). The Linux driver change that consumes this property follows.

This property is already recognised by the corresponding U-Boot driver
(drivers/gpio/74x164_gpio.c), so documenting it here brings the two
bindings back in sync and allows boards to initialise the chain once
from the bootloader DT and keep the same value after the kernel takes
over.

Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 23410aeca..c6221ed75 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -45,6 +45,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Number of daisy-chained shift registers
 
+  registers-default:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Initial state of the daisy-chained outputs, written by the driver
+      before the gpiochip is registered. One byte per cascaded register,
+      in the same order used by the driver's buffer (the first byte
+      targets the last register in the chain). When absent, outputs come
+      up zeroed. The number of entries must match 'registers-number'.
+
   enable-gpios:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
@@ -79,6 +88,7 @@ examples:
             gpio-controller;
             #gpio-cells = <2>;
             registers-number = <4>;
+            registers-default = /bits/ 8 <0xff 0xff 0x00 0x00>;
             spi-max-frequency = <100000>;
         };
     };
-- 
2.34.1

