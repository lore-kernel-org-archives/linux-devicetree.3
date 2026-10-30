Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383884;
	b=K20MzYefabNJatn6YIclpPHxplLLqOhOwTwdsQqudG+83A+o7pFkt7SvwuAvLf7+Ht9d
	 7KCZy3IM23JLE3epJAdpE7p1FgTlhd2pifZZvk72fe8bxvozHFqS17OYCJ0Lpmlo05CCt
	 mRDniTeJMS0nDAnbaQls0nvGGmB8ZOkr20RhHDpIfl5KiWg5DMYQTpeXui3DPLBqBM+l8
	 g+/oLJY1YnRScCrKglU/3DzamTFHDUzFfhUeDAAM9JuXSdzPSyI+oL2PVt2lvQ7zQxsHe
	 m2FXnHWv61pHi+sl4HpGJVLoaE2Q6sGbNroGgXQp8H/ug4Aw2iSdi5PClHPCcejwmww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
	b=j052OwBZblogJJ2b8IfCJT0aJ0V1pVN287WdPePowccWcTOBwubT+4DECdaW9xoe2TMw
	 9/2N1sKae81lHv1M6OotjmWPXjgPx+del33YrDgNILrtItJTNOkdLadS0F2GA542J0yjk
	 C8qEFB/aSYDmhr8sVvDOKtoKi8fBak+6yEZXWB4Yk6v0MQVLl8sAiCxse/JB1bWMDyHPb
	 d3W1PRXQ2Dir0UrrMtBYts17Qr6WkcvacPMFVwLZ9W+4EGoqyoRv4zoybItFdeKrvM6mm
	 buMaEFE3x3Ct5yhJrTwkL3EwAD3vNk9RjRPrQv0KWQqKa02bCLyujNOsf3g1ad6R5gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ca3RKvGW;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDE60A261A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDDE60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ca3RKvGW
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f560af6aeso118079985a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383883; x=1793988683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
        b=aRXA8NoQzJvFuv1FwsuY1g6fHeGlPdxx1bV7QFtVydXxsoPG4UOodw4QekceCO8QtI
         4H44PE4+/XDFBf3f9Y1u3noRLBD9vi/HpEFeE2E3RjyxOMsTeChPX1YtobMqmVWwl4gF
         qdx20i+3vWzjCT4wqT+fRiKKv9s7Q2hCLWBJZLsAd9riUGBjU2hj01sNM6rHNCZY8ttM
         AyUX0kS2ztlQARxNrcEj/kvQOCd87J55eLRmzUhE5U5U21eBCaHMtVWYcc5cmS3CgXnI
         0wG2AfI+pqK4Ztb+jBisocgZ2TXeE/5j0fxzQxAewNZ4XopofYvwP7/ukvwewp4TkOtV
         /wvA==
X-Forwarded-Encrypted: i=1; AKwUvBx8m46R0EPaggSI6TvhqP9xOcUtoOlAoWuDBOxu6ix0FnZnu8yfpnw08PdvKm3cXoEClj9GewaYCIwn@vger.kernel.org
X-Gm-Message-State: AFq9FYIcRF03SdtUREOTIJ8k7V4BMXoWBT+fdBDT8p5P4QTppZO3scRV
	9X9Gt5l0nXJ9xIT7Lz/iOZSIiPFnpN5Ig7vzQulE5xD1RuPHIBPZyavJJn3FtW1ZtoEEjtK4dAD
	sImdPnOSHpJS70NYvkT3B9fT4h2ztRWAX9rYuxDR1/PspEKYCveD7C8rofS98tq7MXHCXGfLCvu
	EZQOTZZLBN+ZzvEC2Nr67E7PglM8yAkyhtnhZUhy18BzDUNdhTS81Mdk51xegMx4Hlww8cRJ6eR
	dUWaQ9Yaqq8jQ==
X-Gm-Gg: AYBFou2X9TVY9YKd59CLtO8+j9q0jt8W1pxoumvlhJk1MVtcsP6fOI0peVanJszM2p1
	sjzaIEFl/Qt2dJA7h7i8iiFd0cHY/Dr5F+f71pie/uecaUd2r0JfjheQNHAAn2cD+6IT/jjHb1U
	aYvYaggutct9jimi3EYsn1Z+KSyZoBD8h9Vy1YxjDb5uC3DLVLMKbi2ca9MhNdk8FnW6dm60KOK
	6hpmp/ng95/sykWHCK1paEx64Vs6MuxvJxIoFHlk5DKKr4Dt3pwaNEQjYO7dcB0H0qemKisAvIO
	Aaa5yYgsnKToDP1WspCqnoPRV3dY8LqdDwMM75k5dW5JyxpCjqzklQGbUCLlBze1I9mEr4+LrWF
	6lRA2Cm/S16fAbcdaPGimWDj5/qRFezj3mGgIESEB1yg2n6B5NT79haT+LVqKigO+D7ojKrLPMF
	F8gaUFeUB67kYY/FCKcWi+/Nk02RLbhhBK
X-Received: by 2002:a05:620a:4588:b0:93f:2463:f784 with SMTP id af79cd13be357-944217e9fdfmr531606585a.66.1793383882708;
        Fri, 30 Oct 2026 11:11:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94425807f2csm24579685a.12.2026.10.30.11.11.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so1235582c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383881; x=1793988681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UEip65nRVFiwXi/RQ81IOIqu2Aa5gJjnBH6d1LLNVo=;
        b=Ca3RKvGWNSQaAhXGySCioh/4xqWVLydiPfMIvdmXEru8B4+KYXhPTIPCBAFVLkZmts
         CJoMiCWWmqQF/YeDqLhBpZjIGN1nPOvLFpKh5f8LTEgSI6qGMNPuwiyKVaW7yadkj1y7
         721wAwOvnhCf7zcAaJhZNO8whJcznSgjAOMos=
X-Forwarded-Encrypted: i=1; AKwUvByJSlt9K0OjusCFIS822jYLeLYR0W0l/4uLzCH5lR9UBoCbgLxWyKiKF5yPPinRcEIHJq9O/D/C+eo8@vger.kernel.org
X-Received: by 2002:a05:7022:208a:b0:143:26cf:8615 with SMTP id a92af1059eb24-1ac5dc65c45mr3734286c88.25.1793383880730;
        Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
X-Received: by 2002:a05:7022:208a:b0:143:26cf:8615 with SMTP id a92af1059eb24-1ac5dc65c45mr3734232c88.25.1793383880060;
        Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Subject: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Fri, 30 Oct 2026 14:10:33 -0400
Message-Id: <20261030181034.3811225-7-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
card would otherwise be powered off and system suspend is refused. Warn
about that while parsing the DT properties, to flag the misconfiguration
upfront. While at it, claim the host around the reset in mmc_resume(), as
it sends commands to the card.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 13 +++++++++++++
 drivers/mmc/core/mmc.c   |  8 ++++++++
 include/linux/mmc/host.h |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..8b38ff45d20f 100644
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
 
@@ -375,6 +383,11 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume")) {
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
+		if (!(host->pm_caps & MMC_PM_KEEP_POWER))
+			dev_warn(dev, "reset-card-at-resume without keep-power-in-suspend, system suspend will fail\n");
+	}
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 026003ba507d..a9e3cf7ae039 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
+		mmc_claim_host(host);
+		_mmc_hw_reset(host);
+		mmc_release_host(host);
+	}
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
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
-- 
2.34.1

