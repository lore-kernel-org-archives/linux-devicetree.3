Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780931;
	b=Fp6r02QZYj2cW6N8iVgu+rqBn2FCWb2lJiz6fKPDQ0lIwqAF8EM8Pn2A9Ti2IddKv8FK
	 rQ6oT/niLWC6IeH8kb8SNBySNESYPm0zR6AyxLFqx+FPzXYVtUsdrQ1Z3d4Op8fapPW3J
	 XIsdAgCPy7L6UciX4quw/rbzBhq51E3vdq0qY0yb+PANr/JUQi1GFNQ3Emx5s9C660q6U
	 OPxCKjAOpNrMNp/5e+IlLT4UBi7dvtrUUAAy+kTl5xzsyqzm3PsnzHgAiZF2vVobAWqA7
	 j9G+OgOUT2uQz3EZeuOFy/FO4VVSW2B7RODD8ZM2HsbR3QMTv20gPDtx2h1UABhwFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
	b=r6BY0CJXfZvmAjdfm3M0RrUHQgNbIRVyK6Ht4JQOwvzOisY400iLd+nU7RolhqbB3HSj
	 gr/x5ojRCJaJ28GI/zfaOPYyFd9R95Z945r4o7TaednKgo+jDmRh+QgVA1Ui+BTFIJWex
	 4N6KUTsl+Gg9TYNDr/xOD6KllYcRqC9i/f5t7u6uNRgp9/38OPVDZ1WR2VqddmWk/S0PT
	 fwORHpwpiX24F0GFSbeMDOFUP+C/ZOFVk8jTK7fTRPQZCGKSk2+XAKnhSR9r3viblan12
	 4mbPyGR6i6Lde/Q0xvw+MSDoZE9QjSu6m/8MMVDqzU4UmvY1PW5+CGhkEo4CyEyxX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzEswMY2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA635606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA635606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzEswMY2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso57672785e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780929; x=1796385729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=yzEswMY25Uf78QOCaVLO4IO2jI+aZlMVeeaqulC4HiHD89RBFE+VNyjD/Ghcq9oDRD
         s2B/MubFzSbiggtet4AHREwbsG+cOtB7n2xRKn284CPHIa0WgXi59xjpwAGJlviQswrK
         8RUmgf3T9fu94ggPUN/FvXwISQWRar60eoIXDyZ7YVKl6dsIDTG81pu3mgUefBMy3Ttc
         s9uOoKPHZdqBypwHUZPacrbC7+vPmI6XlSEZneGSxqNTsTLZ5poBgR424QTl6Ruxxc6a
         esUbKQ9He6CvDDS2WhHPa3TaXK9fG/bvN6Rk/4HCHF0WiMqrxP1IzSNfx3KPsLFeRMK5
         yI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780929; x=1796385729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ideFtYn4ffgnnNVgM+MGgEFjn8Xh17mg6POE0V0VRbw=;
        b=hP9ZflsGw+oE8xzkpQknlyICCVlzHWLpkALQ1T3awTDn+Z7GN00RIKaTu4ua1a4qVJ
         aAfoMv7EhC7G2U2HV7V0C9+0cmZ4ZtCydc+crm2KcxU1RYYUsUFpQByIFmvreQzkgGY+
         mETqqoGa8PyJUKacR8TV+0UPXeMtbIe21BlXVKiDA+Ge6LbXamJZUj7J8fImOeuGq7yZ
         4tw2yr5tcxFcFdJvkJbA1IA5reWTJQbzJKUOkwSb8qVIoTYunHzNc+7+oLDZu2HqYipn
         54E3gsrNHjQXs3gVz6P7kfDjeWA3rC7b/OX6J0AReXDGiEjyQopsArF6rOSFGixIMA3N
         6L+w==
X-Forwarded-Encrypted: i=1; AL+hErF/t52oI2FJ8erY6lI9zEFSKNq6HnBYXTKGcIFYevX3Yye07RG5GBMhfiIC6E2kSS3X7wOCNZpSX3rY@vger.kernel.org
X-Gm-Message-State: APuU4Z+3sr0ZjL8wvxcSj5AL0+vTJX/ruJPpxvXyuZ2w6M5NSxKSJ4Bp
	TinlrdI5zM1+d2ZAMZuS1urd7DGw03rsLAq0HXP6O8dBzJ0/YBElSqPq
