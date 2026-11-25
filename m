Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638160;
	b=cptDCkw/EcmQJJ9JiF/K2DM2vw7hKdRM1HFTJO9TKSZrCPxH90tUK7TsMheNW6yEY68+
	 8RDY1/nU4rhPvt2nHvAeUBoEWqNt0YxwjxW/y39r8nPQYZBgK55FJPoDs01DNe+1uuuBd
	 yc0/fSlmAIxYMxFerTp1InYtaEfXIB+jlRxh0KllQnY1TkXyQLxfs0ZVSbk9xeDAU2Oub
	 qYD7i+He24RwrDaznNL+9yy2Ty256sJyGOCOdLpIH63CKHDxfGmZyeT0AW165TGXxdYhb
	 l31Yxr6rdl95cU3gv2Yqe38W84PZZrFFXq+JWfhzyDzwy8OCH9RloOFmzsbNMwJaTGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638160;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=1lkuKfWbZDWFuBg0A1hsuwCrSIaJ59LEhxzzatqQpNY=;
	b=SJspUvELEzwvJynzVsLhHw5xEwyNfak2Pjh1pINoDm/YMKmxVm/QMKyWHCk1N+o9Lz/+
	 sDGUqydqxG5aUd3T9Wf3vqjQl1xaxig9C1h4Weu3Bfeqq64jw1iWWvfecN+UGVZrvxSa0
	 2VFw7H0OulmwYwnViAo7pWzW5I7Oipkg6iMThX2ZpjC2W3Kq68VSQiMpbuO50shX22wl6
	 bENIac/hgu021JSD4yU9ucMp7827jCZ5wPK7YpMq9Nh3LDAHljbcISH7nPuE+1GKHeXrw
	 VOfeVWo0ItVE3hxr/3259UjiHqbAFz2A0k8HYa1jwgpo0xdqyjcftIIRpNXBeqpaCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B19606A6AF
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B19606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4cd576f2aso46978537b3.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638159; x=1796242959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lkuKfWbZDWFuBg0A1hsuwCrSIaJ59LEhxzzatqQpNY=;
        b=tOZ5lFZk59+MZt9i1sdG/nnFU9m+P/j2YtWRLqG/K/0ZSj6eb5mjXWMPOIN5Edl8xm
         nOUbL3WcHwKRmFnhHUXlbJoxp7XsnosHlYn6mq8BkmkL4hkSCOIlOycedb3IhgER0t8V
         3qFNAQPG+348Vux5iExdTjkhZwlJeB11LvBCq/4EVlj3ZrmOvn0LMbtFhblD4ORT26dr
         5r/g+B1X0eGULYGFQICHTIyMv3ejmloU5LawzAG3XdM341ZoXNBxGcf5BRQWzUjTmFi0
         rlzwDoNcYzwuL6TnT9DS6QqJZcYvLqhkgK1p3f12acLV2H20E6RRkLZ3wFWVsZgyIP+v
         x88g==
X-Forwarded-Encrypted: i=1; AL+hErHTFpLiYx6yPCjJCgPo0qIxTPz4QW3GOzx4ZtU7Hren2PUSAbdiCo9BbTtqGM8ErHdZTpNc46/DJzTZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/jg3LT3zrgOLDD9Opm1rsWihWj9818TRWAwuNPmIKgZsW8LfI3
	X8xtAfdJfc36f1ryVYt8PVojOSrlTn5jHP2d1aY92DQmIlAd5nOX+rrkM+pXVXABjGQ=
X-Gm-Gg: AZFdTZf662hxsi6JaFe7d0stl/Z/p+BAKQuRceIrkJ1Rn6zp7Z18EYfjFwlZImvG0we
	Ob12p/fAe6jVZ1N//1WogSUmy4u4Xx+BTwL6Y75kLe0dgNzScp2zAtzrwTYlvIpTrovDuLSsakJ
	nejOfWhu2vlRHOu7N7OJfjSNdGuAxO7Ovf5pPUuYcXIiIaBIIkI8GAMqEB/wwox00JYoUT9uAGQ
	O0KEBCYsPJkmb+hRaM1VBhjBTATp6wOzUljTU3VI4hWsy+RKxBr8sbS5OWNWEi6AVot/DUMHETZ
	ynP2byHDFDc3L5Gxi1T/9Gc0wtFeIPdighwBPKjo64tnTxyxYq2IF4cNpyF5l5pHqTu1bA+KyJr
	f9cY15nDkbSOJT4g92ylO9Tg1rIec4XZxADFoCZvrZPcNWQfKRQlncqKVffYnDCfLX/DJYFfqIe
	0tGWFPU/BCWqcNw7B2ViIjcTIb+NPf3VwNAoOvUvLOYHaEKnPwIXbYa8n+OPv2cRVGZbyRk8THu
	u/EzeCfKN+yRtmkZuCxdcrvjacCuBvBqHG7aoEN6egJ7gZXl1MgJj7jn4HRd47vF/QRYqaQdDtn
	9KX7heGz6/31LO5aovMWAiSFiWXnV5cnij2h3ZGVjO+umlT0gSV3ILH9Qj75lozHaefMKht8XxL
	WuPyEWNyTLcLQZquXlHIZ0mTv1bW8ToBQ2eZU5kxb9nD9Fj7UTqhBDzen9egbDbGfyNWU1PO3Gt
	r7s8yU+UnIUXUegjlRbznznzfZg4Bppnw=
X-Received: by 2002:a05:690c:6b81:b0:8b4:c191:195 with SMTP id 00721157ae682-8b52051969bmr90063687b3.61.1795638159548;
        Wed, 25 Nov 2026 12:22:39 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:39 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:32 -0500
Subject: [PATCH v2 5/6] iio: potentiometer: mcp4018: Move the scale divisor
 into the per-part config
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-iio-ad5246-v2-5-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The step is kohms / 127 for every MCP401x part. Keep the divisor in
struct mcp4018_cfg, so that parts with another step size can be added.
No functional change.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 6ca6cd7cbf71..75a63a01acef 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -26,6 +26,8 @@
 
 struct mcp4018_cfg {
 	int kohms;
+	/* Wiper position divisor: R = raw * kohms / div */
+	unsigned int div;
 };
 
 enum mcp4018_type {
@@ -36,10 +38,10 @@ enum mcp4018_type {
 };
 
 static const struct mcp4018_cfg mcp4018_cfg[] = {
-	[MCP4018_502] = { .kohms =   5, },
-	[MCP4018_103] = { .kohms =  10, },
-	[MCP4018_503] = { .kohms =  50, },
-	[MCP4018_104] = { .kohms = 100, },
+	[MCP4018_502] = { .kohms =   5, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_103] = { .kohms =  10, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_503] = { .kohms =  50, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_104] = { .kohms = 100, .div = MCP4018_WIPER_MAX, },
 };
 
 struct mcp4018_data {
@@ -75,7 +77,7 @@ static int mcp4018_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000 * data->cfg->kohms;
-		*val2 = MCP4018_WIPER_MAX;
+		*val2 = data->cfg->div;
 		return IIO_VAL_FRACTIONAL;
 	}
 

-- 
Git-155)

