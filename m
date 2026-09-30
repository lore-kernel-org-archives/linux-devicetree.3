Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DAA4D179B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770999; cv=none; b=m6PFtCt5I1QidnLJNWLrBP+5avp0GD/yCTzCdtni3xStcjCOKO5OZf+lvRV5jMz1j+55KzO806gNHCwnJPcLEMmcSHvG7vcWs+54l3u3QSoS8YGS5D3iJ2rw0g0Q1saDfF5UpMFgE/FY4U1b+QMP30VRfbOqvYc1lUn6ltIp9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770999; c=relaxed/simple;
	bh=+k9sp1oqiAUtBF2o+2cY4eFpu6taZURDOq6r9XgjvTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sD6rbyd2VA/QEUEQh0FI1fLIC2OiLgCuV1UubLwvszHamln4EbQMp9pJQfLkPT4W7fGnCrfhJvnNvTTu9GEAT2IA+HBQHz9PufX7Wi8Chx03Db8NGU3f4ZKSc9uySVNKDUPzbZAHUQtyswr9kFMCH5SmvHGEVlun8VxrL+7Ly6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=c/3g3aPD; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="c/3g3aPD"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acbdf627ccso1937368a12.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790770995; x=1791375795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAxLR8+28UhznISA3ReGjGduD8MOYVnzmS15jax8HnQ=;
        b=c/3g3aPDw0oo7BlDfcI/tkuIy9+/eL2MxNcP+MxSA3NqFGm80GqQKwmsImgdCaVX6a
         2iQ6rjOUnXNCrcoI793Clhk9H0fpIBA6z4dcYdwlXcJaY32rt9gTjnbntYlhzhmGH214
         WpjNh/0Asosv7OnGhG0P81PIBDwc0Uy7f2TVsF1X12jWMbPcl3GgDFG+1+znM9nd5uXU
         zdPj3ulzXvjWh6K5KK53Ma2UtIpXYzSqNHBIzpbl/2bEIAHXdfXXQ5PPlTkguIv2c4/c
         ZBG4X5JlZnVLp8UNyRRJTiLQzRIL93Jh0fyFxVTzzSxOuj6B4sZi+BrOmV2i33ugadVf
         eQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770995; x=1791375795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAxLR8+28UhznISA3ReGjGduD8MOYVnzmS15jax8HnQ=;
        b=MgLkkllJf8n23N+PfGpeI30RhwUgrb7nnKNxuRchLDsvJxB5Sqk3v2YrAfpNlKzLEp
         j43rhzQVARaFFVP7vmErs/IFP6aFfpmZcNFIvzkIt3FXqJQJvQIwRtX0c8H92WIQcJ1B
         eM5DewQj/rgfRcYqZ6G58vYka7P6HWhsarZ8a3/ITocGcu61kXjwaDXsfB3xyVZV3NY9
         OnKLqe1laZjp2ZZGCyMS6R05yHZ12lSPqENNIvHSb3jTLd/R11DBmY/cGEIMKejp70OD
         zbgDZ748rRhKHVT9PaCigGVjtqUdsa7LIorPMDaoQaYtsG4Hc+zBe7+a9r/32GJsviTQ
         barA==
X-Forwarded-Encrypted: i=1; AKwUvBxM5AidekEYhsmHIPOcr05RHBY1yqzwXPP3pKcQFarO+9T3GP+U/rDqRqhQs3c/Nu7h0yCpgCm5pR/y@vger.kernel.org
X-Gm-Message-State: AFq9FYKxAR7eurdmXWsNWPqWSFoLpSsnf6QCPxd9AWQrcG8PpOH059G/
	FDT2Tml2QkPbbC88aYrwvuXDFqhOCfOL8cBP2wV5T3u4GH7sdmXphRS5XgqyfAccWbLw/ArFrCk
	Qqg64
X-Gm-Gg: AYBFou3vizYRO/YDNpUiGz8Qk0yVvlXCDfIIFMutMGHtGMqPfsFPPXuVzXo8SbSTa2v
	Z0ljhSQBQcgnV5s6A0g7bpWHIVtcPPLl7qsElenig12/RybfnaOjhyea5aJ/0f3hosx5kYWY2sX
	fj7Mm7amRukhRWWWgvKHstOHmnSK4dQ0VFyPC45XiFG1VbsUllpScCiC4FTVA+kWpeRkhEIjQXb
	N4WyDn8XT1LDyu8VNJmr9qc1o3XfEz5oyp2EYuism6kHp5Y1Pvs73qvsrrRJAqAo30VK8x5oLkY
	uc374RR9wqjtrO/ntxdWE12KKRzeHNKfMZR1idSgxfTzxybTkb+3nznd8UX5ICJAXQPC0/tt/JB
	0zQjKejz5qQQ1xxRfG00p3F2mw5vVqzrntarV2Mf3vzynNbhtBUUHR4gMhmcuetNz2tP6i0v3Lw
	6v26l2PQLiG+zkNR/DXjttdBUldk+s8GM6mzt362oLnWnr7Z5V6I0aNuL5c6IRyPPemqCi+I+OD
	LyuPMeAtJBwDVwHb2ZgbzwsPRU1DULl4tqnbJw+A1S4HK1+C1gXPL39sFBgBKQvvUksEOdqYvQ2
	BqZn8b+ZFhksFn0Qb72168xxUhg4
X-Received: by 2002:a05:6402:a0c2:b0:6aa:28d7:5b15 with SMTP id 4fb4d7f45d1cf-6ae1990972emr668766a12.16.1790770995275;
        Wed, 30 Sep 2026 05:23:15 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-187.xnet.hr. [88.207.15.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e5a3sm744042a12.20.2026.09.30.05.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:23:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	lxu@maxlinear.com,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/5] net: phy: mxl-gpy: release MxL86211C Super Isolate
Date: Wed, 30 Sep 2026 14:22:15 +0200
Message-ID: <20260930122305.293686-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930122305.293686-1-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MxL86211C can be strapped into Super Isolate mode, leaving
the PHY halted after reset until software releases it.

Clear VSPEC1_PM_CTRL.SI after registering the MDIO voltage regulator
and before the generic GPY initialization accesses the PHY.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/phy/mxl-gpy.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 4cbbfae046317..790075632fc3f 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -115,6 +115,7 @@
 /* Packet Manager Control */
 #define VSPEC1_PM_CTRL		0x0c
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+#define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
@@ -446,10 +447,6 @@ static int mxl86211c_probe(struct phy_device *phydev)
 	struct regulator_dev *rdev;
 	int ret;
 
-	ret = gpy_probe(phydev);
-	if (ret)
-		return ret;
-
 	config.dev = dev;
 	config.driver_data = phydev;
 
@@ -459,7 +456,15 @@ static int mxl86211c_probe(struct phy_device *phydev)
 		return PTR_ERR(rdev);
 	}
 
-	return 0;
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			     VSPEC1_PM_CTRL_SI,
+			     0);
+	if (ret)
+		return ret;
+
+	ret = gpy_probe(phydev);
+
+	return ret;
 }
 
 static bool gpy_sgmii_need_reaneg(struct phy_device *phydev)
-- 
2.55.0

