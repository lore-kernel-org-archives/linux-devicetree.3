Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558221;
	b=dGUoTj6uOR3PNx6MQgbQwwsY/WU8LDs0hp5cLSkMV1mOwykdw8DhpSZTLfygYLuRBfgE
	 /YEZJwcvXZ69mF6wvSQhyyL8ZwoKpPKMQ5gQtiJH8IZa4yaGJHmE4+ywked+WnfpDcnU9
	 cAJOn/rSz7nyIGRANwywu6BdwVzd7YqBoThbKh8W4zM5MXQKLnKigG2HCjZDs9WAQegfL
	 sAvd0HGKZ3IMJ9ZlD1zqx5M9TnAVdGNIJHG8EVrwssZmKo3448WtigacLkahSd/dDpb1O
	 YcJdw/AfRPxdi80pi4pyRJZBoE2Idco0qJg0j+Z7GMs7TzASzSFj1pUPH5/ZHhKLwyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558221;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6qNPKWRyr+p/SbGnreJQM2Nwac4nJF0qdZWPBZR/gko=;
	b=a8NqLWqeZ9KS8lnmrRskE9CXgM6Hga6GDtYh6pHeZVwK9TFB074OVxn+wTJRRF7EVkU9
	 or0BPPWRzE+wkUkgToUTO51kmRio7SFjeRQsu2DojvqXkoJfE3N4PfLcd1RKKP3jMHMxs
	 ViMfyE5EQ7FrrqBWZ2Etzggje199s/JB2JQ/tpbbqgzV3rXaresB0HjAy2xjq+rfh3rEG
	 c3vVtgrO/kCp3UXkdDfKQjbHKorvT90z/N/T1+HnHu5IkQQ5Aj+qIdVVCcKYNUOcKpX9h
	 ZLBN9xQziww6fYYIrggYdoPO+FeMjb1dCCTLoncMJr7lK3b73uCYW1GaqfH1iAk6cVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Brl5wepV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596B60A2624;
	Tue, 24 Nov 2026 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Brl5wepV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558221;
	b=MV3jrW9yAALQZ3p1VGCKYIS1yNFC9TI444+22c9bj90AyxSQicnDjOpLgj9F3hzDbQiF
	 1FYvvpjV333bAl9KGv9yCdDDGve8t37HlvoWeoKFNZmooDvbCnj/YWC9XtzSK1SCwihF0
	 615my/A8qrVfqpA0ebmPKB2ls2sNHnnyt6+Y0NdXVFKXosHGKcJmIO+FQKfofVXkZOkDG
	 bRW+WMEZchFyvShc4n4XNZfDwVTCopFK+BgtO5oMk+MVXFvB/rA3hnSDVuNUvMckAc6Ow
	 4eD+M/+HaVoHq8KVzSXkAmBaHySWm7GTwk5IEvU+W27xTVplFyfYb0vrPDsQNb+cZxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6qNPKWRyr+p/SbGnreJQM2Nwac4nJF0qdZWPBZR/gko=;
	b=hJ1xo50gZjqjqHR8KJ/YdzGJ5M/CQPXVyK+RZ7cmO2BTN343tUMt/tijb+iiJ78nE932
	 b5JBnYHb1oReC7FZL/vt1MbZdP6W19p972w4yB0kZWA+aDE9cLH6443SN+dQn9GI06oZ1
	 HK29nWDKC6QIe1Alqfw8jzqRdHZUSTaWzuOf6CDu/yEzDiTUQq634EnagwmLW6k7tXT21
	 CcURD+YEgeHKUbcpEFJryoChDsoTz2GWIaRQTKpILTmso/YgzNm7Fye//8HHt96gwFXMp
	 JDKPnwnFX97StnBwIWl3J+dWV+rsA+iw3WQZVJumc9SsYArF9YAcq3myBOgG6J3ePtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D8341F00A03;
	Tue, 24 Nov 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558221;
	bh=6qNPKWRyr+p/SbGnreJQM2Nwac4nJF0qdZWPBZR/gko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Brl5wepVWO7T1uqAbZEwSYlTbjODZzfw0IyHrLmJjeeRo4X6aFckB6ft9JTpr2ECN
	 6D9wOCiPBv01RJLOEu1apNLs+rYTZ6MUdbmePQzw/nD4LGIAakBrlzL1hhAAU7DSEt
	 gCSJXwLkyNQhs/NMIFXm1718baBN+8GdR3NcO9BHLbKWlUH+PwX/iTrgHmyHMnjBb6
	 zToK/xDt7mSOkYYGuT0eQDoX/lpQdSFjzZIlJIq9xE+kCKuxZXy0BOM5Cfw4GBtkgW
	 DbbaE/EbaGxDMuYVoafJ7TKg2ffKfBbkv9bDHzzCtVwfYYb68nrm744i0DlwVW1fHL
	 VtMmFFu8qRIMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8B954CBF1;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:10:00 -0800
