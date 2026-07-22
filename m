Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E243C07C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754866; cv=none; b=MDb+BMLBICvxJe8clNM34JQTN1L0o2yiUC2viDVMSiaxCt9qiZobOOs5W1ix5qYyq4heXGheBqLl0XzlakbwwS//UuSWglyENcAJqOVvi2y1LsQ3pOBma78n8ps8bcC8t6icDFhpTKy7uwqEoHex4CA5IolVL0q8hJ+8CVG/A0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754866; c=relaxed/simple;
	bh=C5P90tGezlyCOSDPePcHNgwfT8nb8g7pu0+Lnox8hbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sWkDNtciD+u7cerHh9X8qAmiWh7YQtBeJIt/AC09TML5GJdkSggVqwrx4GS2QUDmfMfPjR1gjCyruSHXNHvinkuWQSZCBUC/36ZTjFG449Iyg+HQ0ah/2eDX1STijVJ3g9akzk9wHvXY8hTH/49vWfuU7r+n1z0UpjsvzpCu4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=avljIUfZ; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="avljIUfZ"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-668432fe416so4305216d50.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754864; x=1785359664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k0chG/ElRTFeeqYAhiA74GXOEyQdR5QSifouTac3W4=;
        b=WwhIovdS4MUn8ZP2kI/6eFQcnflLj2zuw/q7UQEHl0YG/s4MzxyjV1aj6e8nCjafYA
         ggr4hG4bEPMOiEVDoMKcTN5gVzsUxclcoW7U5kNOxG0Vq4YWu/V5wCZVHjo3KaVf70/R
         8WfWZp/83xTn2vZXKzUrQNQEIzvhTuteXarBycf4f+kSyVd0bo64sBhVQYpl9RVqdlcB
         upmXHK7D3fSXrkzWyznkiP7M21015BZppgJIpgcicW9qLB2yvShMOplAQGOqd/rnieWC
         K6XRK7lqSq2eMthmAks2uO6ScbUsn3hcK/7DlQe+h+zmRBepZbymIwOO34k9NdJB1kh/
         TkYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1xKpytvAm+S3HMJAf/puuEJtZp2sJR89WbLM6g1mW0cIUgjjyV9p1dUZ2ag1IxzgB4zDXv3EPVQ+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzbeeQtiN0OuDlwcPRe1m9DeXTO/PTOhtOzB/eM1UtGiv72A1
	t0HkmKO7TNOIvDfgnhH/TLSP6zFcsRkfqRa56yFKSA96Ewa8qD4aGzvbGIuvL+7gDJUKkzMvacf
	Xe/x5+q/PnEtd+nmjsUzfUYBXknVFT0oZtv7VMa6KXdK2Wpugoauy3nHord6O+kzB6mlDraYqCo
	6RQnrb+/8Gr6zK7j3iAW4IXwS3bZ5/4PX9J7HoZ2/Vw08tjG+QvulzFcbG8Wrg5y5Sh0aPFQJuH
	YnlaAJpWSM8Ag==
X-Gm-Gg: AR+sD10P+wmHlsLJVUlQJcsa4wQuXShaA4kcc7im6I/vXPjDlI5Q0Xkk5MCwZAJIcnP
	EFJrVpsJ0Y+Z7s84+TMo9Vzn39hVI6RH6WXAJ/zTOZmyNRutCqdCksdZzdnDu/qaex2pvO+uQHe
	sKikBAJatczgOd98h+uIjNBeTUx1q3wYf7663VPE07mdTnvyqmVpUoh77ZnnKxvkxPKDnNy7miv
	E7FLvs78o814qOd1IL58GK+y8UQ8KFhbnHk5xfl1VQ0PIKgHatI9hjs2DC3kni5ZZcG7kHlJvAP
	c2qqX2iFrkYBvYmfRUga68BRaqDywr+tyGVezJnaj1NX3W7hz2ZrvyoIo90rNff5ftZqND+VHRK
	xAFxexR/tURELQJQunvq6ndX81r5VtT/sTh+2zX5B6tpPzLJEBDS7aKxyrnJcUN6rHSJ3YwC2aG
	gRAo3M6caPxAXyetlGcpDwctP4k2CecyH8
