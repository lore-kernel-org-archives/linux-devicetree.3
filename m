Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915886;
	b=kguGh+tyf2bUpSLhg6Rzc2YPwbCcBxwdwifmPIofFVdNJBSzEzmG4q/U59KrFoPQG7KV
	 qbK6TY0nqB8Upou9A4V+eLywKo5Bu5pWFLGkvyK9tFPH+R5H0B33FZgeP3eeejWuIBGgi
	 7H9JeMNG283ZL23RqPdFmRDi+Lf7KeLu2qIPO+F7v84hLxPFBiYMuS82L2zO94zX0HCxq
	 LiOxdzPNZMydBK8RfrUZOa5KKHEQNNI5fXrAJRNqskB3cH/Yrq0ltgGCY/D59jKQn4xY9
	 eotaFxXVz4QbNrzFOVtTCNxbKEBjLsfoItzk+I0YRYrUCiHxFxXd1mcxQc7VwFiu0Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
	b=s2Tao59GmoaW/7yHKu4mGw4LjxLUC5uLXajtR+p1/nXnRBtvRiY0tOabgRdoobqSjFUy
	 GmAfgY6BOtSfiXT/pTcinIMgzE3fsTVMlZptCNw/93+Txo0La6dn5Bh1o1fQmgxKu7k01
	 syHhxRfELZFree24lpsRI/4NejkMnDHza9H0Vgvco0C6sEmVTbP2E+KayHT78OrImRiBa
	 UDdOr5QmCVf3nBPUT9EarK2aSfmK/v+TfVgix3QdwXMxS0LH44HUwSicGw9rMIBg8Wjrm
	 zGHeFTLUSnDCHa5uKgZjwQXrpH7AgVER6DCFKoQppPSI0SPKbN5C1P+B01/MaBEoZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F2606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B37F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfed9a887so35720461fa.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915884; x=1795520684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=f7erzHrWDUVlSzQxnWriHFURIiNqowkSJORhhpLcTPt+vtcUeeOIpBgejK4l/YsU0J
         V4lzAkcmDs15Az5xGiXxSV1ceLSnjv1cN917v0Pmiczd1lOVrSNKun7URJ7Pk/f3jm0G
         cpnlKqlANYS3CqQJWmwjM2SRfwj8pc+KWvWifnd7HJLE3oKjETRb2EH5NQcEl5Ne8czV
         73p0nBib/73qaZ5dGTcVm2RLGrYqZG6iRoX//PwN9YJV43QF2uL6N/yA+Dz4QZRiUF4i
         nBQcKtGZ4e8vIJsS7MoT8ABh4KFz3CN6dP1hH3qVCcWyRx13d8LK6lFbYUDkME/+sBxd
         p5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915884; x=1795520684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=BZsUt68FsDP4hf+3yoQB9NPJ2NrcZisLDDiWG0C8SpjPcnckOabVhGFCBG0YGonCge
         AZOuGaJ+t9M2A5y0Ekp+2fsCsOVmSO8Iz0OrNovkM+uN39VgW0ETeuzWnNb7S/jLGxJs
         u0wBdjfJxLLdCtn/h6VZXpV2Wz76HvY1jPpJ6Ny1kfKEcItOesFqptALvXqKJ2dDOZEf
         bUORmorvd1MA9t6kkiO0NNiMcWVQ9Z6jACmP3ZTYinrxJuxTnxbDxB05ydJZpAQhdr9f
         dmruLD3Y9knoAApES63C2pOXUkBc5aksV3HGI+9j8IwoGDyAzqzkbHImiIZ5HA2wJ4JW
         eClg==
X-Forwarded-Encrypted: i=1; AL+hErE0fa6r+Zel1n1YXgNqVFyks1M9mv13Jq7M4jkd1E9FM1vBSI0lVx5HVyrYkt+FqxhD0jGnpTHgOCQ+@vger.kernel.org
X-Gm-Message-State: APuU4Z8GDjsBERKK4gSXRh3Hz/o+YJpCJpzJXwYHEBci8DtSouWuEEi6
	0RHy0LCk9iplEBsUZp97/XG7+AcvFAbhLSiCWU2l0Sj9isi2HsP5gCfb
X-Gm-Gg: AYBFou3DGbABxou3jbloqQtjOW3F/FLmY0Ji7behCXEQXEza3ROhd102OOy65HB0mQo
	J0ZzVpBtGm7DUx3oZ2PIpivtlJ+jxyIMw8rjojkuUQrDMHE1KWHCxKdupp5xg//YKwNCJDg12qp
	HQjdnB9mWxGocqCIN1OcKsVHPh9D+tKkXZWmPw3qxUX8VH78doLhqOjYACVw4kfe51FEHu+8epj
	cxQHGoontTJo/c9OL1x3OOLNOkPdyFm2O5KNOIS6J/+7tqRyLznxR5dRYIe+W7PFmeSthuFVerh
	HTaSwuLYBKo6SO+khGyI0MBy3nWIwgSsyOS7kGj7QbpC9DvO7iTWub7c6+eV3mPFs+IqhmEsRrv
	Gxz62Sk+cSi8ZDU7B1FnvRSZNpiZFk1dL7D1qb9SUILAfLzr2Q7BvxZs0fl8B2WUOr6bWc6mkm4
	Zvx5bRZV+voTG3RmUX20WQfvBpcbzEfBgxWwhF/Cy+p3EhxlTU6Qf8sPGWdY/OQk0X9LY1RUGa0
	ux0rZBEWQ90oSAzNc1t+L8qZ89hkFgLxbwIGdjPzfOvdok38XHUiqLuj3l8WdY27R0BfteaOvR0
	6aFY3ywSdNsG/qxbUzf+dNeHFcHGszAelnvZXRfRSbDoc84=
X-Received: by 2002:a05:651c:2204:b0:3ad:f29c:e89f with SMTP id 38308e7fff4ca-3ae2b4e80e9mr39665131fa.17.1794915883850;
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
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
Subject: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended register write helper
Date: Tue, 17 Nov 2026 14:44:29 +0300
Message-ID: <20261117114432.2794961-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

