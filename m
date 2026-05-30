Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C31C5799
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162524; cv=none; b=W5GQ1GVctOwJxKs+FGWiMlpAMilTfwrYLr8KgvymgjlmOm1ju5XV+TvGQ/LIyRgI9UJCDiRGRYMzNUwCKxONb0eXBV2ydKRukA9H3PQTv6w00CKaKfnm5czBy9xgxd4joYaFmbFPlzdhMlhhYMTl0PZm8yQ6NVRi51v5Gv+AzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162524; c=relaxed/simple;
	bh=oFEYEJ7SA8sUm/pXg5pC1/BYgPiYYcdFYQGF/ujaB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY3to5AgWLg6MZw5UTSKYbl0ACH1AgwbYZsLryZf02GmKlFyi74QcBLZEscL6x7xTGpeMrLMFJd2d7uVmn+Joeizvch1ZuxuzZxvq2FR/FVuZgqp3QgW1nm/599Gamk4RMi6zwmk3sFE2VAhUQoQrSaJcIvYrzjSGrGw4dQBBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr98FawW; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr98FawW"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91550dda53cso8955585a.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162521; x=1780767321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=Zr98FawW1aMdpJrI4fahLOX87AXh5+zTasD7AKos47spesld85MggAKTsctYN+zfI2
         lcHJfPTJM0zXZuQphH8h7Kfl6KjPRmQrPZP+3gkfrvGt7A4yt+M23RSslTaQXWz0POXR
         YAndQRYYK2xv8RmVyYkxsm3g2nkmHJ5vMXn6OJ3zOfblLyQBYOhIfX8CF44kIc9KkHw3
         JljMkviZfWwyY5EIkNImqSBJqzrGo66gd/d5VBbAV/H9Q4IrTGZivmcRT07ALvf2rf8t
         IVXAD3r9m2ZskPIrWkEQWEmNockmh2YbWPbXuVc854+CA5c0F+87SrIcibu0ujbjCZ64
         m8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162521; x=1780767321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=HKGW9PT+Z9KnxwmzsE2HpzsaL9rhxkuDlQZbE4CE33Q0/Bt0B62+NqxcwbApgVFuur
         QL8BF071Eqr6CNW9TQ0q/X9jNpOGPYoerAvvadStlISiY+fljP3e3a2V3PJL9QJ5jwBx
         x58ELzhAwtRRnKNudxCbWT0RZ2haXn1aAQ0ehDryzHgaDlYPBTuJw9qXW07sSQfZolXY
         jhpHWgtvN64F2PPOv9uwUOmZ8MFsvJ27ucRuEzFpN2zLlfdi7VuZO8+wGZPodc1Co3wa
         yUZKsawgWJOvF9J0a0rZfjNPSy59khwpcIiOnWcjffFZfQf92YRPa2fdk+PC+LrHz4YB
         x9Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+jeBrSAGjrp7bq5NTWQdPLnEDnAmQIzx15Y8l8Xhe/4+45EBhl/QKqXuzg1GTmLOI0iakZ3EgBr1fj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/yZN5HIbPkHdbVOKbVXrzwUilYMyUgOR1kwU+A9BHY3pIkJ1U
	2A3FhpapXZErC+ML8KDnULD6whnyNs45wzdcltgB1Ae2Iz6l+cJFcqCt
X-Gm-Gg: Acq92OG0TR6iEDljAQioubVPmKRPSbuHI81maSZG09uN3Ufb2cMLKzFgeCQpdFQkAK8
	bFaSLepFu0h1h99jLM4xWgWcT1IZp99unaPs6IT3sO+nH6mCIj5CTuQQFzHSFVbngTB49FmOsqb
	sIKXw7tbr6rtK4JSO7LMTnxgwic2dWOvGECCSxJSh6ggonlVc44s657+l7Tex8NfWC7YjG05BPW
	8z7bRIvu2MZ7FbUrO0/SHrP/8NwNeIClt21vqL0PHO9pax0E/aD2fLZUDkKSnzq81YGzVQxaj1G
	f2SV2sxskYhV4dSj63X3PmVnXELFkTh60gTsMXmkzGKhjAFKN7jtJ6Ekrk07tyuTO6+2ehOxIWQ
	9du8L+88h+pzc7h0XJlt6yCX+6XZ7x/ic4+Nh4B+C2kqZNgsin63chIgEhdqvM6rG94pZoRxVGI
	A06U7JpheUOep6pNtwfXAt4PAL0KB3sZECJf6LWnXQvgxYcJ9QWQN/rY0hssUlqavn8y8=
X-Received: by 2002:a05:620a:708e:b0:914:c226:ecae with SMTP id af79cd13be357-9153da04456mr673431185a.24.1780162521335;
        Sat, 30 May 2026 10:35:21 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:20 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:42 -0400
Message-ID: <20260530173347.33533-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
Ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with ARM64 and RISCV64 to boot from an SD card, have networking,
and read I2C slave devices over i2c4.

---

v5
- Fixes spaces at beginning of line in &usb node of DTS

v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
- Rebased to latest sophogo/for-next
- Added usb node to arm64 and riscv DTS
- Removed sg200x link in commit messages
- Added missing change to v3 and removed link from v2

v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases
- Removed milkv,duo-s from sophgo,cv1812h in documentation

v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]

Joshua Milas (5):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../bindings/soc/sophgo/sophgo.yaml           |  4 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
 8 files changed, 231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
-- 
2.53.0

