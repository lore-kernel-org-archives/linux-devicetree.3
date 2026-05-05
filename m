Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF07355F41
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777945061; cv=none; b=G7oYZ9seJ0UbxWtdQmKfKnY3+LnUgNKpncCzneCkMfEW8bdHn6ZjVEoIf2CFsu+e55ycAkgST6hcvTVW1Cx9nP2UAwtcFQ0fFqcUaIUpcIxm6kY9zkxXbtT40S4WSPR703rK/wW9QjficGutMDmuL31MdbT1qpxcVRXJ7P/GnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777945061; c=relaxed/simple;
	bh=ZxymY7j6qU+oQaIl07kvIXJxEX8gKu8ATWUfPuz0KDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUdwC63mQ8uhrOKSGxX7sHgzz27v412AN1tzPt+jpH8SjR0JhDU/loSWt8CGUmk5XUOroUeWO42kR6xJ8HtsIAbu5ipHmZHiCbZ5SwI9amk+MpwuGTkloUQCqMoC93rZDa2j4pU2V0zO3U1wtLlZIk12vxkTqxDoH0Wc//62nrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihLjpHy3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihLjpHy3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83975e992e1so18107b3a.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ubLRqm6894E/xfqMy1P4qorSpO675XYrOno1l/mUk=;
        b=ihLjpHy3FXzt/va5G+pr/2hHEYfEgC7+5rt2jmYMrUkd4Xs7rJTDMw+2amh551uFnx
         VP3ICl1EcOGDWReTJv6kApom9GZjO2xMGznkISXwu7ccSHbJfP1X6H8S+XjcLjsCgaNR
         Jzd6eH4oZ+e45qW80c4JVBG6/p3AKCv0WATCjXaroiFYnEj8Dmib7qO9olLJgeq8bpD3
         OjWQXBVkZ/PQlEWVj6u9R1+sfxLvqd7bZx0+0MW9MqM6JjGSD6ePiEgbQzNZw1kylkxu
         dyYhjNNSXuT+SVx9LbkDYrow3iLcFimRPePvBdRkFEZJpQBXksGwCsMp0rXQBzhseZiH
         ChYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2ubLRqm6894E/xfqMy1P4qorSpO675XYrOno1l/mUk=;
        b=S+wVMCjEyVxFu/3qLIbaJI9gh/YMq94sq3RRY6XQiR6rgJJppZfzwpIACqv5uMk2CX
         9mTkZOtM5i5GPchRZGNP5vVOnYWi7f5ZYob/+4moIJWbhKIiyf3bq6Hb4pZYjtG5GqfS
         oplxAI7zNOA2J/Hwm+uU1lejK54UnqzWAjiHzcL9VIhYw8NYzl50eup047LCYzI7T50O
         sMbqlPR2Ex/K4a8u1NnLZH/NUSJZxeLkxTPDVZPwyfTCOkk6vMlytWBm7ojzUopXATZb
         Iz7AV9OzmclfOkgeYFscVRMew/e7NYWUN8sN7u/q3gWvlZ28VpEAu0thKTmR28axZNKP
         Lt3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oExa7jVEBg1Bd37qgS2GJQNG48DTR1b72lTSHLj8CCSot7dr9rou3PpOqFFzaBfA8vq9rC7leXm9S@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8qUvPH5ugMn0vWm+7wrwSkoXNjIeZ1L4CY3vU+lTzCidi719
	vkyQe1pKOl/JJX0ezt2Fswu3inzfJMMQypF/sRxrfsKni71mDkjzkYZx
