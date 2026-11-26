Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724570;
	b=VJLyX/4L4Dyb+CU+66475xExyw45gog+o0RqWKafk9bpDAt76JywVvutAHqvy39ticfE
	 Z98qnln4KPxryzqUy+1T0riHKEerLqJzRJtr5nyb18Ook5sDl+tzJIcwx0qaYSQf9H2jH
	 dDx+miqekux6SjQq5YBHSgbAe6oQtam07gs3tfOHfB5p0dr6/L/g9DiEMrKmfP929xoVN
	 qlvATm13I9nitWF2M8Yc/2OYlVrgTesBdgadO3RmrSyyh3RkFEgVD4GidUoPe9jXeGyFZ
	 i07XqxqC4oMnXw+4t7Org2SXFFLBYpAqq1e4pGzVcvdsWNlEpZ9j9PDAJbg0NjuZnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fhxain2YywlROt+HsQVshfCTTw3zRWPxa3M7ADWOYi0=;
	b=gE9RTJqodOFtepXHUl7F7nkHZrdVq0Sy8Tli7MtquggjHb6hAsjr5mx8St6KQ6trfDLt
	 Ka0Usf8V3LU/0vQiVkUsKai7kwtfe/Aylyhhd47K56t2iB18MrzZ8S1O8zFqTkLMry7Pl
	 srM94sfvxewqWj0vE+3Wz/1Z1iqerg7TUq9sgI9tWdUjs2bc6b2RM5tJBVcw7xQUg/h7u
	 MdQForoZfS30UMLEIru/IsLM2HaqkU7EYEMqiF9Uf4I+4NUjF9Yz17WWrRLKGgs5NLLit
	 3nMEsIiszoSgbGAorum8l2Hxt4clPQnB6oR4BBoql858CV7aGk4MpMQooPtgFSgCUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHAKQB2H;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA32606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHAKQB2H
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5190041eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724570; x=1796329370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fhxain2YywlROt+HsQVshfCTTw3zRWPxa3M7ADWOYi0=;
        b=qHAKQB2HDfISnUsEFEbYagPwsl+S3v0RYK+puj45EP3eG5kE8GRsK+2F0lSwdyevX4
         OFa55Iwh5ihYdrd5TbbnUdUYg7pf/5fVtKDD30NVWkYb7TjQlR9s+xAOzsU8UvP24+CV
         nXPZbbrGXcx7jjJO7JYfuzwn/pciXu+x5n8rCu7eSCtFGTujCEkPNoP5EInByyCG4ztl
         IOYOooKC5V6VITGnLxm1KpGljbR7CZqnaZ/xX30cyMY5T1XyZIcMYdiVMU0i2aT7dyf8
         0xS9RdGIcrNzvty8ebPh8ou1xYs8j/oNjCUmosR9DqM/4zmIgpztGpKytM2pF4P063dT
         A5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724570; x=1796329370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fhxain2YywlROt+HsQVshfCTTw3zRWPxa3M7ADWOYi0=;
        b=1KoDCCtz8+DFKaAfAm+L23n8qb6utSsJ5YufuMOG4XpAW9fNdJM3qp6e+5Snk+rbrj
         7vx5h7Sk5oY3zb917ui6ZYZ7tIj//QvTh5v6oT2cuxiGEWb8220kK3j/1SxXvQ1rw0zC
         Td9IkGpncArDyZ0udh8w3iockZYLVIwvJBa+rkbhnOWm60xH2ZgcmGpxR/dIl+7YlW/I
         XMU2Xj4sstDg/XI8zzBDXnoso8YhqoPEt+uOwD9w5RWYrx7MjDNnd+UyCspojM771ZIe
         jz5Gqo2CU+vSS1dBO2BoWIkpbho14PSBA4KximD4flO8xnQ5CXbg8/mKIS05/l4NtA62
         LaOw==
X-Forwarded-Encrypted: i=1; AL+hErEN0fycPoShhVinfrjOP/i9YcleHZ/vf8YZRXyhGiPQsUp5RC+O0HP6KJLmAuUefFPETbWCGEan+iuC@vger.kernel.org
X-Gm-Message-State: APuU4Z/mVLlWSonwzS6c/UriaT7OpKSixyPItSPL58iOQtHSd/wRePTi
	tO0k8ZyZR3EDuDLqsMHIF6s9IwvPUWIPEwnmACk4LdF3JWqWK0XgjIZR
