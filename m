Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7053EAC8F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924843; cv=none; b=SePcMqNFdkqTjvpL+cldqtpgzq4CoBB0DWCmlSt2DAo/ksGcFfXPhSh8tDr/O+pWmZiouIEsiaD1l3zWAF7XazDO7lQz8NEMZfO6PMPLllB+Rx1oBCFaHxyMfl4uZA/caDffggTlb2Z2jJY1qZTgweM5bBo65mZzGh83cYM+qJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924843; c=relaxed/simple;
	bh=1LnCRgjE5GrtVilnDq6Mw+CJnt8OEZLKDembPlnG1UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjGoX2MgUu0HoWld1+oi5KwesnmwsxE333cben93/40hP84YofeVGl2Bu6KIdO6ODuuFlRtPfM/CzANRH/m1EGupUNq3k+57s0Qwga1QazXrKlWFQ1W4W7P5vRAsLGvu831j5+u4gnP5Qhnv6gKa9AWCb7vAiSllgMbfWtUAuE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrS2rF5r; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrS2rF5r"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1408659a34.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 17:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924841; x=1787529641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=HrS2rF5rGgGKj//WVctl2fbhNdq4klAxYjCwG6ILjiUP0GWlVkM0W2Kl7fyz5qtMWB
         GLlHxSUm9OxuV6hiKcC2wheLO5fTxzPdRuBsR3HpJG6v+ietX4SCRGwMM5M+yPdBcRi0
         wY/zwv1tMq+1Bo3W/gLXevD/sP6xf6EkPYJ3/SDtgdovfMA0z1iduwR6YVz2rfqKOLDq
         SPG/J+W90mg6LhiRsCAK9+jmvAJX4xWkpnotqkeqPJMmTZ4J9N5BvrkLi/0ruAJZuQOV
         EqG08ViGHPe1WfAPpeqWjp8VYx7ltp6IAJSJOR0BTy1FIbEs0GJZCtdrAFFc6uh1s9VG
         jwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924841; x=1787529641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=cUbJJ9zSMMOFQFMD+tishc5JSXwaHVzhLIuUWXHmoUE5xiyEH8Tfo9FzuoDvjVwfQu
         KzB4wFZ1wrCstkmgoNG+zOwMBXfb+uwXZ4z3ZU817cWCZ02zv3XRHK3LGMi8y3nhRCa7
         gbQXk2E/I23NhyGs6mZJ2Mq+sNlJN2WJVKDny5QqLy1N8zaWu/vya+Ud/Sqc6+KLzVmV
         KaVArvMaEc5cM2PKW0aeaRjQVwRc+zSU5qZu7zSa4pGsAfh71laYJhpUWrs4n84+CA3z
         eaa21/eE+L0AeBnki1+1jzelocRudatpGg5nLbal08hhYzCPiHsT7sjN67HatknKyw2j
         ut4Q==
X-Gm-Message-State: AOJu0Yw+QtEV0+6LmguGEQrLNRYcdBf11JPkIPwe8srP5rQFks+zGAHl
	zvuRcwBMB7X5kbEchCm1ca+he+wLdG3ZnoY5YOYdIA9fqzniPHlRrZhK
X-Gm-Gg: AR+sD104pniPz1nRsK8ySeV+o4MvUNxDoYEuy/iQWLh9lB9TAbBi1yjjxYtIUUFXrLQ
	qlTy/LvPIPSypzcxbJIfMBAEm/6eFOg0kFLhfvpgFdWG82oQENbD66TJtBh5PhN6cLKZcqj8bty
	c4oe7wnWnt4/cP8fnVGHv4tkdaDTPcKPNqmogyYMyQvkwv74x+niQ7x1pk1PlF1VhzGEOYQaMUZ
	G4AmzYmpZau2ZhZV/A+XSRhng+m3mvhmKLe1ehs/1UYSr0D1wZKRamUi7uoRTc6Hfl/WyRudXcl
	agaI0U9dfIxda76gT7KL9UunEF/68de21PIyThhomOJJcGcO3KA/WC888+BcgsOVqNhHvleqdIc
	Bap6FEA6frZCNNqMIhB0DL2hHx34aj5tTRK4eirEhftZDm5myWQSBdqPgrwYxCoCnAOBsAyYnlu
	MlaSEM6MR3wtVn61FTtFCiUEja/JwmED8DvpRBpb/Lk3TMcPWfoL8u5WG7s43xNPll3w69qd669
	GGmEOVWkcS9zKeaO3bMXDbH+XV/HFGH3NYzT6xIPNk4YvI4c+xTpGREp4YxNa2TR2lp1ZCOcenP
	GLN3RehkwXWls4SOyUaV4R01V5gOBA0iEGcJDTK6wbJb/agH7Lfh5rRxPJRhEHLauxlWmz+js3G
	/Kx0kPYFTCi5V44MG
X-Received: by 2002:a05:6808:1916:b0:48f:c907:7a40 with SMTP id 5614622812f47-4b241e1499cmr17948145b6e.11.1786924840611;
        Sun, 16 Aug 2026 17:00:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:31 -0600
Subject: [PATCH net-next v2 4/4] net: mdio: release fw_devlink proxies
 after population
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-4-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

fw_devlink creates sync-state-only links from the closest existing
ancestor device to suppliers of child devices which have not been added
yet. It normally drops those proxy links when the ancestor driver
finishes probing.

An MDIO bus is a driverless class device, so successful OF population
never reaches that lifecycle point. Its proxy links can consequently
remain forever and prevent suppliers from receiving sync_state() even
after the real PHY devices have acquired and activated their own links.

Call the driver-core cleanup helper after successful OF MDIO population.
Only sync-state-only links are removed; the real PHY links continue to
enforce dependency and runtime-PM ordering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..49f9b4062cf5 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -229,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		goto unregister;
 
 	if (!scanphys)
-		return 0;
+		goto done;
 
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
@@ -261,6 +261,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		}
 	}
 
+done:
+	device_links_drop_sync_state_only(&mdio->dev);
+
 	return 0;
 
 put_unregister:

-- 
2.53.0

