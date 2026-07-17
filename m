Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041D37B40A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311601; cv=none; b=ouwaK0ZeBypxgYuLmLbPP52z7qj//BAV48R/yJRh8RQtGdAvuduB0c5s0j9v860df+wa95GKkfDiusUM9OeK1vYvnkPLeSnuqIelpv1xl1XCo54RCH1uXBdhbVNvFLrzTBO8AwhjNlNtguigWzqp8xcXWe7SO1MO+LyaWBcvZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311601; c=relaxed/simple;
	bh=C7iR5TL2sRKHhjZ+5i65XW4I0/9qKRfRfqWcp3ikyfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDb+81EuYsryyjBMNy/Yz4819xc5OcbUtivcDhSL+59NCfi2AwHbQDMnocu6SKt6fFWPNrWVPbcrh6io9/6G0CHlGUnNpnvsSigddVqPqWXpDT+LFd05i+mmdez7SaeyumtEC4fkDL48ZKd/4ZsIYiNjuIjW0cPTzZX5hk5aLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JuqGfxS0; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JuqGfxS0"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7eb787dec99so4814733a34.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311599; x=1784916399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk8fOSTNKdpV10bE/M7xcnHMgAcvmP8Zk1rifIUjMZU=;
        b=DtwQSuvcZu29wL/wFyo8XLySS1sgxWT52LF5R37QIYprNSC6uAB9QBQMbfdHBr5fQD
         u3jix6fYWMz9gsuLAkx2fi+jJ+0PY9R1btdikEcWvk5itRGXHUE5AOKVQWtuNsZTff+3
         GURqsimj6HTwffAZu8qQ8/PJouVB2bTLzYrJjex+qieEhSS6GD0dAUOa0SQYTr+DesiA
         BThhdm1GcfqM5dnKcKlCDxRSrVpziNZ7p8F4ov7Q36RUX1GKL45E3EH37TnwKeVUSnLM
         IH+WRUvh0bVTtHMs48xruSD8QEy/5dFWYGXXgKPQKdFoKE5JGqADkdeODrbZjNTM02Wa
         1SEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcYsXX0IsG4cx9HORFkPYTqybUHioWdqQsJ6iAEMtmQTwT+Biuxf3Njk+wMjaZlXOHtCP5E1E9hH8r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ee1jioh66roadBTpMmHv64bOIG57hv23aAgC+sLh/50jaBgT
	dFnkfB7Jf66eV9kkZE8fT800hR1pp+NJMC00Mg0ksXbm/EMuc2rKI/ofbYv4VJryhxMQ5hHB6PT
	CdDtE/oTkFmRetA9mZpnNWKjSQwBiWpawLRUH1rDkUSm0PSRluUpWznjyPBWtzBa/xnfMfidd4j
	oR5smMYTzj3njzOQ/aES55/GTbTl2z5s+Z9h7CWOapBLk8R+Lf+HFrZWQZm86KwfE2pQwsT+EoP
	ZJODbFeMwgRsg==
X-Gm-Gg: AfdE7ckgnSX5Y7Vbh1eAkJGlL5ArAjO7YuQMc4Vt3tAh7d44XLFwp5Y50z7sIMnkIiJ
	fHjdZuer/uqBOWON/mxF84hlaG4331OH9MIgPbAJZE13AwLb+8w+fMmvEI0B57G88R399BnNhR8
	6O97+5SqUyKxfVNDpe78mvnpqbLPp8NeFdDVyB34jKgZivN9dKsPF3gkW3edKhW5t3EqDQp3PIB
	6ytiUO0fkY+UpEw6QbZpvjLRXXSLNHfrjb4h6NdQ5rAEGrsD5fqSsiqn7opHtT4V3lJhH2KXNmY
	4KOdq+qHSlLb+FYyXD76ECrlaVQahdlkPBM3QYYbu4vPsVuk6oNz6jAnc/BsTX0DtQq8rNaquzN
	bPIrBMjVV/QOdOARvBcE7xxvzRFYAlA0W1rTvNQvikQrWMbxV+0GsdLYDuMNVMlw04hYzQTKg9S
	nZ4+NHT8HgijgnCA2bR3fss8Cfqoz41wjs
