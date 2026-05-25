Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621639AD55;
	Mon, 25 May 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691348; cv=none; b=RQfac1kQhrFwCt36XVbmug+f4L2drje6m3HX00FSZlI3zsZFk2uvV9rrVIvI6pzgYC218Ye5xHTudsKduM9ECREPIQQARIxGFHHF5Oikhu8ibxdCFME/Cmg7fRkiYnNiue11nm2gVk4gl5wGfobPyfM2dnVlG3JoEsPulY5HKKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691348; c=relaxed/simple;
	bh=LtOc5bgzPn6E1ldy8y9HFnOM8IVVlrRUe/BuP4pvKQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k8imMiAquQ2o00h0r1kOZtTc9l0SXRXudFsl5Jdpag+liVUy7nuvK1YxH1bM0IfNra+UHKvtqNNHUi735WoacfGLN+gsUVt9swWIyZHvjzRxkg22GLY/KmiqWuoU6iZyNY4onEI5SMjJPFiDRlDH0F48D0jRDeiZYaoFeVSE08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 36D6E1A2CC0;
	Mon, 25 May 2026 08:42:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F13141A20F6;
	Mon, 25 May 2026 08:42:19 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A59061800071;
	Mon, 25 May 2026 14:42:18 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v10 0/9] Add support for NXP P3H2x4x I3C hub driver
Date: Mon, 25 May 2026 12:12:00 +0530
Message-Id: <20260525064209.2263045-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

This series adds a driver for the NXP P3H2x4x family of multiport I3C hub
devices.

This is an MFD driver integrating I3C hub and on-die regulators.

The series introduces:
- Core I3C master enhancements required for hub support
- Generic I3C hub framework
- MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

Changes in v10:
- Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
  bus locking
- Rename i3c_master_direct_attach_i3c_dev() and i3c_master_direct_detach_i3c_dev()
  to *_locked, as these APIs must be called with the bus lock held for write
- Drop redundant is_p3h2x4x_in_i3c flag from p3h2840.h
- Remove unnecessary ibi_lock handling in request/enable/disable/free
  IBI APIs
- Remove redundant parent pointer from struct i3c_hub and derive upstream 
  master from hub_dev
- Split SMBus target/slave mode support, including IBI and MCTP receive handling,
  into a separate patch
- Link to v9: https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#u

Changes in v9:
- Renamed macros to follow consistent uppercase naming conventions
- Made REGMAP selects in the P3H2X4X MFD Kconfig conditional, to avoid I3C/I2C dependency issues
- Referenced i3c.yaml and i2c-controller.yaml for child bus nodes
- Dropped unnecessary #address-cells and #size-cells from child nodes
- Added CONFIG_I2C_SLAVE guards where necessary to avoid build errors when I2C slave support is disabled
- Link to v8: https://lore.kernel.org/linux-i3c/20260323062737.886728-1-lakshay.piplani@nxp.com/T/#u

Changes in v8:
- Add compatible in i3c example
- Link to v7: https://lore.kernel.org/linux-i3c/20260319112441.3888957-1-lakshay.piplani@nxp.com/T/#u

Changes in v7:
- Fix kernel-doc warnings across I3C core and hub code
- Rework DT binding schema and examples to pass dt_binding_check
- Update MFD Kconfig to use I3C_OR_I2C
- Convert CONFIG_I3C_HUB to tristate
- Remove unnecessary CONFIG_I2C_SLAVE guards
- Replace custom helpers with find_closest()
- Use devm_regulator_get_enable_optional()
- Link to v6: https://lore.kernel.org/linux-i3c/64c5070c-aa9e-427a-933e-91e168f0510c@kernel.org/T/#u

Changes in v6:
- Update DT binding with vendor-prefixed properties
- Add generic I3C hub support
- Remove generic code from P3H2x4x driver
- Link to v5: https://lore.kernel.org/linux-i3c/20260206120121.856471-1-aman.kumarpandey@nxp.com/T/#u

Changes in v5:
- Update supply naming and descriptions
- Improve MFD Kconfig/Makefile ordering
- Link to v4: https://lore.kernel.org/linux-i3c/20260113114529.1692213-2-aman.kumarpandey@nxp.com/T/#u

Changes in v4:
- Split driver into MFD, regulator and I3C hub parts
- Update I3C master for hub support
- Fix DT binding issues
- Link to v3: https://lore.kernel.org/linux-i3c/20250811-bittern-of-abstract-prestige-aaeda9@kuoka/T/#u

Changes in v3:
- Add MFD support for hub and regulators
- Add regulator integration
- Link to v2: https://lore.kernel.org/linux-i3c/17145d2f-5d07-4939-8381-74e27cde303c@kernel.org/T/#u

Changes in v2:
- Fix DT binding warnings
- Refine DT parsing logic
- Link to v1: https://lore.kernel.org/linux-i3c/822d6dca-b2c6-4439-ade5-219620ebc435@kernel.org/T/#u

Aman Kumar Pandey (6):
  i3c: master: Expose the APIs to support I3C hub
  i3c: master: Add APIs for I3C hub support
  dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (3):
  i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
  i3c: hub: Add support for the I3C interface in the I3C hub
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 +++++++++++
 MAINTAINERS                                   |  15 +
 drivers/i3c/Kconfig                           |  16 +
 drivers/i3c/Makefile                          |   2 +
 drivers/i3c/hub.c                             | 465 ++++++++++++++++++
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 337 +++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 353 +++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 141 ++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 450 +++++++++++++++++
 drivers/i3c/master.c                          | 179 ++++++-
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 122 +++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 218 ++++++++
 include/linux/i3c/device.h                    |   1 +
 include/linux/i3c/hub.h                       |  99 ++++
 include/linux/i3c/master.h                    |   9 +
 include/linux/mfd/p3h2840.h                   |  26 +
 22 files changed, 2761 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/i3c/hub.h
 create mode 100644 include/linux/mfd/p3h2840.h

-- 
2.25.1

