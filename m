Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F8C29BDBF;
	Mon, 20 Apr 2026 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665821; cv=none; b=KMyFcfYmhhGbs1Z/aFfz6/T1AsaTKvxGsn5AF2QwSfwKXXasLGOgVTvDOeDdxVctYb/dUcqTbsFnw3/mERJJyFi/Y85mdF7CiWg+B290e6LBFtc70JI0MM0/pRURO/510hT2v5IRW7OHdm/yaQKAr9nk7OirQUgaRXPK67MJyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665821; c=relaxed/simple;
	bh=1nnUBVTtlI6Gc47mbBtzpDJPdRrp1+o3L5+TQKPWwW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W/tSaxgKjubwfz6Ul9GejviiZjaG3ZOTJjZGFzrvLLbZUsugwm4WH0SEAy282gSVOwIDMVvn/jJFHPQroO2kyXt+XVf7fFVGP2UNliS2loe2+FKZB7SS049LsLZVhC2rD56JwPW2M/VdnltAsl4WLyEl0u60jiAj/Mdb80LCurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=c27ynN/h; arc=none smtp.client-ip=115.124.28.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="c27ynN/h"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1776665809; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=joljCzzpQ3BWVjBWEzq/YmymQ3S+YGNeTfY7syNIJMk=;
	b=c27ynN/h8YsJ49VWFz7YLlLb3UuC5ZI+RR3ieMLABaYrH8uFww79A28BhZCo2a4+lKUWjzmVg1B5TpW5XH4zyCE5VlFhAvszqEgUhYKcZHJL/rPUp5PLZ8N366rpD6ResxUdi9Y4NmxznE6j2zJdBHSeH/LUznRFDtz9QLBpyOMgid5wKWjlWLsg7aOSkPDSPUyagfK96oTr5ibAHJ96GUGLW6uoPaubimKCrI/ldCcdGoCtf+w84PoPzV0nBIZq6VV77c14uJZRRgr2v4wybVLImxIi/NQYZHSSMdAygznmzuswpZqiCZm3JjPr/UXFtZJqEMAmWEkcp3c9uCVMqQ==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08217578|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00760056-0.000148186-0.992251;FP=3247150432297668347|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=syyang@lontium.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.hFz0LsH_1776665805;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hFz0LsH_1776665805 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 20 Apr 2026 14:16:46 +0800
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
	tzimmermann@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com,
	Sunyun Yang <syyang@lontium.com>
Subject: [PATCH v3 0/2] Add LT9611C(EX/UXD) DRM bridge driver and device tree
Date: Mon, 20 Apr 2026 14:16:42 +0800
Message-Id: <20260420061644.1251070-1-syyang@lontium.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunyun Yang <syyang@lontium.com>

This series adds support for the Lontium LT9611C(EX/UXD) MIPI DSI to HDMI 
chip:

-dt-bindings: bridge: This patch adds new content to the lontium,lt9611.yaml
 binding file.
-drm/bridge: This patch add new DRM bridge driver for LT9611C(EX/UXD) chip.

Signed-off-by: Sunyun Yang<syyang@lontium.com>
---
Changes in v3:
-dt-binding:
 1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
-drm/bridge:
 1. Drop the licence text, only use SPDX header
 2. Sort the headers
 3. Use library functions for crc8
 4. Drop i2c_read_byte and i2c_write_byte
 5. Lowercase all hex values
 6. Use paged writes as implemented for LT9611C(EX/UXD)
 7. Drop dev_info, use dev_dbg
 8. Modify lt9611c_get_edid_block, don't store EDID in the long-term structures
 9. Use HDMI audio helpers.
 10.Remove unnecessary flags,Implement proper cleanup path, unwinding resources 
    one by one.
 11.Replace devm_kzalloc with devm_drm_bridge_alloc.
 12.Remove extra kthread.
-Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

Changes in v2:
 1. Forget modify code, operation error, Please disregard this submit.

Changes in v1:
-dt-binding:
 1. Submit the first version of the code.
-drm/bridge:
 1. Submit the first version of the code.

---
Sunyun Yang (2):
  dt-bindings: bridge: This patch adds new content to the
    lontium,lt9611.yaml binding file
  drm/bridge: This patch add new DRM bridge driver for LT9611C chip

 .../display/bridge/lontium,lt9611.yaml        |    8 +-
 drivers/gpu/drm/bridge/Kconfig                |   18 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1365 +++++++++++++++++
 4 files changed, 1390 insertions(+), 2 deletions(-)
 create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c

-- 
2.34.1

