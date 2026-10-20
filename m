Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489031;
	b=5FrGJLEH3YuRskV+PUFaQ0IMAPQFHMoav9wEQGgIXxnawMdghbHnorOclEOSpy/QWe3G
	 8u/eEjqpLbQnnl7oOAiH1Od+wCfjlkvxs5BoGdNOVIe9KK5hkWlY3KH6gaXZUULt1N3jR
	 lGuksWeY80kzG6E6rPIlGbBEMou9vLwvGxJiA6PKZ4jl+ZL1NozNjhW88fVoU7ONZz8UE
	 5hQPMiFfCjF+4tPlkUKJe8ENDmnhfo5UDHbZwSqJzETlPHIaAnVJjxqukCx07uSxDsco+
	 axp6gbA+E6NWZWbjcGDogsYmUFjAcp5dxKJ61+tkkw15cvwwF3daKIzAtCiSfNa2+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
	b=bZfMADQA03VQtNxQc2Z1Ct0Blm44mIfZ6eO+kYjds5PZ4KnyU5z61VYseEE2v76VLr0p
	 NuMPBsh4L5tuIwTkhYbXF6h+UiK0NS0AZVi/mQNfvH6io4H+irLFGxs0VQt8dlsRtbKBO
	 3bgWf//2I/PV0FnoHg43B0nASI5HpvI6QGUqKaug8NT0LVvx9/Za44qkUR1y1yCkKdgEs
	 6Di6Gg6k7M1SsYvawyERDwWCh4EGXn+2OKA6m+eEl1pqhY2VK8eLmnW8caXg085HBD1Be
	 ooNiBFIsKqf4OlutItWMKdYEjSmnMk9S/AdUf2fexQok6LLLGt0rdRXrcw7i6AppRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DyCaFXpu;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DAB60A2621
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DAB60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DyCaFXpu
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c34bff61551so424564366b.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489029; x=1793093829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
        b=DyCaFXpuNo2qreLvjLkI0Hkp/j0h/KSJhtDB+JWBTwzeVn2JS7TzFqTBLfsmNXVzow
         z+eG5oe6tiG8AS40BoZNrNtLguY5+4hdWB2N8STR8Y3I/yynOI0Oc39K6xKKm2lUgiz0
         WiqWJvYGJhBP+x/Xap1zEN17pfbp2i+N4V2dCCsLM1A+m7WkR3EswTlapSyCaBNrCAzM
         Gs7uLUw8KNYyue1VuvZCjFQGWeBAM/2rc73rQDoPyeOJH9LFNlxnSZu1lF2egSg4KymF
         0MUYQTZsKhWIXDctVbPMPkCxDC8U0RJ/IQeqs7MP8UrIq4Dftt6NA2N2LrELJTwfWgNr
         7U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489029; x=1793093829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
        b=WvNQMCs43ISm+UzRxK1sE4xVO0vOkfMypCyIKfqRLubr3hfV82RWm1JVVHRkD3bFP5
         cMFVVPxlSSi2O+TDP6edB3LCWmJqlBjPfFLgzmSOwYrI4u9tJOvnORYH9WpWtgrCymQr
         MxdA1jQP69fES29proQuoQD077BEDJXasVO0F/RPzm7phiBTUROrcVroCZLJV/eP6YHE
         Es1jhyWMkEKhPwfrJdvaSl0ytz2t6wn1XIWrCoBNGKu9/cZUreIwYzoR2JiD7hydfS27
         EgxzVqEbE5gy9IloGUbaT5WCFmFnz6DXWQofMnCY2gSWzk8n3X9xlziWblHnW3JwdAud
         g6sA==
X-Forwarded-Encrypted: i=1; AKwUvBxRq4hww8WbA9u/OsLmSOQ8JoZM9XTdSWwDum23qrc4j98PmgqKRoMZdrlLrknDW8F4ArsV0Ltln4yP@vger.kernel.org
X-Gm-Message-State: AFq9FYJgnFw5ueaVV2ACdFro/0r1s7K4cEw52n76EqMpUqg5uurlpW/o
	P1JWL5FHFyJ8gX3iKk6j7PatW94nxDphuxecBo1+CcqERUUSFRE4DfcUPONzQ2Dww3k=
