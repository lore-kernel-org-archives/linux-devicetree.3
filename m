Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323934F48F
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262715; cv=none; b=TSZF0fbLcjxshKEjImcZVXYRzB0fxCrVdYJQMA0EDUm/r0fV+b+UvHuBizQuS1enox1pMxzbiyQ9TTakKJTAXJYnsPpNJOizgDrrnVkhbSOT/1/T6J1y3YysgFgQhzcvr6zDTpDzSaqnsVCObLg3PIP+rH2H2xhl7Hlgr31GM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262715; c=relaxed/simple;
	bh=yteOlTUdpPHroT4cAby2acVhYXY3N7v7a9qRL+PjAZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FaoEOfUMma+E8DOBp6XPvMG+eE1pcod0ix3D7GjNx3ZGwLA9kLjCUb2Rg1hHU75ERINgex8St20Ts3/YGRa9V6yoNBtx8wCIIFipGneVnVPMSGEVXPu6B9dkWvA7cTJ3F/LvP2OOJ2xS7DgX3kT2FAJX9XQ/kqeUdFuOpw7nSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6/vMjXL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6/vMjXL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso9186575ad.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262713; x=1786867513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=k6/vMjXLSGJbrxImh3pb1cwbh+CZczs6/zDxoGYtKLkG3pGt9y08AqAB+ucKe7qCeQ
         +vRLoU30hwtSZvkt8QUZJ2VyqqOaNWT2GwWMdguobkZrk0LOWIdvASbRsYuraNWqRcmi
         27Wrtm/yya7z5vQ9hLj4sIoQW3PIek2AjewvEVNHZOzg84To96SMmvBCuF0VltpY2VJo
         6X93m0OmjFepgEozbp4vT10MSHZy30lhypVm3gNruFkjSi70sxoFYKo9x7NuMULagH1C
         Sz75PN2wRW/ypJAJG6W6jSigeBWBvH6n2K+NxvQIr0ctLmG7Mim/qtjwfBd61S/k2IIN
         F5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262713; x=1786867513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=O6t7NNbEyTS8AVpj9v/6Xd76B5A+wA7LWDxikVGDx8MLeSDkZzQ9qHtsJRuoSUr0fw
         X7/Nm/Ksacg+PeBiABa/hFUC3qWZmfBgz4A1U+5ek9WZwUX8Vuvm3KvLCxnQiBTUDXTR
         AohSpOnnOsgwUPkUtBz3nCQAxyAav+PmjhWMPZs90yeBdbbYGsBEQQ9UKJZrn1L9AtPG
         qbwndK6jH43kggDNkD1dlIbKfN3QaUIHTikdYGzwaMjYu6wyJbnz+Gp+80+LL3bQCWCX
         su1aoaxoa+cJl9Jfo2Ob5Xby0IL4VCn2Y//dakZmeY4v/0d0NELw5HLbnRSGOqQ9tz8x
         svRg==
X-Forwarded-Encrypted: i=1; AHgh+RrzTgqXRwAASvcjCpowOiN8snyny4e1n5ML7yHFyrz2VvxmTwZUX6IfE2bDnwdA6NxMIwwLGNGnRzRd@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZ0zc924RkvEkW2zpvLXr3CvETzqu0FCJ6MhzmiHxAT+W8dTt
	zaDBGfEI+7NMCJWGQMrjQDY/tfTVd5okWRxFLXe+8IkaQ8uIQvrMHDe3
X-Gm-Gg: AR+sD124bErNb+B85J5YsNvcFipEFjEO5rnGTqzObBlCxeZS0ZjoOnv1e1Jii6xYCPz
	S0YwOvRW0HtnhK+e0uiskHws1Qausj3RZUESGfzhM2f4MJtxJWdtNQKZn1cN/DaOankoF4UbfXy
	zdwI/IdtpTDEz0Mw39pVUsqOmp2vOs5L6EAVnltKPPLFCbtQcTcq3h4LN58IEA6+dLajuip+n/I
	vGBU/Kfo/ALE+gwWS6MlAJRLki0yQevbmksPzmz1o/EI0IEbz+hzQlWhpYosbmFFxl5LTkBq+r4
	BF8xuaWqn7HylPZ5H64AWB+Bjzzcd3bXQTV2q6TmjZOodcG87NRXzhx8PSVgjAtWzY9aqHoes1g
	omNXZXoqTSq9o/dalir5ovQEU+CYL3pSxABi6E3k9MZoNKZaZLCMPPv2Ux5Wemn9THwK0P/vva6
	F58Ox6Pzo0QelPNdgbt7bGYbSLQY1B1mlm7mmiFgttmQoC6+aXNAuQhTxc0fvlaz9k55cw
X-Received: by 2002:a17:90a:c106:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3909d8d5993mr21121164a91.16.1786262712632;
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Sun,  9 Aug 2026 12:04:57 +0400
Message-Id: <cover.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c


base-commit: 87e787e591a82b9b324aa0968795b256f789d287
-- 
2.34.1

