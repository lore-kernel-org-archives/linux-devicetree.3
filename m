Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404974;
	b=kgBh0pl3A6RL3UXB4Gq50UJsEv15V1lIei4BuENVsnatwrAljmVN8xjwAuLrTpLJl837
	 +8F+H7McSkeW0NAXw9UJmmVGK0T0rCFLFXrn5EUJf+PEmslwMPyubmihKhe34lhEvID/m
	 BwLpMU2YBfOHZ6/ag90dF5aC04eNDki11xcWRNC3mieyOOSVzOHvISpl1YlpIyCzoNSJ8
	 veAOSE3e3N+QGc/ldrNIf2fY6RhKQ17YjDwHsJB4qbQVE5HwJrF4PRHEcg2jskotZaIoI
	 bFtJk2dwjtO3HmM7X7fpq5MctsCg6b9oOTeISQJtaAJBFOd4d5a53Ws2bTY706NwY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
	b=2L8lcU2ecl0mXoqNqjC5tVxC/sPyt/pttnlcQVfkh3DRhRKcQCh1kaj2t00Jdkx47dXr
	 7aquFwJJ3lIRFW5uLmr6VqdYSpOpiJKMY1UevgtqaTvfuszl+DlDQZq+XtguBnTu3ft6w
	 yVDglrywS2wYxmy2Wfb4IUITDcQDChGTEUkE/rjwrUfvo2a3pVIrlfitDFUwwFXwvu+Nq
	 I6Gd+YCQwqVOJBfOMkq8TXclLOCecNeGeY1swJIKFyoWddcFkaMRulcphZtNX2z+24G+9
	 Oc6ezcznXVjiXyjB7eQIaedTV3M0ch+EG0Y/nF/3WCEjFVvDjdBUVqxWD+JBm4eDhCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVNkjc4l;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31563606A88B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31563606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVNkjc4l
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b32daac9d7so24598207b3.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404973; x=1795009773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=TVNkjc4lxMGHzcoYn1hWWtBkdOerZ6f8PMi1a8bYvGO9yJmLQC1Ai2FERmjGsg1VXL
         1hGNlIYrYCREyBZ3tu8x+AXyByHlD5PyDLk7vJYGXW05cJfVopHS0QOfYjerKMjWxqzg
         hTOsTqTOWVHuevHdiit46LEQTtVtQkiIlHDi/ODdWoTrqU8pBOIeZYJqs0fx5pvfrpsK
         iqGQ5uAy2bbhgavb6zdL4kp1puBT7n9pBG6meypSw++eRu4/xCWDN7hfPQ/XmLFZLuwE
         g/SOFwgzhCbq0+6R6yo4z0Z8JQBzHUox2P2kajye0io7mWbn1E+8bBEmH3xIRINdTUvj
         Kddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404973; x=1795009773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=aZJFm7crh5TxNwXXR7xdOfenrxnRHMN3/N9UbbF1YX+uVyYEXNRlLNTzmTxTlFDy48
         eVKR58KF3QS1bOkmJwKnIlpCo2VLBocCLhxbONGcL32wQi7pvzLQlDWBQcbATdUKS1Ya
         m9L0t9r9yTWQzntUlNQ78Iikhh/EnxvW+63lt2I8qpvcsL1hMvG6WOLlzBxmwhHHHsGJ
         XMkUf00wrJxmuva0LH5k+/x54k06kn7PRBGKGg3tZLgeiAG8YwrTBDkWkTfNEA6h1nQB
         N9A6w0EYicHDPneSYFAJPUULxJ3DDeQQjQSJxUOV8D7ml1vHSqUy9QH1dKNLFh1whUxJ
         FXuw==
X-Forwarded-Encrypted: i=1; AL+hErGIYn2AG7cpEQ/VZSeOjXNyMOY9Y12EENssEUaJs3kRRFmNIugzFhKnWm4FR1xOak29EhFiO5bF3T4M@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q0mWtYtBFtTkCVqnWpUTHX/VcdICsn0v1xnTXp7opiPjZZk9X
	hpS2fPrUxYAcgqbban6f2qGacr64XdJL8jNGdYAWYCvhMG1K8fGRfZA2
X-Gm-Gg: AYBFou2I8bT/rcR1SmN7VOMJSucf8oq9Jth55v2dgiw4OYZ6TwVTl5L8CVQVe40FPEi
	3MaS8pB+5KxSSFyA9miUArXQBpEPKkrLi2BsnP34qcteG+fGOL1Rjiv/inJda16P9+JMiO0ZFvv
	jM2bCj9vCIvpJc7n3gcKKR4v5armonBta8gp/IZZtSNK2naelW0yI+AWbAKQ4eMkePl5l7j30Jq
	Ac4w5wznKjAtCLD0xlsB7XPgTwGTJf7IdlZDHPas4aAMkCJsMrEB1B+Bm+TMNpttLkaPcUTQl01
	PfY7zbsKzgMeW4O3Buft7xoazvUp9VCfp8pkNwDgIiRBkIjG6t5xNSW4uaePeZXbHn95eb8B1vV
	Hhzcmlnol0DWpZ854uNDI7IUCDNrTW9MYcXyVHrcRkdQ2YGn+X6ujkig5vlXmynOMVyh7wCDX5h
	vpzezbBgOieOvnnHeFt/o96U6u+5aZ1l0WnRlrJn7ATdeM6BFbfje8zX3x9jmYvvJlAHN5t1v2O
	a8u3E/1gQ7fA/X6LydXCuVQ9B5f2JC5rNUz0wDB/rHnMaVfgC6JJ8inm/qwX0LkczP6zF49iRRD
	I4gCyi4ngoWFE2f75wiZx8V9RMRhdKh+XfBnr7M6OqVWAtW9iBx6jmep79np3h1spiOszWAWRhU
	eIn++GsPxXh1crcSNKpH/2PfYqEmaqMqAhFWNKTDWj/YvYD5RqebnLlNwk9ExDVdXhV3enZKm5T
	o=
X-Received: by 2002:a05:690c:399:b0:873:5c6b:a31d with SMTP id 00721157ae682-8b3a80c2c99mr17468437b3.23.1794404971972;
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Wed, 11 Nov 2026 10:49:14 -0300
Message-ID: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
A733 SoC description and Cubie A7S DT [1].

The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
card-detect line, which has an external pull-up. The series enables
UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
reboot/power-off and CPU hotplug worked.

MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
tested DTB also had a local 16 MiB no-map reservation for my boot
firmware, which is not part of this series.

Dependencies:
[1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
[2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7Z
  arm64: dts: allwinner: add Radxa Cubie A7Z board
  arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
-- 
2.43.0

