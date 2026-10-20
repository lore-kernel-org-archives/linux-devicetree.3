Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489033;
	b=LjOkgkgUKiblpKqk7LEyrOPCv38trYDcp6NwFXjOfl0QRIVKeEPvuD7gbdVTNFawKTKr
	 fP8owUWo0ACizRItemX63s+ZN6aC0lJbjfreOjjGI7gCZahGpWyrSgOlBF6UQzEn2h5ja
	 oIQrM265Fz0TwSGPMJNJ8BKUBBho5PB2R6p5bvsRqqzC4pqbo55jgpYq+5WJP3MzI03M7
	 ZDn0l6/g8gwTMwO6MfWpO4TE3M/lz2gHYEGee9PukEDoGb25cqtRkP/nsju3TU7ev6CGY
	 wsWrR0Z6uis3GDhE2jbLb580qzxYMM1nLXIhAuUaBqDXvZpYW4YXXv0xS17KFcj09eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
	b=4x8A4vwymgQGEysy2LBfvpM362RtTFn9TFGVZXleCqxjsX9E18njlRdesdiyeEJhw1PN
	 T8fOpREeDw/jvB1UNiXdaW520upqW7y37umU3YIEylSoHE2FEqbzcMPdB5KYfflHsBSkS
	 oAoJIlFTyCK6HRcAO5uYJGcvV2HtPDyNKcECq9mdud0JMrrRzyPFhehAoqKgZ02KR5AqT
	 DtH3fv9kWfTOPpnXqOsnFusrpTFdHwvrGZKfKP8aSyVwXzNpp/z5CbwV6+RM9co+oOBs8
	 ytB6g1vOKEnZdOS84eBt3JyWk3snHGPhm9SlW0oc+dtdNkLdZP8HTYvoUzngcTxyl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=TW+HT7R+;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978C60A3816
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6978C60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=TW+HT7R+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so161164366b.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489032; x=1793093832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
        b=TW+HT7R+qM7cFRyny5S8cDwqPmlT4Uy/idOozwPOQ2+ChYoRRRlkqnKvkC+3jJDtf0
         SpNuTxuDQRdJx3PSMTmdYVbYW8zisypHmjYUAtoUthNA84NcBfJUISbj/XUlwQswaQ1L
         TF768m67jp8robOaElgrMeX8XnxgW+c6sDB4+fVXGnDCW+GtjQpLS26tT5Oa2xhushng
         L8trduE8/3ajP5I5daEPkpXz7iwqbU/5MF+Gza8mUquT8S/lG2RIxWWUNxzCLh9+U5fc
         USj+fZB6LlgsHTJWHG5p+b+sJExP3gYMbCT0UwNGodc1pDXijic02nPPADgF1L8HU4hJ
         qrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489032; x=1793093832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
        b=wa498SBRH0rlKb/vuEl8C1cHYFuaTlZLpiw1boH+dTWrX7I0yrnV4spQ9FPd396MNk
         uP9wrnKvMDcj8739n4QOhbRv2NXg8W69zvYjVAdDkFan2sQLeSCTvA9SyLVltCrFqyFl
         Fc2SrVomgvD2w9u/8GYLDscMb91DazLOCmdReF9oyxn9m6yihEvUQqzZ4dB+3x1D/PUq
         9D5ccUMWrpLS4+58xIFsCdDYa0NyMo5JVcURy0UOEuNJ50AaaOVLLmkLJNdneR/ppGQo
         dTz29a2miPHlyf7wvJ92Xg8G0uk0SsRDQrTFyGABbhiFhP5n3ROCSoZSvazoN/99Q67I
         mIQg==
X-Forwarded-Encrypted: i=1; AKwUvBxSGyPEH5GTymZamdQvIX3QPkzlLH3rc2AId5z3U5QHMMi4sXKvd39It7nxvpyy4CBlTgIKwa852TIX@vger.kernel.org
X-Gm-Message-State: AFq9FYIOZIQnJA9hENxIgNoV1RzYsqyEYE/WEM+SNceasXkVTtLS24Np
	1FYgsoCQh2yzQdJqt712QkIulBbkN+Hzr2mEylMPO3ZYgGe8Gk2mhWkYGRCAKUbHgTE=