X-Gm-Gg: AeBDieuiXbUKYWzpblD+IFLSalKsORUJ20Lz3jkNzZoOZ7OlqkXQ2XAkMr9IBKfOVTi
	CxAznC7iMDClZacMv2XQriOZynE5ZAj+dS4tcLnmOMtolf2fa/dS7aqviofEaiyNOSfdQMLZdXy
	2uvf+uVHAwTtxSmPxFcdLsnNEGIiHpYZjURpsx+ZZJgpvqutKEd8T2munC86uRDLWkWCO3FtgY0
	ajPA7Kn9HwIWyio/U+cWiLMv1Z7+HoXr35VWl2zz9A0Zj4fMvYAtL6LotgQ5n70YJF8K8PKFta2
	TlckY9+Ibz3RhkHc4u+gX0Ee/2Trzz+m/b6cNNsCwmqHZk+Qv7xFtiLZ427YIdRvfcic8Fexap/
	VSfmKaIUSkditUSdt1zlzYCRtt/iFohXUE0aHtfdUzmZUa6Mb425orINiGVbrLUT3NIQ1TYMSWL
	kVfgVP381Ww30E71+Irn/I4sjyV8o0LcB+8O1WQSscIvXwaPR9ADkZKbum
X-Received: by 2002:a05:6a20:244f:b0:3a2:bd1d:d67d with SMTP id adf61e73a8af0-3aa3b6d8fbdmr1166764637.34.1777945058179;
        Mon, 04 May 2026 18:37:38 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm230054b3a.49.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B379C4163B75;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v10 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Tue,  5 May 2026 09:34:50 +0800
Message-Id: <20260505013453.980249-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch series introduces randomizer support for SPI NAND devices.

- Patch 1: add the nand-randomizer property to the generic nand-chip.yaml
           bindings. Instead of using boolean properties, it introduces a
           uint32 enum (0 or 1). If the property is omitted, the driver
           will not interfere and will leave the randomizer in its current
           state.
- Patch 2: add the initialization logic and the set_randomizer callback
           to the core framework. The core will now parse the device tree
           properties and enable or disable the randomizer accordingly
           during spinand_init.
- Patch 3: implement the set_randomizer callback specifically for Macronix
           chips (MX35LF/UF series) to handle the vendor-specific register
           operations.

v10:
* mtd: spi-nand: Add support for randomizer: set_randomizer call
  now passes the rand_val directly.

v9:
* Replaced 'nand-enable-randomizer'/'nand-disable-randomizer'
  boolean properties with a single 'nand-randomizer' uint32 enum.	
* Switched to use of_property_read_u32() to align with the new
  binding.

v8:
* dt-bindings: spi-nand: macronix: Remove the chip-specific Application
  Note link from the commit message to keep the binding generic.
* mtd: spi-nand: macronix: Update the broken Application Note link and
  move it here from the dt-binding patch per Miquel's suggestion.

v7:
* Directly return the result in macronix_set_randomizer()

v6:
* Added mutual-exclusive constraints using not with required for
  nand-randomizer-enable and nand-randomizer-disable properties based
  on Krzysztof's feedback.
* Simplified the return path in macronix_set_randomizer() to directly
  return ret; and dropped unrelated formatting changes.

v5:
* Promoted the randomizer configuration to use generic NAND properties
  (nand-randomizer-enable and nand-randomizer-disable) instead of
  vendor-specific bindings.
* Refactored the initialization architecture in core.c. The core framework
  is now responsible for parsing the device tree properties and deciding
  whether to enable or disable the randomizer.

v4:
* Fix a build error in spinand_randomizer_init() where a value was
  returned from a void function. (Reported by kernel test robot)
* Update the return type to int.

v3:
* Revert the device tree property to the vendor-specific
  "mxic,randomizer-enable" to strictly follow vendor-specific bindings.

* Update the 'set_randomizer' callback signature to accept a boolean
  'enable' argument, allowing the feature to be explicitly enabled or
  disabled.

* Switch the implementation to use the standard SET_FEATURE command
  to modify the Configuration Register (0x10), replacing the previous
  special program command method.

v2:
* Create a global NAND DT property

Cheng Ming Lin (3):
  dt-bindings: mtd: nand: Add nand-randomizer property
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 .../devicetree/bindings/mtd/nand-chip.yaml    |  9 +++++
 drivers/mtd/nand/spi/core.c                   | 20 ++++++++++
 drivers/mtd/nand/spi/macronix.c               | 38 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 +++++
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.25.1

