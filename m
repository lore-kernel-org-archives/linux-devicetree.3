Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434258;
	b=tl3dpWnc4qg8xlIIrt+OjpVmVsUzuPV0RlB10TMtF604e3BcNNoLRo5klaYCtOod2LOQ
	 Wb1XhlOiaI8UDIu0k1VXNI31FW5LtRkdSU51eeFOmYdZJs65N1sE/hodI9GmiljcUMd+z
	 +ipeqecTZ3kXx+BLQHqasz2uQJ/eJiz1/aSWdsOPWG4JN/DqlL2Cw7KMsJVUT9z0aOws3
	 8uoWb62m71RRwia0ASyn+JPHc7ADoxbALL2t78vd2wYB8K/4S1+fOuRDiOwAYh6Jn/L3h
	 asQWoqRgBf6/+XBMm1GnSlgBIcnrO9mlOyAfeH8PLqpTFWnv9ooZXgMxtImh394ImxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
	b=P8yqZRjN2fk8Q1XulLkTUteNUx0ogsHi9FsOYPQwJd3GRFhNjFl9CLWEwbh8cuiYDK0K
	 BGcWfWm+nfY5nHLwkV3XB1U3evBX0L/0zs8ol5WofIFd0hbk/2YKMUuGGre9PXYNMKgIN
	 oBWk/RDq+i8QuA21dOsdojfaKMmoseO+6s1N6fovE75BjKdfIDO6n0YLv+glDNS0mggfX
	 Qv3KDDFyJiVzEoJOxOCAmzZNGZiYtULhgk/LzJpNnoCLLa+eYrUtvbBlhnDaLeN05q99i
	 k/7YF90ks9vSQ7HdJ0QL2qVT1BVBC8seUczQD9cpze6+PeffWZ2cKrBtrxvoPAOtDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA4606A895
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDA4606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso133466a12.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434258; x=1795039058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=sOR01uyRvXHgOyzCyDNY0Yq0Ast07uOYX4rPz8OcCM2Gp1XpxXLHflfejIsB2PU095
         lS8KvPNsrhc+9na1BlAKBJ97wpV1O6iVAyNVzyUCz/dI8xbFAH+RyrPL5kSo3IP5KNAd
         rh4v4bSbxWecqtR/soDUSkxJpcFzQe0n8Nafsh/xQHUW1k4IqVx6a/xzXOvMigmTFzPl
         H758JXDlTcgi/nrrbLrjllIrf4zNJmmTy+rm4Ol8JwiF89D44kSgdqjjIHg+dPrSslw4
         Gs+9OxKh6ggWSexuWQExm4hHcVgKFw3Y28s/t1fo5OZMWzfzgZT9F/abgLmoz1u1EBrm
         NDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434258; x=1795039058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=IaNmDUPKV78Mcz/uxJpvkYX9YR619qCPyay2RWpPc4rmBWW9EhnpzQthxr6cXjQfeT
         5lusVpNe9XGvNBO0rLRPi9jo7L9PIC+e+bsjRmGXnR58tz+tJU6iPpLNaG3FxFpZ0/zk
         cSy+oLyOjYP5a2lRLK31a4eRhpixY6ob5p2uEqwXkeFI0imhngpYlw47jKKW1SH6qpOq
         S1l9cV7eu1z3LM+ChGMyWQfRK3lyLq1tR7BEkBmoxb/xgA/JYj60n+mFxC4OIKkjJUou
         g4JvCuS5pwblDxLcUzh3rph1JL0eKsIidllLQbUtY3okSz55i2Wa0wSs1He3EEGp7UY6
         E/EQ==
X-Forwarded-Encrypted: i=1; AL+hErFdvINrH3NqEkzSsWcybDRXiUegLhKdONHAx768vZWGvKwqyokhgmzigHktXrt+yyQgLgtr/gKIeju3@vger.kernel.org
X-Gm-Message-State: APuU4Z85v3bFhv1rnM3y3jHxVtlnW+ZIvw3w059gDI+QEioaeoJn8jv1
	2dI3mPjKmc9EpuO7EGNNFjY/QoiWwFMhDnP9SUrkEMocchl3XHKrr5Qi1in2AZck
X-Gm-Gg: AYBFou1DFSqsURj3C3NajsfrwpknkccsO26b9JMhHRadCZ65sFcfTVHRj74ejdwd5mx
	BEiw5mfgXo790GsM3GVBltZmfGKeFLrtkYIDXn3ZH/736GehZyG+rSziQCgxh8RW63DPChlGc5F
	fwHWICUNJRXfNytUaASMwh7MhCC+CsB94z7NEt7rOsmK0I8iaaeUA6XW0GbLBog8THeT4t8LvsS
	pxdhD7HVCWpwr43BvTTrgduGvgkNoJ6bEJAsUu2K7/zSFsEIBgm+c7zG/e9MpviRk+goSXCxtsa
	8iUpblJBzyWDKaJT2VqanqssZ/H+mmUffUZ6AuA/sekgQllZ7o5rX+PSZQSyu8f/dKyLTlSMcCu
	Up2s5Jm1uu0Msf1OlH8cNNfF8/JQqunHSELxdxy/Jkzt4bWl/VSYuYr0zU+M+JRZausC3pwn73R
	KYXJ6JjdwMasODMS0+NO1I8K5dykRZp++iBBy9Ffjwr9f4lNiB+yDp+GYjS4kYUMKSvIsqai07E
	qLyWX3TFLvOKbLzyTOzORPb4T4zcuQ5EI8wU9U2iVwsnA/WnuA3Fd7babkP72bT9Ux7TRVZioWQ
	UKjOA8TZn2MozWElo4TtXepY4yARjaWcUdD3JL6OvcR0SjeA4tArlvLbj1CbtuVcPOYpCThHuHo
	Kn6hh3YzdvNpXOeYc4GRx4+LnwGvrga4zPk/aPTYRk+zOkg9rq7HBY74a2kinDKTPPd8JfmK5jm
	xDKA==
X-Received: by 2002:a17:90b:2fce:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b197cce666mr391401a91.36.1794434257629;
        Wed, 11 Nov 2026 13:57:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:36 -0800 (PST)
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
Subject: [PATCH v3 0/7] clk: add a driver for the ath79 PLL controller
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215729.10683-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. The other SoCs are not tested on hardware. For
each SoC the rate calculation was compiled in userspace together with
the old code and fed 2 million random register sets. The results are
identical, except where the old code overflowed 32 bits with register
values that no real setup uses.

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2: https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

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


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

