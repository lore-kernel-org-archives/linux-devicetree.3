Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298734EBAF9
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562289; cv=none; b=Ol6rUk6lrGgE0Z3lZ2QtIp/XkcVqjS/NPh73ICjdQn0+/IBm5XFVkgKcO9WLtwM2NG+ebCbpKNxinSzqfRjkfb+dtqgi7KIVnKQjinrTM3efLdI0fXpXKpoKlUXxWdM44XtKyuNr0AlqA9iQUKKwyDfg69Lq/u5Jnlaj9oHUxyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562289; c=relaxed/simple;
	bh=MVsXZuoiXp2XXStNi5GOq+gCp4+6jTB851Kpop8DdDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjaJFEYzIkZ30GfDM4vVdd6J8C+1blo28qzkWIA2KQFyXOGiqUXWmJ8I4/hgiM/LUn+D/9r0NHtnTZ6unoYr7Dt8QrQHNOtXnMWNzJqlPhw3HKiX6QexM++/onOEntDx25VYbneT2a+bM0NC6zbxzz/rtN6caCgIQcCewNyOdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPheuGr9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPheuGr9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so42945e9.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562285; x=1792167085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=sPheuGr9nXRkX2aZRGQuF1LIayut+Sym8mxCw4BF2rK8PBpke7z6OJIxPk+jUUug31
         mlnxxt2+CPj3VNo0RX6zaAFRHK33EhMycXhQEep+N8gSxoZhK5Z99BBwbEoGIQ3ogQAp
         3mGIBz6br4eOK76BO7CW4ILpbRhMFoydwxN0s1FQRtUF8WNB0Y1gdEpZ7i4xcuHqXJjG
         kh21lFfGJvHZo9u612C6cTUZ+r11MWUOKPnIYpE6NGsl3z60NTT0LYYoaln48wKOOOGl
         WXEC0Nyb6AaLZiyjozbcS4AHFfTOd/vCZXaLWFLC88MDeVYwbanxpXdBFhW0FHDqWho2
         eIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562285; x=1792167085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZx5wg1ErozEok9d3MibAXierPMpJi4B3Ch88R20ArI=;
        b=zoxZwpuZmpSAFLenFbzZhcWrj/OqWSk9v8gsC4QfYZ7TQtnLJmKdKWey7E0K2CLsFP
         bhTGktXxorWrU/rAaCIdC2UqBJAWbjQtew1MIO5vRucPD7xBoi7TWkOUdESrUT88/WLJ
         oynQFVUpIcUutF5SG2wrocIfm8Sj4h2gTPL9ynRm6SMDIWYL17OxEYgz4cmIJp4BlWX6
         DUh6ugp4dZe9AuMQb2LaemNqFJx0Riu/zRzhPG3JZq3sQAJ5ZtjxbyL498fx6ERRKjmY
         UGSEvmuriofdi1PCY/ugFdhThZ8n49DC+ZR0Mk2nUObq1eA+G7DFEkOmqX1CFs3R0Eiz
         7kcw==
X-Forwarded-Encrypted: i=1; AKwUvBxd3uHeDPt+7KwIJHNykw4fCmxaP6ylegFrDWgr2lQladDQHmAX1ngG7yr0jGih//sjphAYTgVsPJUt@vger.kernel.org
X-Gm-Message-State: AFuF++k2j3QDIKRdsv/WNDhpcMs6bgFf11JKU7P6BstwlvsgsNAVLYLA
	+YaFYvsMByxqfXBKlIJGl+kIwGo/OMydNBNJ30i7eiWCOeSwdoluKi7m
X-Gm-Gg: AYBFou1hl6VRoCcCQKGLeQbNJI3PmVX0aa5LV+XtZW0EYUItKaB8uf1MytgQru0Gc5P
	TDO7zxDXM6b2uvtvKh35LBYmxKP4U13nI2yx8hZOxPjkHei6nnNUIKk3ZT5XqLfwTKb4PmAS3yq
	pYLBfDYH3GO3GdYjxRt5f+jMjY9mYuDiCKm4gepEdjYZvPY5Ifw2FqTEUh7scgENDZYAYh0MxXa
	Exr04NW+ionjfWmAUZ+uVUugEzCDT6z/8aTEFE6v2PUrjgsOd+A6lTeoHuBo0UMm54HgEpFxwwB
	spEE7LNMSMax9P7PhjcmFSpm/3eBOQAAVSNKS7jsFykKZcWy34sTFztThIVHNoQK+e6V/Msf7ug
	+rmzxIJoWSTTvTIvUtoatmbvkp6Rw5yuXSGFrNvyNlfyvYA36fF+IENY4TXE/FrpUxI1dS9t+zx
	UVc4Hf26o48VhMjwi3MmWzHYbTpkkDyXxeWzqjqTIy0Ny5VaHoc4ayP1x+FNrZleHt/lzTbzkXb
	AyqmshLeOcuAjTwW6LnZmfpgC6A44SP/zCPSq5/D1MYv75WO4Pqgyz/6smtI6U2XRj8RWKIjYk2
	QFyeoY6Q25qnXsJCkQ==
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr48332405e9.0.1791562285176;
        Fri, 09 Oct 2026 09:11:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v25 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri,  9 Oct 2026 18:10:52 +0200
Message-ID: <20261009161102.38961-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..53dcff93f896 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/mediatek/an8855.c
+F:	drivers/net/dsa/mediatek/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0

