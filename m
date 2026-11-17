Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939893;
	b=ec7d44ccBLSuhOhLmiZERBmgKJ3LE3J5d4jgYoVs2DlshDoh1ajEIY2rVupdlemy27cf
	 6Lv3As2a5DgYSxo9DR6pz+NanJj8VNl1NGw1MJ5GLcEJ8ofWnWnfB2eGSK3dLSMfmxgDl
	 UlvqkeME12HzFoeyNVcpfhBR4YeTGxQf/iV5SR8IhKob8VDCu0vnpXVn4pqOLuXWblOCC
	 Aa8Z6crYi5zN3/fxcKrtXBd6xNP2K5Drt0FmutgLrYAE/ZjU7RQzkamFWBHJwJh7RQdr6
	 fnXHcgkby+MNKa0Swbl5pMEUpMcp1STLLLc2KrWFnroKSvYUwqOoNl9PrGBuAddlEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
	b=zPAk7Xi4e0o799teSupNo0DZuY2toEhCSE1ktO50iwCclyFz+KgviSnCCMaAB8lyqwRW
	 TR+94f1mBHUYctEkWY+Sglwn/Wr1SvSbdl4dPA0qwZY3cQtXhlwnRrT1H+heJF6k9pEEG
	 Wpg2vDNOyQW6tbF00JgXsSgiONZob5/qLvaxxiOzHtF2tAP7iTS5bQkW2ukIK4kGSqWPz
	 +Sv2lKdLgIkOC5xfyNelg1WYbjhhBoD/qK0woHoOg7r71tPnbxdr6Y1MWW1kES2QToghq
	 sA1W/n9RIHuuCGwNOyc8DH+/Qfi6HBJ7666FWvErVOV84dNsdw3AuW3PSK5DOMwQuVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5F606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA5F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49465892f7bso55199f8f.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939891; x=1795544691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=l5HW2ZWgz9xyPWgg0S1tlLErSqqC51e8iDSks1fsTDM6TtJ3AY04ouoT/b82UUrqcY
         qhFwBtzg0GoL915Xzvb4eLZD0pzQKVXkBVCukTzSO7QlnAnDjm0DLKhA37Sg6QlvnAew
         jMnTFjY9w1UkCudAocf7xPLcHZmx9J+WexCLQYhdptzuaroFwxhr5njiOdgczPwbtx9p
         Yir7TVHCMFUadSJZboQNtP62fa55acdCfzPSMWgJJNb4bMjvCohr7yRIyyHuF3uQwWuL
         yGjPMmxXnjtQysvqAXAtrcUkF3RBkzRLxs+JEF+PObX5L3xMZ1KleKYvo9m0+T3WUL1V
         pV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939891; x=1795544691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=Ou3rY/+G+OteyKrkP8Tox81vU+8thEQIbnhip2JteSaqVNU4l/Iw3whwQlwHoCSoqS
         oiAdPQ8aSMroRuaOncCje/sH/upN5PXQHxP4DfUsqdoujINhJpdDrRSjjjeKMNOs3ik9
         Y2drRTdGEaV/5Jsw2hCA+S47bO0bdSDeu1Lpz83h82Wv/b/GbEevffaPK5+dTEzzzIFf
         ZzwAcrOwyplaGpea2rqsDBr6IlKDWXuxaWuc5wNtT9mFfpKtK9y1k0c7Sy0HQZG0g4i3
         gYlpnzD+QBOcxPWxCj9EWNJUy7XPnja/G0l72gOHGd7mDt4ih0Dbcu6Q3R7jTYV/K9ye
         WndA==
X-Forwarded-Encrypted: i=1; AL+hErGo5c+P+7IjYHb/eGLVNFxudTI+q+v3o8peOYSkes9LibqmAAsHc/xX+73jG7e9wHzAc8qkR99Jo4jF@vger.kernel.org
X-Gm-Message-State: APuU4Z+DaSISHvPwldzW64Blani5EI0KcVIQCv/Nv9dXcRLFrl5MPxqb
	8TZ/gOe6syLsRE/LyV71Y5/D0/u6+gfCPzeECJOEwhPl6RZWgCQPitMuxqPrNg==
X-Gm-Gg: AZFdTZeNx/itStXvxbeZCaNR0LLURWZM6Bx2ze1VoKqjXnz5WrgCcP6OtneY0S8bnl6
	SQcRQtMCPGpQIxLXc3Mmms/f1CuitVx7mzum/P3V6VMUXNNGQl5fevtjB0rCetuAHkSTcOunLUn
	E72S28RtDlMX6KSaMnWERAXlwoXrjsDgUtgYKWhZ00fOGciTW1y5rmdBk56WkzVE5QNxFj/4Wv8
	+QWf+c7SB+nHD4JNi/j4hagqGJfzf676oQPvzpvP9+BuGf9714pEEbWVX0ExcAR4ohd6bu6wdCk
	8JnDGpAthicjWnSjsibveNCikvvjQjDK2EN3foI3gao0GktFHKJgvtPgurm3u1+a0RwGtBbSVWf
	i8RaalQbcT5V0M6FcX5Ex8LJ3Bhe0hpDbcwfgSONxZK3NVwfJi3qq9iVE7sprGDH6NNf0rbItq9
	I52OIq9ymNHAd4DAaIDiGmXjun1ExNrLLhQlxbS0dPN6QH2KYurqPzEchVECgN9dvkdZq+apo7O
	58mlgHp8Xst3YGAq0sEHisvZ7lRI61cSef7SY6Vl43ww/K9qemC7Xh1BPv4AKMxwJ9MjvmhEGgU
	+blRRw3AAXYqCa/2vw1ICEwb85/zXJ4r5qDiOERwpMwp1T4Kr5ndJCa7ezG9ZRmoRnBZfXBX9iA
	xMh+vGye9YxJaps8CgjjjzKdXm+HQPoh19A==
X-Received: by 2002:a05:6000:2c05:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-4a6394761aamr659338f8f.18.1794939890592;
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
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
Subject: [PATCH v13 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 17 Nov 2026 19:24:38 +0100
Message-ID: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

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
 drivers/clk/clk-en7523.c                      | 340 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 422 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

