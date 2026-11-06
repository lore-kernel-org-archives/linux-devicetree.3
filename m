Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960020;
	b=QQ4BtgaETurwewJ3Mw6l301nbRVLTdEophWK5U79NaagKZt8kh4LH+akUj9TUlesycvn
	 hVCqXbALYjdw0eTVOQHYmy2r41TQTPuRnL6jcFYZg24h6SXsthCZujTZkvqKy2ZOx4Q/p
	 GqUuVrjkXjnpe9MgpdltGbNxHOXM0u/4IpBy20kB9NVOC2nJDzUC6f998ewrBnQ9g0D8/
	 E/cipFq+rCRI+tWmw/urF1vj6EaBmvjtn7C+NuYtBk1raW5GtdQX+LkjtZukvfZCKknTd
	 s3Cp7gt2smMzfLytVLeFGeYxK8oievY8UY9rv7Do9E4rc41wg8NW61MOiiLcrLxRvJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960020;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=/Tav2KphJMK9NjGVOr3Y6UO9nH6eJBUC54HXud4VH90=;
	b=wVsvLj9C5vRcTHNjpuQN9S232Qiv+95AGUNaObM9C0L1RI9v/dazxIh0pBtDHkgWk4eP
	 4dKjj2ghQWRLKKpf2Eg+fXLBbqB8T/NI8eJPhHOiDVrrcOc1kEBd1zSp8oI5OQlRl+vxT
	 vOVLlZWXubRrr+B/K24Y9D1l1Td1nZ5GBhGkeuQswG5RifmfTelfMT5l97mckYXUmbUi0
	 KCgLFeJez69lwL7SNsncysxXhnQDNb5IUqJ2UiI9vJPqJuAETeLo4RPrECcTt42Ue66AW
	 FHDpot7VZAW8oDr+cuXkaE272IcF2BPLHFe4aGDGbnlKH32kZGYY3SMU3mfow81dFIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zTiDce76;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E037606D80B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E037606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zTiDce76
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A8EB9C69169
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:13:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5165FFBC;
	Fri,  6 Nov 2026 10:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DE03103291F9;
	Fri,  6 Nov 2026 11:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793960017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Tav2KphJMK9NjGVOr3Y6UO9nH6eJBUC54HXud4VH90=;
	b=zTiDce76woOVf1vtHYr1FddOTf1JzQ3nwrrfLEpVpOVQwA2WdSNN2XTh83LwgM/h/yK3Ew
	5cJ1LKi+fqPMKqmqQLZ+f1eM/pP0ZQMH8RdJEn8AWax9Xnn2N5O8K+HRH1hpjX93zPyQXv
	lwJld7gzoSNBwQLArWO3y+b7V+bUGk1DxgdFMR8YIYPTVhReCxRnAiFMNBJbhtjjCeaAw0
	7Ona42v6NqP6uiYYu3KoZxee4ANnQWcA4uDFe0KZZXNM2h/Ib0RvTM4A16AivPMCIirKCk
	aoUPVsvO3f8iBa+AfbRAH+N2bPNryORZer9Um+7lRAONVwfjns/Serf+N7m3FQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 06 Nov 2026 11:12:21 +0100
Subject: [PATCH v5 2/3] regulator: core: Support regulators where the
 voltage selector spans two registers
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-paul-lm51772-v5-2-0e83ac9711d9@bootlin.com>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
In-Reply-To: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793960009; l=6076;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=8/PcBvwvXZy3/GHqQnAPgi38f33LyBkeYqaWqmHMYYM=;
 b=9NSnZ4zyXQRDbJlYf8i3T9HOvCFILig6qg4JJJTTngzpOV+X1gkNFRV1q5E1gWUde3/u3E9fE
 gtOJpxGDVG4Cn4w4OBp/8zIkJXPrNAJ7HgCPYFihN4LUlvSNH7k0q0Y
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Some devices uses 8-bit registers to store the voltage selector across
two registers: one for the least significant bits and one for the most
significant bits.

Introduce vsel_reg_oversize to support voltage selectors that span two
registers. Write the selector in bulk across both registers using
little-endian encoding.

Assume that future hardware will require at most one additional register
to store the voltage selector, and that only a device with 8-bit
register will require such flag.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/regulator/core.c         | 14 +++++++++
 drivers/regulator/helpers.c      | 67 ++++++++++++++++++++++++++++++++++------
 include/linux/regulator/driver.h |  2 ++
 3 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 14422cfe80e2..1b1d14c544a1 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6155,6 +6155,20 @@ regulator_register(struct device *dev,
 			goto wash;
 	}
 
