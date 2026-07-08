Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6EB43713C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533554; cv=none; b=lC4hRA/f019LaGWHvyL/VYiAkKq+9GTEIoqOE6asuJtUxxN/wb1KshcDhTlf11TpU4/83Y4N9gS9cVt6HqI6zQj/w44L5Xe6NYpjSDsy/jxCX42Aiuo36xp2F3FTBblhekgKGyrCeEXLf46UW0/+yFFI5OE5blYS496OnW0I6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533554; c=relaxed/simple;
	bh=kBDjEzQ80kgpn8wJAREQLaXT5HdibWwvuZRJylSEIBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zz5jHI8w2zI65NJmKlZB7FW/dB0FtQQtve904eq1NGZsc1Wy1DvaTWSBOzepzk9xlBt5TPCOALdVRAFlkiErAmkdP/tZit1v3H31oaLErcmWiGoQ8NWKiYgNgYI5/RPllgOR/6p6HQ2D6GLPMWudfKaUHZ+a/aaMq7g8qcNFEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLqYK+Fx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLqYK+Fx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c126e47a82cso126833866b.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533552; x=1784138352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa+hq1ddPX1RzBXoQyE6BmGgQ/wGb1XIxI/SPhDUhIA=;
        b=NLqYK+FxxhKI3Ept5cV/2oaeL7lvywevLOCb7ZxMk9aRRKRzlPoPPMwY2SK18LNKEy
         XKRPu37fICoBPkgK1e4pTBiM0DfW1V+i+B44JAlHboWWNBHDXmZjAgPCbcjfISkwMTgL
         8NBCsXEkV9m6OeNARyq186dDRDSjDFAUBAPobIr8vmenFb60ggR/iUWOumKu8YmHy56p
         CCgqOhBjZ+BAxG7RfjlvP7+YfeExv/1UnOvT/5pZdL6S8JLSzB15pGroY8ASM05W55BY
         +ec5nlGNGAWI9SZ4wv/lx6bt4UeoUDjwgsslLFv+MEjfsLtdixcDkpHk1wXXu7rYmkfc
         +bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533552; x=1784138352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa+hq1ddPX1RzBXoQyE6BmGgQ/wGb1XIxI/SPhDUhIA=;
        b=bhcBDa77boRlKDor3PQ6chumjXqJawyismb8i+VjRoizbUDPlrfCqUiDEI6zGGMf/F
         M5ywLMZxi7c350QvQzCaWAbPgWSPxYVAWCzQxDcqpBmSdenf+seZMqrS/SjsHkGdeddg
         /MI0kZ4YPS1iNStkIINhf4YReDVvPV5q5mYD0WwuVws/n8K8lt5BFKjKtf/fd5k5T8Ld
         J8t21bpSNKl7eLnzGFZSaHYiOVc7tnNVXyic35fsHG/Lo4hy+9zpOidLTDrzM2WBxSMI
         WF+rMk3bZJLrg3dHnWcd5k5hQhoYdfxcLuwZOQ0COHIVYxjjIip19CRtFPmiQsdmFit8
         gFzw==
X-Forwarded-Encrypted: i=1; AHgh+RrVN7G3JSz97/xAf5WnlTcLsQShgx1WkHO85MtFZkq7Rb2mvegQWv2qfOgDUOhVsboONXNb5Mh/od4b@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgLqpQ8V5zXLWdsI01jaLN+ksSR9dYydXvBuWTzW1O6FkNzi7
	fLZ3l9j5CSLcuuQDpD0BYzoEivfpHwpZ58QxwHoZhDEJAVEOhLQkNI8K
X-Gm-Gg: AfdE7cnoeBu007nse9qCqtfIZ4Oa/DHNpX9Egwlf4BD68YrgVKiqIq/9lEs+nRRYbdw
	vXsxLc0I4BozVKqaYgrPGJhyLuaqtdIgByPNFocpdWbMYVCRNp/nOX5ue8Sj36dbGJLYYBHuU6h
	Ak1slUDzNvGR94grfcif4es6oSeM7/0iiw6A65lEwDy/2Poprrzqeqp5GIiYmVoOwxjBotS/5B8
	whCxE6uj2Z+Cge96qsvdtoAJSSwSY3S7kl5c7B1x1yj4qUBwnGnWkuO7fi19ZByLkYJH8wAMAuR
	5kxNKubsZ1l0Mb9cO17NZUTKfXhlWNHY8xUIa5EGBcCPOEIarB+LoEKTMHEwSmf8RxnUAm+y/t3
	ewp0uX0tdyPn1aE95D/T4Ok3tJ6ZUA+wrur4lfErf49b3w4ng1/3rnqdwDUOH+9avp42zIAvktU
	lOn1FBKw==
X-Received: by 2002:a17:907:9406:b0:c12:6a72:5882 with SMTP id a640c23a62f3a-c15cde71af8mr169523166b.5.1783533551631;
        Wed, 08 Jul 2026 10:59:11 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:59:11 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Wed,  8 Jul 2026 18:58:24 +0100
Message-ID: <20260708175837.1718437-4-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
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

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..9de7e7487ca1 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1112,6 +1112,18 @@ sdhci: mmc@fe310000 {
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
+		status = "disabled";
+	};
+
 	/*
 	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
 	 * low quality of random data, so the HWRNG isn't enabled for all RK356x
-- 
2.47.3

