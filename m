Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659632D7C7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253773; cv=none; b=h8JM+o191MbqjQkY1G7oYzb8yV8lbDCy613UwWGrd8Ym6dBfg+EnF+Z/eY6FL43ffkWHLb1PN+Mo3FQj2sMZPoDP0qKdYlvBoNBWlX0FER7qcINPZD7XFudCbhilAQC2i6pBg5tSDX0S6T4L0ACFuH9H2p1pi131qVmf+Qwp0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253773; c=relaxed/simple;
	bh=DgL5CromPu7wbZamQo6dcKhpSqi5faC4TnVOwOj2opM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b35CXUZPK01APwySqbN0DKpfBOukewI7pe061R9Obd4xZVRxWDb2HPgYRR2LA9LEiVKhMDb0InzSgPWcHOeDvKjWd28v7EQPdoS7wJ5ocu1WlUnO6TjZhO7+EoQ7gWM4GSM9NyQnHR3GHRDmfJ+BLye0Ib5oLHRhJuUAlOmBGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoEvYOAd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoEvYOAd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so36744195e9.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253770; x=1785858570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=VoEvYOAdAfjohnh+ES9gPMPfTCOYAC8x9BnvZv9kn8AFOuFEX4454jyh9nf1VuycN9
         hnYT6xGqbkH2g3RZnykQ5WrkeFOMaqLpnu02rZAcwtU5j+mvLVQSMjTOxaKV97zLO+0L
         YM9zuIyaOc7nr826GV/bvJqPLwVyH2eOeYYe6W/uwjKrD05s+7nn1Ywg69MSSvekTo+4
         KcFushab9BVLSJu6bfQRsfbciG/NdDi2sxOfG1/aBDlaIzibEZFkhC2FGxaJLoq+x8hk
         esdWoG5Tf96di2HvA69I/iZkGpXUyjX/c2NwAHHzTgc901kCBbFTxZY9NUEd5lXiN3Gj
         wrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253770; x=1785858570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=aMEoaNnjSSp59BxH+2EBybgTQFC12/16AgQtX04yJfynvHV6Zcb4xh7kMtN70/uKH5
         64AbRDH5c1or12sZ3nvsDvq10C4bw2c6yxfLSo+2MgzlIW1oZ+oplFv7hky2q9fv3P57
         7SpRbYv6fryQDEMWj7HyAIitbV00WjsQTGVWQj80uTytw+sy7pCBqveghISXJV4x5uNs
         ls7Amaa26zKE2c9dX8Ckuyy5RVCn2vB77wR9/gkLugxxjVsS3blLceCQM+yWsQbUvUmo
         3OKIc3QSJC5wPDwzekepTd33DGmX5OWvSTpjxkRYNUg+xqSDQQEpqeNRYN2j5Zs5vD6U
         Sm2A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3/sFXQT4rfUJuNkm+bIRrqDZW63gqYJDHPTgODVPBJR7oiCrSA0hyN6zlDwrRNrRHQ5J/EWT2V+f7@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvpNzy9oGugis8Da1IT9tFnuoetZKjV+9P1yVkYT9GvuY5Q53
	GEtJx6iwgmY4y5pWvxTNMGq3UwB0HMTjmpLvu1L45PFUGby4Ekbl8h+p
X-Gm-Gg: AR+sD1080bwaFDoedeCkKXCAWxvjaqRaFbqPTbBI6C8iXczQ54/+IhaYASPI6Pk5j1J
	KzZgwqsStF0zYuEWL3kPxUiXMlCwBHPvdzkv3Oud2N/sYOcRlNrbQHeZlbEEjf/aQpemB70CBnG
	6qK256sYdtrOYzwEX+tQdwZhAC2c9aYdEZyrnlQ0p+1s+2xpUcnUAyaSt/fy9jfhFG9qPlMudRW
	/MJeoVmhgxiX8PyOgICz5dpEh2k6nPRVaOe+8e/yN+H1pQms3R9/S/Yf7Vdg9HX8xiiJslwki8l
	QVwWSSn5xPAwAJfgFUYyORTFNxGXoapqp8uJVm6v6DrnH6oP6c06O8na05ClXwCEtx2mraWk/G3
	/qz4yFy914BFwGlmG4w5bYFkBU48zvnJFwzXNsgs1t6If65Bda9mQe8qHemF8B9iNXdvjOT9wto
	zY0XFqwsEJTt5ZZAsheA==
X-Received: by 2002:a05:600c:1c11:b0:495:3a52:cd7e with SMTP id 5b1f17b1804b1-496c657d05fmr34143125e9.25.1785253770337;
        Tue, 28 Jul 2026 08:49:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:29 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v19 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 28 Jul 2026 17:48:34 +0200
Message-ID: <20260728154846.1828945-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
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
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3218abefd0c..b8580ff98b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
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
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0

