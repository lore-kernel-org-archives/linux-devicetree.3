Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383878;
	b=r5ep47+DJbbCIKJ1pWARW1Hqu6Ezge4J70dyh9QcYc9zlsmCMWxj5h108RTaGwuffSHF
	 /6zsvYcPqLVz/powte/8Us8wON5QiED3IuCwKD58E+nTq7tz0Bd46LIa/Mp81wett7Fpc
	 xuItcelnoQ8JMkf0FiU8EHhaBYso8NLXzzjhZLSO6wOZ17CmFJc7hBFXQSbayjM2G8UsG
	 jQFULRfYOlsN0u0GI1HbeBiTVUacoUJ47QUFfLLJMWv9B79wM7L7XSRWuXH7Wdm4cCBbd
	 loscyoiiNIh3sjQnmahrFTHrB3A4h3yMxDrXNdvGKxP8XCXCxdSVpj1KMSXss0FEm8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383878;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
	b=K5Knf1XO2j6LvNRcR5zoLswGzTtRo8oRwLuFYCHhRygQfstDj4m4/zYALsqPGINAmc49
	 OsMimabIlq8bofo6Dlzy2nVEKr1DAv0fTCjui94EwmyHte42P7nhIC1DQ7+DZwuVi+JDO
	 Sba1HddyjBwJgRxm3do4iHv/GA9cqaT4QnqXb5MkYsMhNpIcj05ROpE0qBzC2MiJNiqax
	 jhFqbFuJbv4ToXWghPj2E2Dg0/YQ3HYx/Uw9lLUBC32vJW02cAWoUCaaMBHKuQ/Q1Iz0G
	 4FH8QWMISSx5U6lRifHvawlEygifubFY8vM1PJBq5C9jmcYYrPWgiPwTtdc/Gd2c39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+lUk9S5;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F461606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F461606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y+lUk9S5
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91b89c6caffso8349376d6.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383877; x=1793988677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
        b=PdIz8RhX5Dvp9zbCCW6Cg2H+gNdtCGsEPa9i6Z46rtIN21cOsA0cnW5vlFjodtz1Y/
         TzlddG4Nmm60a1FTaIKS50g+Lgj7gh5kYfmLBovv0y7yEBsKbLXml0kCgubIswZ4Naah
         3oBdHgg3OmCZ+IWE38zHZmGkkHJTf9ABYLEdRYJwaL8nyvGRMEynjbyGcSZOXGHzxPNe
         6piIqD7d1tX7LoA0xkwxuoYIfGSW6GK3QOP99mui7vmS9Ono3pkAxlOOTaohUiHZqSPG
         pLtiHtbIczBdg93TmS6sCyRaRIT9bQVQvmKeJEEJU4xiSBsmIES4pSzKJlvLEYRcrTK2
         pSuw==
X-Forwarded-Encrypted: i=1; AKwUvBxJbL7Ux3lZFKbolmPXrvAZtqDG/iKlapa0ABIIAME63X6WXwY7ezq3g1SLJaefXzz8xc3EigeqI5B6@vger.kernel.org
X-Gm-Message-State: AFq9FYIOY42aq7U5DeXk3jyjILL0h51wCYIvJ8CFrDbLr9nqxxvJ/fZR
	AQqCy3VqcOPw/MUo78+/TTFaIZ16EpNSC+lSErRqyHmPmqNR90ZTvw+QJR9Df0qr0EkJqFidBCx
	Wx2xqUwdHyim0de6w7ndc04kltt9ooq850XC2+S+TN2L/Nfo9/S5JFHfpdOv3GX2rfrKbZzvdRH
	lThS6x14M9z6vVGS8cqL/OrMJ1mW9WbMZtq6x/bEEpTW65QUA+CR3oyhz4+Kk5pOzNq0V0wvxJD
	hHhXyDC4WtTNA==
