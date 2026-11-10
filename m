Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274612;
	b=mGsx4pItE8is4fQl3Hn0LrptjoXGsUqVaMBX6hEg9rfaolo5H9d8KqrpGguEWQnVIY6U
	 3pGWWGMCMdAVh0F5Nf0++O+nEN8voWc3PwQfiCBIn3vHKAF71yEqIZlYMthN5jn95Q8+s
	 bGBFi2STAYOl4jzjTzvQbkylgG+ZZv/zkSAOeoEr3A9uWJaRo8ErVrLDXggGjeyr55xTl
	 6bhIO1eoi3gZXya+uXNe9mI1AGK3wtFIMBxsWH7duSUTUmSXx7NtO3dxnJWbPKw64WlZN
	 3KC6E0FQ7bRWIvzh/Fs3ikVWN6PNkIRZdKb3Oe1XSJTwJrThsz7GUWXevab2LMRL+mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
	b=ohlBtrO7JIaIFDQl73lUw5/l35nCgNmkf6Q9OYwe5WyudWSWeGqnwdrRoHHzdb59UmtS
	 XAslAualyWPwGd6ufKg6AxBo3izIolcG2xY1xsZbV/ne0zrLI/92OUquOmHRCbf/qip1q
	 PYn27sHpaeERFlNKWZB0Iwon2Wuy16/42l5aE9jgWlpQDz6Ik+9wD/ZUncGhz0hI3ApZc
	 aQy7MqclbNZz4/drpnGGRkIsYLqOiHnURJ3BYzyLKlOo325CW/AUARwET0tP7Cmjq5F0w
	 mgMHgw0W3NjR7+esynDz60KXtbjQ1ednbJjTok0ig0hIXmT35fIaYNhpiyw7thtRMSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07522606A339
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07522606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso8995595ad.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274610; x=1794879410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=BJKgaiqTeyCgUTyCHLDl7Njgh/uAeAtOPZc2yyrjiThR3rdAJFgq7SjjpL4cBWvwSv
         PrMgVY3RgOZNtSkdVKKgwyJEvW17ai6wl4TDkudDp6PZYW2GEaotiWuGmJjhSEFeH6Ro
         BTby7IPCiuj4e6Aje6s0YZZEu8YSWGv3bDotCxKUG+tMlEtKTs2jR50wA6UboYeH4feF
         /w3/eYcRislA1YfJ5pCzeLNyRDydqL91LAQdNau2smpJXgcB39PQDJ14Hooj0/Sq8uun
         g568MqExacIKAQh3jdt8bsiRCcdRUyeg2OZTj/TQrSnBgQGFxQgE7PtNzrujBhAFG58z
         m6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274610; x=1794879410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=R1ek/0KlBsqCVCqBu79iDiNqQauQFSmm8brJ4GQbI1AyKUNYRj45lVYviCE5Bkgi05
         YqNFEK30Ud4MI/X3fUD2d/GqjihiZB2Wdc+5Se6ejqS5NyNKOSH4hEtyUZvvY5VyCS7E
         FiCj6AqT4R0RHMUpx78dEMGseD2PmFUS/khBaF30CkC8maYVTD0Vqx4c61TrersNx+cz
         4no6trBzjXgHiseRrPihUfH+tiCDOg5zh2NT4FLcRtZQZKur8pAq019t8myH3d6m5bNt
         yYkH4A969KFZiJQMyiJz0Qawa+ftGTnhfouWfwGPXNUOXlHRM9Sbr1mhDhFNyVl6dpCH
         9M3g==
X-Forwarded-Encrypted: i=1; AL+hErGEC6XiQDtY0ZF0FATlGSEX5KkNP5tTksYgteSB+8B+JmY4y0LbUev7SdI6h/7q2Dz+evsiVQPQ2p2a@vger.kernel.org
X-Gm-Message-State: APuU4Z9BE5RYm6K817UngnJ0amq2MC/rQPb7Fl4KJcUw9aBnjWpvyVOc
	t7yc7G8HgHd7amLIWP2Z86nYbYJ7tR4dNdogCWJYOF+58zGFWI/dPGXl
X-Gm-Gg: AYBFou2mOUY83Cy88wBjfusSgyskGOOLdEBFRtOArFaD9r0i4SWX2AKWAFnpxpbMvAr
	/QQ7GAl8NLF45o1WxEO6vfagMX5vfzqlCbDbCrl9JOQGPqblslIlGgsioI02Ou2iT07Oq284RTv
	hv6nAzXWQgZiPrzhoUymtAyBoVKSHZI5xBtHlUasfXWIFltCU5VeCbmBU7ouF2sPRN7I2TbbprG
	SdaIIvvayDA6PtnOyorsPg/5RkYBYckIDR8475QnY4JmIF5l+bYUWGYb0JQhmqtZJdYkh5V8kYx
	Pqfe7vsiItIcIoeCm8Di2blnViM6L7CDx1GIKSUp3QsCR2jost1G4MsXapeHz5k5iLMhEYN8Gpd
	Uqr5EJPBzOlyGKj14mM4ZqocXcpUNMXF5nNGRwF77A3/RKGR1Pp+T7tcDrwGnDTTwUZ4F9WjOVk
	Zn8Zgft11ADdXA86pjMedFyXmK9TKcO2UqJsViWu9HaPh9vFGq2vrBIZxQ8BxnOnkByl9T6ydKZ
	e8TNHNltbPvB/Ke+nmL9rmMlDKzR9zNELibGigGhdXrj/0nBTzBeuFdkMqDh4SFSvgCNLRpRgkQ
	ShJDJ0AAS34HmS8/Qk3TKKd/tV4VoOrIDPERD5FncE+3gkPzpiXhXdH9At7p8YYioRUhB/vzwt3
	WKRYqrJyyHEZ7PGYZwfhR20cjl7DuUMLCjGT6dbB57JoGY0VjN0elMTrnweGM2fQufBFVf7LqVd
	j3Iw==
X-Received: by 2002:a17:903:26c4:b0:2ed:5548:298d with SMTP id d9443c01a7336-2edb928164bmr9145275ad.54.1794274610253;
        Mon, 09 Nov 2026 17:36:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
Date: Mon,  9 Nov 2026 17:36:40 -0800
Message-ID: <20261110013646.1582970-1-rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver,
and patch 6 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The other SoCs are not tested on hardware. For each SoC the
rate calculation was compiled in userspace together with the old code
and fed 2 million random register sets. The results are identical,
except where the old code overflowed 32 bits with register values that
no real setup uses.

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (6):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  dt-bindings: clock: ath79: add the UART1 clock
  dt-bindings: clock: ath79: add the PCIe PLL clock
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 100 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 778 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 903 insertions(+), 675 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