X-Gm-Gg: AZFdTZdrtI85u+1siGsoPN/3oHALou1R0i6hP1VhHeZxU6bf9XgiZEU28P8nXtAJFqI
	TqtxexiQMOJ1ri1Hhznd4IO9PKDcoD8WJE9ppowi0Fw+xU0yjnfL+8kpcQveMkuiTsnanyDI8Pd
	aPmiA9nA5/rzf29xYLZGVBrqclJt/X/lK+QDbK92nHgHZ/jhsyhckLWnE24SrRXDLJx/1JWjGwF
	T9+UVm/BZHtUAIrTpRHy8/CDlTowVfPcJ88J9pgUldRYjNylwa6baTZjGCuZEtGBO6i2Mtcmm2L
	TLY5r/gGrx2yaX3Qwvcj//YDVoBlvkQ18WLWq1ElWCbvmLiTj1OlRKhJZ0sg5Y8IMmk8cGEezku
	JUqkmkvDwTjmWNRJ6k1OYJFN6/bOWaOl6RP2oeiJ68GDzWtGfcmJZpEVv/Fxhri/42OKccQIFR6
	JUy0I/fB6nbutTDIaIOtYmghFizUSHA+en+OpBELQSIOcwSW0yMmetQQCcXLgkm2KO4/lYWpT9s
	Ftws5lkqduAAADsO0InehzCmt1p7DHSJM+IsDN5ymo7Dc+O81z8px7qh1UhZxsGMhFwLC1FH2JD
	31aqiVvTyQvRflH88WM2Pa9vo8Qd9fakx1pqs8oDFGRCjKrne5L7d51KgbTggYjRfSBnqg==
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-3856f14bcfbmr23765269eec.8.1795724569620;
        Thu, 26 Nov 2026 12:22:49 -0800 (PST)
Received: from mrprachoday.bbrouter ([2402:a00:402:9f97:e752:d178:849f:9d04])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm73987372eec.24.2026.11.26.12.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:22:49 -0800 (PST)
From: Prachoday Sutar <prachodaysutar7@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pali@kernel.org,
	afd@ti.com
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prachoday Sutar <prachodaysutar7@gmail.com>
Subject: [PATCH v2 2/2] power: supply: bq27xxx: Add BQ27Z558 I2C device ID
Date: Fri, 27 Nov 2026 01:49:59 +0530
Message-ID: <20261126201959.28743-3-prachodaysutar7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126201959.28743-1-prachodaysutar7@gmail.com>
References: <20261126201959.28743-1-prachodaysutar7@gmail.com>
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

The BQ27Z558 is register compatible with the BQ27Z561 and is described
in DT with "ti,bq27z561" as a fallback compatible.

When an I2C client is instantiated from DT, its name is taken from the
first compatible string, so the client is named "bq27z558".
bq27xxx_battery_i2c_probe() gets the chip type from
i2c_client_get_device_id(), which matches on the client name. Without
a matching entry in the I2C ID table it returns NULL, and probe then
dereferences it.

Add a "bq27z558" entry to the I2C ID table that maps to BQ27Z561.

Signed-off-by: Prachoday Sutar <prachodaysutar7@gmail.com>
---
 drivers/power/supply/bq27xxx_battery_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/supply/bq27xxx_battery_i2c.c
index bd1d5d046..6c0cea193 100644
--- a/drivers/power/supply/bq27xxx_battery_i2c.c
+++ b/drivers/power/supply/bq27xxx_battery_i2c.c
@@ -252,6 +252,7 @@ static const struct i2c_device_id bq27xxx_i2c_id_table[] = {
 	{ .name = "bq27426", .driver_data = BQ27426 },
 	{ .name = "bq27441", .driver_data = BQ27441 },
 	{ .name = "bq27621", .driver_data = BQ27621 },
+	{ .name = "bq27z558", .driver_data = BQ27Z561 },
 	{ .name = "bq27z561", .driver_data = BQ27Z561 },
 	{ .name = "bq27z746", .driver_data = BQ27Z746 },
 	{ .name = "bq28z610", .driver_data = BQ28Z610 },
-- 
2.53.0

