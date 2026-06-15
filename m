Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9B3E5589
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525040; cv=none; b=TlkplN+Dj+0s8WE+zcqs/EtPYaOl8WeDLkESenpvB3345oHk5A3gemzkdWuFfTieCLd0cwtkKkSPKnsE+iiGElFQ09/13ph1kYEYGQpxF8t4MhqTsmAWt+owA7A5n98oKNKirTB5gYVWB6RBoPNhHt5DC3DSaJ52eYKIdt1hqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525040; c=relaxed/simple;
	bh=q8hyA2uw+AulAXMplBR2AFo1kCx+r49U7bh2hgrXIiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hMWqAt+beD8IHropqBYStYdwbKUavmLhliwpjsuTTFydlV5bT3IAnBhgCxucWzow1oVag/7t5onRme/hK58mq6y45mU8ABPrf3gY9G80NBmASoPgF6L1y3Mn1pk7QD/NkhKoTeXIHdC+PTgViZufwZjd9SKxKkSy3sCRwl6KdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdm2+/vt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdm2+/vt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-517654b8e28so22618971cf.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525038; x=1782129838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=Pdm2+/vtGuK2on7+AY7g4iM/Oc3SKS+sI4EY8V58/mhmdAex4ose9pPuhRRuu1HbnO
         rhNn52An1jaQv2f7kqoAR6vxkn1TiBxPk7FDhdFXrJy3WNUunBnEpaiZrFSSAN2jYjAu
         LaEOclphQx+nb65X4KwZEvYTzKgQzUBSL3QE7ZagnVK1NDVvfYJgQd245uox4kKjmT6w
         foSRwmSi88Jm8fzLAaNvNvDpjSEku4LQqVMgGpzttuaIoJJj8vxH4BZMNb6S9wI00ZIj
         nLZSH0UoRxTf/6ZEbFwnn94Jkofkou7Yb2PaQnUz5gZWILeGSRDKyGoKAVd+xplTEQZ/
         sSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525038; x=1782129838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=q4Mfp5ImEGHYJjPqE502nRUbDlMvey0df/hWnTk4e21/jr+T/RBreM/jX1YaANe+xr
         bjD9JFQ1TFOdaiLZP90RtOvsZvPgcJRRnzfs72mz3k7+8CFtJ1HUO4mzQTskTaStlbCy
         AkAEn79x/ViUIjrdSrHcoYLxwjy1FvbGMKGit49l8sGJRcXV4ZOOKtzTz8/ozXQ8Ee6q
         GyOndSU6z1jRw+4IQPVS7yCFWYF+PsamG3kNMMK+5pztVgRnC/T4PmyWwCJgfQPCjMZq
         mDGbCwq0+XfttofcBE6vW2LZFDK58jMSTZ8+UHxTIjv2ZGamCDoJujT/WKuOvJUvQDBs
         pguQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aAT05d81kif2T7Bycm5T6/wYXF4469BBKmjSZA+UDllo1W4yo3s/bFOUDjB608Ikfp9aHcssC53yW@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKWCQxQ6VchavrKgFPzKxTw+T5QfFlxK4zQDB+TIY8Za2bGCU
	SR0yPGW6aSnPfGMcSk+LpNf8gLaDXgUvERSKrao+iJM0l/+WMEFst0kU
X-Gm-Gg: Acq92OFnxIJbzCFEiBgyS5rM4eD5kQQVhTkAZEInCMFWCAoDvnzrSwl2fO9pW57jjo5
	U9f8kVbUlXp6K0gelkYz3r8OvHG8+Z0wSOUAq/1y6uvGSm8Z8wZa30/nS9rp8rAqADEq19KfqWu
	DemeYqdBtZjSKPWJtvBT1/V7jKb4EdYaOn0RZhn9zE6w82SEYguK2bsr7M1YoLrT7W3Th4ATtWC
	6Y3Y3BpFg1dSC9Cp8E3MMuZbKsV0uKYJ4sZJeDj12uROMieDCVFPyQCA4dXsvWwj6/dJyobBlkO
	B4hSLJicTa2OS2Sv8q6esQ9gFr/lvikokMv82IfR8AnRyNP15Pi3PByw+5UQQuetUocOkieFHrU
	UsPjIBe/oSO3LHHlrGNrOCBKeKXCNP4ybJ5WZaOHpEunKUKbaijIY2omYBDkN+qSm2KqUB4VEsI
	aerYNvxz6iFM6YwVNI1EF9gzeUHp5zkWkpSt63tH2o7Euu7Gm+kQGrpkvU
X-Received: by 2002:a05:622a:e14e:20b0:517:71d2:37d2 with SMTP id d75a77b69052e-518e47232a5mr108016231cf.0.1781525037993;
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:21 -0400
Message-ID: <20260615120324.1527881-1-josh.milas@gmail.com>
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
with ARM64 and RISCV64 to boot from an SD card, have networking
from ethernet, enumerate the wifi chip, have bluetooth, and can 
read a I2C slave device over i2c4.

---

v6
- Patches 1,3 from v5 were applied
- Rebased to latest sophgo/for-next 
- Added mmc1, mmc2, serial4 aliases
- Removed spi3 alias and node as it was conflicting with sdhci1/wifi
- Added wifi_pwrseq node for wifi chip
- Added pinctrl configs for enabled devices
- Reordered &sdhci0 properties
- Updated &sdhci1 node properties for wifi chip
- Added uart4 for bluetooth
- Changed memory from 256 MB to 512 MB on riscv side

v5: https://lore.kernel.org/sophgo/20260403111516.379795-1-josh.milas@gmail.com/
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

Joshua Milas (3):
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        |  53 ++++
 5 files changed, 545 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: f7337210bede62fc7c6230ef58013dddf7e0a921
-- 
2.54.0

