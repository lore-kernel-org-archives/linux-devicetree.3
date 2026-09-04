Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBA3F58D6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548598; cv=none; b=YLAGtd3v0dbGNXCXJa2xCaD0F2GfDP9AjCW17u9fer7M8+3Hm42uE4c0PaORSgN8f1JHYu0opOqjUFiDM9Mio8X8tsZtRG5kHgddUijqE0g2bXpjnCSzerP1z5YGUVHpwcJuEqFDDXyoVFEiOE6JyL8AAHoUUKFoMu4We/XSiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548598; c=relaxed/simple;
	bh=g+9YyrCCqwkQj25pBhc80E3Us3WQgU4LquXHfZWmm68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZZ4UQkBPTshV2tOv5QRhssUDQY/HD2Z2C/nNbUHl0a3Dis8opKtXM1P4sTppWf/FsF+IjV7ppnYhb5o6zVH3V96Tnu7vK8Loi7l8mpliutVxiSN7AyAkrraF7h0BlbI6o0v2hmx9Akp+bGaGjp6qs3/Skagf+mhvWsn7gx0bC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=SFNrcwsI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="SFNrcwsI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso10229755e9.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548590; x=1789153390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj3tsvbtNJDWZnFH5pUKMKwa2zoY5MXACQtNrJLPngI=;
        b=SFNrcwsIy1g7mN+pUwAi1aZAClIb7TZzx20jZyB6X8DR1SoBcTtGPc9dTBqiGx4N47
         92/UGLYM4+sEWDBtLzKuJidIcMBBrc2D/e8QHkgxJpJ+z4agD2Rue8alZ8a1j3eKDErc
         paYRvTzOUIWMAj0Qkvfy7GdhbMeLUPjZFTeMGqKAtS8G2ty7L5tF/VynaEMJI41CzFt9
         Nfvo+7ma0SEAdYZBtGjZ24ZEAeEMpq3mSht1OocPg52EnZFs4tjgQEmA6ofAMNhW454w
         btePYf77B0l2OZhJYgUgQVtE3vMJ2SDq5Hl7XqAIjqZCw+wVcWimsY8WZvUkMIL0XgVr
         qunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548590; x=1789153390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj3tsvbtNJDWZnFH5pUKMKwa2zoY5MXACQtNrJLPngI=;
        b=Yp/FHfXoEaUOOql/JRMC/lAnsFUHUMMXuftHLhODfoVnEhtT+Ay56zCYGTZHZhKaNl
         cZQ0xSKR/ZqOK7svXrUKHgWn9KxRT/08Ck08a3y6VfLmSEpWS8ocQgz2nXdJon49rovg
         2Y4/FKkGDIfi1hIJtH2zJms7VSWRndQbo5IjYCzQRXSE784i4D7FEFAUbI9R/1mLjrOI
         dJjC9an2dMXtpsof9HeNtG5CTZQMAq6sMZV3ijuS9fuk37Be1HVNsyol7TZoQ/KV6Ud6
         KTc6xmRSPDe2a6oYagP2zEsQSGDO8DjxPyrfw4cUwjf/AW4CxCtfAe2r5NwpX+pC9sYh
         nxXA==
X-Forwarded-Encrypted: i=1; AKwUvBwkFuNvM/a/yM4i0+ACqwrLl7U7q8q1J7vP5Yt5Hwlu0CrkN22mh1WIEvbSINBZJ7h/RZeZwucqCn9M@vger.kernel.org
X-Gm-Message-State: AFuF++ksKjlaHQQFbxzvNX9ojBggi3tWhT1e4aDOMvTnY5stfmgvdkOb
	e3IGWsFYMVBekfNVAmzNYgbaL9z8piHl6EI1Czme9TX0HJ20h41q4KZ7M31WqOfVt2E=
X-Gm-Gg: AYBFou3MUjOYPqgcbhLlA3KBeOjHXoX4oHQuIqeipSd/d1z6mpBhk7AkWQghbmT3GPD
	uZ4eCv93pHrkEIlRrRSz70PTWekWti7iWOWubZfbbtfynbi8DyqjFzjYDUjGtyhQMgtu8VZovag
	GElR3jg2aw0W6w1nDnCrvKvBXqjlF3pbBizOGH0csx5fMiL+ZwECCCoGxx6rO1q/HQF+SD78FE4
	dC6fcFi63L+K1URsrbdb7KSk+qBGoq6brsKtjv3mA3J9LKuTjWZV92YfxFW6WbDGVMSGzHDaVDu
	t6c4V35LPPyigoSnhti/1DG1wC0iMRFMfkc4/ah1XzPuhF+fUzTMlcD4z9ChVfAxZkaMvDgcyAL
	PvXH2Dn7+vS2UKb6OPElIO4uGGA7L60hBBopoOZocBpj4UBNMmM8oY5dLuEoLwbojDmhKIvEurC
	I2urwsZy0QrNnYThxu2/3sJN/onR/WFr18wq7TGPE=
X-Received: by 2002:a05:600d:864a:10b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49cfc8960ccmr41262475e9.5.1788548590621;
        Fri, 04 Sep 2026 12:03:10 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:10 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 03/10] net: phy: add mdiodev_lock() and mdiodev_unlock()
Date: Fri,  4 Sep 2026 19:02:57 +0000
Message-ID: <c634c01d84dae0745027c7264b59efac992f12bf.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __mdiodev_* accessors require the caller to hold the MDIO bus
lock, but the wrappers that take it, phy_lock_mdio_bus() and
phy_unlock_mdio_bus(), need a phy_device. A driver bound to a plain
MDIO device has none, and must reach into mdiodev->bus->mdio_lock
itself.

They sit in phy.h beside those wrappers because struct mii_bus is
defined here, not in mdio.h where the accessors live.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 include/linux/phy.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1c..8c10c8ae21b1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2284,6 +2284,16 @@ static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
 
+static inline void mdiodev_lock(struct mdio_device *mdiodev)
+{
+	mutex_lock(&mdiodev->bus->mdio_lock);
+}
+
+static inline void mdiodev_unlock(struct mdio_device *mdiodev)
+{
+	mutex_unlock(&mdiodev->bus->mdio_lock);
+}
+
 void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 	__printf(2, 3);
 char *phy_attached_info_irq(struct phy_device *phydev)
-- 
2.53.0

