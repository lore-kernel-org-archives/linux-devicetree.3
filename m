Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833965;
	b=BZB697cnWY8s7r9+Ctduqbncvk/utduf5JBgJxGdGAyIaj4E+3C8Nhyx6wTFThXXusf/
	 Pau315F8vdyrJ7Ca4SvnhHUZCEt61z07o6G+QbqxTeBBpD/7z5BK38c+aOURcA1sij4PS
	 xkterwXsqJtQdx7Ltxn4nV/SfVVXB9rrnKsVZayKbZipDppgvCo7YLU5acS9oRxDiuGJA
	 ZS7PZcj8Xh6A9bA5XaoBy4hhcdZnem/yqlO08wRD5te50SBWZ4I/d52EavwNgcfPy2Q6j
	 3d2mqa4hICPHQ/ekNDlZyw1juBWE+33JALIb9k35l9DxWFrdJohZrndfBxKrsnPn4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=IkzzPZe4ek9ZO3D5r6pysz0uWbT931v1gIrY007bIUrU+fsVg8d3RXOknxCOwa/GtFjF
	 FlGpr8qypL6XimzJgGQCT1L7jEfPR7C8y4R3eZvBIgIAgvpYTXmHIayYwo5SXgq2vO9jM
	 bbCtmpKph2GOjDFEjxczJgl2AhP8e9jHYMNQs3e4bYT63MlFf7ZYlvllSa+Dt0fhn8Qmx
	 Yuab6pX+Tzmb7C/ZtKbevvi82RCT2p5wN41ALODvalDY1/fCn8BOR+6bsQPJ9h1xAHZmV
	 WTcjM8pLZVA72DC8FTVsWPqCAG04uEkowgwEhVzK12TxSIVLEVli+zsPIeRkuRq0t7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K9k1Ywog;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64C606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F64C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K9k1Ywog
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e812e2b31bso9278075ad.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833964; x=1793438764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=K9k1YwogFvOOLanyVvhG+A0pGAz3/TOKZKGBKQbinaGMvITLnldoPfssMmSqBrKrzz
         mJNBVSkJPpqAV0Svhw3lcV1eqXLYa0OLfhV/j9ANUwHanaIxz8a4+g86lfQXln8gz7Q+
         oFuwAXLJy0jgzdf2U3jvzwUQ4XypEbwl+RisEOahJLlS/jfx+g6ZXSZX65qvAe10CeS2
         hXq9CkoAkPBw6ZSosy8xiUKO1+qyi7JOAwdGfkhXNo+9gngD4L88Cj3yMrHrRnJ1MJ4Q
         YlbvH1ADKI5TFTRJDGKIbjuTBaNW+uz9EWcCHl8epHeub9J9wslSMVS9TKiUBB0EjZ6f
         JdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833964; x=1793438764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=2f2/4vQrYqzRB6pgPwxpW2pFgDQCWn13fi/ahyK3t23nz3MGWLlvWSUzrJj4kBHxpG
         SXRDo3xKXXB/L9QejXCQfiyi+zPVe4jvFn9TEifrU0VolCZzNwFl1VKUfj0akstnOJbk
         OXRhZpU83A105gDbgHbD+cxeJnwsxatAf7x0pZbAztgvhqazMx3CLMWDjgKxUvmcrf7E
         a00n4yChjqZ+6ryw8L21bUzAqtj7H46pblz77K+1efZntK5dxQ2EPN3CPiNBfZnmpj5D
         nMfJR+xhL9vmj/Wm/zzHsi9itZXYKWxeZfX3ROY0ADi9vmjvU2Ouw0TpQGcKLLobxOZu
         BBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9ZK6N3M0MDtVstAn5jHtSwTuUzzWdZKBYu5+KnWO2m+g927yuW4IL1eB90B212arlwApxZuRgEDNq@vger.kernel.org
X-Gm-Message-State: AFq9FYKSxaDuERNe2BXO1PkXVLKx7Zl9xchfr5lS1Io+7JOwx9eMtp1L
	m9WHnexf2cRGL/JnMuMvAMANUtlND8AS94cibC6/l7jN5uVy4DR5ZrjN
X-Gm-Gg: AYBFou1Bu3Ltlpk3+ABfjzrZJHwxtsjQGhhWa2aTFf8XH1gF+wyLeQe5++sfJRN7CxU
	of5szUquP3GXXCSUXseuRR+lzWm2g4WQFLBHcs+ccRLghI4tKK8tc1rvElMh52Lmb99qNp2O2Vd
	CUxRIxMPPyR265WvSycvWiJwiNnz5kan/OxWt3Rzc3PwpXMJcfGaVM8KWD20kmM98IEgjOqxyF/
	8dg8ViHtyRJKQHpcnXwPWJsSHfC/7csJqWDRIyUeF6Iz3wHL33tiyPnPh3EGto8xmcczRVg6jXW
	CHkn4HklhmirIZn0ct8GMs+uNHjK0yI9BRtRyvVlFmCCGWqrMLDB2EL9W3XuSJul0KG5sTVTnNb
	5E0IaFUsZ7CGQ2/LMx9njG8wmQ8/UhQCGfgbL2Ez5QeCVByYwGvoZNFUOcsPtRO/4NDdF2Biy8Y
	kXcr6Vmd6dYREyEuD5KUN6Se7WFvcun2CJBdHLwiqFd7Jt5YRJ0DaGq+xcpvYf83KDe3D1rt3BT
	NfEwUu++CHpRISUFgGyLbq8C+BCxqMrUbcNu7SW0LRYJ2LPE2DCrPwAZCHUQuOwnrrs523cDSg5
	GFVLZ5fpgIL+gi/NYLLLbHiu5le/B8xmr9nwQd888F8fsxMfZFXIEFvFtOnuPuwB0diCmZT7o7y
	MRsYByhEiluq+BY8jTkci38/FlmS0EGgdF7A=
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr1496748a91.32.1792833964552;
        Sat, 24 Oct 2026 02:26:04 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:03 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:56 +0800
Message-ID: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
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

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

