Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780929;
	b=qRHZsZ66bfhrOBAPySrcl+fjVQhMfsTddUl5iCnJUyGaOVvaYyvaAQVWeTixW0B6Ykgj
	 yqaoNlm+cTxgSrt8NjKF8g59RXyX08IJQO9ppRRwFQKqV3at195sg1wxDB39750DN2C2v
	 G+WM1xDDpHqPTX88WoiIwexGHB6Sw+oRYVo878YuKMhiusmg/95gfa9spYww/MPcGcMc6
	 ZMNcWH+FjKHTbpmO5SVIQJs3jXycUpI/NsgF7KkZJXtqYJ+2NbpMu1XUANupuGKq5LwI7
	 S6ByhX/FO8gHGAuo1BPwQcCHgvlNwcTJ3YCNEgTFkzvE2laV4R6MaSrGMs0YZ5MDxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
	b=kwTpx8eYxcvS/EGqW30fqn13fRjHS7XJCvcMNQV6faIZt+1SrpLSAxyY3GrfRxsIdyw7
	 3AmBEl1yHQn+m1Ksv9UJ3lIXwLPtE9sHzNexdlO2XQJhlFGhAfffUKVuek+pFNzNxYhyD
	 YEHrvbs0zeuD1rrH8UT7BM+H/y5cfRNQf9zIqpr2Ac/4GXLwPRGOXYie642M3HQ9aV6VB
	 FoYsvs4JhBynTmFTCumoTt8udLwmcFpDgLn17IWrMi0pTjyHOkrNVpf6R2zvCY9BYU5eS
	 1tZjXSugzds7DBCqIAgu9ev10ErBd4pjeujmSu1G+B6eOSO1lgBXG8xVp0XtXmk0AbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNTGZnLi;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFEF606A332
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AFEF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNTGZnLi
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4403726f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780928; x=1796385728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=BNTGZnLi+nuoqEAUzLgrNo7Oy9isPiKJMMljUrMwoCTuau7ce6UNgXegXzXBs0iorK
         lnWHfVnP97mIv+91kT3kK/dvWxjNRO70eR+zZQRR31DgBtuH7tmhOq93LwA9p6pUHtVh
         RrCqjHLvyt9HIP+N5M0huvUSZl+PNf5pANw2O6SFIuthC5bwFNM0CwM2krpfSLf9iv7A
         GhaewoB/n4iWHosBwojXM9brEgDA6MdElr4cfnKSrKTzLWuB5qrm2CZ8JxTSaniy0Ld0
         rTAbu0eIie/fYeoou0PruDtvkHMhn7QQ8WfYKC+UqP/OKg5aymmtUKHWY/8I4m3ccW57
         N7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780928; x=1796385728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5YVvV6vHMcU5kHSKr3HyFQG5tHJwE0SH4iS9jSSmfI=;
        b=JO6JpfwWt+7o1fGfcGWoABs4omIxefX9cR/lL6nsyVTot9WJu/cFZh/fmhbZ8b+tYn
         i98KgctSnIvRGYiztMQksuqJS39u4wylyZx5qRdSPTP0ngMmyOMZvODYSBhoBVMdXq7d
         ikpYZJBM+085XWu0XgsgzFHcxA9YpcMSj3nIy1mDkhkygYWexlAWwTuRDS0TxScpa4L3
         GTBBt2r1OCBCfgCM8te224cMphkLAXIASJ+lW6Wtx0nJa4A4ZGVClOxFHUtuzRbb4ZR0
         FrMtd8kCWr3gYSE/SNOiNrxBkKP4Bam/CH0yE4bt1KD0WtQJM+AHv3t7n58CXtOzPPr4
         kg6g==
X-Forwarded-Encrypted: i=1; AL+hErHdtENFBodb+Qmz3UWK9TeBem5JEMh+32sY8sfwhrMnHjLNWS+npa5hdU4mwUxsNF7/+RqqxLl3XsDl@vger.kernel.org
X-Gm-Message-State: APuU4Z+3+4FjLcWV9p9GyUvFI9SqvG+olzncpJzPMgHhwx/dHsxt6NvT
	JXvyEm4T+tKjpjIPo/oqbFJjrTiIMybQItDQPqBtGp8OliHO0/RUZQdD
