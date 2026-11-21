Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296473;
	b=OIZFreU9Y88QzfzWR6zJAtHKn2NxnMkNlZENUutJ/DwP0sibadDZ/78YJXjgwP+ncD+V
	 2fZa92IoT6J0jLsHPXIj16LVtPIY/7JYees3Th59rdy4c6iCDUMipnhe4DFAsDfhJnFQQ
	 elwWzwXGXK+QnFHZszNdnKauCALvF+nL9l4edx1OnDU5EtzHlDoO2sDm1G6OsCPwS0lWG
	 TpnS+iBIJYPcrW4AeWkq9SLEn5TOeNg6vLTnjZe6lyHCpdGlNTQho1yud394+ZR8snAfS
	 boQlX6U/znQkBTRFCyJtqSIU3qCKVuo3Fm4RB0EAEU+43r8R32zDN/h40QDQXYUkNRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
	b=3I+IfY8PAU5ypBOMYWugW54hwW9yurZb7smtgnrqfmrSVXL9VCC3P0Ea7OqMzQXBvp+u
	 CQtT/tV3BNwfPmEmDCMtZpWZtldtjWcn7XPn/oUnHytPu4NMl7IwlAYaDPcBzg69ioU4G
	 ajIIcDLlL75Y8VmD4u7FhdQZG/eLola3gYvS5fp3RTDErlrITl7fbFX8PjIBjBV603/6M
	 LBBQtAk8wNJOqkA0rLkEIt6EfcDlLOOTZbacreFXoF3OFSrOY/whFhsWUFPaqF5PLiHSC
	 9kjuBIOFWzTVJSqURELJ/e3omNPHDagusian8OnFO5tTK4sTK5/Y965fDr0fmnve/5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF52C606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF52C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49d64a88222so1943594f8f.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296471; x=1795901271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=al8q8kIVCmw6MiMt65Iueza+XABxhPxX2xNL4nlblp71fgfW7crmFSA8Hp3q8CmhtF
         DIM1fpexXucynuyKElHILyjLatX8my/uTR6lEvTpUWGmFBxAw45nsRNmF0ZJ6Gc4zLL6
         58lE30ykrI7kQ5mKTQsiX9dvy92N+KI+an2nAkRwh66/tWiKXf/hSMykEJMMMHM/Ts32
         fawEkD+1Md1nVfYU5hk4hcZ67G4hxrGxrgVvOZ1SXoLBekwtHtL9FefZKNEIII4YDaU1
         wZEx6XmMfheqEiFvBim/U7PZ35vnAhHz2GdCd2z980XD1TzQ+o8fe3EsbROUnJWg66q1
         4ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296471; x=1795901271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=fZ7+lzA5uVtZIT86Cl6NzHNwsFXyXJUpTwk/g11mJfWCpLUeoknFYDk0bv67hd1GRu
         nRYKepJH+QaKUHc6kpywXjsJyYxcx1rQCtuGUaAKmAkEUGp42EwCsrLmbGqEYcsyJlwO
         /p7a3+LLaXt50AQLSSbuPXA0tU3EsLT6DjkNWM4OoWHRteT0COfYl3ON+VGmgNVfQFv9
         sIAAkClBCQ7555+kP64EpnsLq80Tv6OH/XXXWokYio8jGadxaedFoEgSLFo0Y4duWC7q
         PpfHRmougghDd6xEaJHllidN/GddPH/vjSru5Cg0f1Dwr1cSt/suktW4WYwxNkN9+XBC
         Xm/Q==
X-Forwarded-Encrypted: i=1; AL+hErFakDr1DGBYItOPvr/JQAK0QiHBqU8F4bCiPExOytw1cbJtToXstXL4FJI3fe8oyEKiWF3LPZJfqoW/@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWoDcQhYeSfe5Sub02ecIY+NVCcsZ5r//mr3V6q5FPWdgGOdY
	TxB8ybubiM10J+OASwIKR6KkS014PBs/LG7QRpYndR4GJcwPesm+CGft
X-Gm-Gg: AZFdTZef0c/AmylPMOF6v+vI+6qmCW72x/4/W/2uM6qaKRf7gOLTPuVCacENMt3wkae
	lSqnbC21ZQa57OsdtyxHoOlqRNqzF4D0jErpb5iv5xgyejxDEXSumQoTariQasw3dUtPq41HXN+
	DQBIBQGsAi7oqDWIIfKBBGQtfnbSS21zh28YmhHUOHSN93E0pmPUoKmSM02MY1OGkPKE2r3NHnb
	D/aD+y88ZmdvGWGog9EiiFutZjJRITAFH1u3YctqrPq1qqYa21QOqPejfXposBLHC+mAdq9133j
	WQEzd/TAIynwWJrIoc0sLGwHdYtp8HpXhSyyZEyT0Y9UDiXa4bErC8NT0CXU9kxN50x2FXkbgLW
	WUNqP+FChwzVkLUDNHh8O8XtZpI6/zKvEQWq6fDD9XeTZSw5zqY8yXPV1FUVBkwng2Jm7CS15MZ
	mX0Wb+NlmzIj5EXG8UYKx/zYq6AnGOi84j63JpQ2pyux9VGfD8GXy+zkk4GzNMBf09pyHqqBjHQ
	NE5rT5cApeeGKCByWe+3nq9nUSJ2fC15h47RKqOnFl/m6LTAhPD5JzAONY5FEQHTX9EPK3+YSYg
	Tt61IP5Og3xUhBqa3fbQabD9V40Fy2JixbC7ZqjEymdV6rb7ZyoIxQH9fSSim9xz4SiK7bBFmMY
	6f40MWFbTU6rZLfhOZLBphnMvUislc0rJgU2DjBuzkDl4PBx7gVc=
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr168468595e9.5.1795296471125;
        Sat, 21 Nov 2026 13:27:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:50 -0800 (PST)
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
Subject: [PATCH v15 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 22:27:30 +0100
Message-ID: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Changes v15:
- Fix num_clocks with new implementation for AN7583

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

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

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 389 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 447 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

