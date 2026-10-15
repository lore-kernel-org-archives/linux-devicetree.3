Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D150C286
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061398; cv=none; b=NKUGrTS/IJQaqrpCAY6xPfJ9LbqsQLwrlKZEyolCiokjdp4iN4807cv0DL0lj+NGeEmd9v6eGLgSQkp0CF1hxCB2lahR6Z//2gtXRa31kPty/utUB0k8Dj+GHOnybRMn5315IcJDEsMP7zC/QLFKih4O7cLe5U3BEoevljpJMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061398; c=relaxed/simple;
	bh=BXh2KC/D7GXQthn8khp/oBYxkxEzogKXXCzUOL6Vc7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpF9OaM1S1I2kzr/1NSO9ynRx6tdXkUgaPrxGWKlwPqBiDmnoZbAk6ap8B4BDdHZ1MQrFOvodEFn5G4cpJuzL/FqUS9vZ73MinlGWCUpYNxelMheOBybx2TnWOECrEejhoQ1kl8ltcHfJqnQk6kAeCPqY1XF/nmhVKV/PccOEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXrAqUqy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXrAqUqy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2a4e013a44so316250966b.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061395; x=1792666195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9TQ/rDTWNb6jj0ZIezmBlxAzwTLhuF2EhGxHk6EpcU=;
        b=JXrAqUqy1dylQTC1FPsS0DwIvjLMCSQJWX9dLQcWGybNMxF235tV0wd0DSDBCWEe47
         cbrVKvfNfdjyu4deDSJ9JPTP7BSXnUj141du4UOhUtKcBV8oy3ZzbguOeE6ZLPVV9t83
         CqDSFaJy8Ple5zFEUN916qXYl6S40Wy5WUylYMtTOS1qnoFDYvUvoDnbyBGMDsJ5j196
         IuN/DfJn8FvQfrAkHs0frTwOAuu20EExr1Qav1/Mp6rEqfWocb5T6BRIDfbxkPgdEA0t
         dYBlmFuvrTc/P71Bp+1Sp5GExU4jN/VpFv4Iw0NPf6V+zuC//XT5W83Nx0ILIoAiZ7PR
         tSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061395; x=1792666195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9TQ/rDTWNb6jj0ZIezmBlxAzwTLhuF2EhGxHk6EpcU=;
        b=EDO0yz8wRZ3FwL6ePYrehMRNGOaNYNdLMNBaZiJ/m26GW1HfrY84kZ1bUlifHpYqe2
         2fte+sALD294dsffrUWyVPGGRnnK0We8Ia0qxzPazBv/Ah7lo3xMipi0qP4Pr5OHmva0
         QTID1vy+gXd8xbGYNph9IdeBUPpHd9X4CcIPv2wnaFIRpVpa9ft5ohXAeTs8m+K0bGq7
         Rcy5CT3gv5vTZEUqG30cxBtT5vfqCBl20JTY8V6zTmzGxuVr1ncttnvgKlX6GTSKuSjW
         gKDBy2pRWyp0iE5khpca+HbBC2aNVyXsGYVURuoPj8mpS4o4bZplGuJ4vA4Xr/pI5z84
         VZtA==
X-Forwarded-Encrypted: i=1; AKwUvByG8xw9+Ul57IRhmynmPkLLo9SDhq8+lNVL3V7qj+BF818GFtA2uBy/5kRy3csx/Uj6xsszcm4d5BRl@vger.kernel.org
X-Gm-Message-State: AFq9FYKtScJd+Npf3Pv0m1+uJtNpIp+mEkSink6kirspnP8NDvJs0dd+
	0OsFyFf8asuTgKcSgY2kq5eujWxhsPDwyXpctPQRvz1oPTPcKjPwtYRc
X-Gm-Gg: AYBFou2F8ZYTNTgCTIKQQkmcyKGjtHZKzgbwa2p9dpyrVZgJK1II8jWK7UWj2PnCRpD
	V1ejRbXc9Qd2EiNraIFbt4POee9VOw7kDaW4GGLQ11qb3t3OGMiZOr9yLc6AsmtVL1WYNlGU3YP
	Vujh3coWgu2BF8zXpj964rWCOmEgXhc+kcjavJdWdt6wVvV1/Efv8peLZLQPwbOWwquqwzVN4Bu
	SfTzpeN4jo/xdm9DkKsQHZ1KzOPZLcNn/vj/h04eymtqBFZMWNjyGJ8dIGvtXCS2Ko749S2RNv3
	dz82czMOEfCNlfNR7jjXDkps1Z9YDWR7KVQ76w1dePd+5/lgwJNl9iecJd670jAiiXO6w7hR7gi
	0DYkoRxpZvXZRBCcdKFVMbM00hbmrxSpRzWSZD+PElDSpGeEX1yGBrUwouQVN/kzJcbzltoq0th
	XJOjZxB7/G7koy+UBKr4SvFT8vDJ+/xnChgOVymoN4VcTRyRrfAHmneCAGDEL0AzLMZGNxu3eGL
	9J4/6pe9RRrktefgdJ0dP5XodMpWK+FqcIl87Q1EtySslwL+8khA4SX3cBEikLYaFtaLfEBLfax
	btlqpXKa3Qo0g04njfGmZTbpXOM=
X-Received: by 2002:a17:907:2d21:b0:c2b:7686:4d7 with SMTP id a640c23a62f3a-c31a9ff6976mr1704835366b.39.1792061394794;
        Thu, 15 Oct 2026 03:49:54 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:54 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v3 4/5] iio: pressure: dps310: add an OF match table
Date: Thu, 15 Oct 2026 13:49:44 +0300
Message-ID: <20261015104945.2687162-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
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
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index aa80d106ac44..ad3860d11592 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1042,6 +1042,12 @@ static const struct i2c_device_id dps310_id[] = {
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
@@ -1051,6 +1057,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

