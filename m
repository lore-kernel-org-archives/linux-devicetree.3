Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483712;
	b=MRCanGkv91zgl3x32PgYjNUzG7Mx9K7iW+t99Of2f8PrC6Xi6lZ6qy/gWJS9ckxtt7bT
	 pa5AKnADAWAKs8b7ROrkAzt0nE1B7pio449besrNE8VTSL/L8CxwI+QH2ZE0cqynELWda
	 N2an+3SMYjMzPzn51dYB7JD8ZxExR59qbwuaVlq1NwOgb8xAJUzxHBkAxsxuVaEWKdVq/
	 +xNU1Tcgg99twSmqD287E0ErpDwKVsMOmQeLkHwPM9Azk9oL11AR6yehA/wlE8RPBojSq
	 K15DoL+5RPgeHogXpmeJOWFZgoOzgT81GFSaB4tXFnT3x9J7+tY0ayhocAS+58rkQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
	b=5jMiRP6P8EjVtimo9+H2oylNJxVjxm5fR5eg/Qf6Qe6TlB27bgSH36VFFIJH42zIHZto
	 79rrBuZeZ0+eMsGcw5PYqBN+q1nWtb8Wg+bl2ZxRIk5iNIrOEgDgsbBsZPfPbbaGg8cOk
	 ClXGcVi67XVlHz6dp4IQG2y2qFqu5VgQYhGiRX9UGj13ooY0Unboz9mtDanpdEWLREnu+
	 PIaFG6KGOD9U5rkkintSKLY0V0ePg1H8Wb/6+/J/1jujs7rFX6ZkwiXO6P5m3qEAUEuii
	 3lSMl32OgLp1B7JFY2mMWlDdKle6dViojA+ooLowlvpyqrhNqQcW+fxO6f5kAd2vVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSW+NJmz;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3DC606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3DC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSW+NJmz
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1834615b3a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483711; x=1796088511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=dSW+NJmzISfK/j5aHCTR6DFklJgcWC+dMJDQYKMwBVBVcNFTqNsk1m0Pge9sSadbP/
         xM+ai5CJVbyqjyg8gowTYXCN9EKeJOKDjJjF9cIcMgqh5rjYSJ5YDGoCL0p4ax2HsyfR
         PQlR4Cc6rfPIDvJeSG+t6IQy2ZqE4B7tDxR7vd3Y2/Min2ckJcQsUjx2nwarvSqGA73g
         m55dOWlDqOZwsvKg5v53Z8p+jzyDv+k9sJHv7E/SPCQwPzZRYan3RG+cHoCulGsPTmVa
         XInkezb1+2a+/LVMpHOCB8D62PyngqclyqSIDOdPgGoEvoPs6+PB+fkwmA/Lizi4fQZU
         T2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483711; x=1796088511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=PT5MawgwG7upaz3OVnpbDzrCAMKNU87ma2PrnltNO0QqL0p/H44gwjOzBlAgjKALTf
         iT7RUKeup3ByMymZEqaNxhetGBy8nEj5s/YhAeNSybdfWrlad2P2jH/NnTpioHlwJ+gI
         xa7AMPC2Chw9xD3Q81YoygO6pbqJgWvWSMvhe0XQrz8pwO0WckdNaYCbKq9tBnDnfJQZ
         HVqOY+F2PI+J9gZ7jZg/5qubLkw9TxaUD3pTMaodt1vXDaeknVxZAj/BpHE3lc0pusUa
         yv+bPAQqJSt3bfzqemuNVlOcDvOx7aY0l+hQ1ZmM9x6+ApwLBlV5btbE/V59pM68YUFw
         x/+w==
X-Forwarded-Encrypted: i=1; AL+hErHrWCF1jWBvE0lgLkLrI8IU3S5Uge6BqmSJVHKmvB9RBhH5PTZVeN2DzgjGGQEL0wt0dV3OsCfP+Tyi@vger.kernel.org
X-Gm-Message-State: APuU4Z9U2kzx1vfQQKyGbk/TkBk2LWjCaY6+Wy1CyPKVZ3NQKHbSPsgz
	rvHgpwnPtoPc3N2lFNEhHzB27KfEl5pMVR7XHH2hX563NiYTH7Cw6eX0+t2hY94D
X-Gm-Gg: AZFdTZe1SwetKOwujwWsCB6R3mIdtxmNtDyOBXE5a6r/ifwdUGQI/Xp3UfEKUAlw/7T
	bGC/24icXReQmwbTEjCdTy1PP0BWSz+vWbm0UrNoBWNQRcZabjZA0HCdzx6Q7qtI9iLF/2JdTGc
	R7u4iHvqFFaIF4lqUjQYZt6vxjRDd0VnYuBQ4XQZik1rypdgnEvIAE91Jtmh6xaOlX2FlVtK4XK
	pzJtFwKJz55Xaul3DiUv40JXgjP/9P8EilG+jt86E5yxucsmk4x+kln/xj4dOVT6h4dKMNOtbvV
	ZgM3Dxt+WVEThXy+TmR+6xMweb3MazctUl6rLGWa6d4WWgbkFsJ1Pgywvhy/0mLyeZuKnOFyRj7
	XJJGopff4vjDyStkxD6MJVl9Od9SJS0cK6IEV8lA7to2yfkYQTyWLv+DK/ITBu/1ovjwktI1ikh
	4L3+Qqunq/jhMc5MSLvhwHF6FLkM53SDmhDwYbxSMGwCdMyLzFV+aootzIFdDQP5ioJKEpprbej
	n9YqaJlcW1Pjn9FaB6CIGDbY5G7nf/3gBi1lZWbH4Os8awFpqZY4Ft0iZZU/Ah1nCDXYMyr5MZh
	yZ78KS8wLZfNWRuIXyKf4lSBhKUlIph6WuleMPp5NLwSbQmN1hboyLgtnZZLAhnn6ECYdtidrcm
	4
X-Received: by 2002:a05:6a00:1788:b0:88c:fa50:1a86 with SMTP id d2e1a72fcca58-8c87c09ec5fmr11915415b3a.25.1795483710678;
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Tue, 24 Nov 2026 09:27:34 +0800
Message-ID: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver to handle these SoC-specific semantics natively without
regressing generic SP805 users.

v2:
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261122065549.3265519-1-mmyangfl@gmail.com

David Yang (4):
  dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  56 ++++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 305 ++++++++++++++++++
 6 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0

