Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413613;
	b=ywbo4+JjUTtoWMBlBPP4Zmw3hFK1e6KCuisI0oen8EcYujxi8Dnje8uccbJxy8Y5KqRB
	 AqnhqkqfM0DFA0MUFOB35ttHwekW/FjNpDdSoxisdKG5ZZzyKJ596nTtvgExSKKnH4HvS
	 g2su/ml3JrHg+uV2yxW4YZaEoqWYYexKe7aF8FVn9aux51r/4RxPtLr5f+aO7xGrLPk/A
	 nB2t3HTJQZJT7azoGJRHywkBzYAgbAeXM+cwy1N2ngI++1VUw6YIp0cuL7WUgKEz8RZcz
	 o7EjXqh3/U2jt8ofDb4idd7rMNRKlXwYIlY7sJjjyWgPVkzUlR5cp1Av0LR0USZAAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
	b=yiKCKssJ5l8/tcU6hCSsohozYOPuSkSS0Eiqq2Iavv2rH8SbDuUTZbKAF/L7MHz3vixp
	 VYkkkzf7hTyQMY9W3YtNZ/JB+dNrtrD58IlmNA0XLWljbcB2ZElXsJgVMyeY+O/BfebAe
	 JcV/RG3KR4jAY/HXbOcHHsTujR1VFfIUGAqEOJcG7EWkRsR13LHj6yexUwafzulLn9128
	 DTHb2EW8Io7DNViYS3D24r3TRm1dsgrHPlE2ET4atAvbv45j6yf4cr9eq+x8GmXXQh3NY
	 aQbcf4Yxb15Hhv3I1746vuIybsg6BTp20R+jqiDy0Lj0+HUX3O7yYxmt6ZyNTAl3EiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWmohlI8;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB4606A32E
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FB4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWmohlI8
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8451a619da7so981232a34.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413612; x=1794018412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=UWmohlI8f7ebq5LnGnp9uXKEXcbIsZh7Uw1469TQi8DMAjdd/z41WAC+/4MxASy54U
         eJmIAUzOQWsa6QfQW/PJWZZWvGckrW7IefBOBhpNyVTjWWT+VX1adSlqPfDTd/kY+HTK
         9VP4lMJR1GVgjUorFikEqDuqMcYtZZYyFvOMDLtTC+8TEa5JNsYw5xj6iYbBD4NCChpH
         AJDupVsED9I/GaJi/yUc8Au8JgzC0iu0e2Op2F2wvART8V8XY1K3k5grS/RS+j7kTzR5
         wjebMmVpwwKx2r8rM6Kf0b4Lk8TKy1Nn/HHpRD/wi+pfRfz5IxjudkJtY7WRbP/n+e9v
         otOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413612; x=1794018412;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=TiElkY00ItkhUT6RYrCnMEfiHR/iesYFdZ3x/TLhLaQhbKmPD2PudmZxriUYFl4ree
         24RYslDOe53XimD/nHk0UBa0xsNzu6lFT+tcA6S56aMFqvMBwDej4xTxHc4n8dxogx10
         YQEfZ3jH8s8kv+BaEd+8i11cmzFMeU9UUI7+nf7xq1D2vf27OhgScwKcwJurG4gzgJuJ
         8YaX3t4ewYTtzv8ejdKP9IORnL34TyimABPq3sJWflvkRiU1f+TU1LMnY8DppRSfdcnp
         as5jCTqcKyEtZ3/2pP0fLIQPavwcHiw+NDj+CPTvcL3d0/SdL9FR1g9IF5c8czwJuGyt
         HKtw==
X-Forwarded-Encrypted: i=1; AKwUvBx11XFXOnkjxB2m+S0sG57n7wgkc2jasTz4OScbpBSG6j/j6y3qtkgCl3gIlbmZ1YLrtGY6IncL0d4X@vger.kernel.org
X-Gm-Message-State: AFq9FYJSy8RXWl1M4h3FUIMGSSqURs5ZzhzdDFPRDUxD1y9OwRlwsTjO
	ZWEz8RQ/K10SmzjBgMJLzvJ1lXHcS4LW/R3a4aOPpqBSxv2z3MY8kvC+
