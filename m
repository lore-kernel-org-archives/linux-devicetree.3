Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C3130B53F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647827; cv=none; b=s4MsUBtFxi1F4PMHPGg8T11sOGz9Z/p3uMbWHxpPpUWcMIlnP89icw3UDPjaPuCbWweqebSvHl9ECdOMuFzpfdeBfoxkWyq8Mab3CFUeRPUwLkOdo1eyvFR3N3/QYmJoYYFG9Yr3xjNKSRqtx/lbKGvyfDwYFazGHnKLjp+kCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647827; c=relaxed/simple;
	bh=/vOOXoRFd80rf12YbVI8A9vnK+2w6WdrvOSLeNdAIU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTvXSfAA3L3B61OlYYS8zUwHr9dbuND6bhr6AUL77LAKxsBC1wLD6DlRDzigRYT1PnReAz/KUBop3JQBl0nrPq0uXnIKhmH34eY2jclWwsW27lgBG1fA/iH5s/mStJMOMbc+rRCU21u7M6n3GFrXxQun6Ym3jH7kQ5OV0HZoNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jynYSsDS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jynYSsDS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so2555624a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778647825; x=1779252625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBRBa2zjJe16rT7hXzyvRJvpoMNnm7ChCgpZnCI8ZZU=;
        b=jynYSsDSu4hOqre0wPTLOFuVR/8xS7EbYy12ci3oa+PtEeJGQs/AxlPlrObHTBxq40
         1g8bTM5pLjiwr6peGInKBey2iCwRwJN36RRd7bAAf/DXhNfyqHFqo1lAkvAznPQQIJMD
         zpFgb5aALZU1Ek+4WRpkhVHng/RUfH3HIrqZp3h6fi2AW6sImTDEPZ/A3ElMxecjxL2Y
         Eu6gRSJouD77MrXycQ7LF0w/+30XXwObB7XXYFMYd67FuZFG6v3dXmYF2Pf+Jdo0qTxO
         W6LhNntmiIAFSkmEyLtsi5hsgmacq9spoTcYG+i8lNg9kJMCXvpLDr7L8v5dUz5MQdPV
         1vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778647825; x=1779252625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBRBa2zjJe16rT7hXzyvRJvpoMNnm7ChCgpZnCI8ZZU=;
        b=QQT0Twuq/9wck9FzFoViwo6NNakXhGlFTvwlwjvpKtL8x6TXRfDNnHGgX76k2yzmmv
         3VuFs2ZCo8q8sy/8vl/a5Dd1D/3aXusCe8+vJ4TTiGWFZl3lJhy540sVKAlUtl14xLBl
         FS6+MEAdDLzjG8WVzC7Ap+AkqrTeTFrx/P/LecLhitunzMjDsSNzfYoZla+IPBpVEigp
         ts6MlLt+BQREJgPGx6Y91IfATvwcwLf5gr1C0QE/5TBoRWDWkZUzxQAYlBMAVuTcefTY
         IuooVlxfpLUzWwl6ubUSKGPgXH8zqeMPLaGJ10S28KAEXHyyQ4DMK4VPJe2J5FDmf/FF
         j0mA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qke+Rnil903s1W7MfPqcZA6FUuuUgWIGwyPkdZhMEgBvD+gveekQRdjxwkR6B4doUwFI20PBqeQ6v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6STficG66phBSSB9twUm5shW3zc98idjgV9sy0GZix8dkOM+L
	WG86Bt9sux5NhbbXWSDefZrZ1WQktXsyafDPHMxdEb+AS2HRpDfOKb3a
X-Gm-Gg: Acq92OEvrD+IZSYE9dpI2l1cJ9mMKcTb0Ci+5YEEIQIkFHvzur3cRanqCuKwR1Kv79m
	/SFE9wSJZhtpLeHk9EG8+O36Lygig6CziuBJfRvEQYskks/Gzft0BKm0TDibb66tZjrNbOtRu8a
	5N//CdHlDfRzE4AgAod6r/m7t6HhQJuMOjZShWCiG6PkiOiTsRhH+zUxpqL7/2LKOQ/4F9Rwmm+
	ByWXP2Q1yxqmTHgbFsveAzCZFveaHtcoOapRDSkyryvdd8OOBvWWFoO72CqWhiGqjOKqXAhsX+n
	erpoC1cIWJNAymPg6SnzhFH6WTG4pZHEisk2ln2jrZObxUZDR5zQSjTkF/GhLVfm777yljVRLr/
	l6DHWrRYa5DKn+L8j2YVcFtdN6IJ/11UHYx6cBMb2Mmyj7X72WHWJyihQPUU7T7aBAPhbvXWtxJ
	zjRtwAewJINkW7/ztBTyMlnBTNYfr48NjDAi3G
X-Received: by 2002:a05:6a21:6d8d:b0:3a3:171f:6b23 with SMTP id adf61e73a8af0-3af7bafc5aamr1960301637.0.1778647825262;
        Tue, 12 May 2026 21:50:25 -0700 (PDT)
Received: from [127.0.1.1] ([203.99.159.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm32311914b3a.21.2026.05.12.21.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 21:50:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 13 May 2026 17:49:42 +1300
Subject: [PATCH v2 2/4] iio: light: veml6030: fix channel type when pushing
 events
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
In-Reply-To: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778647803; l=1072;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=/vOOXoRFd80rf12YbVI8A9vnK+2w6WdrvOSLeNdAIU8=;
 b=NviQAiylJep8PRpUWH8EY2+WSWxuAH4EX3+6hnYB0Z0SKlewQlVxXH+YnbKX6ybxZKpHrZvqz
 BYJ/iJUp5DKBXTOJFz1Sn5XLlq+oadtMrJT8ZWiQrrSYv70Lx+s3f0l
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
Use the correct channel type.
This bug was introduced in the first version of the driver.

When at it, fix minor checkpatch code style warning (alignment).

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/veml6030.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index 745cf3ad7092..855f052b60c2 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -871,9 +871,11 @@ static irqreturn_t veml6030_event_handler(int irq, void *private)
 	else
 		evtdir = IIO_EV_DIR_FALLING;
 
-	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
-					0, IIO_EV_TYPE_THRESH, evtdir),
-					iio_get_time_ns(indio_dev));
+	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
+						       0,
+						       IIO_EV_TYPE_THRESH,
+						       evtdir),
+			iio_get_time_ns(indio_dev));
 
 	return IRQ_HANDLED;
 }

-- 
2.43.0

