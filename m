Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFF2F5491
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434700; cv=none; b=nFYjHaMvAbfeo4wPbYnCN+DVLvl9SqZnE/NbN6/3EQ6kxo7gTjVVLd+daZrCF7odIR1jZJatzK+oH8L3gndAEKAZWd4lryvLIvyV96+sv9gbmq6PUWE57g6mN+QMvrXyh/joxk6glD0G6BV4LV2pP+YOrUUiv8g/UIktoYMmVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434700; c=relaxed/simple;
	bh=Oh8y2Xcy2E85yeHLMPDtlxeM10Fgj45TY+/SphVe6jE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jiOIHBQ1L95cOaN/h153VPNck5eKRL4Poqown67G4gc1PO1xuyw4v2Sut2fVt7sf4BJALk5EKm0X30x0+Xdzm5yeTgh4eGmRdgn0OhjFfmvf2g9/X2H3L75eUCGGCwbAeT5NprbDZUxPzGM9+TEKRO0WaP6K4Pc1pKucnC9ITgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxx+i8wn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxx+i8wn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-834da62e52dso911085b3a.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434698; x=1778039498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shmUQp5JvJkc9W1Z22pnWkTCFcSmOMHms+8IkinOvcI=;
        b=rxx+i8wnbHng8c4UHMy+Pl+qb+p6HA5l1idoMl+QkL4Ak+nH8Pj96jkF8jYJ3RPcJ6
         wqcWin3f+VpSKT3AQHUZLjUZ7zi0lVHYb6JtpReVDL7WAtrRmDSq+U1bd7UNaSE1dD0u
         1zlLYmmpOLAEeP9ATjy0WHOjaNARA2fDooSrv8mvdPRiQ9N3SnQU2u8xC5bwoKSGVh4u
         6PhWGc3+STWgqY/91QhZgirO36qpeU7vLksyuPNealnDeMEVTrisjpPcWEwXx8koFnrH
         EgIg0zq3o8awRgiZGEx4xR+v4YuY2Ag1+of9W+Eau4RD8buQBGmtmIHTrIB1iroEjU7J
         fFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434698; x=1778039498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shmUQp5JvJkc9W1Z22pnWkTCFcSmOMHms+8IkinOvcI=;
        b=MkEYCZzGm10NUVdlnwATQUYxXx0Ongq1jdm2huiGA7wgEpdGQBc7PTw7PRV+fgbuuI
         19DMkICiSUP7QG5F5vFXl2V6KqrEaH/qSV98WjmO4XFtinsf1Iav2VKFvh6mdxCghKOS
         fFKTJWoG01bf8n5g1eaD4gmmDS++rEYbQREeX7oqH8WD9IvuY5+Y8+zPKQ0DYMXRHodQ
         lYvLQRZhCnh6U4Mfw2HFj7Z63K7BF2ZBPwvPBM+ePEDY9f0Wc8e6SWtNz7pKGBHMCbD+
         lw87D2huaBiUYweIwzEYzYA9YldFRlngUP+/Xc043gqCj/TZqbervub2z3xf1hOdGblL
         iP1g==
X-Forwarded-Encrypted: i=1; AFNElJ9RO7nlXdwSVHqj+pLTXpCsRKSx75uGgRMVuizZIY4qvvpih7sjebHOhv01nZ6u5g5DOw1rIyJGbOD/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgj2WCNYQqPceVq0HdB2xbAqHNBg8xczjo3zpPex70vacmTZDE
	5BEs7atzZyogRtbYdTZF7n8Sd0FxIWsuSOLo9s6kDaJLMA1yaAdXf3Dx
