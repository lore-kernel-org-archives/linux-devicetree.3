Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FC378813
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719468; cv=none; b=EtrdhmcTQjnBHlSFz2Tjb8hRRmanuDw0WnBhVK1D8qK9EUVZhtMDrJDuOyT94NIVtLmsaqd+LCtUl1fmpv1U+UXpkResWzUgTBNOZL2Sw5w5GeAJ8ckma575EA+3xDKZA0E2Ofgx3jn3Zcc2q6bJA0ykM+Nah2VywSDHGlnCn+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719468; c=relaxed/simple;
	bh=parGt3tZhlgkG7Tyg0zyRirZEztjPzzRxqDmCM7EM5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maVyNmgCJcgtMn7avezgF7HZbQoFIF4/KAOYk2nepyyJ/7amBsPcSJwb55Bsxdw6PcIiZijdE7cbmrM9BLwjdLyC55L2nnrvWtRcyqBtKqJOvDNXkT+RO97QeWduUQLsAvXhYPm9hgPtO/1N7ebmhvPZuoOPrRxtIlju78OianM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGXjU5tx; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGXjU5tx"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506251815a3so28532901cf.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 10:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719465; x=1775324265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=sGXjU5txKH8U2+M1A7hzfohifA85hi+Izr1iGbXkhqTcTK+Czm2Mt72KfUoFSo3Y6Y
         Lg28/p1lDfFeAd1CaRbDcFuMeehhQEzIwkJMeQvZ7HRDc2aqhjap4PoxQmQLkqJxKkOr
         E2AB4yFlb+tW57u0dPtRamCBqR8uFdyQT7BvNcBnyiAmZ3QW4xSwQStDl0a8SCtBcmML
         1MyFDvr+kHXvzPYB0/PXTNZwpU3/F/xubecXLCu8tjc7erwNLKHU1h177EfFhWsXqCEA
         nNMC7rqYGjmY+h6yXErgXJRZEHC1XsclaIaEQNJgXd6rYlMw4b4xqUE9Ef1QtKPT5uab
         BRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719465; x=1775324265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=e92qqEDCVP6yipy3gV/TCm7OlwnyU1T1JEMLDUJ1HOsDrchspn3k5Z+79sDSVyB+it
         aHkn8OSJeI6+1a73chRyx7GAFY2m9Vj7HOD0ScXe+X/cFUxnFPKVEfsUwu2AHR9m1bQ3
         XOtRq1fXGJFDvvgkP0LXwC9htaDcIVJgFTIdilOnIk7Q6L0LdAXjGqjEA/1hcRhTYhKt
         j6/Wot+ZS/YgTGzll+nM4byk7D2FuHmluXTMCOkHVe6nklYr71F1XXrVUvwim/6PPtj5
         HEPFzhYm25wLd8o6A9cHtc4AFYJ7TJd+ypimkIDssvCLRNNBbDnMPcxjKpN471Zqkxvv
         slFg==
X-Forwarded-Encrypted: i=1; AJvYcCXfYBL/mtmbPAeiAt6VfhEPsA0iHH11iFV8ApxzMkIMMwsEXqLtweKbhbzHC9eYtQKtxMCaR8+ibkiX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8x3WcsSG6lW52RMR14VYYX8oXHtunLq3CUHvqUsQw0cZB3jCK
	YEc0hOBzoVwOuNZeASBoy0k25RJEUw8N9wr0+NGeZOM1ttEF0FyldcY3
X-Gm-Gg: ATEYQzyZtB/L/GA+KdT290pd/rA1q6KocpLnKog+5WydCM5NND4hmjMIxtYC/IkU+ko
	ZvLAeCAk6Jiku4VS6tY+xA8RjsFdASbgFVgN4Pz4pGrfI2Jdpu8w6e9BK6ADCNM/Jx2V4wXXFqx
	bd/eDFluodQ7QPXu8RyFhLQSjAvlTCrPqdtl4FKnsScD5XTV1/Kna2aY1HZCO4YcZ38Ryg+4ngY
	B2mBx5B3SiuhsGlCjjbrrI2yvc8uY7SumMgwE4R/M/Oicl9vH9rduquA94pFlXNOJfweor1ARA0
	w2M34W9gBnekHG5fxQbPUDujELhaWLvnHLlx5n7mYR6lrlTCH/DsA9suQZp/canf/UVnmktCsym
	V5Lv7+gmsbiTD88l4MBA36nJ2rRbshvpJXRIE7N+B7XScHfhUhnIAQMf3vZ7vsJV27xW1PkTANf
	bk5HEmcc3DBGh08VmGP9V7vArOhORBAG25DGyaqCp5lTmy9dY1UtLzfseYkL11qID6FhA=
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr89481621cf.64.1774719464707;
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:45 -0400
Message-ID: <20260328173450.219664-1-josh.milas@gmail.com>
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

v4
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

