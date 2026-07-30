Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F733D75AA
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447051; cv=none; b=eIHKBpBipQhPglNMJXntFICtcsW5PYdNYvrxQCHFnUjyJtGX9f1XmqmL0XhGno6N3vODdyen0+8+Snv86/fzqknulsCV9Ypci/66KK4oKVVapUHTm5tdZZkkaIhtcouQhQXuGHpOx94s1ebvV7GYMlv9C8EZLn+NTFVjwI9Y/+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447051; c=relaxed/simple;
	bh=+gw83Mh3Ir+pTpfrq0+pitALUCJUqx97EkYCdiBEbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUcKdyx9+8ztyy7VDvXAiZL9BY+2MwkgrQ+jnFi93LKSJT/N0lwRyMdAA++/X8bM9FLY9jjwabRZYMABub2l73kXXkdwIrjUoYUxIkmGLPylCaBEL8IxZ6xr02feNsGihIuvitrBxepBxDZfaTPGapF68HaLFM3ZhLi6wJMQUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPYCuCDM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPYCuCDM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacf197759so3532565ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447045; x=1786051845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=GPYCuCDMKNN9IXev/qhPXsoqGCN+ktSnjkpIwop4bw4KNbxoJNX2sfCuxqmxiFJNVY
         BtjMtUtAc/ZPBJI8GgG4dl5hnIvnkLvLbbwaaa2IIBPE3PzTQWgL876ySkjox4Xzy+4f
         B8vGV40tbOJK5dlZEnCHcEnWB3FD0bEUduE3BQ6GaN2Kv+02oQ2zP8IdVBb66PRgkG9r
         7L+d0nm/rBiHpZSKUKMV8IQIqo3Xi5yVKKE+wikxzXnhZmi+GH+REPSYkKB8PNOrDrk6
         W2cv2hZ/fzulqksf1AuZazyjNmUVpi0n8LbHVVCQeBQJaIm83IxN9XWNHZPbTSyPv/jj
         EDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447045; x=1786051845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=gHJtaCo7j5Msu7ejUFUXzGV0NAlDsbedy2TYsDqyWTqR14oR3yxuS6djzA8lR9jxfh
         9TjBQOjsEYRALP1TTbdSte32qwVqQ7qLUpepZpFjHuylfnT1kLHEUXmaYu8tNDfRGGQj
         1tywtx1qZvRp9j1rOcuvLe95F1eTb53JVFecqR3oNY/Fkl/vJ+hw1Nqhen2glkp6IVQo
         bjY7/Y2aQjAfz0h8VQT37oYnI33T/G77Laa5Pa7gSzs3YRlPCIJjZHaSTlJCJNt8DT33
         Q5+obtwihCCvS+FFoL9ZkAzf31C4I2Q51nlhkO6K+wsF+NtAzSpdicljdq1QzmOlU10R
         fbOA==
X-Forwarded-Encrypted: i=1; AHgh+RqSD0WtV+uRyxJkxyNtdJBDqxbVgWIZGXa4TzE/A8vX+JzqRs1R6luhppl4+ChSg2qkCxfcSJw4oOel@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS6KtkSok2TieGlwENc3CBLmnlPV0AgY2hQ/h33gf4q7qrYHt
	ljU2xt25ROxe9p7DHLeAqB3xXFZf46M3XghRdm6rqvFErs6MDs1o+BTj
X-Gm-Gg: AR+sD13mUx8qvAADrQ1UDPGtNZpLnq98BRKv7ktlaUKK3OZVh5o6dQ4+FuBisPX5tqS
	jA4JsBzxAWK3Mv7QTYoLZ05z+GrMAzAjTt1yIOMck1OiPoebUQ897sSmFUgQdchbonOSpqHvLvB
	UiIhAzvHVmDIyFF9mOLY/J2Wo4RjTet+8YO1NfCrQ+lH9zoSeU0BB9fS57UN9ay6Ke8NEkmfoCm
	p1UtahuRyOCrXC8CpjM4yguN9F0SGWk7Ur4uV30PBgqNuwjz6XzgDVyDyA+8oAWg6ahc6nYl1Hi
	SeiuJQxp2EIrETrrh65J8lKrofIIPiCsSA4NLgClzQR3dDzMLvS5SB6sptsu9QSOWYSv6YMu149
	rqZax+eodTjXGwnaCEnpJhR3WzwzAZCyuT/MbcdG9L8YjZ9UKIl/FpzkPmOj/cp6e4LQjroGJxr
	GdF6MJM/PLfrCHTDVxyRuMQHN//EnxUrddHaH/Sd0MCpnz7ZqsBjs+nRpe1AW9ItgfNDXnAOOoc
	P/B
X-Received: by 2002:a17:902:f64c:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d035ce5f7cmr42775525ad.34.1785447045138;
        Thu, 30 Jul 2026 14:30:45 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:43 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:29:59 -0300
Subject: [hwmon-next PATCH v5 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-adt7470_thermalzone-v5-4-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
In-Reply-To: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
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

