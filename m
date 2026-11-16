Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869300;
	b=bzWscVtF8D7xHCTUBMYcjISV0Q/9y8+o/3viSRtnSEaz4PbMkrkhr7kCt9bzKGmn8Hol
	 bWVQLka6VhasU9ZKLyC6JlhR35Gb4/Z3ShCOswO1lQCfYFoZi9NS+QezJwnN6swoeU6rk
	 qf1QgDYT39/lRr4JlAkyhd21VUo8r5FHxCGsZGy/+sCYmVk0j1e5M76n2G28BfyFyXFp7
	 OrkBmgrOMMHpHp2EOMWRTYcxRsZW44g7vbiwa85UxELKHpgICvzJEBgJTq09ddgBKsKxg
	 6VL7ZU5JcqsjjNIPJW6R44xoMLa9qnQOYfJ6zINj/lolScxG9Ta0mDM5BQ42llhlmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
	b=V1R+vf6YxSr/5tLxVtCTQ84AiorAIdIctg22WOE/s31zSigrG46VeyJY7jogWvJSLqQz
	 8G8XcqBhSRCi3qFPRk3oBuLdBJFL03rbndSN2oa2snw6izJGEsBOw70jISKxXaw5QRDlU
	 1lDmiE5hAcGXE34Y8qaUzV+Au0hxevC3EWFWlqKVGnXEcpWaXS8q1S1GBEo6oj5jNnVla
	 z986ZnHP0j9z61vFKjHjsa2eFItsmR/07a3HVlluQJKbJvV7kOHZsE/voN15cyyh6de+1
	 4OdU8hAJrUiJGaHMrPYTjHmuFTgtHs2+ZBBxz2m+ZpVFHQp68rSLqTSHPK3h0+n0iGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiXNKing;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C0606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190C0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IiXNKing
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db8985419so2427235d50.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869298; x=1795474098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=IiXNKingPriUTAV8ay/gm81l0sS/gFH1loXiJBYR6J8KGZweXPHVJ8W9aNx4+ivJq4
         KLjxhGWfMUIA8UOElTq0tHtR0naPyZBpuOSmOzPQkPveHY7nwvCSCxt+djbuymNG65g5
         bg1l0AHbuyYk9yghtSIkhe7uWfa2KRhCVjTzI3VQT4TNnSXr4E9oXbT0Wf7epLu9MXu2
         LgQulTcheNGGG9XIix/4QZdZWsu4V36NnAABmT/t9wtRp+NPT0TohhqjIzOOrgmqo+99
         dGrSOYH9ViP/yC2ecuiLZB/7oAaxBsbEwLje5JsT8XCU4Zo1CZKH0e18+X4uUApzJCwn
         HNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869298; x=1795474098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=honke6PUKL1lf1E2ZADKAM45Ie/HfpK6jH7RvoKQbHhCee+/Az5RKb/YTz0MLyp10Z
         8PGNfqSrbtc5OYMYNCZZ1LP7nDLaeyLNLEnlv1+umeKtnCRB9/2lUCWVa8NHM/pJ+LG7
         yyyHaIBn8wQgkJN7Kg1gulb/17ynEzcJeKjPEEdcGtdExP/oToWV7XtfbFwbX/I5X+TV
         qMhwKE2VfqDQrLMCiBKwMdT75tpY2jbwgjTFAOzC7HqgdScLlVFW/0Lzi7i+qBeqTqUR
         W1TDcNuzHAGTM1mNvzxqBnnyS87Z6FPaU2c/CLXwkgfCPX4z43jG6w+f+RRIpV26HWfI
         6TDQ==
X-Forwarded-Encrypted: i=1; AL+hErGS2aE4GzVY9ZV4MEUFmhvMtCAIhqVhfJcIlXH8iXJfahi2HmAdRNR4cJXk6Tun9y9UpBlGT/LE3ies@vger.kernel.org
X-Gm-Message-State: APuU4Z+4h6e+MwAB6DPURkWgCmcuiu9lAId8+6rZtsG7h64CDLzV4fFi
	0YvkZhr2GdgQUmYHgNQ3GB1buztZ5r/IJ4PpTD2YkrBRp1kphW/JDK+PWRLIlw==
