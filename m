Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621A3BB109
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533539; cv=none; b=l3Gl1jUCnL620c8BMeZ6zK9znv6k0Dq62A1ph5NomL10fVbWBO70LGPxpt3d+wIUckDnAS1cisl9/1YPRa7cR7P2seyyh0MEmxpqNlgUiZORyRkBLn8GpXywedToKsFQk2JIssRofh/mTngOdFXCGZOZO1etxNU+u58RvOJLkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533539; c=relaxed/simple;
	bh=Dx/U1QTn3apYjRiz0yi9z250wQK129Fy+tAB/HadHMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qmC8mUtnNpbBGlJXWcpN89AHh3O/BDP0ZnNKX48O4mrzcgCkJ37s4Dkxd6G+9TRF71k3PmMTn1KaGdHF/qqg55QsYW9Z51Fg0XIJHxq5krqIl06krfdCmKPwRZaRNVf/DcgChX1OpvtbVDpZ6Ee20GHZ/v3DTGAwJOmbdi+BsUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy+f3Yfu; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy+f3Yfu"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so37737a12.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533536; x=1784138336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQO7OwEt2ayLBwYgGRVhBYGfbjzxMLDxfhpK0SkwD/o=;
        b=Zy+f3Yfu/N/8tVVS/2aEcVR1GVrcbS53CCvzgs1q63rWItqT8wU9J7alx81f6xSTGQ
         GtGMG+0cawyOmWcG8diitYzhCGQYBmTeglh3kt/DyElNScC/S1bw5oXQzjYp59uVEUYq
         v73b+F2ijHYp9/KHfM+iTXJp8h3APA/O4VCbr5cTUm3bsBAQksH2FDRUycRvSD2V9CJ/
         HR633lucUQO8CtFojS48UlEE/Ud4YLF3vGb19tQaUuQ+jjeJIQRYYQk6RcDuLOHujyYr
         fQ/TxujbhbdWK8whc2VHRFEBd3jLYPsAC/0i8yi0C9Z4pqOwxTlK1lpkUAGSoZ8Fy0mG
         HJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533536; x=1784138336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQO7OwEt2ayLBwYgGRVhBYGfbjzxMLDxfhpK0SkwD/o=;
        b=nWDwdImHIKl/iGEOjYJRjCA4O2FUorCcyXT5PAnx/Q11MQV44Jf6LCuGWoymEk0UNX
         TcAU0Xv0g/p8Amj7YDqptcefkmlg5t8LBxI+trIO6zfKUX3CYtCTyZR+bHqQlOK2SmMc
         CB2WO1swhsEJD09GlHLNK5M8ElK5tZwCN+Iedkyu4hAW7MuWHbQB7TJvr1mE1m7F26bk
         8Gfreb3qFpcfoWGjqgnnLBhWQCkoJI3l0Np5ExBG2TpOK2HulcaXQRCPK1J8zNAWgaGu
         7sUiUBkWN4/GTJkALxJejw7gTFjAnchihYKLcAnt1z/VZAXqOsQwS5O1BNLvxsFDNNXZ
         S9ZA==
X-Forwarded-Encrypted: i=1; AHgh+RoH0zf/cBBHZTdGAoVxSaCmSMigAgMN05+ON6VsxCbxxpLQdYYaWL7LB9h8xLroGgjxgI80MUURno1A@vger.kernel.org
X-Gm-Message-State: AOJu0YwalLoVdBI3iP6+ti2r+q3P4vI2TyNxgsjMCT/4bKCViSWFEDb/
	Z/Gb/NGlYOT6K9S7NMGYNeWLaLNmottoCMbyflMpCwXTWiR5grik47hN
X-Gm-Gg: AfdE7cnKdD1Y3tc7usBAypyDN3oSkGlNp/qIBS5w4KWE6m3wgkyXZgM14EWxruHOPrD
	Nz3BQlWwtklzqGR4bYPl/cfffh8sevntClwi6Hl1DNj8gPQK3PNMZfDfTirTJQCBvLUySKJCRhi
	ryt23024+J9vRtcc95dgz0Hw9m840QQ82KZ28z0ZPf28257Y76Wv5sCATDAThAb6cx3lp8kPsF5
	qz8vhs5jn7o6CKkCg5OXSu7uZJiAbOVgqe0tFiBJTpNGIQ3pHLdVZTNZo93jMJ2bMB3cimS8TXz
	2fAn7cwG2Pt0EnXo8gj5tGgyP8FjYmi9EgCaCKQyXkvrZVEbScWjM40TqImmjHPthxb7+Kzn6il
	tIO0ewffcLXkp5I6wXJEQvmwsQTV//BYj8NRh4Q0/Hks4P9+Yv3Q14wwCsWW31TvvanebmMctFS
	oSFidV0g==