X-Gm-Gg: AYBFou0PUgue3kSNxNlKulQ71cCo8ae0MSXJn6PAmlbw2ikDWldaamLjUjZ3TOJqsSr
	7496rMci3KOawUqjFnW3A2D4y4O69W0mELg2VgEA9r8Dq/fqL03IQ5huUj/iC7MfY7OJwXB8B7M
	q/TdLBOCNYLGnRhoR3imcbVQCWwUSH86Joqhlr9sLBMgks0/O/jH1tXp8NauzbAIN/JPhVp68Rk
	KVv9a47iuaj+Ps5gcl/dp6ex96FKxX5/TB1fceQR2gByEoUrGBE5Wk+SZOiS+sOoB0xVIAsh9a7
	tdsDybV2XSXZAQnUZjUTdTsUIHKdDEM0CaZDuEKTnbc/mwecFvAxb3fsR3VI6cnNysFPUH0lEMh
	MRGGK4381ftBIx1+rBea45uTwKOpBpl81MYEmPHvfijOtQzB25hnaTa59AruZgFXW/r4PCOk7ui
	eEjn4oHQEzu/nSbG5pj+ImYFKhj9uBD0FQ
X-Received: by 2002:ad4:5fca:0:b0:91c:92ba:265d with SMTP id 6a1803df08f44-91ca4bc773cmr49579816d6.56.1793383877241;
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ca7f3c829sm299886d6.23.2026.10.30.11.11.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1898561c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383876; x=1793988676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KX9VsWiwW35a++SYtlTrxjs9sLoEMITslby8aUNfDtY=;
        b=Y+lUk9S52GpgSqkFxmpOfwNnhOpqBRdpXpu1/8vLyKaJGY07IortaOe0UY4bTFVUq5
         Bm3LbOqSgh+5UyjNsRbMx/sQIGHPm1rou/dSCabXxtaffBO2XI8WpeRc8e1720IiSvNP
         aFKWSqGxxcJrjWQ8gTm4FXYTQEf9/dsH6bAkY=
X-Forwarded-Encrypted: i=1; AKwUvByxLXHUQfDBIFhonUS9JXoWFNkASyL39MHNOCiAgVhGTml0RHsdkWObukV8DH/ifU8A00siaBAZ5oCC@vger.kernel.org
X-Received: by 2002:a05:701b:2910:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1ac5a0b4358mr3869598c88.16.1793383873691;
        Fri, 30 Oct 2026 11:11:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2910:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1ac5a0b4358mr3869550c88.16.1793383872956;
        Fri, 30 Oct 2026 11:11:12 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:12 -0700 (PDT)
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
Subject: [PATCH v11 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Fri, 30 Oct 2026 14:10:30 -0400
Message-Id: <20261030181034.3811225-4-kamal.dasu@broadcom.com>
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

The DT property keep-power-in-suspend, allows us to specify whether the
platform is capable of keeping the power to the card during system suspend.
Up until now, this has been restricted to be used for SDIO cards only, but
let's add the initial support to allow this for eMMC too.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index a02b04938e1a..c936272bcd81 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -38,6 +38,7 @@ enum mmc_poweroff_type {
 	MMC_POWEROFF_SHUTDOWN,
 	MMC_POWEROFF_UNDERVOLTAGE,
 	MMC_POWEROFF_UNBIND,
+	MMC_NO_POWEROFF_SUSPEND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
+		if (host->retune_period) {
+			mmc_retune_timer_stop(host);
+			mmc_retune_needed(host);
+		}
+		mmc_card_set_suspended(host->card);
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2193,9 +2203,15 @@ static void mmc_remove(struct mmc_host *host)
  */
 static int mmc_suspend(struct mmc_host *host)
 {
+	enum mmc_poweroff_type pm_type = MMC_POWEROFF_SUSPEND;
 	int err;
 
-	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_resume(&host->card->dev);
+		pm_type = MMC_NO_POWEROFF_SUSPEND;
+	}
+
+	err = _mmc_suspend(host, pm_type);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2260,7 +2276,13 @@ static int mmc_shutdown(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_set_active(&host->card->dev);
+		mmc_card_clr_suspended(host->card);
+	}
+
 	pm_runtime_enable(&host->card->dev);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
 
-- 
2.34.1

