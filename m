Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98946AF0B
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521526; cv=none; b=CRLA9LwjSCuMf22oiLOVPdZ7LnvOPhhdQNf35kdmzINe0V+hge0XfsHQ26+ZyT9D1jbrEFPpc22/LNIYGL4OBPNuJtx/HWlnquyUL/mynk4oZVrGQZoYF+oIRk6fujgm1lUlSMG3YZEVRI4FOgp3nXhhvaxEzUP3rwAeFenGTe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521526; c=relaxed/simple;
	bh=5k+SnEgwLcoE/m9oWbMPiYN8XaRjygHFU88BagKW3cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di+wE55tq7WLdslWdYgEp5zIBz6ATUYcx+jsKcthwTemdANjOYkwtFE2mypruXmxFquiTTpNRwTVbrhRwu1JO97oHHz5f5xsgC9EO1b+VdUf9j599FjlXBryqhAWHCOUB4xJDgeEOd9smyIt71shAQlik/AksOE45+w89uBYThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQdax1x1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQdax1x1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2baef9f5ecdso25552005ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521524; x=1779126324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beKvBN1aF04rHKZBL8DcVQubUk4t9ZmlxiCzX/vBMwk=;
        b=PQdax1x12Tqrlm33C/7YAqO8hQFLgLXi28msBjv03Tk6b5W/wU6cDOPr6rpmF3kyOP
         bkR6VKZvK/rvYlroSdtf1eweVbIK4rC65D+ZlNgsYUx0BAkdUnY+RPU9rYBiwZYlqCi/
         cnuheR5Sin6sH28t/QTgBHf/lTSi6MJz8yNjfDiSfTvW5Lqf3p/Sr4xmETEK5MknKmKA
         RLPT9zfDiUOqPy4zL91gruNkaCobAdKFOwHZ3F0GF3qO4eIBnLYktTZNCkusUo3PzABU
         l5v9RbsuxoIKuz0RTvhD128PgdnB3PTAWNmCEzu2JK3V2LojJF8CfhWIZYqOvxPJbqya
         3i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521524; x=1779126324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beKvBN1aF04rHKZBL8DcVQubUk4t9ZmlxiCzX/vBMwk=;
        b=tP8udisoMAoLn6YntVW2zBeN0d/Yw7rv+/WAm55H2ajGksROBX7ZePb6LRzA8PGWZy
         Y3TiNFeaRceHIC4JjoVHvTVvNB5YdchmdYtcTn6+dbTZtUq1ypj3AT4XJ8lG81p8wjYu
         AyuUZPG1JsFBshsQ+QQwrOqZ2uiv/jXJ37BuC7a9ilcsNrFFktAlI81Mlw91sbr39Sw1
         V3Mg3Yp9lyYjtsHiOdEboQE4ryHTCKdQbjfJNnH3rgBdyowcxBuiXsUMZhM9I65Phn52
         4GzoYPWN68VsK601PjBKXnbq1ZY6fvqqwQwVDL56kzxsVCIPPWCMGajWEd5q53EjVtV1
         lZPw==
X-Forwarded-Encrypted: i=1; AFNElJ9V+SVyzRAMTFhY42vPIQtszXeE3BdN6L0EssUsRSaGtUAgoPGcQc46sD8IQImbFy3RMwI4xvSgIHnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/n5u/eghM3tv697aDyaocl69YRXlxzHsa1vynoEFmuP/8x3u
	vppChUW3PMBgICGU3puRoYN8Ajs59LqWRiBpN/cnwqUOOBUrXJ4Cf1q4
X-Gm-Gg: Acq92OEC4Y+QoosuzMmHCyHeszrYvzMIUPzZKaJ5NObtGjaYbzgpniYVjOQ4gZWU3V3
	JIpSFwrny/A6l/we7JXTPCZYVLGaw5G6wpnZHOVCHomflzCOiI2ZyPL/TIW5kcJJ0Nbwn8HiVwv
	zX4UEIEjrxLoHXbquIc4kCksm2U1/j7H49qdb+dArJ5141T9U5mkg4KOj4cdCPUoVlRQV6FxgKe
	ORxBbcX0/9p5BEuEW1B/ld5ZEvqKeJAtrcj4UFaTOnowiNNabiiavhGNZw2Hw37SLLqGyTzIv3c
	l4QDU3TDjFk616wKunSsfY3xthodrLMS5p3gYNTYDMU+/7SzcvMdJQSPAEA1j/s+CxkO2W4GiZy
	2gw/AmkhjShmHGNhf0tTl3mhEtxIoGHND0V2HkecVURl9/lq9n8J353YKpzClHg7/iUyG1y8lAC
	5hDwGnefNSQN9nZYmurNJKt2t1WApRU0jXHZ8G6yzpCV1mMNG4lqq5oGYEihlguQMoYUetdN1YO
	n5hxwb/ZSt/IqT3CmRRDKm+M99Ld7ku95VdNnTuvg6YdD9WxVbzyYmVGrYv
X-Received: by 2002:a17:902:d2c9:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bc7ac4ed26mr117712555ad.35.1778521520774;
        Mon, 11 May 2026 10:45:20 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:45:20 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 10/11] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
Date: Mon, 11 May 2026 23:13:35 +0530
Message-ID: <20260511174342.123820-11-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
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
index 0db2d2db9242..183568196d52 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -269,7 +269,23 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
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
@@ -283,11 +299,10 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
 	if (ret < 0)
 		return ret;
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -301,7 +316,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -391,8 +406,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
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

