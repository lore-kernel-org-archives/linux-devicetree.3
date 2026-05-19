Received: from out198-18.us.a.mail.aliyun.com (out198-18.us.a.mail.aliyun.com [47.90.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1D3ED3D0;
	Tue, 19 May 2026 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199120; cv=none; b=Xf8uHea18oEX6JPaCmqpJ9wbetALhyHlF5meMZnU4T79ZXbaUCrgALNIDxaTU/Jm2JSBghwEA+e2ywi484UrMaUtR2AOiU55OAL8/YgggdLFR+GXdbBvzxQl+IOcXxtOrKfekOgMTRFXPYiHaZTpb8bYhUeQeXiblrFUfJXkXPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199120; c=relaxed/simple;
	bh=pQxm2QYPzLdQr8tQqONPg2xaPCffTDLc+VBIED6lAK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YRW9+jbdMV7ikDFaieasHJiA4woj/5LINjCCrOnir5EhW72UJQnc/S0h9l+LgTeLDUmnCgldWP25rlvUhUJCYuWZht00JXVxzwyVNAnDlmBfFPExZq6NZDJi8WVKJbrDpPbJp00OXy80m+lUJRPwOU5r2ignTWDFZ2T8VI0V5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=g+dFbUD2; arc=none smtp.client-ip=47.90.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="g+dFbUD2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1779199101; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=dC5p6WLx+1YxvRHi0MVkMvCJDk91rLzUfKqhoVO1xj4=;
	b=g+dFbUD2UZTM0oTIT4nMsIOvfknOyY2ijSD2QByYafhtUTkuxxdLSp8H3QxA3i6JfbqJuBaV1gCAucD99CI0Q4cVD/zE+ZbH9eEiJntPGmjLtiQRQ1hPrwfhR/MEpHLWEF+WiUi23GfhiABVhoPjKwagjirBh+WecI7Srn+A6cW7a3P90oTqer5wruldCcKGhRzwyACVksQpYNOwCZKXz858KxuPDh/kljql61YZQ82VhuYTtDmh+l3CLsU3PWgLp51eWIBYhhkvV/htvhinNDtAZglLFC5sOYaXV/CrvUBfQ9EjKOwkAdIjuKoFq22IWngTkoGPVrnjIOAGe6IMHQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07439937|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00537018-0.000131359-0.994498;FP=7573218646630785144|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045018182;MF=syyang@lontium.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.hbB8zG0_1779199098;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hbB8zG0_1779199098 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 19 May 2026 21:58:19 +0800
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
	qdchen@lontium.com,
	llzhang@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v10 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Tue, 19 May 2026 21:58:14 +0800
Message-Id: <20260519135816.26996-1-syyang@lontium.com>
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
Change in v10:
- dt-binding:
- drm/bridge:
 1. Fixed the firmware upgrade error paths to always clear the upgrade
    flag before returning, including firmware size validation failures
    and allocation failures.                                                                [sashiko-bot]
 2. Added proper locking in lt7911exc_atomic_pre_enable() and
    lt7911exc_atomic_post_disable() to serialize register accesses with the
    firmware upgrade flow and avoid concurrent I2C transactions.
 3. Added an exclusivity check in lt7911exc_dsi_host_attach() to reject multiple
    downstream attachments and prevent repeated drm_bridge_add() calls and panel bridge leaks.
 4. Reworked lt7911exc_firmware_store() to use mutex_trylock() so concurrent sysfs writers
    immediately return -EBUSY instead of blocking behind an active firmware upgrade.
 5. Updated the remove path to prevent new firmware upgrade work from being queued after
    device removal by setting the upgrade state before cancelling the worker.
- Link to v9: https://lore.kernel.org/lkml/20260519105019.22622-1-syyang@lontium.com/

Change in v9:
- dt-binding:
- drm/bridge:
 1. DSI transfer callback returns success for reads without populating                        [sashiko-bot]
    the receive buffer, leaking uninitialized memory. - fixed it by 
    implementing  a strict whitelist mechanism.
 2. DSI transfer callback polls for eDP video readiness before the 
    upstream encoder is enabled, guaranteeing a timeout. - removed
 3. The driver attempts I2C transfers while the hardware is held in
    physical reset. - fixed
 4. Missing DRM_MIPI_DSI Kconfig dependency causes linker errors. - fixed
 5. request_firmware is called while holding the hardware lock and
    halting the MCU, risking a system pipeline stall. - fixed
 6. Sleeping functions are called from atomic context in the DRM bridge callbacks. - fixed
 7. lt7911exc_dsi_host_transfer bypasses the required MCU hardware halt sequence. - fixed by 
    internal firmware controls the panel initialization sequence and handles all MIPI
    DSI command transmission.
- Link to v8: https://lore.kernel.org/lkml/20260515080934.9870-1-syyang@lontium.com/

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
 drivers/gpu/drm/bridge/Kconfig                |  16 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 688 ++++++++++++++++++
 4 files changed, 794 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