X-Gm-Gg: AZFdTZcKKVtk6wrlVlkP9lszRMwO2mB/8RxNkYd1Z19Fk68DAeVgqjds29bFNhYgREl
	+RYBhEAgPvXMBy0ZyCamYGOzX1h5E1nW6s5ljHMilQ0kPqt08+kP5LRYp7dBBvG0Cx36vkmHDdu
	d9iOeHRvPGs4zB8AH0o8vjSjAsvdM53/oBp6adLAkijjNRWLOxz9dE4YFc88S9IhxynoBm7hEZ1
	PqMpnEHDELsDkfqWHaP0ozd2Lia5lIhJOtGVBlIstVNoPaGitUXf1eQ8VkLIcCA+krbykMAckV/
	40VtSdPkVSoJrd6eVjqKyPX6C3Ds7DkrIs6q5L0poKxo0WqRbGuWAH/d1G+5rRU1wOWzY3oeG/g
	U3YpzUXAsYNi1hQPXGiTHqbu713QuMzr/jUN4sqEy+/5c586OZZYga5DuLkWYZFdBbx1tNrN9db
	VufEmgjHAeT1S8W8srf3pmn5yE/Ncpo9ViptLHO8V2WPP5IOfGc4lhaWY5bhkmSnLTUvCkhOU2s
	JaWUzfjRZSTDFVEdkv/3eeV9EPFMZ9dSOYdimjCfENizWDUHTVux8aKhbqoQuwt82Agn4by6VJJ
	ecqEf4gpqLQI4Xs4eSx6ux/0LARzq7d6LIDml1cOWPrx1Xd3jqXAbJ+lOjhpncLxEVueZzytFJ4
	b5OAsaQv2m1mH08Ut3+Rmy7U=
X-Received: by 2002:a05:690e:a49:b0:67d:a8db:2821 with SMTP id 956f58d0204a3-67da8db2967mr3475909d50.103.1794869297941;
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Mon, 16 Nov 2026 19:48:01 -0300
Message-ID: <20261116224803.61154-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC trigger is devm-allocated against the IIO device, but it is
manually unregistered after iio_device_unregister(). The latter deletes
the IIO device and releases its managed resources, freeing the trigger
before mxs_lradc_adc_trigger_remove() accesses it.

Since commit 699fb50d9903 ("drivers: base: Free devm resources when
unregistering a device"), device_del() releases managed resources.
Consequently, iio_device_unregister() drops the trigger's allocation
reference before the driver unregisters it.

On an i.MX28 EVK with KASAN enabled, unbinding the LRADC parent with:

  echo 80050000.lradc > /sys/bus/platform/drivers/mxs-lradc/unbind

reports a slab-use-after-free in device_release_driver_internal().

Allocate the managed trigger against the platform device instead. This
matches the trigger device's parent and keeps the allocation alive until
the platform driver's remove callback has unregistered the trigger.

Cc: stable@vger.kernel.org
Fixes: 699fb50d9903 ("drivers: base: Free devm resources when unregistering a device")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced. After Sashiko's feedback in v3:
https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?part=2
I ran KASAN and spotted this new issue.

 drivers/iio/adc/mxs-lradc-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..64dd3a9995ff 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -454,7 +454,7 @@ static int mxs_lradc_adc_trigger_init(struct iio_dev *iio)
 	struct iio_trigger *trig;
 	struct mxs_lradc_adc *adc = iio_priv(iio);
 
-	trig = devm_iio_trigger_alloc(&iio->dev, "%s-dev%i", iio->name,
+	trig = devm_iio_trigger_alloc(adc->dev, "%s-dev%i", iio->name,
 				      iio_device_id(iio));
 	if (!trig)
 		return -ENOMEM;
-- 
2.43.0

