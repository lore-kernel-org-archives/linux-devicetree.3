Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8F397691
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296352; cv=none; b=qsss/Y3WFn9jCL6L69lPZLf8r/Fdf7sJKUkuKT9M9CTbYwm63rN3UFUuNpDqI7SHaOaPXjlHN0ekoPcQmmDgdoJ9uKdohCGd7ePHD16Abl8wIq1Vwi7+Vyq1c/S1RaNcdOdLxx4u/IvC1lUO7wCVlSIrmcMM9OSQsgcEjJv7utY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296352; c=relaxed/simple;
	bh=fiy4GcFZdsC9yxetlH5+plrNHl5cqFDQooXiediiUNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+Y5EoxmfgXh5ONlRvkJFzKgG4suH9vhrEeto9shKrrNMj3pXraghaVw4NlrbI8w113kf67wLNTlxZmQTEfMiSYT+A7KHS4mQqc6JqPrCgQg+wc01RhxWImmXpitxdNUx5oex8R+ElFCkc64CsSagnoGT4H0puZkgiErctEzp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=43dfNpDj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="43dfNpDj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1279093a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296348; x=1787901148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnFsJCxkFM/wIQ0nrP+EeILR/FRzepb2V/4lDFq/FBo=;
        b=43dfNpDj7etKUvarBjFCNceUORIxr9OwLRJdY5A3V4ufPdhXu92eZE3y7eyJd+Vxd/
         lSasRrsfjMbSo3LF47XUYQqTgWzKPvNcdDRi1rh4c/acqjJUr80axHTLRW59RaLdgRoW
         nQzfFR9wljpDsV17UWrKu+fTtZp78dOnc/h7ajxHDk6OnCd16jbGfzvqEVUe6co+jXFD
         zntaiLyr57lGe7LHb2R3jCEySQKRWJpcvHOormROHR1VQ+pxaSrOpEgAdLAkcuSr6Kx1
         vL5/n9sTZByyroDFCqE4uJOQT6Zmmgt7Su/TIvUyRVgVGgQf9Z0d8akKNR0vg/bfFmk6
         Gz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296348; x=1787901148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnFsJCxkFM/wIQ0nrP+EeILR/FRzepb2V/4lDFq/FBo=;
        b=Ufr+aSqcvMu25Wg90OSBiqE9U2WI7XOEQIzjZRkFjhX4VVIvQs2wifG1Z+FeuP96N1
         0Q/pYytAM2ZY3LdH4VC32cLf7ydsEoxjYGHD1GiF8VVZAutCnICxQSNZl74CKX9CloeW
         YMP++8aXYBdUrLEr4uOCgWzJ3bwVlQ1ijjYa+lklVps6FoaSUmaXqnHpe34YVL4adYYr
         9+7NJ7yuxhYu+6ABqaC9wjIitOsCz3YUAQJTRXRqN2mhFpqjhn1gII1YuJ/Su3XjvVCP
         6em6awmGgal3it3KApBmm4AdL2G9jp/o9kDL5uROJa5kJrR1HVOADoF3YEA9kUVVmLuL
         8jxg==
X-Forwarded-Encrypted: i=1; AHgh+RrBg7N0cmKs6dMTlqmaMbi5kVcupEIfAnKp8emykCmzIE3sxb4imhrqtCakKQboe3xiQors8p1hC1o7@vger.kernel.org
X-Gm-Message-State: AFuF++lD6ZuxuNRSdMZ0oRTOUqjDtKPetJN6m+hLJe7+fadHmb+cKGFz
	neTUySKHumclBcweXw7xhEuBD2MtlzxkXB+IlwV/Bm96E4XJCbmCKvS9QFPMVSaMgr4=
X-Gm-Gg: AR+sD13br4eOLV9EQO3NnCLztDt5f0R9cFdi1iceRnv74h3+o8HruvFVeprDdiCvOIH
	uWqUu3+mCknEHpDcjTkjWgJyiHa3/cBGBdn+fGAWvMFVVo7OA1Q1CtZbBEGrrzojSQdSc1Mv/ru
	kqSpbbtZGqtZsXmyldk5SrCtJooWCC/oiFyh/Ak56Ug2phAOOgZ6/sm608E/Px9A8eeTxCfxX/a
	wX18GZ+7NO0Z5Mz5yIHjcg0eJ4s7kfAk1tr0T23a205ClY4dixWxfF+h1O3UC4cq0un9JR5PJVj
	Yj8MzqW5tLb1/lWkEcCabM15vUBnvdROV5FR2JwmNW7cydg7GUd3+fB5yX9IANXdo+cux/62+dS
	a5yveXhb0A3UEZc2Ww2xvyLBMDSw5H70YixAsgFjXm4VgQSq4w9IM5BOqHD6onOXmFcT8Iv/5fC
	W6a92rxYdPuLBPBkFRlOrNxbCuq4sMyGaetDZ524qlbuUz1Slr9HNQlyGBtIySuhstQfWrRaRgz
	qILB8A3RPysnCprzDNRCb3Av8A3WLv9OCpuYKHel4o=
