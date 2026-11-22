Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334899;
	b=fNmJTWLahE0temYisbYCoi2euWSmVBvckSG5kbJ+Z2TSmRct8btjTKF3t9y+fkalEE5g
	 XBm9EUgGCQBgjRjn05aP0MkRPOA8HMbSRDRqb29IAdD6b4ZGNonorsVzI7/j2V4FJ6tpa
	 T4GsQLc2PesWp36Fa91FNAElCHJhG8W3HNtafWA4AQTXulpeDQV21s+RC12hVUqV1I4He
	 VfxrHtmbiflCf545FQJ70BuueRxQMgW45NufnsvtjOdS2hcvlQBcT6eujWvEpRze4UDhb
	 vN3OmIHqeKwTb3LWtApDqmWI+Q1F2xGYugI/BJsVeInAD+bdxQ76KRrhPfLtLQjkilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
	b=wUWN4rVhGV7ym+ifYUFPYbhKMtFa21hV4ov1/iO5oaq47ajdiC6DaRBZSvxoH0YeN6YE
	 lgeNBjSYGNiEw0PA3qaMspZpA8Cc9O7b/nV2qxBiVu8cKV0w0JpDtuVlzwxW+RMDKJqpu
	 tl4jzT+0BycGiwekW5CXh/L6ANMncn8oM5I7saeanoXahd/uiMWW2uVRbcA/Lxos8/7zM
	 rzGnk57+YhRrvgEEJmcD5HMwoNR4oU08Hjb+vN+QyNmipS1LKvNTtoUq2jNWXhgYdLEza
	 ZSOn8nTG9VIlIe8wPZjmSGhc5lxoUIpQH2CMWltJ2NWDb59t7I8d0zAe19wb/g2vVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uC9Jw2OS;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B01606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B01606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uC9Jw2OS
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so2629093a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334898; x=1795939698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
        b=uC9Jw2OS4jLuvaA7tEOkaSrik+nD7YprBp5BZGQ8p0mMsug9PjmvJAjm4nvQMe71cR
         thKQP4baCaBUXtbzgXrddTtVes6Ezbew5Vqi2hv8B+0OgeiZ9N/+kv9opvQvEEk8wQlc
         w7Rti00eUP5FvT3SQ4kbGv7OCOeW1w9nVUZ02sqeB8Xq0hNKdUlDgSaxjKmOVzyqcG1s
         4goHEuLlHTfO3Ecal9CGCcMDWRfE6QBbmRkFrULGJPrpzyULOa6I7qsAgU4Lirr7Vi67
         vgnWlKiItkhWhCVYmoLSLoRFpy/IKktMWfMTuyOARFNa1DvuroDa55TH7+u4AdotU1Xy
         PSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334898; x=1795939698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWUDpDx3gOF11tISsn8dosM22YoRGivzGRUaW6pDGjY=;
        b=BWoy35irdUqPqfCa3KKgiO5wgEKdhR6AQdXngIZi5yeUzC1wNUv3LZ773I2pDpABIs
         xlFxU0jS3eBbqWO7OKL8cROfp7CRZnTmuVydBO7BrqDlpN/6PcBJRrUwMJ9LfM0phXyS
         nsj+a7U5hw9jnZq47V1E88h05uDeZT9Y3FCTtD26tTHGgk8J5vtpuRx4rPbh1Paq2JlX
         bMIr38o0ONNg2CSfiwPCh6rEvNUJ8wf45l5TvzhkSn9MDSeESrQoie8/J2ZTyoraqBfu
         FNuE7EOjm/jiGOpA0VKrRv0lDr1e/lUGG9sJ6F4jF5JzNK7PzBjSlDG7J1ur/jMBz6Ny
         ivZg==
X-Forwarded-Encrypted: i=1; AL+hErETy35+iRt6LNaoG3UA6N686Kc/S+jn8Lt+Qyro72jYjD5I4PRmFQXnNNN8gwR0RFfDdkay0dk7F+Qb@vger.kernel.org
X-Gm-Message-State: APuU4Z8R1eHZEPeI60qqLmB2dTIjH3QDaYJ5fp2PJcl5LRlMhNwLVUvl
	m5RJIHeosLY9nV7jiFi7uA98p7GjADUphy9bX6BZ0d7GTl+5JOEH/tK7
X-Gm-Gg: AZFdTZdoHt3wjx9pEXuBfdYL7UUqpioNV6gSz+lk1m9on8kD7v0U03myFse5sv7flcU
	XvnVhiIvtbc2GFXSCSYiS9AJ736HvFqD3uIj6HKgEuhRHdZ6M2o2eWoiWPfRNzI5orjGHYhc9cm
	1mmiqdZObHtj6vUtHew7KIIQu764ZqqjZDoxNI4mgNDcIsAiqJcrFgC5t+hk4dm4NWT3faxl2hf
	i4iF4Gm/jO9zC9DeZ57X2yT9Dgjl4heUxoP/xWHneP8ZXMqQYLCjC0ui/ynGTRtT6S53P7vitKD
	aEYfo+qRZzUyRgGwCWM7YRpmCO0ZlaggKoo9LeCzFVYdGdY/VUg6iv4wEeGl++vXn9zItVFr9y9
	mDt5OEIWQZ0EWxBZo4lqtKHkVBpzYkIuihqMQ7yJMaNlAuAv4EM4hn9MBibnDlObi7dITdCI1AV
	nSn02cTjbizd3fVinxVphkXY46qsZKPJlQCDo6KKOiDzLKga5y8wvcTbIj2POG0fJmggSpNnYia
	Hcw0FDyc1G0XeFaqJ6ajbWwP9hUg++QP3FFfyCNwAvlyYmwvV8MCQB9YROrotdNvU9UQnq9fj5H
	IRRnnBWO1//hmWFkmPPsl3up+oBuiVuPtoG9uKUiYocOVSuKDl0jwvpsAg8QDsPTbkQEpJiZ1Ps
	18SOAtwzFTcLwgKaawFKpJ+jX7ZA7If0=
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:7885 with SMTP id 4fb4d7f45d1cf-6ba7b468283mr1860652a12.11.1795334897596;
        Sun, 22 Nov 2026 00:08:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun, 22 Nov 2026 10:07:49 +0200
Message-ID: <20261122080753.36349-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:
- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match

Changes in v3:
- LTR501_INTENSITY_CHANNEL macro adjusted to set predefined info_mask_shared_by_type,
  info_mask_shared_by_type_available and info_mask_shared_by_all_available
- added info_mask_separate_available and info_mask_shared_by_all_available to
  proximity channel
- fixed IIO_CHAN_INFO_SCALE for IIO_INTENSITY since table has -1 entries
- fixed indio_dev->name asignment
- dropped ltr501_has_als_support helper
- fixed channel finding in ltr501_trigger_handler
- isolated more accesses to ALS registers if no_als_support is enabled

Changes in v4:
- adjusted intensity scale passing
- int_time and samp_freq converted into 2d arrays
- for_each_set_bit() + iio_find_channel_from_si() > iio_for_each_active_channel()

Changes in v5
- fixed als_gain_tbl_len calculation
- restored use of iio_find_channel_from_si()

This patchset requires change[1] exporting iio_find_channel_from_si() since else
building as module will fail

[1] https://lore.kernel.org/lkml/20261115083049.46840-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 427 +++++++++---------
 2 files changed, 211 insertions(+), 217 deletions(-)

-- 
2.53.0

