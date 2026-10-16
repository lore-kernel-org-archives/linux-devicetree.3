Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C34E323C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164949; cv=none; b=THz1KvEpboSec24ECrII2q2JzBA/6e5WnWqL09hH3JqOb3f+MwdwhGJBDs4qNrq7tJ9sJyWQWUTMaYr4KMbTaNtcelpwp4t0AQgzDcyEfZ0J8tmtB3kTvU3u8adurJS7AiESR3NRDTGe8k+PTOpSKoIAVdbfy1OlinV6j0na44E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164949; c=relaxed/simple;
	bh=gAjWw6G9lcSq8Zo8mxFK1qqxGDdtLdmuHsxWpOlc32g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/vIUUUt6t4Eg3Bk51Nz+n9UU+zYj05T2XWWdaVelk6NY91IObxeMxbgiZ2BXuxbdNNcFZ1HZFWKkYnyBF7kGSXYTY7UR65L8g2Mbsk+J5KY60c1mPeR7vKsjXQdvj9qMlh/1ei9zhEQRcbwsBBg6bGqiOen5rfNO4tgc3Rrt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3uHZ00k; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3uHZ00k"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e5e090746so4443266b.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164943; x=1792769743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56A80MSXyfRwi9kKSqYlXnDxAngt+h6Mj8IZY9vejNc=;
        b=P3uHZ00kIJz4Z5/zDJs46jIzzLseL00bjw7L/uWX552j6qLwegbw0QhS0TVYFflyQ7
         ZvYLvtkBv4eZvZcimQoaLDVkpxxSO2kK8pDbWygxo+SlnfhAcc3f5R8RsZPojfFrDUdm
         T5oL9xa83iPgZ5equUVjbs67774yHbq2UAPh9o6Ir4kMvLAnF6LKRzI6Aq1O6Ktt7x0T
         Phrh8h4b0s0SbZejmLkStQoRTh1Rppziiw3yhhxxUq+pZq48P/F6cBcJMdgk26Dav/Vx
         A/uWTwJ8lC0WB9cN3pe0YOcX8zyZZQMW95dUWajt86lm4RljQb7kSHFu+/EqsPz53KHI
         lxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164943; x=1792769743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56A80MSXyfRwi9kKSqYlXnDxAngt+h6Mj8IZY9vejNc=;
        b=vdOmXdwFQXDTkWk6kA+zTK8tGiM1tMYEjvnsnEWK4ApEML6xF7ET+WOQwrrifMq1bd
         Et6Pt1KBdFSUzkSJaqwePXLVAtY1xPKJpn2ymzN+iKbQGOyG8CJPCuIeaPmE0tWFaxx8
         zqWlIzSyJbm0DfJjRxxwbS3lvkMw7C77egQ3FoT/khl1d9pdnKYuKpmYTx8T1ATMSv92
         kxTFKbUkeR7RPkn3hoDvBqV6APhVjLxhLq/h7VOOeWWwu1tHdqQIZ8+p+iY3+rQ28lL5
         jTdyK7gYxbyqBdl4+B56v0BoNQV00CMRKwxe8hhtkucCYYhCa6l6D9I+9cOTP33Zq56P
         BLow==
X-Forwarded-Encrypted: i=1; AKwUvBybbOKqLW5NeRESLCHGRLpapfu2OyklBMYzzx9KBTaRcY4ETMkW5Y64X+JTcw9xojVKoZ1Sf6AulNBz@vger.kernel.org
X-Gm-Message-State: AFq9FYJjACG8D0lgHZD3OvEn1U6xvsDXSY2PULZ4Law3g5YQNvegRMIE
	eLaIXiHtjJ5r4DYsWk0YUmb4W9tF3eutZJfAWI8BadTfoneVbSm4u2ID
X-Gm-Gg: AYBFou0446ZEDCztv9uvqA9fSApObP/JBWOUnkgc7/c0eWF16ex5GGOzNPJQeXJCgjt
	qOD+TzBD0Wv1npUbMzNeUXwfF+nJuxMX8bLeifQ/EYTsmEJOscSJbANIhj85nz8HEx2HqX2Cqfg
	knS89IbVsvVZF4Fcap21dULpv1rpg3UnVy5RPSCk6Syg2JzoGvxKfEQmYm7LeyH02/hEgcK6XxX
	ol1Ei2H0EmeGQauGGtKAnAFNFDPvMToxHvSDeP6360tGaz0tR3q2rqykGszGMuNJJ5jY9hb5xnh
	YqjOMpAlPA2eUdi8Qkne2bFhe6j71DkP67f6PYqBjpEvOZYU6+jmuKaj74Tli53t99ho42Jm9l+
	QqlZbbpUIagNzRr3xg9RDzxPjZrFJyp2BQSigpmJZE3j2sMroQZ57ThjqbTvz8bwqKPqQ61F2SZ
	bJ0Gwa6H3JybHi2WTZFay7JnE2Roeohp94ruj3hDnRQdwNy/cfLMyjhxF6umHaDsK1wq3blzbp2
	XhTCSUa1i0l/cyd2KVfj7yoDGEPxHMUEiLPnlb2jZsdqY+J5oT+KykmFLiEPok1fwqDbypSWyR7
	Af0qkSbLYaSNIBckonqVNCxUSkk=
X-Received: by 2002:a17:906:9c96:b0:c2d:c739:30e0 with SMTP id a640c23a62f3a-c419f707becmr11778566b.38.1792164943313;
        Fri, 16 Oct 2026 08:35:43 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:42 -0700 (PDT)
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
Subject: [PATCH v4 4/5] iio: pressure: dps310: add an OF match table
Date: Fri, 16 Oct 2026 18:35:32 +0300
Message-ID: <20261016153533.3701000-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
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
index f2a8698e1e30..d0a2f6c6ec48 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1043,6 +1043,12 @@ static const struct i2c_device_id dps310_id[] = {
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
@@ -1052,6 +1058,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

