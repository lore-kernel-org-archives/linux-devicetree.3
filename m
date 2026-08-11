Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A536119E992
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424569; cv=none; b=f6VkyB31HGfX0dkOxM9E9ZBPdqGJezAESjb0R/i2WAr6m321yvVqytzgTNSABLXJm+yWnCiMucS5tPBd1BIjyoS8TaSKIwesSWATLH1qe/fUydRgyhG2+4qcVIeGGGf0THHuKbRq/+8AQprqMFTKnlWfeHXaQClCDi1UOcmcWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424569; c=relaxed/simple;
	bh=0XOITciiOnBra/r3Ajx1I6Wub7Yecid0iLcQTSs3v3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bf/cik0qiKtSFFMa7jwXIGg/+izFI4bHDBvdfLXl3djoBRCOReXN+yH4IJYxKUFxkB47X8b+HP19FRf4aspqlKhGicakoWzfbo5XXkf17Ru7hLKh16LGMG4PvM9DEM5kSBRDh1CWatbASRcD0PqfQn3p3VVnfiLQX1D5HQD49Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvzb3w7Z; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvzb3w7Z"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1904099a91.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 22:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424567; x=1787029367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O7xUkoYVY8AeKODvISm0XPf0ZextZDIpWMTL9lvpDk=;
        b=Xvzb3w7ZLk6dETwQdORGpKtV0vwwKLDWbylROHo7Us7vXc8RrMCcRwoNLFWiY1soPM
         yNZGhJpER4bwG9pMH8mHmcCrhrIxBhgnOTWStP1PWGtdacc5TL2imElITMqDqJRV93r/
         wFbAjW6TKRZQsGoCKdyNSQ6fm74AicspL3kIwxWZwe80H+jv1DNzSffqHA9K6YmM0Hx1
         4a5WlbW6DD7fPU/cFAR/IO9AdYqhb7mlz3t81QMTXe11WnH2cUMY1PkxeyBMJcJB2Yvz
         9M+auKNTLD1z7fFwZgWJUFPXVn4+4MbUPnsLVo7nOM1tU0Gb1cT9sxyTzRJY8uJnl2rW
         PBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424567; x=1787029367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O7xUkoYVY8AeKODvISm0XPf0ZextZDIpWMTL9lvpDk=;
        b=C8h8U/OgDyCRUr4IEZXykaMlkA+25BHK14FCgaIqm7/IwcqkRN8gKBP53TU13Jp2Id
         a63UXrhZn2M9LCgIWi4181sc+o2ivzUD2YZSISYoCCgA2pI7MmkoZ7u1GqM7Vdwnp7Gb
         mNSXYPLI3B4nWhYPyozu6G0U9djbo/e6PRZMBu+jcLN7xxw5p/MnMs3tJ5O7YsCSQwz5
         ZLkEU73JHrE/vxSG4NrRdr6tajbQ2ROCo0q4R/q/SUFPiMeIsU9Xv7fC8kwZSS3jolxJ
         /42H8KfTACwiCW7zmoe5bo7MZfowyEktsapuvC6f51hS5Y7ovd3eERo0ACplg755A9rc
         WfdA==
X-Forwarded-Encrypted: i=1; AHgh+RqfyF9vN1iVDVIG7q6vxw5RVsvPxkhto9jMyIbmukk2lDcii/Da2R6ln3jlcCJzNHgZc7ufjhF186Wg@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPCPpxukiLxESgV/XNpir7d0mGR4UWdwttKeA3xVmAEZAo3Sq
	CcGikPNJlQcaScOoBJpHGnTavuoirjgqXIxFwrQXAIFQQ8z1Dy3rcW9RnA//5lcMzu8=
X-Gm-Gg: AR+sD10xS0LCuVAMACZcJ2b1UEwDRHET4Np5shbUf10rUIHPb2P6O4P/s9KbUryiswj
	ezowYyFYH02rs6DEzZ7ggtJV5g6ff2oNo22YINN/JIxo8tHTpnEdWCgPvWBHJo3IjvzpR2NlxO2
	Scr7ukae9yBxMtE5yFjknb1PprrajIXCKebP4nbU6OdFmFIp/ZAFGrjTTeA8can7Yqy3PGApi6n
	EnJbX9mNAAUqUU33W99YK8cDwolNZnVWe/ujopxCJFNwt2MhLjspH/itthsp6+lj+cO7yr0xcEt
	YsJznmpU/WDDKBuIz7+WRbK4bdU0O0WbamnHzEBZDWGOLGRPCGQrvrmtr6O7epONYT24NMS3pL0
	wWYEFL21K0NooaHU+U2E1Z3NpDIzzT9HT6uFNiOQIkRLKUWoOupi5KxF9bJkwf1V7leTyjcePYi
	BPJA3xGTvJ0PCofIQRk6TOh02MOv5444Owq4D4K6A5Lch0CHoKfaf4fbU1Hri0l3mEkxP88BwGc
	PPwKc/BglTUMdcpi8oDdyaBEyJIgl/2422VTuAQS6wPaYTtRg==