Subject: [PATCH net-next v12 12/15] net: phy: Add helper to modify only the
 PHY loopback bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-12-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=3213;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=qV7xFmEYUdRBeaDELW+xZTB76dySkY5uubXFY2kgNgo=;
 b=je32yGTAdeWuvcRUxea7rOuAK9EOFz/eep29Ick+pctsREz9GJ1H4L/q1ECuakmCoIO0tsqOn
 gGkzb+jpUaxDLErRKw1ZWN/YWImzXux0TGjIX0Vcac8pgkzQ7UN/wpq
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add a generic helper function, genphy_loopback_no_speed(), to modify
the loopback bit of the PHY only, without setting the speed. This will
help the PHY drivers, like 10BASE-T1S or any other PHYs that want to
handle the loopback bit only.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - Made the changes to phy core into a separate patch. Previously
    changes were in a patch that also had vendor code changes.
  - Documentation in the comments section is made accurate.
changes in v10
  - No change
changes in v9
  - replaced "fixed_speed" with "no_speed" for the API.
  - Improved the comments to be specific about not setting the
    speed.
changes in v8
  - No code change. Changes were in two different patches.
    Merged into one.
changes in v7
  - No change
changes in v6
  - No change
changes in v5
  - No change
changes in v4
  - Moved the onsemi implementation to a new, genphy API to
    make it vendor agnostic.
changes in v3
  - Added loopback functionality for onsemi's PHY driver
  - First patch
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 include/linux/phy.h          |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..80d93bb43312 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2923,6 +2923,30 @@ int genphy_resume(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(genphy_resume);
 
+/**
+ * genphy_loopback_no_speed - Enable or disable PHY loopback, speed unchanged
+ * @phydev: The phy_device struct
+ * @enable: Flag to enable or disable the PHY level loopback.
+ * @speed: Speed setting. Not supported: -EOPNOTSUPP is returned if it is
+ *         non-zero when enabling loopback. Ignored when disabling.
+ *
+ * Description: Only BMCR_LOOPBACK is modified. It fails with -EOPNOTSUPP if
+ * @speed is non-zero when enabling loopback, or with the error from the
+ * BMCR access.
+ *
+ * Returns: 0 if successful, negative error code on failure.
+ */
+int genphy_loopback_no_speed(struct phy_device *phydev, bool enable,
+			     int speed)
+{
+	if (enable && speed)
+		return -EOPNOTSUPP;
+
+	return phy_modify(phydev, MII_BMCR, BMCR_LOOPBACK,
+			  enable ? BMCR_LOOPBACK : 0);
+}
+EXPORT_SYMBOL(genphy_loopback_no_speed);
+
 int genphy_loopback(struct phy_device *phydev, bool enable, int speed)
 {
 	if (enable) {
diff --git a/include/linux/phy.h b/include/linux/phy.h
index f1b1ad1dd82f..38a60ad4f68e 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2318,6 +2318,8 @@ int genphy_read_status(struct phy_device *phydev);
 int genphy_read_master_slave(struct phy_device *phydev);
 int genphy_suspend(struct phy_device *phydev);
 int genphy_resume(struct phy_device *phydev);
+int genphy_loopback_no_speed(struct phy_device *phydev, bool enable,
+			     int speed);
 int genphy_loopback(struct phy_device *phydev, bool enable, int speed);
 int genphy_soft_reset(struct phy_device *phydev);
 irqreturn_t genphy_handle_interrupt_no_ack(struct phy_device *phydev);

-- 
2.43.0


