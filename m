Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C933F8C2
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157244; cv=none; b=FcrY40Ad3wz2ZdAD43gxKNrSGL8Fak8fArFnsMKjUircvJ9m0JsTwZx6KDmqZw/EMwuJvZal7QbKglihaI/AHLZ1ukZUf4H/QyfRdWaA4Hn9gdTg3Nj4TQNbM+MmitZRd6yNua4tfYTis8GxyEnKN3/CU43hglCcjtBMMUCGIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157244; c=relaxed/simple;
	bh=7zpQ7IpSRpflbzheGA/K2zsqhy/x5O4W7p1wQDhU9pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHzu3fXsgdTKROaSgT/XMi+URcdiccL3iSaadVG25HoFfr4+XqWw1LYiuj+2hEgqFlehK+rS/Fmu8ffcrSNtp5FNNWz/Jz9H7pG5q5tDMKmuYlBkrUmTsAa0RZgLaA9qDR7AGhWhV1xPRNfb4k/pp/+SGGh/WhxdVNhwTRy5TwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYytqci6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYytqci6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1720817f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157242; x=1780762042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5lAYdQwlZ0T0Ie+aG3ceFs/5DSYUa18LTgq9dN2ugk=;
        b=TYytqci6uT99g6pXncFSv39DifEoqHHwL6G//3XOG+IKVFQXMl85M0Q47DStqsKfY/
         tojNzRRiG3svrSvFoeXUGRWbEdYq6drz9MAAiCOp1sm9uZ4C7rndGIOyL02AFkNhRAqX
         NA83zc96/96B1d4QLk3bfeaZIzver+Q/y8UAigE4Q6VvBPsB99jl1NTBdULOaFEo1Q++
         3HCpaY+728jwLdGEauxm1CbC+pxbn4Zw4BW/e+N92cO88SCu2O6dmnIfl4l/O0oVuC1I
         YgBXGiklhzJnKUOP576aizxGsS7bwz6kz2tE+NX4BHjrDhg6tRM7m1Q3xj6BStOOZmCl
         +mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157242; x=1780762042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5lAYdQwlZ0T0Ie+aG3ceFs/5DSYUa18LTgq9dN2ugk=;
        b=gFz9xn+y8kU2wmInqI7lHcxtkstwayJU8dfSKQCcga3xeDdTatNLNaVOm9Btg1a2sK
         TwqRQPcE5XPAWtIrZXp6ddJlA083pyIIBE2Vx0VVrenhpBNKvqWoDFY9XUmzHrVHOATy
         k7m62Wt0mMBGCERQKFCPzuWDH3g/BmEjJ5uhtBu6xx1TQGcIw8JnS8/6boNDNsGjUfZS
         4enrZpmQ0vMlLzvVOBYGEH5aCyYv9npbtuaAinCOyGz5qmmk7HYV0/n+RuogTiCqkhoN
         lt1BhvA23l0ktrnI9kjqkSijoK5Hk5JlwHT6TpZfbZxpYVhRZ7IrWqfhTqZxpEi1zqt/
         DEtA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jh3LYpzuOqC4YtGUX9UvSJlyEFBiqxABQSgb7K6MUlfp4Q0QLUfdzVyd+ftazS6+4AXx+Q9Li+rrB@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBxbJPRxGBYvLRl3cqfx4j6EAZIdR+u8buOCGJAxApSWPQ3wE
	/e6oylzrS9UgWZviIyGABVaK1iqZNJaIgi6fk3OrK/7AtaUBRtonmE/A
X-Gm-Gg: Acq92OErRpc1qq7pNKQJPSL0C/I3KNsSVJUkrp7zKxPOwVduMKTAOF/unD0s5GDCPB5
	MLKUaAXAT8ZP+UY6iAqLbpmoZNk0/zXQsi6+N3rNbcqLkmtqYmT85PSpMXnk7vpGkT384+9529A
	ld58mLhJIO88QFI+mcMsI8tgYlCNSLBVsqoPoSRg9T7y2FfSo0O5GDTAltw7a6J2Of4/IoyAkXk
	MhxljSmDMoe9pBZ4rJPyVTxg0IvcLS4zcFMg0rnaMLKb8tXetvwQh5SCLYOj2KgrFxP5YiZxdWs
	2Ocsjl8XvIfN1RRtnoRprGH9IMS6WnqJFzfyWllDxQBjWZI5Zqrs0Aown4L0u4+dXvn1+fl9f3f
	KncB0/lw00a4VBGlIN4ku4fVQVlSDog2TrAfjzWR02y6fUmwtEzwhNxnGgQZsXmLBiPHgdaVsAd
	2E4EfyqzPekpSSWs7wJoR6WeZsPaE=
X-Received: by 2002:a05:6000:4b1a:b0:45e:8526:7dcb with SMTP id ffacd0b85a97d-45ef6e6cca5mr5660776f8f.7.1780157241724;
        Sat, 30 May 2026 09:07:21 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:21 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	clabbe@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Sat, 30 May 2026 17:06:45 +0100
Message-ID: <20260530160704.3453555-5-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530160704.3453555-1-dawidro@gmail.com>
References: <20260530160704.3453555-1-dawidro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the V2 cryptographic hardware accelerator
on RK3588.

On RK3588 the crypto IP sits inside the secure domain controlled by
SECURECRU, a register bank that is exclusively accessible to the
TrustZone firmware (TF-A). Linux must therefore obtain its clocks and
reset line through the ARM SCMI interface provided by the firmware
rather than mapping the CRU registers directly. Attempting direct MMIO
access to SECURECRU from the non-secure world triggers an asynchronous
bus fault.

The interrupt uses the four-cell GICv3 format as required by the RK3588
GIC node definition (the fourth cell is the CPU affinity/partition
specifier; 0 means no affinity constraint).

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..4f336741d11f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2257,6 +2257,18 @@ rng@fe378000 {
 		resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+		status = "disabled";
+	};
+
 	i2s0_8ch: i2s@fe470000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfe470000 0x0 0x1000>;
-- 
2.47.3

