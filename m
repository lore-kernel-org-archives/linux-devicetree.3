Received: from mail-lr2-f14.google.com (mail-lr2-f14.google.com [74.125.230.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980AD539791
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700755; cv=none; b=TyPKuUVqyRRpHERR8rGrif9oqgyf4o5ESG/TUw0ocMfsQzQurJVjNljzIqaSa3O/UAvVBs2ZCpaZ7VuiC5cNUHcgroq99m+lSYxmorzwOXiSJqeryrl3ELgN9WdbsWpEpWmhBKT47a4+vFkMO7g1FnT42FAg6AH0lrxe7lWuR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700755; c=relaxed/simple;
	bh=garHynZi9tpyUpuiY2Mns/z5ds0lhdcmol6M4bRL3Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zv6/gD88yti7EVXBRqYHM/69sJ6nB5fb3ktK5vd1PHGLjXAcYYsmZrg062UYiXYWnC0aN9dQHj780MgVOiaKOK81l2Wyxhpsb5Kgx48CDh8e6ltKxIo2U2/1hRVJSE1ArHSOd4si+zReIG5BEsSCOmt0emSN+zNMapEfS6i5+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3jjTkB+; arc=none smtp.client-ip=74.125.230.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3jjTkB+"
Received: by mail-lr2-f14.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso37404271fa.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700751; x=1791305551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sds4TIuZN16FCLiHCd+CfdEgVg5/yfqoMnUiuuwQ3p4=;
        b=Q3jjTkB+2KM879dbceItHywl4mIC5tT0HxIpVFvVV+8lOtRSWHs/vjP3uU4FiRzT6o
         wMF0qcULMTE2Crk1jB3AB2Qr0QZtLfSbOQfKTFKDGQ5D4/A6KxQDh7vKE0IUXBcSDz+o
         e0oaJ+G9MMkTtqJW90CscWCEyXV9xkwtwIpqLL3BCLIYoq32w0sZVmJ1aLyKzWZKUDLr
         XoVybiRjICq9jNXHG7Sq8hWGecWtYhMVON2o/wEBFi23HQ6iob3h1se5aaycPe1Sog35
         JrNUAs9uXFrryJtL4JPB1XCdA7EAhmac0tcmfjK7zSaRXPVaNoCTUW5CTU+vxg7NYSLr
         bfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700751; x=1791305551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sds4TIuZN16FCLiHCd+CfdEgVg5/yfqoMnUiuuwQ3p4=;
        b=dbknvPK/xDjNVfhEf19YJjFp4pp6s250i1IBSy6igUKbgm2SrFTt4qlZMARInmFB8r
         X1ZdPT7+htjacFRzPBn96SygveVySwlCk0Yd0Z+eghH8MJRo3mo+0wKqIRQk6yyQ341a
         TeZDaRGD3bdTc1nDX9GkwnY+t8NnGz96KrcRbceWXZS0/OXo4h3Rwdl0jWAhYqngT5P7
         jJVAKXRxThHpycJnK2hQNhIY3wdcmzZ7L/i6b1AZYad4vIO2dM/QZiX97/zcldQRDtKb
         EYGTRxdOBFx8+MLTT4b5AQzr7lFyy3peSXhuSz9/s0fxf8VDClcvOixksVAgsn/crKJp
         q9fA==
X-Forwarded-Encrypted: i=1; AKwUvBwq8s+dCuOdmpdN8HmdSP3bpguiVfQfPLFEHL2m2ruFU4DvrYnnY04G+AoIDBC7mjHxLwohTerT9Ras@vger.kernel.org
X-Gm-Message-State: AFq9FYIXYzwKsZkboBceu3JahuDFMk8REx9IDGQtDJ+4fBxA3knMllwc
	FcyHHUXNqeoQR4FsJBiHE+45sFQ5luGbPLEV1i9K4g/vI5gKyS2aL8M=
X-Gm-Gg: AYBFou3Je8c/OzaNTS7/N6nY17DvYMbG8dGvqLE31WAynmyvhIWW0zcAdKY8TXBv2oM
	y6VShzUPK1f1PMzSsW4yPWcvbWnBgDRspDb9iEpdxFzCIGoCVaYvgywovT2vuHXStaEDDKz1k0m
	cz3ugbLUh2tfIkPvvI0V34WJTgi73iO1dNNAeOWb22UcEUEfWJW20Vb+bY8U0g8ySzruUP0tM8N
	8OMl2NsaRogA40tzN0t/hjxuYxYS/Or7tSL0y8Gh5ziI39OZ70LMWmtN0C9+iYEfgsCmNBSxy32
	sHY8bXDHHdmkjUm9qfu2ABc0tzwUbWUQP1a/rx/9fMuPbSvTmCkMjo8bR7CzIgpZM2L0et3OB6r
	NnX62YyvLc0SriWEhUp+eXUOC7uW+VufoDkK5agOASOfoo9HehNxH0PbRUPgQtR0JSzhXzH2uJA
	OIsQcMJ4fznhGqcUDcOWUZsZZuWw9ep6MggtMnijaRVHnqaAlsmQ5fsY6UsrK4
X-Received: by 2002:a05:651c:324f:b0:3a5:8d4d:470d with SMTP id 38308e7fff4ca-3a7717d4ab2mr371471fa.18.1790700750439;
        Tue, 29 Sep 2026 09:52:30 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:30 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 1/4] thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
Date: Tue, 29 Sep 2026 19:52:06 +0300
Message-ID: <20260929165209.69669-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165209.69669-1-sochnev.v.74@gmail.com>
References: <20260929165209.69669-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On AN7583, bits 3:1 of 0x2e4 select the sensor (0 bandgap, 5 GbE, 6 CPU)
and bits 3:2 of 0x2a0 select the diode (0 D0, 1 ZERO, 2 D1). The driver
names them the other way round: MUX_TADC is 0x2e4, MUX_SENSOR is 0x2a0.

v5 of the AN7583 series swapped the airoha_set_thermal_mux() arguments
to match these names. The diode index now goes to the sensor selector,
so the zone reads mux positions 1, 0 and 2 (PAD_AVS, bandgap, core
voltage) instead of the bandgap diodes. On a Nokia XG-040G-MF the result
crosses the critical trip and the board powers off during boot.

Swap the field definitions. MUX_TADC then selects the diode, as on
EN7581, and the existing call order is correct.

Fixes: b20d9782756a ("thermal/drivers/airoha: Add support for AN7583 Thermal Sensor")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index ea3e2649c280..1b187c41baea 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -18,10 +18,10 @@
 #define EN7581_DOUT_TADC			0x2f8
 #define   EN7581_DOUT_TADC_MASK			GENMASK(15, 0)
 
-#define AN7583_MUX_SENSOR			0x2a0
+#define AN7583_MUX_TADC				0x2a0
 #define   AN7583_LOAD_ADJ			GENMASK(3, 2)
-#define AN7583_MUX_TADC				0x2e4
-#define   AN7583_MUX_TADC_MASK			GENMASK(3, 1)
+#define AN7583_MUX_SENSOR			0x2e4
+#define   AN7583_MUX_SENSOR_MASK		GENMASK(3, 1)
 #define AN7583_DOUT_TADC			0x2f0
 
 /* PTP_THERMAL regs */
@@ -636,8 +636,8 @@ static const struct thermal_zone_device_ops an7583_tz_ops = {
 
 static const struct reg_field an7583_chip_scu_fields[AIROHA_THERMAL_FIELD_MAX] = {
 	[AIROHA_THERMAL_DOUT_TADC] = REG_FIELD(AN7583_DOUT_TADC, 0, 31),
-	[AIROHA_THERMAL_MUX_TADC] = REG_FIELD(AN7583_MUX_TADC, 1, 3),
-	[AIROHA_THERMAL_MUX_SENSOR] = REG_FIELD(AN7583_MUX_SENSOR, 2, 3),
+	[AIROHA_THERMAL_MUX_TADC] = REG_FIELD(AN7583_MUX_TADC, 2, 3),
+	[AIROHA_THERMAL_MUX_SENSOR] = REG_FIELD(AN7583_MUX_SENSOR, 1, 3),
 };
 
 static int an7583_thermal_probe(struct platform_device *pdev,
-- 
2.55.0

