Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374522;
	b=cVEJnv7B/czxU0GqqMWoIdjU1hcGJzwjKzRCKZ5L9jiG5Bmn96gehLLqRMqiPcvOnueB
	 BwiQ1KiaFB79/QBNOpOcwtlls7EN5T7YSCwih6UOIpDZjcEuHJ48i+I11dpiHvhXxU4P8
	 WVpbX/qAy3TUAXq5vqzWO5LpySZ4QIzMD5fxzpQS8mB6uKRgP72ftseoxbq87K5Pj1Cfp
	 mYBz/NI/rHztEh3K8X8hBpJYwWIFX1+Q00tMcmTY6jL8U41uOJ8Sfyv7Bsv8BVh1FIKqK
	 b7QFTCM8ySA9aUBRkUpD34+NGKeZQIJrL2j6DfANUHX74ilOEjvTCbbtyZNP4uKDSWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
	b=d7gnZjZwMa9N4LGLimw+UUn4/FPGLyahmpjc1G4jSR6qX4ST6OqO1cFNWve1e25pu5wH
	 P35WibBxMOjRVUjoFEd2f35ZQBJDJj0sifLWjHd+/l/7IzQ4STSjbIOQnj7knx26Tcd5g
	 nlu5l5I9kl2vqEaf2R0uU104t/8eOkAXb1wASTm9q6DqN8c0N/+6YnqkmNo/siaCLH9l7
	 tZcVDOhKLQgMAkQ1LTeARD0EvVlw9c7uhkRxfykxzo8dugmRD8oGGBdDxWJlsTBlBmObU
	 mTlPO7DmaTTiKOeD/3IUmZof4Qmq/ZZr29w//NEJZL4RAuqdlXhNDfYCDvNOMsaO5rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OynidK4K;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EEA606A33C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EEA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OynidK4K
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so18939565e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374520; x=1795979320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
        b=OynidK4KUNaR4sXs4C9eY/rwSsK23cjX7gdlwtjh2qkjgkuJQLw8IAvcTG/MScWA4q
         iy1SZHhF9p5/nSYjuK0AvFJ70F1NuW/UcUOgbqALttsVRJ9n0ociNb7IDjbvLzxI81gQ
         z/PS/TKoWAkW4Fl5Zsw8MFcbK77l2R4AQ8olSNgoVTAWW9O/TwymYrJbyumfI7bRrBw2
         2TDSkXhea+56NLK0ZP8R01iiGyg9aEITaITErGUX7RnfSZIjQ3k6+/4nnbyTA/rlcBr9
         mExjMh7sUZAr++3hoB2yej5B7sjYKzm0eIyCY+F588P8fipxyE/LYPffRDmTJaIZtYdX
         DfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374520; x=1795979320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
        b=vKcXOhEznXmpMcw/cxhDP330QgbJNwqrZrR4vEDBNIHsY6V6HXHiy/UJXqB5V/NQY9
         0oiGwAEApvc/SgevAeJS1UhNf4h9wb+8x1LnD+Wp0gXUKDvKEzWo8SM24LiMnBvZNsvA
         mGk7bblpdeQc+B8+yJo8sI91KrlV1iHivRxeIrNOkhPXu84nsScWZ7yiMEi+hmwBQiwx
         5G7L6u2ojg3CNCJM6ZSXv3i01h7Uns6I/phXSlvQ+2Q45lNZw877cjWnOjZvsXVXGQ1G
         stI3aYPexIyKl1QCfJ1MHQF4OwCEQrV/g6u/jlXlVGRrr33qIg5ynVrDgmHc5I1+BR+S
         lFow==
X-Forwarded-Encrypted: i=1; AL+hErGzSd+tEQp4lMAfvJgGQchWfIF4fswwvf/QHZsOtitwmrP0kMsF5dELzISDycI1I1yBimhikopZyqGT@vger.kernel.org
X-Gm-Message-State: APuU4Z9zuPszCFOPpudYnwQDPtPojW3QqAaSAM6hbeJ60UuoYQZEM5zP
	yT9iTAgAi1UuM01SjcAOWtDeSv8RUh2AlXq0rhxWd/EO5b9ONnDQ6MDkubcWbOpuJoo=
X-Gm-Gg: AZFdTZc41e18btdQBQLbZ6QNugzcRFckY8i/yqcWIqkRXVFzM/4KbPNl5H5ukvoj5DS
	KTwMDAf5radwAGapmoCfuMEBgXxOCgsEIJKBYdKcbxM2mcg8VbxfJcQJrQxvlw5Bw91yxxFqFDw
	rI5ogZNur6eXUlsQvkVVZZbMtt5BRd4ehMPbslceG+MbohybVHkjZPYAiU78GxQCw1XOKHrpT/Q
	KTDLC1Cv4kfLscliZVQdprZDCiW9tvH27rUAsiNgjmsLmofG7JTUafty6JnUsPZ/Lk/icJMo7Jv
	u3zeDAaV3zt4hYUag/UPbeD0RgUmDCzv1z1RSmh7dY4jgPpn8M9mYHgXceQtbG7dckMAaO68yea
	Z32GkqP8QiLuDELK1Xj2N8O9vrUCwFF6IgVgwKMJuHLuomQrS727tXFTERVelfFV4u9MgHwp0Fp
	qnZVPxZLPxnnqIrbBjvg4pJ9Ry2yxrHqcU3kQg1ev4eOhqepdxOPq4jgIiC4HWGkm1y33dRPWM2
	zqSc7vCejvLAR/0tqLb+iu9EZzVCkQIwIBGyadpsUBkhROGvnozfmekfswDAeM6/0pNHW9OiTP3
	h4q1RnuO5eyZU5SegsM+MfWrCaMnjLRT2k2nJL3vzlCz4aJ/8qnwRvpThGGE6+EoRLAiWpmuCv6
	hnVNmTWrxDTI=
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr216534635e9.3.1795374520111;
        Sun, 22 Nov 2026 11:08:40 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:39 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Sun, 22 Nov 2026 20:08:35 +0100
Message-ID: <20261122190836.66111-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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

Boards may switch the supply of the sensor, so get and enable it before
initialising the chip, and wait the 5 ms both parts need after VDD is
valid before they can be operated.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..79015c7984de 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -64,6 +65,7 @@
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -472,6 +474,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 	if (ret)
 		return ret;
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable VDD regulator\n");
+
+	fsleep(MMC5633_POWER_ON_US);
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2

