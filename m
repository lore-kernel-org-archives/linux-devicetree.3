Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197118;
	b=a1dYzrN2zccY4ZP08HmU9w79zK+PXRHZ3G7Xf1aS5zneNyfaeqkdlQ/LuXxVyhLkPEiu
	 XKEUs4fDcP/CLE7Z5hcUvsinGOkN0oTm837GcjTWuVKtHUpblkPPlwEMNhDH1gCcSIerl
	 7mN1GHjCqAgAHCcnx+l9zqo2OHOt1ReGC3P1p1fdEl4O0pDtzv9kfcRXarUEm2KmK7Eqp
	 X9/IzQGGDll5+94P7SG5qPv9l9hy3ylJxL7CNykXLVzPNgduHJXPWoGEidWMcAm6Tkjil
	 nj69zZuv3FTbTpRD5JWbL0c1RhSWp1tSw3bx07ihx95CSrtMVW20H88Ar7Xe+tDNnfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
	b=Kkb6QnHs8YNWGg9WljOQqqSaU4nFonkmMboPRIBpKTHfIvMSaNJmaH7DBiIa0xJ6efZX
	 +fpphxWNUbEAWe/aTEcuRVvrrzNRWJTGmTo0Y6xFcWqPkPvkggYDajZFpKFRxwJrLn/7C
	 aTW+O4kreRqJWSTvdz8FLYK+kHxMx2mBmbXvjNtuxUrZ+IGtzSIicvRStTlEYwc3TG2Hh
	 7K3J/BQ58g6yHWrcXK+sKo2G/2i2MCwvE1vApUdp8FIX43Dp29Q7BYwhrC2rpfNCFrKY5
	 UdFz+FxBcrPwsrQU4RJ3PGP4uRENe8lijoDPkxqdiPfYmc1DltHVoT++V0tZblgwd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A4606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 04:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b1535be329so19857a91.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 20:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197117; x=1794801917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=I5gKMrwa19rWO9uB+yyStHKDiGnBXW/aY0L4wNFgNdUPc9Wa0HLrFNtNp7gDLaz8lz
         SUuHx6sALRlnpVJ/D/vnH7eNXbTUmvpD45oBmN1pLC7kIKvPbV5b+OVKcmP+9+opQkOK
         1jBNih8MgTlwHniTr0T+8bAZFkfjKDoPSzNGi6lPX7zre6ntCnsHqfhoQLXSs0qwN3dd
         niotTAQrSz+TSVH0+Px0iWPdOsvp108jwt6v0d9IU1bVTUEVWnf7GOGrC/JzWqDrheGG
         a7f9ayH04ssJ1QTvXRDWU7I6BUXFNJKrmRk+NZkIVKIZaLtijvg7pf7oM/DRYchaWJJY
         z8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197117; x=1794801917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=oYis77jm+x1IlQZI+3D/mOds5nVKH6Ya3WwiFJUJlCu2mgfWHv0oKEFm8kxsuHSQ4/
         MLm7K0Rfg2Cr7ELtleBmKZCbRz4o3Pn1tyZa38xhRcIFD/h1CZGp6G8sr255N3gxIC9M
         Txdm9JtLTJVP38kXJ+x8xLba/zDcSUjIsIR7D72SRWXW90YhgqUti2VSxxxYH8I6z7nc
         vlq3+mzXrE2u9aUSamoc4HMZfO9MZ8rPgNnmTPsyCxdnKKqBiNrmv+pdOO7tFFoxyumq
         2NH2XBFI87XG3FaZ70NXBRfwAe+Gg5NtCns5ZoY/vVoRHXLPCKaq87jVe4YoKpS+ngVv
         dJ8A==
X-Forwarded-Encrypted: i=1; AL+hErHSS+Gs4hOAsmHafzfrr0fT+UeiqZ+0YhDpFRmu5duVVeuN3cQ/OePRL5bk9aNorbLhzDwr23kG/QEp@vger.kernel.org
X-Gm-Message-State: APuU4Z8ns5dX97xRTgSEXu9+/Gidk7uS+JIHkdf1Ixb5IeYZSrb0q/c3
	mXQQrjfRfDQaW3K/U9M6zDfieQdAGAxvGZjfeg09Gqw3mDyCEPpACpww
