Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880687;
	b=Y4/L5BbYv6dKwZEX6jJ9MioI6jSloR6K3QmNaXwKwLKmafbn/IHWRn9SDEKvfcZocmVv
	 rkOvennjs6/XWWh9lhVPUIrNsNMXahZz6o3Cx7aKLKahf7h0730i+4kiYNRgvLw1b+EXW
	 M9SfJevCJayPQFb+YpTH8pkQA1SdhUnH/qnOsTj1omAV7/GMeIOnoRZiuDgniY5HIivkp
	 KMUGoBIhK6jMUJL4BQF+bVDZLU/q9Mi/uwGKvyVksJ1fi9le+s7vHjZylpDgPCPIeJ1Ma
	 HWBb/JfneimGMzWzHnAqzcw/TQIl5bnmY2tlExNZSYU+VI4MkKqXYAxcEQn9Qy/x4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
	b=cEuJsMbHU27aVZi3Tvb87tUxMOZBOJc9sVArT1+chzsNtisEucUuc1n83vuoEjOHvTCO
	 KlcpVgX9j8eQX7ockC3Gt53oSjiJzvoXAwmVoNZ5OCsTeA/FWed9OymdQzvQpUTxf04wy
	 YMzSi6BJj0cjZWYyyMIevQm0e9koQ6f9YWkx9iP5S1u7VCctU2KBBGhYcntdq98BpE/PQ
	 0hYsbMNWKksj1ubOu6I/T7Ly5XU42QB5/c/YpLIPqO8qfxaZGuPvdopOUPVcjHYPmlg4o
	 K9ggI+w85ZLyISSyBsVMyjPwwtHgVkcQfnHux80qXyUzaB3KnbCaqTBdNZ+0ViplG0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VEn26V/p";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D7606EE90
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B55D7606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VEn26V/p
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12685775e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880685; x=1794485485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=VEn26V/p8NYKFjB6iovnRMzQb5XBCGJfH1f7fzdCf1fyjdKd+EI/7GGp9Q2IluxPS9
         XjquYP1XiVth52a9Xe3nW2R8vZ87a/Mm1bgbEd7a0P0WlqgRNKOLdFSgnC9qm6iNS5Hx
         XfRM6cf3gdCv6DLJJ4Pwbd008COZ5BoH03HTts0GjLBxequGn4OnLaYkE4vW+jBn+cs9
         hrWYU8NkgMZo6NUbu8FhM2Uo8F2hOjksf23LsDuj9q9WdRgukZ3qbWEby/SbVXNcNzgL
         ud5zTlb6+hxsDrKj0nQymAPSplNGD27T/w2x+bfPG/Eg61dpkuAmqJ3ggUzDMNX8i3H8
         Oj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880685; x=1794485485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oU3a7xXmURYifUlGxPa33qdnIX73vZnsxZLBFb+NsI8=;
        b=ay4UH8PtrSDYLaVzjDaW0ztScCY/4fon1LOgYGo6Lv2mBWywt47F+1yWOhUgRMPfcV
         +/BFUQhi8J5Cq1qkHG8T2Z+G95Hv70DnVK/oWRy/l0YpxBrJEU/sgM2f0b65i1WmDuZf
         6zWFL2PnS/nziWcBW8vYSSqBMQemEeXJ8N3q643IRGsF0uGnsk6t9pa8jGO9imGOg1Cv
         Q5WrhuyhNFu4M91mgmnTx/nsgYAcA+JcfpDiZL94Q88DNeOIP0uwWGqHxmr5AMhF3KGY
         6Y+l47g2BRikD3uCQilVAey14gzpPIWNX1YN9970qiC7pvrJ/HiXNlmUse33xyOFjG7J
         4S8w==
X-Forwarded-Encrypted: i=1; AKwUvBwgetiEBqoFreNxzG2/HiuNVgV4YGqcv4GoMAGzk3hDPcEunbpioYcmp1SHExJLUaPqNFZEZ2EvJj3b@vger.kernel.org
X-Gm-Message-State: APuU4Z8lKVSvfZcIQAdSMCmNr4/+9fTtvALHItjJYoSjZalfAJNhyRmo
	/tGXDYfmeVdu3Rn1x1+4WsnXEnVXGBAdpiCS6x0+IGDvVmKmY3xbxINV
X-Gm-Gg: AYBFou2JcsS4dtvEvouF+NklYIL7T6PmW2T9NNPNsM0yWfvwU51+ZPB7NCI0ajEGaS1
	oMiH8dJYDAf3RMqMFpNrOJzhpOIre/bENo4ScPcjxmR98nYyhjy0+d8omftAFXxFUE1xgybB1/P
	7CsBZpthbu8HXJoLlpJFlnJQ3QKJLmy6K0H4WnIw/3iSK8VlHPs4aqd9b8WKURP5/ABHrYgWiCY
	GQ1CQERuYNY5cxl1CPOkLLlnnTWojKUc+YFJ+0mTmTP7ITVGJ3bW3FWpYZBK9OqQtoWhbKBC75V
	PiKN8meHi31RuaeDhvXYCr1ND9SnRpyRpfPw6/8FvVdEYAJ5kkhZQQe9ynnv9Ry+NKPx1tRVSP1
	Mi3fQ7uFKNannxEou/9sdre1r0+eOSaIbyW/a2BTyN4NWUKqU5cHHDYzZFbPBT4OQEbnqPgOZZN
	XUIAtFPTexkbO6H+rGIae13wL6FT/Cxk2Ej6L90e2r3PiAPVwqlOR/woFx7gQdrsu5fQCLydb2O
	ycVyyGaTGL7O8ugX7ssvX4xJVGp6hkOMH3lzHxxceL16WUSJ0wXWaXyXC4fvpwpkd0B5tRPGhQs
	es/X9A8xkJoVjHWak+RUSySnx8KqGXK4rymsiG4y0XrlSoQBiL377KsHRk2561kF6mPaWOfDO87
	SQKwupjPRSNqK18+K7wc4B2KE
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr442431325e9.2.1793880684946;
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 0/5] clk: add support for Airoha AN7583 clock
Date: Thu,  5 Nov 2026 13:10:53 +0100
Message-ID: <20261105121059.11201-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 332 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 418 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

