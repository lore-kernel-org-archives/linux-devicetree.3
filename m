Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1283E92BA
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706350; cv=none; b=OUExE1bHqvp5v/p0scxbtl4DWEP5FVxE0hS3b3Bp902PskvxGSbW4oWSGITh7CgKSRGvTyjCpZlyeicge5JdL6DWbz8p/7VfdHBmgka+EUWq0hBmtF3S4ZQaLFQtWwOvU4VsSM9fDLm/LTtC7gH8ySDEFTrQKt+1krYVX3dL9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706350; c=relaxed/simple;
	bh=3FrcsQlVziUdeKI/N9eYaCs4RJmRsrcZLsIz3cZSFq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsSkx73aD9fKdlkXi/hyEQRedJyq9X0QmO98kO2ntNKHCmZ8489Sko5ZqgpvL2mZqIr8nxg/umT22C3xUeL/ulz2iAYj7S4AbcnnA1KTVhjELCvdrHhVxw62QkfZ3wo/biMLdrHWeMmpUqSokhT4eO0J/X7/sqKHugOeLBYd5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZtk8YJI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZtk8YJI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso525878a91.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706348; x=1780311148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk0PkavUtmrtR763X7Xl8KGOaAn01gQsV9JDZDG7T1A=;
        b=dZtk8YJIakMNipqUj/t5VM0UmqEioiPb7T2UipJtFDoWhi4qCo56fwFT2KsuV5PZjb
         k8aSFdt6dwFKw3IReX3g2yzvHufrQTQR+AWNiiqKvPX10vU0zGg+gJFpondnj+q7e2BK
         nM99xoOaui8jmirBTZOHXxna4aA8NIuWa75LUJ3iFuIW/2mu9D/BHE74ndl/bBcN4ajE
         OHVNerqehTF+KgMbTKtcPjOs0SgQKyRSTHFNoB+X9AdC8mOI4WzYVHcj1xrYzpQ8i/sI
         wGKEafYgnMumxyj3cBuAZu/ZxYi87OxevNP8atoijn5gEYP+PT8QAkzbNUccN9ZVVsn6
         H7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706348; x=1780311148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk0PkavUtmrtR763X7Xl8KGOaAn01gQsV9JDZDG7T1A=;
        b=g8G2e0F2FlSlcyRNgzWAjiyKKSFgW3jowK9UXYVT9PuYOwnl1fcY71Q8BzN7FZPXvl
         mMhOrKkZsgElZXXxaxqX+OFRClubYOF/U1pYCwle7jbfhTuTVHinJuiTaVHw3Ik3Z2cM
         HYqbVh0YiivwNu4nCgJnziCnvIsqU6rXWO+wbe/STEkcJVELxA0/HWXSx+q9hLLQLK5N
         YxrvOJHth+NYEQMSD2URLsEtwQNFbiC0/TBu/jS3itFixUN52MClMdKicQ4clpTmOE0F
         dxIXCecZpb7fn9Y5SZLcgMhKmtd+btPOk4GoS2jKXWc/jCqxoV5VxRydXl9bGCXnoFzS
         SWbA==
X-Forwarded-Encrypted: i=1; AFNElJ8+ITUB1mpfriI/dpMB9gsqkclXTc8ujFQoxLCpKSiVBchoniLeHQw8KUkUiW5huqrcmI9d0F37300C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xcMVRsG9ZA9rB3FMfnsu1s+fqlYj60oeGIpznUXBTwPJjjhT
	kVcL6pxl7PoV9Rb4v1UghCHGU5AIpAfi+wzAkCM/q2aJiG2XjfurEGeq
X-Gm-Gg: Acq92OFyeDu09pWi5LKz7TPTaiqZ7BUiJy0CxABOOnX7XkCEFIh27+kS6bEp7NpCvrt
	rCB4HNJwGlBzirYGzuCzcc/Z8p7Y8oeluDiY/v2apkG4RtMNF7rfTOJJ/d5drTpQQbz49wPhCgi
	MgcY7M9Ym2EXiI9cG5+9pbN1Gbv0+OREALoz3d71ezEGfyMspA6HZ7//GUMHQ5SXWPLqbl0otqB
	Mz2nJ1HPxaHxVWKf9jG8OurhOySQ7wYCYfodAj916qik+6XrZ10F+/IoimwjzWWUoXLweS1a8yP
	sSWOqF+BBFWkzZTCdica34g+ePgeTy7ipSaB/AR5liriBCNJbH4LRj8YWzzT7AvUOTJItq/DBml
	VN3+IpqqJ+pW/98L0GLgMf94lgoee9I+oNZAUKbh/IosqmAjZe1lXHIbvxs1OZLM8g4swWdU7eX
	UKIsevcg5r3sleH2ha2NSL+WYzq9WYMlrlImyCMbvn80w9RXCO1ZArXhTl26B8OhmeKkphkMPie
	T8+jVZgdCRuSGrlkuWNzdrYP472wVtkTbeb8o77k5CpYtGy/RlI
X-Received: by 2002:a17:90b:558c:b0:369:932a:2b8b with SMTP id 98e67ed59e1d1-36a6778aedbmr14172064a91.11.1779706348076;
        Mon, 25 May 2026 03:52:28 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:27 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 10/11] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
Date: Mon, 25 May 2026 16:21:26 +0530
Message-ID: <20260525105127.180156-11-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change hx711_reset_read() to accept the channel descriptor directly and
update its callers accordingly.

Split the existing HX711 channel-selection work into a small helper so a
later variant-specific change can add a matching helper without growing
hx711_reset_read() further.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index e5d842853b71..fde95758b9a0 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -268,7 +268,23 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 	return 0;
 }
 
-static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
+static int hx711_set_hx711_channel(struct hx711_data *hx711_data,
+				   const struct iio_chan_spec *chan,
+				   int *trailing_pulses)
+{
+	int ret;
+
+	ret = hx711_set_gain_for_channel(hx711_data, chan->channel);
+	if (ret < 0)
+		return ret;
+
+	*trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
+
+	return 0;
+}
+
+static int hx711_reset_read(struct hx711_data *hx711_data,
+			    const struct iio_chan_spec *chan)
 {
 	int trailing_pulses;
 	int ret;
@@ -282,11 +298,10 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
 	if (ret < 0)
 		return ret;
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -300,7 +315,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -390,8 +405,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
-					indio_dev->channels[i].channel);
+		hx711_data->buffer.channel[j] =
+			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
 		j++;
 	}
 
-- 
2.43.0

