Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522426E718
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214961; cv=none; b=gVnfFaV+q5+G/SYH4Kt9c1Dx3OZz9rdOs41+v3nEXqmzX5fy2oYJ/mva3G6xH88G7KCacECv3WhHyWcPDStqG2mxIbduACc2YIFPGVjVJBOE9yta2G8rA7MpsJxVsWArwNV4DY5PSn97j/tpwOQwv0Zp2G7NrIW6RUCcJlJX3kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214961; c=relaxed/simple;
	bh=oFEYEJ7SA8sUm/pXg5pC1/BYgPiYYcdFYQGF/ujaB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8F/bSG5T1aGx+a/9KzDP6/Q+SraOwl2piGhykF5ESTGoUOLbjkWh7hV1ysWuX4FrskAOZMkcoPHVBJAUC171FPpeHQbXfCK/KzK0N2w/ywKrf2p9dxVeoQQNDcNPvmslItTM/TiCykvQoD7nHLX8adwJTNGItbHJQj3EmiI4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgOcIj4m; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgOcIj4m"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89f1e767f92so16256036d6.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214958; x=1775819758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=fgOcIj4m3RtuJC4kq8D860u4rpAeW0Em2ldYtKyPdBKkGYqFyvm9csXy05P1pw84N/
         u1ArLQuk7TTv+AxoVV4dWVKIijmS5aXoLgZZylP2QlcNUt2FgmfSeXTITlkAmqW2eNii
         dyKfPC8Kqg8jVP2FsDv+uJ81399N2is2N2wJgZaIoTUgAEMH7/ZXTEeipNcNayCAnNbH
         u8uCQz87RsCFnyYzwcGGLR9JiD7Cv+2PkcwtZVFu1oX60mZ84htdM1Z1qT7k0rzY+JEu
         FzwDjFtchNwObvekYLY6VE7c5YE2R3d0mS3Th0IAvwyf9DhRhxGCoDNTvTPnvx+svdga
         Epxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214958; x=1775819758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=aMXXxy1NIpzL65FHlHQY+I9Jn4rfwO2euh+6GPjI6WEuOlGp2UMYGvP7vmc4YHhE9M
         aCAp6Giuzu8Rs4+TUzn7NxQNtc5nKicApJTnLij35QqstCJ4vkqc6/0zGkf/1f57ubDV
         +jtDVXsHDwAHJMDTGHHwaQhK+O/ZLoK9g/UemOQYe/v/qtkixeferawONYmcyrSISkj7
         ziD+Q15vhKhLZVdqCcG1bfAL35fy3CahVjcxQxaL4BHKyNf72ihoFJrZ97AssgyxxmKi
         C4bv3pJH1vqehymQdBYm2c2/CN/rqDaXaIXMhrFM3pFSnSYaYVBZDKK76hLa/MKk6Kub
         7r5w==
X-Forwarded-Encrypted: i=1; AJvYcCUMFDYDDqO5lXgqYVzeMp6E2nNYYDOnnEI1nxtPa9bUy5L6jsMia//wEQ0jmmPtDWdJ2/VaN+WS98kN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wTPlpLbnfCbJe7tqEBWnBTQwGHxd4fxUij4EkKq4OARz79wA
	xorVW7Sqjs4TRH7Ef25jyqPhvVoYXc0yCirYtol/UT3i/mEDxVMASiC3
X-Gm-Gg: AeBDietRQjyarLitulcH8pJC/OA2MP8OCDGNUBDJU2UlpsyUGJnyJ/oIHyggb0pS1Yl
	y0x/xJlefdmJSxD/1Bo8QUfQ8cU5d8Gt1fXXgHZ9deIjohxvI0u2UC9Qigyq2+Vdm7P9EzAJS2/
	WSJOyB4ajULAlrX2260O75jlGPa/WUHbFER60JNVnYFRmmmnZB59HqROS+KfgjAh7PsLC25mWPV
	x2LC8fxLRP/yQ3e9vvS+NPKVM5sijeY3QIqNhJ+nzocWFhkxRfLY0oEpw6xZa2b4egotzaWFZOw
	6zTAAWVbBQXOSWZrHW+x/aa3waWCm2qarzbRq+L+jK/UCH9je1S178xLAC9kxFPrmi+cUpRAIzs
	ZlpFwRYG5r3+2camIvB+UxE2nkOnpcxqDLv9Wod8XMyTWH3lZD5YrmthaAxLKX3gLTi8Jh2YUfk
	W3Z2j05pMkGkuet67f2rNfnaHSDcoVymqGLGD8OSg=
X-Received: by 2002:a05:6214:226c:b0:89c:d7e3:7f01 with SMTP id 6a1803df08f44-8a704ea730bmr37757456d6.48.1775214958204;
        Fri, 03 Apr 2026 04:15:58 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:57 -0700 (PDT)
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
Subject: [PATCH v5 0/5] Add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:11 -0400
Message-ID: <20260403111516.379795-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

