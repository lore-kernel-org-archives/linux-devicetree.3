Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FB448BB7
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149650; cv=none; b=q+JjeI44d/wvalUZlljVsxEDkIL+EV9ZzIiHgSkyVnsExQL5zuEmvbWfg4a6jcGefdakRH70akzsZe/NXDLL886LwdCuXVA/JwmVrK82piZZu+6ZdlyIAUuYFLifnIHuwUXzVGF01gn/flpdaBJePp3v9dTqUXwydM2T5HfhWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149650; c=relaxed/simple;
	bh=tmWFUe4O5IyO+8CbBVqEmkvkD5jfEE2Ew7bX38+bRZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJSTIke/A1NM8vEifLDaegmEw/UCzT5aLnY0/bDw67Kul79n7ay5Do2MQBMIGyqeFjcKs2SFzmaMuidezlhC7c4imAXJgvZFep31Q2Km2lZhx63d+/4HRBax0v3s9F5zufCXzlM8Dz4B7zo0ckOup9729KFdmChp04oe4P+TTuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lUCuhSfi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lUCuhSfi"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e8c710847so790588066b.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149646; x=1792754446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzZ+drt3dgf4DTiJO8FECQLY/kCD4mxzJHRqbEltdUk=;
        b=lUCuhSfietg2C8LyHurFBaVzhMwIbAYzKaSOx2g6NH0Yy2Tj+BBfsKT+jatlkONlhl
         /ieXeipWVY7GM/xQ3GJW/q6ZbQmAZOdY843Dek4dXJU+Zowb3ecANaT/NYNQo1HBO9eg
         rgXnfIlFE/mqi8zagoeEdiVj34uXLGT2Fi8ql4JdB7e0wGo5O61ASBBvjXRJ5E7vjRxT
         2/MsmBAI3x2mlaBACDVOaCXVIVD384gmIWWgyc9ZcUtg5KYRCsjkTBC8JxD7MmENRc6i
         YH1mTK0ia8TpYj91BAxJbwevjQIHbnTG6k2HSUf3bHvzyHweTrAeubaIgJ8bkDC7yDid
         7cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149646; x=1792754446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzZ+drt3dgf4DTiJO8FECQLY/kCD4mxzJHRqbEltdUk=;
        b=vZSt2FmYviqWtzEPnbeSLiBIOcelwdvvspuOXi30h5H+u9IetzEvdrReidt0IHNWrd
         J4Hb4NThirsBzKO5+DNold6LRmQJRuDPKFCY/vR07BnrLCAS4uPuObWdNZsaQcQHYyqy
         DksOzTwODNsaA26Gi32P1v6iFWFoGQGnqM2Sg9pfmrLbb2jKrMOKXE6Hu3nBzWkQKpzQ
         rKp1SxPx3JMQ1MvwrW2jMdohGl3eStGKrBshWQmKXgVpCyL+KufpZmdNK6bnO5nvFEFl
         k8s9FlV8KD3ja2rqyONDX/pm1WWMQuHsLT9s5PVDixX7PAdl3jJ4iQpRMHV6LoFi3GNo
         7smw==
X-Forwarded-Encrypted: i=1; AKwUvBwBCopHa2/sm/PqDqaAGliNddH+x5I/3n0y7pRu0VeM3IjCCh4+97Wwi+q55wR+2yvEsY3dI5TKZCFa@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9dpz7WxKNY48tdM0GJ3PWnq9k+0u26e8ntQlIhTj0IGKwO2yF
	f6FZT1fFe1l268cfSUfHVUUMS+J2Udcs3kK7cJIPTC/ELQke1I2Fo1qZcK+qLhwGOuI=
X-Gm-Gg: AYBFou0ZvytGAqv2TIQFJ295zb6Ee1daaqvDU76edxZlxBMy4BiwUEeVhZE0D8oIK+V
	FDJnshD+yyIPWnnKTMwajlSe9Xoo4nZl0CJ58GrucNvIN1ig/0X8Nrl0KVMaXYINTvObCH1zkh9
	fmARPIZjimR8NqxoSA006slrkH0bYGFekmR5KGNsQ3GYXSRmPXkvkyJUSyYJGP3fn2AXUKmA544
	Id1dT7iIt+bRNOxtz2tbBexD17BSuaU5CuXOZ74BvdXEeyRn95cWIq9qx1K1w4YApUjPhvRNVaw
	80PY/dNdn0DIZiAM27Ncr/gJPhvJG+KcOF6fEwA2A/qH0gaM1zoPKebiYkkR/847PHF0OgngNw8
	PWwb3HQQNdbrBJXlhy/30EiFw+HGUogpciLGcqvpGDd9R/tzF0aaY3bJl9iovahWyk1huajMIi6
	DJgmoflPYmBF12In9GJ2ddD3MbHZDqr1EKacmigPSl0N2+vfrYmQxbpOV6mPIr0Rcxa4Wxhz0CC
	bBAF1g095bAmerzAv1gnvAqXEQ27fmsPL7bUOp9KTorJRRHF31snYI9podBSDLBJW7uO0mj2Bzi
	pB3NXJGeXG9LUsQn03MXUaCTnqc7
