Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829533;
	b=Sf26ZaEN9PtFUkR8HBjQffaDVDf5sLez5fPt7N+2k8wMjUxhvLmEwGydAH9zUSIT0Sr9
	 XjWadVkmhmZT+Fjs7kvcJt44khEZ+0/z2dgLMIn6gKev+S2Hl229+IkR8WyE5kmgaLY41
	 KxgjKM3BRxurfbWlK0iwmWX+luM1CsbkIUuAuI6/Wnu75/FhlLfN9hNnbjazb0/2NNWR/
	 HJgE0oBCq7fn6z/oDSa5gg0mmbvkpO7iS1gBcGLZI/4jhRNEd8jluW+j3NxecIABP7joA
	 BZdQxBGSMkD3I8J9RBT+HeFd93wJzggCUM+BT4VQXMURTadgxNHf4/Qhp1Mf447I00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
	b=qoOZkMdq300xm8UR1MJYXh8VAB+li+xWkmm+rru0cHfIaoYg5eXLf/D8Nfwnh3hgsE8F
	 jW9QNV9WbdflaHvmOul5fwXi6h7lrb3kbpukG1snedsC2/IzHHNsyPS5KrYUtk9pvPr4y
	 dO46eg8FpLnmohFFici68c4tGpL4G59Wc/ImvGHIxZbf5uUtavRMbjef9sFIa+d2bOMUB
	 pz6pIHk8FWvggAGOwg0YHKueTG1bjocAb2o2QKWcQWfXHJAe4ZMkAUZpQZz8Bfryt/Ejc
	 PlhuwaowtTbv4+yPxUMdlSKko75Hvsir39Kk8V6cDk+K34JGdZIixU3WZJc17pdXZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu7cvwJK;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59781606AB38
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59781606AB38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu7cvwJK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8794675e9.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829532; x=1794434332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=Wu7cvwJK7FYC7glKoKS2nr1VdeOxHSJ9luIIV9cnW/RaC2BQxx3D6fu05kILH5uOst
         4jrJYzlaZCZAIGbifXue5Us2ZB4GOZrh2VmCSluFBPBdAviTckGMcghBZ6HO5LRhSJam
         inXLIsVtwL5A+5aZBOQbfoGmnvcFqATd6lC2R+SzaAImATm8EC4oY2m5JinBpLJcKtnJ
         619dLjonxEPW7jfwU/iNteSQWMANlquYjlkweStldBRu+wgblV0XA/di2RsB7MKKff6J
         Qv3FUYIbl5RSs964ysTWuk9/958pQeeIoMBgaDpm78s8MMKjRxoTfiiGwLp8IHy7ci+8
         CPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829532; x=1794434332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=bn1n/avE+SRYtWdpIDEz8yTVkWJLjAR1SqGNJf/Nj7BvwxEr4mePUX+EEaFDr2M7qX
         NfWOLLhpGc9iicn0HeDlXjvejwok644mbILnzGI+j84I9XlLvWENTP72CetUs3q25gfm
         yGcR1OLIUUqzgvW/dM/HCMuRHNaoKiLZe1pbS82s3xEoQE84/Wlr+BfZHtuxhHeabLrE
         ujCi8IrGnt3+eLt+WhaPWBxBQcssMVSWqGtxwCSTbwlOeXAy60kNWKDUA3fHlmDrbGdk
         vUAnt52QuFYdGK5bneNZHp8w4oDwz+V1OtPqaeQ4NkqsaAhIDAcz2RaYICDpWnXR5TvM
         zTPA==
X-Forwarded-Encrypted: i=1; AKwUvBzkoSx6XuB4PtMelfbf9Rn6VuVJ8CbnhKiV4bspZwuy5JWk92r4fq6oMDZopzlMnB6O1AnnKAa2jMuG@vger.kernel.org
X-Gm-Message-State: APuU4Z81xaHSNLnKvWEeh5BJ4TLfl0WYCuKjVTPiGEFSTmTLU+1+cJM3
	6WP1UQ8eCAoz8enpW43sXNuu5X3UmZL/ilhKcOwo2npQSI1lYvL1imOU
