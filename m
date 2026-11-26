Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721593;
	b=WDQysIGYPRoqVHobqKRmpkmmjMTJ5gQItOh3/K5sEzIhQ7NFnB/vXHRRWTZbzs6kHnZv
	 /MgfOch05MgQbmCAPM0E05kToa3coPcyoTqD0CiXRGQeDMtk7vKMJz+FM+zSVXnn2xsng
	 TZZKcHvsJ05MlMAEM20MWlT007MjUHKfyBUG5JdRmrgiABPNa1Zo/rSjAzVNn5bO0MMiV
	 qhcQF5WHaYj2An2numBbbAvUuw9yVxvnK1TD8K/y37ePlsTAbIWK8TqH7KYAl9BaD4YKY
	 PvOLecSIHs4EmFR7Z/efOnECxv+QqdaK+AS4kN8yOu5cmOlvbZZixalMp5Eq7SMHvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
	b=azIPDsmFhF+053AZUVEihOA5a2vxaFqOTWQVgXrfSpUp+4zXzF1hSmE308yCSxYzJiB7
	 GErA3QMsDZQU29EG1L/GvYTEey0XM1ieHFPmqHfL8Uggkf0QZ/y3sxL/fmvu/Mwtuf0nA
	 ahUuAM9y/4+y+EfB3mm4bS6VS6SEP1Y7lMNfYjL+rCGp1PMPkzQAesuTUFgdvwx17U4A3
	 zkaqKbzd0g+5woAfwZVz4c08WMOayvRNzWgx4HM9xP8Ht3w7MnDtzLfZeaxQS8JddLuil
	 lC8dKPDgysVfD/N2/5S6MC5aNwsqEX5o6rbi6Yj1JPz5/v06KL84oIhCgmxTtMmtBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5yR1Spc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBE606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22CBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5yR1Spc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so73152765e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721590; x=1796326390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=H5yR1SpcIfm/+Um92xmFVgeqN8Xd5UvNySTN7DyQigMR8YxRLYBUlMWR8c55p7Qdn/
         m6/8lArbbRqsxiM0TdoAS5NBRGXA9TNjx7+CJ524qnlUie49nBkq/1QejsELWajXi6E/
         Qt4QeqNzifk9/qY8RaE7LQESp5039moQEUPP5I4ljbVnqpd1vBLCushS66t/EsQ1L4oY
         K3URC7zJ8BMPthv5coAMI+8qUktqRG8UnK2Y4cKoAVEk14m4Or2xCBl++yOekbiqgjFJ
         /8lOO4Ez5+7X/G7PD9mdXDnCoYPex/mqvTt3Rf/TWlXaifII0Jv6ayy5+0cTLsQaM9ZB
         Jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721590; x=1796326390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=IJFEhauzWyu714MNi1+YEEox/SrvHDLa4WPHT1w8NjtNrv2vTJeUnVnzdaTA1xeoct
         BBrZa6dyrkF1Vcp3ilqEb1QN4G6QOwP57c8eAAPzGAFnHbVurSShF66YgoQ7sq7omS7X
         ALFg6IPFkCXNTZDgY5T3KCEmnNdF5Jf65PzVZjt5hKX5pTZzalDxNWLfQNbL40Tjqo4g
         VrnnfyjlD8ZhSkoJ0UC6K7QK/aHH2TVee8hCl0jPHB1IcIS6zF7lB9ArWiB6jyJRrlbI
         6jP5bcTkPysTLuWoHRtSzhIJbNd83g5Oh7kC3mIROGHJHdw8aohbm/Mm3PhJN++CJi7V
         J63g==
X-Forwarded-Encrypted: i=1; AL+hErFMDYZ80yIM4b6SITmUlq68ZYXBiNjsGB5KeJVzNOx7Suaxb/8H6jWDBe6IBn3i3IALWe/R8oHGOiQw@vger.kernel.org
X-Gm-Message-State: APuU4Z/0i8auOa0hx1+iQCESBvTHN4HXTpRPCv0WZt1loew5QMcSVXky
	c5xnQhRZkl5UyHbAFSYnBTaXgZi+RQTrm7a3C7BsPgUa+YVGdKs+PDZNlDlin8j9Mp4=