X-Received: by 2002:a05:6830:6f4a:b0:7e7:7fbc:8e51 with SMTP id 46e09a7af769-7eda153c745mr1866481a34.24.1784311598854;
        Fri, 17 Jul 2026 11:06:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7edafa91527sm132336a34.3.2026.07.17.11.06.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2026 11:06:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so145066476d6.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784311598; x=1784916398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qk8fOSTNKdpV10bE/M7xcnHMgAcvmP8Zk1rifIUjMZU=;
        b=JuqGfxS0RhFVNSYPTKUWr5n07pmBY3YbAZv5tljME6hS51t8uBbiulWhya6XTjTHR/
         gcjOMjbRgJQ8FvwKt5V7sbjV5WKYvrX8GPDJBeu2SzBagE9Jj4QW6WDIfl2R6jFPWrk0
         tzEaBy2xSCzAFVPyCq0ZHU3wB3HonTQmwNKNs=
X-Forwarded-Encrypted: i=1; AHgh+Ro0I5mhSrfSA5jdbQYAGi1WNrcye7CT6utH0hiLMbbQcGAO0i5kml3yu2uRVmjhM+IXG9ngkbZ8v4Q5@vger.kernel.org
X-Received: by 2002:a05:6214:2027:b0:904:2e70:78f with SMTP id 6a1803df08f44-90778353d4cmr43901996d6.9.1784311597706;
        Fri, 17 Jul 2026 11:06:37 -0700 (PDT)
X-Received: by 2002:a05:6214:2027:b0:904:2e70:78f with SMTP id 6a1803df08f44-90778353d4cmr43901616d6.9.1784311597175;
        Fri, 17 Jul 2026 11:06:37 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077856002esm23175896d6.11.2026.07.17.11.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:06:36 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mmc: core: Add MMC_CAP2_NO_SLEEP_CMD host capability
Date: Fri, 17 Jul 2026 14:05:36 -0400
Message-Id: <20260717180536.1757204-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
References: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Some (e)MMC devices take longer to exit the SLEEP (CMD5) state than
their advertised S_A_TIMEOUT allows for. On platforms where a boot
ROM sends CMD0 and reads boot code from the card immediately on
resume, a card still asleep at that point causes the ROM to treat
it as fatal and reset.

Add MMC_CAP2_NO_SLEEP_CMD, settable via the new "no-mmc-sleep" DT
property, so affected hosts can tell mmc_card_can_sleep() to never
put the card to sleep, regardless of ext_csd revision. This is a
host-level capability rather than a card quirk so it also covers
cards whose bug can't be identified by CID/ext_csd matching alone,
and it is resolved before the card even exists, avoiding any
ordering dependency on when a card-quirk table would be applied.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v2:
  - Replaced the card-level MMC_QUIRK_BROKEN_SLEEP quirk (keyed off
    CID) with a host capability, MMC_CAP2_NO_SLEEP_CMD, set from the
    new "no-mmc-sleep" DT property, per Ulf's suggestion that this
    generalize beyond one device's CID.
  - Resolving the capability in mmc_of_parse(), before any card
    exists, also addresses Oleksij's concern that a quirk registered
    in mmc_blk_fixups[] (applied at mmc_block probe time) could lose
    a race against an earlier SLEEP/poweroff on an under-voltage
    path.
  - Added Reported-by/Closes tags crediting Florian for the original
    bug report.

 drivers/mmc/core/host.c  | 2 ++
 drivers/mmc/core/mmc.c   | 3 +++
 include/linux/mmc/host.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index b7ce3137d452..3bc19645ea96 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -400,6 +400,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "no-mmc-hs400"))
 		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
 				 MMC_CAP2_HS400_ES);
+	if (device_property_read_bool(dev, "no-mmc-sleep"))
+		host->caps2 |= MMC_CAP2_NO_SLEEP_CMD;
 
 	/* Must be after "non-removable" check */
 	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 05444ecf3909..5e80fa5c1a28 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1972,6 +1972,9 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 
 static bool mmc_card_can_sleep(struct mmc_card *card)
 {
+	if (card->host->caps2 & MMC_CAP2_NO_SLEEP_CMD)
+		return false;
+
 	return card->ext_csd.rev >= 3;
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..0447a8efed50 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -463,6 +463,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_NO_SLEEP_CMD	(1 << 29)	/* Card can't reliably wake from CMD5 SLEEP */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

