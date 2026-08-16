Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60E397936
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909335; cv=none; b=COZzq3U6zYRGOwvH8Ca2NXck7+fVnWjZBHZxKBm00yH6TnxIm9jw52Gq/6HEnA1tN+pZl9FF6CoVBllOnMCKF2je3d/bnYol//RYVnu4ZgmEleC3tp4yHijLv7xwLMsjkVLAiryiMWK8lsZF+m3pNq8ZPu4hTQSnBCFieHK57jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909335; c=relaxed/simple;
	bh=wVdUk0o7gnQOIfexBtZKXRGOa/Fc/zJYyyAIenHMGBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXKSqNTalx/xyEsD4tQ9WFOGOUzZ3DKyi1b5GDLi+WVWQguf1+7LSiGKwtE5dfspgsqVsHOe032d6vepbjcmpxaCvVaTir/06TIewyQ/nHRsKxR8hw+0XcP+T0zlkZRutvLqdsZBgheZ3fZNZTURmblL2+optVLniKZIw0m3VXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnoCnHZU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnoCnHZU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d29264cso13062425e9.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909331; x=1787514131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saCtLctEFieimkjt5839av7kQUg1qO8hSvOYlxjvmVA=;
        b=GnoCnHZUwF97OkcGVovPFsK0YzptRRwKd7K+Fiugz2EdW9rXcyjEtyTbbBSUCmfwz1
         XT9qWaT9jV/S2PD1zaS0VQtijkJ3x7LVVvORwnJxut2vAQM6BQ1EqyVVOrkSKT44Ot/A
         Of/uziNSGUAahZtDSjAU/CR2tdglDLR4jkp4IwbBDP6+zkS+RghNXLeBQFuZQtlgj6gE
         iakuRhyuq//GDKwcZf6usXKffxLWaBje+HwScs0k+A8LyoTg0KAtAm84tS1wSv+M3Pta
         HIQD+KWODJ3A6nvRwODSO55tIaNK35bwXCFo+aW43ZwwiMb78+xUdlf6dcOmHSyoCHdN
         OLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909331; x=1787514131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saCtLctEFieimkjt5839av7kQUg1qO8hSvOYlxjvmVA=;
        b=bZYFzgLMDWpd9NnbOCL0OGobwzU9Z61JvNBcFPCHI8qi5+qP0hK285CKh3ReZ4QSOF
         iGLAIVhyK9380wPRpHtUaSFQ1foCzHy7VvLecx6+3Wdiorx3BSpDeSLYqM+Jo1VRxc1T
         So4t3fqhtwGmxZ5ovzY/wX1q22O1hMeArFT0YycdqevOkHfV5foJkshtNcUgMPnfollE
         +VzCMySbePPX3PzLe965sItJMFxQ2FLTflYlKtIhd8ziMa4oBsElqW0oUVg4MWvP8UNf
         5EpgrA3ygUGJ03GHDljpos9fNkHhPCdifM7C0WAAx4jOKDEAuN18FTqkR4uxXj2R1cBz
         ZoSg==
X-Forwarded-Encrypted: i=1; AHgh+RoC3GmA33hNwj8hq/y7iMvsCbOUE/kHaKg3i/VcpIG9ShavIG3hf+/SZGrL5K8+jquM4DpAhnWQYjEh@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEbwfhzEUYlkbDDJ6Cg5FXPi5KCWqWQGhYsp0PcEh4QrnPZ+d
	pHIObq94JSEil51PjbT/qtwWG2NDYk7cnxWNNkdUOGW4U6gBzGRWkD8Y
X-Gm-Gg: AR+sD12maEXa0p/ssTHkxzM+HQByT2pjQd//fVePzyTBmHOeT90ZBsdXdjMKrMJTUD6
	0c7RGFD/2373oLuc5qbEtu1SSu2RsD9eOIlW+03Zpts6VXVG9K+sQBT/yPRwnBk18EtcUAN2iUn
	Ox+CVi4+ey3BLMMQ4p3qgtziWDwe4WIdMOodwcOj2TCWaaQ+mVJqsjuhPonRjY0qpwXL3V3nXnU
	nwHYVSaP255RwBhTY96UVzw7B/2TfY3YAcX90226D6FQiZEZj1lOY1z17vcFVGwyOZ5hIpPTXsJ
	W25ag/lMYt6Wy+enLuXGGIgTuS59hATOMPWK5obEaFc3jkVpPHhMaPwxfYzreKEv2a45hfTi22w
	o2DS0enRTsSIQCOUm1to0CUheKvH7c2y2xM1WmWnhngjvS/2K5egQHcgvgoB5gq1k15ZfbpsQ0A
	NDeae6kk29ozEYqxeH91Fddk+nnZ/Rz4pGjbIrwZatXXnjoI+dFX7sdg==
X-Received: by 2002:a05:600c:4754:b0:499:7e2b:8e5 with SMTP id 5b1f17b1804b1-4999a2f9ec3mr21366645e9.5.1786909331392;
        Sun, 16 Aug 2026 12:42:11 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:10 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Sun, 16 Aug 2026 20:39:47 +0100
Message-ID: <20260816194112.552100-5-dawidro@gmail.com>
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

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..980c345a5de0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2249,6 +2249,17 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+	};
+
 	rng@fe378000 {
 		compatible = "rockchip,rk3588-rng";
 		reg = <0x0 0xfe378000 0x0 0x200>;
-- 
2.47.3

