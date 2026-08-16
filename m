Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC2389DEC
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909332; cv=none; b=jMVbX1olkWngRSK6Gi6ZLrxbNiHeQf98UXrnWJ99opD/YWhBEZyIeIo5EEqooxjcd3pue1wkDORC75x+uI9222/85zF9x41DYil5NPwEe1t9koJmIqFdnXfUfzkpW1FaaQxhXWNlgHGISaMolAtdbqAEcE803H/ftVd8CrGiZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909332; c=relaxed/simple;
	bh=JI/qso1JxH/FQGLNUw5zW6NiLHYbjT03vJnGl9qr+Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvbhLYj9q5R9Y/MC45DQkNrCd6AY3casEg8R5yd92U4P+rbz5g0Ff6Bvpw8UxJ59OxLI1zIHi5KaITjv/DLqS3X2bMGOScB1IM/uyVsLMIPRWjTTmZe3WoKxA/REyHy9D6kqz88z7a3n/VPlLJkqmehuYT8dvycc92r5Be+sVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/jAnhxg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/jAnhxg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so2428444f8f.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909329; x=1787514129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8nmwxeGtmUEsI+0IQq59S0kaD/GAoU83KLqHgNb9Mo=;
        b=k/jAnhxgxDbfttSgx/06pRLduPoqMfG5ShwFhsfqMN4CaRyS44+eWDSCa06e4fTmwD
         2jvOuvpWj6CIhc42PPboj0WvsHL9aeSHTVvIT0TADuLa/wKYofm/3Fes4DHm8euou9PI
         Gl78cSarTosJhISvPuGFyn2lhtJWH3jgIzxzmYyBA9rLcUFuur4vY/2XEeHcKoQg294i
         0IqePBbPKa+qnE/jT4R6tUa+L83nqwQhF0PxjaKG/1PB3h9T6oV6fZ6/yLRAv/rdqCbn
         QQL4TzMHMSI7BIUFkZA9Ys6kXyRf6fVsqcbtDHM2DoufCvdPiMseJCk9C/OnwhNsygCU
         1wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909329; x=1787514129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8nmwxeGtmUEsI+0IQq59S0kaD/GAoU83KLqHgNb9Mo=;
        b=jT35Ct4/zCTnJnro1tkaQlpW3F95DPOEOPl307DhHFeauFym03wt/lOvPlxKpXtK9X
         TmvIOpSH60J2J49K7Noc8tKk7XCsmBjnhFhmwHC1iG5AY2Fw3jVk9eqTiLHt/18Y+qwy
         M1wgp4pecfzvvvOZkzpGuTWKHxYEdj9k1idfdyUgYOpk7FtvsIHNHFLnfMRF8GA0n+Gb
         wtWkmbb60aU1pmhJ12nZS5b2U45kAg860MjCjbS90Ngz7UinVRwMm34Pe0rczdiSoU+1
         TlGEocuxw8aYJDouaNh3YMhE3sxATv1AAZuUNSCp/ZugF6sAvzvrd8gJC2WrChLcqnpd
         h+XQ==
X-Forwarded-Encrypted: i=1; AHgh+RrARpCMjEGR2epvgFEsYRHx300gUgocMdTFMN3I2XeGt/a2/rsG729qDPop+oGJyqnm+75uxTmaqGSK@vger.kernel.org
X-Gm-Message-State: AOJu0YysYwx9GgQDJnhWM5LA5dv8AyKYuqsAZSVS00ix2FMSDuc4BVka
	XO1rtyaJ5wKq9WhIE5ho+DyCz1BvhA9LXF72Q9lN/RD7s94LGi7Ermkz
X-Gm-Gg: AR+sD13XtjZHERA+Ikun4FyPF9hMiFgIsqMzAsp8ja6hexxMBlpKfkHErSYHOclaS+z
	4OoM5Fz5ziA1iSYuNI0nv8whl9y5+6DqgJ+Yaw+fjkk4RPIbv2JS9Sv0UUVo2EMsgw8dahVjqtP
	iuXqbcLEuQt52yH3ywTfIUoX/pOorma6vCsxsg0Zb56B2o+IgPaTTZV56QwkZc0t+PMvqvBRHKZ
	1GQCNGX+ER6hcI5ZuNuRJPg0ZnMTS1PT+6jQAMXXf+aUh2tfAHuMQn5QORLxYeS7PsVGgfVM9my
	Ddp9Jmsxom5LsNFweoGVDzrz/e8hnJJCRdvhpfVxgfnFzQ7y1Q1R0WRYSz93bv/yqHqCOwNWt2E
	VjrrQ2RsN/3xMJApB+Ki5jGA4MxZqbQzzbcRshAk2MQ0/b35V3XkzR6oGs1Vjxesz25FJbOQ4HT
	Ze+UfArIus4+d0gKMEwITesC+IWoXCjt328QCtG5c/qijNpyhfTYjccQ==
X-Received: by 2002:a05:600c:3596:b0:499:8ed2:8234 with SMTP id 5b1f17b1804b1-4998ed286c1mr202943995e9.0.1786909328685;
        Sun, 16 Aug 2026 12:42:08 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:08 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Sun, 16 Aug 2026 20:39:46 +0100
Message-ID: <20260816194112.552100-4-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816194112.552100-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the V2 cryptographic hardware accelerator
on RK356x SoCs (RK3566, RK3568).

The IP block sits in the non-secure peripheral domain. Its three clocks
(core, aclk, hclk) and reset line are accessible directly through the
main non-secure CRU, so no firmware intermediary is required.

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b7754b..8b88d6de18c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1111,6 +1111,17 @@ sdhci: mmc@fe310000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe380000 {
+		compatible = "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe380000 0x0 0x2000>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
+			 <&cru HCLK_CRYPTO_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&cru SRST_CRYPTO_NS_CORE>;
+		reset-names = "core";
+	};
+
 	/*
 	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
 	 * low quality of random data, so the HWRNG isn't enabled for all RK356x
-- 
2.47.3