X-Received: by 2002:a17:90b:4b0c:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-392ec617514mr576960a91.19.1786424566907;
        Mon, 10 Aug 2026 22:02:46 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:46 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 0/5] ptp: ocp: Add R4006 and V9 I2C peripheral support
Date: Mon, 10 Aug 2026 22:02:39 -0700
Message-ID: <cover.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the generic LED and I2C-mux support needed to describe peripherals
behind the FPGA I2C controller, then use it to instantiate the R4006 and
Time Card V9 board topologies from software nodes.

Patches 1 and 2 add the binding and LED-class driver for the Lumissil
IS32FL3207. The driver supports individual and multicolor LEDs, enforces
per-output current limits, and keeps the controller shut down until every
channel has been configured.

Patch 3 propagates software-node channel descriptions to adapters created
by i2c-mux, including a software node attached behind a primary ACPI node.

Patch 4 adds the R4006 profile for the temperature, humidity, pressure,
GNSS LED, and four SMA LEDs. The BNO08x channel remains empty because no
upstream driver binds that device. Profile selection is fail-closed and
requires a supported PCI device plus a printable fixed-width EEPROM ID
with valid padding and an R4006 prefix.

Patch 5 adds the V9 BME280, BNO055, two GNSS LEDs, and four SMA LEDs. It
uses the exact EEPROM ID "TIMECARD-V9" because earlier revisions expose
the same detectable I2C devices with different LED routing.

The prerequisite patches touch DT bindings, LED, and I2C code. Reviews or
acks from those maintainers are requested so the complete dependency
series can be carried through net-next.

Hardware and build validation:
  - Exercised the R4006 LED routing on hardware.
  - Checked the V9 controller address, 4.7 kohm RISET, sequential RGB
    routing, and second GNSS LED against the V9 schematic.
  - Ran dt_binding_check for issi,is32fl3207.yaml.
  - Built i2c-mux.o, leds-is32fl3207.o, and ptp_ocp.o with W=1 for x86-64
    and arm64.
  - Ran strict checkpatch with an 80-column limit on all five patches.
  - Applied the generated mailbox to the stated base and compared the
    resulting tree with the source branch.

Changes since RFC v2:
  - Drop the board-ID over-read fix, now upstream as 6b69f2ef10cd
    ("ptp: ocp: Fix board ID over-read").
  - Fold non-mutating fixed-width ID validation into the R4006 topology
    patch for fail-closed profile selection.
  - Clarify zero-based LED outputs and correct binding color, naming, and
    nonempty-group constraints.
  - Use fail-safe LED reset and enable sequencing, serialize scaling
    writes, validate node structure, and use the driver-specific subject
    prefix and private-data variable name.
  - Preserve secondary software nodes behind ACPI primary firmware nodes
    and balance their adapter lifetime.
  - Validate profile indices and make mux channel, RISET, and current
    limits explicit per profile.
  - Gate topology work before EEPROM access, avoid core device locks around
    client probing, and continue low-rate recovery after retry exhaustion.
  - Confirm the V9 address, RISET, RGB order, and second GNSS LED from the
    schematic.
  - Resolve every 80-column warning reported for RFC v2.

RFC v2:
https://lore.kernel.org/r/20260803205011.1249-1-ahmadexp@gmail.com/

Ahmad Byagowi (5):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver
  i2c: mux: Propagate software nodes to channel adapters
  ptp: ocp: Add R4006 I2C peripheral topology
  ptp: ocp: Add Time Card V9 I2C peripheral topology

 .../bindings/leds/issi,is32fl3207.yaml        | 251 +++++
 MAINTAINERS                                   |   7 +
 drivers/i2c/i2c-mux.c                         |  69 +-
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 687 ++++++++++++++
 drivers/ptp/ptp_ocp.c                         | 881 +++++++++++++++++-
 7 files changed, 1859 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: d67e5dbda22604d0fcde32fce58c65f88676e676
-- 
2.50.1 (Apple Git-155)
