Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B736C9C2
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752538; cv=none; b=HBpsDE1/HppOH4CNM1QSXGpEjtsW62mkHFmDoocnRyWTFFMa/0AST0xw9mhuwBuFdhy2Ck/+r8J7kLbJu+XjSeiUTUAtGr83z5K2aFK5d37HuF0glFe4Njj5AXWLXN2b4KQvnSHqhroBMkVvj3Hnvy9AZvGJp1fB4PcXrHUNk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752538; c=relaxed/simple;
	bh=Uv8673BXW487YhAql7BVA6vApReuaTTxPWI2C9lkqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srkuNp1+fMEF2wWDAX+edhLOaGp1wHr7elnFoK9+vtg1/R+3R0hIYlQmv4YGfQJM02WckEWtChE46J6iT4/GpdL5h0DAulfh0VBWI2UnWBcPgnrtj560W3Wg8kI38dGCAesr2xpLVcnHbU/VN0YUDiLKWYRC+10uB2VPw4VDOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3FUjCVQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3FUjCVQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso31376125e9.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752528; x=1791357328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=Q3FUjCVQwjaQ2UWSq/dqprUKHjBk7iUytEtWe6w+YKxMgWGK8bOuvneYGaO3+o1Qz2
         upsOVsiFJ327T/spzqJr10EzSlYSpYJ/KI0NVvCpXA0PKGbMS/LiLqtFWLCLmcHr3WtR
         pJiWfNUzILK/ZiJvheecXSw0Yf8gsnTLD9dI0TIvr655oFFqaZKMsutHzv1dnVqx38WQ
         tvtBHX1ETpMCjDc8i/y1+y+byVpnUeGVmDv8v0PmrdOLr+w/cWFn5MGzW8VZceloXHlg
         GVtFJWUjRCf2I3s/8SD7ojpSX6+LY98zEQtCGnsVm9tuBu7v9+6PBx7mSGuz+thrJWDE
         6fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752528; x=1791357328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=NbP01VCozpzt6srOX31DTk5us47HR6gNE5MtrDi3bC7mbV8kT5HAmHOB/+/G+zqfyX
         y5EgJYNR8TcySitJJHd5NzpaWKl9w2+9kUxQrAf2TwdK7faXNTR+ei435HpuRhvvNdFA
         z4VMmN4sdWusjn3KJaymBCIRwziYT+yv882CaGcOPA9BV7wo6hvdd9xq8zuxmDKgw9zr
         tW/It5lTM7pa4CnNphEj3GIxKvMzPsbiRjhEjcsJXSyxH1jEkiq/JkRlU6qTK+Un7d5W
         YooJnFtdK5Tw3+oNGTqXCsyWTUv5QlsI+xIZLvJvhIItNwyqk/CBdhCxVYQZUAcxb+Dy
         S0tQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwOLTvKMtwDBNUaC8DrloRtSjTpPWQz6qaq2x7wF2SN/UYYo4aNoNRI1DYHBOGPHdU8Wq4dmuLMjI1@vger.kernel.org
X-Gm-Message-State: AFuF++mAY9cP6b+NRpgU1MnyjQga1caU/O4CuOcJol/XNP78na8CfSqA
	wRw3XpVtcz5x/DnHPBer0ucZNVoBu8rVsuVgTEkFTeAg6M8mEW+g9x0j
X-Gm-Gg: AYBFou07hhjPql/seDJLx9exny1Kc15eFMVuWFS7+UAdiv/TnHbh+rYpgFKaWbq/y0W
	p2jjWBhcDDDQivQCakHbz2NAgjXC4VwXUN7BVaCnhTMlcOzyasPrplVbdGojojWH87LfT6F5uIm
	qE05BKG7ZsMnhOI9SlZXDoFAcPEa+KQ/kvnHCNM3IoSzsMbglV7UHcBtpDFCa/63B/HJNccTesd
	x9zzvZoVZE/SX+4tDme40WddgTN76wYaj57Jcbqr1HSlbUeWY+IZWbCn35iR/mO08bXMEWLMOxv
	I1ZqjsQJ8kG18xBJyi99Ii9dElYOJR0nnX+h98OSF2WzoTiwni6Y+JdxxjYUmvBvJkaF5G6Yvrx
	SDSOGjl4HR7dfdSAUK14n93gT8tb91M7a2Wf4e0bGFWL0L2nrMS7pARSlOMnJ0RE8hXiNSYfHq7
	O5h2HA3W/Qk/B04Duopof+vmJ6kpYcgRyZO3F8p1bH/XlnYJ/7vm2BMoV5gGSFBnui+0zIyc4n2
	FSFZp60a0yEAfJ2stM=
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr5780705e9.29.1790752528575;
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed, 30 Sep 2026 10:15:13 +0300
Message-ID: <20260930071513.54697-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 8f6d7956e79b2..a9a11be373916 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 4d399d0486d19..4cbcb277ff20d 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -114,6 +114,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	{						\
 		.desc = {				\
 			.name = #ids,			\
+			.supply_name = "in-ldo",	\
 			.id = AAT2870_ID_##ids,		\
 			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 			.volt_table = aat2870_ldo_voltages, \
-- 
2.53.0

