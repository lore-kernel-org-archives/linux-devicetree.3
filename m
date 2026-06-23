Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE2318EC1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232994; cv=none; b=i149YKgxGedhSh/2ffgyqst8gVfV/lJyORhghK2XuW1LOeZiib4KGRbXAzAuoAJPYQ0cAngChqY5XRv+Ck/TO6s3yuFq7zLkylW77RvSVvBLHCMa9kRenqxV2Nl/BaS18kIk7Inb2fXujHW5ow7Ath3zg9wLrNebpawp5UD28JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232994; c=relaxed/simple;
	bh=xNswZJYh5b/Ede+KIyYO5pGtAKQtxllC3UhvSol0/G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvTO+mSrytPgr7TkvleeuvFLTg+pTO8G0kW4oPW0puh18C6AufhIbFEHVLQh1NdT/pDDlPN9260jeuOVeeu6kKQIBbs3rV8Ys34YySuJezBXoyWamqltNunzJOEvvycxSHkDAhnwLzhMketo5ptU9timM+gsLnKp9uulWn8B1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezg2RpWI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezg2RpWI"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39677aed4d3so29121fa.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782232991; x=1782837791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0yI2Uf6lQchn7JnjjvlzdSq8rfVwOTJS98JnlTU//8=;
        b=ezg2RpWI6XGtIGh67R1fKRjeerZqYM2NVUqwBdKeqkXhGfIzYrottkdaJk62Ps9DIq
         iJ7JBW/Wt5uNs2mOfmkUxxVDc3KvYHfodaEiwdPoOWtA1w8NrM/0yBqR8roJDdQY+iuZ
         QGZo2mYFwQGSoyLO1l9Wttma8kFa0P2SqgzJ8+0Y5+eUbObAGkKfUpS7K9THexQs/I7h
         qzSjeSTHoNwTyVNbaoNUk64kIu278LXc5l3n7omJUmcoIb5THaXK42MtGBZTkiuKOVJL
         ceV8KVMfQZjlux4mD08/yYYDdRA5lmi2XwdtqWCr5b0JekpHhY8CTunEEtbGgKdWSM/b
         nwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232991; x=1782837791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0yI2Uf6lQchn7JnjjvlzdSq8rfVwOTJS98JnlTU//8=;
        b=oiATQAALao0MX9vjlMxe7MW1qdvX1ECyzvxyku4H7nEANZ69Tk6F0bUTgaGAZdL+kE
         SNRu+cEHSK3i4Qisiof3t84pMIZAc8IuAAzFkPuBfGXnrluVB8erHNOIavo+04xFaZTC
         7tHcyhktsCOOg1OvT7LY99kno80NtqOoHIJcLBkw97+Zt66pnthx+m4Rr55Gn5ibO9It
         EPQyVaAaMuKKJWxqHrjdVmCj8wFSskO+/E4FLmWIDoNYiSVcZs6NATQ6PExSXRkAVN2M
         vSAQYPQZLlrksR5xM3Qrwwu44/D1TFquxeNP75fBGBLdslIVdLtNZKFI+QQveBCGosd0
         N/mg==
X-Forwarded-Encrypted: i=1; AFNElJ9CCm6FiUREmZCXyUMETpNHNCDdBnQ4hmdRVtU1mt7r7cP98vKLd0ks9D9QEhi6fl4xYUHjTYQire3S@vger.kernel.org
X-Gm-Message-State: AOJu0YygUjybugrRcHGtpq3sXN5sZvmz4EYvhvgW4CbU7I/v0dxUFdGn
	hYTMx77cYFQyB4j6NkfMxNz/rwUNuI0SzjTI3kYPWfsyGICaMvICfjYJyIBJsb7tXY1SAg==
X-Gm-Gg: AfdE7clpUaTGPvAPWHrkIH/lGrt4unqS6J1Vs0B/Sn/2IBD60rkJWrTitiWiUl5fRvV
	p5Fe0JVxBEE21oPJlM69LUbkm5Q/1dUuHYiaR/NNmtnwIv3qa8/5eQOyu0VHypHMfV/PZf6Zdj8
	CpowA5YVBSGsaIhDa20+8XDNH1jO3rh5xBpYz7v98m3EJMrZXiKwQhc7v/oVIAMhcdx1FJul60c
	lJW826gLjDQjgwPpkSTPchE0WgdNfHiZ1Z82By1aAR7+xkVKOiVF1/vAvxu1rSn/fA7NTRvwN1q
	N5oWEks4Xv4BEKjZhMhnQ9mUo1tc2hY/curTt2cJioMjHc6Wrf8D7F0VJa2q0PWa77nbcjcchgw
	KhMl9p0cEX95dAX6LYyg53BhwbStH1nrW92Mw2It65PqebZvPQez6GRNG/dw9s+Tvn8qmSN12eR
	u4udXxbxqE7sVNHAIpafTIN+iSeVwD1+aAqZVSVJMAGwTppA==
X-Received: by 2002:a05:6512:154a:b0:5a4:13da:fe8 with SMTP id 2adb3069b0e04-5ade4746d9emr893499e87.38.1782232991289;
        Tue, 23 Jun 2026 09:43:11 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555c45sm948253e87.36.2026.06.23.09.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:43:10 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v3 0/3] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue, 23 Jun 2026 19:43:06 +0300
Message-ID: <20260623164309.16452-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623140113.12574-1-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX86150 (Maxim/Analog Devices) combines two PPG optical channels
(Red/IR LED) and one ECG biopotential channel in a single I2C device.

Changes since v2 (addressing Sashiko review):
 - Move FIFO read buffer from stack to struct field (DMA-safe for I2C host
   controllers that use DMA for burst reads)
 - Remove redundant devm iio_trigger_put action; the IIO core calls
   iio_trigger_put(indio_dev->trig) in iio_dev_release()
 - Remove IIO_CHAN_INFO_SCALE from info_mask_separate until hardware scale
   factors (PPG nA/LSB and ECG uV/LSB) are implemented with register
   readback in a follow-up
 - Reconstruct per-sample timestamps from IRQ capture time (pf->timestamp)
   and the configured sample period (10 ms at 100 Hz) so buffered samples
   carry accurate, evenly-spaced timestamps instead of all sharing the
   drain-loop clock reading
 - Switch to devm_regulator_get_enable_optional() for vdd-supply and
   leds-supply so probing succeeds on boards with fixed (non-DT) rails
 - Zero data->buf at the start of each FIFO drain iteration to prevent
   padding bytes from leaking previous sample data when fewer than 3
   channels are active
 - Flush FIFO (reset wr_ptr, rd_ptr, ovf_counter) in set_trigger_state()
   before enabling the interrupt so capture starts with a clean FIFO
 - Fix file permissions: both new files are 100644

Changes since v1 (addressing Joshua Crofts and Krzysztof Kozlowski review):
 - Split into 3 patches: DT binding / driver+Kconfig+Makefile / MAINTAINERS
 - Add MAINTAINERS entry

Md Shofiqul Islam (3):
  dt-bindings: iio: health: add maxim,max86150
  iio: health: add MAX86150 ECG and PPG biosensor driver
  MAINTAINERS: add entry for MAX86150 IIO health driver

 .../bindings/iio/health/maxim,max86150.yaml   |  67 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/health/Kconfig                    |  19 +
 drivers/iio/health/Makefile                   |   1 +
 drivers/iio/health/max86150.c                 | 651 ++++++++++++++++++
 5 files changed, 745 insertions(+)

-- 
2.43.0
