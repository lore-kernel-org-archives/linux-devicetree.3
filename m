Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495C318EC4
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300413; cv=none; b=KOUQa07kIuRLSD/whA/bFBDl2cLs9GpARnBLOAIxSaSuAp8/V+Q3ribc6tpX06RC/o9eOOhWcHtMohSms6GouAq1cX0/qcGkrQGS0572X08fk3p8BVpi1vMfIycPGcp0nOAAybr34OIvN/hgjRvadPRk+XhnK+uhR03oiD/tYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300413; c=relaxed/simple;
	bh=BX7QAOofmDbVSjrT426QK7z8VWDtDhzJkXrvBic/mw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaQNEgi9AjmPMMzavomIIIFf3QQnZ5z8TmpEULwUh1S2EbdUOwJSp5gQTUXu3l0caCrw2uXPnAJf0sCejaaK2T41yb2Us3RWXW99NQdlbSPpr2hm/ZvJR7eGZpwqCk+JF4EMyPiubZhlzFKsuPINMz5gU2emMsebKBrxb7VxxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS6xcj8q; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS6xcj8q"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84874b52eabso721067b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300411; x=1785905211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=RS6xcj8qUPY0vxZweaVWknoIEl96P9c74Tklzwk27Tp/2xioaoNs9r/oxzSvZxPy/O
         mwx2kabXC7UneuDcshB9ah70iQ5WjAMNaai85on/w5LoPelBSJousdpKk4O/XTHzo06v
         rBcE0AdiXU2+dWvgYU1aztBWcxEPqz31tslzSJQceVAZn8qmYNb4WCvPJnd9YE9nM9FE
         pFyHrTQNkHMXnSwgEbIrve10O1NNF3QJJByU7Ix26BZQvC4bstP+53TsZBbuHLXN694A
         jChe8e2MRsVemR4HeR1gNs/czou33sxBeA2zonafGZhpCTGH1gjMa2P7O5L0tY+Ebcod
         sR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300411; x=1785905211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=CJ0YU+/wIHu/wP9RHLao7fN1VX9RseK7E8Ok6btWrxtqBwwTYAhY/6K3i1nLBIiEPe
         Wto7kR1/AHzwhlSPNH9LCwV5g+av7Ov+ujU4/E6UHB7JDUfMxHRh7yDgFhB8E1M/nyUX
         nEUH3XG9dnhLbz0Y2pQV/VFCi5+ClI337/F3lj58nfzi3888j8o7blLQdcveBoqumDvO
         l8STgUP8yHpmxkX+04mhnTKohBkDnR2+t7s9TVKQNW3SmrjyelxfD5pVKKXplaSrdOoe
         qM6Eg6Wj6vjfxSWXL0lhvWph5kP5R1WpuHgBp76KiCUNWRLPWyunGzOA/9Hgd5K4+cZM
         swuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeY0qELqQjyUQJ0PJ/gfCsWw6VLnaYUVSBgmotIJXypHmfSRZRrT7utleCN2uLHo6hU1vE1iYHOQ99@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjA7Yv05fYy37cOHMylaAhPO5pKNt+X4sVaXwpW5Ee0/feqIb
	sQx0Y4qy1qTF7NqBQgtT4lZybn9vE8cR6nse04PSplMYuneUJkYtkYPX
X-Gm-Gg: AR+sD10kxBYo05d9rEeUKLMUuU7sMzL4n/toAfQtlsxaFvAx7t9y8CZwjGRAbziHr8e
	RTThvkIOLJq/hCQCz77GFpHObdQqzkMl/Wlq31Ex3IOCPHK0EpnWJguh15mA//sHVqanL9khFKq
	tK7/83R8uR/ehDAV5w8joIYEqhvH+TTd9fiR0YQO8pMTwqkHzAB5BE3YHu18jTQHHwJVfrK+0DZ
	SWwwtPvvVtMMaCtS7yYE8F71RnwcH7HpiADJGs0iLRA88z1RvH4kooKvsbOp9FxebLxSRLoCxx1
	4gqj0nYyEcksMx7tuhyCv45uwvLwRP8Zb9rtBZMdhQYsou0idpDp2SA6+JwlVuDNWNBN9KStCQU
	OmF6K7UKj0XefzAOWF8x33wGMBqjnlYs0IKNM47DWavAY8jqQL2Z2LMfn3/SO6EwHUtYvxVSzzY
	RH2mB1mgglIt/x5jbmdkNvXHnNc+50xB1M+I7OW8s6vio3eqVq1gdZLjt/2bo3B1l4qXHJs2+5Q
	ecc
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:2848 with SMTP id adf61e73a8af0-3c8ba613303mr6543287637.55.1785300411348;
        Tue, 28 Jul 2026 21:46:51 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm4730437eec.10.2026.07.28.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:46:50 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:46:12 -0300
Subject: [hwmon-next PATCH v4 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-adt7470_thermalzone-v4-4-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
In-Reply-To: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Register the ADT7470 temperature channels as thermal zone sensors.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 883838fdcd7d..6cc246aa1285 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1349,6 +1349,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

