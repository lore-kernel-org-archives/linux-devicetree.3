Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867403E556B
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215927; cv=none; b=pDz8E+1ZBYJqPE9IZea6owPLf2g9g9/D6mGIMiA7KsZrGPGlE1KQDfV/QeoCki54BIrjCSn8pXNL1U10FYDMwIuCTMvICzIQdufDataPgP42oxY3MISvAh+1XCHMESfRAG1yzEOPPeSCm2Lk+l1GQHnIkJ1CQ7XCxHuEHxV7qCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215927; c=relaxed/simple;
	bh=77hqLc9J7JNzbmg7AMorhPOB16l5fiuXalMgNBngkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHxdIgYn509diKPk95pMGkLlRzsIg1YhcP/dU81/kpIYiHRfZ6X2MIoKgh3FP1RrsDxowDsZSjhYK6b5+gvxgdzSTbZXjEJDXLC7OZA6Zcl7JR59uCsAhYOOihG4z5ikQ9mj1yMusdqYPvvrcek7Iuzp7mYn3SpI4Vm90T7f6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaDuDKG1; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaDuDKG1"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd613507bd1so78702a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215926; x=1792820726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=kaDuDKG136hNm5tp9UX79/0FF1Mun9gn5tmDLxEe7NWNGc9+4IcOncJ+C/GjIyg04q
         RPCYATQtAX9SbZx/GtS6I9J1cVFL1tJG5A/edKXOhyvhu/Q/kKOS1lWE8CsR5h4nHi4j
         a6n7WQmPTBRijHwci0inGaeNd9wtE4udu5AUzD9JInrxqAl1ntepN2swaLZqEI6m5L7f
         d0HWj/1NhmpCkGj6GwtQJX8w0ciDDVdKRIXHkg8Wv67s6arF3zu4b6MjM6oPjAG1BcxO
         k2IMrIvJVZ2JQFKNjQz/9ppY2BE2t2hiw3xMrWqQqgzSbCnsVblJlAT1Y3hDfZBhynlj
         MeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215926; x=1792820726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=BqEE8Z71vBcJrUg8muS+WAL1OgiKUiDJeI68C9cPzNoX39UyEdZaKxgl53yuS6dOov
         I/ergEZdjbU0wDX+0NdM2Jq8Vs9x6Fi9UMjArPucoNeJcnVdpOOSqA6Z0l09PkGd1dEu
         n31hrl/iCUMx1bvG2I6CVy78oF5gwaOUxt6wvdKDId9wnaxjIrBH8Pg6xSf2sB92qPU7
         6T4//7KCLVafszQ2oenj4aq1DukN22K0l52N6JFD3uXRVmg49DtAe4uajYRC7/wdlLBn
         dqQsOs62GA/JP0jUdbAU0bPa/PzkA+zvmEpgxnJ+tXNDUdVkx97xsoFCQesIIEXM+jMz
         7slg==
X-Forwarded-Encrypted: i=1; AKwUvByzpkV4GUHopIENNGu4jNBkk8svn2ZBhheQnlEy9giAqKoa5TyfFqdICrQC0rzUYI/OTmwzXW8/Rb0Z@vger.kernel.org
X-Gm-Message-State: AFq9FYJuljETTcVLJ05HszkTk5EaNDE+DF1ZdLt5tlNY7en6ltc1iWYN
	ERZCaMlprAFItcVTRGZv9k5atQlUxqk/MnwpQkQ8pPAmZBKY2xksKnAp
X-Gm-Gg: AYBFou1f5H5SBdp1XddxhlFN4v+qmOHtGYYxIfXSKL9z3uJOKydD0w0V/N+Wm8Nfe+Q
	LWjFhhMpJ1g9gwYWY/aKS1zvfWKtjM5IELc+MqjBNUN5WpUXnwnXBdjikSpmDjdqZJ8A9z504Ql
	JwZqqY1f6mydALu8BzCEvNM2dBBkp74qJBXFVlyAECxm34VAVW/ZRnTKFPCDYuvR/owbu4XKvfo
	7sGnoRuK/pI6Y5vQZAurc6QHfQo47QRZMSyGc0NeKkE4aluCjwUtY8WaCwzWhbai2wJC75+Znok
	umyPEZQaJpMvQew5NMcv0m8InJLAhZGcKEJZtbrZ7BJPLY6kG79NhwEcpx7aCuJYLmA4DB1qKry
	GUY/56VtgEaizsMk7s5x5Xh861nUfxtcy50Lo4o46hYMXKD7s7xV1WRPR0gxb20duY4KTXPrwyh
	tMsE0NlXQxCTu8mR4i/GiRLuhUV8ku8TjhXw+vDpJFL8TpnYmrWikw7zpv/2hKJIDbT2uK
X-Received: by 2002:a05:6a00:4146:b0:87d:430:1437 with SMTP id d2e1a72fcca58-8a04be6035cmr1481735b3a.38.1792215925893;
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 17 Oct 2026 13:44:04 +0800
Message-ID: <20261017054406.1828061-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

