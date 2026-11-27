Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780914;
	b=ritSILUlrpf6/RW0NDoN7CGv5fBbU2VvYP3kX+sPrI/CrGF//W5tSQvXFQc6DqCoyQPO
	 K/AHMnQ4l9zpUaWnVgco4tsqPUGAqjVA2uZx90yIliR/9El3WZnj5XBRYPKWDyD86jKr3
	 Gu6ADr9h3Xw2a09KP6Dsvvb6NHLDypBh8Roq7Kv1Xgt5eRFEBSKiICt7BtCHprkFl/nqa
	 nd8W8lFS+wU23VDlHhZdEL4q8uMwDvGl15b0Qn8Nl3pKeMPBbPl2PsgNxsCDRIj8Kz6/Q
	 i0EvULEBBREwAlGGbDFM4W+N+6dWpVYQPbk4InA0ULBSuyNG6zBjlwNh4uq8Kj+tfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
	b=ZRHn1xUNgx+MsmP0pJ6q0Rv2To4t4sgBi7qeENX2dlGkI3Fj+2Cz/C3y9Ec/VGZHBPab
	 D7ah1wNcPRWg+gEmh/pJWBj3SkmHKKp3Jhhz0EfGDXampy76EEeFuMHHxuPIMP6/51wAF
	 UHJuk3Jfn+q9ETKAAfXs4pEaiA4LupAMljjKr7+tMOFeuKshdBlJBrm2858ddaB9AC01r
	 7BnCHlxxqlwqLxK1EAyhE7QepezXWEaoOR4CRf6/kb4Qdknjw+39zPdp5jN77kwfrBtqE
	 xQZE4Sg0r8qlbw0zgOAPjr73ptIXYE96wlHbjKkzSXUxx0PKyfmZwrB2ewFL9w8UK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MhU/aln5";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE3606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhU/aln5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so62460125e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=MhU/aln5bkzzPoOpWT6PO2DzPhAB/DGmijpQK1gmrUbqek6TRSglVXYCUNFvPAA9s3
         70+G04C+G2VoY4Aj4xngUOwDSuaWWfd/awcP5TWH1/R/XhEbnVXXd130Elltwudl2SmE
         /52XFo7gkw0NBtYUvgjgeMaB7LlKNzTIWgsd0F4y1rVF+V/Ne4v4ybtuZalv9SnE3qgE
         OUH+6YvqL8bfaIplc45veKr/NkPktYwrBFF45aWjzfRtXGB+ObwLIBOz3GhDnOHdUxOn
         OhJtKsVNLdBTgUWNqghWfsxY2R1wV7mqBbQJTezCjlNmLCZsqG6rJ6g/5wHI3AxxI6eN
         IeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=i1jEn0SovBd9zQZu03U0Z7WBzcnPVJxVrcVfrovHO1ww/uZ9EReTPHy5/uW38Aglf3
         bsQYkWvBRAoCNyvuFG1zIaXpYwKauaQ63xyq9MpGTetjaXByyW0OP8ccFKJLsA699jVu
         CWLcXpuvWneVbN7X5+F8/ngiCYi223jrPhycVLa/zpeSuZz7JFLs4cONj6DxJG0US/So
         341OG7EVUvAvHRlAKckgB1v0vssbZv1j9Xmd4P5bU/7QM6AV3DJrpH0SrqU7X9Z0opt4
         i5FYtGe42bEkXaUtE0EkB6SVZM3jJfRNyXGHNEI7KYbw4NLvxQu+RS6G/I9HUZIdtS0D
         7kaQ==
X-Forwarded-Encrypted: i=1; AL+hErEB4pl3x/o59EqU9XZgaqzlr8ztp15dwOoMPWxYn4lRgLaStjyheIfIjp6gGv3a7OAEmwjPTDKMnzzt@vger.kernel.org
X-Gm-Message-State: APuU4Z+iRd4Qx46r3YtY0MFIoaM9FZ1f9gtq93zLn2lEpZ5zqpD76rbS
	1NF9xWHJpLTDR0Ua4pX6BCJ+jjYTTdkaVatU0L/yHC6dcTrqnBZ2Yv6F
X-Gm-Gg: AZFdTZf5bZsoOFEsWzAmwbaKRbeX+25fy1eBAQz34It/zv70+jK6dTmi+g2vyzkgHgY
	liECfuewURl9unf6x+LZBOavM8BTJDeDBPkecnZFelD9J8fT0GudXGR8Vp4ElJ6cR78XKaFGBwg
	+6+0i30MLhOMnUvoTqQPpbfMv6CRVmlr5AHU+5620OGduOOZ+QkAJ0Lazza/0hlrAsLip9CpULJ
	g2PvQrRqCgK21o7wLwK1AmDGrHOo+TZp9Iq8Jth+8q00TnldraJZLB2CI0l54TB0GHn9xFr43KE
	ulM9BiRGBnFAGqjHmv1PqMEpiQC0vARaTdIhG5pit9ZAubEJPr2nL2m1McLeomyYuewyO3tn9sD
	kMASXP5U0gyU0ZtAeKll6iNsbyqjEhLhHglSrcoNb9+u1W8R6H1zKPL43+/i81UP8HgCU0fIn2a
	mhVo2dT3SeUr3tHcleDaLGa3fmu5T+zFiZIWUYx/MRztdiKMllFMwC9gWa3km7bMY1UQklw5qfr
	rSVW05KV7F4HsEZMnI8XKxeqRkH9gETb2oy1nQL1ggW4NKqNUr+KvoPAZmkR47frigIQCMV3BL+
	eKEIcu1XuXNOKeYUiybl27TNFWWfTLtuZBn0AU8El9uDUxg=
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr475302715e9.0.1795780910582;
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 17/30] crypto: amlogic - Add support for A1-series
Date: Fri, 27 Nov 2026 13:00:50 +0100
Message-ID: <20261127120103.1532882-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This platform data also can be used for S4 as fallback.
Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 08d89db14788..3a6bac10bb04 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -298,6 +298,14 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_a1_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -311,6 +319,14 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,axg-crypto",
 		.data = &meson_axg_pdata,
 	},
+	{
+		.compatible = "amlogic,a1-crypto",
+		.data = &meson_a1_pdata,
+	},
+	{
+		.compatible = "amlogic,s4-crypto",
+		.data = &meson_a1_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3

