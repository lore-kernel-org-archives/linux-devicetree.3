Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558208;
	b=Hytx6A1n6VtivRE99DsOCnTlM/wJYzuP7IscbSrc50CXJ7lSGLAwqTXRgtLHSZ8kQmEQ
	 f879fbJkZ1ph7BL5B0RgUNW2u6Nl6SKMG0SFOStvb7Bv56R5cuqmfnPXgYUDNCFzrO+ji
	 0zi2artmj4BRP5rUwe1L1ykQ0ELlGUOpAegL02HRaebDAkUrUn3II83sEx6Kk/xvj7a0m
	 9OC6PivVBJoL+2JAeykNIx42RZxAnOH2uYe/Fkb2S6VTEL6S8xOTCCGLGjkPOQ09MQPxw
	 yQ/gQMDzV+feAJgCipudOiMspuQq4hQFyNFgQ33z7QgGYdgCJYcvOONcD+XviDUK3Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558208;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QfDk3xu678Zx6FcZEcyOW8onlNNqU96jfoIJwQcmtcw=;
	b=XcC5FdXTY+2Gpk8qu8VDjbOI2Ef+FssY9MOQkwCShVXWzgUszFVdQivyPpdEQYmPFRsu
	 kXCj+KGqI/0oipD+cuJoP5UiHtTCjuFsUxxbl+/J/5L62l2lxa1vtmXAuvcECwmZavP1T
	 /vvIneZeuvCiXsyuue+vSlP48WARpRFM+2iiecmXef4QqB07lj1OTiHJBqYuOnoYkMFx0
	 nX158M7/8dWTsyr9u9s8Ua/ecwdznSa4Vf+56mRKCpvlwomHc20WOJOHVvjypTmkM2Tmj
	 XMTX+sYoPjtAHu9ooDIPTVpilhrZSwAjAoK0tJoucLqj+Q78u8lvhVPSL6FldDZrR+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efaklhGK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE42A606A32A;
	Tue, 24 Nov 2026 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efaklhGK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558207;
	b=bIbXjBK4f+964WeWVJ2CBSjzi9EF3SO2LNdvvkMV3RWqkdfNNGfE6DKWCQLZekqqOFRz
	 6cvyXp6ysDIXrNJeva4QlgvC+rlPnRAGCDdSi2LvqA0H71NlZV6rqjC+hR/y/vI/mQgPi
	 L44VKZVVMe5XR7dYw0hH7twI4a2iXU5uEPZDjUBIxdk/BzM9LF6YT61ltDFFv0YaqmF4g
	 3D5xh6m7elf8kW+EeeS38CVhejIoTkQJ5ZJF30cZ6hYbiI8gDvL0zR6REFNh/fWjB7z5W
	 hvS8PuVlaucsYZnT8Nukly7KtKsZAQUxCdHbuvXRKarll+i0Uvdh2mEZq8lgNV9EFEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558207;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QfDk3xu678Zx6FcZEcyOW8onlNNqU96jfoIJwQcmtcw=;
	b=l6+CQZUGrvzI5rWEVJZel9/KLuGddS+mhkb49nw3dnFLJt+w2NMxKEMq2/SHjh2pSEO5
	 Th902e/UGEL8EUz7Y/kL/ZilsYJpUdujzdGaAmSHdLDFX9WCwNe8WIDp9PjN9IbIKVRO+
	 ZUAESjbm3SzNNSvhAFXKtJxyP9mGuf2wzTTIAArOPs2x0K/itJHeq46CfEUh3lbFr53v5
	 dolKXEZqrCSO7rZeV2TFDzDZpNJPYdW83e8ThzPoxJ6ycDw0Df7MRyTOJ+A3IQFwqQP6X
	 uwUEWnYPd+njpnqaKUdl47dOpADPYJI/iKMwIu5kTsccLpS2ADMeRNjlppPQ17paetQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50D5F1F000CA;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558207;
	bh=QfDk3xu678Zx6FcZEcyOW8onlNNqU96jfoIJwQcmtcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=efaklhGKWmOg/TMKU7H1lFQtZhj31D07ZzuWg3GAgk+gubKoNrbSYcUhEkhanDCvv
	 gKr0KHbEo03S8KD8Nz2KySRqh143BNb0Z94u9Oxc0m45yAFxLbs9srqo/1vdGaE1MF
	 VGeXZKBsQkzwIflTjsP9V3rMZ6LMcCj6t2iUCfPWTexTAweX8i/NEiMe7tPb4ZtlkT
	 wPFLW8HhTHgaQWX1BTpKF3KB9GL3XYBPf5qIDdvHIi4wVJ1L/EhlHxd0MdeTgCEZUH
	 CCdqqcFJMHdwDVFwhhZx8VlxPe5pUAN0Mx4J3yDorpQQxZf1K+RJq1TqBhmllceccp
	 9BG1IhXL6YCtw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D52C94CBCE;
	Tue, 24 Nov 2026 22:09:56 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:51 -0800
Subject: [PATCH net-next v12 03/15] net: ethernet: oa_tc6: Move oa_tc6.c to
 its own directory
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-3-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=5311;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=vlw5eNMTC4LNhgd270HyNjbHfMnHwq4t5ETJmVYjW1Q=;
 b=9xA35KVJa4h7zuCX11PgeXVZZd0CZk1FQgpbQm6jAURtZbgnZr7dEbhdcX+S3waE5qKudjyK2
 yTiuxu0waPsBFjRyNkKNMIFLGqQSZlqa/gnQa86EuIBfojwyoDEZTBw
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Move oa_tc6.c to its own directory, drivers/net/ethernet/oa_tc6.
File oa_tc6.c is renamed to oa_tc6_main.c to maintain the kernel
module's name as oa_tc6.

