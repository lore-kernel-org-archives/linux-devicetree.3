Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282D2DBF75;
	Wed, 29 Apr 2026 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435551; cv=none; b=p2zG3S77y29ASKA7EgPODLLxe+hrLSnuDV8qinVonl+lWk1p/x8V8szXTyr2D8Txd7l7y7WWV0jqWtou2Y21V0M5+l/7yidiTFtDm6cqyWCoi72OimqlMqU7bnfBsKjaGcuPnas+jJwwv2ciXX55NYqzBa5udNWUyYjp0g8CYCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435551; c=relaxed/simple;
	bh=eR2HkqitLzbj3bawJz3mcluYgcplnqm8jqGmFmOXDjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gUGRrBpEEC3vAQHIH5KQ1hbPsAxyXKUpkQ2g9CLi7aAhg0LJ5+UEuu31FLOi8mpJgvZNO62T95xgBlhF+K8BOFiQU5K3bebvoWuK4O5IUe9PEnOCGm9zCogmSD/SJ/sDc9WFm1ersfRLIMYBuH4qPQop3TQlgR++rTAOCla8Akc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=MTSmyc0D; arc=none smtp.client-ip=115.124.28.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="MTSmyc0D"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777435547; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7fr5E3bjCZzHmKuL1ycnrSJ8K1eCQ6VS79v9YrqXIZM=;
	b=MTSmyc0DiUz7v8r2AJVe2DIf3+zd4Q5bDBas+eKHJAWRUJrj1qpcaoDh1OOkZ6XKfJlRnj0m/GofP1LVjDc/nt9X1etCe+IHSAKITGgigCIPsAwOEPqTERKxBYARhNhPpc1wd6JvPtaC/bU5H7OdNmUMq+ke0NW+TYuZbWRLMaAbJSHdixIKAI82Dtok1aNEo3h1497J7JGt/9I61fOq3D+H8/942B43hoOhco2+JsyKnV0tZB8bUrESZNOLKCWvHPTt7jYjoZmX+RSFjvyVElx3OEjazeFaHrQiHtWJ4+LgChhwzxcmePqaWRyJSrfoDyUvONLGtrM8iw3sjLJzXA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1599562|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00436973-9.95173e-05-0.995531;FP=7874808089073602041|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hMViCi-_1777435545;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hMViCi-_1777435545 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 12:05:46 +0800
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
Subject: [PATCH v3 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
Date: Wed, 29 Apr 2026 12:05:39 +0800
Message-Id: <20260429040541.3404116-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
and output signal/dual port mipi. This series introduces:

- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality

Signed-off-by: Sunyun Yang<syyang@lontium.com>
---
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
  dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
  drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge

 .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 493 ++++++++++++++++++
 4 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