X-Received: by 2002:a17:907:3ea0:b0:c3f:98d4:dfd0 with SMTP id a640c23a62f3a-c3f98d4e648mr377283866b.45.1792149645861;
        Fri, 16 Oct 2026 04:20:45 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:45 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 2/5] net: phy: mxl-gpy: add MxL86211C VDDP supply
Date: Fri, 16 Oct 2026 13:19:33 +0200
Message-ID: <20261016112033.949026-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read the VDDP supply voltage and configure the MxL86211C MDIO, MDC,
and MDINT pads for the matching 1.8 V or 3.3 V level.

Keep the shared GPY driver buildable without regulator support; only
the MxL86211C probe requires the supply.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Replace the MDIO regulator provider with a VDDP supply consumer.
- Set the pad voltage from the supply's reported voltage.
- Keep the shared driver buildable with CONFIG_REGULATOR=n.

 drivers/net/phy/mxl-gpy.c | 63 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 089a1a9e5bc61..fbac7c49b4759 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -14,6 +14,7 @@
 #include <linux/polynomial.h>
 #include <linux/property.h>
 #include <linux/netdevice.h>
+#include <linux/regulator/consumer.h>
 
 /* PHY ID */
 #define PHY_ID_GPYx15B_MASK	0xFFFFFFFC
@@ -110,6 +111,10 @@
 #define VSPEC1_SGMII_ANEN_ANRS	(VSPEC1_SGMII_CTRL_ANEN | \
 				 VSPEC1_SGMII_CTRL_ANRS)
 
+/* Packet Manager Control */
+#define VSPEC1_PM_CTRL		0x0c
+#define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
 #define VSPEC1_TEMP_STA_DATA	GENMASK(9, 0)
@@ -140,6 +145,7 @@ struct gpy_priv {
 	u8 fw_minor;
 	u32 wolopts;
 	u64 rx_errors;
+	struct regulator *vddp;
 
 	/* It takes 3 seconds to fully switch out of loopback mode before
 	 * it can safely re-enter loopback mode. Record the time when
@@ -390,6 +396,61 @@ static int gpy_probe(struct phy_device *phydev)
 	return 0;
 }
 
+static int mxl86211c_configure_mdio_voltage(struct phy_device *phydev,
+					    struct regulator *vddp)
+{
+	int voltage;
+	int val;
+
+	voltage = regulator_get_voltage(vddp);
+	if (voltage < 0)
+		return voltage;
+
+	switch (voltage) {
+	case 1800000:
+		val = VSPEC1_PM_CTRL_MDIO_VOL;
+		break;
+	case 3300000:
+		val = 0;
+		break;
+	default:
+		phydev_err(phydev, "unsupported VDDP voltage: %d\n", voltage);
+		return -EINVAL;
+	}
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			      VSPEC1_PM_CTRL_MDIO_VOL, val);
+}
+
+static int mxl86211c_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct gpy_priv *priv;
+	struct regulator *vddp;
+	int ret;
+
+	vddp = devm_regulator_get(dev, "vddp");
+	if (IS_ERR(vddp))
+		return dev_err_probe(dev, PTR_ERR(vddp),
+				     "failed to get VDDP supply\n");
+	if (!vddp)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "VDDP supply requires regulator support\n");
+
+	ret = mxl86211c_configure_mdio_voltage(phydev, vddp);
+	if (ret)
+		return ret;
+
+	ret = gpy_probe(phydev);
+	if (ret)
+		return ret;
+
+	priv = phydev->priv;
+	priv->vddp = vddp;
+
+	return 0;
+}
+
 static bool gpy_sgmii_need_reaneg(struct phy_device *phydev)
 {
 	struct gpy_priv *priv = phydev->priv;
@@ -1406,7 +1467,7 @@ static struct phy_driver gpy_drivers[] = {
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
 		.config_init	= gpy21x_config_init,
-		.probe		= gpy_probe,
+		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
 		.suspend	= genphy_suspend,
-- 
2.56.0