X-Received: by 2002:a17:906:6a25:b0:c16:12ff:dc8d with SMTP id a640c23a62f3a-c246a69a22fmr393921866b.14.1787296348403;
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:19 +0200
Subject: [PATCH 2/3] Input: himax_hx83112b - Add HX83112A support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-2-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=3188;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fiy4GcFZdsC9yxetlH5+plrNHl5cqFDQooXiediiUNk=;
 b=7WvOSkB+YtikXSJZsjpEaaIeJ0pySPNkReYF4txiBimvkVap6UafneVGgaHcvM8K6ID8XIcbf
 M/ujWmt7PrHB6ANQxRMzVAZd3fHvWIZrngnt2rc6gx7b00XtZ+dFBca
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The HX83112A touch controller works nearly identical to other supported
chips, we just need a small dance before we can start using the
touchscreen.

For that a new 'init' callback is introduced to facilitate that.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 0aa67dfacbad..cc8b904d88e6 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -62,6 +62,7 @@ struct himax_ts_data;
 struct himax_chip {
 	u32 id;
 	int (*check_id)(struct himax_ts_data *ts);
+	int (*init)(struct himax_ts_data *ts);
 	int (*read_events)(struct himax_ts_data *ts, struct himax_event *event,
 			   size_t length);
 };
@@ -364,6 +365,12 @@ static int himax_probe(struct i2c_client *client)
 			return error;
 	}
 
+	if (ts->chip->init) {
+		error = ts->chip->init(ts);
+		if (error)
+			return error;
+	}
+
 	error = himax_input_register(ts);
 	if (error)
 		return error;
@@ -395,10 +402,47 @@ static int himax_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(himax_pm_ops, himax_suspend, himax_resume);
 
+static int hx83112a_init(struct himax_ts_data *ts)
+{
+	int error;
+	u32 buf[2];
+
+	/*
+	 * By default, the chip boots into safe mode. We clear the FW ISR
+	 * register and perform a second hardware reset to boot normally.
+	 */
+	buf[0] = 0x9000005c;
+	buf[1] = 0x00000000;
+	error = regmap_bulk_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, buf, 2);
+	if (error)
+		return error;
+
+	himax_reset(ts);
+
+	/* Give the MCU time to reload firmware */
+	msleep(100);
+
+	/* Enable the touch algorithm */
+	buf[0] = 0x1000748c;
+	buf[1] = 0xa55aa55a;
+	error = regmap_bulk_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, buf, 2);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 static const struct himax_chip hx83100a_chip = {
 	.read_events = hx83100a_read_events,
 };
 
+static const struct himax_chip hx83112a_chip = {
+	.id = 0x83112a,
+	.check_id = himax_check_product_id,
+	.init = hx83112a_init,
+	.read_events = himax_read_events,
+};
+
 static const struct himax_chip hx83112b_chip = {
 	.id = 0x83112b,
 	.check_id = himax_check_product_id,
@@ -407,6 +451,7 @@ static const struct himax_chip hx83112b_chip = {
 
 static const struct i2c_device_id himax_ts_id[] = {
 	{ .name = "hx83100a", .driver_data = (kernel_ulong_t)&hx83100a_chip },
+	{ .name = "hx83112a", .driver_data = (kernel_ulong_t)&hx83112a_chip },
 	{ .name = "hx83112b", .driver_data = (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
@@ -415,6 +460,7 @@ MODULE_DEVICE_TABLE(i2c, himax_ts_id);
 #ifdef CONFIG_OF
 static const struct of_device_id himax_of_match[] = {
 	{ .compatible = "himax,hx83100a", .data = &hx83100a_chip },
+	{ .compatible = "himax,hx83112a", .data = &hx83112a_chip },
 	{ .compatible = "himax,hx83112b", .data = &hx83112b_chip },
 	{ /* sentinel */ }
 };

-- 
2.55.0

