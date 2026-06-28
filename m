Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6A3AE6FC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676764; cv=none; b=UxTXNPMIR/MRfu7ELjD9x2BNp3nb/RP7xUQauxd75js+JrvV5aO3bmQxv+nQcCfO5pLT0WYnbR3tcuc1jDTnClCUE2uoZmU9h8Z3bk6IH71TjzUhogS/2ywtO+ir2YDdMheNKxSDtSdSeqRuqrHsAq2kllOVrfYKJWPlBqurF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676764; c=relaxed/simple;
	bh=Fv1CihNl9nmAyXfMSXLSZWM2RerBZiZvUFY655DxTaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HKOS3t8BfAO9jt6uJq0Rw4rWAflDt+zosfBjoLUBs5+Q2D6xYeF/4PhaSraQX2pShdy0TffVbGEF9tkG7UcxBThQT5OR3l4GS1KdH4EJ8ttuthE2UikDK5flz0MQTbriG2pzPrr4zFruQ5+BW0UfHzxaVBLa1BTBlbk0jHU2p64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOT46UMw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOT46UMw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so12089795e9.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676760; x=1783281560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROm2hqqBj4GdHIRS4cap5cywveSuJBdWyJrDf52474Y=;
        b=qOT46UMw+y2MokBgtEh4wq3faSJY2bp1kt+y3zBNwkpInarp2SpE5jM/XP2nzuZvfM
         0g7BxSDCkgi1hisuzGpYMQqxZATOp4sbt9VmRVbASeOmnYQn3fGlUwli0VXNXDctI1ZW
         /HdnSll8MnD8IyphT0mwhwzYMdXENFUdbVEIEHRR1f+tkFMMM8vSnETXzdKSNQqptJTG
         d6preCV+U9UsOTdxUH1/4lTUyNY1c9hX1zLsvyrTxAtHhav4byRZwKsnxSZDvw7AqB3N
         pZ9f2Eb89dvBw9kDtdHvNIrZuTjXx4wMmQRAxziPM7l6eQnzJqRdNCHXrwflFOC0xOVm
         rgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676760; x=1783281560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROm2hqqBj4GdHIRS4cap5cywveSuJBdWyJrDf52474Y=;
        b=UVZU7L7V4K8dFbY/+rXbe9qf9sVMMnN2Ho+8nrJlcReV/mqJvUhajZomhb0uJToPx4
         XyzQLZ5FTFbLq5QN1ZF+bEqJtuBmaxxb2y0eSbcRX1rVRlFBBZP8rXvDf9gQBKY4VIB4
         Qjy4j2zJmZoewOowKwRjrCr+LdhZJiW8kvHZpfJN6b+/lEHgpItOY50F2qMXAj/YEMBc
         2oKUbi3bn0npQtjdB842umYmdWdzD8pd5UKRRUvdEWTNtocZNBFq7X93xAaKiylZPpLe
         heAJ2pK3nEFolsnD5wEOb4OBnudajTQaK1EYcmE3vsK5GDhXo5T8v/su7KdhOxovA/zq
         mWWw==
X-Forwarded-Encrypted: i=1; AFNElJ/j9iztKgcstpKauxNlmpQPm0TgaiDSlk+Fn/VHcPIvslMfztwMy8jSyYIlSNhmLrhm0vMMqPHhWheA@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGsR3j2f2y8isxpvmoCshhnDogUSiFV8d4WF88oQs/tGeoOC3
	4SSHF4tSG6aogyKK9Kd3as+D7JlEH+6/R4k5n0gDlpO3uDlCflDAWMTr
X-Gm-Gg: AfdE7cnhUidABCmux1NXDyRoil6CW6Ynn2U/QKIhHwpHGVczKp6tXEpcnEVSRehMtJY
	9+4eLtsk6tTHnTHvfM7e3BN8nLQ44SNPKrLa7GIZyBrp7AqIZ3MX3lh+bvvrtw7Y8/WzDf8v2lW
	zEI99wESRt/viZ3vc+rHPhRc+TBPmSM8ozLKOeFYDsgGZewUNl0uMuVANWP1Z0dii6t7ikACHcY
	m+juXhjozQWybMq+Odbd4BRqNsD9HIh2H3ielhrtggGV4Rwy+q+8JCto3FVTn6HqjmfmN8vReAX
	yNxgrbzJIZMwhoc6ECQjX8eGVzz8oQsllO2ztHmnSBxyK0U7qSo/mYSV6WbmFF/rsm2lx1aIRXe
	B/iFTdEiuNHFV1cQlB+keAETML6htij9Pp38oWkEK6AoFMk67d8O/5iBf7EW1+iusk7DfbiM4/Z
	blqOq4kiJNqhL4SU8tvPtywO37JWR3vRv4rg==
