Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780885;
	b=oPeaqq6uY/XTsbOkNNeC9PDAjhoLWOrh4CpBRHQ6bvSl3CtPYYnEG80rwovTK/ptA/Iy
	 Jy0EsOKpZMHayjeHo3IbxkGWx9bL4aJSShua+CCPjF/jnxVlqgo4ba4kjIuDVT4ZfQp/l
	 5DrbZXBcGTgmmlY1uaUKVe3uuWneb6NP8i51ZMHowED78rCefgwFXbC7ucpuB4GoSQdXp
	 zaugXPQI0fPGzAPXa+SvGgv0DrDrQj0Fgc181wQQuV+GQcQnFICaKCeRZKCRWN+0HOOTm
	 4QRhWKARhwIFCDaHDL4aSDqJ88FOLTF+l+coCVvZSkiif6vRAnRdG8ZM3csbI8Hkqqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
	b=t7KFYcsoHopszkc2jjiXfvmJLNnsWGWiOwSY6Exa9stxCk3n/sDlwn2B4uxMyz0nu4mv
	 KMrl1POVCZmlgU9MIYJBb/w7QsMFH5Z4Aayd2G4ZoW/g+jLGYcfCp5H7C1HsZSarCp20a
	 RfNlfkq8azmVTYuhc6ODOfwjkBbLqUTUc1wa8U24lA0D3dtFNIL0mtIn8SGTpxSuDBck9
	 E39LRkvI7ydQRQhbyF0N92murO0KPIVmheRsor8dXfuSZru+Cn9G4ID/6aYQtOHANCj/c
	 r7AGsCRGmJxkpUl0GjPL+iUZdimEJyDXYThyy8Cy6kI/DPOgqs2mPCch/Zv+tBU4H9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgW07CBs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19FF606A33A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgW07CBs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so69813665e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780883; x=1796385683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=QgW07CBsnJuCMS+Hnn/QCBspxzkSSt9WdyBVMSZFTsL0PEACgZGLurEAjZfSMcon/T
         EvkzjGgu3nHYJfeIVwxg6rDuFY3/Uoctju3Ht4XNoRovhkx94+AZryZf0pRaNwBpB+3F
         jg74NU4ZlJD8C3Aw1zMWGRDckzU4i+0uYFl57k4jsjfiRsr2NytafOy8Mwacuy0qjih0
         GUy9OVIsxCSMyNhRXph/BCASnCEDPYNxAjOWbofpvSgTEUJ89coqsneQkIxwaRu104OD
         //1UjQGrfZZ0H2HpWCekOsWZvmSAxiSwJ8hQ+x2Bpo9cGwTPTQ7t+ZkdQ5YeJAhwxi41
         l7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780883; x=1796385683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbFTXgWz4qbUUEtYKh+mkh290tQbhLkX/pW25drgstk=;
        b=xupLstItJ9cuQ6/bSS/rsjhUiF8tfLq2H1uJJt0WWvnvBxqpSGnYwpFONcZ+IQ8/u2
         Sv5467rcdLOIXXE2nOSlv0n0XekcHEpl3HQ2f9zMne/EbYZN5Qc7lTv+oxX0tqbqhlM/
         7F6DgD0F+fned312cG/d4qTOKQhr8OU7DiE1CyDqaa4WfCIA7Mp5J5zPMHA8+eTgpDZy
         CDbqlzDN1Hu2NZVzJLG9zDuJBVEPpgiZveNLRM8bw81qTSjbr3/E/0aa8d1qmWseRCOz
         He4OcdCr+AhAANyf6lzo614xyOvz+A0lODP4bvLfNw19eccOvmEpz9M/K8eeormcDJFi
         +Row==
X-Forwarded-Encrypted: i=1; AL+hErFNX+8cXpCGTCw9vIKsjymM2/pHCDUsD2A7FHqm1gmZVW9lyAlzwilfBqSb+ApCSG5BPtM945OYw+Rc@vger.kernel.org
X-Gm-Message-State: APuU4Z9R5tyU6J6fD6FLs4BDlI1PfmbmPalR3XyjlR0JShB7bKoQS4w4
	rqYW1G532bE2ovA4GX4Hbje3v2uf9E3y3gbHizm4jNNEvm0a1xSI2Lxi
X-Gm-Gg: AZFdTZda4co/KrUAKUUKMNxgOhlE5imRIWo0SNog8mvA0nYqZu+ZDlm1Y0FTChr/Mp6
	v66B4JBy2j8loVHYyCkNClFxWA3IU48SiA8tSni+pnYvGKg7VZ0xAxKk5Xd0jH+B9w22C/hrBCd
	XyWJuwy/WAnqjHiJTCcXuoSs4KE5VE83ST/tvi/tvSTrLtBQCq2yVookwRr1HFSfGpXT4/ftP89
	6cHV6vNVEyhEpTH1x2P3wvLbejFJLljOrz4vXsKe/8A/IB/V8NkSkHNkN8B2MwxTppbn2b0Y07b
	JZ23+lrQW7aM1ObZjJp7O/PEnrMEzCLrcpWgjaUovWA2iD1CyKgsg4SDgIwULDe9sVcE2dy4WvQ
	bb3Pas8ZuFrKJJQXDbF/puVnvXMCdmqxUNSrnEcEFuKZXeRr4vYveJbUd90Knyyn9DwjH9R+pNJ
	tIu12nVC2QK67sR1U8yelR+Mi3co1Wx85lSBmVWwZAn706PiUY7ofygnylBg8q4ZStd9nJFUvVi
	w9A+qrbLIbKnmoCWLtotdG1hm++PJRy04hROPBU+g7Jd8HkqchXG2eDqfz3+qZdWunxd8r1V9qs
	qnzh4sLEkI+/msWGKWoZvHJSZkzlMCcA7mbuO71LuKJKXU4=
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr353961815e9.10.1795780882841;
        Fri, 27 Nov 2026 04:01:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:21 -0800 (PST)
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
Subject: [PATCH v14 07/30] crypto: amlogic - Move get_engine_number()
Date: Fri, 27 Nov 2026 13:00:40 +0100
Message-ID: <20261127120103.1532882-8-jnieto.alaber@gmail.com>
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

