Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648333;
	b=z2kvIKqHJcRZ2JGipkfXij9dfK+fANKEhdLNPRRAfQB6HuGcR8YLEk1adKhyOE0ZAj1r
	 dlJdTeE0cISweDNMbYTZMwXzFB8f7epuO+lams8BrqD9XRfnRUp1eXqh2Yxs9tS3FZSlJ
	 ZzrIi1g2DtuAjtc7nXEm5eTRG74G+D1sWe8j8kpjN4AQej3gykacW4Nz9FWrN3reSBqcH
	 ZCyZ312LE6Zyh/9gyiRD8c6OvrO6dhdDPCNUGMgElUkoIhjsoNUOzfFwDlfpS7XmxeR0C
	 AA4XjwdY3OFvLCftUamzdDTsZBJ86gn/fNwJcMjwD2/8Zr9i48cLYezDEOJqQKz5LKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
	b=3TSv1GE0p5lIK/8e5pPdfOQvubtiYCDGcTmkZ+q/BOBtKvKX+vPtfZJh2BHqRua9crdq
	 J+DSFHsk+yofYn8jOzqfYHb5bUAsHunrGhEd90d44lf2LWPdCrvq37agXaA/r6vMHjduU
	 C/QzmrISIG3k4fbxFFIPOJB2zzS8h3QCo38qQNfqXHVrqg0sLv5cj23m75KFhBFRFvQrF
	 lIrQVYI0X2KobPPYQU6WsiuKb6MPHKyU8+J7nBHnS0l0hDXSeREfVg3LSwJL8k8Ood9wt
	 kz8EgPfYaMEFWD51uEGUjuYQu1DUPM7vi24AoQQVxk+cVk6exJLtMVrP05bFaVrPO7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908F606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5908F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso1842905e9.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648332; x=1793253132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=I6z+2ZtJyElO0G4znh79MonwNy9aQb4oBy3+qS7jn+iBMoi60vxjfYGFWTG+1qPBDy
         oZvzN6qu4lX1wu98RPB/cLf87ioHqodcdNM7jMSWKpw1eaUbfMa2vxxno9Txh9Ae08i+
         zaCGLpbcSl1aVD+qDNNNxL/pIDKAa16YdhNzlk3U9w0gkl7xxj5x7VOCIyDSJ1hb5u5t
         LXOBLDg3ygAtmfMpIDOWeR6ootfSjPEwW1HxZSVivOHN9IvCxj1sOOKpO51qKgTMX4ZE
         paXzF54WrKdZJ5dkg0SsfKsoF6Bj+zKrV2Cw5KFi3a3AM6Az5hWwoeYWJdypBs3wZLuZ
         lsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648332; x=1793253132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=CRbknmGRh29Jam0YwcFR260KA+HntD2vbBZ3BOe/WUURKgEqWK/w/qczExvqjY3vCt
         n7TTdg/okRHuGNZSqlqNr5B4ttva734ixB5cR+xAmS00Jy6U0zD978bkghmjdFAneXfl
         MNAO2IZK5oqXA7C3OW3HNKK9qklhHtQplXy/d8FzpWARALVcVzIe8Rh6UB15J3IzAfn7
         pmd3kYCXlZNEdptVmIphtmk/tN8U9Sv6tlEFPK6HPpyUSlEHSbWf1vuy7EKaiKrvgp4z
         FH20wGKJ6pKuGhMguxeSuoXZKdCsy9ObTG++6K5X9+j7V6eJqhOMN/eLDXUKQpXrpC8m
         UnZg==
X-Forwarded-Encrypted: i=1; AKwUvBwAr9FY8Xl98xC23sY6J9c3IqgqFit0FWAeHCTNgtPlfKtj96krgwGIOiBRFi4+VoDBrwioqWJu1icn@vger.kernel.org
X-Gm-Message-State: AFq9FYKvxgmEwyXlvPt9sosL5TOGPdU/lbazEUZtwVbIImuCdBQ4PLad
	znVYgzL9mE406Ce8NeiIX1jBYAzb/jMjN0svsy9bioZQThwia8gO4IG3
X-Gm-Gg: AYBFou0VtGR1eLWA1rGSwM9FvWxrZ5DOhm+fONTZL+xxe3/4QCCWfR/2V8A2JAMXl7O
	LTBtdYOZkSOBqnXsa11lnnWL+Bna//iSW88wFK9C3n+ApJ2Nu71qu3MSEAYly1pxtTUL3PdgVLp
	c7GSH0JQKYMRyPAHnzwD0Hw15y2sD6bm01+03aWNl+63IHFdwPJyRwQGi4SkQtGovwrIiArA9t3
	Vr6kVMJoaP4CaLRKjPJo3Sj/EIjpQsX4WGgL944JKqhg7iKKSnmkai4Ra7BlrBWlfNM6/jiUY+A
	WZnW1XaCfwf+fHM+7aJKGCGdCDz9TOLNcHVGfVVFlhEmfUnDgeupTmiuR4B1mHmeY8C3oYKVcKY
	Es2t9t7LIqZUGdPpZz8jrf/J6sazA12b7NUMDtaxcbHFarJPHPNXkR61/z+OLVdBCj1YC/VgI/2
	W04lEXA00gcK3ZEZdebPbHzD9bVokkh4esTgNoTRxHRxVw5rZqoZzrOhW/mYPCuiNOkfjlyIXcR
	AMiuetckJySKgVh+bCsUeLZg2Xi39fAxnbwfVXhpCpvsIDfeDJBAoAa4Xo2Hc77D0EeLTqq8X8b
	Af1hmmx8U7Td4y9UMDNz+b1+U3u7G+nD3WUR0JPeU3Q9GXxykKLEa+M1+z3xUoP5xSebKknZzfd
	jEQ9zrcYHrNbAfFecrO1VZlj5pICJGJM+FotGBO8ftDoBjjgoi6I59BxCJG7Ppu/b2ot4AhD1l1
	6W0JC2
X-Received: by 2002:a05:600c:6748:b0:4a2:1a:a122 with SMTP id 5b1f17b1804b1-4a2001aa387mr72903845e9.9.1792648331473;
        Wed, 21 Oct 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:10 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:06 +0200
Message-ID: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

v2 is reworked: as with other closely related boards, such as the
ODROID-X2 and the ODROID-X, the ODROID-U2 device tree now includes the
ODROID-U3 one and describes only the differences: the micro-USB port
is peripheral only, as there is no VBUS supply switch, there is no
expansion header with SPI, and the 3.5 mm jack is headphone only, with
an on-board digital microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available.

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

