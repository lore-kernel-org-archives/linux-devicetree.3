Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1493C3F73
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236919; cv=none; b=IEk/D+Fq53pztkAPD4Nd5FJBHCRMe1rzGcwlSvMKe4LMzTS67aItsbjrLLWJpYo4DorYx1mVTaOtihZWuev/LFw1yjfQ3OLt2NY0YyEFt/SaklwI0uIgeEq90gjYhAvCjma/5FEtyYIV5iEffN1SFVnqOil3DjPSUDt00NfDyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236919; c=relaxed/simple;
	bh=JD5Lp8KBOzUlFKcqEFqYNpeW9EwGOL+uYSqusXaqVIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rL8AsxHAm0qAX4uHgy3NpGcS4ilgMjtGRFHpwiyVgdXAwz/FY+JjT+vNNpVq80dpj1YNfdX4W+EFjuiYOJqxzwe9PUYmEnThaDVskkp3q26uDjhzViE7vLWrJqNlSAPUj2YwxjZGjwtR4pR4ASos9+HQaYHSzJhXZ7+s4F+abUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJB7aGiz; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJB7aGiz"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8114a4542b2so14790157b3.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236917; x=1784841717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLUXzNCOe0RCZXyD10EHKPfmRl2c/iE1pNVJYbsebOo=;
        b=NJB7aGiz8fKIl7h0n9uedQgm+0fobo9CG5WSWDq56vQkLe8EkBrh2KWGycGgDd8l64
         Ae4xAfw+OLvT8bDLZWvNxmmKbglTm2sWzUtBxWU4Ppd1jci8dS6/0w7PArhfx1KzMhvh
         +uemWOukNxi4J+pzX8tg6SC2xBC3/RwjF+AJzLaxzckFjPkwmxy54njRJ0xyyqs5ey/C
         /XQF9bB43XeYhfEKRh2AyR0+hoPC7RjEXr0yuuhtc+QdQqF0GC+paSzxZe+MYoZQDWWV
         z4qVf1NJK1gexAFw0biRLD/br4h8GtjfMyf4QhkMZHn3kv2U9Fkp9S1741eG/vwmHVnY
         Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236917; x=1784841717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLUXzNCOe0RCZXyD10EHKPfmRl2c/iE1pNVJYbsebOo=;
        b=Vy5QXkEQQfsz7LkTgZhHEPSB4aZVYMONBOkwb6l0Z5Gqnj5zwCMdJWcQgD7z+yf2Zd
         +ARXsutex4KG48LlEzSKnQsgmhD6Ku1JyNqUmTBSA4CQmD8Ovk2E4nnCpceSpfFSkWBb
         LMHC499WaXQO7iu0H2X4cOuiZ7DfigFOR0JmKvQlHtnotCmuxLrU3FqaPowLzyWOUpG4
         Y7W7a7Jp8zNd9OemSd0AT/oXThbXZZ3FcQNRt2I5pCR1XEjppkLzbXJk8qO7d8lx5h0s
         0YqP6XgVKVmHcngOuJ0H8CtZ5+jC+P+CmH64lb7RRZ4bBsd3N/eIx2sX+OxMC9dw29q+
         GMFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1tGlMoFK1iXaAWA2VbwMfVHmRxRdcH7xwTq1Wj0lzDFXFOfHciTIV4gGFL1GQ8mAtLQ7xblDTve+o@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAg+S1J7VwNz+KTyHz519obPGSWM08o+2wgZn55kch2+Wf9Ou
	hBkDBiZOpoL8dWk1hgrkwVJjcHtZUr2ssk6yqREc+SgPz0JBGAZKAH50
X-Gm-Gg: AfdE7cnLqON2sIu28757GDTJFPoZ0AiGRDiuAaYlwFoVSeq3C6gxqgWbZZ3b4H+tbZN
	wqJuaT8gQwJkZo6q5dJI1xE27MJu9hWceXTpKxxEGtaOKi5LTA/WLcuIAUKlOJic209eetl03B9
	WIXBrd4U/tMqRt0kdR1xk79i4gHVoX391//tRKxhCO65ZWs28IC2hp5vAe9bDWudF2LOz2Rsz1X
	ExOo7e+vqlP/SbGYmH72uPYO04zs84FAxcHmTLnBo6UCjnAw3UHAJnQngNWIpptQnBKb3i7jp40
	oXSn5zQ+bE5F2HInN1icX3B0kzaePCRw0irq7nnGBqv1g8VWnzcL89SWgszlQIJZtB297Ka/pRu
	Ma5j7UhzMmyw/gWcHALd9P3tBZsgSpW608aULVNMIWB/WTRodpdJYk7goJvGni7EGTVumlVDdhz
	K8YIeMt8ZT4XAnHdf0
X-Received: by 2002:a05:690c:22c1:b0:81e:bbbf:7f6 with SMTP id 00721157ae682-81ecfa6bedbmr67424427b3.52.1784236917245;
        Thu, 16 Jul 2026 14:21:57 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:21:56 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 18:21:39 -0300
Subject: [PATCH 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX macro
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-adt7470_thermalzone-v1-2-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Instead of a magic 255, use a macro to refer to it.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 664349756dc2..4ac292cd7f47 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -100,6 +100,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_REG_FAN_MAX(x)	(ADT7470_REG_FAN_MAX_BASE_ADDR + ((x) * 2))
 
 #define ADT7470_PWM_COUNT	4
+#define ADT7470_PWM_MAX		255
 #define ADT7470_REG_PWM(x)	(ADT7470_REG_PWM_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MAX(x)	(ADT7470_REG_PWM_MAX_BASE_ADDR + (x))
 #define ADT7470_REG_PWM_MIN(x)	(ADT7470_REG_PWM_MIN_BASE_ADDR + (x))
@@ -811,7 +812,7 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 
 	switch (attr) {
 	case hwmon_pwm_input:
-		val = clamp_val(val, 0, 255);
+		val = clamp_val(val, 0, ADT7470_PWM_MAX);
 		mutex_lock(&data->lock);
 		data->pwm[channel] = val;
 		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
@@ -869,7 +870,7 @@ static ssize_t pwm_max_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_max[attr->index] = temp;
@@ -904,7 +905,7 @@ static ssize_t pwm_min_store(struct device *dev,
 	if (kstrtol(buf, 10, &temp))
 		return -EINVAL;
 
-	temp = clamp_val(temp, 0, 255);
+	temp = clamp_val(temp, 0, ADT7470_PWM_MAX);
 
 	mutex_lock(&data->lock);
 	data->pwm_min[attr->index] = temp;

-- 
2.55.0

