Received: from out28-92.mail.aliyun.com (out28-92.mail.aliyun.com [115.124.28.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50D2E8B6B;
	Thu,  7 May 2026 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778125267; cv=none; b=SeOoKxoTfOovChYZEbtuJToqeuwN9vz8Uk2WcaNK0qN6fbdfmMoMZmCMi+gAjIIcPurJvO0pDAmHks2MQ9K7oYYxHwyuHNT37AMIBiLSLPXds61ed2BypAtPb0dU6Rhmpkq2qW8PYDW2XPGSptqYH5vNareLn77T8s3LkB2Xtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778125267; c=relaxed/simple;
	bh=/RIh2ycE+IXzSNoHQcxBqf6Uguq6HnVR7/rmn/zoxiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mvqRO1SNSNPLAwKmgnd0U5iJYXKozfd6GNICBQRsEDrmCmJdcdT6TyB/KeWZaC/ubuK36mexDqA4uN+pmFhAekBZR6NDy7/2JR2KbAdY1+zDmywo8kukiUFFuy1TQN/I0o5ZuyD0VP6Y2BiODr+ynhBm1m2Zq5xENSy0vTmugzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=dCtzcq08; arc=none smtp.client-ip=115.124.28.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="dCtzcq08"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778125256; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=8hlh69TLukXNhYn2CsDByyP7GpON+gsj+HvV8295yUE=;
	b=dCtzcq08Civ7qnXkNrPhSJVcujl9YkKT3d8z+NYy2N7oKhaLBYBNM9zAL9rZak7MZYN+vosaSEEg1OrXDqelYUEmqQaMk0RZG6rruvCp3ytaZkVierTj1BnDWzVIoaDtUEVpNG4JuTtERz9idMY8c3WYkaBG2VSOgzD7usDA8MU6um3qrXa5JAzuTPGW3z9Cxgp2KfDYOJ9Huqfpa3G1Y0p9eUjqBBKDqV5RsPFGWajjmcwrq91U/M5RkAUt1o4hWbAjZaiL2R/JhbPrVOOsDBYnNeDDoX6VAl02Oq+61UikKs4LYgdf02KH9QiXIh6q4eJDlUCEvXmYOZKAGLlirQ==
X-Alimail-AntiSpam:AC=SUSPECT;BC=0.599292|-1;BR=01201311R171b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_system_inform|0.183518-0.00602126-0.810461;FP=9943956383045776352|2|1|12|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hRFuTI8_1778125252;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hRFuTI8_1778125252 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 07 May 2026 11:40:54 +0800
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
Subject: [PATCH v5 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
Date: Thu,  7 May 2026 11:40:49 +0800
Message-Id: <20260507034049.97765-1-syyang@lontium.com>
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

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Signed-off-by: Sunyun Yang <syyang@lontium.com>
---
 .../bindings/display/bridge/lontium,lt9611.yaml           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 429a06057ae8..b20a43456b01 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
+  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD
+  are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
       - lontium,lt9611uxc
+      - lontium,lt9611c
+      - lontium,lt9611ex
+      - lontium,lt9611uxd
 
   reg:
     maxItems: 1
-- 
2.34.1

