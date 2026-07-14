Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8E43F4CB;
	Tue, 14 Jul 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021216; cv=none; b=PgWSAfBM92f7heuHUGMOI1GeR8LveG8p2+vS54GB7+ArwG0CP301vLrz30PEV/Es2Ckcz9uAHismmb65CD363Eh9Rs1NH5wu7nmByezqmND842IfqIQ5EAk5Q6gm3tORIQJkl9l5nfkKdffHsvJYGRu/KBhCcOIzrh5Wgn+KadQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021216; c=relaxed/simple;
	bh=Ue+4lkeWOnn4h3EZEBoiPWO62sTK3KFLRt+pnZVKG9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZvcCaiHJdVcdEFSVQo5B5ilSmVXDXIzThzfqzbB1k+XpMRTnQE5R25i7l2yFfgZ2yI6EpJKXdIbgBKhWAlSrVc6LYB4LgZ8HL/lHjJ2aNqA8EvOEKJMEuhGnpSHr/wCUJ/HeLUlK9Jnj88SdQzVQTWo241rK4pHm9VcVq/6JNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A8580200052;
	Tue, 14 Jul 2026 11:20:58 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7052C200029;
	Tue, 14 Jul 2026 11:20:58 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1939618000B5;
	Tue, 14 Jul 2026 17:20:57 +0800 (+08)
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
Subject: [PATCH v14 0/8] Add support for NXP P3H2x4x I3C hub driver
Date: Tue, 14 Jul 2026 14:50:45 +0530
Message-Id: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

This is an MFD driver integrating I3C hub and on-die regulators.

The series introduces:
- Core I3C master enhancements required for hub support
- Generic I3C hub framework
- MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

Below patches from v11 have already been applied to i3c/next branch:
 - 79c41666b397 ("i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked")
   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=79c41666b397
 - 8d8afa428318 ("i3c: master: Expose the APIs to support I3C hub")
   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=8d8afa428318

This v14 series is rebased on top of those commits.

Changes in v14:
- Add i3c_master_register_fwnode() for virtual I3C masters and use it instead of temporarily changing
  parent dev->of_node
- Add runtime PM handling in i3c_master_send_ccc_cmd()
- Export i3c_bus_maintenance_lock()/unlock() and use them in hub paths
- Fix IBI request/free cleanup to handle forwarded callbacks that clear dev->ibi, and destroy the
  allocated IBI workqueue on request failure
- Add a shared MFD protected_reg_lock and use it for protected register accesses across P3H2X4X
  child drivers
- Rework regulator protected-register handling to restore the original protection state after
  each operation
- Serialize hub route selection around DAA, CCC, private transfer and IBI paths
- Hold the parent maintenance lock across temporary hub address reattach, transfer and address
  restore
- Fix SMBus polling interval calculation
- Clean up already registered SMBus adapters on adapter allocation or registration failure
- Fix SMBus slave receive status handling by clearing receive flags on error paths, using FIELD_GET()
  and explicitly clearing overflow status
- Link to v13: https://lore.kernel.org/linux-i3c/20260701065755.2067793-1-lakshay.piplani@nxp.com/T/#u

Changes in v13:
- Fix I3C master address management in direct attach/detach paths by using i3c_master_get_i3c_addrs()
  adding rollback on failure, skipping master self attach/detach, and properly releasing addresses to
  avoid stale state and use-after-free issues.
- Export and document address slot helper APIs for I3C hub support.
- Reserve parent bus address slots for downstream devices with identical static and assigned addresses
  by parsing target-port DT nodes prior to virtual controller registration, preventing DAA conflicts.
- Keep broadcast RSTDAA blocked with added documentation, and clarify intentional no-op callbacks
  and pending TODOs (e.g., IBI slot recycle).
- Rework SMBus transaction handling to use polling instead of fixed delays
  avoiding premature reads and data corruption.
- Fix DT handling issues by preventing duplicate target-port node leaks and restoring dev->of_node
  after temporary modification.
- Improve resource management using devm-based cleanup for DT nodes, IBI setup, adapter unregister
  and register relock paths.
- Make IBI setup optional and robust to avoid probe failures on unsupported platforms, with proper cleanup.
- Fix SMBus slave receive path by improving buffer handling, event delivery, and handling of unregistered ports.
- Strengthen concurrency handling with proper locking around shared state.
- Link to v12: https://lore.kernel.org/linux-i3c/20260617110355.1591844-1-lakshay.piplani@nxp.com/T/#u

Changes in v12:
- Rebased on i3c/next
- Dropped patches 1/9 and 2/9 from v11 as they are already applied
- Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
  detach for unaddressed devices
- Drop redundant depends on I3C from config I3C_HUB
- Return -EOPNOTSUPP for unsupported I2C transfers in the generic hub ops
- Correct default pull-up and drive-strength values
- Add devm cleanup for the IBI request/enable path
- Remove dead code and simplify cleanup by relying on devm-managed resources
- Fix SMBus slave client NULL handling and unregister cleanup
- Link to v11: https://lore.kernel.org/linux-i3c/20260612111816.3688240-1-lakshay.piplani@nxp.com/T/#u

Changes in v11:
- Convert i3c_master_supports_ccc_cmd() to return bool and align
  semantics with CCC support checks used by the I3C core
- Use MFD_CELL_NAME() for child device registration
- Rename driver names to follow subsystem conventions:
     - Use '-' instead of '_' in driver names
     - Drop the "_drv" suffix from driver names
- Fix virtual hub address reattach handling and parent bus locking
- Fix IBI request and cleanup error paths
- Improve SMBus slave mode payload validation and parsing
- Link to v10: https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#u

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

Aman Kumar Pandey (5):
  i3c: master: Add APIs for I3C hub support
  dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (3):
  i3c: master: Fix IBI request and free cleanup paths
  i3c: hub: Add support for the I3C interface in the I3C hub
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 +++++++++
 MAINTAINERS                                   |  15 +
 drivers/i3c/Kconfig                           |  15 +
 drivers/i3c/Makefile                          |   2 +
 drivers/i3c/hub.c                             | 607 ++++++++++++++++++
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 345 ++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 379 +++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 164 +++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 573 +++++++++++++++++
 drivers/i3c/master.c                          | 250 +++++++-
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 139 ++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 284 ++++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/i3c/hub.h                       | 102 +++
 include/linux/i3c/master.h                    |  20 +
 include/linux/mfd/p3h2840.h                   |  25 +
 22 files changed, 3228 insertions(+), 25 deletions(-)
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

