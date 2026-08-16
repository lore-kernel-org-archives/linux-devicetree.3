Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691423CB2DC
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909182; cv=none; b=Nzb8GiBadQScI+4cEuh6xWSCt5wT8JwzdzbHfnCv7z4RWVsy7czGNYNMDNlNg/junET+XamE0s09Zt11hOsJlbxLVYa4EowgDdCQfJf93Cv3QwHp1KpDsI42ZC0FSLHX7DqfUfzmyuAuluYSQPEKP/EhWF54gCdLvUMJTTCSOdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909182; c=relaxed/simple;
	bh=3pCFJIQOEu9d96vXOMLd4lwrCzD6ScI84FNbite1h+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1M3qDTN9DSdAiMVQZlbfy+ElRAtUGiG0+KKkdlP0bul/fteaOOPATQOdjfBBmHbHwgORaJa3zrqGVVatuD6PIVjYBXSyfX0qm/zcFa+AJugx9KkStTsDdKXcxPPHnjf6boQPErCSEELHRu+cGwxhMVLmTC/MpUOaMvoIMqrRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2/42HVG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2/42HVG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so3033931a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909180; x=1787513980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZYHIFroVmV+7VlNpb25EE1plVrmMIM2jzBfwjtS3Q8=;
        b=F2/42HVG00p7KPzqIMw+5VUcOh9JIOHYFGQGzE/SLIxmn0lc1By+vRvtvPy58rDtF7
         sPV1Cenu/aNq7HMBgJDlus7sSYXAvBdmhcvYfXrMcMILRamkCWunREcvTNpF0CZmRf1Y
         O6EpCwWiGsrtP04+Yfz5WlBi/4l8J9Ayk0sD5tIR8NFdOFI+kLVbieR8beqg6iLFwQOg
         mbkipcPuoF5q6ykqtO7rClAyZLXY+fOfVGDb7PYq8dPLZtNxWdi9YHigc5YBsIQaC/9E
         5BInzyss/CpRWOj08UGK/0RICyddCc5mL0y6mkwu58e6N0eAxpX4/OsdynJk2M3mrpW0
         gb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909180; x=1787513980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZYHIFroVmV+7VlNpb25EE1plVrmMIM2jzBfwjtS3Q8=;
        b=Gl6ExEFKG1wDXWEvLmgbR4Y7xKNqg9d6ZZnHNCvtmHThvbBwO/UNmF6LgLHnHGwlTr
         IxikNyJgF7LkQWbMh3Yuhw90qw64YCet7Wk39kP9A+gzCKbuQb4wh4/oB0QtbQ6RwAfk
         dD0HdYamM0qxLM53/pEoaYWqDDUr5jqx7JO8hpC5iir4y7gIleNrWv54UA6A3Ot5JRx+
         pJOlJOWiA+RrJDn7r+0LXMEG8M9saJWzCYiXgmspl8sDoD5FyeFm4qU3KuvHNqILwecO
         Yc0FLRwLrRxG5vvF2LaUwWfJB1XZ9rxwds2XV5dBAI9dmj3xGF6oR/ShASxq/5XiZa5M
         v/9w==
X-Forwarded-Encrypted: i=1; AHgh+RrM9vyH4bWFwF6g1wjrp122C2GC6Uq4xFUgEpSZYNBzWD29kIhvH03ez1ajYyEpheNFzjQP3GykQwN0@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2JY13KPNPZudIChnQ5fxmhcLkfRvGG5k5FstmkNbT8JPx2MV
	Sn+R4HMz6JaPqYdWLYIZ/AcuCZ75M13N4wklKcr30ZXgN1PNmx8LAapzLKT83w==
X-Gm-Gg: AR+sD12gQuC4FP7uOx1BBPK0poRa4FJ8WznUR0MlgQG+hCeA+O5vPHt1XeIQeiRKyPG
	mv1wzDrn3VM1cELRwgAzhRUTw64CJiBoI1fZR1m6Jf+WiskqfAVKtUxxPmzG6LA3nwF3xaqAEr8
	WQnAxy+dOnQkfU//X5zc4mpeFJqindghNGP0D8EhJsocz5GB+NbcBQuOqF1HhwrJOFIfBsc0ubd
	zXhAWMDCgn6Gogc1Zt7wj8mThg/xmlmeE/846YIm28CMZTEFuHxSxZUJki86H8g8MYON3miS/0h
	qKKxnpdw5gxIupRLiHl/Cm3Fbwa6mjZTNeCwKbXMZ+E8TtCdVjLA6VcDNdlpEAX2p1IZ+evFxnF
	FOuV9hdTRZxeT96tMVlIE4JZeq07THSWfCVHh+m5rbf3VhSshfse/S5piEYc1qCo2WJdNMnqYsb
	3887+LQFUph8sXhuISHuF1o7fosQ2xB1Z8HMm9/vQtgPGyxGvheuJ8Whg0ciD7mBXvfDLl+Z3aH
	aCpRcP0wE12kC+dTbujr7i4
