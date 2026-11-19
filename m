Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110613;
	b=B2yAyrjRWq6An6SD6nrTGHiV9uwoD9UvrKMxtrXW63LNYkNwBoia82TvhbVyBeLlp63S
	 OizYFIq9zN2VYGPFDNg0XC8uuMvEGh+f2kGPHEY5lrgSoYSWFFD5O/9rQRnlP5JhL6FTi
	 jDjnEAqpvRkvgLbUX1twnqakhcolKyEppQXauilgvaPZXjgKbyQHo1Jlv1h3xcccBeeRh
	 MxmbUGXil827TUYE5NH0K77znaHNFCH3WtRebMFFvC564F4lo40OqRLnODwsXjM6sOLJw
	 PwyqEZlmuwe0CCQOiinInqDrpxSgfP0+G/5CyYtN1Z9s4h53tT8KImVC+yMO45scUug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
	b=r0sQt79310li0k8vjbzZZGIAExDDrGAx7sUB1pfTCGYtEByZSL9K9n2NAg83kcjO2pB+
	 anC9fpERlRuAOUNtrh1I2+Lt5hSPQEkAGRqq/OUXP4db7u2Q+r5ezN0pqD1B9SY0MOOKo
	 ikdy17yV9IxYuKIaDqSUdZpTaoOg7PNII3oc5eCB9NzMnDQRcWGtk+gKyMge8WyfiW4Px
	 O1MLnmSUxqLrbP2ZrS+pXDToiD7GFkTz/wEXwas+Y/ItRyc5iQ5IOmK4t7wTUGfOp13GO
	 fWrjVQ6HTHw9HPXFWAO1NtTsd+QqbaPxM2DG27rTrr2f7rHTIUfVd64cSdW6FbgSLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93A60A262F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D93A60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so19517855e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110612; x=1795715412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=gMr5ru9lLh5siTDux9OeJMjctF8puIy6nYysyT9y+2aXt30gBNSeo2LqIHd4LgYy3W
         W0xYnInGeBUJFzMeXImmASrU0JOYIksebNC3t6YcmeH97eq3P36pDRT+5JJ+FyfsG7Dw
         3QUUkbjuahCxGBtzHeZi1Dz688ZBghQ8eXw51SPAOjg32nIfMgEN6B4+iZArnmGVWKDZ
         KMGYy00pfZsrXSuLERVR40hV3dFbwvDuSKmHfWIhL8dWSP8VOKuQoHzoTXAVcOa3rF58
         KPgS6QBL5VPg2PT2fEw6KWl8hnNJ708LdPoON05k/vfQaV4nDvl++XI2oRl/Y5bqHDwF
         T+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110612; x=1795715412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=UUrvA6wyyMrk/KS+I7cCQPHu6u+6H3O3bdTL9GXqJexjbAKQ3LwfBNzlJ2xCA1h4/f
         DskRXWIK57TZaYqPTVO86icNWGNXSx8vGWXA9vWNpt64Ad3+UzADiU5XmppmQFPrI1u1
         17xArAuE+x2VrFmOV8YC9OuPwjB0SiuvPzIppcTYejweVmykh7tyjCMM39wQEBL/WXMX
         jPu9KnOEcgRnGqPSd5OfuFZ8gBGvgRGT6DYmhiyrqs3W4R5nF7xFM5qzj9ezpCGXXAP9
         JprUXRLslC6cjiHU/azJZvoc8JbwYtH98LzpzACPvXUoTEe6dRsrlLZrPcLeBI22TvLH
         cCmw==
X-Forwarded-Encrypted: i=1; AL+hErE64aQ+koZbj4j5adZkRA1n+5wpkfH5dH6LpXdtddXn3lhnrsNHrktOYPKkxSkfpuziZmTwIpe28Q7s@vger.kernel.org
X-Gm-Message-State: APuU4Z8g0xXNi8rNYOTO2cPTle8DiRQikzp+1U4cuWAPv5L/FNFNCxqp
	nTv3H0K8CDwt4HN0HAn472Nmv46nO96/3XzT7Y7g6XKirYjC3lzAvEN8q5BwXTTaMU4=