X-Received: by 2002:a05:690e:43d9:b0:668:91a8:d44e with SMTP id 956f58d0204a3-668a5001e98mr58484d50.80.1784754864126;
        Wed, 22 Jul 2026 14:14:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-668907422f7sm211039d50.25.2026.07.22.14.14.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:14:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso1890912185a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784754863; x=1785359663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1k0chG/ElRTFeeqYAhiA74GXOEyQdR5QSifouTac3W4=;
        b=avljIUfZD7ig/m60+0MFp/LHKR1s3t8AhOFgtv0mchQGB+NpmUmuMrYsT1mEjm2Dk2
         lN6NCk/65V2FPU/Q0oP9Bq+VHYxTsa/8ytjvbwDHaeGm2oHTRTKE7blPp+F0fY24fH72
         A2bHjuNyx5A8Fw3zIh3QlGur+ONhahpGOnxPc=
X-Forwarded-Encrypted: i=1; AHgh+RoaKwzDMRh9R4InfRM8qsdSe4iiDjvEldHediSOXvrUnh2VrTrCuXFRZCeBicEMZZGyqQEACL4jG6hU@vger.kernel.org
X-Received: by 2002:a05:620a:690c:b0:930:9585:e0b2 with SMTP id af79cd13be357-931036eab8fmr45188985a.51.1784754863191;
        Wed, 22 Jul 2026 14:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:690c:b0:930:9585:e0b2 with SMTP id af79cd13be357-931036eab8fmr45186085a.51.1784754862687;
        Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a7fffsm253004785a.11.2026.07.22.14.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
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
Subject: [PATCH v3 2/2] mmc: core: Add MMC_CAP2_NO_POWEROFF_SUSPEND host capability
Date: Wed, 22 Jul 2026 17:14:17 -0400
Message-Id: <20260722211417.3702709-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
References: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware accesses the (e)MMC card directly during
resume from Suspend-to-DRAM, before the kernel's own resume path has
run, in order to load boot code. This requires the card to remain
powered and responsive throughout suspend: putting it to sleep,
sending it a power-off notification, or removing its supply is not
safe, since firmware needs to talk to a live card.

Add MMC_CAP2_NO_POWEROFF_SUSPEND, settable via the new
"no-mmc-poweroff-suspend" DT property. In _mmc_suspend(), when this
capability is set, skip the poweroff-notify/sleep/power-off sequence
entirely: just deselect the card and mark it suspended. At resume,
_mmc_resume() already unconditionally calls mmc_power_up() and
mmc_init_card(), so the card gets fully re-initialized regardless of
what firmware may have done to it in the meantime.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v3:
  - Reworked _mmc_suspend() to skip poweroff-notify/sleep/power-off
    entirely, not just SLEEP, per Ulf.
  - Renamed to MMC_CAP2_NO_POWEROFF_SUSPEND/no-mmc-poweroff-suspend.

Changes in v2:
  - Replaced the card-level MMC_QUIRK_BROKEN_SLEEP quirk with a host
    capability, per Ulf.
  - Added Reported-by/Closes crediting Florian.

 drivers/mmc/core/host.c  |  2 ++
 drivers/mmc/core/mmc.c   | 15 +++++++++++++++
 include/linux/mmc/host.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index b7ce3137d452..35fd0be99c58 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -400,6 +400,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "no-mmc-hs400"))
 		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
 				 MMC_CAP2_HS400_ES);
+	if (device_property_read_bool(dev, "no-mmc-poweroff-suspend"))
+		host->caps2 |= MMC_CAP2_NO_POWEROFF_SUSPEND;
 
 	/* Must be after "non-removable" check */
 	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 05444ecf3909..27a559e6fcc0 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2157,6 +2157,21 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	/*
+	 * Some platforms need the card to stay powered and responsive
+	 * throughout suspend, since firmware accesses it directly during
+	 * resume, before the kernel's own resume path has run. Just
+	 * deselect it and leave power alone; mmc_init_card() will fully
+	 * re-initialize the card once the kernel resumes.
+	 */
+	if (host->caps2 & MMC_CAP2_NO_POWEROFF_SUSPEND) {
+		if (!mmc_host_is_spi(host))
+			err = mmc_deselect_cards(host);
+		if (!err)
+			mmc_card_set_suspended(host->card);
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..e082aab8f4c4 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -463,6 +463,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_NO_POWEROFF_SUSPEND (1 << 29)	/* Card must stay powered across suspend */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

