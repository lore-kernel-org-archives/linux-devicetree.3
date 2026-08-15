Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18DD1D63F3
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754922; cv=none; b=sA6EsPIM88hfn1FRM1anKVu3fnpFLUCBWfi0IRXsaLtIrYnAff0lN+yHZTIke2NuBamoxrfuNqCEVoGzhtTdgjp+WWhnTd8tA+f45uqGawThLezF6b6SOqXmmj8Gj6e/rQCdG5SJd93ognH+ulWnivcZMYrWMKriXnxfvp0STC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754922; c=relaxed/simple;
	bh=1LnCRgjE5GrtVilnDq6Mw+CJnt8OEZLKDembPlnG1UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSvI99viecoJCDTE6h5YPvzSl/jeKNt1Eq0KmvCnICzZxMMOwdkb0sXYYT9fAANFR+/1T+5wvO+HdrQns1YKePgoH4rZCsiWLo+6epiUrnOXcJ3JR3LdFrXfIFhFKiNFNWlunLlv6N6QmAcIQ/I7yi+ynRV7+fMQLZO1bOvcYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biDmOmnD; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biDmOmnD"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb34c17b96so1228076a34.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 17:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754919; x=1787359719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=biDmOmnD7DTVdha8hx+DQkfJo+m7eWvL2KNHnqgpVwgSSBQp4dOSCQPg2JstGhupJZ
         jLCmqX9/opdGbGpQ6VCF2jtojZ/XPIw2RT49PkObJiL9A0lkqYMjAF529RapyAHlSqZ8
         CFPOA70KWgu223eIeQaXrx5HR1l/8TVpcv8EALoO3sPJPcLMpZBoUIMN0T48HUpu9jO0
         37RxqNjymsIGuyzmQ4GhjIvh9QQyiWlLLuIOLbRPODyrQNNm5eoUZZIEcR7tWKppgn3M
         HJ7FVSiGMbwbqqfJLxMBSvMWJ5irY8iYLLHZ2um3OC3sHOdTO0A345PHRsZ/cOmm/Ket
         /xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754919; x=1787359719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=SN60fBuLHti8n7FKhg+tuw59gxdflUueAOcgt3LKlz1DgnmXHV3qjiTvkf24Rg9N4G
         qWu82MnRD26RP2aLQxNsnvAwS3pD8yGRHGj6xxpG58WOkFudSqHOzmLRQtTfQQ1Pjxiu
         oH+/i05uYQejfqP8yGg5e1tsmh+VfxlvYeYIfQ/30E9B5f0NSfUo4JHrs9S4H6Sz12QF
         qhbH8ISuisLw+84vcSvXfYix8+EY1RLfzrVUDLaF0YgS/6DYOY8N6oWBDMyhr9yJZsah
         HllyvYdmeYbEsOZ5RgZ+O/ta49BMpmXMt/jqueF3y1m9XSKOukK2ekIhLww3l7SpWAfc
         Tyaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2BO+c999Hg3H6IS40U6shPMiiDIiWG2b79WL7mIwYPvi680+GQh9tfk5ZtX/2ka5tP1MY81J69uNY@vger.kernel.org
X-Gm-Message-State: AOJu0YySJ3k3NmLoXm23uUdmmBIfGrMndr+EeJ8ektTXtLrXDTDQHt3t
	YR3ojgEJe8WWR1LiNzH4kFVY0TvgqJkkj5n04lMYvzBGtfevGPL7BvZt
X-Gm-Gg: AR+sD10QMIgP0dfiQ6dJEJN4OSW1nJZtvWntmTgmkWDzWjQ8MSEGP9XxJLtplqLvr1j
	riKf/a6UZwKHpj6VFceCljhLaQq2vV1cbGK0zcf4WaOcGTQELxkNvoZpu5ooDqyFoAD5Vy+0PVj
	4bquJjFMvMgRQDfiJZRz+WAT0NpfiLw9/sdS6GECScWrfypny2KACj4nMVzmCDX3eH4rBMzEwot
	p7op6z+Znq/uaupq41MgpNa21VZC956M2o3lFvFkyfAe2NCxj+2SoiELv3Y3iUtigmjeDndU9UI
	hAScyqxL9+fKJ2fXk8C0lUrRr97m5PBQiK7/WqjRDUsVraZ24EXMjnlPLCG0U5lwQwUP5afkX2d
	lVnH7bXKqKXLN+YvM7E1WbMtowbE5Ee5iDa1hy8pmFKX6+P+BV8omTCHZM8XrlwlCU8Idrmz5O9
	aQdTjoa1TsOFmne5IXmhJx5sSaPryM23mXYK6fLc5k0F2RGNOeMghq3GWqzItNPLT8RkIHcX9Y7
	h77qa8p8JFCsW4npA9ABmRkU+GmIU0Qz8kj9mTDuLu5FzMOlDiGUl/fyo6TNv/hp/XMmWEyqNh0
	xDUnWvKA0+fn48u1oeKV5fsK85VpYFTywT0TApb+iuyLERLMAD65NUPU4rQWHfb5zuGaf1rnmYd
	Ld4CftIJEY4UHvFZzrw==
X-Received: by 2002:a05:6820:2916:b0:6ac:9729:6710 with SMTP id 006d021491bc7-6b0d6a8e9b9mr8697804eaf.18.1786754919602;
        Fri, 14 Aug 2026 17:48:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Aug 2026 18:46:17 -0600
Subject: [PATCH net-next 3/3] net: mdio: release fw_devlink proxies after
 population
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-3-2319844f057a@gmail.com>
References: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
In-Reply-To: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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