+	if (rdev->desc->vsel_reg_oversize) {
+		if (!rdev->regmap || regmap_get_val_bytes(rdev->regmap) != 1) {
+			ret = -EINVAL;
+			goto wash;
+		}
+
+		if (rdev->desc->vsel_range_mask &&
+		    (rdev->desc->vsel_reg == rdev->desc->vsel_range_reg ||
+		     rdev->desc->vsel_reg + 1 == rdev->desc->vsel_range_reg)) {
+			ret = -EINVAL;
+			goto wash;
+		}
+	}
+
 	if (config->ena_gpiod) {
 		ret = regulator_ena_gpio_request(rdev, config);
 		if (ret != 0) {
diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 0def82eb8b46..26bfedbddd7d 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -118,6 +118,32 @@ static int regulator_range_selector_to_index(struct regulator_dev *rdev,
 	return -EINVAL;
 }
 
+static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int *sel)
+{
+	unsigned int val;
+	__le16 buf;
+	int ret;
+
+	if (rdev->desc->vsel_reg_oversize) {
+		ret = regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+		if (ret != 0)
+			return ret;
+
+		val = le16_to_cpu(buf);
+	} else {
+		ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+		if (ret != 0)
+			return ret;
+	}
+
+	val &= rdev->desc->vsel_mask;
+	val >>= ffs(rdev->desc->vsel_mask) - 1;
+
+	*sel = val;
+
+	return 0;
+}
+
 /**
  * regulator_get_voltage_sel_pickable_regmap - pickable range get_voltage_sel
  *
@@ -140,7 +166,7 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (!r)
 		return -EINVAL;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
@@ -148,9 +174,6 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	range = regulator_range_selector_to_index(rdev, r_val);
 	if (range < 0)
 		return -EINVAL;
@@ -161,6 +184,26 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_pickable_regmap);
 
+static int set_oversize_voltage_sel(struct regulator_dev *rdev,
+				    unsigned int sel)
+{
+	unsigned int mask = rdev->desc->vsel_mask;
+	__le16 buf;
+	u16 val;
+	int ret;
+
+	ret = regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+	if (ret)
+		return ret;
+
+	val = le16_to_cpu(buf);
+	val = (val & ~mask) | (sel & mask);
+
+	buf = cpu_to_le16(val);
+
+	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+}
+
 static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 					 unsigned int sel, unsigned int range)
 {
@@ -173,6 +216,9 @@ static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 	if (ret)
 		return ret;
 
+	if (rdev->desc->vsel_reg_oversize)
+		return set_oversize_voltage_sel(rdev, sel);
+
 	/*
 	 * Some PMICs treat the vsel_reg same as apply-bit. Force it to be
 	 * written if the range changed, even if the old selector was same as
@@ -257,13 +303,10 @@ int regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
 	unsigned int val;
 	int ret;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	return val;
 }
 EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_regmap);
@@ -284,8 +327,12 @@ int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel)
 
 	sel <<= ffs(rdev->desc->vsel_mask) - 1;
 
-	ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
-				  rdev->desc->vsel_mask, sel);
+	if (rdev->desc->vsel_reg_oversize)
+		ret = set_oversize_voltage_sel(rdev, sel);
+	else
+		ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
+					 rdev->desc->vsel_mask, sel);
+
 	if (ret)
 		return ret;
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 55cc519103ed..8ed371647351 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -312,6 +312,7 @@ enum regulator_type {
  * @range_applied_by_vsel: A flag to indicate that changes to vsel_range_reg
  *			   are only effective after vsel_reg is written
  * @vsel_reg: Register for selector when using ``regulator_map_*_voltage_*``
+ * @vsel_reg_oversize: Indicates that the vsel_reg spans on two 8-bits registers.
  * @vsel_mask: Mask for register bitfield used for selector
  * @vsel_step: Specify the resolution of selector stepping when setting
  *	       voltage. If 0, then no stepping is done (requested selector is
@@ -405,6 +406,7 @@ struct regulator_desc {
 	unsigned int vsel_range_mask;
 	bool range_applied_by_vsel;
 	unsigned int vsel_reg;
+	bool vsel_reg_oversize;
 	unsigned int vsel_mask;
 	unsigned int vsel_step;
 	unsigned int csel_reg;

-- 
2.56.0

