Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110614;
	b=oiaxXsKI+4l9BpP96SkhS2otUQ/UJMKoQ4ASHYYN5zxcl1/yO0dtSk/F4XK7tKvPg3Jc
	 7VrsM4ZcbRJ7BLNIBKe137fPOhpAI+6UrdrK3xXkJ2WTjFGAN8qaNkeLf3BJ3SA5/xCpr
	 lxJ40xMhlc/6DyoNWgwzW1Ozuj4IUvxmK/7mpvvPsDE1ZyngNlAksSu4UQNbN3IagbJQl
	 8y2p7t+EpFRwV4zO2hCfkUjdmmgMnQZoQ0DHZVCgINNMyF5iny49+T2mwvWniNYVkutox
	 IRl9aDwfnlIdRanVpAtOwpo5VP3zKtO5NL1LBkskdEhurI2MnW6DmP9nJPiAVW92MQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
	b=5bll35FruERuhYxCdk8C0x1Ahd65PgT6gDf5G+CxhOmDWKJzPTGk53/yY0Dn64HWKllL
	 FQpA49Fymg8d1RhEeufgEL/iCkbZxhvVqFxEbvpvfz54OIKES/abPtZtbeCv55LdoPzUm
	 Z0kS3Rs1YKQ0EpISW+pItcx/BXxsZurjMJ17TW+5V09u+mNZYk7cqC1RmMgpuUe1ppqqt
	 egfy+njMWBjySqJ7P3PH0oxgiglaAVK+pYM1+tA8UlgK0AYLgXJ9qD3BoPALwoRkIIYhS
	 Nyqer0dc4bAJg8eYzv/P1lnbjFWf0gqU3tOHRyrDuFIzV2r6rE7mWIXsuMIk3wfnZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAAC60A2612
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAAC60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so20455405e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110611; x=1795715411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=pipCExcaAkgn33Jj+6XRGBrNhCc+5e9sj5XWlJo6lmJ/sjHGiZAeX5r2xVCdiCNUfI
         IIWErUWiAWY+B3j7mrp99xi/YrTIjNUJmkgtKvMfFAjEQ6Sd2c/u5fSE42jeEhPhMuKf
         T8/lzLvWPyKKXU1B0LGYaxfIjgAtb7+6pcaSd1U9NNSHH3gq+AEMHQ4/k4LhsUlyBHP4
         3ALctnth2LWKxHQHdzsj9TEau7rdpUow+TvP/1XU2wF2xnLb0txNfNYpf8LiZpbZOyI0
         zwyGZcgeIuEYEsujTM+NBjqz+fMizNvqzmEZdGcaxL3JqO3Mzt50eiIn30KmzBfM0KzR
         rNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110611; x=1795715411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=NrtX2ZVqMda6XscLCVcH3RVrlRrcnS+dCTzeOt8oMYgjng41OYLWx+6g33Z8YILpPT
         jL7XSJtzYZb9nmK7B0jSr43JRRYLLt7u8XauK7HIKnIvyvO0w784fQskLFVC5F1Wwtbc
         R1viqarcpiYHG2KzrZBlvOj8CUrHZYymdc8FJh/+90C+5k3pSVl+TyGKKmD78DnbimBK
         bIv9P9iNi++jGdssYyTmE0S4cL6CyFViYOCEK5EFJwwHVlucXg7Yhmm9f5mDlJdo+ohg
         wzNKHJ0hXlhB+J2g0LR9+2vuFw8Gva1C37LeVcBk7A3iLzESIQWmWpVt4PGpW3ATC12O
         MHfw==
X-Forwarded-Encrypted: i=1; AL+hErGhCgjqiy8y/iLoug1RlnbOResPLk/xoEkUn126cgpzIDGhxOo9kolonq4UKzi6waEYGyb+r3N7djKq@vger.kernel.org
X-Gm-Message-State: APuU4Z9XI1DJ8s0kCvZzd3r/5Ao3eqzO8bzM/0NVp9fjfcG1IuqJd+2s
	vNf0S+HTMIdQJXZ5TIb0QHVjs6aVvezeZb/rg2VE/GhsxElk2We6QFCvoIZ7kc+A48o=
X-Gm-Gg: AYBFou3XQ4NMSlmphH5XZiO+2sLq4raH7ug4WmfGrKcJuAY9AfCXW+16SF2JAZQqNPF
	K0Xqmc1u3KBcT7yM4OMj8vLc1qDfGJpeWLk7Lzl3ZPQKUZ5br91Zcsx3av3gGhkqLbEj4EbuaZK
	pdP/YAPKXza09SOv/ofil2BBdxp/2S91JCQu6LyOCjMtzF4X6W4umIjO+RSxJmw8/L3iLV9PKFz
	QdYR55yt4BJF1C0a8k5UBSZ9t5RLxRBGdHmKL6MCEMMz9+DgEZ4fZBAeemlz3G6stzQsqkywdM/
	+BwQxXlW2HFpV+Uzo6Agn+uOWuA/KLxkOzi7V90vs7z5VLpF5cQzhPrGNcUtsKsvchwVP2eNZD8
	fVltO+0pZeuaBdHpN8JuwpOqfOyGfd/5c/UNY3WxcFBlytFS80DyrdB3THHCTG641xlbBIycLVL
	FMzamHVXqRx5+q8lv0x7QOVxxLxqIRtBrhIP2v5dPYPuXEvsxFxCrQoFsXTcRPVMzVvgWfyHGdl
	Jk4cZyrfhJ3mGxEy66Af4aMJWtAaEZw2qRYzbkNAK361227JSHOLmt9WI3VEY7R4SZ5alIRQkjl
	EkgRPMUfYA13DfFle47gb94YKbFD3D9CbzDxZOV8xto6aIdCr61i2zE3o/XAB+AOB4FlD5u4MUT
	nFDHbZ16uYsrYEqwnXmNK5+jNA//aD/3Kxt0uA+A0vQ4q/LvvpUJpwNO83cJjkdRNPaBnB5GvDQ
	m4KPk=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr8080595e9.2.1795110610855;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm53032625e9.15.2026.11.19.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
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
Subject: [PATCH wireless-next 03/10] wifi: cw1200: bounce SDIO transfers that use stack buffers
Date: Thu, 19 Nov 2026 18:49:55 +0100
Message-ID: <20261119175002.458988-4-arthur@aheymans.xyz>
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

Register accesses pass stack words to sdio_memcpy_fromio() and
sdio_memcpy_toio(). Use a heap buffer for stack and non-linear
addresses; keep the direct path for ordinary packet buffers.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 35 ++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 2b6afe221268..1894359ee9b4 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -10,6 +10,9 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/sched/task_stack.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/sdio_func.h>
 #include <linux/mmc/card.h>
@@ -61,14 +64,42 @@ static int cw1200_sdio_memcpy_fromio(struct hwbus_priv *self,
 				     unsigned int addr,
 				     void *dst, int count)
 {
-	return sdio_memcpy_fromio(self->func, dst, addr, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(dst) && !object_is_on_stack(dst))
+		return sdio_memcpy_fromio(self->func, dst, addr, count);
+
+	bounce = kmalloc(count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_fromio(self->func, bounce, addr, count);
+	if (!ret)
+		memcpy(dst, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static int cw1200_sdio_memcpy_toio(struct hwbus_priv *self,
 				   unsigned int addr,
 				   const void *src, int count)
 {
-	return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(src) && !object_is_on_stack(src))
+		return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+
+	bounce = kmemdup(src, count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_toio(self->func, addr, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static void cw1200_sdio_lock(struct hwbus_priv *self)
-- 
2.56.0

