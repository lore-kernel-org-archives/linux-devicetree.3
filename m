Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721609;
	b=NZLl5t0KBQvNRuZ6feRrtCg35zY0MQknpjOiWQS8RfBBBH8Z8E/nSaClTCE0D7ayJzd7
	 +52hKWCl/dNAzLoDuKooZVT/NqmLmSo7luSsr74lYjOOqVfd5RhhY/CAiW9zFawyHitew
	 THDgNY24V9TFkwnAZgLUcUdxsZLARxMlsQ9BQ9VTgcSCnG093qDJzs+YYt6jPXfqG8ldv
	 xhPkPIdlKv37Q77lwUgsfP75/X79oq1RGsoJ/hXO1QIXdlgs7zMTkPwdVR4QSgt+WIk1m
	 hNF/J2q58811QAY0B7cTyfijfxe2wi7+J1XyA6M1VZW6KXZcMicfciIRPb+REw1x2UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
	b=2sqXs72LS+BTJaienu+C8j+HRzdvLh/OL5Kbixb6L3JfAWBGR1Y/cCCiAYP+BiiG3RUn
	 TgUoVfndq7gcxAdokgNoyoN2JG5tdTlNCBLm8KFf48mumNuEHDeZ7VghqJvJgM/Lflma4
	 GA/MEMmbu/Wwm014dlranUzGPEUV+S8qd4elsN7CxAYbdbI2y9IIXCJza8662MNNmhPbB
	 GF86XqrEVTxbnlxi06U3QMXQMccnYsoGkiDLz/2HvIqA3/kTyEGqNZmuZE5k6rVl7UdPD
	 ZF7zFn8Tp86p4gDfKSKv8eL1iQ5pnZRd/yOaYZpPxLDmxfxsY8aIephbZG6adCZ/EtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQxv8Eco;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D431606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D431606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQxv8Eco
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so71735705e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721608; x=1796326408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=pQxv8EcoJPiNdYwehYifva6qGeGaUn+n5F7ATm32BB02o+TG7WkcdUTDLibFgKM024
         NFi84sunYevZSDRcCDFPOz/YH3RI0i6bHDnXfEnQWgwG0XjECwQwdXkQNre/atv3dQzS
         9YMdQbl2Rb8go/Lg4mMqkSDGYuCzdvgYO4C6nhBbQZKiKgc+d5d8o9H/hcyKBTBkJAi4
         jYygo4dsz9qZtRnSY/ok3c4kCU3TlHBlgprVn2qC6PWqt/sg52qi/dN8/90hULnCDYi9
         hweIwebq5pOtRyanTXJSdNcmNO7HyIbishKDjogMqIW7g3amMIpKAcWr3y68fKboQ4+K
         Foww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721608; x=1796326408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=JIynlMzs2IraFGv5XwKS64AnqTjRKzOO1WEGuB2MKD6TmBbTsk/FuooQyKOA7hlg8y
         bFf/BuWVpClUaeLH7FP9q7YjiuNoz0duEoiyNuJfsbtypjwY3xJcustXza2mRySsyYqi
         0nUJ+Mr7c3G6H7wYYsAHk/hZx5+M2vJBUaqvoQ95EFIMduSRGCyBO0knrjhBXYgLtuyw
         yM2AfUVdE0pg5VgfHtW2XPh3WjtTw7gIuQoTi1IQzHKRwa8J8+KUTnzp22wJgqL8e1zu
         cnDlyhYkJ+dec/cQ38udvNZyL0MT57vE2opudhLAlsyLEVASQoTlB1WrxXJgdxmW5CUt
         BCqA==
X-Forwarded-Encrypted: i=1; AL+hErFX5BYywg7P2T0dj/U2yWtim9LdSSlPfd2sj2JehIfzatz0TzdFOQ+fHlegHV+rthJTUR206SWr6NC+@vger.kernel.org
X-Gm-Message-State: APuU4Z95rh8NadVTL9wY9LDwxGr7iTylEyapFmJpisgUmNm0/j7VIwcM
	pEzg56sniqSi37rX+eRMueVqqnQ48a+lWHfeg2Amxxdyepa9396rLMCy
X-Gm-Gg: AZFdTZeXDWrcNGT6YVa3IAmlbPOerBql8Ti7GLgOyGxZywgOgEhKViWxGT84EXWM6FW
	mD7KfoOlcaURJ5wJ1DTgMVbsNUTWjfUZ6eMqImhZkkPsrpqB3eqUFH5EYmLilUhsrCRCe89URyS
	nffw1wxMcXHPRYhEsIr5UkKsztmioSOjI8QjWFOnF+QBzCvPA6XNyATJBveCpJSJrusAZBvaFtD
	alzhiBoV7N4oDlN0LM1+D24AIczGLwt74R+mCRpNvnWMc8SsqVBMIxCdJ1IP1KJZru9bMrS7213
	HCkGCRTPeYJDiDcCvw6zXRYrs/nGSPl6aII+Jun79+t888Vxdk9H4FmbkAcZ+t1TsYikN89/yoY
	l2ZDr6liyx9o9YWmpVXQnsXo2nWvDIpY7UDZkBuRnPRmNa6HKL1pFHB5r6yxuJ/r51AQ2RCeSmD
	h1hWjhfiTYVtVTAB5fjXx8/SGxmcQm7R0mdHiPp2klxKQldBuS7QsfFRDi9Dy3vhtTa5oUHdSNx
	Nj4vdeXX6ld9A1rn/txlUUdfXdisvLQs2Q+wezhd1dcbgwmzt52tBkTSNvFrLTzcHyE69r72XhC
	ca60QEWcv1nGN32HBkY9Llpqq8RJMaGohdKUr+qCxs7bUg==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr465544385e9.6.1795721607669;
        Thu, 26 Nov 2026 11:33:27 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:26 -0800 (PST)
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
Subject: [PATCH v13 17/25] crypto: amlogic - Add support for A1-series
Date: Thu, 26 Nov 2026 20:32:33 +0100
Message-ID: <20261126193241.1471372-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

