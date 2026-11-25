Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630873;
	b=rah0RoIhMZNZLExWnh8hsS8iShUYVCZMZ3tBBMf184pWVgZnDk15YZyXF61zM4StP7gc
	 duRwSgi0FK8m7d0stco/rqZaIBD1KcPksJ6mq0C40kdnZzYh/vERwnV18nTgaxh87KraQ
	 G4VqZPInTzjxcok6LmWPE2EpNwvferZLIUYmYswaWBPcaK23LViu9+eSbfjM0NXCFI93Z
	 EXKK22606l5LQIQYtQR2aikeKxCFTmju4q1FyqemOqI20m3uJMIJoj5J/NH5xag3yUki7
	 +5txAJY4IHcdoJaE1ghNBPqBllJltISoMtPPbNLuQimg7blxLHDXgnJ7mDbqrFMT/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
	b=G1yfHJomtK0Nkxe5T+T73LSMyPU66tsd6v/GudxOjfOR9s/AA9ka/DZg/rJV4dBnMiCW
	 1nsEtXJ+DPOhvY+Xj1alJwPMkXKDK12wsK2ecOJQWTRMPnHDUvFRW+qMTbx4RN+WFN0bP
	 yT2EBjXaIF9FSuiVOJZaRIzail/CY3PblvMnhEZL7UdG+cJR5Y0Rs4HDbo7pVgHXMIh+t
	 shxqyc8bUIQ1qZ4g4aI1KMo+83ttnciD33c+Rt5Z7Vax43rioMTGyOc8dzm1BwuS3xpzp
	 lztH82nC+jrIdAXVh/FiWOVbS7Md1xb4g5hB6oM+7UFtN5LwEy4FPl2Ovc8BWAILzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tm1svFrH;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB70606A687
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB70606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tm1svFrH
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2f04e3bf46dso45049355ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630871; x=1796235671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
        b=rPR2e0EELrPKLd92IBZ8xmEfFjE3+CfQ87N89RjXqzwQStP6kFRF8yYkhaWemZF6So
         GD3hSjhPX0FugjpvUMOmsfhzQWaLd3QrI1epxmdutLQyYjgjAMWb3/9zAGuI2vXovRZ0
         Xvc2DM8XBcu3huE5Pou3r/r7oOIs1ymYD9CqlTEvgNfi2NKBODR919PrzMTrctaPNSuo
         WH9rNfv+K+Syq5G3PbTv7+SWlaUMgZWlSVS6mBeJxk7mUFt/OIxWcdnSFaxqTnwowyHy
         gJ7tB82jsw2HuxYBdzQmFiyotTMObgu/vDfycOmuMbLZoNJK+a0uCUbrfWqSPH283HKe
         zmRg==
X-Forwarded-Encrypted: i=1; AL+hErH83TgrEMB6J9R9Do74UMqzbr/3Wi4LAE4eoq6cAqch8zf7MYBKg96J5L/UJhu7m7gNZ9gpEYTcnc+K@vger.kernel.org
X-Gm-Message-State: APuU4Z+gbps30Q//gQ7Zjq7tWzeKUJCeCTjQzIeobpUcAY5PITSPz1cv
	tKEBpjb+fVuKJB4UgY07xcX4I5kG5X7RFzv331ZY6Qx6p2Ac5sq1Za3cOnL4RPn8ySu76GzJrRn
	moDlVUAMcHNXQWWTaMLTLku3J1rsHYAsq2/vfe2cUL3e6pMMTZxC4ubf6JP3bY3Ia1hI563050F
	SGN3JBynpYcGpfseH/3J2CDTewtv1hYYocY4HZwMxoVl2sDZ8myJnWSet+B0hmDcmxNrofV71EE
	QudYmrkCkPcZw==
X-Gm-Gg: AZFdTZc6PBXokhNzPo/BzuP6GQQWTrV1AmVjW95SkF+W/C3dfbYkuJG/6pisk9aZklO
	vJmNC5yzsAGLajzA60pyiQg/AIHFdMLX69Omk1pT5Gk6kRZak4ImZ3JbWOW9RbMkckgDc7ePyrL
	2/oQAfq4Tn9sc/0SBSDMkLly/qQF8XeisxHFWmama15UgVBwK3bK4L3gPOVCpVRPP5cOnPWuerF
	wt8kozzsEu3Yq6FzFA+a8y9/BArbeg/RBKEXOGmx7GMagrm6fWYmeRODxBe/QKFZLzHznFw/Ub3
	4+qbg5SuZbueKjP3dC0ZeF5AbKzCgefVQBNbFnX4soA04SBjlAVYBlD0dSp9vH9uEmPcMjmemeY
	WbA5n0zbNPtzdVqvQf56qnmByLFp2akkMjze6uMH3h4/e5iiyJQOxhj6M2O3uu8HfUkcYALgtSd
	bECQ0omxWil3jmJ4lwjxURn29YbVngz9Ay
