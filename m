Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E5471412
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935761; cv=none; b=sPYByz4/Vc3eloujfaYWlIdemnJADwXXK5cWJWgcFAugHbLJbkge1ImX6/tPRhemEogLqrsqOvbh34zP4BbsLUQHkseCPC4W8PxLm/pkD+r/DonVEgn/73lyMT+0TdedUgieUKV14NM2i6YSVfxXfW3tiqZyHOF9TzvhBxEL/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935761; c=relaxed/simple;
	bh=+gw83Mh3Ir+pTpfrq0+pitALUCJUqx97EkYCdiBEbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fn3hAOQVvgokqRnrjB2GC4hNFZJo280Ue2+DuhaVICdGOuCx2S49Uy/glAAWPLBX8wc0Hq1fjhXFWwBuqSTDNXxJd9Vv5oz1i7fvpplOkjtY7Bzvwp//OP6OcheNIbtQ5Kbum0b/Yv2SpfEKvBhJSCHsmsFfyFC+HP4uJe/Ls1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku0EsZGG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku0EsZGG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf52d15d88so9358085ad.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935760; x=1786540560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=Ku0EsZGG5qLwyKd1DIO9dwrzIPWocFr7AkGTsPDRRVGLc9SaUnJOEiF/nekL6gD3VR
         W2o9GIv7wrCNi0dk9n5pHvCKEQvF48W4npvMTk4aKoZJIyEE1kUR/aq0YrsBsHnWBayG
         fVXPjJsnJOYbvO+aTu6SPqYdk9k5kWOKA5m3sbrLSynkePWPNuu7U3qOmbODicaIjpPG
         DMX1BqQmIX/BBsycqviMYuu9zTwAhGtgoHm8HZY/T63ezrvAhAGN9ZTS9zngVDNNvqhY
         uR5iSq6ACw+zKr16cZgpp/PSKv+elLvpOi+GvnWQPML0cF9MPxrxn05TPpI9fiqCBS9k
         4LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935760; x=1786540560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=bkCNNCt4gxIbbOb32DCfF/YlEsuJR3fwxtXLPpciiXgCM+AiHRE7lpRp/eWZLNxpw+
         ZLtEtHqcGwqBdU07Dv1cJ5flOEewz6QvAO23Phz1GT5Ah7i0Dkx5ycxbBHsQOJXVSDMa
         Wu1GxcxsC0dAYh1TJ4bK/QaQqNjRnAeVoFXnJqg2lBdN/ZW8pdpHLmgYOCQm783ED1xn
         BsVqRyF1bPNOj16MxvGqdjIfdM6qD7K2+VVH2oBQejkUe4r5kwzYlLfeIQHvrfI+HddM
         nYr7KsKEYAFexktI2iLfio6VJfLIgqynwVB2sY5uJQ1LXZ9HamxKLv9CZK3uYB30zKeB
         Xtdw==
X-Forwarded-Encrypted: i=1; AHgh+RoQC1ojP3MH8GVZUg8K/jGTm+4ipBZDhnSQguoCHe6/mjQHiROF9+UyiCvvFbRY5X7sknGKkpIcdnMq@vger.kernel.org
X-Gm-Message-State: AOJu0YyJq7xzyhZgqijzAeIDmVoBbZph/7qu1v47YgOnrYGXp0UGLlFL
	BxQJP/YpjBCBuFySq/P5zBvtBnm3OgcCnFHn5AQ9Ev+eG/HwJSjUNRsP
X-Gm-Gg: AR+sD12ute8KFE1pTsS0EAjNMXlcUYUB2qnlOB/wHgKPRdNngL8VNd1Gp573SkQYyhl
	hBw0RyUw7bzuZ82+2PKjFgSinL9tJ3CuUTWqW5COaXW9fF7kd/ESFpZCBdDPJEuoBde9QD0xOG8
	E3lGvVMWrD2p4SXSp6MUE4KDnIJGLkx9PYXsXfxGgsHl9H7I3O7HI8XBZbHb3EELjgY5DWTm6l/
	4YNI1fUqE1VeZeo0CQxEl31UEEmv7xWAnZpIFtyJQ3DyWkSNYgz+AIxfXKyHKvbrUDrRFX5k+mU
	mROobDkxcudvH6CZSiFi++mJHt0YcG8QvXEI2icl/jj9f89qeIJaEZQmQ/ew3mwHJzNKWwmrpZR
	D3xS4ay+9opY+BenjkHUf5kl8JSKTzpTJ10BCp+LBvUWfCcNm1T9Jm4GpbyY/+jqBoQr1qsElzf
	ZEeRZgvmSGrYZD9A+PQbhN0WtSt5i8kij1OpUPGkNQGzZxyF2zWzFiazt+9qgvynvIaHnuQGoL
X-Received: by 2002:a17:902:d986:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d0caa031e5mr82849455ad.21.1785935759549;
        Wed, 05 Aug 2026 06:15:59 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:58 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:20 -0300
Subject: [hwmon-next PATCH v6 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
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
index eeec3db0da88..f652532f2f32 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1396,6 +1396,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

