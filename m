Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420542E006
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023171; cv=none; b=BSmVc0VKgGooSo2B8IaRbdNPrp7YViNKwTGTHYjyUIlOQ6IbXADJHfkLDVD8oy7aPrsCT6qGN2KlvSGfH5VFvUvPEff0rSsl0mZqDQP//Y0y4wkaH/eFplZeJLhFkPuMLAlSHsIzrNX5l1ASf2kEqGhfV92Nm5j+8Y1+OHISq3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023171; c=relaxed/simple;
	bh=ems2LpTiwpTPgbOwaVQx5TOJZKGRhpPlPNAONUo8hZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qn1d3dv3JYJvzuXM98q/oQy15SsFSj5LgttpizG7+iKi9FZuIG+2N0rQDHVc187p1tru5dh1jejcEqzNIEZX/JvBx71TUf7TTekRjyb0tGixS/itQJBfI7VPdeRX9k4cAluOJbu4qfIsO5d2eKbw7MHiQVDNDiVOjIh8hVAdzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c03LkUFQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c03LkUFQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso30579485e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023169; x=1781627969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=c03LkUFQyhrcrPPClwpUlac6+lmB8l0CQh6z8Xb8O6ZXbPJl3d1CzrP7iRTIroME7m
         4pNXt3StKwwg/LR6iEIN2qH7524DXy3i1s8ThNLfTLVcMh0jK7D1Nf0tHrQFxx3rIao7
         jD8hjW2F7NTkm1YuydTJ2OjxN4VpUgxFTIQRCMFFvbRZyA/BJbTt7N3o2QBuh1zBL/Zs
         aMC8UMcrxXRJhaSF3EPN2Yp5rHeD0PEqZvrGKlgToGl2oFXpkCvZ6hwe/bjYb7OuJtOa
         Qupjq0CUT+0zxxMjvHFNuTZZHfJlRcWlHWM6i3mR1BCBUEBoCpJVBDlJsHH6B0fpfRnl
         A1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023169; x=1781627969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=Y7o4iRKcXDPZPUJeF/2zWQCQjESmsYBInmwXhIQKSFBEqfjAyi2K5w9M5u0ZvnXEEv
         ZvMF9uh80x29mcO5RRKjpNtS1LIrSsbwqkLRy6Aaih2DGhSc1IAXpXe/QpShk26E9wWz
         ITRYMpw18W3LgNprzujF3WxMqd+KA/rmUqVOqxzFp1pyurfe9vk4IdWUNIZa1GU6/8Hr
         /nzoDFHEC88Rjg66FWIsMSyHTpaFPNVRha9pySYTo//fHo+ZBy6LhlNsg5F/oz2EZq7A
         MAK2iPrgiA4O624cQ1hHWEVB7AoC6gUhbpe/1rra9lJkyyYK9OOj4uEALCFoNEo3hHfs
         kRVA==
X-Forwarded-Encrypted: i=1; AFNElJ9GnFpEsu+oa+Le7odqAwlTZ4IzLCa7AIwKhBj3pDsS6m0XaCrdek2rsUDBG4Fre8KJGrmC55uTX/iY@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO01Q3UBlLeXKJkQVIbx32j/07govpm19miKA6yvnbVM99o31
	89oYJscLaU7a1KRMy9aoRuDE2wuOUIj8zm+oHwxGIUQ6TIm50eJs5HEd
X-Gm-Gg: Acq92OGNtFhrcnq2c6lngmHJlbfMpIorx0RBB/s6Pe86ETkAaLtqveAaMC6Zedlr4Xk
	C4Zn+7HXX15MD9HhYsr5/FzfW+M7tTHJssuKgG9A0SI0CwlbUWLYF4jnKS2VuC6Po+bbXtZdIVl
	c54jTm0hznT+4T2MxckTTSZN28RiJvIVv/unkbX90e5JwwHV/luYv4PJaWNoeN6k6dx3ghB/Jji
	hInpuKtkmTg34rRirPkRcIfpx1/do4GyaVFHbFNEeaNsHJ5W2sTtipHXZNtquizeZcU/TOfbswL
	ZX5q0lDziYxZ40L0iZW+61ieSku05NbQ5fiA484//jEHmCqagluCnir5EtF7WMgeeTdiw0PQWM/
	kbNd8TiaMDMybXoR1Ivif88zk0GGnXFsAtFEZ4EZNE0bvNNheO71GCK489FBgG3t1tjMH5yedRU
	9nlyAV/adDIlo4V9vjfjLsW9RbgbjrglW1+yhVpfHe+xY1JBuku5m/5dE=
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490c2cdd2bemr288823845e9.7.1781023168694;
        Tue, 09 Jun 2026 09:39:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:27 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
Date: Tue,  9 Jun 2026 19:39:17 +0300
Message-Id: <20260609163919.3321228-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609163919.3321228-1-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The NPCM7xx FIU controller nodes only describe the control register block,
but they still advertise a second "memory" entry in reg-names. Drop the
bogus name so the DTS matches the resources actually present in each node.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/a=
rm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..a16450abea0e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -191,7 +191,7 @@ fiu0: spi@fb000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
 			clock-names =3D "clk_spi0";
 			status =3D "disabled";
@@ -202,7 +202,7 @@ fiu3: spi@c0000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xc0000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
 			clock-names =3D "clk_spi3";
 			pinctrl-names =3D "default";
@@ -215,7 +215,7 @@ fiux: spi@fb001000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb001000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
 			clock-names =3D "clk_spix";
 			status =3D "disabled";
--=20
2.34.1

