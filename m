Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9E4EBAEB
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890514; cv=none; b=Irp+i73ETquvm1yks1bjSArbCpX0MKi5rH6H0goR1djtjwtc5IqadalNRA2qJ4lxPkMUQHcsLLEqKSjBR9fcN6vOqaWaOA5imfucXx+KznwlJGL+vrXAyWL79glQEU5zsdLieF6zi1BrtXFIX0wUkzLTRO1dGKUtR+eHsfFJXrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890514; c=relaxed/simple;
	bh=zMbMI1iPl24pAs5T/eaw5EOzPDqLoofRmlKw9qDv1E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI94fXRjGvX6oq07W+3AhPflaYsVqZwBm0+keVhlwcB4G9p1st660hZ+d3lMf+CZN2XHvEorsYfAvRg09zj9SIpX9jqAb2D7Jf1tMD+DZqprAGnwahz4mysa/e4iIQlfhEgiUp3yLswrPYgiz6DjRpzoy4cD0V+FDpeS4DsPBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnJuT15U; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnJuT15U"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2131905e87.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890510; x=1792495310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZBikVK3qvt9tK1Q7n4ziWN1MiTDEPE8C1CFx11XlAQ=;
        b=qnJuT15UdlpKjiaPx3d5nfCrLJJE/t9RIbrsu/c/kWW2qqNcqM0I6WBM8PRbmqjnKG
         ZLfepO2z+tLY7xb4QM1CP47TvJyeiGGej3oG51Eu1U+MsW2w+wOaVQPGqS/LBb75A1PF
         0SiDgoUa1VBx/s2wFvzbAFxt6dBvLDx0XVkqVyfsdfMAT0WLmYjLYsULvSx20FxVQu2i
         AI61lyyObXaITlRCrkid0to6x7ZtQR2oYfM6MeFNqp2mc4k4dkRUs07ulurT9l/IvW5+
         pq03fKpw05m7/hhH/u4wK6zxdxxFq6Y1HmXWIJx8kejk5LE81GvnIk5PsPGlc0oVMnMS
         Iv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890510; x=1792495310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZBikVK3qvt9tK1Q7n4ziWN1MiTDEPE8C1CFx11XlAQ=;
        b=WviCCH4hR6XfbT0vuoYDUbrLfsdHjMdMv/7X97L66gmsWd3rHgxcLZuNdTI+IYYL8G
         ItOSK9AH7aplXU9IJ8TOfiYCMyChzudRu1/Iz95UzitWdj1fh/zOSULueUyc/bndo+u8
         98Nn49mekGLwDL3pm9f0iEPu58hXJh8eVvANEoUK/fN5iqwBOZ+mdrFyIhMBFp1cPeqS
         a+2ZOluL9Zjw3L+sOYEa9GNxYXeKUCSvJldD5EBGjoemuq7UbPRL8Yk/0JtQpwIgbvjw
         cmRhJF0E/E7d/KPrZeGXd6oroDAQpJNk67YrsdbG7v7wz1IzucpLAKFksoLZAeOG3DeJ
         iXEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpdxMBrMuPXAk7liPu2ubPZDxusozl74UnDXE+LcWvQEaC0ysdSGRf5c/IBabXla1yiTtqjY3unLbR@vger.kernel.org
X-Gm-Message-State: AFq9FYIz56khvUIRrUvCImtcFMib/9K4phb2MRJWuRNjAUmEnzG1ZDpv
	USDSY77w2zMsleHtKG2TxobXKSF/fhNOT7s3tjUEtrgvdq+LCw25zfNY
X-Gm-Gg: AYBFou0dkJBkaM23uGYe/tgrz/eoF1njgyVfxtd3cd/jcYYY5PGODq39vGhAbhoqKcT
	4XnpnKi3gCxkctOsSQdjngNfP9qXQPFUO7KdI1pjfE+3Nf0UDZRkAR/tX14Q1P5ItF3dRdwgGEL
	qgnaeqHX7on+X1dsfSxlE7RbkpaBb4CWGg8kB3WnfBGmJpVlWxi9ITemlmT9lw5rAzGYMNx1r0/
	c1GkNIetvDRj7qAp0kmo/kJfNNSj2SJqF+95lfhj5faYrZOofXXjfBoh58F+SFtm8ke4A/aYPTa
	2BM5Kq0c5MbKRuV/LYphX72qw4+eypi4U8OhBh6EHImL3A25YL2FzbQQrtib96ZSzqFOrS0lxcp
	uW11fgGXASvjnh3PvDCikhHYqcR0Ic6Hhs9wzu23X7SYa4ZiWVBIe2k1QNmdqUspdQ9u5PqmKIA
	KzTs9yxtci5Gfh36K/AyFDe7/kszTsD1lAWB/7jl2IpaF6qwdINOgFBM8HaUoYbXYpXBYsH3eQP
	G4KUmqPdLKU8J9AB931jEhbit0KS+rv3qRwXi99WjV9ROKp1TmCE3Ad0vQrBH9h1iUJtxnSPMTk
	CMVLRblpl7aEhq4uLbVmSXUiWgRZmvXNYbWRZw==
X-Received: by 2002:a05:6512:108c:b0:5b6:1a7c:fd8c with SMTP id 2adb3069b0e04-5bcde8cf921mr4238371e87.50.1791890509803;
        Tue, 13 Oct 2026 04:21:49 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:49 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 5/6] iio: pressure: dps310: add an OF match table
Date: Tue, 13 Oct 2026 14:21:23 +0300
Message-ID: <20261013112124.1878296-6-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
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
index 0d558edff5ab..3b27a61b70a5 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1045,6 +1045,12 @@ static const struct i2c_device_id dps310_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
+static const struct of_device_id dps310_of_match[] = {
+	{ .compatible = "infineon,dps310", .data = &dps310_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dps310_of_match);
+
 static const struct acpi_device_id dps310_acpi_match[] = {
 	{ "IFX3100", (kernel_ulong_t)&dps310_chip_info },
 	{ }
@@ -1054,6 +1060,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

