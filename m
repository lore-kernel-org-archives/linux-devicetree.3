Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174586;
	b=uT+dr/x4rfDmNflxnqv2D8/Vw893Zz/IWVKhB+XXIRhh/Sz+3oDragmicBlRkzNO0P9O
	 5p0BLim1DwdhDFhuqbDrZy5guCOKL8JsIYvBU5UKjuhQWNXuycOfemOMKjALT79aPdhwa
	 UECxUBFEkKoWhp0RETf1EFrWqWi+mD2mX6Sc+ssxhRtr1GbAjwuK28sUbwKBcC4tdHpVS
	 n+7M+mvIleZkQNcCu0ZC7z4lhk3p9g9ZCdZDBieB3hj1vIvqwAnQ+TuijhLFSRZfDwgLn
	 cQIN/PrOWfjln9Jl/C9pryZTOrw9D5wtRPWLPvkeIzZX1GQoZ3xVwX5aOT5qNG4ArdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174586;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S8Pm/n09QeJ9mrcsdqqS5p/lHipZEoXnNYS0XuM2wRA=;
	b=VrDxChqRe9zUUaRFcvuVkOJhPN3aVnmdaIhy0QXxYtlOue9H/ALT4zMzztndAsZUL49/
	 fdd0jQIRhbYjxjeQBLcVlMGAk6PLpZSUHj7Lf4IlYlZO5oJ9gTfUHHHq/npQhxcInm6+q
	 KlNuRmyCIHCC3+lwTTD9m3zUQfrI2v0KvlaqpQdyqg4hFyXmCwilrBr24vPMVUi9dszoU
	 U7vICkidwGZ4fY1z4lvJjD1xYJTfPHRf9UIbhZsp9LQHMGAT5a0ZlT4BWI6rqLZrNM7qf
	 YI26EP5I8ECMxpKSaMmPLqiExjy6OKLnJ8AMUEdy9igJB0AM7S4CyQ8vKPL3eHpvQcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=FPs0blpt;
	arc=none smtp.remote-ip=91.218.175.132
Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B0606D81D
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46B0606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=FPs0blpt
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/o6wOm30wKWAccJPIaNGqqcoA4cZTpqG6mOHk1GcwkM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174583; v=1; x=1794779383;
 b=FPs0blptEv3bvijcVZdfYCccqY8j6+Aq07YuFmnDUGsWKdUJ+1R/557uJw611zy+OEaBXk04
 QxS82HyOLLamm8EBwDgL/p3Th4B1odWprhKstSYoVpLz0oDOQN4s1qdlpkIwyngzn2hPdYLYW4I
 WAm6cnSje2bzy6xvLRoxwkjtY9k+mmRiCw78BAy/zdpJ2egzeWTXOZXQSBlW8nfSrNzAFlECq73
 pT9BDs5qUulHaJ24d/LrVDMrh7T3gJ+7zUgXEgQDtczxFnI/iKKbgpkFBcQUAhyVq2FyPyRsOgU
 J40lQiJ+t498TR68OjLzNFHlwJqLmBpVcc2lbQLsPzAXg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6b83b700a7331a96;
	Sun, 08 Nov 2026 21:49:43 +0000
X-Mizu-Trace-ID: 6b83b700a7331a96
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:14 -0700
Subject: [PATCH v4 3/4] leds: aw2013: Use dev_err_probe
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
Message-Id: <20261108-aw2013-aw20xx-rename-v4-3-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=2778;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=/o6wOm30wKWAccJPIaNGqqcoA4cZTpqG6mOHk1GcwkM=;
 b=JqdK4qC1RkNkP5oe5jg8GR5Z0CTl7id0IxtRdasoGJiUERpFRDytia+GYhOoN+GIdCGolyZuo
 afLayZ16xpMB5v9gczUT359Ki9XXum3pVJJ+fzE7P9FTbB29XNbtDbC
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Failure to use dev_err_probe() for regulator requests violates
LED subsystem guidelines. (At least according to sashiko [1])

The original driver didn't use it, but it's worth cleaning up
while I'm here.

[1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L71

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Reviewed-by: David Heidelberg <david@ixit.cz>

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index a51b72de21ac..cf8e4b0a4572 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -459,9 +459,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -471,30 +470,29 @@ static int aw2013_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to read chip ID\n");
 		goto error_reg;
 	}
 	if (chipid != chip->cdef->chip_id) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
-		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, -ENODEV,
+				    "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
@@ -509,8 +507,8 @@ static int aw2013_probe(struct i2c_client *client)
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to disable regulators\n");
 		goto error;
 	}
 

-- 
2.56.0