X-Gm-Gg: AZFdTZdif2VJEWfSIwbjiH80kaEegD+oDHdnm6PTExGxxGbH4IL4UexovC5qyEyN8n8
	63P6jjKO3upAejVeYwxewd4Ogh99IYrVMVcNPiCX/nIv9OcNBksMm22gdXBNGjOzR8fwe0BkEba
	xLIAbgJ/t7++/emd5LU36ytIzhtH410QGtOnBD2H+vN9aCFRAHbHzp/ObtIAt9OoTRheTGEKyvD
	xnSZVspZ60urXgiuRJpnG4v15mIjhFLRRtlcG2CCwwqv9UUjESM6wE6OP6wXsN/MgrN2nj/K640
	Hr+sFlkUIVMe3BSoxWebbHgxzO8+aRDv4aPSsBXgkxDGjSpi9QNY+07l20SzaRjduhumbsvifqv
	zL+uXt9hggu5jzHwOQrNUl65fhU7SbXC6t6zT1BnUO1r/WpaKC0AuZhNk5229A6tjWULGVfZJWf
	52kNAteTHb3Ow5PjAU383JVluANzWIH+P7cIbHP1GsplU68zsxLfV92KZw0glZoY+m0Z+NyqhMI
	PQkRJOLWaO7fohrSTbmddNcJp31zpJ2Da+Lkk7Vc0ciTNzyx5w0xtF6j3DM9NJMsgyYLwf7qI1m
	HsbzQcRk0JIfFA4p6b+GAWxvY5q07SJnbgZ4+6+zTKMWNf0=
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr464473645e9.7.1795780927493;
        Fri, 27 Nov 2026 04:02:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:06 -0800 (PST)
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
Subject: [PATCH v14 27/30] crypto: amlogic: fix probe and algorithm registration error paths
Date: Fri, 27 Nov 2026 13:01:00 +0100
Message-ID: <20261127120103.1532882-28-jnieto.alaber@gmail.com>
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

Fix error-path issues found during review:

  - meson_allocate_chanlist(): propagate a negative platform_irq_count()
    (e.g. -EPROBE_DEFER) instead of replacing it with -ENODEV, and unwind
    the
    channels already allocated when getting or requesting an IRQ fails.
  - meson_register_algs(): clear algs[i].mc before calling
    meson_unregister_algs(), so the entry that just failed to register is
    not
    unregistered again.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 8ce3f6640753..c11d7d8250ea 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -106,7 +106,9 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 	int i, err;
 
 	mc->flow_cnt = platform_irq_count(pdev);
-	if (mc->flow_cnt <= 0) {
+	if (mc->flow_cnt < 0)
+		return mc->flow_cnt;
+	if (mc->flow_cnt == 0) {
 		dev_err(mc->dev, "No IRQs defined\n");
 		return -ENODEV;
 	}
@@ -117,14 +119,18 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 
 	for (i = 0; i < mc->flow_cnt; i++) {
 		mc->chanlist[i].irq = platform_get_irq(pdev, i);
-		if (mc->chanlist[i].irq < 0)
-			return mc->chanlist[i].irq;
+		if (mc->chanlist[i].irq < 0) {
+			err = mc->chanlist[i].irq;
+			i--;
+			goto error_engine;
+		}
 
 		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
 				       meson_irq_handler, 0, "aml-crypto", mc);
 		if (err < 0) {
 			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
-			return err;
+			i--;
+			goto error_engine;
 		}
 
 		init_completion(&mc->chanlist[i].complete);
@@ -169,6 +175,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.skcipher.base.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
@@ -178,6 +185,7 @@ int meson_register_algs(struct meson_dev *mc, struct meson_alg_template *algs,
 			if (err) {
 				dev_err(mc->dev, "Fail to register %s\n",
 					algs[i].alg.ahash.base.halg.base.cra_name);
+				algs[i].mc = NULL;
 				meson_unregister_algs(mc, algs, count);
 				return err;
 			}
-- 
2.47.3

