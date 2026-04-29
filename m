Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1544E33EB1B
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441594; cv=none; b=J1VLoTNF0xeHektOuxFXq88fTbkvef8fHbGszM/DI5TmJGz9dAjMVS6AHuav8xUnQgU+BJIy5qlod5A7RKsB0a4+2SayQb42R4uTB8Xlg+4DPQ+fyIzGSnFR0tlpWr/AKbxTjBSGFNrRDTjVCIZNoEGQs90XCgfZ+TuZOalYFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441594; c=relaxed/simple;
	bh=kQZvYd3COKoX8RudV7x4j1dykAfeucnnU3nu7dss4Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4pe5cUEHB2yoWTFECLyLX5V2Y0/EgX7AJtNRuTHTrDhtZhEO9daZb2StZADztSHw9f5Lljjjak+xXCy6pj94rTgtf4vrQHH/xD8iFS+EEewncREVM0wfBHLeKLNiPoc3Lxa8X29ARtsUs4P2ysRKGahZtp7+hNUIta3LzGd/FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkdlTgUN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkdlTgUN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab232cc803so58781915ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441592; x=1778046392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xKyx1TNWCB3y9Efgr+8HQY2irrCydQ2wje2Tvlo7Ds=;
        b=MkdlTgUNcoONGMQ0aJPM9z06uhAW00PHpZbOwobPFkO0iHU9j3B0mCiZHn7RdQb997
         uIT4Ejs2hmEmrBlztQtyWye0yWIh+X0WPRTej/mqE40C7gokM6l+jJY8M4wXTmVe3q9M
         FjAywz/k2r86Fs1+yW+SCsinBPW2pSetkCdHKT1P2hpqKZj0YSTdREDhsjvoIMwP0HMD
         r58e82pJ0C/IGv/2RVX1eYnkeqTddUXZBciiJspQ4DbP2nChpqYqF0edWyZHPyHhLqmt
         8UbBTGjw2qdwdrLgFVeQUYw0Zr2JrmXtjRIA8FWSPC/H0FVsOi37Lm/uSa/PZiABi7le
         qKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441592; x=1778046392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xKyx1TNWCB3y9Efgr+8HQY2irrCydQ2wje2Tvlo7Ds=;
        b=htNuBLoKZ/Euc4UApViNIcnGIqEJaV/0Vl4+tZPQMWuXHfFxzINIA0bTI9kajyuXcX
         pNuX+HqkZkBlIegyaZwhyIEHcFILz4RLg7a+yCOPJcmGdbidGSOc3DdI4PfLMmNLblpO
         UG6gkYQ0MvqWBg89yVNvJOE/uedc6nrTf1Co7wZnD2XD+nEgALfP9Rrli0AOThPV2K7K
         c1d1wZI81z2kZYK6EyVcyfgRQ8wT1Z87iHo12SiXMjS1PjsOpw/b8F03/830u2MbptiH
         qt1vgICRscgdAGTTlqeOWUgbNYdBiWKJebS55dPxYNu3y58ASIpBLKIwUbcI03E0ZORH
         Zvww==
X-Forwarded-Encrypted: i=1; AFNElJ/V0c/22DFg1DQmKij5G6MceeACl5eNOestnu3I/jL8+zQz1s6cqgIeHzLpMq2L8+sq5p6m3ECxcUNI@vger.kernel.org
X-Gm-Message-State: AOJu0YxmwqUPqPuE4qNbuK+rgkdZueIONY8CRGA0VTDsGqM1U4XACGmu
	aoMTYM/+3QYTShPSEJ1MgRYfmP23FahzPVsd+cRJmwKWDr2OS0UnYlUP
X-Gm-Gg: AeBDiesxf7wa3LZGmNYnm0Q2x5Un3rONz+wg2G8ZuDEsg1kR/wggbV6sTJG3kOdteS6
	QkWgiS2s9Y86ACCWdpy+JdQ8/sV8fKhLpRIv0XZgpElWQM42NkUFn/E6AiiWOJvBUmTKCjM7zGM
	K+dlgDRgssTtKOB6ATkw0GBmidi0BI9R2pGVKdd0kouINH2Xf4ij0Oun0LuazT8mF+HlS10lpzl
	whbTVxBdJQ9wH5SOLftGOlElPSIbgHA+FSrNiXycC/qVX+zrWrQ5AsVUsroW6HfAvQ9wbskYeNU
	1ucV2ZRqdJI9ojw9Kt//m1QTTlofs/dwzI29RkeYKdhMqb9C2Hq93McJ3EQ6rN/dp0gU4S9ezDK
	xtSCWq4FbzOrg3PyZsN0hTbaJZMnet3C7D71yPoNqKab5e3r/lOwfO2bE1zQ8j+LASkGwB3/9mH
	Qt3FAJJKPfpQ/LF8ylVOmO11M1jc7scXKD6r+/5OVXqFmwsNsWyQ7F15wHyRV+Mw+Yjlz8oKjQv
	nn6r/+NpP3d+tL16W4tavu2dE6IzbylEdqdafboPrj9QUtyoUfd8sUMuCcm
X-Received: by 2002:a17:903:bd4:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2b97c415991mr43426645ad.13.1777441592593;
        Tue, 28 Apr 2026 22:46:32 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:31 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/11] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
Date: Wed, 29 Apr 2026 11:15:42 +0530
Message-ID: <20260429054544.123862-10-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
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
---
Changes in v5:
- Use "change" instead of "patch" when referring to the later HX710B
  follow-up.
- Extract hx711_set_hx711_channel() so the HX710B patch can add a
  matching helper.
- Reindent the triggered-buffer call site as requested.
Changes in v4:
- New patch split out from the earlier refactor during review.
---
drivers/iio/adc/hx711.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 15b9f78b6a25..914c6efd0f96 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -264,7 +264,22 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
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
+	return 0;
+}
+
+static int hx711_reset_read(struct hx711_data *hx711_data,
+			    const struct iio_chan_spec *chan)
 {
 	int trailing_pulses;
 	int ret;
@@ -278,11 +293,10 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
 	if (ret < 0)
 		return ret;
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -296,7 +310,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -386,8 +400,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
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
