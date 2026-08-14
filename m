Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4C3C199C
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749065; cv=none; b=aQ/63r6QEmUoGCEViwvTvoty1f2xQDLLJzfQ9Sx6R8Vf2A6GO5/N9QfwxT8tUBFerFw1S/g81EYJVToKZhHFqAtiw3b0NUSFZCA/eWDMFsG9+BP7/FFJ+CkyKcm01Veie/AQ2Xson0mpk1INYjQYeBlF6GvXiGl7qkoh/DjyE98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749065; c=relaxed/simple;
	bh=wGdVXlAMvX7tE0cwCy+Em1rumWHMNHO70xxu6sxLlu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptRZBcYegN0MykFkLDNorgL/kxHBpuGXKGGs9GGOK3+fQAM4WE69s3O0OT5jx6cTwrwbR7b6YHGSU/Ve32axkxeb92G+HW+cHb9Aky7PoAxqTrhRrEiOJQx7xYy0ktoXwglEA/0Q7rHSdg8W8dkIKtt9PdghvgqGSecrBFkVaPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mdf/Zc5k; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mdf/Zc5k"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceb096e675so19160465ad.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 16:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749063; x=1787353863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGvwPOiibGAV/zYgpHRwEPNgFrWcL2aKuRnGK18Zsbk=;
        b=Mdf/Zc5knMvoA2RovLv8h6x11TqECpq8rhXXi8PjD5o08xws9gqi1Ma/CItVJiC5Ak
         8mYNDYTqPOoFI6tgjY64xmQup6ymx20IfJxUJRCluENxnsXyqCDnUl5Mod96yHHLYid8
         oZRsdmwb5+DuaHJtJO7tqUz+/72RqNbESCcPyG4shCmvxwD5VKi8AucBGFKv/TO+qSUt
         jOXCI77U7OuT/dn8NlyIn95YhSBjfGlo+shgHd/rBJ5QIC71tdq2F7kBfMR311NTsU+r
         2N7nCP5ZT4Xk1DK7C3CXny238HTyQijbOwJ4Hh2Y5zDTbh29zc4OokCQve7yoho0ZNBQ
         9T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749063; x=1787353863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGvwPOiibGAV/zYgpHRwEPNgFrWcL2aKuRnGK18Zsbk=;
        b=cOZBGzOCYdsnlMor2Hv3OBQobirnl7UQ4D7+o2ADicoQgRQbiFX22NHywTNuOeoq9c
         VgdYFzTsbaxYuiGsFIc78eHgVK2CB+gCBQvb5EgmY2j+PhUu//R8LM2tTacSVXHIfNig
         PQ4WSO2rrEmBfBZGXUHhaEju1IsH0+IZyI4P5YZ9lruO72z2PJtE90MJqwWw0W1c4UJM
         t/arnHbkPF3LKaKJhEej9hy6rLdlrRJCCDdFFeKy0bhCuRo/4JBT5eiIa+Us3QDIJ85p
         9zNosRJAjBuckr4FqaOosY30CHDrTPpEx9I/vczpPHiuzPm74tQUNv8fXpGa3jEWGeSL
         U9sA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0tHCaepqJ8ehOiZpvSkkwcMBGVum1AHxlx/iFjQkSVUUwIX6UNmMYY8F4ORsJ6S9Ny9nBNO+59+DW@vger.kernel.org
X-Gm-Message-State: AOJu0YxLT+bmerH93YNdeck2cBl2xqxCsdYfQmeOEvCh9yCMWdTJTGCk
	QSZ5qQG+i88SyXs6yLVGHov2A5Po5FvDN8Ou3l+1AU1KpEsTtjnxpwB1
X-Gm-Gg: AR+sD11n4ibf2IQ0YJyOQzOl17llhubHk6QzlTmWqEhRV2G9/0OO2xBIhbvO/Ibvnga
	3vMuvY/rwc/7EvDdytipq9vAMPOVTWDnVZr4yDnIpDMst/ha+wSN1+dveMNzwXSd/9+oIPF7l83
	l25fTwffdK2hY+fdjsHw9wGaZ7H42mYOWxfr7TE/SJKTDlTFMqiNJiUzRHlqNJEgcmLWSfR5ElT
	1dfPGjcWb0BG8b4Mc92hJX8/6I0S/EpS2vdVETZtuVh2vwfqhO6ErRMqYuaU2cG6k8v5+N53UER
	gWigvvJTM2zPcOCCP7rwon4yuBF4nTwkhb80XEzQS7iGCFjbtNr+XWxuRsT0DlAJXSu/hGCWVvC
	rBF8YsRPHboRogJ1NTUkOAdz8BkgCLKKoHaNBpVTZXY4DSepJFcEWJPt+FK2v/Nin7KA3C4/FFP
	3yblORyY02rtmm2fGZGdKnKGE45U85IGIMzjIyW0SpI+xc6n/2CKTUsFyk51/oBmFC04IvcMHP5
	mZkpw==
