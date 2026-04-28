Received: from out28-3.mail.aliyun.com (out28-3.mail.aliyun.com [115.124.28.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1B175A72;
	Tue, 28 Apr 2026 06:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357962; cv=none; b=swFdTUkhaZWUVdcrUfhiMcSlFF5Nz9eomIf9W1oHHzJopzvGWS9zfJyZVIaymxG/WgWO/Vxxsnk5Y3WDcYrSVmgJ2nXvAib2KsxlalOggTXZwGm3xpmR7olZ9bMjm1i/HmYU6VUCa4LY/Lt5+WJa3SIVSyQA8mFAl7HY/oNk0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357962; c=relaxed/simple;
	bh=d7UsIGAL2elOYBblg57Vtj7xITQYJbYSPm41n8mWcxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mdIMuHIBab/9ov0mpSISJNZCJAOtw/ZsLaloZFOpGfYExrrxBGimlI3gTFZ9wLt9iHaxIut4VjCmAYZ8qLpKINxKa3bbWpShZLBKENu4IEJUf0cJmEmW6Mn5Rh3rZUGqGPw+1vQXLFHywrCul4HyOfEFs7rHtnyU18Ta21DdvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=XHUcy/Z7; arc=none smtp.client-ip=115.124.28.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="XHUcy/Z7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1777357951; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1lDrImTp9mJIo503AuFEkRnxI/JUO0PNkk1WhsvyCxg=;
	b=XHUcy/Z7p8mHKinvb8JYa2Czkv/ZrJB7iLM8EB7n+SBF24CSpgCJogJ9/12CcfK8enE4iGiWlXgCFoJD9MGvMLGuND5KXfv8B40pt82FYw1RnFqyRLYBeUpQaKdaRuQHkmkEaAfULwPClxG5y2/eAx/7Bop/hZyrvSLmRHwJtXo+UgIiGYbLv8/MS7GFPUb5WD+lJOKANRBjNbQV4OtPGnXN03cPx5R6rwWccrYwyHj+mZ+RjIy3pYKVw1qpXudvKftcVh3cyrdg2tM0nZTixA07tlkoMSTabxeQJDj8BpRrmRzqhGSOKP3dJE5xCxCO3TzCx5ViKdj8ppai/EUeig==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.240612|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00668875-0.00019251-0.993119;FP=7856652936164330937|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hLqybuf_1777357948;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hLqybuf_1777357948 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 14:32:29 +0800
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
Subject: [PATCH v1 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
Date: Tue, 28 Apr 2026 14:32:22 +0800
Message-Id: <20260428063224.3316655-1-syyang@lontium.com>
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
Change in v1:
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
 9. Replace GPL with GPL v2.
---
Sunyun Yang (2):
  dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
  drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge

 .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 497 ++++++++++++++++++
 4 files changed, 600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

