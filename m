Received: from out198-5.us.a.mail.aliyun.com (out198-5.us.a.mail.aliyun.com [47.90.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE9261B70;
	Thu,  7 May 2026 02:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121755; cv=none; b=ZHbcZCAwCBbt1Yy7qWUwHXb61LSeUKUElbj1EB0hj/TBoaDwfIpQ7LIgm9Cf0rPl64sFKSz/HVC73nEsx6mwp+eyXP6Jv/OkiAUBUw3bIqIqrQ348Q4tJ4uQQLu/QCkXD6plxBf711LXggY64f8yiu9G6Aikt355C6G0XHiSuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121755; c=relaxed/simple;
	bh=b0i0pglpxPH1i6VZDklXDzAwqZGQrH0BVUJmcLdueFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LnYss7vVtJ1HvK9VHtnNz8dU2Am99bR7vUJ/EwPnSNeJVv76O6439Bc/AUUqi5QTwZfM8GPv3Cs6+wSVtq7Q0wJKbafjmt7ZH+cLhlov8xoMfnvqmfKuqAkQ5Ubw7njVMBF/nEYosmxL/Ih7Fs15WUJX9dF46VzOC/XiF9kwN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=qc7vCbsn; arc=none smtp.client-ip=47.90.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="qc7vCbsn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778121740; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=cSJ9jnrnvZGTNSbO4jVs1jcndSnMw3BS+1A9Y46+N8M=;
	b=qc7vCbsn7ykxrJKaMLzH4X1ymxaZaLcHm+nZh+EHtHLUE9/P8Iv0ZmXni6rLPNlSSmBEfa7cubMuGcD82r8RUE9eTPRxWZwhssA+USXOj+IhdCmpJ5ptt+JHhtZ/XX3ETJcMRoTH2NtUK8bQIciiMa30Zq1Rh69ew9XB4TGQ+ysJClM4a+Fr0VpkEhNxN+DPeltuAVO82ecfJ0mpo5ZOyj7UaMW0aBwtz8ped+pEOeGnrzY3O12PYfLq1QXK89Xm/g4JWz+RHfsIeOwwaKSeILgiFoevXVikfR4IYqFZOAN2idEX59HORKqllLVBlpkYkCD+WdLAonog4YNgVP23lw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07550596|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0201271-0.000526132-0.979347;FP=12562846209438109432|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hRAhTVc_1778121737;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hRAhTVc_1778121737 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 07 May 2026 10:42:18 +0800
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
	yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com,
	xmzhu@lontium.com,
	rlyu@lontium.com,
	xbpeng@lontium.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v5 0/2] Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
Date: Thu,  7 May 2026 10:42:12 +0800
Message-Id: <20260507024214.97708-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

This series introduces:
- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Signed-off-by: Sunyun Yang<syyang@lontium.com>
---
Changes in v5:
- dt-binding:
- drm/bridge:
 1. use #define FW_FILE  "Lontium/lt9611c_fw.bin" to match linux-firmware    [Dmitry]
 2. add atomic state management
- Link to v4: https://lore.kernel.org/lkml/20260506095100.78998-1-syyang@lontium.com/

Changes in v4:
- dt-binding:
 1. fix commit message                                                    [Krzysztof]
- drm/bridge:
 1. use lt9611c_fw.bin                                                     [Dmitry]
 2. use drm_bridge::next_bridge
 3. use enum lt9611_chip_type
 4. remove *fw from the lt9611c struct
 5. "bool hdmi_connected;" variable add comment
 6. use read_poll_timeout and -ETIMEDOUT in the "lt9611c_read_write_flow" function
 7. replace mutex_lock(&lt9611c->ocm_lock) with guard(mutex)(&lt9611c->ocm_lock) in some place
 8. switch to ARRAY_SIZE instead of specifying lengths directly
 9. use dev_err_probe
 10. add clear functions for AVI and audio infoframes
 11. add DRM_BRIDGE_OP_HDMI  and remove .hpd_notify
 12. remove the sample_rate validation code
 13. fix MODULE_DESCRIPTION
 14. replace "GPL v2" with "GPL"
- Link to v3: https://lore.kernel.org/lkml/20260420061644.1251070-1-syyang@lontium.com/

Changes in v3:
- dt-binding:
 1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
- drm/bridge:
 1. Drop the licence text, only use SPDX header
 2. Sort the headers
 3. Use library functions for crc8
 4. Drop i2c_read_byte and i2c_write_byte
 5. Lowercase all hex values
 6. Use paged writes as implemented for LT9611C(EX/UXD)
 7. Drop dev_info, use dev_dbg
 8. Modify lt9611c_get_edid_block, don't store EDID in the long-term structures
 9. Use HDMI audio helpers.
 10. Remove unnecessary flags,Implement proper cleanup path, unwinding resources one by one.
 11. Replace devm_kzalloc with devm_drm_bridge_alloc.
 12. Remove extra kthread.
- Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

Changes in v2:
 1. Forget modify code, operation error, Please disregard this submit.

Changes in v1:
- dt-binding:
 1. Submit the first version of the code.
- drm/bridge:
 1. Submit the first version of the code.

---
Sunyun Yang (2):
  dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI
    driver
  drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 .../display/bridge/lontium,lt9611.yaml        |    8 +-
 drivers/gpu/drm/bridge/Kconfig                |   18 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1240 +++++++++++++++++
 4 files changed, 1265 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c

-- 
2.34.1