X-Gm-Gg: AYBFou2ckVOGWrBC7YkbKxDMjRfPKa6akmKQhqn9b1Yc+zdsmhnkavLBtBljifT/PWw
	H47Fykx9s0XHpD6sFAAfP7U/MueNrF0g5+qOR3d/Ld8LNtAKnxAYallVGA0wmF95mQK21hVLLgm
	fnzF6mQq4uuMnrSfMK48jZj5WAZMVnuq9aiHJyJ0rRUM7PCosv+LYLGG5qoS3J7FYz8KPVfc3m0
	U22pMgt0x07iuTw8z/19CqcAatg9jzzGZEugTDK6s3OZsrDXXqmhOtvEu2QzJ890Wy0wmnycKOO
	uRwR6Ka2eGAG1tAWKvlj5yM+At+COplqSshJ0KO/SXwUreUoAiMxYjrLV+VJzhUko471hSmTZRe
	lbN8/lX6XvU5/pqgtuGAaswteEtFq/35VnHWXvyCYo1NmEcObUQZz5eH++BejjE0ynXcpC9353e
	ZgZ3g/9tC2RbOqR+V0LEz0cYfspjPDnkWrjAGsdalfd7hCCJpaQVdkzqHYCnD5e7mx9SC9RCoMz
	Kdz4hT04e1ylrL6HIkrEa65MibxMY8fWm3xzTaDqXVODljQc4V6NZc7xFheTff0B2UxZC/G1g1E
	CVb1QZmut8uKy3wVt/+9YlunGTaJC4IBKwDGZcKKmLPXvw==
X-Received: by 2002:a17:907:94ca:b0:c45:c030:732a with SMTP id a640c23a62f3a-c45c0309ca1mr203260366b.35.1792489031683;
        Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
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
	Robert Marko <robert.marko@sartura.hr>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
Date: Tue, 20 Oct 2026 11:35:38 +0200
Message-ID: <20261020093655.344585-5-robert.marko@sartura.hr>
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

Configure the MxL86211C mapping from physical TPI lanes to analog
front ends (ASPs) when specified in DTS.

Leave the hardware reset mapping untouched when the optional property
is absent.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
- Reject an incorrectly sized lane map before reading its values.

Changes in v2:
- Preserve unrelated register bits when updating the lane map.

 drivers/net/phy/mxl-gpy.c | 53 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index dba0777158b2d..b71ed2bef3e5d 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -116,6 +116,13 @@
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
 #define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
+/* TPI lane to ASP map */
+#define VSPEC1_LANE_ASP_MAP	0x14
+#define VSPEC1_LANE_ASP_MAP_A	GENMASK(1, 0)
+#define VSPEC1_LANE_ASP_MAP_B	GENMASK(3, 2)
+#define VSPEC1_LANE_ASP_MAP_C	GENMASK(5, 4)
+#define VSPEC1_LANE_ASP_MAP_D	GENMASK(7, 6)
+
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
 #define VSPEC1_TEMP_STA_DATA	GENMASK(9, 0)
@@ -434,6 +441,48 @@ static int mxl86211c_release_super_isolate(struct phy_device *phydev)
 			      VSPEC1_PM_CTRL_SI, 0);
 }
 
+static int mxl86211c_configure_lane_asp_map(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 lane_asp_map[4];
+	u16 val;
+	unsigned int seen = 0;
+	int i, ret;
+
+	if (!device_property_present(dev, "maxlinear,lane-asp-map"))
+		return 0;
+
+	ret = device_property_count_u32(dev, "maxlinear,lane-asp-map");
+	if (ret < 0)
+		return ret;
+	if (ret != ARRAY_SIZE(lane_asp_map))
+		return -EINVAL;
+
+	ret = device_property_read_u32_array(dev, "maxlinear,lane-asp-map",
+					     lane_asp_map,
+					     ARRAY_SIZE(lane_asp_map));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(lane_asp_map); i++) {
+		if (lane_asp_map[i] > 3 || seen & BIT(lane_asp_map[i]))
+			return -EINVAL;
+
+		seen |= BIT(lane_asp_map[i]);
+	}
+
+	val = FIELD_PREP(VSPEC1_LANE_ASP_MAP_A, lane_asp_map[0]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_B, lane_asp_map[1]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_C, lane_asp_map[2]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_D, lane_asp_map[3]);
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LANE_ASP_MAP,
+			      VSPEC1_LANE_ASP_MAP_A |
+			      VSPEC1_LANE_ASP_MAP_B |
+			      VSPEC1_LANE_ASP_MAP_C |
+			      VSPEC1_LANE_ASP_MAP_D, val);
+}
+
 static int mxl86211c_config_init(struct phy_device *phydev)
 {
 	struct gpy_priv *priv = phydev->priv;
@@ -445,6 +494,10 @@ static int mxl86211c_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = mxl86211c_configure_lane_asp_map(phydev);
+	if (ret)
+		return ret;
+
 	ret = mxl86211c_release_super_isolate(phydev);
 	if (ret)
 		return ret;
-- 
2.56.0