X-Gm-Gg: AZFdTZe1ytg80s12KHzRORTYwvyB8rGCIZCvCr2f6AEGnbiTVj1WPqikocBwhDBjurf
	xMOKgCPqCCB0zu9swmE6v2T2XMY8D3F0PTnPWpivIiGO+UHvCENXEjSeUkTxT65IOWYaP6+XMdK
	gLdxJY0crQdKAjM8bkh9zc1TXWz7UHV3ZgqElFM0FtLya7I5TLclV/pJ/aE7wFPOcPwS/vFxFGt
	f9MSx/HLznylGwN/VgmHd7lsnTeJ4nAI6ywuSWhgsCENh6MDCAKsd4Fe1CQKpY5nddxajzSAgGK
	WqoSEcWIBr2TNNDU7EOcDiUc2FGPYcQH6Ab7nYSmXOh1pSiHLVBSxH32hpHwiwZ4gt/Dbx/xl18
	JZ+YEYcRP51+bvYlRDUqP/N1OBT/Q3yn/rFsgrDESQHxWE9mza/VoFD4wsh/+Fh/ktDnEn7vL7o
	XnIbMBGCX6BCwTf4LFVa3B2uid3h64ylLkBR1R+4CrhgF+ufAquVfLfHST/7K7FzJf9qIFwIqCz
	NW4Yy95JXJNvQHiNdgrwYpPyPODAuxbChZtC0JuOqRUC0Sg/ZPLqPYQf0+7xoDxmJDmVzdj0Y5p
	EEM7ChT7nk9t2MuRCzuHYwRM6EDCZS3jxCK8Gitc3TmUh+lYGbbOSL07OEtE8IhxvQc=
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr514973795e9.6.1795721590419;
        Thu, 26 Nov 2026 11:33:10 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:09 -0800 (PST)
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
Subject: [PATCH v13 07/25] crypto: amlogic - Move get_engine_number()
Date: Thu, 26 Nov 2026 20:32:23 +0100
Message-ID: <20261126193241.1471372-8-jnieto.alaber@gmail.com>
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

Move get_engine_number() function from cipher.c to core.c

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
 drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 62aa82e1cb5d..f6c13d8fcb47 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -17,11 +17,6 @@
 #include <crypto/internal/skcipher.h>
 #include "amlogic-gxl.h"
 
-static int get_engine_number(struct meson_dev *mc)
-{
-	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
-}
-
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct scatterlist *src_sg = areq->src;
@@ -297,7 +292,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_DECRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
@@ -315,7 +310,7 @@ int meson_skencrypt(struct skcipher_request *areq)
 	rctx->op_dir = MESON_ENCRYPT;
 	if (meson_cipher_need_fallback(areq))
 		return meson_cipher_do_fallback(areq);
-	e = get_engine_number(op->mc);
+	e = meson_get_engine_number(op->mc);
 	engine = op->mc->chanlist[e].engine;
 	rctx->flow = e;
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index b972df44e8b5..58d56f352dd6 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -22,6 +22,11 @@
 
 #include "amlogic-gxl.h"
 
+int meson_get_engine_number(struct meson_dev *mc)
+{
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
+}
+
 void meson_dma_start(struct meson_dev *mc, int flow)
 {
 	u32 offset = (mc->pdata->descs_reg + flow) << 2;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 64f2f0e63f12..e14cd5021add 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -159,6 +159,8 @@ struct meson_alg_template {
 #endif
 };
 
+int meson_get_engine_number(struct meson_dev *mc);
+
 void meson_dma_start(struct meson_dev *mc, int flow);
 
 int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.47.3

