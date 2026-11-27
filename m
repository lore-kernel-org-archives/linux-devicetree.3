Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780901;
	b=BA5PejNSoZeJtTpRXJtBJ8pcEfKtucqJHzcKvII64hxfrTTHvosDp5tWX1Scx9Fg/jUJ
	 vXr0EwSf19PCvtFhzRB/oUvuLWLNeh+EW7SwNZ7kLc3VoB9seMb6qgr3jejS+n2YNaZSy
	 P081vLsbNyNeSJQqlJXZbHbHBaYPTkNX7w4ca0Pv1EEINw3A5aMKEGiwMC0dEaP/71dEU
	 T9wBqDmt2yed9+jV1vj5DMPQNIYCdVpwUXFRkoWizGF2V+DyPS//YbsmOSegW+HGy5TI9
	 pHTPn/en11SlJ0QZZKaHyJI6oKR0MH8/Ffnu+XC+sZZ87rLziyeppnPmJrkO6sitO9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
	b=2BEfM5ZTZOTTba75PUd+kmvU33Qn1j7fsjH51hbB8FuGQHMM1BXrSs8uUnGuMnlu9JAN
	 3x1T6eG0s0QV0XxvYCtCDnJ8NnqqH/pt+0jUqG/ll5BrHYXdXX2NrIVEpv1DDFiHRXN/O
	 caJqZuEZFTu0QzWwxW28+sq8bXaFyatRHpPFUNHIaVsIMLYigIvJr582H0t7KKb71zau3
	 UmrzJtBGisuSKtwE03yHeFeiWsDbWCVyxN0DSjl5taFVDSFt73br4Wv/3VSPtfOBi2PMs
	 XFsHDVC5iq+eoiE+t3pFWEuHV+h+2SUcDj9AjfX+WjTfeP4lMJhlLCrpjwxwssy0qcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nD4If6ps;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCDF606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCDF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nD4If6ps
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75478205e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780899; x=1796385699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=nD4If6psQxV1qUCVu1yaAPXdMFYyfcB+jxkQIXhUTX0RZufzFDsERTTYT6X4fgyEhC
         J8udY4byKXW6bp9LpSuIhGBsOki/o44/7Shr4BZFyoB9xH5ojHdzLi1BK5BTJgCWtBfd
         KcBuf6P02UqGV30wAQBgzzNiMKyPkIM6o52OSS+uQ3qCzALm7xgclTstxElzbj83hjFY
         WLFqMS9Q0NPlsAi3TTwmQ90LDKX2n2tCG713OCtazIqkpLpYOU0ivg3kuqmnkDRRbjcx
         o+OL3r2YRMD028rrsEjfo5Uqq5XoI++V49KulJjv89+Ug/dIwQhrqkoKdZp48iqgrVia
         hx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780899; x=1796385699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=eAhuXMYBELKQN6Qr42xTkrITXWogI2dWw5ntJcfavtTFAIJf+xZegIwQf6vP3uHFNi
         cxXkfUvIDF0V5+mK8+5brLhIRSb2lYPVdwJkC1Iq27EE1R9JKNE7jufNv5E5rW9qoL4T
         onRFw8gTnY0Tl0BVbRKvuCsGabO2b7ISYQpQ62cJXXlAAIzOuq/CQLYjzCaFKnpGZMHf
         afrA5HsqtUU3rctIVT+5LNEahyGvLepp7kItJ26GQD060WODM8+/K0PUOthH+shUZYkX
         HuuFVCszWb7KY1LkgyEon/w7kDUwM3p4QM5mW7Q1YNYLHmK8RN30kH5Ou0L/AKU9Tm5G
         DUcQ==
X-Forwarded-Encrypted: i=1; AL+hErGA4RlMRtizJbEwlqgsjiTl8GTWBSda4gyHNejeJbeO+b5GRg7S2EgQc0Sv4vR3XJPgpsobXotNvuA0@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Zz8z99FjEmer2lR76jogXELlyRA540BMczMU8At+SVCe4fg7
	JWGIrIHX5l71t7f80iLqCQKyT5QF6ci+YgjvVJpcbeFHp6e7kzpse1aM
X-Gm-Gg: AZFdTZdwejB5LDNqNTL3+wa2cI3ZNgs0Zsk+NwwtclsoO5nK1Rq5R/abckrf/2yqm4w
	8Lh6oRFA8OWQKdzdeM0WSMwlhY2hGRpj1gmeLJhgVzp3O01EAofcJ5VI34IMmhuE9aRoYO2vol3
	GrZs92tiukaFAx+bx4njv7928QdijurP/80T5DR4qTW57Pb+l/I/LlYE5p+qDCOI52R1lPJRsvJ
	ofIoa0OOeInpS4Rxgc8ftvJ6qS1Rj58q/J80fDJqWy4bGjujAy0Wu0fCzYtio2ALYF4JF16WI5k
	l1oQg14GpWvVWi9FwAnK9x4fZQqyrFQTEyUrvUVFhRo8OfCnsGENfxw7ZxcjBllW3Aafx3V4HaQ
	AKfQGmnl+yRTqxRG95DmhRBZLl72BqS6Je4HZtx6ww5A9Avc4693L2uJmH4Uf7Zo5sxHI8jVqM/
	/wIAW3JXvzqHk7L8JzCGcjh+WTCiV3m83TOuPzGYFDXoCIBzybqo5uqcI5E2fSaIfHvbFqI5Vrw
	jaKCoF3KU2j3PozPB95g15MNCRNgx1Ho50wW81IK7f1lnncjkbyv6OBhDEXY7OcfbrgOpkd0SXz
	rcNDmRLClrUDaOLWA25Ej2Xa9dXCjQskllEMJwlIvZkHchM=
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr480667555e9.20.1795780899271;
        Fri, 27 Nov 2026 04:01:39 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:38 -0800 (PST)
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
Subject: [PATCH v14 14/30] crypto: amlogic - Use fallback for 192-bit keys
Date: Fri, 27 Nov 2026 13:00:47 +0100
Message-ID: <20261127120103.1532882-15-jnieto.alaber@gmail.com>
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

Unforunately, not all Amlogic SoC's have a 192-bit key
support for AES algo. In this case, use fallback.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 7 +++++++
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 1 +
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index df42940f1112..6070ee6b488e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -41,6 +41,13 @@ static bool meson_cipher_need_fallback_sg(struct skcipher_request *areq,
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
+	struct meson_dev *mc = op->mc;
+
+	if (op->keymode == DESC_MODE_AES_192 && !mc->pdata->support_192bit_key)
+		return true;
+
 	if (areq->cryptlen == 0)
 		return true;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 9676b86a5089..f530e238812e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -279,6 +279,7 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.status_reg = 0x4,
 	.setup_desc_cnt = 3,
 	.hasher_supported = false,
+	.support_192bit_key = true,
 };
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index b092d0c89cd8..a44290fcf3a0 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -94,12 +94,14 @@ struct meson_flow {
  * @reg_status:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
+ * @support_192bit_key:	indicates whether platform support AES 192-bit key
  */
 struct meson_pdata {
 	u32 descs_reg;
 	u32 status_reg;
 	u32 setup_desc_cnt;
 	bool hasher_supported;
+	bool support_192bit_key;
 };
 
 /*
-- 
2.47.3

