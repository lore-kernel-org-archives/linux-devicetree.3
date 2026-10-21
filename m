Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571532;
	b=1qscyBuLyCFQ5pVWTjfNjJ7kcehlde78NaPzNQufxa1ZRkAgjkz7lymIZOvmMFxGHAO6
	 yZJO0QbJsIHt77ECSar2/oriLUjnU1g85o9HkwxEOustNzop/yC4JQFsLOV8dmfTO3xHR
	 2vNRN5HiIRtIJ9cez2EaUW7oDEywhNP3g4ib8TarEDjxzEeSeMKjnJsPyqXBkVkLy+LN5
	 hqR+X8T6MJDyDuEXbuaz0lcQe2qNoD/uMl2GiCBRgPK6YQ4BlzmH06fQSYovEufZdanlA
	 QHq9uNK2Axbfs0JC207/VDjetzGojWqchObhiOdRROQ1I1i2I+AI+RlujeR+NOoS5kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
	b=JP1aO2SI7xvu4xvw3h+c0EzGtt+Aw3AD3V0qAFF5p082RCfzobeEIrtHqLCkAP1FwXw+
	 ALxkap9C8TOOtVw5g4fm6BuKyE51tPd+nd9VVZbGBRn4SFuAIwLA25ZqJ9rBZBKu9V5C0
	 4EpNBW6iBN/+QhbpZZjMYXGBO3s6SQCdWGGq5EYo7oJe3+WaIEYYmgE1yBmouPeZ60QzS
	 wRTn87HfBWQzH2MA2HH9DDR31gKz5hneNR2yzKH9EYO4IMyDljWk0DbHdAlAcmv79/im4
	 7k+fgJSFEFtmcg0MQ7eE8dPKryDq2Foo84H8vYDq8uIDb+ZQwTQD4PvtYUq2fPAagLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y8uIgJUd;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC35606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC35606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y8uIgJUd
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so2788265e9.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571530; x=1793176330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
        b=Y8uIgJUdOgZFBBhxNjfUhdZtiZnQVL0ehbAHn1ZJws1zHbjdt+SnFEdFBg3xkaWjHV
         zhUxljw71zls7swvmgMQdOhs/4f6htNo0RO4xP54GtmicFtP51UnMZAToG1GUbgB5kBi
         gxBKSTEU2eEQeexcg6csolsSvem1YjJmXelUmQjkW8cB5jVe8s/U3nHVBy82Xr0N4+lF
         +6CqUeOO4PPETjajztvOd81R/EkwrR6aqTJ5JK2SUAd2sLHi02tMPq2aR7dmX9ADypfD
         /oE6+ux+IqXxdRIXQ1iZC/LrnXNKRpWqeCER8GHsJ4n7iutNR33kUFz3a+xabQDCy7Y0
         0NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571530; x=1793176330;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
        b=Q1gLCbJ5zQ1kVlnWxKl+VMVTrmnjHNTtgR4DBfApVmRHqqH09QauK7QRo9dZic3NsD
         bXQUIe7D3Zg97lpB2YY/P31tNL17+mPdEDV0g/9nq9KAOgasqz1jMABQ619z+xpYj9KG
         IoXshmwbOaEI8dfaoa5tPZ0q7l71U0w37DV3tKh4AEN5cJPK2LOZCR5rcwWokraRmteF
         mbMus1LIHxPaclL85IgSor4mZbuZ3HhL+Zf9uOzwx25VkCOshuzUq7C7xFz2BNTpMscE
         fDAqYRZqk6xuZyZWpvDtSL5XpqPUsDVCLybwHl4dA6rByPsCrbmvAtTvuCscqvuy5K82
         0MeQ==
X-Forwarded-Encrypted: i=1; AKwUvByyhRjIgxS5Pd0qodGi7a0iI4ih8dJ4WGOfkE2Dv62Q5OX8JdaE5/07eTmULj4FYa2/zoBKtbtTbTzQ@vger.kernel.org
X-Gm-Message-State: AFq9FYK7hvhRkC6i543SQ4IG5K9QzNljHqv4G4VWZOh0rLwELDyuyL0Z
	Z2R3eCt9qaBDwfbKV6SrND7G21ZfpVZqSyVZqRV/tAHLlKptKr3EHkJb
