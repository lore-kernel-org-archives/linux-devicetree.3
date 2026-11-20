Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162273;
	b=iIf4S01QJt/1vcHKik6OoltDpkO6R81Xcu6YivVkUn32ZszIE8tkIPPuC5ryNMxFs0Kj
	 oGMvibh1NIXE4DL5pLxGr7O5vGgCL1NDh/h/KdPR8MklEPQh9i6YOiwNpzaUCQUG3T/x/
	 1/vdrWRTo3+OtZawcGfmZljkq3KSaglUgSqcfh/aFfiYGbMw/yQYpm8/qgah7wORV7cIT
	 a0/N9FL3rvOcjMs5vb9OKcMdT/glMgHUH9m3YS/l1usnW3dRFIVLv+usxe5ccK7FuNKZi
	 Irvnx2br8QR/PhOl2si/cmi+X7pOzbrFSGfz8AHS4I8GA6h5i7o8Y3mBiXDW7OVO7/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=XB9XJ3why4wB3aDDM8G6fX8LsWV1P7LctV9ZZ37Q20/aLzcqsTbaiLDq/UK2BsQdNOUU
	 NRTAA1V4e94NJNbULf1EdQE32Ef7eWNwssIIXrx6uenbvXUMu/tjO0sdgunWRyC74hqst
	 2McxlcDhqyOupkbawdbRCcsmYwf01//WaoIgb0F0FCiPVLBmuXp7oP7J9gNaGRcAyW8Ay
	 ZrxtLz2kgXnYKWWg1xBB3f6k60B5j/FJECDDzz9zg1sB1mLGSUF49mfEVlT7MFnXI/d5n
	 RPr9XOsI1058oFILcRQgPP0cdjKnVYWzLvjtuCOr7we4PZT95jvTY13TTwZ5B5miotg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065F606A33D
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7065F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839238e87.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162271; x=1795767071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=w2ATjdeWwzJcMVAzYw2sUM72zVRswVEaXN6KcBeMnv1a5wK4Bz/OGAV2d1vhDrzdR3
         XSaLtIToCMVx8rbKxIZp3xo9oXR5wQRcYGMIURqLx1iNDth4AfZzH6TweIcacdUY8HMk
         bJg+0v5lD/gv2HVUCWrGxTlEdcKEVe8gsGuxfgJOmRHLC3dVgHXJaHN102UgzjEyua9A
         FBJTTjkxchlJuSxcKoMy55A8+5xg80byQe4k5CIR/KAXWb7S3ATcYExMlw0amzQewHc7
         b/Rek8VGAOvZRuuQsRPk6XWPvbOPf2sRdTn1P2oWSbO2q6I5QcHBTfH7c286B3A70ChB
         EYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162271; x=1795767071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=rATwyofQ6xjUFDEpYQL02vf6ldL0Ee0XcGQfLlXmxeNMF5kCszvtEUpQlzeRKI8qU6
         83XczmLJPbPmtUg5lTKMIsEmqEBfm8/8Wr6Sa0VRE0Mzt0MsgwaOJ2pCJmFdQicjWn/O
         9w5pv4KeKGCULmOYemLGoUAW7ro0JLPXbE5qPTKys97dKqHNr8L6P9uNfunWMubqvC6U
         zlQe52VijnY+evnO53PDnW34ruxy8b+XaBMkNrnSi4l3U6lbmblLIlv3SCvaDKSCk73r
         7sJ9v95/wE6dTcJ5UguIPjxjrwN7PBs497+cv6gW6UkltTaLMcS/5bnfOlJhiHNaMvgQ
         d/Lg==
X-Forwarded-Encrypted: i=1; AL+hErEJusjiCrcG8XF9ZuLnoCFqMfPSxX5/OccmeOREZCrH5GjxZhy5rzJ6tNmXIa9YnokDApCnDl9T1gCw@vger.kernel.org
X-Gm-Message-State: APuU4Z/C+eKnoCjEPuBAhPlEF56cdCfckQ3qTp4tXOko261hdY9C+MPY
	rU9AIbKSHOk80jE1EM9vBrM3bW+scoIy0zGum3csFMzHNbOmojuWyGwb
X-Gm-Gg: AZFdTZe8a7q9HOx0hASx733hGLNPQ5r9tIDmx7LHvEfkvPRfLIQ1Zx/gPsLmzBlVq5d
	DdEHyVxarNSrqCSnWvuJU7AhfVDKmmwjIn2Dcyt7ArVpjmBaXBpvSQMwqf1qfUwRibPXPFZy3BP
	zBK5FyBe94M0t7XfcySx2J8HzsktM1p2AvhLhYZ6SJ7vfFvz6gqlSxJ6ZgP8Ns9IZXJMd8xYluV
	kKBfH8MIrnC3D/iBo1s+qETe8XXjV7ALICoYy8+eKioTt6oW+/sDY8ZK1tu1b7oHVKPPwlgB5Gs
	GE+crdR3FgzjyX+FF72/Tr4A/GHvXHYdROWXUqZtDQsbigr/BMyTkh1Pr9E08HPL8PIRCT1TbIH
	481FG5SxsRRSbcqRe6NkJQcayVynQCWavHsnunk0sSnRZK89rGZzat6xtdNAOHqqz5CvxMZEOm3
	YZPwUXhxG3FbEmmhVeIET0E/Ovt5r2H7ahd1apiJbLloHlE3tFUYGyUbWuS5ZywmptXCU9nriwH
	LUDDk+QoALUkEQU8KIZa69MAUTzmMKA8LpV9ZCfE6F5FN5BPmHe9UibcVcc+m9O4ml8pITNN+4x
	Ie9i02cI2wSlCynT6hTvQwOZfpyopPgInqyMn8ibfYYeI3Y=
X-Received: by 2002:a05:6512:10c7:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1bc7fbfafmr636017e87.17.1795162271379;
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 20 Nov 2026 11:10:59 +0300
Message-ID: <20261120081106.2919010-2-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

