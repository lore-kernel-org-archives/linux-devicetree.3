Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A24F96DB
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624773; cv=none; b=bItnLriA/VymNZIAZQF6iLGLwThtlnPLaxdy9/Q745k1/EuDla729nJt2uUIKUaaX2KAM+YMoSa5YE3HZm+0Mf9ViO5C0+rDXGROdjGIuxIfeNHgHiCl5qjP2FzdvSGpf/PqHDN18wNZ0Lj3S0/a8r37EVfS5nEQAeCajZt7CRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624773; c=relaxed/simple;
	bh=U8IAY3UtlpNIRXvSA2LyZf04Cj27BjWMLF6IcBxyyPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdut59TjFNcrfhQQ4tEN2HrrhuM2pGB9x5xB38gyqB+I54lvO+CpYyKefjDO9K8lCFJasOPnnY77+98axQyVTWrNX928jzfSR3z57aMRKtPXtSOGcepmrmbJ16zaRT7dxbHEQzN8C4OFPkgn2VzDa32UfWzd9TEC7oYx8g0DfK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJu3Rhz3; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJu3Rhz3"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-488780459e2so3353849f8f.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624770; x=1791229570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=RJu3Rhz3wrQgXMkTnk7ZMtIBMdC8IjytY39vr+9tpj9HdQ5QbzFouqw1QtA2QZKfJC
         5/DU2SyY5ZA08eBT/YTCuwzMdwYeI98feMnDhUOQ/QVAZXnBVgU/kpOqZNmA01lTIqUU
         B63X/BnYLWJjfZQzA6ljW7E7cBt4KF8f5EHl2CB/2yyYLjSEG7cn5j3zYKvx3g5RLZg2
         kTzqOYycv4lTYTuAWKCNViG+9o9CtCyLk/E1sVzt8woHQQ4YH1lNRw7Z29UksmJTEhSd
         xfE6oNSvZC7H/uMC6t+pkq7GFtPHCSnmgTDOMZ6kX4zka28zJgs+HZQ7uypZxuPKqXL3
         xr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624770; x=1791229570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqRtnc/P+rZ8ziC43+o+bBxfq5eQjgc6WRa/25o2wJM=;
        b=qjTNIL4QZ/CcJqSQFJk6UKvIhsH9BjT3W+fARajOwwZfL57HPQLgMMMMMhF0Ykm7ME
         DcWUo6BsS5H5BHEYKUtTP9c2Swbl5x+pjEIIoPDylHQ40WobqMmhM1xNrMyRntizCMiX
         RvqABmJ816DPYHgEstb0KT4S9Cvh+9oTPe4oXmptlA9/f0PKeThNNr/vANj8XQEvztdA
         GfOZoIr5GY/V2pLfBYBMXLHXWQMRtAyRPQoux9p4/e+J5OMb/CrOqkOOiQMS8EaJZppb
         wLS97eNT/+AD96IWgVUQyaetp0SlDBMIWstk/cA5n3m0j7CYuL69Us2ohmVfcaMmZs3G
         53vA==
X-Forwarded-Encrypted: i=1; AKwUvBxQKVtGXNENZLQjrbqkIw0maR2zfDCTw0x8Vf4sRt4Q0SbrQG3p/VlADIqnH2opLK3GcfHwoy89xRUF@vger.kernel.org
X-Gm-Message-State: AFq9FYKCMR6jVcWn1yuUci6yqvqnx0isrrwfGVnjCBUHv97fJwtO+b/N
	ZqIgLrFMx5Q79Xjglprs/e0b2CJP5kRI5CYcfzP8ta5+Gc0x9ec4S96L
X-Gm-Gg: AYBFou3AERjMH6SbGe58Qvefb0wcrNOulgNDJQuJUlJtm5bCrpm9cwXqTVaGYQJxOGz
	K07dlLVcKCbZQKqRbguqEdibm74VAvJUi5KhkVW8PakL0qsAXoWCVsX9dghE2J7HvWgSReXzT4R
	eB30VfDsNJ0xAoTT/tdjLeTmubKlOSjFxGz8FZaxP+48X6CYnvWts+DOPNpKPVKHODS3/+Cjxis
	P4iwaQnQeU7JQjQalvy5HiX41jSnCO8e54AlntiR/l9WAWpQNw+yyy2/ANweV2OcntxpfKerN7A
	9T2tZc0f0so5ikNa3tK+UmjW+/X8shYyAmwPuC6oUukVEYJoAuMfGSG4CgRUUCO8Gqp5nnP738+
	0uEdDmkC1P6VwX7nG1F2YtIlk8m2SdmzXeYzYu8NqD+dTYM4j11Yyi8IUCmz8RcW/tvkLN3+wvg
	GSLWXLTTGEMRxVCWysbTi00Ffm9VMVmOCbblzYpI3+coMZgFjLQNExjL6gQ8433HTG0hqJEg8mz
	pCZww7YIT0dTKS0ZkYjFcNqD9h+1IIMzaehzjbaTYXnaF41MrPz08PC6KZx2nn1
X-Received: by 2002:a05:6000:3110:b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-48871725321mr27594766f8f.15.1790624770026;
        Mon, 28 Sep 2026 12:46:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:46:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
Subject: [PATCH net-next v24 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 28 Sep 2026 21:45:06 +0200
Message-ID: <20260928194511.41878-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
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
index 6de1ff058db6..59e6385b2c50 100644
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

