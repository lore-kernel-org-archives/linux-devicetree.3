Received: from out28-112.mail.aliyun.com (out28-112.mail.aliyun.com [115.124.28.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A138DF9;
	Fri,  8 May 2026 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251327; cv=none; b=dpgjNQgfp4wHgJZe43tr/p/SoWQ5XEs6ardpx3uB4bRM2vX3W9Uo23f9YU1qbISjqBUjOwmPg5QnLMMkScWxStVMQ24h6FDeqdStMLRg1wzTVfP8IAxBlgMYJUULAE2dy41XPN7+fFB0C+seh3jLSFjjnxIK9h2t21kYQeNB37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251327; c=relaxed/simple;
	bh=BKPx+DwWlEDJ4IBSzpF+6CuZw3pIgevIIIrRUziMCEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O9JOtNhA17L5x28U54TVX9Rsh6N9VR96rDEir/5OR3Sv5yYZplV87bMX9Z1vCo1mei+EXe0flGOElHPyDSnn8J7nd5CnJEj7Ut/fGnUCNEs8e7fREg2t2gejaNkgYnOuUbzdDdASv+Toem0OwZb0P0J9Lkdr8b0RrP1zvdAhahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=Gnze0pEN; arc=none smtp.client-ip=115.124.28.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="Gnze0pEN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778251317; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=FkIOV7enKNbkeRupd/YkRnYNKVKO217Lx4gtauvA93M=;
	b=Gnze0pENmawn7rJRl1+lo2eYJOTF1MsKG8Tgu50uo/spFfoqsBCFUVuRZSBhQgc0bOGtYAlRwm++GSKreGN8ukHhSc3PcMglScvq05+GjgLVf31HZrcMKadxeSp0LoEum/fdqWeYeTkh1aSOqGWaCzh3RrYwLoifVUr609cY0rYamTPLmS01xr0fRPDv9wpOYUHW07fjvG35Ft+SE/Il6im3lO2PNYpDQA2+SsDphdMPw11PhsFp5zU5fTo85D3peIZ27tHTKIpZVdYi3Ob/Iox9RUihoiHErtIboxkFAQcNocKFr6IkYvzP1kuXptQr+EHzJ9rTF/NoZtkcoVVagw==
X-Alimail-AntiSpam:AC=SUSPECT;BC=0.6169025|-1;BR=01201311R151b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_system_inform|0.183518-0.00602126-0.810461;FP=9943956383314203584|14|2|17|0|-1|-1|-1;HT=maildocker-contentspam033045018182;MF=syyang@lontium.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.hShj9lU_1778250303;
Received: from DESKTOP-V2MKAT2.localdomain(mailfrom:syyang@lontium.com fp:SMTPD_---.hShj9lU_1778250303 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 22:25:04 +0800
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
Subject: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
Date: Fri,  8 May 2026 22:25:00 +0800
Message-Id: <20260508142500.4922-1-syyang@lontium.com>
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
index 429a06057ae8..e0821a63d9d7 100644
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
+      - lontium,lt9611c
+      - lontium,lt9611ex
       - lontium,lt9611uxc
+      - lontium,lt9611uxd
 
   reg:
     maxItems: 1
-- 
2.34.1

