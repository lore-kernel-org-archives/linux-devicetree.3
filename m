Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807249F129
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301495; cv=none; b=jIjwU1tA3f/fIBg92kRENehqGVm8DrYGDeOfWccmXfwtbqnBkreVaK2PeEtgs983C+rAlj0i5VfI5kZ07F5RQndAjjSf0CSDFd1EBabkzcDnf9Cv9d6a823WJwQFkClDacI6xFhO7FWQME88UwVjB6nug5nOcPl0PakCqEBS1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301495; c=relaxed/simple;
	bh=i9wB6k+gSOJqbar4HQq7tst641yPZLYwPNCoR+olQXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ac+lMdRd6L2kYAUTxfacIJ/DOMZaXewuU8zb+MCZJF4vYK38fQML0ATCcv3QlZfL87OpMBpQ39MiuhEcmJ/kIeoxgwDO6glAvKh4brVvd7BXFnDWb0ey/lYZHCpG/ORXqsm0kHCk8lnsT47HqQ7lHugp9bdROokHPgpBUChTWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWCmSryF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWCmSryF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2538096f8f.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301490; x=1791906290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWzGAzD5eF9cKyqD/7NUq8DDIAMBDaKbaaDeJ35N/qg=;
        b=bWCmSryFJu2Im8XYnZWVIjPECjICDIPEWqOF26DU3pSgyE40v1RptM8z94G4iqWhG5
         6cdJk1j0B8x3PWq7Jely5pWZI0v8Gf5aEcQeAqM5r1iDs/zVQ763RblewIt3BkofJ1eC
         8aVv/Y0EBtFZkC7mlhRz3xWjZNS0uwZUmVBLbTfjrwuNub3zR9n7/ERmvck8/TOMuGGm
         T+gWm/EVR2lpjCyO+/nswLSd/LWHgRJn7oAIYDaqWikaAYOFfS7MFIniAkjheupANWIl
         jVhMWbOPW769hFOykWnE9s10j8bZrP3r2Jv8mBaWCS1jugjDg6CpquVZjuYGj72uF2kL
         z1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301490; x=1791906290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWzGAzD5eF9cKyqD/7NUq8DDIAMBDaKbaaDeJ35N/qg=;
        b=i9M70oX3J5Qvc9sHKzJ/WB6FJjUtoQ6LfrtR5wOscBAlmsy0yy9rLugZ/z2N+4b1F1
         G3hOL8MvIyao1VGRAIDytQzVBC+kuLoBdUY9xWk2PYRUifnT1nxKF33CneX04zU8YbHB
         mJiMGFwNyG/+YNRKw93tYcBkUXxoUKWRBRF9PVBQLgECY0U+JrxVpQNzgYnjIGZkh+wI
         /N7C+UbPBw7Rl9WfsauIw9Bq5Qmbxuy4S1H9befZdlJeI1UUbNt0v9mYKoCHXKcxDJot
         GsNiAf+tQ+ieIQVhCGq+blJVqOHytOugTbtKnWGUjtpdYnBj1Bfu9w/tgLhJMkUqctYD
         /y2w==
X-Forwarded-Encrypted: i=1; AKwUvBwQEZVMi9qUlF37SbmUHuM/nPz27zz7xPXC0wHeiFi4bChFRE7S6EHVFs7LAwlGjgMUv4pE0PeIHmm5@vger.kernel.org
X-Gm-Message-State: AFq9FYKjwfWFfndL7VRiMSX0BZKCRW4H4vCC/U4iP0rXHhZYRykSaZRi
	4pUEMEdtI4Do1VIZnh5eaLSqAzMM19beVg0he71yYLeLlYC305cElSEX
