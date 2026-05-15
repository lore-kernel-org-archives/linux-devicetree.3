Received: from out28-3.mail.aliyun.com (out28-3.mail.aliyun.com [115.124.28.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3733EBF00;
	Fri, 15 May 2026 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832590; cv=none; b=ScO/nrVzFT9Qy5CEoaOXrYb8rYM45L/yC0e058o6akIZWutMS92HqIcrUrzKP2CF5dViQ0F0a8WJvLEJq8ngWVqRM0v9qSmbQ8/fFATY7rTRjb67tUSyi+ZuQR3G2wogD+33BSKspZCtpi90Euu8uPMIIwcs8lmEx05B1ibM3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832590; c=relaxed/simple;
	bh=YRxPCsBXKSmKiqzd7GyUB687YT7EUNd8bRsYyJar3w8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TUORgFegEK+JlyQvBsa2Qz6qFTxlzC5/gO3MWkQIey+arg+pJghUVCRVTo+/5U8WMEKimCfRM2FwWIJs7jJLIHf38Hmnfy+leICmW99cUxIrCA78Z3LzgFiYUfhGbLOVNzjufHKHm2bj0tDwJ3+aKxwrvd3KctpVFfWYe5eiFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=It2b9PiG; arc=none smtp.client-ip=115.124.28.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="It2b9PiG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778832579; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=n97Oyg84dk5EY4d0I+9QASAv1qZ2GCLeJ3izRMOQfW4=;
	b=It2b9PiGrp7p3aOzxp5tCOwULW0vJqkRZuBMasxOKIOPVsaP78jnzpyGszzKDN8iKO6xS0+1t1ZJtWSG4kJMEZnFaO+D9ax3O8XhFJnTYjZ1ht5lU0Dfm+u3Y1k5o4s9TUMdyREDxqOgs6nfSKNW60Ye4mkeW4u6SXv6JB21yBpo2ISwnhq1pgS/wxhsO0n96N/nGpS4ONUL54j7nkSWpO8gT2n5zD3iFG6xBB5EKjuGPi/ohX0+GyHSdI5JKh6aZb5uRLLQDk8NfDYRBuR+ki6uGzRrylnVZBBx2Tq/LCdt2bJ4WWlR+df0Gk34W4wS1rNXqPWWrHZW+7YeGCzHlg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07503951|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00535992-0.000147791-0.994492;FP=7586586509018128504|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=syyang@lontium.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.hXlHgq0_1778832576;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hXlHgq0_1778832576 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 15 May 2026 16:09:38 +0800
From: syyang@lontium.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	rfoss@kernel.org,
	mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	tzimmermann@suse.de,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	rlyu@lontium.com,
	xbpeng@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v8 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Fri, 15 May 2026 16:09:32 +0800
Message-Id: <20260515080934.9870-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

The LT7911EXC is an I2C-controlled bridge that receives eDP1.4
and output mipi dsi. This series introduces:

- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality

Signed-off-by: Sunyun Yang<syyang@lontium.com>
---
Change in v8:
- dt-binding:
- drm/bridge:
 1. Protect firmware upgrade and DRM bridge callback paths with ocm_lock.          [sashiko-bot]
 2. Remove the hardware reset from the remove callback, and ensure that
    all hardware reset operations are protected by ocm_lock.
 3. crc reconstruction explicitly casts each byte to u32 before shifting
 4. The display configuration is handled by the firmware, and the MIPI
    DSI host registration issue has been fixed.
 5. The batch register read/write operations have already been updated
    to include return value checking.
 6. The dev_err_probe() used outside of probe context has been fixed.
- Link to v7: https://lore.kernel.org/lkml/20260512064013.40066-1-syyang@lontium.com/

Change in v7:
- dt-binding:
 1. fix commit message typos(Receiver、signal)                            [sashiko-bot]
 2. remove the ambiguity caused by "signal/dual".
- drm/bridge:
 1. using devm_regulator_get_enable avoids power leaks.                   [sashiko-bot]
 2. set reset gpio is low after cutting off power in lt7911exc_remove function, avoid backpowering.
 3. synchronous request_firmware() call cause a permanent probe failure if the driver is built-in,
    probe executes before the root filesystem is mounted, which would cause this to fail with -ENOENT,
    we have removed this functionality. Use trigger to upgrade.
 4. add `depends on I2C` and `select REGMAP_I2C` in Kconfig.
 5. add return value of `devm_drm_bridge_add()` in `probe()`.
 6. add directly header files (linux/slab.h, linux/delay.h, linux/regulator/consumer.h)
- Link to v6: https://lore.kernel.org/lkml/20260508134702.4713-1-syyang@lontium.com/

Change in v6:
- dt-binding:
- drm/bridge:
 1. use #define FW_FILE  "Lontium/lt7911exc_fw.bin" to match linux-firmware
- Link to v5: https://lore.kernel.org/lkml/20260506013153.2240-1-syyang@lontium.com/

Change in v5:
- dt-binding:
- drm/bridge:
 1. Change "mipi" to "mipi dsi" in the commit message.     [Dmitry]
 2. Change "eDP/MIPI" to "eDP/MIPI DSI" in Kconfig.
- Link to v4: https://lore.kernel.org/lkml/20260430094612.3408174-1-syyang@lontium.com/

Change in v4:
- dt-binding:
 1. Fix the missing spaces on the "subject".             [Krzysztof]
 2. Fix the error descriptions for port@0 and port@1.
- drm/bridge:
- Link to v3: https://lore.kernel.org/lkml/20260429040541.3404116-1-syyang@lontium.com/

Change in v3:
- dt-binding:
- drm/bridge:
 1. already submit lt7911exc_fw.bin to linux-firmware.  [Dmitry]
 2. remove lt7911exc_remove function.
 3. drop  the "lontium, "  in lt7911exc_i2c_table.
- Link to v2: https://lore.kernel.org/lkml/20260428063224.3316655-1-syyang@lontium.com/

Change in v2:
- dt-binding:
 1. reset pins use active low.                        [Dmitry]
- drm/bridge:
 1. use atomic_* callbacks.                           [Quentin]
 2. fix the incorrect formatting and spaces.
 3. add the required header files.                    [Dmitry]
 4. remove "enabled" flag.
 5. remove *fw from the lt7911exc struct.
 6. .max_register and .range_max use actual range.
 7. regulator use bulk interface.
 8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
 9. Replace GPL v2 with GPL.
- Link to v1: https://lore.kernel.org/lkml/20260420023354.1192642-1-syyang@lontium.com/

---
Sunyun Yang (2):
  dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
  drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

 .../display/bridge/lontium,lt7911exc.yaml     |  89 +++
 drivers/gpu/drm/bridge/Kconfig                |  15 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 642 ++++++++++++++++++
 4 files changed, 747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

