Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814807;
	b=0K9WRVWYd3CEvZR3qqucVT+ii/t6qyK8PrfChhvqBAqBoLoNMtJsWPfSjQB3sGEH8v82
	 1rMSTDmCCYXqwOFIgx5QXuQdKjAFbD93BkqpzE3y/sH5cAgj5jmncX2UK5BsGYNOudT6m
	 YcDwX2TUKQKXtv8auFKRnu1Z5/WjClrr9RLyHq83o9ktf+eiruC0UPXtgBdadgAokaDjO
	 hPSqs0lv/TQHWwsvbByxWbwMnr3BUgiQMfstakFfojMDAn+jW3CT7F3/sPPzbT3Hvh3IE
	 qo2EGjDWe2SXKw5S1EjqCgtMLnjG1+261ut5iFkK9Xcum0UuF8vhntw1gOOLsHYuRXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
	b=jBRzKNmPKvkttLqkqHSlmjHTS1M3jk/97M6oJFUKPGJVltSvrtZN8tTIVwUetcUT+FQu
	 sS1B6h0l60Scpjlban3qvtyyW0T6JKaSzv7WaekQ7G4uOI5UzfiBapM2goiZcov+GZaHX
	 l6MET3s1+3UGGOeKcRtnTvv2soGdZTbdid0QXOUHthvUA3x/W6jpz7P0DvGy7Ewi4z40J
	 bQTeUyL88qd5YL6Dcqfmm7DyzJr54dEFvuniekT1hqrZegDF7w+3+zTKtbUNArUX/CHfY
	 VVeyRyxcijqSXN5I5eAUNClJvo4prstu/4DCaOMf7Ic0mffUUZKBDHVXYXEM3YKhoPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxlGkhht;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2D606A8B8
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB2D606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxlGkhht
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1399524f8f.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814805; x=1795419605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
        b=uxlGkhht5mv0MZbfIcJWS5enQNYPPrn0khTfJVopt1uwsrxiZ38cqq8jkyosmbjgYz
         5F9SY3nvfwpt1mJZ+pG/oiXpK0xHYr4oiw+XvjyJRvIdKEXzPh1kL+mpBexKTB/MVvKD
         MgpEeKXUkOk4JV+xbZydfsFn6Sne2D1nhbU3MHCWs93T9sWewbPrGNF85ocnV09ToBB0
         Vg7hU3y/ugh8KYOTDeW4R9mSdVUIQrLaHSFx2WhDBxUKw/6LZyGTwCqB/G0UiEvIV+4H
         24WWuKcndH72pLzKUJEdSFdGFfoXMOwptllW1kitzbu7ZC59HiCYwUoz3cZ5St149oou
         b07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814805; x=1795419605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jj+IS7H9YDNdNL8RPmf+32zqBN/ZdmMeOeOXwXdvnNc=;
        b=s5ubqk0v8eHPaWKt2uLPzbad8b+AgNGbUMzCMWG2MmXV6+ZHw5iwARuNxm8BU3pHD3
         FIMK5cVaq8FpRERFO83Hy6RPmoFaIMjt2qFQuxCyuQm8LYQO7YT7rJ12LaUz1KJUGyrW
         GBgcz72+l+dihFr43nLah1L5/L5+DQ9GbSTYkjCB7crw/sMA6rto75jTPZxb5pYgHhfu
         GypSEp2SLK72IebWqhL461ktfIRMqyllO43LN2mp94JiYKcImbbRwtsu6xUUpB9HIipN
         r6H9PLFjtHuw7eqajumaMNR+FPye5InmtHBDLtMuItSPiKzuGtgEmk3egjTQalHJf1o9
         tgnA==
X-Forwarded-Encrypted: i=1; AL+hErEAUE2b3SG3ckvZv/moftMivAI+ddy9Ub1rC/vEco6Jtl8NgQDqOfLasb25B4Rk+BDmKX/tYQ8xJ+Ch@vger.kernel.org
X-Gm-Message-State: APuU4Z/QQSLSWoD4ZlFpgvzr/D/p0U8+bJe6GksvcukvOjM77s0M6e2e
	UCvsX/S0fDVxheICsnUIQ/ZrnoeCugJOalEzWAGXxsUzWNDtCgch4xLF
X-Gm-Gg: AYBFou3Gs6EbtdQnXnQV+QRYM+P2RAM7f6NYY3cl5BEIfu0FqS21+GbHDshb4Nm7P1v
	LuaPmqk5q05eyVWsKr1wNqXQOLmmOGfCdYntOrWkq8q21rRMJNvm2bmhrJY1gXbhKCQ38Iikhsc
	b9u+2juLW/8A7v52qEYlunhwpH0TJ3IDTSEwEv67TyLUUeMU72m9aGmCNQnw1BlBEA4aLpiFKZd
	nD5gA16vxXZRgoQGzPizpNyaI1tWpUy5xs8ptL42gU4ZU8bqNxc0fDQrm3jcMTGDmpdWNqdJuO/
	0f3asONmVEjkZLOTUJjOeh9ytE+Yc3rjnNCAbpZ0JiB/iaVN3tf3kJVQqCBvOHi4ffE9Gt3j+AS
	q4oBlazWmrH+QtFeqKdfGM1GYyxDwW95R46BhnxGsldfB4319peLUfa28+4xrF9Hiy/nZne8unT
	Zyw+5s4fg+VtJzDgUBV9w6055XM4JAunlWr8KH5S7YxtKWh0KeZD0eCBe21W25wFFybFBjT9tkx
	tvP0b59HK8s4TXSB5lKk5KqDIugXrCV+aSv+BOYohUeYpHtVAJxlAPV6aSsih1Jms3CrdxXaNA+
	D+77dyE6jksGxCDjeF8klXrlR3R38gM=
X-Received: by 2002:a05:6000:40db:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-49c71e3e248mr22685484f8f.12.1794814805520;
        Sun, 15 Nov 2026 23:40:05 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:05 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 2/3] power: supply: s2mu005-battery: make the alert interrupt optional
Date: Mon, 16 Nov 2026 10:39:59 +0300
Message-ID: <20261116074000.355176-3-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver unconditionally requests the fuel-gauge alert interrupt and
fails to probe if the board does not wire it. Not all boards route the
alert line (for example the Samsung Galaxy XCover5), so only request the
interrupt when one is present; the gauge is otherwise polled on demand.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index a76154e5a..9798a62ff 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -273,11 +273,13 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
 
-	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
-					s2mu005_handle_irq, IRQF_ONESHOT,
-					psy_desc->name, priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
+						s2mu005_handle_irq, IRQF_ONESHOT,
+						psy_desc->name, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	}
 
 	return 0;
 }
-- 
2.53.0

