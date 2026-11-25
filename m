Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606764;
	b=rerxHasvda3ZG8r8qMgL3aPqySUkl1rbmoSP//yHOhEPTPehUOejYABsSZur4tXIEGeD
	 vj710xGNEGDWdBfwXYtP3lY0PSyaHZAerCtLmVbBkhXh59TGJBfjV/9KH2Xrq+F8YHjQa
	 YsS52l+2FrgqDQr4ZCo7eGigOM5qvGARV7Fz72IUZckq9vba6vKy2hUSfoUaGL6zh0oHF
	 mYXtRQS1ANsqyDee0j2ehOppJ6KfretH0zdPxxzkf4KQGTyLzcgkkuhNBSChtHrnU/6rG
	 lXM4sS+GYjsr/arikOg6brDDeFDGUffRkpHQ3iXkZFC/pl2hQeL88hRaUHs+k4KW0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
	b=luorzHBSoblaoDTNFzE9I0bioOsLTQjUl4jnosW1Pd8c4qROLUGfBmSN4ZuIWZDyxJJZ
	 lHzvmyI/PNNjR/B2ORsYq0DsvgotoS0Fa83bWCcRsOCX8EQFKPtz/H/bjl1HbbNB89Q7m
	 cgu2cGaIODp+Bl8+hlz4R0J+0l7Nz+FYgzQA1iryFyxBPG7nIbywW5ACA4333FGBxoPUl
	 Wqsh6k+RyEaQDjrgxwO3FR5zLhSGNNCHNwfWRdnai56bNCzgzSN2ulOEbQbg9apuAmYF+
	 uTDfNIuYJk+5Af4Dnl7+pot9qk0kO7TYS5Gk8s0dnmSIB/qBWwYe/P2kPgblIZDrqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGmtx8aw;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D560606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D560606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGmtx8aw
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so7960880c88.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606763; x=1796211563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=gGmtx8awMUUmFTiaXCzcGP7Dz3tVc3lapgD8z7utRcgQyd1sZFHWA2QkVj0mbX6zC2
         OC2zLdDcGNr9HE4u3RceXGAhHJRxgaIjkOG1aw7E/W6kWYS0zfWNHPrpTRgru84VJqjP
         xeeX8F/MC2/B221vKJBVnaMiELUeqkmpPUf7/IGLopSQaGK47cf2XW7cTqaDKX+Uyxpt
         BPRtrv5ozi+/M3A2MtruZK4iLiutkBXXcRVoK/6/rfPmqjwVaT144jf5Ln5RbB4MQzRW
         y8Z8JFhg96ci+15qF01vsqu6Z3o/qEW1tQbEancg1D+E4weIF0gNtuBXtqAzrwzgCz45
         XdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606763; x=1796211563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=FYLLD+LxuXgr3f7q40So1UpEhxcwdzlFTIUCoZfWs0zUJcS+HetnCtuEejPoKf6lxr
         riMgBNVdGFk7TfJo2720tTacHVPanVxlgUJV2o+mBCNRc2b6ru+kZg8pev5T/w3WPoF4
         e5N2c9W1tQBu/ph3A6cQFhGlIUonLpHev2iFuOEamLpWqaozN/csu3NduCk4u5TyFpo0
         BW1VHWvQh8XWey5Eg0mywwsZYsmS35qDAdSEOqdOXJrXAVISem/LWdjBnh+cu2GSAwEz
         33jd1NIiL+/+DW7u3hgsw2ojw/dU1o3/dzN9CoJxBJLenD46kMibcgWAe4C6eepC6Y1f
         kcog==
X-Forwarded-Encrypted: i=1; AL+hErHjaWLgP49aX/wXfELFRZ2g9ZR4O2k+AudjYP+x9XeEbLebQjfu8R8ZmUcUuzP0+k++wfrK/rEOJsF3@vger.kernel.org
X-Gm-Message-State: APuU4Z/2pvvCrEfpsM3rCE4xj4+jC36qI6LXpPBarLyThdJkJcWnRSGb
	KdE7d1PdMo5w6euFsEEAztP1LHKh+hT28QV6hauUwbp25BD2Um1uP31Z
X-Gm-Gg: AZFdTZeeFTm7U9tBToBOVY3w3pfum7n5SA2h/zJ+KyC2MvyhGtgvIYopzFTcEFWc2wD
	NcHy1rry4m5m78KCwRJ+MYCHzxIjY71iKosXEJESnGbPHa0byABcjnGWC6V8aq9573iQeCpGa/F
	tZmO8TPks5rntZGnkjfPiMqP1LKw/7Hi4mwvYdNQ9C0sQPzHdnplKUuOQHsawfrZwHJ7c4yzi4q
	7H9Q9Tl+XO2biTEbllLwyF2RL7hz5viglYebHHenv4GSUk6rYGtfExayZ3Rv6ODpyS6sheB7Xh2
	yxJWTxONEHd1jUlBsD8AneN8V5DW7W8yQCi+8x7mGeZxyO6IG/FL24AT9rvau223k/hs5lGpwgU
	Lb9WI2K0Oy2DXZs6Yyhw4zxQHTqRS1IcrESoI6OO+tQQwUv3MLhn8K9K+SlWAW8e4SOkrAhLNbP
	wThwpy8AAouevKOMuBsQS/u4Ufi6jJBfDR7pbQwsWCd4v1Nh8uoiOLp6aIcKEWypWUejuqGZ1z1
	WdxQN+7nPdm9KMmuaP9to1zzmqrKH5S6BDYhq9qtrVgHvy9gmXPV/uKzsqSBDvzeUmBV8vkbuuU
	sD+YwuKzs/E5DpLAxgsmpT7H2tMfsfap07Ted3oqvMYGudo=
X-Received: by 2002:a05:701b:4502:20b0:152:9e88:daaa with SMTP id a92af1059eb24-1b55690040amr17444087c88.36.1795606763346;
        Wed, 25 Nov 2026 03:39:23 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 17:08:42 +0530
Message-Id: <20261125113845.297658-1-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Add device tree support for the ADLINK LEC-iMX95 module with the I-Pi SMARC Plus carrier board.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Document ADLINK LEC-iMX95 compatible strings.
 - Add device tree support for the LEC-iMX95 module and I-Pi SMARC Plus carrier board.

Changes in v4:
 - Correct alphabetical ordering of the ADLINK vendor prefix.
 - Remove non-standard USB aliases.
 - Remove the ChipIdea USB2 controller configuration. Hardware testing
   confirmed that all four Type-A ports on the I-Pi SMARC Plus carrier
   board work without enabling this controller.
 - Remove unverified SMARC USB connector comments while retaining the
   DWC3 host configuration and U1/U2 quirks.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 138 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 628 ++++++++++++++++++
 5 files changed, 775 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