X-Gm-Gg: AYBFou1OVhclwiC8U9MLOGHPpfonoVjQHyBgyGrgKaK8sIlLx7pdqjb5xJR34YUgK/Y
	AGFccRrcwympwaHjRZBb8bxxgsjAjTIyTKP4oxys3vOAmDq7NotVu5xQEsibOCWt4cr6OheQawV
	GyoCpn5TmHCwAoym+0y5hEE5WHAgZhW7U/qEReVARRN+Ad44RbQsN5xgwrfrbB4Goiabb6Z3PZ+
	sblRfHuegHSqaYGTxvrwijgWL3Ln+QuEg97EYLIl4bwZ9FQirr84QYIJTshS9JlmSInYlU6c1Oo
	8W5O3ndOnaZTEN6XTMFdCbTJ7OgukY+q69K9B6mqaJ/BaVPGwnU0Y5en2fiuWP//C9ohprTB9Qe
	ozED7cmBA0PioTwwchtBexJX6gdkaOgVGc3ks6DX2oSLid7Pq2W+hXyxwOdDgLMWuytPQuNIpWg
	oCRfUaA95BxuB6QOakAwTGWbQzak14S82lL0gwLpaInJSwdmKFU+s8DZ6gUPZ7ST6WcePeWpffC
	fuEvIsfX6LRgAw/oHjN58cFXZ0QwF+GyUYCRnaw1MGkyD6Uj78Bf9RHK764W5j0SBRQF4chATxa
	19FquPrR+39b22FzPNFlv/rh38w35kk6WUy2B/tOgZ9mkpjE2xvse072pjW5cdQqgfVeDKPN0+0
	H1t4RbbiANzyvj2fz2Pd3NY7SXpU=
X-Received: by 2002:a05:6830:4413:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-85d364de390mr3092732a34.21.1793413612419;
        Fri, 30 Oct 2026 19:26:52 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm3810712a34.6.2026.10.30.19.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:51 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Fri, 30 Oct 2026 22:26:50 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This v2 adds the initial Allwinner A733 SoC description and Radxa Cubie
A7S board support. It incorporates Andre's review of v1: RTC, all main
and R-domain UART/I2C instances, all four MMC controllers and their pin
groups, R-PIO/R-CCU, the GIC maintenance interrupt, ITS description and
the ARMv8.2 EL2 virtual timer interrupt.

The board enables UART0, AXP318W on R-I2C0, and the microSD slot at up to
50 MHz with four data bits and 3.3 V signaling. PMIC input/output, CPU
and pin-bank supplies follow the board schematic. PF6 card detect is
active-high with a pull-down. The firmware-selected PF supply path is
preserved; 1.8 V signaling and dynamic voltage switching are disabled.

The DT patches are separate from three supporting submissions:

* clk: sunxi-ng: a733: preserve system-controller firmware clocks
* pinctrl: sunxi: preserve A733 firmware voltage modes
* dt-bindings: mmc: describe the Allwinner A733 eMMC controller

The clock change keeps firmware-owned timer/mailbox resources available
through Linux's unused-clock cleanup. The pinctrl change follows
Vinicius Pedrosa's recommendation to preserve A733 firmware voltage
modes and give A733-R its own descriptor, without changing A523-R.
The MMC3 binding is distinct because SMHC3's DMA descriptors differ
from SMHC0-2. The node is disabled and has no driver match; the existing
A733/D1 fallback is used only for MMC0-2. ITS is also described disabled.

Base and dependencies
---------------------

The tested base is the official Torvalds commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3, plus these public inputs:

[1] Junhui Liu, clock helpers, v1 patches 1-4:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
[2] Junhui Liu, A733 CCU/PRCM, v6 patches 1-8:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] Jerome Brunet / Andre Przywara, AXP318W, v8 patches 1-5:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] Pablo Mazzini, pinctrl IRQ-bank numbering, v3 patches 1-3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] Vinicius Pedrosa, A733 UART, v2 patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

This is the exact 23-patch test stack, not a claim that every patch in
each series is a direct A7S dependency. The A523-only changes in [1]
and [4] accompany those public series. UART patch 1 concerns the real
DLF path; patch 2 excludes the A733 noncontiguous readback from that
path. PMIC patch 5 and UART patch 2 needed context-only adaptations to
this base; their added/deleted implementation lines were unchanged.
The three separate supporting patches above complete the test stack.
The DT series should follow the clock and binding prerequisites through
their respective trees; the external series are not being resubmitted
here. Patch 1 records the exact base and prerequisite patch IDs.

Changes since v1
----------------

* Retain the acknowledged board-compatible binding.
* Drop the old MMC binding patch already present in the selected base.
* Add RTC and its clock connections; use the board's 26 MHz crystal and
  32768 Hz RTC input, and provide all four main-CCU clock inputs.
* Use arm,psci-0.2 without the redundant arm,psci-1.0 string; add the
  fifth architectural timer interrupt and GIC maintenance PPI 9.
* Add the ITS subwindow and retain dma-noncoherent on GIC/ITS, following
  Andre's A733 reference and the A523 integration precedent.
* Add remaining UARTs, MMC controllers, main/R I2C, R-PIO and R-CCU.
* Move UART0 pins into the DTSI; supply explicit MMC/UART pinmux values.
* Add the PMIC and real board power connections, CPU supplies and card
  detection; sort the DTB Makefile entry and use schema-valid node names.

Validation
----------

The full ARM64 dtbs target and W=2 CHECK_DTBS=y for the final A7S DTB
passed. The separate MMC3 binding example passed dt_binding_check.
The W=1 Image build reused the independent build tree and rebuilt the
affected objects; source reconstruction and patch application also pass.

On one Cubie A7S, two final-candidate RAM boots passed with vendor boot
firmware: eight CPUs, RTC counter advancement, AXP318W/R-I2C0, UART0
including 115200/57600/115200 baud changes, and warm reboot. Each boot
completed a read-only SD ladder of 4 + 16 + 128 MiB at the reported
50 MHz/four-bit/3.3 V mode. The first 4 MiB matched a fresh vendor-kernel
read; the later loops checked successful transfers. The second boot
tested after late unused-regulator shutdown. No clk_ignore_unused or
register-writing helper was used. The existing vendor handoff needed a
RAM-only BL31 reservation at 0x48000000/0x01000000.

Limits: card writes, physical hotplug, UHS, other UART/I2C instances,
MMC1-3 operation, RTC alarms and EL2/ITS/MSI delivery were not tested.
The BLDO2 software selector reports 3.3 V, while the schematic implies
a nominal 2.4 V input. Physical measurements are unavailable, so the
board DT preserves that setting without a voltage constraint or newly
enabled LVDS consumer. Assigning its actual voltage requires checking
the fitted RP220/RP298/RP299 values and measuring UP11 LDO2V5-INPUT and
BLDO2/VCC-LVDS0 to ground.

The six source diffs have no checkpatch errors/checks. The requested
Assisted-by: LLM trailer produces a nonstandard-signature/unrecognized
email diagnostic in raw mail checkpatch; it is retained explicitly.
AI assistance: Codex:gpt-6-astra.

v1:
https://lore.kernel.org/r/20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com
Andre's review:
https://lore.kernel.org/r/20260911001805.0a2e033d@ryzen.lan

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Supporting submission Message-IDs:
  clock: <20261031020640-263f7b05-a7s-clock@gmail.com>
  pinctrl: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
  mmc-binding: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>

-- 
Enzo Adriano