X-Received: by 2002:a17:906:4fce:b0:c12:5e26:da50 with SMTP id a640c23a62f3a-c15ce14c65bmr157380766b.65.1783533535639;
        Wed, 08 Jul 2026 10:58:55 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:58:55 -0700 (PDT)
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
Subject: [PATCH v2 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader
Date: Wed,  8 Jul 2026 18:58:21 +0100
Message-ID: <20260708175837.1718437-1-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the second-generation (V2) Rockchip
cryptographic hardware accelerator found on RK3568 and RK3588 SoCs.

The IP block provides AES (ECB, CBC, XTS) and hash (SHA-1, SHA-256,
SHA-384, SHA-512, MD5, SM3) offload via an LLI-based DMA engine.

The series is ordered as required: binding first, then driver, then
the two DTS nodes that reference the binding.

A prerequisite patch removing SECURECRU reset definitions from the
non-secure CRU driver is sent separately to the clk/reset tree, as it
touches a different subsystem. That patch is not a hard dependency for
the driver to build or load, but it is needed for correctness on RK3588:
those register offsets map into TrustZone-protected MMIO and must not be
accessed directly by Linux.

This work started from unmerged patches by Corentin Labbe
<clabbe@baylibre.com> posted at:
https://patchew.org/linux/20231107155532.3747113-1-clabbe@baylibre.com/

The implementation has been substantially reworked. Notable changes from
Corentin's original series:
  - DMA descriptor race condition and DMA mapping leak on timeout fixed
  - Per-device algorithm copy replaces global device list, removing a
    locking bottleneck and correctly supporting multiple instances
  - Runtime PM autosuspend added; clocks and reset gated between requests
  - Multi-SG hash requests routed to software fallback (hardware padding
    engine requires total message length upfront and cannot maintain
    state across LLI boundaries)
  - Hardware interrupt enable register write corrected to use the
    HIWORD_UPDATE mask that the hardware requires
  - Software fallback for all registered algorithms; statesize promotion
    for export/import compatibility with ARM Crypto Extensions drivers
  - SCMI reset and clock references in DTS corrected for RK3588

Tested on Orange Pi 5 Pro (RK3588S). All nine algorithm selftests pass.
AES-CBC throughput measured at ~100 MiB/s with cryptsetup. PM
autosuspend/resume verified over 1000 consecutive hash requests with no
errors. 20 modprobe/rmmod cycles produce no DMA coherent memory leaks.

Patch series for the crypto subsystem:
  [1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine
  binding
  [2/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  [3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
  [4/4] arm64: dts: rockchip: Add crypto node to rk3588-base

Separate patch for clk/reset tree:
  clk: rockchip: rk3588: Remove SECURECRU reset definitions

Changes in v2:
 - dt-bindings: wrap example in a bus node with #address/#size-cells = 2
   and add the SCMI clock/reset dt-binding includes so dt_binding_check
   passes (Rob Herring / Krzysztof Kozlowski review).
 - crypto: fix Kconfig to select CRYPTO_SM3 instead of the non-existent
   CRYPTO_SM3_GENERIC.
 - crypto: drop IRQF_SHARED (the line is dedicated) and request the IRQ
   only after clocks are enabled and the completion is initialised;
   reorder probe accordingly.
 - crypto: set a 32-bit DMA mask before allocating the descriptor table.
 - crypto: suspend the device explicitly on removal before disabling
   runtime PM to avoid leaking clocks.
 - crypto: call synchronize_irq() on the DMA timeout paths to close a
   race with delayed interrupts.
 - crypto: convert fallback statistics to atomic_long_t.
 - crypto: use cpu_to_le32() for all LLI descriptor fields (big-endian
   correctness).
 - crypto: read key/IV with get_unaligned_be32() to fix an alignment
   fault and a big-endian double-swap.
 - crypto: fix the CBC/XTS IV backup offset to use the processed length
   instead of the scatterlist capacity.
 - arm64: dts: rk356x: move the crypto node into unit-address order.

v1: https://patchwork.kernel.org/project/devicetree/cover/20260530160704.3453555-1-dawidro@gmail.com/

Build/rebase fixes (not from review):
 - crypto: use sizeof(struct sm3_ctx) for the SM3 statesize, as
   struct sm3_state was removed by the lib/crypto SM3 conversion.
 - crypto: add the missing SHA-224 zero-message case.

Dawid Olesinski (4):
  dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
  crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  arm64: dts: rockchip: Add crypto node to rk356x-base
  arm64: dts: rockchip: Add crypto node to rk3588-base

 .../crypto/rockchip,rk3588-crypto.yaml        |  75 ++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  12 +
 drivers/crypto/Kconfig                        |  32 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/rockchip/Makefile              |   5 +
 drivers/crypto/rockchip/rk2_crypto.c          | 746 ++++++++++++++++++
 drivers/crypto/rockchip/rk2_crypto.h          | 249 ++++++
 drivers/crypto/rockchip/rk2_crypto_ahash.c    | 565 +++++++++++++
 drivers/crypto/rockchip/rk2_crypto_skcipher.c | 728 +++++++++++++++++
 10 files changed, 2425 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.h
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_ahash.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_skcipher.c

-- 
2.47.3