X-Received: by 2002:a17:90b:3a45:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b41c8fed61mr17656437a91.20.1795630871422;
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff67243sm6777235a91.3.2026.11.25.10.21.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so670883985a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630870; x=1796235670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
        b=Tm1svFrHeAQ5l7w31QJpPA/mU+cg7r8G3LJ/ycz+998st6HwKg595XvflOADQ+U1sk
         bgyMYr+oX59/lRdGwsfVewXB/ssaVwNpNdw15T8bqJgspf6i+5UGCpg9Shn+7KgJgqQU
         /e7PWM/XTHQatTz8KfS2sYVQn9ilITsXyKcA0=
X-Forwarded-Encrypted: i=1; AL+hErFzTcls/t72eZL9bwPNcGrn1v1ozJUMUFYdxvoNH+2XB27DXLa/8zP/eNdtqs/vqp7z62Khh/aI8gYw@vger.kernel.org
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id af79cd13be357-949cb821e7fmr2119545085a.49.1795630869961;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id af79cd13be357-949cb821e7fmr2119537885a.49.1795630869236;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Wed, 25 Nov 2026 13:20:53 -0500
Message-Id: <20261125182053.3915833-7-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

The DT property reset-card-at-resume specifies that we need to make a reset
of an eMMC card at system resume, assuming it also has stayed powered on
during system suspend.

To implement support for this, let's start by parsing for the new DT
property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Based
on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for the
host, to keep the eMMC powered on during system suspend.

Finally, to manage the actual reset during system resume, let's extend
mmc_resume() to support the needed behaviour.

The property only makes sense together with keep-power-in-suspend, as the
card would otherwise be powered off and system suspend is refused. Validate
that in mmc_validate_host_caps(), to make the host probe fail upfront on
such a misconfiguration.

While at it, claim the host around the reset in mmc_resume(), as it sends
commands to the card, and propagate any error from the reset so that a
failure to re-initialize the card is reported by the resume path.

Also clear MMC_PM_KEEP_POWER in mmc_host_class_complete(), as mmc_resume()
isn't invoked if system suspend is aborted after mmc_host_class_prepare()
has set the flag.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 26 ++++++++++++++++++++++++++
 drivers/mmc/core/mmc.c   | 12 +++++++++++-
 include/linux/mmc/host.h |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..9cb456a153ae 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
 	if (host->bus_ops->pre_suspend)
 		return host->bus_ops->pre_suspend(host);
 
+	/*
+	 * If it's required to make a reset of the card at system resume, this
+	 * indirectly also means that we must keep the card powered on during
+	 * system suspend.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
+
 	return 0;
 }
 
@@ -55,6 +63,15 @@ static void mmc_host_class_complete(struct device *dev)
 {
 	struct mmc_host *host = cls_dev_to_mmc_host(dev);
 
+	/*
+	 * MMC_PM_KEEP_POWER is set in ->prepare() and normally cleared by the
+	 * bus ->resume() callback. If system suspend is aborted after
+	 * ->prepare(), ->resume() isn't invoked, so clear the flag here to not
+	 * leave it set at runtime.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		host->pm_flags &= ~MMC_PM_KEEP_POWER;
+
 	_mmc_detect_change(host, 0, false);
 }
 
@@ -375,6 +392,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
@@ -620,6 +639,13 @@ static int mmc_validate_host_caps(struct mmc_host *host)
 		return -EINVAL;
 	}
 
+	/* Resetting the card at resume requires that it stays powered on */
+	if (caps2 & MMC_CAP2_RESET_AT_RESUME &&
+	    !(host->pm_caps & MMC_PM_KEEP_POWER)) {
+		dev_warn(dev, "reset-card-at-resume requires keep-power-in-suspend\n");
+		return -EINVAL;
+	}
+
 	/* UHS/DDR/HS200 modes require at least 4-bit bus */
 	if (!(caps & (MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA)) &&
 	    ((caps & (MMC_CAP_UHS | MMC_CAP_DDR)) || (caps2 & MMC_CAP2_HS200))) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 122ac9ba0a4b..829947374dcc 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2316,14 +2316,24 @@ static int mmc_hw_reset_recovery(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	int err = 0;
+
 	if (mmc_card_keep_power(host)) {
 		pm_runtime_set_active(&host->card->dev);
 		mmc_card_clr_suspended(host->card);
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
+		mmc_claim_host(host);
+		err = _mmc_hw_reset(host);
+		mmc_release_host(host);
+	}
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
-	return 0;
+	return err;
 }
 
 /*
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 032c018650e0..3c0ea74e3e35 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -430,6 +430,7 @@ struct mmc_host {
 	u32			caps2;		/* More host capabilities */
 
 #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
+#define MMC_CAP2_RESET_AT_RESUME BIT(1)	/* Reset the card at system resume */
 #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
 #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
 #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */
