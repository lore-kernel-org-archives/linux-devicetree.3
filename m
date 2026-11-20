Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162277;
	b=hEtDQYpQG3vV/rj9/6hbO6EfYL7iysAo9DwwOdxsSljZ0OFAJd4A/QHf2b6U3iZXiT84
	 LLEoI/v9IcS7oUv70WcICOZYeB0YUjq69C8e7W/4yaZbtVYAvM1I5Sgo96mv0xxh+/ZZr
	 6tK+xqlwfYmJO37w0dioFoUtb5DVdK8+h9LE3y5EGmKiH0oNn6wFfmfG0P7RpqiE/0fru
	 XaU886t4o6RlfuojeaTR/k1/MlPoKq4X7+NbX9EbiRjVywGd4StJAx/y5PoW24/IX3P3u
	 k4lQR8HUGc9yz+VGBhkrAvkMnA5dRwoprEdbLg6kw26yyDgQqRT/UfY//qqG+YUa47Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
	b=hjY4fugkr757H2Fwcpi5jK9xcX/jhyv1PB5pikZaJGLU2bm/LJ07+exhCOOHqK6g75Et
	 c5JSEtHynSitzORxGRjotXXb+sKtt6mUMJyoj3b2V5V9e31kH+Yx754v8fqC6FF25cpbd
	 XwJDiIPPI39oUyViOskChpDABD8iPKTHymSEPV667wNEUfR0a4FNWnUodezARl3TrZVpX
	 3FjJQlGQILK99HbpzOE7WkDKC5gtkEHMoF/gymQAem1uIgu0xV8oF9YQ9cekFUq0QBk7x
	 dbRUFfMAbKgxqXhpEf10FGHFT68bF1vueEr723JvEL1OWp5ZSg7CQFqfwr5FaP9mv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9060A2627
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B9060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so728768e87.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162275; x=1795767075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=QlGQhOdbE9NngEZTKzmX/WF1nHcSSb4OcwlQqHAtJIG9zxODsZO2QxDPtdr7iNgg/5
         +8ia7e6qh2p/ytD6nJf8fLUo+VM8LrevnzLN9NtX5Q+wn0tJhdzlozNcicBA6rNM5L9t
         16L1WWAN1Ot62Yc/7Yq1OzRx1Z47FOBaJEtf4we/quHuXyE4zOO1hX2qio8xM9WiuQUG
         oWwgJ/dUxqtloojIbri7GhnUkn1DkImLQ31ed4oep8DhBMY3kznEYn7T3l4bbunkOPET
         b0Yd7bXN2lVP1/9eE4iYNReoLbiy82IZJzIswPPJHQ+4M5tq0RSQlrBCjAgAWAziCJpI
         x6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162275; x=1795767075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=AVk807wPXtnLM2oB5otMqHfUKfwSXJIMXF7BHrLAz5I7oc+Y66mNUu5I7KZpDF94+y
         yQRMhd9aYEcsV4m8vzaQbzZCV4KodCu1X4PFIGMzhnPrJaW2WxlBOA2fiEmHPNEl7S5c
         RRHKsRibeC9NcIFtlTU/fZLRBOSi+yBEyYV8C5T+zV8+CLSnsQeopSbZ1dxHifACHc9G
         rDulSz8lT04EW4jopr3ztJJnbcoVuQbynHBRagjeTDxHnBLKiwSpDBOfwjG7K+PoK6rR
         tLMCtAZuNpeX98EI6JKZ3jkRu42ENZZzoSLwm044Y4GNok0DZiyaH5G25g5c24yLWigq
         4j4w==
X-Forwarded-Encrypted: i=1; AL+hErH2hs7tD/uVaHGxQxZBcExcXkvii1f0okGfZnght0bRF3or29JwIMuQ5QwGYP3gGmh/rxX3rt5v6Bj9@vger.kernel.org
X-Gm-Message-State: APuU4Z+mizFlsLcwepMB1q6LC9A/BpV6PltIQXOhM3t5xyh4osjJZ5BA
	JwSOo5F0mwvWhPowMwOyU7XW9QdHbybl2mrTrpADhp5NgcN4SfSbr1pk
X-Gm-Gg: AZFdTZfswhCayihrrl0EvdXQIsJpDSRKib0vPW8EIWvVIxzf7Igy9stCoESNMp7K9RK
	WOjqjS3sXX9ZtaZF6TdAs73XRDx8CpjMzh1XUgqAhXg6qhQ1xJ9A6iUB+T5f4OGDiN4Ko4ICWdh
	dDp+rr6oKzcewH7ukNSkRUlxGrjIZjRSoTw/Su7Q28m6IHw16H49hzX75YA4u0Oouo68DWXpb9p
	AhELG8JI8+ECwBSAPkDjUsqgf90I78vE3VH0MhYOFkXoj9r/oQl21gkPjOGPsAt5D6jkZtVf/lc
	922aHXT9X3qv2xPo9H0tOBh9PEGHpwG4YYbTfCCSQslSKXcQzHk3rAxpZesULYMTEBlZJCYdPnk
	KMIxAUw/wJdaX6xY0ArtTs2BjnNv5qPjF+fU9qYa3ivkJUKnzbJB6D+z3PdJbn8qKaZdpeO8oUf
	JkgIHg8z3gVZgQCvKgT5i2UuaG2yKiEeNywLFlN9mbBI4phKAJL/QvBDdVj7zQgCL1X9A3q1ldF
	iLvBNm/acFOd3Mofcs0EVU6/4Imx6K74n9LSY9+xgxjqbRbOyWv7I2WRWB/z9bbcmRTSCCo5k4N
	0pxdMqLK3he18UwEscvG/VuQUVsHsfCdVcYHjLvHxsyoFLM=
X-Received: by 2002:a05:6512:3503:b0:5c1:4a42:fb07 with SMTP id 2adb3069b0e04-5c1bc84b95fmr690376e87.64.1795162275265;
        Fri, 20 Nov 2026 00:11:15 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:14 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: phy: dap8211r: add extended register write helper
Date: Fri, 20 Nov 2026 11:11:01 +0300
Message-ID: <20261120081106.2919010-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

