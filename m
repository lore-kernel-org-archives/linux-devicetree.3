Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8767A49BB4A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398993; cv=none; b=rxyqj3rgbDc3z0Lf3QB5dX6+5lTrLYyxtvpl/kTbbu+9zfzcXoX7zLVWqAt4U9vMPLw+MgIbacnnZuoLp24fYNBcCNaES8MW+oZV1hPrBMxV2mNe/ZFFR/TXrAyYp0U1UrYPWFsE/5sZKm8ErNLcwvIvjUKwlGt/3C1yhXsQrhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398993; c=relaxed/simple;
	bh=6et/naEVh+7RcugLn/VZJIvTlDjAPXKxyRiodbGJ9XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0kBMm0b64I+sPSBfsVZ+2ymjZwkbBzAWyjOYRRfP8GgkRykE8Y2259n4KVq0YA60HKcEoQxFCBrz1QVpFX1yCl9x5kr9222tZ1bUEBj4si/uFdW7btZGxFZydsax4k066YZWNugfeDw44kQ5khC3OVuGR2GuqanX95KxmwzE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwYGl3NY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwYGl3NY"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2099702a12.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398990; x=1793003790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLfLQlidU3/KHyGK+HIJgR5ijXNxjrv7CYFqa1UslY8=;
        b=AwYGl3NYVgkh95/DzO980k4j6YNH12r9r0aKF1H8ulc5jLYSp64DcuAw3qMrAp0GKU
         E2qUNgE+U5BfrXFp8/dgx5K9gLGC11xhjdWnE+Xg7i8LU+ipj1Gcz6Y+YAS6y2rPAjuA
         Vi+bg/H1NVuclqnVGjefue+PsfHR7uIj0TLmIYz+U/Sq4gA4VsUwTUN4bUI66uIHgsxW
         iXMGdQ4g0VIVCR8BxMShInOKV7c+VRLBvNH+UkPEVTI3SQ7ggMh5L17q2anmoVrwjJdV
         dlGh8T8UzaRgvWsUxx5LJ0q8t0AaPMBi9qEyyDz2uDSXcf9Oquw8xwZiAqIJ1Zf2x83/
         nkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398990; x=1793003790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLfLQlidU3/KHyGK+HIJgR5ijXNxjrv7CYFqa1UslY8=;
        b=2VszecWe9OZ9kWcLMsphuKYOrkmARAu5MTeRm+wC2mLN2OKaw8Kc23/cqUow8gx5XF
         qfNbjGx1TUZVSjczwTNLoOuSmlxSzRVkraHgaoalvGYaYOrvcvZjdGe/UweteK4ZaBTc
         vl/7yw4tLfYIPMU1xlkScEnXdqpDcn7AmBtzDFiJthnAyyDFu4ShrHmUpL9bjxOnC+qG
         skfKYzEvG9NsJgZPetCW3iyvTcyEOeKmu5x/VTqix/3E0708qKDiMUSJO6qtqivsrOzE
         bksMy4YYgc9sNu93atwrgHkGdSlltFY1PBUeOV+Fejiq2mnK+8YoZJNuagJCEDC41Cja
         dyEw==
X-Forwarded-Encrypted: i=1; AKwUvBxHasFYFR38UClMNOSjv/XL4FOhBKHdYgkYrBtaorOT3EdxmezLvB4/UBnbr71Q6LSshuvS0VVI0lAf@vger.kernel.org
X-Gm-Message-State: AFq9FYLc2A/L09cjo/aU2eD5PidLE7De3/2zc047I2/4PLEfX9o370Ue
	gsV/jPGA/UGG7Zq/OmGaiK+zbuSRHsCer7FNBOnYg8qnGsiTJioJFf9e
X-Gm-Gg: AYBFou3uPSA7lVnwHqjg+hkbfyK8HNdPtdB8eDsVBP+UwpWjrxzSO0es5h4Uo2KDBRF
	Sgnp+/Ge8ng+zZqSglOSGutoipz2L2QFzoFVpH95Fm/9u8blyor4RsR8FSXkV6tJwabl7UFi9ww
	VqOozIb3JOT1ZYCiQVxfWPV1DFq/H4qdg+hmJkox5npFBgEtOw38q3imCBdMhtA7KLleDLYKcf+
	WsEMXZ6d6iKVXe9x96BagvQLSMdGuudCYGR1Tkl33rSu0P/bM2817PL6l/BtsMA/7TlWvKnN2x5
	+xnK6auunCoyYtk8thBnOeIpBU+5Hp9qmhOcwJi+FpdWSmQjbrZWk//wQZ8BxgM2od0MiyOymLF
	jRq9kn8PYQrM9HBR8SMOBFeOG8oD8UYcWwpIPSBQ7s4dYRdF57xY/Kq47le6Bk1sEsyDM0dKjkY
	QYJho4b1gwbs5tvNNxdLvD3Cb1Lo7mv4EXLn8+O3vrsp+WEdQsFreq4Fl7w+gBjO1eQxzaTXC1J
	tvc1msVpR0iaen2yc+V82JEoixw18WX3Gv1mQCK/eMn2sMZx1RfLTksoSqVHs1uvq4nVIhtfUdw
	ZB6BCrbLPRb7JLcY2vPGNdRegPw7h1gaCijkDw==
X-Received: by 2002:a17:907:7f86:b0:c40:231:6ea1 with SMTP id a640c23a62f3a-c41a05eacf2mr456626166b.43.1792398989617;
        Mon, 19 Oct 2026 01:36:29 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm323106966b.13.2026.10.19.01.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:36:29 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v5 4/5] iio: pressure: dps310: add an OF match table
Date: Mon, 19 Oct 2026 11:36:19 +0300
Message-ID: <20261019083620.1285782-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree nodes match the driver only through the I2C ID table fallback.
Add an OF match table, so the chip data comes from the compatible and the
module autoloads from the of: modalias the I2C core reports for
devicetree devices.

Assisted-by: LLM
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index bfd76f2deed9..999ae4ce73f7 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1422,6 +1422,12 @@ static const struct i2c_device_id dps310_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
+static const struct of_device_id dps310_of_match[] = {
+	{ .compatible = "infineon,dps310", .data = &dps310_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dps310_of_match);
+
 static const struct acpi_device_id dps310_acpi_match[] = {
 	{ .id = "IFX3100", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
@@ -1431,6 +1437,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

