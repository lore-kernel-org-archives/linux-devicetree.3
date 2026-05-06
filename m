Received: from out198-26.us.a.mail.aliyun.com (out198-26.us.a.mail.aliyun.com [47.90.198.26])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A421A0BF1;
	Wed,  6 May 2026 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031171; cv=none; b=Wbq/O1S3h/d/vE5bIfOOERWdQeY7tIObCvkSxj+brw1lf/b8gCBulbjpVEQXyO3x9YIsGayw2HXgzr0ac94usepVqxfG1iYkzObAZw+n2OeaRTN+S5VSUVCeBXiJuStc/o2Jml1iwVVIcwiJ8o5Rzmv3kq/NZb+9CvybGACj2Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031171; c=relaxed/simple;
	bh=b8YFwPpi8qezxaiHuAilzmv/Eoy4UE9bDrDM8edNmFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DU9OIBacttoVYT+TpHi5nRXRY5VKjzDG2Rwo/a1ptrbR/ddDJNVl6x767vlleiImwRHzyaqgi3yg9y6BsvS9pYPjkYBFXMzAse9dk5nkvvi5Y5bewRDGCSC9VSBYFZyM7GHyu4PUZUN3P8/Sop8bVxdpMiJNmDBGNEhZECV7jiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=lGgE4SCO; arc=none smtp.client-ip=47.90.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="lGgE4SCO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778031117; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+UwgwNVJpqdu0DR5T4cYxdyoUgJV3ih49BLLqyFdtWM=;
	b=lGgE4SCO42u4so+Pb5JTDs/rO678cHpP+2D83VTXRw1hpasNhjunNSCEfjT4Y6vLid0Pophqhes0kopLJOpt+Z+ekSMjD15bivNWCHulX2c3N+R7aLnMRQwf9zZhuxtM8bb5XAsWfALXnBboAcPQbm034h6LjT7MgcjELsSf830hx7dldtI6+AqVz6XMsF7tw/CUtkfw06Qf5IY7+4mFGBbbA6v97pZhxGxLXmlmL/oTs8/4zf9y34+nc/2EDcEM22/rF+0kBDvV27vUE8v5RpBz6iQloz+pLWi4Wyvt5MEnVW6mkkXL7uZs7jlZoz93PAuqvn8iIpvFRp6qOIPynA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1564394|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00363759-8.50324e-05-0.996277;FP=17026090100592381048|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hQNamiJ_1778031114;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hQNamiJ_1778031114 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 09:31:55 +0800
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
Subject: [PATCH v5 0/2] Add Lontium LT7911EXC eDP to MIPI DSI bridge
Date: Wed,  6 May 2026 09:31:51 +0800
Message-Id: <20260506013153.2240-1-syyang@lontium.com>
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
and output signal/dual port mipi dsi. This series introduces:

- A device tree binding YAML file describing the hardware
- A new DRM bridge driver implementing the basic functionality

Signed-off-by: Sunyun Yang<syyang@lontium.com>
---
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

 .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 493 ++++++++++++++++++
 4 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c

-- 
2.34.1