X-Gm-Gg: AYBFou26vdGDuo33ue5Xi2v2JPtb8I5Ah7UIC3JL9W5X0Rnf2ishePuzEWTAG0bSjEi
	DKa3wfcn5pJoguToZQEs0g3OA0n51vXgWZcwXyHRygrL6I6Cx3Cji95yt4fu0oO26pzBROerZz1
	QFORQeVK3ET3hrWW2mG61cpGgD6iypgFUTj+YMvWgOm0uKGGqvzaveBA0VG26IFb1VX/nyyETht
	lpy/Kb8MUnH6Prv63snc4C6ITu/uYHseKYdLTjg1BknSHLd2NNUuPMzPNrAmLL5jB4ThkoawnGw
	j34j0s23qrkuw+toLcGNSZ78Da9ffYc+kH4zvgziYLTeLhlB/Ce0Ylat9gLgGafdKusr8hRXlBD
	w3eF156vJmTXL9gbK2oxpQNe+MsjVOFYFM6GMcsEVP9l/MCVVQHvK5ghGO0RXDFZGa4t1sqtm0f
	TgQBd0bkWJZ2gHSoHHhpbOw8atQOX+LJiDPU7R+A0+bJeg0Bi91mblaNQ7arTJEggcJ8/bs0eYp
	eH2ZdreBGVNuLXvXnz53Tb3TqFssU+qp1gh9zZM+PLoQLl9Fe4gOiEyovk99Ri2OPpvI/hDXES4
	Hb7NLcgxMsQ3yTJsy4hx7Q5ubNCXC7tH/swReBZzPEcIVQY4eBtzhVoaPnawKHOlU+YoIWDVcNE
	sUwk3slcVXU/blBxdZNU4DWbfYDsDWZvvN5HhkitCPiQB3xzQO8nJGYn9BwZ6HCSWeoZmo79B57
	pXnA==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr6739265e9.3.1795110611578;
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90733095e9.2.2026.11.19.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 04/10] wifi: cw1200: unwind GPIO interrupt setup on error
Date: Thu, 19 Nov 2026 18:49:56 +0100
Message-ID: <20261119175002.458988-5-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

If requesting the GPIO interrupt fails, the wake reference and the
card interrupt enables remain set. Drop the wake reference and restore
the original CCCR interrupt-enable byte on the error paths.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 38 ++++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 1894359ee9b4..dda201e69735 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -143,37 +143,35 @@ static irqreturn_t cw1200_gpio_irq(int irq, void *dev_id)
 static int cw1200_request_irq(struct hwbus_priv *self)
 {
 	int ret;
-	u8 cccr;
+	int err;
+	u8 ien;
 
-	cccr = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
-
-	/* Master interrupt enable ... */
-	cccr |= BIT(0);
-
-	/* ... for our function */
-	cccr |= BIT(self->func->num);
+	ien = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
-	sdio_f0_writeb(self->func, cccr, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
+	sdio_f0_writeb(self->func, ien | BIT(0) | BIT(self->func->num),
+		       SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
 	ret = enable_irq_wake(self->pdata->irq);
-	if (WARN_ON(ret))
-		goto err;
+	if (ret)
+		goto restore_ien;
 
 	/* Request the IRQ */
 	ret =  request_threaded_irq(self->pdata->irq, cw1200_gpio_hardirq,
 				    cw1200_gpio_irq,
 				    IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				    "cw1200_wlan_irq", self);
-	if (WARN_ON(ret))
-		goto err;
-
-	return 0;
+	if (!ret)
+		return 0;
 
-err:
+	disable_irq_wake(self->pdata->irq);
+restore_ien:
+	sdio_f0_writeb(self->func, ien, SDIO_CCCR_IENx, &err);
+	if (err)
+		dev_warn(&self->func->dev, "cannot restore interrupt enables: %d\n", err);
 	return ret;
 }
 
-- 
2.56.0