X-Gm-Gg: AYBFou3Ca4MKr50Wn5wD+OFimu0O/novzGZFnegYrHxBzQGWfKbEbN1+t0oZm+q3SiL
	vhwwJ7zVZYFQIly0QBUkf8HLEfuiCUXovg32i+MOHzfepZlG3Fk7P6jkzzCZd2+LzaAZ/XsAnho
	z2O623Ieh/BGzacaeXHF/6S+buA6i+lVxVhxVTDx7fCRklhDlbUP6FyPiQPElQ664PYPevVpqM0
	3GMXG1T5nKXwpU5aP43uhW0XqqWozf5vGBFfh2bSctu/Ibs5E2n7tpftiCahdiCb5838zmaxhGf
	6RofHfI/cmmJJa1c1y3zxALgBZ3lnoJh/Z6AiTw+2A/zC9tPHjsMJrnzP/A8VxHIV37gz/jt5qL
	NjkRyOGXbhOgCtdNHX4uoQboDTuDCGnFRVXsd79Tkuk8D1uOk09Jbq53Ht+qY8yj2WFpwo1bZr/
	QVy6mjAJ+3SV6lDRNlpGi9K/Y46S+82MBrfFCnyRb71sUxv+lar375YDGVwZ+gEaNIeW6Y7H/3q
	3FHCB9GtQp0VcqRByxsoSB6k2eEXbC+A1e+OtSqSwdgwceQhFDgmpme3VZ/EUqK3tCr8INZ1DmW
	aldnlDVpgJtaKO1P/WPWZzjc
X-Received: by 2002:a05:600c:c04e:b0:4a1:fc66:b62b with SMTP id 5b1f17b1804b1-4a1fdd417admr15959935e9.35.1792571529448;
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v6 0/4] Add support for Renesas RZ/G3L CANFD
Date: Wed, 21 Oct 2026 09:32:00 +0100
Message-Id: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIB42GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3eTEvLSU+KKqdOMcXSMTiyRzoLBBWpKhElBHQVFqWmYF2LTo2Np
 aACrmW0FdAAAA
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=2403;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=U2NizDx5e/ZaD4R2wi+ffJ644tq73i8imRwCaeagpUo=;
 b=KtxVPj9hvLegzG5upX5EOnw3PtCx418FqPvfZoglAt2bhk1uaBarM5Gcppkjjfim4ghOFnogD
 6kngtyDTfUPDOGw6QsefAC7QlKLmMXtckj9wdbtu/edTtrdzbPJ3lnL
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Add support for Renesas RZ/G3L CANFD.
The RZ/G3L CANFD IP has 3 channels and 11 interrupts compared to 2 channels
and 8 interrupts that of RZ/G3S. RZ/G3L has 288 buffers compared to 192
buffers on RZ/G3S SoC.

This patch series depend upon [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?id=2b4a5055d517b11bf4a5671cef32e4d77bc45626

v5->v6:
 * Updated commit header and description of patch#1
 * Simplified renesas,no-can-fd description by removing the mode list and
   keep only the statement of what the property does.
 * Updated commit description of patch#3.
 * Dropped adding RZ/G3L in the description of renesas,no-can-fd as the
   description is generic.
v4->v5:
 * Added patches for Documenting RZ/G3{L,S} SoC has no Classical CAN mode.
 * Dropped the patch "can: rcar_canfd: Derive max_channels from the device
   tree"
 * Dropped the tags as there are new changes.
 * Restored maxItems on interrupts and interrupt-names.
 * Added resets/reset-names required property for RZ/G3L.
 * Added r9a08g046_hw_info to device data.
v3->v4:
 * Dropped maxItems from interrupts,interrupt-names and resets.
 * Collected tags.
v2->v3:
 * Collected tags.
 * Added check against RCANFD_NUM_CHANNELS, to avoid overrunning the
   fixed-size rcar_canfd_global.ch[] and transceivers[] arrays.
 * Fixed typo 198->192 buffers in commit description.
v1->v2:
 * Added support for deriving max_channels from the device tree.
 * Dropped clock patch as it is accepted.
 * Dropped devicetree patches, will send it later.
 * Updated commit description
 * Dropped RZ/G3S fallback as there are lot of differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (4):
      dt-bindings: can: renesas,rcar-canfd: Simplify renesas,no-can-fd description
      can: rcar_canfd: Document that RZ/G3S has no Classical CAN mode
      dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
      can: rcar_canfd: Add support for Renesas RZ/G3L

 .../bindings/net/can/renesas,rcar-canfd.yaml       | 31 +++++++++++++++++++---
 drivers/net/can/rcar/rcar_canfd.c                  | 31 ++++++++++++++++++----
 2 files changed, 53 insertions(+), 9 deletions(-)
---
base-commit: ef2fff76f76133f4f02bc4bd116858b040c17fef
change-id: 20261020-canfd_rzg3l-248b76100fb1

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