X-Received: by 2002:a17:90b:1d01:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-3933b09e9e2mr14971429a91.11.1786909179611;
        Sun, 16 Aug 2026 12:39:39 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4cf:1a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e10d9fsm2244065a91.3.2026.08.16.12.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:39:39 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 1/4] net: dsa: motorcomm: Move to subdirectory
Date: Mon, 17 Aug 2026 03:38:56 +0800
Message-ID: <20260816193905.218112-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816193905.218112-1-mmyangfl@gmail.com>
References: <20260816193905.218112-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

yt921x is already the longest single-file DSA driver, so it's time to
split it into parts.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS                                    |  2 +-
 drivers/net/dsa/Kconfig                        | 10 ++--------
 drivers/net/dsa/Makefile                       |  2 +-
 drivers/net/dsa/motorcomm/Kconfig              |  8 ++++++++
 drivers/net/dsa/motorcomm/Makefile             |  3 +++
 drivers/net/dsa/{yt921x.c => motorcomm/chip.c} |  2 +-
 drivers/net/dsa/{yt921x.h => motorcomm/chip.h} |  0
 7 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/Kconfig
 create mode 100644 drivers/net/dsa/motorcomm/Makefile
 rename drivers/net/dsa/{yt921x.c => motorcomm/chip.c} (99%)
 rename drivers/net/dsa/{yt921x.h => motorcomm/chip.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 991460050da7..55cc5ac0e86f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18256,7 +18256,7 @@ M:	David Yang <mmyangfl@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
-F:	drivers/net/dsa/yt921x.*
+F:	drivers/net/dsa/motorcomm/
 F:	net/dsa/tag_yt921x.c
 
 MOXA SMARTIO/INDUSTIO/INTELLIO SERIAL CARD
diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 4ab567c5bbaf..98e9bbe47de7 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -72,6 +72,8 @@ config NET_DSA_MV88E6060
 
 source "drivers/net/dsa/microchip/Kconfig"
 
+source "drivers/net/dsa/motorcomm/Kconfig"
+
 source "drivers/net/dsa/mv88e6xxx/Kconfig"
 
 source "drivers/net/dsa/mxl862xx/Kconfig"
@@ -158,12 +160,4 @@ config NET_DSA_VITESSE_VSC73XX_PLATFORM
 	  This enables support for the Vitesse VSC7385, VSC7388, VSC7395
 	  and VSC7398 SparX integrated ethernet switches, connected over
 	  a CPU-attached address bus and work in memory-mapped I/O mode.
-
-config NET_DSA_YT921X
-	tristate "Motorcomm YT9215 ethernet switch chip support"
-	select NET_DSA_TAG_YT921X
-	select NET_IEEE8021Q_HELPERS if DCB
-	help
-	  This enables support for the Motorcomm YT9215 ethernet switch
-	  chip.
 endmenu
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index d2975badffc0..138225baa4d5 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -14,11 +14,11 @@ obj-$(CONFIG_NET_DSA_SMSC_LAN9303_MDIO) += lan9303_mdio.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX) += vitesse-vsc73xx-core.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM) += vitesse-vsc73xx-platform.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
-obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 obj-y				+= b53/
 obj-y				+= hirschmann/
 obj-y				+= lantiq/
 obj-y				+= microchip/
+obj-y				+= motorcomm/
 obj-y				+= mv88e6xxx/
 obj-y				+= mxl862xx/
 obj-y				+= netc/
diff --git a/drivers/net/dsa/motorcomm/Kconfig b/drivers/net/dsa/motorcomm/Kconfig
new file mode 100644
index 000000000000..1fddd386f866
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: ISC
+config NET_DSA_YT921X
+	tristate "Motorcomm YT9215 ethernet switch chip support"
+	select NET_DSA_TAG_YT921X
+	select NET_IEEE8021Q_HELPERS if DCB
+	help
+	  This enables support for the Motorcomm YT9215 ethernet switch
+	  chip.
diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
new file mode 100644
index 000000000000..afd03be9fa35
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: ISC
+obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
+yt921x-objs := chip.o
diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/motorcomm/chip.c
similarity index 99%
rename from drivers/net/dsa/yt921x.c
rename to drivers/net/dsa/motorcomm/chip.c
index 159b16606f6c..f070732845eb 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -26,7 +26,7 @@
 #include <net/ieee8021q.h>
 #include <net/pkt_cls.h>
 
-#include "yt921x.h"
+#include "chip.h"
 
 struct yt921x_mib_desc {
 	unsigned int size;
diff --git a/drivers/net/dsa/yt921x.h b/drivers/net/dsa/motorcomm/chip.h
similarity index 100%
rename from drivers/net/dsa/yt921x.h
rename to drivers/net/dsa/motorcomm/chip.h
-- 
2.53.0