X-Received: by 2002:a05:600c:8718:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493a8ffda72mr43293915e9.4.1782676760055;
        Sun, 28 Jun 2026 12:59:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Sun, 28 Jun 2026 22:58:55 +0300
Message-Id: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOS07DMBCA4atEXmNkjx/JdIWExAHYIhZ+jFurT
 QNJiApV7o4JSInKcmx/v+fKBuozDWxXXVlPUx5ydy6DuatYOLjznniOZWYgwAojBf+6AIbTkQP
 pqJCUhCaw8vqtp5QvS+mFPT89stffw57eP0p1/LvxbiAeurbN464KkoIHhckpbawBdArAGGUwh
 brxFsljbHS9tA55GLv+c9l0kkvs31KT5IKT9C6klAht/bBvXT7dlw+XxgRbJ1cHxQEmQTEoIZK
 5dWrjAFenigt1IqPJqaZJt06vzkq7Ov3jHKL2EYAwbt08z98K38fElwEAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4364;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Fv1CihNl9nmAyXfMSXLSZWM2RerBZiZvUFY655DxTaA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0LRjTo6T3x3wVeb3a8ft8qqPCkjlBZn8emn
 HcKM3ftiPKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9CxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI2vBAAgTDypEPB6CLnSUXtURRjTeqZln9elDM
 4O2OfUxAWlPB95gweEa9sf4WmLFSinn7RWVGUEXmDKzDHhwqxM4rMArAMZAAVrnnziYUdLm82ie
 bxDgqkdLmokL1gH5wJ5JNPC+Gt6vgjGcxuf6jIzPJxA9+F+H8W/ar3aBr92yY+pOuLWvJQ3gpEz
 ylsSwIXonEXdStYdVVuXVV1VlK1DfW+I9ENZWgBpK55nfCxGo7tIpcqjHlQx5hqSDe/Cq9+Uckq
 0tbC1+gxwXiv6cRf/P6SDEqCyBaS3Dh2BQ5aqh5MA5KBgFKVRuZ9o+0AQxsq5VgMBtfOY3EH/I8
 yskxVynm10iJtDuN4z7efn9vWTbWAdFYc4Kn7hqMcq1HnEy/ADvMH2rup3qD9VmiX2WeQzeiTR3
 +gfSFW3q7bBn9W0+ZdkXUpnHruhkppiVcehXu0zwxU31Bqo5T4nGR8mCSopX28vEpNM3D1d/Bvl
 euaIpBWE3NfN1C7x93BoHmEwix9mv88JbTmSnlnD6Hbuzfd7+TBHFt8191MUn0xjGQ4dZENlh4y
 rmS+1J8YGTIDFD9Zet1MkcDHYrizJPf5s91y0FEZqsXrAh2CPirEWnEHb40gW1ofTqWh2h65AuI
 ZYQakUvg7u0d2nVkRljhPVx+l1mkoBiF8/8Md5s/g7KE0BOcoUZ0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 5 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own mfd/aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: soc: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: soc: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      mfd: zx297520v3: Add a clock and reset MFD driver.
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Add regmap based clocks
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  96 +++
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 177 +++++
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    |  85 +++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  97 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  28 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 245 ++++++
 drivers/clk/zte/clk-zx.c                           | 192 +++++
 drivers/clk/zte/clk-zx.h                           |  81 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 848 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 485 ++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 274 +++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/zte/Kconfig                            |  20 +
 drivers/soc/zte/Makefile                           |   3 +
 drivers/soc/zte/zx297520v3-crm.c                   |  76 ++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 171 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  61 ++
 24 files changed, 2960 insertions(+), 8 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

