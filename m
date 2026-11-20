Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134367;
	b=o41X7nzRN9yH8yGs1vsdfjT1FDsoQFU+YgVgLfpkwDi4o99iRE4iUjvilpRlcRNBX9mg
	 iL0QBK5ZP3qXDSqOI9bw1OjgIp7nF2himA2cY56+AHCzQe5H/YE1OhlYULmj4ModFnU15
	 9fR814THMfzL2AGOgk6ARmMXVUlFA1rXQ6dd4u7c2Wf2GbvsgnP67XsjmEl/2kyDxUead
	 0N+BpMVDjPnmSMFTa5uVQgV0dRdd6ga4OH2i40Cy66Yc7vDvawieSc51jEwGyW0k7X8Od
	 +c+tGFRqkLqKbblHExL1uVHA81G0m5cZm2jvouGIskPIuRCV7BOL7FZnimrYJPzN8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
	b=GltAMZkqUgyCZaPKncsWJr8/N4SGeZgjK5ZAIedprDVUTvAB5zJ8aoMzxkOPWaUhlDch
	 uoOzKjc2HRtm94yjGY66y1M2DchFh7gmYmEPA5CDWbK74nPz40jO39qgzri+m6aPhjaDe
	 AduITGcqajmG272OWSjGi0rgBmPOmo6O1kaz8eOFCvddjOp6YQmtNNQCVhYeocdgRKLAp
	 MPs4ko0X2mkIxOlEDNkTxY0Kj1qQCFQcjrjFLFUlHDSjv7Qy6r+jQ6C2wbY/MrxDTniDl
	 2/qBZf9QPBdWFgXZoBhjj6ssa95U73K5posY5geAPJdGNgvGz9ZXNPbsCFlqLX916RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ynGr2/jj";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA360A5BC1
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DA360A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynGr2/jj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so136412f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134366; x=1795739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=ynGr2/jjGvoygXvXFNlSTPy6/BfBHtbxkLB8nGPePDpf8NGTR4/XrExa5L6riIzk6N
         Ck9tqLfWuq6fPCdnq0FRtE9vtjkW03EnukN8Ksa4WUiElgekYni5oOvMC5AH55Sk9aiH
         BvHoLlQ/BMg7VI2oOWFrfSs1C+itSKHzhzY4S6D5KeBcs5lc/Ik3+hz3ILzx2DfaA7Wu
         31PGmj2zIqs5q01lCdKvzTA6qTN9ctAwim1TncMIsQ0QkiwoexTBAsVyQRITZwDGF2Tc
         uwvqYYrhi1NpvpxQxCSnk+hKEbZi0GoZUE/V4ReWeyjGsdjyA8OZIBVW2m8IAxyhnPJb
         uBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134366; x=1795739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI6hDKEdd7CojdDlPStEWGoyBGjpHRYFuAflASYV8E=;
        b=LyBc8/j3uVu75SRhx0429ed726cNKPEUaoX+71+ulNAk8+EBYUMOB/Jyp62gviHWE3
         xM6u3kxV4WgTDiVLD0deDw/pPUmDakRyaVvEGx9t7kKkdD9OfvMFDVuVWCKjV1TTdS2Z
         p/cAMWI5GWhaWedyo9FYUcqKzGse1pUYPsnVNNqMZM/kNq06MHwrd+hMcrJFUhJ7fF/V
         L2pmUpcJXplSIAYp+wKVDLXIGdqrur5/SOEd81kFjZcL9N8N7QuaniXQooZMYCkcoUa7
         B3z/8RST1PYX7686ufgt1+IWmwUSB80Amfxi6vn4eI49yJWhmzV9/bbm5PcEVAi2kKmy
         KdNA==
X-Forwarded-Encrypted: i=1; AL+hErEJS0ZB6fC4/S/ZZeRABthWQ8OSvCDtnVv7sp12SsOu+NKboFRUqTJsSe5lo7/CUeyKX4JDijXfHWal@vger.kernel.org
X-Gm-Message-State: APuU4Z/w8pz+gxmXjnBb3kYLOM3y5vaOiLACI2+ZckQ84D8ZqNyTkn5/
	uxfMhp3qDJ8iE3G2hEmtcxEu6y0corjIj2h96Z2pFSQINHU6Ikx/aHHh
X-Gm-Gg: AZFdTZeGdW3wCk/fpfUxKw+JdAVusj1v7bYvnYXv/pSE4X3yMwfiSBlqiD8Udy+o55h
	zNUW2YgmBgBw7LXCwQjbS2nfrH3sJK2Y5A6Ff0InlnYrneP0VhH075hkvOoF6Udd0Bno2ti33lc
	EfNv+l5/XrWMSwosVXDH6WYuLmuT5bYxuMiz+fmLHA/1vks9LRdLMLwuEI/qz9CEdJLc8JvR96u
	KayUVBd8tm8SOxV48STKEFIWjTrpoKl6fxTprwtmKSkiGYP6o+3D+pyTA+//OW9ujvCPjv/+Qjm
	sJDMhtWy5YPjAWAWyd0LvgkA4B+UNfo38auexQgjjVv6njUS9TOUwzXmRDdP+7WiOUeHRAkDBxU
	hKfoyOxpfbtQ2ZnhwYyfLX40gdWNCPbE8WzWqNHP4MZQt6CicEPKesw3sg6jpf5BBAGAGhp4BqA
	Yx+LLtv+urXn2uWDRIqcauzx8QNhcMxQhvtgrT108/gcwp85BK7FFpCnYXDXWkOks2MPZtk3ZhR
	8P0A9JScq6ruNl/YqQjEhfI/l6epqyoYx5zzblToXdsXVNTePzs29kMER0caY2ktTKE7SL75J0y
	V22pz8aJlwdgcBEZNaBTXxfC3dM2r7/9JjNnWnKCMr+nE9fNFgZleIJqP63WHzmdbb8s+c9rYNW
	fo/KGelWHs6dUYM8s1IlAidXJihX1nUxkz4jKKRMzQD7kHtCMZaX2mcLo1iDVJQ5RxzmOeCzz
X-Received: by 2002:a05:6000:310a:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4abb5eabd3dmr2184216f8f.53.1795134365379;
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Fri, 20 Nov 2026 00:25:22 +0000
Message-ID: <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional reset control to the RZN1 A5PSW driver.
Obtain the reset line using
devm_reset_control_get_optional_exclusive_deasserted() during probe
to ensure that the Ethernet switch (ETHSW) block is properly released
from reset before initialization.

This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
SoCs, where the ETHSW IP block is connected to a dedicated reset line
that must be controlled by software.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tags
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 0e4bbf34ec27..669dc584e6f7 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1212,6 +1213,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1249,6 +1251,12 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
-- 
2.56.1

