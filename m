Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC983B47EF
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284667; cv=none; b=bVDC92oruDRdaBXRFCrQluoGPVDmZnYSVv8tYN+ZtfhAPc+VfTlQKTJplYOZ2d51sC3qCbWhDfiBeS/GeZOa12v3/2YWo/AkTm9/e6D32ZzdYyPkcuB5IDMKffRNNVH3lIs31EmqOgJ+Kd+G8rJbK7H/YgOjvI4s9fb72ktdivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284667; c=relaxed/simple;
	bh=Wtp2ady5cPGsHqy7Hzx2YKsIfwDLlHsBk3WZ6ydRqls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wi66PO23oWUofhHoV3urtXaBkV8VyoHTeYSPRRxeU/edDTG992UDFeWJgG5ztpRtxxhsweQIeG8oBn3yiN1HASRDCvbgwGn+kwqMN5Brae2BrTS5q2sVPlYburSYtKbgIHcrgG2No8j/KJiVQHPZufZOlJ5h+FtLiqTMpka1B10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQZ/JFJO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQZ/JFJO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so4767829b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284665; x=1777889465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa/YrVOe4CujixvUEtBo8c3EyfQIvCG6YasI2Sa6Euc=;
        b=BQZ/JFJOuLYKGxLbT6CiDCTDKk2Hm3KDcwoXBRfQWiFFXIDy28YZOts4C6Ese1YDWM
         jrgOHixHB+E5NgoKd6kagv3pXEGLrh5Vgq7xzQtbdymqM6XxB+tDWMWap2kuryyL4Mhq
         8PneYxyqMi7xgcfTCEqhb3/KKIxTYlQ1bwM9/hYbV+tUzCXjNyqA16n3e3B8+54OxIsg
         RXTyFoYj01gMoCRgMRhBZKnG1D/wqOPyATicSWwdL9oXFcf0frdjxn48guO5WK+ZKRJi
         e9HSvX9IM5ZCjrhkpt2vcDBZvUF/S7yQg2Y+uRQCB3E4qB6ASGKN5+Ze6l0vwPkn7zrB
         kHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284665; x=1777889465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aa/YrVOe4CujixvUEtBo8c3EyfQIvCG6YasI2Sa6Euc=;
        b=RJ8s4dcic+bX2beeErx9mB9y4yBCwetRqLQx/IRBRR2VdQFC4gqrQnDLwn0Zf44GFA
         /I1z4vZz/3saxPdawdOqIzIJn4blyjhHV/ac/0JnvIO3NDUDwvDtxbxsouqphdQlYjWy
         z2S+HDQg1z/IuBMpQvsPYGLwzBBZ2Gm3ywqQVLTYaJhHo7EyMmnnWDsNIN9c/V9A+xSV
         neB2rQXHm77b3HGlj9KmJlgWXEueh19+Sz6WRrxEynlEpreuheqB6Xj6qomjasJ1INqD
         1BzZ18eOO8XSmGfHO7Rm4qfgYyWwEcC1Yde27+tUiI41Azzt4FsQ7a4k7xq9i7zAGWR3
         XfEw==
X-Forwarded-Encrypted: i=1; AFNElJ/MYNLhIwIUFdBA2/j2u6vgicc8ckv8O5eEHdd8KkBmyBa45a1SytfBnMk+OwFWEh0dO8vZmCjG8qoA@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1v1WRB9eBeIOjWVHX964USX17A9mXR4d2vJR0t4DOAouX/wF
	LOmOU99CG6PCHnKymQUtUbcQ6JzoQCk3NE+GEaV70bidLqJyEvmj75UD
X-Gm-Gg: AeBDietm4MpOHY15k19HodqpaPb6C/4xzxOgsCqUBTTPHUtHjn8iKzyJpXeRcVvuTHJ
	KfCGwhi5dQDCKQ2zjSJ1ak2a+h7FEWOM7+A6V+Rf+cG0gwt0Ak4AgzXjJQ1cqF/xUb656QO3/Gk
	dBi/Z5Sk1bcdX5Jtvz8ZN1AoR6j3/XF5fL8Pt1PWfE8af9eipT0ox23RBtMnbQW+3lW1+lfgYse
	1bDyAUzQg49QveQ9CWCqQGnYytfO05q8ZCvioxquKU2SnahLhiAmyAnrXEaMcCtmKoB2N3hth8O
	GNEgNnlGU2jF/cEXMKgVnkegw/MZDHekwjKtXR19vHIMWqKV8Y+leLcYjdEKQ1sxpEgoMQJFeaT
	asAFGqjRpU9ohyK3oAbb0BiP+Cz98WK/3nPvv0/Txa/vcs2gC60ZKW7RN1FaW6fdSfgX1CqAS8L
	hWaxhMjCfvFN+KFub28+qOzQ+DeAJ1gMQoFBMeqoADKK1y8MeEGmvtactPyNW0iSdt36JvOCGHX
	kTxltQT+FtQOckRkv9eMol1+skZWO63Pe0X9CFbHXFm/aEBnZNj33J+QiyS
X-Received: by 2002:a05:6a00:1bc6:b0:82f:684a:84ea with SMTP id d2e1a72fcca58-82f8b50fb97mr33817544b3a.13.1777284665432;
        Mon, 27 Apr 2026 03:11:05 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:11:04 -0700 (PDT)
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
Subject: [PATCH v4 6/7] iio: adc: hx711: pass iio_chan_spec to hx711_reset_read()
Date: Mon, 27 Apr 2026 15:39:37 +0530
Message-ID: <20260427100950.33936-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427100950.33936-1-piyushpatle228@gmail.com>
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change hx711_reset_read() to accept a const struct iio_chan_spec *
instead of a plain integer channel index. This lets the HX710B support
patch pass the full channel descriptor (including chan->address for the
trailing pulse count) without adding a wrapper or a separate code path
for each call site.

Update the two callers: hx711_read_raw() already has the iio_chan_spec *
from its own parameter, and hx711_trigger() passes &indio_dev->channels[i].

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- New patch. Split out from the v3 refactor patch as requested by
  Andy Shevchenko.
---
 drivers/iio/adc/hx711.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8e77978f062b..dc6703ead8a0 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -264,7 +264,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 	return 0;
 }
 
-static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
+static int hx711_reset_read(struct hx711_data *hx711_data,
+			    const struct iio_chan_spec *chan)
 {
 	unsigned int trailing_pulses;
 	int ret;
@@ -278,7 +279,7 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan);
+	ret = hx711_set_gain_for_channel(hx711_data, chan->channel);
 	if (ret < 0)
 		return ret;
 
@@ -296,7 +297,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		mutex_lock(&hx711_data->lock);
 
-		*val = hx711_reset_read(hx711_data, chan->channel);
+		*val = hx711_reset_read(hx711_data, chan);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -387,7 +388,7 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 
 	iio_for_each_active_channel(indio_dev, i) {
 		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
-					indio_dev->channels[i].channel);
+						&indio_dev->channels[i]);
 		j++;
 	}
 
-- 
2.43.0

