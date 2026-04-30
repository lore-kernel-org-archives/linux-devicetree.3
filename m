Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979BF3A545A;
	Thu, 30 Apr 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542710; cv=none; b=LFgDMN01wCNpQ3mtb0vmplLw+5/FL3J+dDNcsAxooX4igE9q5sTr8wd+9R2U10HOJPuOvU3do9ocRTIjjCeypxl7Y12xb4EVSk0/rEYkpcN+oCIR0FkV9mFH9b7RyeAfYpPFSnjLcNKYxkc32EiEGosw5Ee1oOFYscE5u9LGbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542710; c=relaxed/simple;
	bh=JrDiQmU36Dnvpxm3obMClOqvaiJ9dgoWkYrEpSYGC1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i5DePVTyyb3fK9fvt4hNyfVykZ14++KHq7UKI/DL8fdEzNo+eMPrkDHP3ds0PO2rWi6WMHd/7CkSgvS3Y89qr/H1CHpluxZBc597NKnKGs8sAclYJ0Y2xA0ZTsaP2feN3JwqNP3TSCtStCEYTJ9kMoFycEevcSKSQ4h+2QYPogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=m1P/sVVa; arc=none smtp.client-ip=115.124.28.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="m1P/sVVa"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777542699; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=LE+sPblj04tWoSeV8fpMr+HaJy7Zfzk68wAWVO5KMq0=;
	b=m1P/sVVatriuuIPdsDo7Fw1Ev8sTgpjx855Oco9bmWTg29BKkwVtWjDyBV4sgVMYFXvv64KYgTYdDFyWnuwCHbgjc+sQeO/3Js3u+XylVO2O+PzquPsSa6TRD5gwLOkMqqiFVGLuv3tMtcvUInAJy4m8+WwozwDdFrdm3EgSLqlipTxsuyh5HM/LCZZE/Z7BVRj7FHGV+MfdwcyK3a7SfMOE/g5tywO5q4gC/FQn1VX2XQCuwb/HqYi/hSxB9LHcgTOQ5xUEAT6+MVAEA6KrAQ9de5d+HagyPcgZyuHWzh/6COh3S9TCbNHxeNH6Yfzc7yJhygykvMo+EKJ+v8kmxQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08588946|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00363759-8.50324e-05-0.996277;FP=7874775103993203832|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hNVpxsM_1777542374;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hNVpxsM_1777542374 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 30 Apr 2026 17:46:16 +0800
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
Subject: [PATCH v4 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Thu, 30 Apr 2026 17:46:10 +0800
Message-Id: <20260430094612.3408174-1-syyang@lontium.com>
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

 .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 493 ++++++++++++++++++
 4 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

