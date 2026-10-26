Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047318;
	b=oATcMXLsy6bmKIU6II57ZWy56IWWy8oiixPiYZJWQqTmq+O2oToZm6u1jE3j0xTnaqBk
	 eEj7zQ+s5oZsfWTq3T/T9oKkLN0SWB8SkWw3xrrZmhSR+RqGxVVKgHsz4eBILAaSrt4FZ
	 gPtGviiF0kpTQk1JqWNGjMjlF1Gr3Y7TUczn6B9A1F5cae1ARJM2tyzPWUQhVDvppabGW
	 8Ge2WN1r+voXaesIyKyBbzeyS2ARE+altpQ4GrB5wgwQYNsKxHMdB75iMjgSTyEUVJdoe
	 EV/h18j0tx0ZqqW6wOyw/Z/sMO+NgMunOYcdvPf8mUT9rY8Y05cMWDqsbb0ogKUjLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
	b=XeuREBi12mAVQKtEckYTIg7Upv6iZcmBB+5dOsH4L449axcXA1QqxtGurpOQj2ivANN0
	 QEmfvmu73uO97Q4EP/Z0rpaoNYwc0lLfuhzDetDuQDAaaUEZlNgTZXvihzfgPIpNJKxf6
	 WuerhbBzkMrL2GJ5ON6fZd6/9owkoleAIFC4lzWGKfk06C916JUgCXyG6Yftj9xdWgCVO
	 bFvSqJ6AVvW9budjhAqPb99Ftvvq37W1F5hIMauEhnzK4Gc2Msm82V7LhXgbCpkH6KAKB
	 YnQlZxYH41F3vYc08EY5c29OJso6Timj9l6nFUHBGRXb+/mc44fcrmHLwJxRrC4Ldvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rEy7fXB/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00252606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00252606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rEy7fXB/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16457965e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047316; x=1793652116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=rEy7fXB/Pt7EJazrVPKkjLwXrOu/w1nFxNHnJ2U7Js3gQz1L/ffv/VwagHdsoDu2nz
         RU0Zse0ypyI/6Lw0SSIDlDnC1QLx+DvpNAF+TN787T21BaHEiADAps2ytXz+7Twssvwp
         QzogKxAGxbURrUgk3EovGOhc6iWMjg9J84XrH1IG1hrMXDl3JuoThhYcdmLRCpHc4lGg
         GCL0/V7XT6phqtiDn6NOrOjeOIb3ClQAzYvCVIEoRdJnudekpnI5KFjS+FwHk7Mc5h4s
         sdVptOwAzqdq4RixHaD5DPRi+ML/lyl8gVyrWmmD/wDh4yKLLzMAYjsBImuQYpwMBDvE
         WoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047316; x=1793652116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymrp+zu7NjxynEK1uU5h0LLjRFSPZ9qIz8OvSiooZcs=;
        b=z4ZFOwpHuBijE6rW7md2F3CjgjCLIYs9oZ7TO4ozVwDKM9JpIpA0lmyraO3I1orAx1
         QYCTSva/gw3gW7WAHvxzkVxcTwxZzGpvFKeSqxfA5QXHdVRaUwvtoW/9JucCPnxp9If1
         YmEqa+gJRDBtAiwEx036/HwHHKHRFeF0apX/FewHQI6R4Mbx0pIqLPI76NhWstjh8f4q
         br1DFu13sD1KTf1UJQGVdXP/aCNGV54AsBkKlLINyT7VztmxGodwYtOLalAyZzNVb625
         BPxHl9OZLu/nZGKn0/FbUNhX5Ke+vJG0h7alrVsveDmyTQ54q6r8nZKEc9x6pVfn+F5i
         yzVA==
X-Forwarded-Encrypted: i=1; AKwUvByvSMFnClaRl5wO0MhPp9s/cIYl2G+2hFcVRKMgKgFmr9sxOOSci6SgHQrrGmDUgywuCFaP6wmdTM9Q@vger.kernel.org
X-Gm-Message-State: AFq9FYJvcVydm23WBydGIem+esXG3RwdJfj8Kkzx1eDMA7M9c2ZEvVj6
	c9bI5td2MXyNXRBR3Tm7vGWxky6qdxU+jJWPirrEsYrI8oweGUYwmCg7
X-Gm-Gg: AYBFou0Z/m66YVN3QO7LIs6PNr4+x5/YA8zFBOB0FCXeyTGp9iyA2SbMSKI7FImTpij
	R9OFRQWdtXp0s9sI4gxQkEWdS2t0bg7kmtO+pxrNC2xedDvCxcMyON2jLVplrQpCnW10CzPl9K5
	KeK8s0RtFddTdCxpT1rN1z1WTBpr/ZmzryBggtbLd1XMW1/8MAxqmhc34UmOq2bYdNFRbf0dukO
	ElVh//epGPZrvR9jXTxKbsUtisQAW4ZBoz6K6uopYiGGQS3yFhQigXirOQMBJWywsYp0K/ybgn8
	c6H/R8ApgCABG4C7dtHVtt71knYM9x/D43OwJhACm8r+0Bnoql1nh2s0jar+Evv440O2Jfox2Vu
	FYSy30GgwRNN+gtbgs1SDiqBCUXBTUCRgIQUmWLCUKaXHv5tgOUkS1gAwJlz4EwRKwQy/dVoQ/i
	PZJT7V/ZFker5qpY1pkK05A3hlIOpJHug9Fj7Q/mOqDz5m0a666TqH9beK3Y9q6Rzes9u2pD09o
	HE41wAINg80d3U71f+8Ot1rV+kK8k/AVvaL3SG4bOgSJ6/CmFS5Ayq9EDMXzOc4WtM+9qhk7rnd
	9uiyuHg7L/yvLEqOCjaG1BC/rKbi6U4JpNCFR1LeujjIcJw/UzuanTB6HEXXci+hS4fZ3/FQegH
	84ZiVrg6D5fBAqB1Y5Q+6BhhLFkYyPgENQgIlO6C1768deaUx/l5iu8YzyINH4Ix4fy2V8ySHkw
	Oc/2im
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr150264255e9.14.1793047316294;
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:55 -0700 (PDT)
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
Subject: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:52 +0100
Message-ID: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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

As with other closely related boards, such as the ODROID-X2 and the
ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
describes only the differences: the micro-USB port is peripheral only,
as there is no VBUS supply switch, there is no expansion header with
SPI, and the 3.5 mm jack is headphone only, with an on-board digital
microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available. The DTB of v3 is
identical to v2.

Changes in v3:
- Fix the line wrapping of samsung,audio-widgets (Henrik)
- Add Reviewed-by from Henrik to the dts patch
- Link to v2: https://lore.kernel.org/all/20261022055208.17746-1-pepe.schlehofer@gmail.com/

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
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

