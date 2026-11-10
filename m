Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269288;
	b=t7SAauH5TChuxfY431L07Z9gN2XBc6cQHeOevB8oSGaSadqAAnow49x2B/kz3GAaDziW
	 Squ2Gv6827BUYIG/9SxUm5sPykFUrVq2YX+EFt+tOITuCNh/rfxQKwz1kx336fuydOYFn
	 0x5QMGdSwGcisb1IU+g7RF/y56jQLGlZv1n9sA8JXBcf4eS35aAUGL0deXwIqt8lCcCn6
	 hGdia9c0F3UU+z1I8cXb0ZgxMTqDflTs38CVLeH6y4T25nY/VcqC7kk13IakuN38bHhCO
	 MYriKK4cY1iAroE1UzFkKdZkHSiKQrBidpxxspHaGLvtYbuqVZ+mnoYZHtrZV8S7PIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
	b=iVW79riolyn++c0uaK+Xb0/NSzeZUTowS6HKtLdXpZU3+GgixZj2aPGrFBnixRzvBYxK
	 Mu6wGf5vdbQc6S+YxzGyGvYLYtPSAjA22u68qPW9eMlyg6fiBOSThMwDa/5ci3h0zrz/B
	 7ATkb8Fr5Di1pRCUZ0rQXEsPc6Y7xCxMtrCwECdFRKAKtw7fAVmrX7mmtCi/qkw3lMa7V
	 UjiKasdNjj4qSGycwOC646gV0+7m/o0DWNjrai4bfQJ5LiSRSqRJgQXGrZpRpSjfJ/4WL
	 nMiv6Mzc7trXg+jf5UK40W0CZH7Caf5AKNmBtd3zjH49rJCxrEnNT9Fggs6HjWejgUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3405606A33F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3405606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so963322f8f.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269286; x=1794874086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=iL5+I0cLr+ATVuNDWPuu5e61AlHGDreEeL8uYqTJan6brOFqG81URE/GhFEPf1EXj8
         19SD+Z0FTubz4ms3PvY57QzZw7b+ObGHn8SoL9HrwcKy1++JPooTxj7pk9161Vf/vKIU
         ekhd8K3g54CvLJbULwkZx1M1mNfkjLBDvxOWAKLz71aQLSEg6hnozUNxcsh2YTRSPywx
         uS+RUOfu4IxObk8F68Gc6CHL60uz8I0PCEb/uiY+t2qH6Muh+YOzzcrsILyLqobYSFfE
         /h3j+2zTwDNASqYiOdpu/BJO7DMO6jP9ruk4rC6aMfFPN1t62vW26Vfx7364HCvw50gX
         9NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269286; x=1794874086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=BsvW41g0XmO+xAMRaVuu2uaN0qSGspAZZH97dJtKQiNNWhg0SMKE2i8pVPgr4qr3t1
         h1/7EamamZZo5eoNlM0oyHi9WGzFsr2McplFyHauGhwGuXzJVZYbMzB/5rWuCG07HPmR
         ycL05IWC/FUPY1fIxG5/U1ZBGi+a5UKeSa7B6vfyFf6KD88fyn6OTUFIRckKKZn4tW3z
         mDzdqSoovQv6rjHQAARlNkaSXSqtT0jGOKG/tZJfJQbIlz3gBw45Glozbbbs8iMHpxQp
         HXMhovZAakyDrA9mmKNgOk/PtJCYa6n1ZUn7UBK5s1jPrz89KjmJVteKGc6FRl5Nqht1
         C0Lw==
X-Forwarded-Encrypted: i=1; AL+hErFk15rjS06B+Zox/e/JIsOi9C66Al2lN3LyKsVPIUKrClgDvmZ0IuVFygIg2GJDf3VNOw6INKh9+rAr@vger.kernel.org
X-Gm-Message-State: APuU4Z/gxmdEhF96+pNafAY6suhx96nmIv+mANiWORNlU/9eePLrOEIg
	KZeMF6xvrhkQc4ZXJlTDQO6053OntsP5nM+A5asxUos3VLtblwSIy9UB
X-Gm-Gg: AYBFou3pWX+rMwfpqydsHaJJHvaHSf21Q7mVT+WQnJblF8uKhoxzzfRdFmaRQHQCI0D
	p7SpTjAQm6xHWu2TaJHB7ZFdrFaFbpxTRAv6+yX9Ez8yM2aJ3c3JBGa0BKAPFOHf2nx+R/0K2dx
	DOwOZgeVHaoYuMn4xWL6YZmnRE5yog6GHYxvxDSRETJVhILwZZ8zMxDPPm59bpHJSw8recmV1Fy
	mL3SuScOzR+07J/U+n0rYxhC1sEvhznWVh0pjFzcLSQ1NmoseRO935Q5rhOlBPM69mdNMGulA+o
	G4dA1rYeXQ9gfdFkgeB73Szr58zen0JSJ+kGqou1CLtC43Wauu1oXyLgz5CSTlFQZkS0Zts/Vcq
	VbQxQelgqjZtgCwvfvjp4XaZOVviHx39GQMPd17vN+RyXuRCPLJ7x76hSJlrhRaQVL9wk3jHdBQ
	ygJVXjKcP419TxWSinLME5Hm1pauG83kFJxKfdHVRMxyrbQDZXVMHWGY0A7vEuEJ4moe6QADhEk
	GeEz6nUGatMiXw407OOGpZa6gnY+QT87LmszsLLpIGBXa0irrjsSxDRHbUkntpcCMkgcYWiddW7
	CUpg+0uZdJVhiWiTVynF+ct+webDYrGIVW6pq4yE4x2wHea3JhbXed5eXUqiDgRyJfoAJ7ieD92
	cvKAG/2/2P3GmDduYH1lHCFJTyNA9aN0CdtIV+fyaF18GdrJ6kQ==
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr1350295f8f.51.1794269285946;
        Mon, 09 Nov 2026 16:08:05 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:04 -0800 (PST)
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
Subject: [PATCH v12 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 10 Nov 2026 01:07:45 +0100
Message-ID: <20261110000753.508-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c                      | 367 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 448 insertions(+), 12 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