X-Gm-Gg: AYBFou3BsZ5b4J1r1dw9jr2+1ac6RL0KbdiXCEBXxlCLA+yNnbxmh75LiqRTsDRQGV/
	rtMgW9Tih0F9FUWHZQpKz1m1VBg4K9P/8jI2mzSIBHMB0vN+XWKl4LqGeUYXUuDj3LGYIklR6Jv
	dJiX0Vr2BFspILwGUzyBSDWqkG7gGkAEqwFUP3nGZ6ftcB2NQSH+Lzpt+zD0GHUmXTa6S/C15LG
	YRbu3iYzR5UlteD232c0CiTaLJsrKZKb+wZRrX+Z2yFcoKrhfw5xQIKd4TWPdEbvlZ26vdrR6dL
	1+bVi8WvMUdSNjjUnMj1vuDvjoHrR+1SXKJLGpeTxbovPIlezcsGb9yXpfVg8MoWjbuYOdn41y6
	WRsQFTKRK9Fsiq7hyP6s6ysXC4x9QGTwNadc/Ge6g2AITv4RpiiY9DLbjx0U4U9eDQrlmrWw7ZO
	tr7h7VI/oHPdJRqRAUWxUtJmWY9U59Btl4c0SsJrAoBpZ1bPdb8/GQnedI5PDLzhq9dYugaYCwn
	9SW+PK9Stt8v12nbkSMJI3+b/qgtH+EgshzTyw6eHDg+BqshNk31uDzd2dgwvOOKl95mVUe7Eed
	iHBHqG8dbikLd8Bq1nVjRAyT6smdygXMmHIHN7W8/TAMzONfVTiYsDDXcoJ1eLRIzevH4NMj4+H
	7yPogA+ImPk9Nt1z2zBez7Xfejj6lrJgUH7wH0wAwSMx1PVPNWHox3Lj/U3oF1JHJGb+SNsK5Qq
	v09tRTHS/PhEr0zD53FGQGm+M=
X-Received: by 2002:a17:90a:fc4d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b12d444739mr2752350a91.11.1794197116640;
        Sun, 08 Nov 2026 20:05:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] phy: ath79-usb: support the analog reset
Date: Sun,  8 Nov 2026 20:04:51 -0800
Message-ID: <20261109040451.114135-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
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

From AR934x on, the analog part of the USB PHY has its own reset. The
old platform code released it after the PHY reset on AR934x, and left
it to the bootloader on QCA955x.

Take it as an optional "phy-analog" reset, release it after the PHY one
when powering on, and assert it first when powering off. This is the
reset handling OpenWrt has used on its AR934x, QCA955x and QCA956x
boards.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 33 +++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 8e9565846b2f..1e7868fc0b5f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -12,6 +12,7 @@
 
 struct ath79_usb_phy {
 	struct reset_control *reset;
+	struct reset_control *analog_reset;
 	/* The suspend override logic is inverted, hence the no prefix
 	 * to make the code a bit easier to understand.
 	 */
@@ -30,7 +31,19 @@ static int ath79_usb_phy_power_on(struct phy *phy)
 	}
 
 	err = reset_control_deassert(priv->reset);
-	if (err && priv->no_suspend_override)
+	if (err)
+		goto err_suspend_override;
+
+	err = reset_control_deassert(priv->analog_reset);
+	if (err) {
+		reset_control_assert(priv->reset);
+		goto err_suspend_override;
+	}
+
+	return 0;
+
+err_suspend_override:
+	if (priv->no_suspend_override)
 		reset_control_deassert(priv->no_suspend_override);
 
 	return err;
@@ -41,14 +54,22 @@ static int ath79_usb_phy_power_off(struct phy *phy)
 	struct ath79_usb_phy *priv = phy_get_drvdata(phy);
 	int err = 0;
 
-	err = reset_control_assert(priv->reset);
+	err = reset_control_assert(priv->analog_reset);
 	if (err)
 		return err;
 
+	err = reset_control_assert(priv->reset);
+	if (err) {
+		reset_control_deassert(priv->analog_reset);
+		return err;
+	}
+
 	if (priv->no_suspend_override) {
 		err = reset_control_deassert(priv->no_suspend_override);
-		if (err)
+		if (err) {
 			reset_control_deassert(priv->reset);
+			reset_control_deassert(priv->analog_reset);
+		}
 	}
 
 	return err;
@@ -78,6 +99,12 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
+	/* AR934x and later also hold the analog part in reset */
+	priv->analog_reset = devm_reset_control_get_optional(&pdev->dev,
+							     "phy-analog");
+	if (IS_ERR(priv->analog_reset))
+		return PTR_ERR(priv->analog_reset);
+
 	phy = devm_phy_create(&pdev->dev, NULL, &ath79_usb_phy_ops);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
-- 
2.56.0

