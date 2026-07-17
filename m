Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524F225F98A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321987; cv=none; b=TW9rKu8CRKT0UE3bT3paHgeRcQU9SrVyvxaEtBqiON2Zog6VI/RwcLvUrNu1KGGeL3ZaNlpWoxrtLpScIKYmB7LZyIphybUyfWKb/bqH0cHMt1UbtEUezpn82RZ7cS5tXlMXrcKsiu/+8NfIgsJtp5lhoDKRdt3ZunND3w5hqVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321987; c=relaxed/simple;
	bh=Kdez29RF+m6FsrlcEjGdPN28KX0lJ2ws3nkWv56Cdps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhDQBKm5STh4CQKTXdJ6J40zRuBLmjAVQ8V4JmAAm+gTQIiXuJEf+1AIhERbByZMPysra3Qa+5qwTVR5UQbOL8V2F0Kk1hcAdaHVkc7Yzgq1KEA4rfAK0/+dAgJD+a6HbZHz8ruwnpduduMsWfHbLrs+JKoTDWJqL2rhGfXjFZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U61aN/Hx; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U61aN/Hx"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667b0ced2d3so9571876d50.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321985; x=1784926785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv/fL35f4caEG98+4FMRujisrJB19L+8TqSLjVkSazE=;
        b=U61aN/Hxvnjv83E9eLgbGhBhfNivmnWdwHiP+g7S89b5KGTmKZXFptyR8SRkGPvEHJ
         XoMYdknPMsWt+4+x7INPkR4ZngdCl8Vk/2cafpCef5ANLYjiYw7O4UAcrRSJKBjNuzwE
         iz1T6SWmzMS7VmoGqqM43VyAa5rCty70rfaKFa/Ya5/P9PIflVgAoS/5/C72rLF+KbiF
         OzVKAizWyg/KmK7/gyjLx3PEgw41g8mGdtXBnN4Osd8fhBtPfn1YecuVxTRL4HJ0kj31
         p2kBLMt9UWYQqxZhFEdJ4rRTbrhRjMqpPatLdUQwMTVG3oZrxq9Q63JFaazUJVeAiCf5
         l8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321985; x=1784926785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fv/fL35f4caEG98+4FMRujisrJB19L+8TqSLjVkSazE=;
        b=tXcE/uBx3KURPVIVk4y9lhH7mMTQcEX3/c8vEOi8LJMpzs9q53X+dfo9ZUDiQOFJx0
         g54m+st+DYexEEJsfzjs35YlLnU0tYi88rTo8hrD8Y4xkzO76p+Zwx7L1TRlhO288e0k
         iKBB/WIzgZiuXQEMouBHXJ/1052656HTnMGWHs9LHand1dI7/+xlTty1Rsz/1pen8xOZ
         EtFl9mVWmW/xqERxRPKjFE7+hN8dLP6jKGJLhxAPjkD9BOI9kqX3R6byB9SrKtRXZ2hd
         bLxWitigYwYy0WLCg1/7lVjeuh1L0aPSDVc02+aMxWAg5BO9fiX808gVytDKDZvq2NdO
         DCog==
X-Forwarded-Encrypted: i=1; AHgh+Rrr3aX5R98YGilr8bUeu/sT1LuGShZa+8SfsQ0Iy64OXQKE1M0bmyfsj7wN0//DqYu36qLndjC3Xv4u@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKOayCYUjLJkz5X3edHtwb5L06LkLrXjM4cavaj/bfeHtpjz2
	Jy7QfFvVoJGtCWmYfAchG7kdAJGB+62CThZcwEy0P6BOKOKyjNHl44/3
X-Gm-Gg: AfdE7ckkq1KXqYiV0JthbpCpW1FFqwp6fjYGjuIZrESf/1padAadxt4jYXSS8aErIpq
	Nqgi6cQ+ac5Xu6mwXwO5RfDJqLVvXeExnNDQJLmDKba5f9RGgkaXwl2GVz9cY0iootAAPND6uhk
	XD/6RU8WSFSKYdRKRQMlcw/KauOoBZM5jAJcErusdvTUZItpiHBATegocllb7fdFa9heSGU0I5A
	tUP/5/7cT4nZ32mdpQ6nQa9UFFMTWUldnwqHn1lfaV/XjSe7WmTad+U2/e+PtJnrjdKsZFzBdpv
	DirclTtpyPn6ZqhSmkGzphiDtNqsx9l323HAWvg3s3LAk3mg/BVLhW60bihTVivzQGq1chPp6GK
	eEtSax9q7IRZUYbbOmvKIKrqGHFmF62/OTfcWTh1FSRxv9D5BsjZ0GMaKK0Bq9uMrm2Oj443FFb
	RWk6MJY3yX2BBNTpXZ
X-Received: by 2002:a05:690c:3a0:b0:80c:2365:8756 with SMTP id 00721157ae682-81ef252bfe9mr15275427b3.23.1784321985191;
        Fri, 17 Jul 2026 13:59:45 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:59:44 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 17 Jul 2026 17:59:16 -0300
Subject: [PATCH v2 3/6] hwmon: (adt7470) Fix busy-loop and I2C flooding in
 update thread
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-adt7470_thermalzone-v2-3-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
In-Reply-To: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

When userspace configures 'auto_update_interval' to 0 via sysfs, the
background kthread executes schedule_timeout_interruptible(0), which
returns immediately.

If 'num_temp_sensors' is concurrently or previously set to 0, the
msleep_interruptible() delay inside adt7470_read_temperatures() also
becomes 0. This combination forces the background thread into a tight,
unbounded busy-loop, hogging the CPU and flooding the I2C bus with a
continuous stream of transactions.

Fix this vulnerability by raising the lower limit of the clamp_val in
auto_update_interval_store() from 0 to 500 milliseconds. This guarantees
a reasonable minimum sleep window between sensor updates, protecting the
system from intentional or accidental I2C bus denial of service.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.org
Fixes: 89fac11cb3e7 ("adt7470: make automatic fan control really work")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 481d51617f4b..77e7be692790 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -509,7 +509,7 @@ static ssize_t auto_update_interval_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 60000);
+	temp = clamp_val(temp, 500, 60000);
 
 	mutex_lock(&data->lock);
 	data->auto_update_interval = temp;

-- 
2.55.0

