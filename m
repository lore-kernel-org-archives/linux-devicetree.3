Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721603;
	b=bN0csv8oDYBAcVIM5sl8B/SoxZFLiy+qhgDjP5snZ22thvFJ038ELjSYTrXsqK0B89VJ
	 LlACZKeC5K/H2WXHk/9hWmx6n9OQ02KEFpXGt23dBwY4YO0PjsBrFC/g0W48g+ltkX0nV
	 SdSmzdBMqt5n3IZPX7jxsyUqV8mrGAPzssvZUPmlw0rgPiRDRSPgC8m5IpWlXGyYXE1uv
	 OjW1LgU7jPSQPme2BWSIRmewIfkTstU9NONWgK1qE/bD8WahM1ozV2lw9iz0k+/eb89c2
	 gsWkzpGValZ6oXvWxSBGuvEX6/slcn15LWeP8WkFpWQBg7tucWiccX8YXFcYK++UX/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
	b=JVSPYYk/7ggL5nuL8z759bscXovp+gwkPkkYtzcVc9i8B55Mz9zhHnU/SfvGnKEAJPQm
	 KFgwfWAmNA6ux9ZLdnqGRPIu11+HalpBsy9VXQCm8SY+jkSOcrxwMU0xtEc18f3txkIkf
	 0fPuSoNNWNTb53WwbQI27WHul4ktAiRMkWqQGIAes9lDAiec30nH3zSHY/RIGeg6CaVXi
	 plwV0G56IHySCHCIbc9wr4cGxDTxdgKkH2o9dwsR9OfmmddT2SkqsKIkdr9RH22qcQUDG
	 uhKTsbyGqXZ7Zmw1i8ZOp5/plBaihswGhY/vl+taaeJwkq6d9i4lM+FoZjL8xs34gBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ov/E8NgN";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE4606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ov/E8NgN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95242045e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721601; x=1796326401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=ov/E8NgN9ZtH+l2fCS4g2mhbQFxx1LmWUJCXP9cKkd6JPbERTFuwSEsBPOYcgbFZfA
         k6pW+MIBFBtskU3FfX/n/uTBCj/rPU5LZCcD3pTrPri7VXZH8Snwos0Tr/Crr9gYCZND
         0WyghQg6wC9nyCgOaL9cFkRmS5hpDW1VfFuSYX0qxTKjhmajhWFHQ2p7IzcPDK6cQ4xQ
         W/OaZ3uTR+42vSOg7jxrtiNgkDXEpcdc5E9gJgUs/ZeYA84TsI80jEECbLSmMy6sOQLF
         22leg26udNn3u6sF5qGK7YHvmh+/iTjmBejnPgJU61VbDkkXxhD15iJtbs3Q2+C+ZXDn
         ZJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721601; x=1796326401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vH8KVarvy9c5js2zbRlKpUiINo+DHyvtWOK36pzfGps=;
        b=MVy+LJJuesNjh9NLWUIpKIJhPJViOIdx4kKQjSJs4jnc63wjwCyDqxns28ReFeTKvA
         tWx9AlnIIlLc1uVGyKIkHG9czQppkGdPdTCS21su6/8h/iMNtwlxwW7f8L8pES+zlcSN
         CvUvCLiLz9Mq5wjjxb3cnkANi1eiDxutCRVRef7igcMdmVBV+opY0mCp+bgWiWAZi7qZ
         VEV2IXSYQzrFYpVx2Evz3ucRfruJ/OF2qDxwz3N+wfk83bJc5Ib++c9NcRIeS/F8zAfW
         9WoBkOEmEKj0TI5zl6lwesSA635y9EVo/o3OOmtV4xUdjFJx7UT/ZmDOob6EoJH20XTz
         Yidg==
X-Forwarded-Encrypted: i=1; AL+hErHFObp7wvbaP1g8xAC8OxW3CpZNzmCDe5hTkIb+XAlc86W5/rPRAEYSYrQNA1usirZeX3xhRAcyQKSa@vger.kernel.org
X-Gm-Message-State: APuU4Z94DUji2tm3jYLwg4a67CbTfS2BL+nP1e9KIyKsR/ODJQ3WgKcD
	yVRwyCggAVCfdbLDLdLfFBQ7SJ0BvfWQtQkeB0oB7Yx7x7D3vbFMBDWi
X-Gm-Gg: AZFdTZcqMRXAa4iQdD+kbYzqx9benU27TdO3rh8YWamfkKtY0fqUiSivVaze3DsFbIZ
	WskLZwN2ra8z22eqFeKdAuX48c7lNUJsqmIWef/HS/XotyH+pLVgMQr68frNuGCWAFbo3S3hRIt
	/lGHFnPcudimJvOnBcEEzalYD5NDzMAoSSTJ8Y5OLBo9ZPc7t2xI+x25NYOcQrHAQFVzeyNispt
	3KPGyNQzU1WWnlY/lUAoFHd3NvteT6GhgB7QkijH+cDnz3CUIVAeczk6GPhDHxfTHWWmRBZ3Jiq
	4i6aHUafqCcg2IGE5B6t3vYVxugxwbyn7MZYtw5NzYiJZQCyXRpTRByzG9Wk57XA/hYt8O4Y7F/
	y5G3dUJtDwNQTFyMbZ8DRtT43beay53KiGZjSh0xTdklCTf+we82Sapn2LatDJu4z53IUyGS3Ah
	Rkwombo+g/5lE/39dC12m9fnwx/xTvKi54xwdh0/s8cVlla3Sb+FpGbn/MgXTvVZ2BpPu8OqMrK
	IdQgDaBsTkyMEccmp7oEWM+nG4F2igkPRX/O0P+BcaaCs0MyrXWGXHQeg4bfhtvc1kDNCEtLF9d
	DogT90DEmbMFiSEuN6haR1zWzj7C53PlKx5RBwUJO8SsjGDtLDR6SSTJgmSTToyxByI=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr471718395e9.14.1795721601329;
        Thu, 26 Nov 2026 11:33:21 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:20 -0800 (PST)
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
Subject: [PATCH v13 14/25] crypto: amlogic - Use fallback for 192-bit keys
Date: Thu, 26 Nov 2026 20:32:30 +0100
Message-ID: <20261126193241.1471372-15-jnieto.alaber@gmail.com>
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