X-Gm-Gg: AYBFou0+0BZYYb9eKfBdexWmUeU7DgXaSOIun3V1mL8NwAp1Z2fAxg5XsY3GOUQaJ6w
	AspS+HnZFbhkHwENgPwiGkO2m0+jalnRCQ6KFgl3y1cBKbkZnA9J0igO6H31/QBQYEDXvx6EfUH
	EteIhMB4tAG6mYTe1JHEqxV361msLSIUhkqS8wvagDYRQ7rbTFPqlXWbOOnR/fI7ssTu6VXobEG
	1F9uDLbLIrq9g6H1oMRF573C5gE6riTKCo6tKqcZrQ0IPI8dKst6Fb1G7cePMah6Nvhf2jB7+4a
	nhcD7EyDIRg7tahT56ZGlTRSvryXYtJa97BWjXeNvITQi7I4/yclGpoX82696KlBZvZ5jHJE+ti
	AgdBzuhtd8Fxg/LNOYZfHSC0gRV4EgbcwTLVGJhT3uoApSBK+gie037+mhIZZez19QyPYPhMjtk
	mQye46JGxcf3/l40fUON3Ik1MNCJo+SIJPhQaTbYgLjbCuzhxFtGHqJxRE2lYEwwYEmTCH8ZNFS
	tWUsIDJFEj7XKdVKC9RF/hZ27YwHe/eRGiUSmCKd2I7hPS2oVOiZ9HTxa1HC1AmahGykobep0Sq
	0IalmqQ7faN6znqxQXtjbG4U6SYxrq5wZxhm+6AV6Fr3S/gQ7qt7thJ7UIDsNxqZ1rUdtMpN6St
	iGCVaygzUP/SewXqAnUBO2dVPh/IS5zsPcEi2H5A6+CtXbw==
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr368381185e9.12.1793829531676;
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 0/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:45 +0000
Message-ID: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The line has been asserted since the GPIO was acquired early in
probe, so that wait is also the reset pulse width.

Endpoints do not agree on what they want there. Some need longer to settle;
a JMB585 behind a ROCK Pi 4C stops answering configuration reads if the
pulse is stretched that far. The measurements are in patch 2.

So, as Shawn suggested, take the delay from the device tree instead of
changing it for everyone. Patch 1 documents rockchip,perst-inactive-ms and
rockchip,s2r-perst-inactive-ms, named after the properties the Rockchip
vendor driver already carries for the dwc-based controllers; patch 2 reads
them. The defaults leave current behaviour untouched, so there is no Fixes:
tag and nothing to backport.

There is no DT patch for my board in this series. Its JMB585 sits on a Radxa
Penta SATA HAT, which is not described upstream, so the property belongs in
an overlay.

Tested on that board with the series backported to 6.18.58, the kernel
Talos Linux ships; only the context of the #include hunk differs. One
kernel build, two images that differ only in the overlay: with
rockchip,perst-inactive-ms = <0>, the JMB585 enumerated on 4 boots out of
4; without the property, all 3 boots hit the same SError in
rockchip_pcie_rd_conf() during probe that the board hits without the
series.

Igor, since the defaults are unchanged, a Helios64 with no DT change should
behave exactly like plain mainline. If you want to exercise the property
as well:

	&pcie0 {
		rockchip,perst-inactive-ms = <10>;
	};

A wait of 0 to 15 ms enumerated 17 times out of 17 on my board, but your
slot supply is a GPIO-switched regulator where mine is always on, so I
would not take my numbers as a guide for yours.

v4: https://lore.kernel.org/all/20261028014116.2432425-1-ehbello@gmail.com/
v3 (discussion with Shawn): https://lore.kernel.org/all/20261028005603.2399220-1-ehbello@gmail.com/

Changes in v5:
- Take the delay from the device tree, as suggested by Shawn Lin, instead of
  shortening the wait automatically when the slot supplies were found
  already enabled.
- Drop struct rockchip_pcie::supplies_pre_enabled and
  rockchip_pcie_supplies_enabled() altogether. That also retires the hole
  Shawn found in them: devm_regulator_get() returns a dummy regulator for an
  absent rail and the dummy reports itself enabled, so the old test was
  unconditionally true on a board describing none of its supplies, on resume
  included.
- Keep the 100 us floor from v4, now for any value a board asks for.
- Split into a bindings patch and a driver patch.

Changes in v4:
- Hold PERST# for T_PERST-CLK in the shortened path. Old power does not
  imply an old REFCLK: init_port() runs phy_init()/phy_power_on() on every
  probe and resume, so the PLL relocks microseconds before the release.
  Measured 72-75 us by ftrace, i.e. a real violation of the 100 us minimum.

Enrique Hernández Bello (2):
  dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay
    properties
  PCI: rockchip-host: Make the PERST# inactive delay configurable

 .../bindings/pci/rockchip,rk3399-pcie.yaml    | 15 +++++++++++
 drivers/pci/controller/pcie-rockchip-host.c   | 26 ++++++++++++++++---
 drivers/pci/controller/pcie-rockchip.h        |  2 ++
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.56.0