Having a separate oa_tc6 directory will facilitate adding more
files as subsequent patches will add files for hardware timestamping
and PTP support.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - Changed the commit message to remove the term "patch series".
changes in v11
  - Mentioned the renaming of oa_tc6.c in the commit message
changes in v10
  - Kernel module restored to oa_tc6.ko from oa_tc6_mod.ko
changes in v9
  - Changed MAINTAINERS to add "all files" under oa_tc6
  - Added the missing "if COMPILE_TEST"
  - Added Reviewed by tag
changes in v8
  - No change
changes in v7
  - No change
changes in v6
  - No change
changes in v5
  - No change
changes in v4
  - Removed reference to onsemi in Kconfig files
changes in v3
  - Moved oa_tc6.c to its own, oa_tc6 directory under ethernet.
  - First patch
---
 MAINTAINERS                                             |  2 +-
 drivers/net/ethernet/Kconfig                            | 12 +-----------
 drivers/net/ethernet/Makefile                           |  2 +-
 drivers/net/ethernet/oa_tc6/Kconfig                     | 15 +++++++++++++++
 drivers/net/ethernet/oa_tc6/Makefile                    |  7 +++++++
 drivers/net/ethernet/{oa_tc6.c => oa_tc6/oa_tc6_main.c} |  0
 6 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 679b3b9565a1..ccc9dbf67731 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21063,7 +21063,7 @@ M:	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/networking/oa-tc6-framework.rst
-F:	drivers/net/ethernet/oa_tc6.c
+F:	drivers/net/ethernet/oa_tc6/*
 F:	include/linux/oa_tc6.h
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index c2b0161d0bec..5758e0fbbca5 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -135,6 +135,7 @@ source "drivers/net/ethernet/netronome/Kconfig"
 source "drivers/net/ethernet/8390/Kconfig"
 source "drivers/net/ethernet/nvidia/Kconfig"
 source "drivers/net/ethernet/nxp/Kconfig"
+source "drivers/net/ethernet/oa_tc6/Kconfig"
 source "drivers/net/ethernet/oki-semi/Kconfig"
 
 config ETHOC
@@ -147,17 +148,6 @@ config ETHOC
 	help
 	  Say Y here if you want to use the OpenCores 10/100 Mbps Ethernet MAC.
 
-config OA_TC6
-	tristate "OPEN Alliance TC6 10BASE-T1x MAC-PHY support" if COMPILE_TEST
-	depends on SPI
-	select PHYLIB
-	help
-	  This library implements OPEN Alliance TC6 10BASE-T1x MAC-PHY
-	  Serial Interface protocol for supporting 10BASE-T1x MAC-PHYs.
-
-	  To know the implementation details, refer documentation in
-	  <file:Documentation/networking/oa-tc6-framework.rst>.
-
 source "drivers/net/ethernet/pasemi/Kconfig"
 source "drivers/net/ethernet/pensando/Kconfig"
 source "drivers/net/ethernet/qlogic/Kconfig"
diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index a306dae23bcb..e0e86c249e42 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_NET_VENDOR_NETRONOME) += netronome/
 obj-$(CONFIG_NET_VENDOR_NI) += ni/
 obj-$(CONFIG_NET_VENDOR_NVIDIA) += nvidia/
 obj-$(CONFIG_LPC_ENET) += nxp/
+obj-$(CONFIG_OA_TC6) += oa_tc6/
 obj-$(CONFIG_NET_VENDOR_OKI) += oki-semi/
 obj-$(CONFIG_ETHOC) += ethoc.o
 obj-$(CONFIG_NET_VENDOR_PASEMI) += pasemi/
@@ -105,5 +106,4 @@ obj-$(CONFIG_NET_VENDOR_XILINX) += xilinx/
 obj-$(CONFIG_NET_VENDOR_XIRCOM) += xircom/
 obj-$(CONFIG_NET_VENDOR_SYNOPSYS) += synopsys/
 obj-$(CONFIG_NET_VENDOR_PENSANDO) += pensando/
-obj-$(CONFIG_OA_TC6) += oa_tc6.o
 obj-$(CONFIG_NET_VENDOR_ZTE) += zte/
diff --git a/drivers/net/ethernet/oa_tc6/Kconfig b/drivers/net/ethernet/oa_tc6/Kconfig
new file mode 100644
index 000000000000..ec2787eae4b1
--- /dev/null
+++ b/drivers/net/ethernet/oa_tc6/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# OA TC6 10BASE-T1x MAC-PHY configuration
+#
+
+config OA_TC6
+	tristate "OPEN Alliance TC6 10BASE-T1x MAC-PHY support" if COMPILE_TEST
+	depends on SPI
+	select PHYLIB
+	help
+	  This library implements OPEN Alliance TC6 10BASE-T1x MAC-PHY
+	  Serial Interface protocol for supporting 10BASE-T1x MAC-PHYs.
+
+	  To know the implementation details, refer documentation in
+	  <file:Documentation/networking/oa-tc6-framework.rst>.
diff --git a/drivers/net/ethernet/oa_tc6/Makefile b/drivers/net/ethernet/oa_tc6/Makefile
new file mode 100644
index 000000000000..c51621fae8be
--- /dev/null
+++ b/drivers/net/ethernet/oa_tc6/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for OA TC6 10BASE-T1x MAC-PHY
+#
+
+obj-$(CONFIG_OA_TC6) += oa_tc6.o
+oa_tc6-objs := oa_tc6_main.o
diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
similarity index 100%
rename from drivers/net/ethernet/oa_tc6.c
rename to drivers/net/ethernet/oa_tc6/oa_tc6_main.c

-- 
2.43.0


