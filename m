Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478831E859
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157231; cv=none; b=Hv0r0GtFHJ/fy14qfYay1+DW+M944SW0Dsj9xbhOB9MtIMEd/Vbe1md+P8m64HGL/3vITww2h5E4Il9vatWX+8rRMYAxo1P+khrAqwAxoTKh4NbsHv06dHFyWzCid2Y6rirVuACB3/68M5WdO13DZapAbyWZxZE9p0+OyOjk+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157231; c=relaxed/simple;
	bh=x95keSA+x7HJlV22Sb0gnrcSAqr9debon9ffntCuf5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGKbU9Tg/59D6wr4JMZt17MWH38jHI0c3PchTtBXXczZDVbQgQu/Rfco0e23TH6OUEGyBGY8wDaJsKO6X95loCR/4xM0F9qQaGY1PPL+EzZvpWUnJnRtzyKKMAmoeQ4b9qW0YNNLRv0PsKkMtZ3CSM1d3v461yzjbYA8y1nB4TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBqTV5GK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBqTV5GK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1720754f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157228; x=1780762028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwV4RZD2OlQ4qAGdKt6fe7VA4/9Ek4QzezWocwQhwBg=;
        b=dBqTV5GKCv6n6r/B2HTvRTIsdmDxf8YJOiSPVxh8H5bIAyhktfTx1A1dH2OO3f+2+t
         wFoAQxSMjqw/R6JiPrAYryHyHSXfHS07EDHAwpL/nW53AEhzLJtyQo5JDLitMErgJP/x
         b50hRioFlEAsV+Uy9aNlTV4l2y1Fuyql3/eUir3vRSUIS20ZA+q/M4ctCy+uEGjhEySD
         vc7NgsFuGnrryjGsH//NfHlfu1qI4ZVnGJqC5dh+iuNMVA6rUN836QoopyLaDcbO4x1d
         GBvr80ZtC+l4vmhTVg+W0JXDqMjk6BAdhhrcECMgRdOj/dCL448P/pkubIXUuhZkmUkS
         ONIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157228; x=1780762028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwV4RZD2OlQ4qAGdKt6fe7VA4/9Ek4QzezWocwQhwBg=;
        b=AeaIj4YQVSXGMeL8YgumVJ/GVlWHRGs5Z18IhB+1XFgWFTniFg8OaEKUvAm/Dh2iwn
         EXl5D/0+l0TB+hAhuuOdRusqRWP51Jqv/o4M1Jnkm+JO7yXyMjy/P8i88dTRf4+K4/qs
         2DWhrk7oaQG2aO3jE1jtmlsg5JV0Ss4JPqD//fXaHaVsnNOqF8laDzCmNPPe5p7b2fHi
         Sn58x+4apvoDaEaAiFk+M0QcHc9CATj7agI4bSuqsd63t5Dsc2B4VL7644/mGa42D3GK
         hLcD3qFzkY3Jr2pF7RPHqjpkv9uiCB84/bdEitZziozkHJBEi0re21LrFOwnWCLzCIG2
         y9HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZvxBeLh/ikN4g4bEthduLbOPsF2nKN/ZtTdhIWf3n27ajQrIKdaMsjUl6jrGxmYqjMMIFy9UgNWQt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpBfxyKOAsymTKC0ZvzB8p6D6TG+yX7zC52afcdG9Mc9Gz6eI
	j2la9EXqwkM6v6KdJALLivtMGH019LaP1y1/u43FSI/j8YR4YDMVkNSf
X-Gm-Gg: Acq92OFLcen/wRM1Yk14wHHbPfaSgp8q56u3f2QBTOenNr82m86UN5ZQFu6ff7BfmY6
	cMtfbOY+nO3AN8+DdVR8h8E7eCfoXp2T44OhOoWY02gdXH6fWAKUCcokvrPU80RjDUhtJl51X8z
	qWBqto+JtIbkOpaIoL2JUMmTfe0IoAtcqLB53up+zTtJNSycrRm5OZpAa/Qu83kRaV/bgoi6VMs
	j2SZNwv6lCqsv+jDs3+1ajDdIiB14JutfYDDJiXllqO2ZcG23WGriQaQDQIAfrIaYxCvYcTN1FN
	opqqkj3Vjar7N7qllTUL0bv5xvGYl7duWSGo9wlH/0//HLq60mguOYSeuGLW/iA4iLlsOkHJs3u
	AlwDm3CYnDE/S/rM4Qv/Lt+pscDCbRMzmE1is7ql9LvBs4uqkclB67Tv30vSyOY1wxMmoTtw/oP
	5rYpblwPsF4Bya1eyW4KugI6YqOhQ=
X-Received: by 2002:a05:6000:2213:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-45ef3b21526mr9317645f8f.3.1780157228260;
        Sat, 30 May 2026 09:07:08 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:07 -0700 (PDT)
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
Subject: [PATCH 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic
Date: Sat, 30 May 2026 17:06:41 +0100
Message-ID: <20260530160704.3453555-1-dawidro@gmail.com>
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

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>

Dawid Olesinski (4):
  dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
  crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  arm64: dts: rockchip: Add crypto node to rk356x-base
  arm64: dts: rockchip: Add crypto node to rk3588-base

 .../crypto/rockchip,rk3588-crypto.yaml        |  69 ++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  12 +
 drivers/crypto/Kconfig                        |  33 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/rockchip/Makefile              |   5 +
 drivers/crypto/rockchip/rk2_crypto.c          | 740 ++++++++++++++++++
 drivers/crypto/rockchip/rk2_crypto.h          | 243 ++++++
 drivers/crypto/rockchip/rk2_crypto_ahash.c    | 547 +++++++++++++
 drivers/crypto/rockchip/rk2_crypto_skcipher.c | 724 +++++++++++++++++
 10 files changed, 2386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.h
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_ahash.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_skcipher.c

-- 
2.47.3

