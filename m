Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721604;
	b=xxIJl3wylaRwlGehlxRAy8D/A5ZDFQiUxyfOsoBbmcSnmMA4LBnC7fBtZepNC8DLbIO1
	 ZFEpeTynLNRKWLO1s9V7osQFJrIOOeMRVetuau50wtkYjFMUIkoLKG8nPDbQu/FbeAnuk
	 8DQWRPbDul0ATGyyV25EAaCAGxQ6pp0fVcuTU0t6pNaSVUF3XpKRy4rZa6VyyG/ks7y03
	 xlAQEBKX7uvOO8BRbMhUP8EgHui+qzYdGTmvmM12DBuvLs4+Gvtbwmd84E8VGOJq7oVzt
	 BXJIlxc1of86VfKXSfAbB9KfgAyk47US6yPhtEIkDUb/9z4fkRv7Q5f/Dsl8CI80rAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
	b=IKB8U1Oh3n8slDZT35PnPjtEbzfHCZRk1bQakIRviwmFFeB7ov2J4KsrfV2ADj4q5v0m
	 SpTNdyQcp51J0o6IkIBPMt5gLTAn3j4pKbO0G2zWakHb6pLVQlAvemUQLP6JttWUFdMA8
	 eFQjv69LGFIlwtTpgxsWSXwNE9lXVhHJbXY2LBwys2Z/R/6lbRSrq83qFYZMpeSJPungJ
	 hxK4LtJW0uCUdLr6uaeWD8pcvvnDWt2fdendgeDC7hmP7RyHbwD7quQJyKwiOty+XQXA5
	 AZXKFf1XSMaXnXMNx8Uajck+oNRJRDIO6ZdeEUOBJbnLD16rdM6BNTTQrgVwFsO1fiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McSYMkx9;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257E606A329
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5257E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McSYMkx9
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6623758f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721603; x=1796326403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=McSYMkx9gF1+jTF2yC5J+zY+QDw//u3itxFhGkKbQHBjnbEww3gTomHV7R0LS3Jd0X
         vBS95MluJ2w8x6iQZ0VEfLly/ALHhmjxM2sjueUTMHgfa6MEe3dpimOrm94RuwaxCBRM
         rKh2zJvFeSJ4d/opiZBAaU4T3ei7yrkUTMs1/CuBQZoDmtVOWD+qBBLy5cXR9FSOXIKD
         aLyv4w0QKgBjW8Qv7MV8Nd87JsEALazcDUyt6bXNw/fNedTChqvpNvaKxV2GRkAlR5ID
         lBRHafpbr2qnMWcMHEeOWaO+wqnjqBcom+EZyurv5yYcNnqsJFYUBoMFbgHmbYhoK3Jp
         y5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721603; x=1796326403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=G76+Q54Ii0JEn0Zj+3v2CRVXaT2TzKZpYLfE0+Rh0u7R6IalwPtBVhDQhcvWdfXf7y
         73l9QWwRaFme4CpD12rkGd8ZDixh4qtHc4O6kzPYklH+Di0lLN+RP+5F0G5bt6ms90oV
         SSkQZyWWDcF9gQterB+JcVHSPDNtV8ltQvgP0IwuCN8U4lDzD/H3hJHU6WcVUd9Lmm5e
         Ojj++N3WeMJ/gpscungl9WvOAH/asHRSRU6OehlQsoF+p8xUujNPYNJLemBDT7PfVqwF
         oWYitj5hi2tjjrdKAPAD4O8q8Zxe7Wu7q3CJtY0+LPYyG1gVAyQghwTnYd6W+xG+M3Ir
         lvBg==
X-Forwarded-Encrypted: i=1; AL+hErFmm0bdnaqV4eMI9z2Hq6+a7wryiVc8UUvezOMPKwGvy2ggy+/1/it53Q0YJ0yllfS9Sz8b0vPXIro4@vger.kernel.org
X-Gm-Message-State: APuU4Z81e8ihwVwLS4qHtii8suwGdlZjfELV7tsMkZ22ZijeLe/2uSF4
	eEVsc6eveAVjlp88Sd0WItNPzCcVeHCuBRShm0W8yDppLHfD/cdVgaVx
X-Gm-Gg: AZFdTZdE/vHcQ9CY8Fgq0LkEqRwq7bALRgElvr/oH/gNJU7n5ZQXmgwGFQJEjTtOcqI
	0KDkwbeqKvuDmI/phBgpJTKz9bZmcy8EibOt/Rsw2poXZKA1ajvgfvie/k7TZFcPKHOsqojHNPS
	lRdfRInikN8B5sG6L1uSgVsMliJripJWZypHMryv9y2xPpnVXzmn/3pFIG+hIX/+TGGB4WF1jHf
	RWFfmgMxcIRos/SSxWuSdwZ6IA38RCpNjw7ifmrkHguILTOlx25DwqKI0KXJCUGPV5p7ddGMHLy
	+c4zXt3LfqZXLc4f968VOkuYM6zred6R1KCdo+VL5X2LA7OoZrLPuteS3n9S3RdjVORKzWQb4+J
	vqv5C9dRjBiX6tx073qi817Q6RtcX45ctWalAnqXGDmJ2+EvQ9VFHsjCoNHz02EW1LmxLAa/xfG
	/TPoQgFl5LbRK0bqxSeUXZQrDEuzy2aicoP/HTnxZnshTbizY4Xemw6ifYCpRpLV/gjHbkdp/by
	9VfFMj4dxN0TxX9IT7d6KdfG9VB+1RLXqwhYb3SR2czcoxy9a6UvMRqgbgapq9O0NQQ0Rcd/ApO
	Wd/UkLkQe/hsg+Dql9+MoWgQuTyKo8+DT7e3BXfjyRlWuA==
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr392936815e9.32.1795721602653;
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
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
Subject: [PATCH v13 15/25] crypto: amlogic - Add support for G12-series
Date: Thu, 26 Nov 2026 20:32:31 +0100
Message-ID: <20261126193241.1471372-16-jnieto.alaber@gmail.com>
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

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index f530e238812e..0fb0da20e06b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -282,11 +282,23 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_g12a_pdata = {
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
 		.data = &meson_gxl_pdata,
 	},
+	{
+		.compatible = "amlogic,g12a-crypto",
+		.data = &meson_g12a_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3