X-Gm-Gg: AeBDiesmop7EYVD4xSxw20eJ2wcJZo2x+GB9T9NqjB5x8PunTjf5wAPhsg6Ciz4QvMq
	auSdlIxKYKemhJR2TVIn/hAUQzOCzy+O+wDhTAmdmPQbmJUzvyeQZSuMbpCbDuLj1QG1F9BQkfe
	KHCP+/snyK4eJUbltyMkjoTIpM2wTDDZL7//aYiiNkOc5CJ1WhyO06oUKQR1K1l/2Iog0z/1eYP
	sNIkNW5kzfpxSNvP+vTrhEyB8RX897VxpEveo9rIfp7Q1BJa1fSwh9bWeSlOvihDgynyJH0+cQi
	3SfVfRiQ0hwp6I1DlKO0SOIJQ8NAFFy4WAkT8Jy7mdw42AjJanS6vEDc9FZaEmNRgGr6YihdfPU
	20hA8Q5QVOW/dYRyXg4pkzV2BxY8/uiw+oQKmJM38GT7mP2jC6ONPgA4T+jnK+PgcmLK9NOzjiV
	fuPkwmRny1AKi4YMX0uSiko11wcNB2DqZr5MFkSFvJuF5OmCeRf+/2n10tppAnkxu7
X-Received: by 2002:a05:6a00:bb8f:b0:82a:6852:559e with SMTP id d2e1a72fcca58-834ddac7b7bmr6064890b3a.12.1777434697983;
        Tue, 28 Apr 2026 20:51:37 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5f30ddsm502899b3a.26.2026.04.28.20.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:51:37 -0700 (PDT)
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
Subject: [PATCH v2 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Wed, 29 Apr 2026 12:51:32 +0900
Message-Id: <20260429035134.1023330-1-happycpu@gmail.com>
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

This v2 reuses the existing lines-initial-states bitmask, as suggested
by Linus Walleij, instead of inventing a new property. That sidesteps
both the v1 review concerns at once: there is no vendor-specific
property to argue about, and the bit-N-equals-line-N convention is
already documented for nxp,pcf8575.

Background (carried over from v1):
The 74HC595 / 74LVC594 family is push-pull output only. There is no
read-back path, no defined power-on state for the parallel outputs, and
__gen_74x164_write_config() always shifts the full chain on every
transaction. The driver therefore publishes whatever sits in
chip->buffer on the very first ->set() call, and today that buffer is
fresh from kzalloc(), so all outputs come up low. On boards with active-
low indicators or other signals whose initial level matters, the 0x00
publish glitches the chain before user space (or gpio-leds default-state
walking) gets a chance to run.

gpio-hog is not a substitute here: each hog is applied sequentially and
forces an intermediate full-chain write per line, and on this board
gpio-leds already claims every output, leaving no free lines to hog.

Approach in v2:
Patch 1 documents the existing lines-initial-states property under the
fairchild,74hc595 binding, with the small wording change that on this
output-only family bit=0 drives the line low and bit=1 drives it high.

Patch 2 wires the driver to read that bitmask into chip->buffer before
the first __gen_74x164_write_config(), so the chain comes up in the
configured pattern atomically on the first SPI transaction. Property
absence keeps the existing zeroing behaviour.

The bitmask covers up to 32 lines (four cascaded chips), which fits all
existing in-tree users and the typical 1-4 chip cascades. If a longer
chain ever needs seeding, the property can be extended to a uint32-array
without breaking the bit-N-equals-line-N convention.

Tested on a 4-chip 74HC595 chain (32 outputs, active-low LEDs); the
0x00 glitch on first write goes away with lines-initial-states set to
the desired idle pattern, and absence of the property leaves behaviour
unchanged.

Changes since v1
[https://lore.kernel.org/linux-gpio/cover.1776872453.git.happycpu@gmail.com/]:
  - Drop the new 'registers-default' u8-array property; reuse the
    existing 'lines-initial-states' uint32 bitmask instead, as
    suggested by Linus Walleij. This also addresses Krzysztof
    Kozlowski's concern about adding a generic, non-vendor-prefixed
    property to a vendor-specific binding (the property is already
    documented for nxp,pcf8575).
  - Driver now reads a single u32 and maps bit N to GPIO line N,
    matching the nxp,pcf8575 convention. For this output-only device
    the polarity is the natural one: bit=0 drives the line low,
    bit=1 drives it high.
  - Binding example updated accordingly.

Chanhong Jung (2):
  dt-bindings: gpio: fairchild,74hc595: add lines-initial-states
    property
  gpio: 74x164: support lines-initial-states for boot-time output state

 .../bindings/gpio/fairchild,74hc595.yaml        | 13 +++++++++++++
 drivers/gpio/gpio-74x164.c                      | 17 ++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.34.1

