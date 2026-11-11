Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426293;
	b=Y58A86y9PASuTmE4oKIqcYa4plH7VWOBa72Sau285i97SRXPyIYAsA7UVnEIsAgouwpB
	 Y1BPuJZ5n29F+eI2GnzOuoi764VHZv89PoOKSBDdFgfjWQZQgsyozRtC4oXFFyG2g4Dk5
	 IaXczDHG1D0dj+VWJ4lg9vQ7qiZocGxzJLAO4pS7ghk6TpQCxcamrb3O8fUw+MblxRTi6
	 UDnihrT0mqImDuFFEdCv+rCDHuplv4aP/PeoJhyA0GjyxTd6YGFdv5YkOr2k+RYUY5cZX
	 qOvn+pieo2VRa2WwpkIG418vR8L2u3BEUL+i9DiM/Bsylvy2EHO4bnGfYesxW4iZdiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426293;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
	b=JCCRB1lEZIJgi2DkfiBfgOH3tE88hWnsbWvpajb/9tTGlsrhr+fTjHJtA9/fhGe/J5jZ
	 Nx2wRtgVvhUOX83u+wGR3eMZs9luHg3dMoYLf9RXpbmXVyCJcbRs/e6WzGaNVLbsYhwX4
	 xLJFh1P6yOv6vKlowFpql2p/PC7Qzd0TtDZZcULwSObteR4tEojxAPMlw5H/zsZ1EdmU9
	 57APGM2Zt0BlzqOmLwoL9xZPcmUzgFbPFufDxW799Zr4RpxO9w46giGCXA9mz1Jv0FMYF
	 nsNdX9fsvgVNHWuEIRR9T84ovYTcHMIXnTL8SBk3Cs9cVUWpu6w/0CykYxfoRS/SxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KOTABQTy;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB3460A2616
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB3460A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KOTABQTy
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so2060111a91.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426292; x=1795031092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
        b=nTXQEDBVYrZDy28jSq6ixHjwE40CDefYt9xHYtalRDgNEqwQ+DfrjoIORe7IYeURAu
         iE1ZwOJbYJN5FyanO9kHAzliUKyGTyMk5ISoiiX6/dCtwpl+5xyu7/DyF20p0WJqoAuC
         5ZiHf1cxRJd7Ek8kAbQS3lh15zUBtXREjTV8FzagXRkgXDj7PISQY7p5L6uZ09Reh/vH
         I52IXCDOBKXZkfODm5bpsPcToyPlJx1ZVbwrzo+OiReZiyNhNTwNFokLmeRxMvSANdZz
         jJB+K1A7HH8m4H5NvU2I4RhkuyGJLmCrx0b2HxiIa7XGR7H0kLyROsp/vTdSVI36uc83
         PyVg==
X-Forwarded-Encrypted: i=1; AL+hErF33AKTgkARB4PvUGdHFFm09YP9HTjKRJgeGieHYCcvXpUO0I5TLKYrp5gv1yKOLojoxq6Pck4yoQIE@vger.kernel.org
X-Gm-Message-State: APuU4Z+6QHSKwZA7YSK1EyhTGpzizN8npxQihPXlagwWecOCv/KVGWnn
	MZYIVAHELklaCGeG/k93MXh1tr3rAEDWVoRxeE/O05aMoHQJFovkxs4AE7t7VaFNCCTUFiuNDNt
	E1VLHelq4PMQZA27Z9J/M2aBGKpIvkIUK5B/VlM6MkzdIavmKkjn1kV1jZe1qkRUg6L2WwAReNG
	Xl9FbdzSPiQUrr574tsdEgmrG6KpvSao/TOo+bZr0/31oEp1a5oL5MmruEOlttB3kPsgnjmZSpn
	vvlPGrOz8z96w==
X-Gm-Gg: AYBFou3PGKTtkoX6MuCo2tHmDutpgHUAJA50uK2YZwCnsQhZLke1qDYN5icOVw9AYWz
	qwe7OCyUN4wPdGaZ0PS72l7U7N0UtNg0qir9aprU81L8ZoFnKwWDdLs2YJ2Sd/KhnjlkeATwHmN
	Tg3TfuXeW92o48zVdaauWPfR5qvBA5DW01GvXvtTEAx3ijxDGc4AcDtX1ZE/4QYqjBZIN8a7HI5
	FlTLkcNbEn9Nq1StgnXr/jcEDcYZPBM5RZqYISe3dQNxtFnr40GkWvS8jCox9xyittB+Dn3fMcI
	8b94XKsDm8KmSSr/6Oosg6qXCCV9GUS9Ps7rFgU4aysTFo6ERNlyh1GZpAxyZrtTKonX449yj4c
	ZD1xDlgtuntOSBAVWjHFtcopeoQNonCWU69ygFixDTNetdc+inxcEAAB3ALxICnqL5c4G1chOaJ
	fX1pXcrVc1eSdMYgTyzGjqgvbwFq8wjkHv
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr3149106a91.26.1794426291786;
        Wed, 11 Nov 2026 11:44:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c475f0sm279087a91.5.2026.11.11.11.44.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so580980eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426290; x=1795031090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw48uU5TuI97IZTqjbPClG+wxWg8KU+drJon/k2SkSQ=;
        b=KOTABQTyMmSotnDBqowcSSEsu2WGYMXB1N5ZVC96ERVJ6H4jgXrEuqOj1J5TMU0zqe
         NOqtCkW3n+1LMjoBIxceyQzR25kXBJGFZyuVXYdA6teWUjsVIO+3W9B10GK3oa99rxOx
         4+6gpq5X4gSxixbltiAwtclOUq6Dz8UKzQadY=
X-Forwarded-Encrypted: i=1; AL+hErGSFHZjrCsSjZx0dv5dYw2biW3z0Ss+HU+TPwvZitB3JEvcYJ1CEZHB8b4kTguQgqA+WTl7YtYTP7zX@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:36a:54a0:6b4c with SMTP id 5a478bee46e88-37686757ce7mr3184472eec.25.1794426289696;
        Wed, 11 Nov 2026 11:44:49 -0800 (PST)
X-Received: by 2002:a05:693c:42d3:b0:36a:54a0:6b4c with SMTP id 5a478bee46e88-37686757ce7mr3184439eec.25.1794426288973;
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
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
Subject: [PATCH v12 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Wed, 11 Nov 2026 14:44:26 -0500
Message-Id: <20261111194426.1652644-7-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 17 +++++++++++++++++
 drivers/mmc/core/mmc.c   | 12 +++++++++++-
 include/linux/mmc/host.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..94c8ec81ee08 100644
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
 
@@ -375,6 +383,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
@@ -620,6 +630,13 @@ static int mmc_validate_host_caps(struct mmc_host *host)
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
index 026003ba507d..71c59cf1178f 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2314,14 +2314,24 @@ static int mmc_hw_reset_recovery(struct mmc_host *host)
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