X-Gm-Gg: AZFdTZfo8jCkkrT3IRApCbVmmjuYJmMfs3BSm59sC4KA/oZB1anxsKwNeDIlS6VqwuI
	HC1tyFpOZRm/0rvFR2IkEAOEQPoU4WXPB5h51lsUQNFxIllEcYRqHVFGFCVRN7zTrRjJ8nlgsCC
	9ty0fKM0RVxQX/U8sVvNC5aghUsiR+gPJOQWqUq3ZBHnmwwWf1jp8DkhKDYfZ2f3myrhBmMfk7R
	mTd4p011O+9qCqKn+1+um9LzjRZagfZz4F9puZ0u5N1b2LzcOjUwQ3e/9lcgpOpti9yTbHC+oAX
	DxcqzT/aoDa6LyWb727+FLjcU4CPkOmrlZAUy5kvEEhEXbiz8ha1YR5AAGcc9gUZuinTiTtsK3r
	qfbMl5Y1AgC0XZi5mEl5dxc22+EStft6Itol9JUEYnGGb/gJaY4a65qclzvG3eKIobA5b+Kgpk7
	QZr+qID97NVo0lspRtFIa1mA5Nv3CiEhQoOfxOf+Sbgyc5PcWIVAwF1ykUzE+o6DBAotMltCH7G
	aBulH03elV4itZMGgKyjqo5+0dlS3bghdJcI1X+tMJoNiyqypEZQwVVY1l+y3pfa/Vz70w9TRwE
	ntooExN1Jz+kIw5csriWQ00MzskkLL+kJyhO3oObJc0emfQ=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr485025885e9.26.1795780928793;
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:08 -0800 (PST)
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
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 28/30] crypto: amlogic: fix setup descriptor lengths and CBC IV copy
Date: Fri, 27 Nov 2026 13:01:01 +0100
Message-ID: <20261127120103.1532882-29-jnieto.alaber@gmail.com>
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

Fix the key/IV and SHA state setup descriptors and drop a duplicated CBC IV
copy, found during review:

  - meson_setup_keyiv_descs(): program the per-descriptor length as
    keyiv.len / setup_desc_cnt instead of the full keyiv.len, so SoCs with
    more than one setup descriptor do not read past the key/IV buffer.
  - meson_setup_state_descs(): use MESON_SHA_BUFFER_SIZE / setup_desc_cnt
    for
    the same reason.
  - Drop the CBC IV memcpy() + dma_sync_single_for_device() in
    meson_setup_keyiv_descs(); the IV is already copied and the buffer
    mapped
    once in meson_cipher().

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 15 +++------------
 drivers/crypto/amlogic/amlogic-gxl-hasher.c |  3 ++-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index c11ccbaf920d..10815ffe3313 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -147,24 +147,13 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 {
 	struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
-	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-	struct meson_alg_template *algt = container_of(alg,
-		struct meson_alg_template, alg.skcipher.base);
 	struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx_dma(tfm);
 	struct meson_dev *mc = op->mc;
-	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
-	unsigned int blockmode = algt->blockmode;
 	int i;
 
 	if (ctx->tloffset)
 		return;
 
-	if (blockmode == DESC_OPMODE_CBC) {
-		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
-		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
-					   ctx->keyiv.len, DMA_TO_DEVICE);
-	}
-
 	for (i = 0; i < mc->pdata->setup_desc_cnt; i++) {
 		struct meson_desc *desc =
 			&mc->chanlist[rctx->flow].tl[ctx->tloffset];
@@ -172,7 +161,9 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
 
 		desc->t_src = cpu_to_le32(ctx->keyiv.addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY | ctx->keyiv.len);
+		desc->t_status = cpu_to_le32(DESC_OWN | DESC_MODE_KEY |
+					     ctx->keyiv.len /
+					     mc->pdata->setup_desc_cnt);
 
 		ctx->tloffset++;
 	}
diff --git a/drivers/crypto/amlogic/amlogic-gxl-hasher.c b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
index 978cdcd8a4f9..710dd413bd51 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-hasher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-hasher.c
@@ -253,7 +253,8 @@ static void meson_setup_state_descs(struct hasher_ctx *ctx)
 		desc = &mc->chanlist[rctx->flow].tl[ctx->tloffset];
 		desc->t_src = cpu_to_le32(ctx->state_addr + offset);
 		desc->t_dst = cpu_to_le32(offset);
-		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE |
+		desc->t_status = cpu_to_le32(MESON_SHA_BUFFER_SIZE /
+					     mc->pdata->setup_desc_cnt |
 					     DESC_MODE_KEY | DESC_OWN);
 
 		ctx->tloffset++;
-- 
2.47.3

