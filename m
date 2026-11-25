Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638160;
	b=yzDlAzu/BGVFvvZ2io98PJHm0gRzg/B7lUJrYmXQgRSn+9KanXw4a4luo0RJmZ5NM9KG
	 2j9mQghlC98jMmZIVlMFn7HxPqqWrdR+BDgHQHVayZE+zQGlCIBwdRgIVZ7jHLOF+Hvat
	 BZbfvzxwsX+8ayqhgKIVS6FGlUhKxA0HqG4/pPRZrh/KqQFp5Q0BqgRNVHA51RVzXu2cw
	 k83zipC0HZdbOOgEHX9esuuqQuydvbJJDu2n09CNVZ89qDRFuvnncyaki/WBmvCyhsvcV
	 DmAznHZJHslBKiDYY5/ka4tiKS5gvGaBKJz0pn8iXDmBogb5q3PnkjOgz6z/RbVKrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638160;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pgnUeUO8I19NQs/CTfh4hJgcQtU+xPIOCdAi0uHfl8s=;
	b=NDrJGgPb7BfJyDzAI05lXhIdQy1mzm7vqEekGRAyWEpRRLOKTOBPmjNhgjn8zvy39zRN
	 WgSlddxP7uS2rQin1MoJzSi+gkUENxLrfR0tvc10Kj5v/V2BDMTX8UnNytdFW3f0u06b6
	 V9oQ6qhpBZ84YblYLNKuHP249f/3AUt3owYdjYJ4wOrlCaufzzTrTosWfd3XFFp9bDPpr
	 jOTUjHNJQ82VINLhusjRgXRzXa6Hl3cFYBEH7WSdIW5kS6CMADKLMIYnlwsktNA2RRwJ+
	 az6V6wQmUMLUw6DK2uL+PEz5++QcLUnEWCJw3KOw/+Xp13oxdcmxTWsU9XkAWzbSyEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50928606A687
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50928606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db3a48dc6so7535346d50.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638158; x=1796242958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgnUeUO8I19NQs/CTfh4hJgcQtU+xPIOCdAi0uHfl8s=;
        b=IIRa3G8vR6Lc2/MjzubQ0HVK/7+qD2e//Ixw0yMSTqh2U1390k1swLG9k67sEpSPs2
         hpbaCo9AmS8t8OyFLq3ssnYgl5aZc3vsK0d7uvPBEpXF9WmzGfPKJe9gjNUB0o/F5Y71
         52Qen2sI1oNewIGxG4eSyI0HjJV95bnSdgkXzo5FX6AbuCil0/rZuX4BLx588tpiKnly
         rVs0PEZZrVoAAJilLtinDfxO6tPM7j1JX382yuaCMllxHw5j5Ef7xKCBRK9bn61eTJK1
         7O7HBzar4uz9EcHQAPi9sngDSlWLsE+l4pRSxHJP7MlYxBfWQ9C4aj47cmbGF1jxVo8M
         Pu6w==
X-Forwarded-Encrypted: i=1; AL+hErHxlMyBjoVgUrEF8sDWGbgy+zPJPzZiR/ub/wdJPrRMGZRJaw9t6OjoKnErgQzWy8VBvt2umGz093Mm@vger.kernel.org
X-Gm-Message-State: APuU4Z+bazkAleruB754Onro/otyMZDBSTq+ffyCAWF0+YwoWxTkNyLO
	pZ5O0agX2XSyG+s3M7L8R2mpwswqRNIJEF5kTdwQDbimoaF/Yj0qFtSQ
X-Gm-Gg: AZFdTZePnHU8TxuhmI450/NCX4WbxAedqh0Nxm0ZCDApwRh9QYKne4vorbhe4VWpq1F
	67PuYswgIaYQyToMEBZOnYvNUPHG7OdMNaXEJ2/0j/9jwo5gN8NGwHUfwZCVHneLjxY9UEWcbYl
	QtnDahuEXVHT410HokAZZ+t/G/RWJ/2EY9eVy17eMtjVCu1zWyjMy/jTCkGTKiPOFUcJcnmmQA9
	Uvq1Voz3FNc0r3gPEJnJCfFipXrmMeKg7+HzWQ3DA5nILEx4Uq0BjReSMivfEzOUo0BsPj4X+NU
	eNpVKcI+bcEBO7cpg+xiRjsINNPJgufgf1p+pDS/sJ/YLeVC+/FnxWlzak9yJcLbw4eIhHCwokS
	qNA0GMIS7rrvVgvtSy4XJABvFHHsxTM4xV2XKcZvuIQyDVnywlXh/beAu1vSKJRGjQb8vOr8WTr
	D0lhtlebeSkHr7AsJkpsTH4HziTVanki9BKe49hQ0kHOyrJIt9t1IHpZHyq85S2rE+0LYKebtNG
	f8JrHLBHVp03YAJx+uP3Vq7ZkoPc/diVAxJQlu9+5TljfP29xtMA0yqWWe5Ors0D+iEmkS1RnaE
	8xruF0JY0LfaPHoJqr9dh0uNVVZeDbuconIg04a0mFA9gG9dtBZDGn3tGWBx1FtD+US5XGjDmkl
	/K9XOXaoRJMIVTPWNcjZxnW3M7qhvQq4B4SMo+KUeoKCdVkcsvlABBdB5F41KvFZEhAQ2uYz+G9
	WVXHEtsftged/hYH+ogP50hFa4oxIMhuQjr9/s2A2Tl3J7mQ==
X-Received: by 2002:a05:690e:1905:b0:675:33c4:52d1 with SMTP id 956f58d0204a3-67df42b5a2amr7810425d50.6.1795638158345;
        Wed, 25 Nov 2026 12:22:38 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:38 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:31 -0500
Subject: [PATCH v2 4/6] iio: potentiometer: mcp4018: Turn on the vdd supply
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
Message-Id: <20261125-iio-ad5246-v2-4-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Get and enable the vdd supply at probe, so a board that switches the
potentiometer's supply gets it powered before the wiper is used. On
boards that describe no supply, this gets the dummy regulator.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index d6387645853d..6ca6cd7cbf71 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -14,11 +14,13 @@
 
 #include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #define MCP4018_WIPER_MAX 127
 
@@ -169,6 +171,7 @@ static int mcp4018_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct mcp4018_data *data;
 	struct iio_dev *indio_dev;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE)) {
@@ -176,6 +179,10 @@ static int mcp4018_probe(struct i2c_client *client)
 		return -EOPNOTSUPP;
 	}
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;

-- 
Git-155)

