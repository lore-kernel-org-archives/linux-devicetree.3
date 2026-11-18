Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021596;
	b=4aop5wcGT/XiKc8NqK6wXFXnwl990RaLwb86NehQfElmkG5Rhl/3lwIEZJIkmznF89Ob
	 NY3RcLmNIPRLO1N0YABOEzrmT5bIwEz3yv9Xe7eXdhUv5r1wUBiSsxplshq7wRCQl9ygL
	 7aeVzIRg7NVbXJlos3XkiQHpC2tKt4kWszm2gcQZtu9Xdh3TCM3Yoh2YfDQ4swz01fEsL
	 9bHk/m9uyIW/sMFuOAGzCQrqjfrFvx+9LYPmA6Ax5VtbTihzKqSfHRTZt2rZO03LBPUV5
	 lKFlsh4yCS8TonYKh7k5jCFVQD6kJbgi4EfaA+GAw2HfxdAh6DXNsuuCUcH8IyB6NmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021596;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=elKHTzTBp6AxJbdkes9kIHZiJAB5CoNP2hM+T9tGjoxGcJLcQavDyS08BrpcekNiZLoV
	 6uwYsQcfLh3dd4GwLQ8+Ny1J/YLbjTgO5iPEltuFiD2N60+dhzRuJD1tClXCNbbq+3V8Y
	 EkkXQtaWYHuCbQuy6NaJnWrA2n5L8AHI0ZLMVL/WSVuY/rzTaOlyUlJCYBA2+WBxNRgRU
	 rc/i1JmX+Ti+yM59NjrXSkU6iv7vhZ1/ZWg2gEf6yh2DY39pHlwYbgAgYynnkMD46q1ln
	 85cVrXXpwU+j+FlKg4k+0LGLPGwhl0m+x/cH75lGjRETqQFl7UaJmZQHe8KzkCB9dBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GeVUKz0p;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1060A2622;
	Wed, 18 Nov 2026 17:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB1060A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GeVUKz0p
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F0A614E41636;
	Wed, 18 Nov 2026 17:06:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFBAA5FE9B;
	Wed, 18 Nov 2026 17:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE98011BC1F23;
	Wed, 18 Nov 2026 18:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=GeVUKz0pIuAccn9dkHbm1aUU6BFn85veWvaTHDBRN655UUqTzoN+Vz43SlyM/wgPq3/AlO
	+eV1xRXDjH2EK77wXEMcSwVaMgwhPtZuIj6XK9bD8xBl7m9Ul1gOu0YWngIr6rnEEJKucx
	DWaLGV/RrhG53on8mVMakgtz+imjCSGfBVl8F2kTIKw4xa+Orkc0B5v9+nkyKF/HqVWKuO
	gMzMhocoeWRyZ3PUjHHj6FbdteK2m5Ta+285AuaUjbL6YwgiQLiTctEUF/AeEmSkzBLPuC
	xc4DFDm8mYYRIITHrXwyjntx2cUngjaN4gofN6uqovFxvp3OCBGv3Jn4L8oV1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:16 +0100
Subject: [PATCH v12 07/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-7-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

clk-provider.h exposes many different helpers to help registering
clocks. Most of them expose both a 'basic' variant and their 'devm_'
extension (with just the last parameter of the inner function call
becoming true instead of false). Do the same with:

     clk_hw_register_fixed_rate_parent_hw() by creating
devm_clk_hw_register_fixed_rate_parent_hw().

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/clk-provider.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c2b80cb3ab0b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -458,6 +458,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags, \
+						  fixed_rate)		       \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),   \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework

-- 
2.56.0

