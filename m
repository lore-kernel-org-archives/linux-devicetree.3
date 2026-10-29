Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268413;
	b=165h00zNuBJhB6tAC8UQdfKJDVLY+cwmvH66TGrvJMzGwF6wCOySHptNtfxwO1a0yxKS
	 N+J/cxN9PSAcIDUPSj7Sa8tv3fJfbMQy1DRkGAFVtdsw+jl5sU98eSyvh12xpRi0Eg9cA
	 NF5D7M7KuJzDwI4Z4x/NLOOIWsCwV7SZcYOe6gp7cUEuuQRBqG8gHPL+RdsPgOiFw/Ubj
	 wpwZGt0hCVKnFZhTOirjWzHZSVMBDGq8lFl/TnR8YY3YLTiZr800ND0ABvzOcpQ+ejPDR
	 es1P383Q2LsA82yjxvHoa1mH9Xq6psIz0TVhzMzMm9bQFAeaUbVg7pO213hjDFpCJqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
	b=aBhQSW8CfTOP8VZSBfrY9VXVYhTfLy8MWPpDtwe5Fo+l87iLI8yqnP8JVJfBeNf/NZ7q
	 68urNzB1in7FOdrpillrHoPMrkUQsUPfRPwJLYgDwhi8PKPeP1y/X1mhHv6OWaCMNY97h
	 bEHuxWGcTFGsv8q5Uy8gltAYpm3/ZOhOA5zRHHsS3SoyJ1fivPGP4kZaXx2uHuyrr0BjM
	 EmWF2MWXsBhg/cRGKPGgRu/u9lzPkiwuehxkAPhbz3b4RUM/gqQOMWnkIuk7LG34KejhT
	 ZEZORGYl4al4zSvV8oRQFZ5AGolCsGdvroPRedF6ACHVR5OvGYOw+r46LBgQ10c/Z7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arRjd7Ze;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C4606A33A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57C4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arRjd7Ze
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15816055e9.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268411; x=1793873211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=arRjd7ZeWsN1N43/M96yX5+7JUH53ssnab2jxNWq/+s1OFLYscIydei1Zwk6juHpqX
         2zYvFNLRKx9Cy+MUlvHmkcvcNHGKaUnA5mvv3HTnaMGfM7MwUIqSZlOlCrg6Mq2fKgUc
         XXuooIsFnTout7TtccNTVc5ysbDNdoaKGQgWF1oRrIKAJkSECyqyZ/xjT/13HbNr+u5A
         /FHbh30T8eBDD1negpLr41PavDGGOkR7D/63kM96Y3+QcPypGgBE1nsVEL1b4S7/uE51
         hMZWiAzXsPBZIZ/ZUdCmqpY0ibofSmLXC8u3qy6vCHH1f7lTzFfenVOIM3B70XvmcF0V
         6Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268411; x=1793873211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=iW1CVMzMZIIbUItCsifHTqj0GYxr9YLgjYBS893PiLWmDdTVD7iEvQmv/5EafxHAxu
         IWb/LM1lHrncJffInJwMZJxiaV1qnPBHgqmI2J4vJtMS0kPD2AT/yaQKaOjvQPNSkhZi
         xa+xh/BnrgXGRpsXR4dOzuNW5gWodK2czcG3WagN7LGrGnkMPqH0MnlKBrmQXNLhEe2u
         t4AkvQI/uTC3QFdhcYsXfjFZt8lTN0TU/GVDxbzY4SCNQLgwimacrcUGneS/lXzwfS66
         s4W2bginwuVSmJzasrMLF757slfX7DbYh8i5tw/JqXGPrgOqeRoosY2/bwii2ZnErby5
         LH8w==
