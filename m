Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6A231842
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777728718; cv=none; b=n5F34c8VtV6CZY+w14aJAJREYRTMvTIHrzwJiEeePMEwwEsFAdQ8PpKnhkJ5gYADNnASQt1MlFfoP751Yp1Tb5pqxhobglUXHR5jbfdhf6eXFL0roAlmLVKe0uQKg/gLC5A+C0u7q8Xp7S7WO6T9CbdgC4tCZ4Y42FOk7V3D1gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777728718; c=relaxed/simple;
	bh=mybpnbkUFkw7cm61GvY6X09yZBkBBXqM1ozOHvrnueg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR2f+sbZpm1aKmE+sj3x7JTlzsCNdJxkHYdzWTiDVKiW20PQsIP10YOFcLp8pKBhbDNLWYRJell0eqorVog5yIlV1yIN7e3jr191I8gtCtNOm1oF8iNmsy2lD9yCnauRHVqHPDYP1d3+J/LK39zg5rTXlQ+jOaR8NHfdP7C/9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=eIVEICBu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="eIVEICBu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1726761a91.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777728717; x=1778333517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=eIVEICBuxvjSBVXdGqTIjX4pRzpD18LlOPAW93sFpR89tvO0INfjGTdHIoW8Z5w2Tg
         akWu3wKLQwWVQl8iF9iAXu+vlfec3cNsUm0/+wWTRafpijit2MDCmpwmmgflZB6/iLZ9
         zQ7A171rLU4FKBZDBHw/qTR1Do0k/Vo/uxSyXN/OuqoqvK4+BQywu7OwgvWUf0u79atv
         6UQA4y/GwQ9irXwW0g8ZGo65/RmmJ24M5hSNAhKRiTAtIX+NH5CDsZQGsQex5+N1qDSE
         8gZGM/She+HJWkHAZot+F8BPf10bJcIn9SO1tiKFSuy3OKolCV+Slhy4poh3jfrLuPKX
         ck0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777728717; x=1778333517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=f35yldYf8EavSmnw/LFtYm6c/314VLbQMiX9okxzthqy+sXSgLDP9+1Mgv5o0an7j7
         Jd3q9Y0kbnBUGmgKQRW6aOfyvgiAo/lDQn764rTaE9ITIyZO9FhpNlFXKdEogvEKuqGX
         u0utZtfB/vylV6iCl0ddcCb8HhbFToj79g1OKadWP02ervK+dbXxNbtEN9ObtbyFvHGU
         RgYzQjdi5jS5JgCf5L7wtNbF7OdETzIwBbGMzr4mxltE7zVnjR1zY7d8OO1UFiuqAjYX
         hgontsbo9nwwg9YiWkg4hMVXlMN5IS08rqH7MGUG38QkwtEfsPPj1Fvc3biNCdxKyFnQ
         b9cA==
X-Forwarded-Encrypted: i=1; AFNElJ8l+4ApRfqVuOUNs1tQgrlkH5YqzstCjC7hodJebo9scV8kWejRAnn2HUB2xHZFGpjya9HpeGFQUNks@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzUNVyXu6SwjtSlgfB826SFUgZ2qG+RB6PkzCQEx6uSpK0QsY
	e1T7RlGv2k/96ts5qrzBgC1VcY4NOB8LOi2DFVlH+BmksQbNrslCx/uk1ldA/xWI90A=
X-Gm-Gg: AeBDiet2NMdSVgAPBslTetmg+B8rt2p5ekiKR+PLy3wb4wBgpJ39TfegpRlAugEDG23
	8mgFjrrSk9z7RkVSA0xqfm8AIshMUsNWJJwV2iqu3U6jT48krnVm3YQYvnCv43co5nCPWqQFEBT
	znu/u/pPiEAkRSaKVN8Jx1K2/kFAmeo6OPJga7poqUVtit3I9jgqKaQtl/5DxaGZERuYlnrviDT
	ALKKmIZKyIY03V5OFC/u+vtU38+rej9mwIPnBauZs6Gdau/7yccPHYRDq9Z1vIT5mPUUYpLM8Br
	esLSbdxdqfYsjnaAEmx6tjBanbGS0xQ+lyphkN+Es2roIsj/N3X7G7tIox50h1AD4dXMPJ4OHza
	J/gX4FpSsG374sZpppA0LV0Ce7bmEAqgrGYklFFBuZhPsnQDPxGrCmAwdzXWtVnUT5rp9fdDrhe
	WUbQ7UFm4a1+PQl6O7c4MvOAzCFo2v2jNFgSrLn8HL4QoqZGRkOMFlbsgSmQMZhBtD
X-Received: by 2002:a17:90a:da8e:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-3650ce70a0bmr2989866a91.24.1777728716810;
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm5647937a91.14.2026.05.02.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 02 May 2026 21:30:53 -0400
Subject: [PATCH v10 3/3] riscv: dts: spacemit: define a SPI controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-spi-spacemit-k1-v10-3-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1

From: Alex Elder <elder@riscstar.com>

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v10: No change
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db..9429189354d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
@@ -335,6 +336,12 @@ &pcie2 {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66..34d88334e95e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c970..f8747190d2e12 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -983,6 +983,21 @@ qspi: spi@d420c000 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 

-- 
2.43.0