X-Received: by 2002:a05:6a21:1f88:b0:3cb:9bb0:27a2 with SMTP id adf61e73a8af0-3cc71e8382cmr11015578637.34.1786749062904;
        Fri, 14 Aug 2026 16:11:02 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.10.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:02 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C peripheral support
Date: Fri, 14 Aug 2026 16:10:48 -0700
Message-ID: <cover.1786746757.git.ahmadexp@gmail.com>
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
by i2c-mux. It preserves an ACPI primary firmware node, makes I2C adapter
lookup recognize the attached secondary node, and keeps that node alive
through child-client teardown.

Patch 4 tracks the fixed-width board ID and serial number independently.
Profile selection can therefore proceed when the board ID is valid even
if the separate serial EEPROM is absent.

Patch 5 adds the reusable profile-driven topology and recovery lifecycle.
It stops topology work and removes the mux before the root I2C controller
unbinds, preventing new child creation after adapter teardown has begun.

Patch 6 adds the R4006 temperature, humidity, pressure, GNSS LED, and four
SMA LED groups. The BNO08x channel remains empty because no upstream driver
binds that device. Production R4006 IDs may carry a revision suffix.

Patch 7 adds the V9 BME280, BNO055, two GNSS LEDs, and four SMA LEDs. It
uses the exact fixed-width ID "TIMECARD-V9" because earlier revisions
expose the same detectable I2C devices with different LED routing.

The prerequisite patches touch DT bindings, LED, and I2C code. Reviews or
acks from those maintainers are requested so the complete dependency series
can be carried through net-next.

Hardware and build validation:
  - Exercised the R4006 LED routing on hardware.
  - Checked the V9 controller address, 4.7 kohm RISET, sequential RGB
    routing, and second GNSS LED against the V9 schematic.
  - Ran dt_binding_check for issi,is32fl3207.yaml.
  - Built i2c-core-base.o, i2c-mux.o, leds-is32fl3207.o, and ptp_ocp.o
    with W=1 for x86-64 and arm64 using defconfig and allmodconfig.
  - Ran strict checkpatch with an 80-column limit on all seven patches.
  - Applied the generated mailbox to the stated base and compared the
    resulting tree with the source branch.

Changes since v4:
  - Split EEPROM readiness, generic topology lifecycle, R4006, and V9 into
    separate patches.
  - Track board-ID and serial-number readiness independently and publish
    each field only after a successful EEPROM read.
  - Replace the atomic retry counter with worker-serialized state, bounded
    logging, and synchronized root-controller teardown.
  - Support multicolor groups whose final components use outputs 16 and 17,
    and document current limits relative to the RISET-derived full scale.
  - Serialize multicolor calculation, PWM updates, and controller shutdown.
  - Match secondary software nodes while preserving an ACPI primary, and
    balance software-node ownership on failure and teardown paths.
  - Clarify that the BNO08x and LM75B at address 0x4a occupy different mux
    channels.
  - Rebase onto current net-next.

v4:
https://lore.kernel.org/r/cover.1786543681.git.ahmadexp@gmail.com/

Review of v4 patch 4:
https://lore.kernel.org/r/62242142-0d27-425c-88d6-db65e80bbcea@linux.dev/

Ahmad Byagowi (7):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver
  i2c: mux: Propagate software nodes to channel adapters
  ptp: ocp: Track EEPROM fields independently
  ptp: ocp: Add profile-driven I2C topology support
  ptp: ocp: Add R4006 I2C peripheral topology
  ptp: ocp: Add Time Card V9 I2C peripheral topology

 .../bindings/leds/issi,is32fl3207.yaml        |  281 +++++
 MAINTAINERS                                   |    7 +
 drivers/i2c/i2c-core-base.c                   |   24 +-
 drivers/i2c/i2c-mux.c                         |   77 +-
 drivers/leds/rgb/Kconfig                      |   11 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-is32fl3207.c            |  736 ++++++++++++
 drivers/ptp/ptp_ocp.c                         | 1025 +++++++++++++++--
 8 files changed, 2083 insertions(+), 79 deletions(-)
base-commit: e6a5d573d24cd375e09d24f136523cb3cc85c9d3
-- 
2.50.1 (Apple Git-155)
