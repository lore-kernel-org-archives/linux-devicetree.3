Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870013;
	b=Z7xCBz+uKNQuJhvq6/dPsF2Jl2mpAiUVFI4TGiwKXpb8a6S0VeNBrzcgM/DH9VX03lIc
	 chBBC3UbWw1jmCoM1bCtAcHOb80WcVNXpG3k1noYvmW2yW8IEBVuD917iNsZD4hEeGifE
	 7w0Jb69jAOMf2zG7QA+YhTJqN6ebpGNvu96ttlwCuwJ3mtJ/+KGFOytJydgOsYoEMqfu1
	 n196KOE7Sp1IPqQY/mK5ELZDDQ4+y05sO7rZo9353Gct4+3BWXQxHOqaSW724z5Ct27de
	 EY6+na9Q7VgS6MUOct/Pxyz1l9XRFkMmLsbXnd20VKhFoQycBbVhGE8XiTbnBzb9gYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870013;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mqKCpqc3ESi02u0qt7HzlcluWKxVbZ+aolou34tE824=;
	b=B2QB1/dsM1eTIR8fZyU0ecpl5BDly5FvMj76M4ahb664o8HMuJvAiavgeI3ivUpTM4d+
	 UnFbositEHVgJxfZNocxUOF+j/9/5esKXio2Rynk1ZVEvO0/qifF2QSew6PTPHTC/MguI
	 IC1SavQHkVa/+/PNmdZQ5mXwbfryHiQ+nAeCqCMTincFYGmsJ7wvVwGfmQqxaAO9htbTM
	 idGNxCwRfzRG0ELIJTTTvN+J8fXnkL/jcHC6bG7j0lFN6vQ6ZTRWa5RmjRtef1avi2EIf
	 RtC0y8sVWfmW5Bhg7FMpK7pauOfVZSeHpuqgCHUVmxU5DnEqnfKJV/eE+f11o6eJpUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7060A2601
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B7060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4e04eda5aso12125527b3.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870012; x=1795474812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqKCpqc3ESi02u0qt7HzlcluWKxVbZ+aolou34tE824=;
        b=BbEiFz0cjyPlj6gInXcjSutGYdDWKIDOkNFBmMnDatt5Q7boN9OAWOT6C0llQbOQpe
         rCaWXx4sGVtp52Xdb/NEqq77wk5IAzBJ5Xr50GC++0k0bucxfAegxlX+7OtS8iI3UrIw
         rDB92BKhuN3A8xFttBm2JHM9Di5JccjKlK1nhZGsc4EUJY9kNIvqUOkD7jpyzEBsmCJN
         IgwOHD5PXLwGnGhYqqCrZsxAiGHpXC+YcLusjqwhy0RPrtO7/7tefn3pWvVbb+cCkiyu
         RgzLvKp7QWjElcgqquURDqOP1s5uHNyHN3l/FgYqnd+PPja7FeiJqi6giWN/kASYLSHp
         Mr2Q==
X-Forwarded-Encrypted: i=1; AL+hErHvpuI82DdBxi/gB+Wh1/p1/HRZ6GbvMJL51wFMcaN8RcFIk9tyvsKhcHogCVlE0C1fhGk+v7NZsbXt@vger.kernel.org
X-Gm-Message-State: APuU4Z8KCP3FoBRMNJ8b/5ukKv4VoTGfjeKNk9o4yaOadBy38oyf4eCJ
	WvcjO2q44YKZ6MY3G6IYe2uVRS5D1CuyVRT/d3IV1nRLIg4lVtjg7KPg
X-Gm-Gg: AZFdTZf/YSZDp5mvfozoC5ARqJQZXDHnJePOaYG3dcI0vBLFujNPH3dlG00xWBWmo1H
	qhCPHWJwfWsKECO7SNxxuD9YzyXKW4YbVsjiR1jjBntLRlVm6rwH+nTvG+VHemznEI1pHX5M0gs
	IAvoackuAaXiZ9B2dwMe8kedH+tilB3f1SLvgKAcRHqfAaeBNHY/DbOiiKXRPpXV4tGMNuUKUal
	aE5riMD4OAoPL8IkFryc8rHugiZ7t3xDUzXb8KOi00IrbvSJzRcrjjkuFBMqqRnJNBNtN38rC/y
	0sMDVqROfqyTLLBU6sGcI5yyDGhC3JG8MZ09l+0QHRRqybzlkACoIUIZtxzm9k0yBLgfJUD/Fr6
	Aj9Vpcwmona2RNFfU4rQyr88r4XtZLysGIu33GBRbfOfMlEj0sNTxC1mJ44YxqIc87yHUI4mky1
	Kt8Q2vWcYnBBmUyUoURQ+Cin4oJS7BTph5O/Z5uBLXSPa382rQpDv3rl9sxJPj/CVhRefv57pfl
	U2spZRuAUTyzK6rX7sITpPGzDuZ8oEoeeyVvpuDMD2X0KW7QgzZ01Jt4aisGssV3EX6ShIIKSWY
	xZqPEpgJ+20UjogL6VatD6jmanzQf8j72Dp+nA8J5kdm++RiEfHQkTkL4+bhAn9ZPpHUmoLkeDm
	aiuXUMBX4diUzOJwNPKHOi6dU37+ZCEt4
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr64991407b3.21.1794870012557;
        Mon, 16 Nov 2026 15:00:12 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:12 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:53 -0500
Subject: [PATCH 4/5] iio: potentiometer: mcp4018: Turn on the vdd supply
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
Message-Id: <20261116-iio-ad5246-v1-4-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
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
 drivers/iio/potentiometer/mcp4018.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 53471bd24640..0d80bdfdf243 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -17,6 +17,7 @@
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #define MCP4018_WIPER_MAX 127
 
@@ -167,6 +168,7 @@ static int mcp4018_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct mcp4018_data *data;
 	struct iio_dev *indio_dev;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE)) {
@@ -174,6 +176,10 @@ static int mcp4018_probe(struct i2c_client *client)
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

