Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567956;
	b=YfmYXgbtnmaVXrsAL0aLmgWlA4X5WEBA0MjJFsTqQSmXWjR0p4BRpEJUHVkiuAsWXf6q
	 Wbkwdy9ZvI2svbD3tgxsLjfsETqP2r3PN1kgk81ppzWfNx3c59Dn6w2qWrXJghZhHYra3
	 tJmcmadoFR11awlM+Rgh0rMb7mW1Cqn8ympt2QgNTGEM62dKdIseW0U8E50K4uSd+rWUh
	 uTgbxlGw/8PPNeHnY9VDhGMzLz8UdqUnaPxHPTLhzvr2YOtXKZYK8C4DhjOO9VvdSXdkx
	 6TvUBHePUe9ObtirZT1FCTCcJ2pqOq2k0qX991T1lwieDCanQ9M9Z3pWDipoAvtEUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
	b=QNP2z2pYnki1ixS4aQ47a27efIF/QDrT5giSd+7e/GwuHxq7Nsa2OB9vHFLTzrDgSwuU
	 3ubfg0YLSOQMEUGjcfd/xtB4WtqJHRwUMT57BTTabph26jFuIbnqjiquPzdzqKVCAq6RG
	 v8TKYjGOv2wpAf2yfEXOrWwqPAKKzFr9hWOoYn9d/ONKhXStf8dtCUeJk8IWIMQmyH6/2
	 esokisurzQzFrP/ib/4oFwWnL7CA+eJZooNYqHuKift69G5KOobf9nwjGRkJtk1eAKLIF
	 UO9jIzrRjHgs4NeuoukBOB729/yDiul4WgP+hV9ZeAMCqIy+pfRca0lZKZEo74MEKXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BE60A2612
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 740BE60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so1197240e87.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567955; x=1795172755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=jo+ONOyCKDe8UX+n1zi00jnNg9W+sqeTQgmGfNxc8ZvZG9lJQrQIxOxdmEH69xpvFc
         qQD2rOGrv2xNeW2DkLhpbBF1D3SgefvWfrLN2fusVXfW3PT7wuHTpbkpbCOQiN1eMTjn
         IoO5c6VmKi/Lw17SHc58MGSL1JJdUWhL7Rn+Z2it220v4DkWlL/96LVdyZCIteof3BfI
         RzAvber7p1RZyS0cuD9zfNr74B0PrH7YWHfrbCfqOFv96Agu8z5yLQyBjXRX2VT++5+6
         mB3glPsueqCs7cQpeu2P1GVFDXTZpTbXXII2NF9gUCP7FwO23Xq4hf42x16FgN7Ke+tI
         Hs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567955; x=1795172755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=q2BTDDiTjrNllnAUFogpT6k8dRndpTHl9X+vkQdMfePklCbNVaCsuwDT7j5SsQmGxJ
         ZjmikSYrmym/kP/wMOWozQOLAkMCMnb84OXrOvu3RudNuRMl//S30JsMQ5Jg65vu/xHq
         pKS4Jxy1B1Z0klA037OHFgwu5DoauKiCY+uAHQN5WW8XK8hsYn9cji7S3HYpGx3JPfHd
         50eX60GgVcrvKx24Xvq92xT9hzJEJFF3q9HhiRWtMyzbSd019GNQ7B0allnqsMGtncYM
         qT9G+tLofKQ/cFCTuUGTmq4SOsj2KRn9oHVl7PFw87EIG/S9X2QeBF2D2Si4T8rmgf5r
         F3Rw==
X-Forwarded-Encrypted: i=1; AL+hErEoXK5a+HYAERGc1+hwzowP1n+zC5JVwfbF8MUkQD0abihXkJ9vG7R9UdzG/CnkeFaeTTAXMg7SpNVE@vger.kernel.org
X-Gm-Message-State: APuU4Z+AnAYqT0Lv3CNohXqdIKF9yb6GedRo/n0D+AsXAyOeZvmT9cY3
	fDXaACGxrh1+aXvZDpbVrfhqXYqWPHCDIRIUB5y88aiP4fWVNBiwn9nN
X-Gm-Gg: AYBFou0L7ZO8Le85GhnW4nIE1DVhISXw0peDW+uC7owUq93Pee3NlYuUlsrUQjAckkD
	cpSLdNHSGS6dRSGDel1ka9H6JJ+KOAlEVGV5RYGpB5H6RwpsYcmvb8iQ785vHL4KQqWXCWlwvFC
	0HD9oKvpWR1/AMIeLqQ9In4uHXZvNY0aL5uWNfKqsW+J9Cz6tWCknO+mQWzlHnWZy9rN8X0vEzY
	T7glC4IlyiL19BGAftVQFDiGS4Se16+oLNvO9GM5TuXU96FUaheP9GuqwD2SurxTL1hU4QgZrQ6
	2ZUhUlOaVnqCFPm/cas3NGY70ZX/pPm0PuNjTlngL9Ar18xelMnA/JRsVa7+Qi+arRacaobZLq+
	0k9LZ8C2X4XU+uZgtZoT0MWtik3hExQVorn7IxfIeUCKvC0ffx6+uVAqZMBLVPYOiBGi2/fZYXh
	qGopV5hZaqG3b+ZTWRjFtn6kkeUujw7swKt1uh5iGV5MUzk/HmoWKMYTbjma9H4wNDkVFB++yel
	UNbUqw3X10uzPLf9K4gsamFLVjavqTlkeH7LV6b0xM8lLdUdLq7wf3anG07HeorH8UlhBwOBiPd
	IA5j+7WgI0hzNrUjV9BtgGNWNBoZcsNxWMb07wD+EyN4nPI=
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id 2adb3069b0e04-5c1709c5b64mr825566e87.39.1794567954595;
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] net: phy: dap8211r: add extended register write helper
Date: Fri, 13 Nov 2026 14:05:44 +0300
Message-ID: <20261113110546.173624-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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
access registers of the phy.

This will be used to write extended registers of the dap8211r.

No functional change.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..4eb50c26397f 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -88,6 +88,32 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ * The caller must hold the MDIO bus lock.
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

