Received: from out198-5.us.a.mail.aliyun.com (out198-5.us.a.mail.aliyun.com [47.90.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66413F54B4;
	Wed,  6 May 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061420; cv=none; b=pJ8NyMv8Z5uFgBmIRib1rqO/5CHtOxqpmVQQosntGQKUhlNFcOUSS1hSBhnqv+Y/fV25bWNpNIlHGfOsoENsFKEho7a3jNAb4SyfjS5GLKSYzeEFoJ4Iq8NpD2gkRoZBI6GcaHdEEnAQh8pCObTMou4AqIx1v3eczCt+zCaWePo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061420; c=relaxed/simple;
	bh=RLOz/ZnVJZCDYB9dS2jiJaVTjLGpOoo2hwv74R6DDKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Au3Va0meB4L2lIJF1758pPiHGX1kHbheFmJR68b2wSJgAXqSnbi/Z0y06Ei1kKhx2//QFsCSerR/JYGOQK7rOuVbMo9Q2x++DGQx8NE+wpQx3YeFl6JyM63THxtChFr1oHe0St8E6ztv/3CvWsNQznY+FNeHPYsi/EitULUqg6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=vpiQMNwt; arc=none smtp.client-ip=47.90.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="vpiQMNwt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778061384; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=rTVeenQDP4Q2AleUYbvOEo57e4WiFM7IEwD5oihr2sM=;
	b=vpiQMNwt8JNrrmnkInLNkXK1iQdtWZNN2FlpYCtXL0rbvjnq0BhsmZIKcAs6X/EzJkGXhx9M1OZA02Gj1MlipxIcQVYOhhtQkLOXQjXC1H4b6Tpb50GxDAhyztJpkq01ibo+4df/hrVvG5JDJiW7EuHnU7flmBctbdomrtnRM7J61q0lBwcJeSvr9OTrWN3ejYDeCyWau+hm7i1AxKpq5ht2zE12ocH/sikYsmbheu72460Xnz3AcKhxRDxiZP8TvuFkRVNrYR9fudc0jh4ReT8fNMCZFa6tamxwg7GzlApO+XvDuoeUqidKMw3MaUT8xJWIwNDAdh+azDI99bICLA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07905283|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0167526-0.000462775-0.982785;FP=12634903803476037369|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068016216;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hQlP4X-_1778061062;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hQlP4X-_1778061062 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 17:51:04 +0800
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
Subject: [PATCH v4 0/2] Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
Date: Wed,  6 May 2026 17:50:58 +0800
Message-Id: <20260506095100.78998-1-syyang@lontium.com>
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
Changes in v4:
- dt-binding:
 1. fix commit message                                                              [Krzysztof]
- drm/bridge:
 1. use lt9611c_fw.bin                                                              [Dmitry]
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
 10.Remove unnecessary flags,Implement proper cleanup path, unwinding resources one by one.
 11.Replace devm_kzalloc with devm_drm_bridge_alloc.
 12.Remove extra kthread.
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
 drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1211 +++++++++++++++++
 4 files changed, 1236 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c

-- 
2.34.1