X-Gm-Gg: AYBFou3W8mWRayXOBc/xFClygxfSd145X+wNu1ME3rO2/4D3HSR64mGcz13XTKXc9xf
	PECBnxcBlrPNikV85qqmZxfxBOe3c+oHxTGw5xSlkd2oaBHaJsW1aDZU9vABXf3D/ktO/umll/F
	yu3J631pFBI6j5JMxCxIxu2GBYX/TU2hAgwfjxjaA/RUU+1uwHBn6R4mXfUr/6o9O16cc+OsWmP
	qUbTqt72vidirMMEDX3MURSNdLP8xg7tcsIpKyioa79MFcNK+OQ3MMqi8PTlJgUa8HJZwg8b5fI
	jvrbGw7DAcECGH1/5J4XXmQf9DuXd+P3Uw+To/pzHKdtjJ6d00HqV/XE1oSpkFdS6ViwE+QgoGw
	e7xlpKUD8WPycRfBuTrd3uuwCjpjMhaOuoOxyM8OvwccGwV2ZwSxe531QAObkrdqupz5om2IDpS
	dkbAnaTlt5GRf7ps6Ez8IFbyO9GCnYItj2Y8ICls9hvdTBkeegxHZaEMCgayWwkl66HLF/6Hdm0
	qr1QI5vPP6mpn10Awc=
X-Received: by 2002:a05:6000:25c7:b0:487:489:7af0 with SMTP id ffacd0b85a97d-48c6d15f9d6mr3766141f8f.17.1791301489629;
        Tue, 06 Oct 2026 08:44:49 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 6/7] regulator: lp872x: Add support for input and regulator power supplies
Date: Tue,  6 Oct 2026 18:44:30 +0300
Message-ID: <20261006154431.318936-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP872x support dedicated main power supply input usually shared with
parent power supply for one of internal regulators (ldo1).

Add support for retrieving and managing these supply regulators using the
regulator framework to ensure proper power supply dependencies and
power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 3d95ca7fa0246..df19a5cc94d0d 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -471,6 +471,7 @@ static const struct regulator_ops lp8725_buck_ops = {
 static const struct regulator_desc lp8720_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vbatt",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8720_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -485,6 +486,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8720_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -499,6 +501,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8720_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -513,6 +516,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8720_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -527,6 +531,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8720_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -541,6 +546,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "buck",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck"),
 		.id = LP8720_ID_BUCK,
 		.ops = &lp8720_buck_ops,
@@ -556,6 +562,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 static const struct regulator_desc lp8725_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8725_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -570,6 +577,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8725_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -584,6 +592,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8725_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -598,6 +607,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8725_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -612,6 +622,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8725_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -626,6 +637,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo1",
+		.supply_name = "vinlilo1",
 		.of_match = of_match_ptr("lilo1"),
 		.id = LP8725_ID_LILO1,
 		.ops = &lp872x_ldo_ops,
@@ -640,6 +652,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo2",
+		.supply_name = "vinlilo2",
 		.of_match = of_match_ptr("lilo2"),
 		.id = LP8725_ID_LILO2,
 		.ops = &lp872x_ldo_ops,
@@ -654,6 +667,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck1",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck1"),
 		.id = LP8725_ID_BUCK1,
 		.ops = &lp8725_buck_ops,
@@ -670,6 +684,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck2",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck2"),
 		.id = LP8725_ID_BUCK2,
 		.ops = &lp8725_buck_ops,
@@ -743,6 +758,7 @@ static const struct regmap_config lp872x_regmap_config = {
 static int lp872x_probe(struct i2c_client *cl)
 {
 	struct device *dev = &cl->dev;
+	const char *in_supply_name;
 	struct lp872x *lp;
 	u8 general_config;
 	int ret;
@@ -760,6 +776,12 @@ static int lp872x_probe(struct i2c_client *cl)
 		return dev_err_probe(dev, PTR_ERR(lp->regmap),
 				     "Failed to init regmap\n");
 
+	/* LDO0 parent supplies chip itself */
+	in_supply_name = lp->info->rdesc[0].supply_name;
+	ret = devm_regulator_get_enable(dev, in_supply_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable supply regulator\n");
+
 	lp->dev = dev;
 	i2c_set_clientdata(cl, lp);
 
-- 
2.53.0