X-Forwarded-Encrypted: i=1; AKwUvBwJi5Qpm+K34VMeCh2O26rp6KjzzkOwsvzbdW4SPrv6JWEcn9CfKakXJg3VGxcVailJmud1mmtiXh7A@vger.kernel.org
X-Gm-Message-State: AFq9FYIIMd2H+20Rs4swX4AOXkPCLlgEW+h5VGN9CvsAp9CCaRFRsfEA
	hfX0dzj9cratb+AI8B4jdK7HoCru48YcIEAJvy2kn185RsItK0sfnRWV
X-Gm-Gg: AYBFou17ysvCZQtHbYUQ9yRbXzvVAyETYz0fPSKx1MLyK3SdUcooM4R9xOv29nuzWsV
	bC7mjz3F/SMuL/1qJQ74L0VAU20KQb/xM/4MdtNlDd2W9qqTdcopNV0ezMAaB87Z8PWVMDztQnE
	4CYKeiLRPnj575xxT4u1nXRmr/KLeHXSdODi/FvU9yuOiq4bNm/UV+Y1bR8r+YEPZT61gv+XryU
	eJyI6ZtOtLKKS2i8of8Itqm4z4njgh8PeHIogvDZgSRrlzIVMCc+X1HHpz3e9gxASSw9qJH1Mk8
	LOT6z1j3Cq0ElT7ZLxTvh7Yoc4VDI60xxGrjPq+tOP28WU8ChZFHgSeJOhePzKI5hR5zPifdBWt
	p2Mr5fKD8olKhL0rU2b5hv/OJH1M5lLdtvCp7B9+RLxf91yslfyEMmDdHcnx03wAxFJ98+EARm3
	fDGQXef8N3Ufik94wbG7EehXU9EK3tdon5bPTKKptpOk9BYfxwZLqvqZd1BkMvFGYJNq7oSw0i3
	REbc0qEqeABv29xMQfZCnqssx+7FzfJMDVebAgCwoFHn0q3ZMsmeq++GturIlI3l9yHRR69TcVR
	NwQSSuA77kc1u2KY9jFkxOvLX8QcSdkTGsQeJiuhmn9ut3EasjLmCEhKx99v79sxg9tZCjcCj4e
	jaaPK5q7M1A==
X-Received: by 2002:a05:600c:848c:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a966490754mr125374865e9.8.1793268411167;
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:25 +0100
Subject: [PATCH 3/4] mfd: rk8xx-spi: add system sleep PM ops
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1163;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=1zvikwnDADGbJGUr+2C96ExmTpaaJdX4ozWbby5F6T0=;
 b=TCcmm2uv0Oq0jbsQFif9J3wiQ6uFZZOT6azcU9/u4jfR7utKpgVScfiFRlrkXexfBrw4RHf/7
 9Bb1HPxhFwfA2EYYzIpbfsEiuGXaDUD7LUMrp23QF3huhIpCcXvZ3KQ
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Unlike rk8xx-i2c, the SPI driver does not hook up rk8xx_suspend() and
rk8xx_resume(), so the RK806 never gets its system sleep handling, e.g.
keeping its interrupt disabled while the SPI controller is suspended.

Add the same PM ops as rk8xx-i2c.

Fixes: 210f418f8ace ("mfd: rk8xx: Add rk806 support")
---
 drivers/mfd/rk8xx-spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index bb85fe60518f6..a0b7d7a058108 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -97,6 +97,8 @@ static int rk8xx_spi_probe(struct spi_device *spi)
 	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_spi_pm_ops, rk8xx_suspend, rk8xx_resume);
+
 static const struct of_device_id rk8xx_spi_of_match[] = {
 	{ .compatible = "rockchip,rk806", },
 	{ }
@@ -113,6 +115,7 @@ static struct spi_driver rk8xx_spi_driver = {
 	.driver		= {
 		.name	= "rk8xx-spi",
 		.of_match_table = rk8xx_spi_of_match,
+		.pm = pm_sleep_ptr(&rk8xx_spi_pm_ops),
 	},
 	.probe		= rk8xx_spi_probe,
 	.id_table	= rk8xx_spi_id_table,

-- 
2.47.3

