Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE731DD96
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157311; cv=none; b=LXn1YUTO/nNcjlffyP1P90HCaLMmYZ6wfuEB0WVxZL5scegzQNQHZqwuzEsBYiUXZv8XE9IsR7E/mBHYs0oHQgnTnTs57HAt2N5wjJirRBZFXJJoZTSx+yi09NL0Qg8ocEXLslDUJO7Itp04m4niV7lgtnA4/ViLoxfdpXmtmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157311; c=relaxed/simple;
	bh=k02EvHB7w4mp/39BN6OIKPWUtaD9jb72GfIkSX9v8u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niFzzeBJVHlQWZbjaHSpPOj7Msn47uTvQY6uM2TJdnj6df4KwEZg8ijXE381l5i5GRWqWlz15PB4v3Cpi8Uq5gOkQ5SZSO7hcwNWA4F/O8xGUKfv1WNFwPftls58weLrM+YsUTNhEsIlA2HSlSRhC1EOR5gemwtMrilueytD3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caOKB6ur; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caOKB6ur"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48d146705b4so156801345e9.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157309; x=1780762109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM3VMI0Nk96qve2GMnnDFvM6zt47jLzS2qbppbdzoHw=;
        b=caOKB6urCsNmod/bPS97mvGALKmuN8W+2Z/lhs3AE7eowPkWTvKuYSi+A6mZgUjQJH
         oz8+1/4S1kMI1DUOYGeaiLwGjNw9Sb9ETxHCEHblMyFaOwSZn9ISq6Ts9+cta8FpVL/9
         K9UP0kWgphYu01IEKzKPfPIERtyRMGtEUyStUQCyh10crTZj1N1PNHaUqWU038Ysg+zX
         QJl/VqnnnRHvtI+MjoSPJcPemEjnUlNfDDH/d2nsuPQq52WCfYq9l2DklJFuSzSPJzpw
         CYwedUb0Jy4HgIILGIGwyNK8qcE/3KlnnoOiGqAY/PS3KFv6GjBepvcZnOzXe3ePueo3
         GRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157309; x=1780762109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM3VMI0Nk96qve2GMnnDFvM6zt47jLzS2qbppbdzoHw=;
        b=GIJ9++rBn28CT/hHPDNmkfp3panw3wO3ymUNp9AvfVvwL+VS7oZHGtG5pfSIxmonUs
         PD4N7M4RwApK2RSghXUb2twxd/WWHq3agJNdjtTQNqPDqV5cSfW7HIrtBY/g3RRZdIZV
         TRq6afpZv1gE+taPcoTJo8wH8aJ8ADxK77DrwE9aY2mO1sg9f6cLqyz5i9uv5oYGMG/E
         8YUxrkba6orQvGuwXgM4tu1MAsnRjrWbwuSSJLWLxN+SCl49MDM6GoFv7KTQAfSqJIkR
         l8+DzX5ITxHLmvnhxICRtxJG9pSRPlskG+dmw2VTsMe/iWu/Eh3DWclh7cKZqw+J3/P3
         HKDA==
X-Forwarded-Encrypted: i=1; AFNElJ8XxScH0+9/vunSmRNjckKSA/NldtYbFAH+37DMk/pPFbzQRNHAljaqQlR7a71pN5u4HKCgQyJuVQTf@vger.kernel.org
X-Gm-Message-State: AOJu0YyIF/Ga3uYQAi4Yem7mYytUS2wV7LE2SXUSu6cD5FFW33xa0B1e
	6FAT6qYhOkOdw1eBiAZSYsaTx1cgdH+DAYc7SaTpZOGXNTnGqxNaQDTR
X-Gm-Gg: Acq92OE3muT0TidIIrbBFjyDriEWXsP0P7M7PGsE0r/WyzB+pUlAp6PWYx5fj9icUAa
	4veKSILNX7DoX3H+8ZI0xJe6AWbDW1hMuIzuGDJUL2YJ47bqAYgahUS/l3ODr76AFiAKgOR0aWO
	Wc+t/ZYkGbyjoxB8anvvVZIxX9ZerHu3k/rY3fLs+Jcqki2SSBDyUiDLcU4PHgqfSZYXHmlYP6n
	m/fEOgel3YZ65itE94pFaGSycR8vnwPzdHdizCDdQBWXNQwsYzDKe6qPjBgnBxz9ANVQZsCzJpS
	gmVlWJY6h/FfLKoSQXlAcq02Nu9NbiPdUROjmnRIW76YbNzJyI5E/OSHfbcuZsF6WR92oenQz7H
	gclA6moaA92FqFGAg6rTUMQXiwq0DUbQ9BJ/zVCCLp+F+8qsTgTvMNn4Rz2IQbWLsTj+qOPAU1J
	tNFh+3OHz0yuon7NTfu+y+AtNZqUT7fDlveSt/MxZr/E+LDKqk24kRvYmFgPBXSm3tsVgEzg==
X-Received: by 2002:a05:600c:4fc4:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490a29637dfmr74828605e9.31.1780157308915;
        Sat, 30 May 2026 09:08:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
Date: Sat, 30 May 2026 17:07:54 +0100
Message-ID: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

Biju Das (17):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
  clk: renesas: r9a08g046: Add clock and reset entries for SDHI
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  mmc: renesas_sdhi: Fix whitespace alignment in struct
    renesas_sdhi_of_data
  mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct
    initializer
  mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock
    mask
  mmc: renesas_sdhi: Add max_divider to renesas_sdhi_hw_info
  mmc: renesas_sdhi: Add tuning_delay hw_info flag
  mmc: renesas_sdhi: Add internal_divider hw_info flag for clk rate
    adjustment
  mmc: renesas_sdhi: Add optional axis/axim reset controls
  mmc: renesas_sdhi: Add RZ/G3L SDHI support
  mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
  mmc: renesas_sdhi: Add RZ/G3L HS400 support
  mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 +++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 +++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 199 +++++++++++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |  92 +++++++
 drivers/mmc/host/renesas_sdhi.h               |  25 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 226 +++++++++++++-----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  71 +++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  67 ++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++--
 10 files changed, 889 insertions(+), 128 deletions(-)

-- 
2.43.0

