Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B7426D38
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616893; cv=none; b=pIFwsJ6ky/C6J8z1qIBmWYiuB75Idk82QVjDynEnbVQpU4h69lDDKYh53uiVfRuYiEU5RdaSnyCsgMUhF4kBFmnHoN0UAF2+cTZ8TX2Rr60z8anb8s/YU/l7nvgnHC0Lux9+1zJ1xriQnc1uG/sB7Wi8BQ0pQAdQKvs8RkjHcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616893; c=relaxed/simple;
	bh=pSLI+J3Ce2NSi66v7MACMQ5vg0khpL8PKWmu0vq92tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnj2q8c1dA4YknmeF9n4nY0VgcDdpg3CBkorYKf8VhxpMmfwVVZvFqdZQGuw8n2c0v8qAq7LRPyvWxmlfa7Xm17Y9fe+kW6MB9jGn15cmYp8GxjLeF0OoG3e85YmABkPtDjcLmoFUQNJc7sJbrvot+hMKtrbLlcfsV4hGm4xH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d5wI109J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5wI109J"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so118409655ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616891; x=1785221691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=d5wI109JpI9uzndCeN/hbKrtK0lkr482ck9FIePiDWWiXubBGNLkByGdzYy3usvtgq
         gQkOmbz7Zw6KJI2gVKuZMN9D+oOPGXRSGaQe7j9vnXXYsn99U6wdQQlCR0s2Tu5HGMO5
         lAKWcuWMf5L+ZfNl5OzK8Ar2u31vC4eUmzuzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616891; x=1785221691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=gLz3Kmd4s97b0ViUFx/PnH4Sa2hqr5IuvYIrZueJAh56UMD/CHKdoD4NaJ7sAft7mG
         Davqdh1rRYi0P0s5pedOKTQFNrKT7ND49UDk3Pi/kOH+j4YyPvMZY/CuEFs9EZYwnfrd
         isl/IgGnDEP/rPMMfHdd99pF7U6ieTTB1y51U1CMXBBLaH7nTCjJYw4UMVbJqGw11fRQ
         pqxgn/ZHb50zq7hGnpp9agNz8Ehn2IE1mI3bDFgwM//I0tMd9BecqGZppq4DP6IU5VDU
         MMyEGGEPQqtGPygzYKYgkphrANA2Bv56YqRqr1Wz+V+5OSQnrJYbvyKmPRZ0WXOvKSOm
         1yFA==
X-Forwarded-Encrypted: i=1; AHgh+RqSEUOCdtbb67xMRkT8K7el7j6Peg82ltp9wjBeTiVqsHHyE+nE3uTV4JcChJk+TFAqYIEggPd/HMA7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxi8RYwKKsUdp2kQIA5YCHNRV5514Pmp+j/YYP8/7sMS3U9Q/M
	feSwLM7tM8eppvbRtbqA2XRKIPQV7ubW88Xne3vmVcrCW8Oa3mfsVOT9I7kyw75duw==
X-Gm-Gg: AR+sD10DH+IssPpwv+lZHJ2AnbhuoYFyRTZyvO9Dp1pw6EjU0jS4qEDoit7NZS/HAqp
	XADpaxh+EOeHajcQ0EWTMl4wuUW+RCZHshflyzZxV6Bf0JMyI8rCYFM+aHE4tlzMvu4c/JmUPSe
	2mp3vS59LdAi438tK4b/Xe15XSbZuBFILs8rrPLQvAd4PmqwLkvpfIpOEeeyCF1jFmNz9hM5NW0
	0ZStkKqRmOA1sOCMRkYGOfHXyMxVbjz6ChmGCz+mvwbFkC8hFTcbWHWfYDgUYioGs5Z+oN3BjuL
	fD9gSrS6Pk2uol6SCQm+J2JptUMeO5OwwyJWqxIc/LkG0AojhqPpVIrcfA3SdWrYSm2fW1T/CAl
	TixIbzH+1e6SlDVMFfLiR50tf0LcPVFVCne8iBsUjf0cWtMB9NW4fnYYHIQDOBdp0U8aQJANFaS
	9Fiqdj7HggKOyFSicpG7POiCmc961jZYaKw4dyigTxcClfJdXGm60fUAUUPnI=
X-Received: by 2002:a17:902:d4c3:b0:2cf:30a9:93fb with SMTP id d9443c01a7336-2cf349cf7a8mr187361575ad.34.1784616890927;
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Tue, 21 Jul 2026 14:53:58 +0800
Message-ID: <20260721065413.2306137-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.229.g6434b31f56-goog