X-Gm-Gg: AYBFou2CZaDseXSME2Xhl0moTz/ywoK+8R6i/OZL4r3SYez/sc2s6wKLBHx4jyZ5Rl9
	yXtKvE4J8QtoCVQyXXdzDMONWIY1U4CvZiSWsV0FErl0jKqwmmQUG48lQqf3Oub/RUWo5KuulRI
	QOiigUk1ciSWsHsw/BXbFcp23gdMCHr90Y6TYaQXdyxg1J5oYe1sNxfmRuHP/aq7o8ZKHcCXRhP
	GhzIFMs0FeQAdAwcTiEY+ijSRRJbUDn6cWeLt6a9hP6fYEjO8sTModKqeuYKHw0avQ8/eNXmCfA
	i1KxThCtJ41rBCPUlX0ZnQaPyzE8COyFhmNvXdQqm88H8bq5Nu3CN8iqExz01+OPgTd8Y6xO1pY
	6807zEIs5CYnKaLm2WT27BIGg+vj/9TFYDF3bci4VxUImNKuSO/Pmyw8GM2cnC62LFn1M94hNSD
	P91W4tvgjvM9S29APhrM5FMkiGBNXm7W/guZLg47zD5t0F0KkGYh5Wo31RqXq2a9+JMSy+4utMw
	nxMe78SmTVylBx/GDgvn2yNE6FFf9BHxWHSc0ia/6+POlSj3yc7e/+Yn6ecK9mNsSzQS1SWZbPj
	MejO9mtTkze/4RYc1OUamwjAaAr8Fx2n6/ea0e1ikpxf1w==
X-Received: by 2002:a17:907:96ab:b0:c3e:f39b:2286 with SMTP id a640c23a62f3a-c419699e001mr779531066b.0.1792489028894;
        Tue, 20 Oct 2026 02:37:08 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:08 -0700 (PDT)
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
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 3/5] net: phy: mxl-gpy: release MxL86211C Super Isolate
Date: Tue, 20 Oct 2026 11:35:36 +0200
Message-ID: <20261020093655.344585-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020093655.344585-1-robert.marko@sartura.hr>
References: <20261020093655.344585-1-robert.marko@sartura.hr>
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

The MxL86211C can be strapped into Super Isolate mode, leaving the PHY
halted after reset until software releases it.

Release Super Isolate before gpy_probe() reads the firmware version. Do it
again in config_init, where optional VDDP setup is reapplied after each
hardware reset.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Release Super Isolate during probe before reading the firmware version.
- Reapply the MDIO pad voltage only when a VDDP supply is provided.

Changes in v2:
- Move Super Isolate release from probe to config_init for resets.
- Reapply the MDIO pad voltage before releasing Super Isolate.

 drivers/net/phy/mxl-gpy.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 952272faac1e8..dba0777158b2d 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -114,6 +114,7 @@
 /* Packet Manager Control */
 #define VSPEC1_PM_CTRL		0x0c
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+#define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
@@ -427,6 +428,30 @@ static void mxl86211c_disable_vddp(void *data)
 	regulator_disable(data);
 }
 
+static int mxl86211c_release_super_isolate(struct phy_device *phydev)
+{
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			      VSPEC1_PM_CTRL_SI, 0);
+}
+
+static int mxl86211c_config_init(struct phy_device *phydev)
+{
+	struct gpy_priv *priv = phydev->priv;
+	int ret;
+
+	if (priv->vddp) {
+		ret = mxl86211c_configure_mdio_voltage(phydev, priv->vddp);
+		if (ret)
+			return ret;
+	}
+
+	ret = mxl86211c_release_super_isolate(phydev);
+	if (ret)
+		return ret;
+
+	return gpy21x_config_init(phydev);
+}
+
 static int mxl86211c_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -456,6 +481,10 @@ static int mxl86211c_probe(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = mxl86211c_release_super_isolate(phydev);
+	if (ret)
+		return ret;
+
 	ret = gpy_probe(phydev);
 	if (ret)
 		return ret;
@@ -1481,7 +1510,7 @@ static struct phy_driver gpy_drivers[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_MXL86211C),
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
-		.config_init	= gpy21x_config_init,
+		.config_init	= mxl86211c_config_init,
 		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
-- 
2.56.0

