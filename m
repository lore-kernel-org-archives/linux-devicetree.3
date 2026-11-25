Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630867;
	b=QbTJWcBk5K7u5bdUh7K5cVmqoXYrYkJnf9wxXvP1POCkSHRHrhLzeu8d8BbtWSsUKCEi
	 0UjvCMKYImXST56IPeULsP3tzGKfLAHLBRNkqVE5I75+STXLweJCmviDCaHCxUONTwE6/
	 a/wj8ZukMMWNtljXvm7gATyi1bsK2glD12G5Zr1zQrFZrM1BtSICKtXc+S1isYn7jX58O
	 4t5kUANdgD0XipnUm4cf0nC+SIf5MF41042x761rIaIYnjpWDaqeSDG9c290fTP/VTPAb
	 S6Q7tXpHCLH5CaxCyGD9ah017MaP2v3GnwirnVml/GPqqX+k9ehmFun6klNcvdXa70g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630867;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
	b=Rn1gSBgpJYLDwrPNvsbI7NVo165sJ/s5Y4DedCguA+JKrQ10LZk6uFTpR5Fk9BUa47YD
	 fiUEdrleZPlPp9WjQ8IGh/cHfy1BblUXsqXfw/ZeowPn02RwfarAGseuzLx9ug2ZSSQc1
	 AV3e54LCRijInhc9KV7BB1j8jR/I9r2M6XxGN1I6TGAjLSw0FtQfl9gsLx7BLj9ovPDjb
	 tfk5LAluHb54xodkuFKndPPzSQWMKCoBMFGtIj54099IJLeREwn1mmGGltMHHmXDQ4oUn
	 g8sBluNx/d9VXjxQDwKNJlJiQUlGk96iiONw25vTaPDf9DAmqvWhJOKGx62eBABXgEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=awJUvtQG;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F7606A682
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937F7606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=awJUvtQG
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3990241a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630866; x=1796235666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
        b=I/xDsKudpTUjKgHGjpp0jlu2pIxNWzY0opwtTLX+ZsY7v6CeEroIBfCNGK54cHchDk
         Ff9ecSSmlWiC15fvyg18GMA0sZQSnjKXdAiOIHAeZPDYQ/fSy0BF9jfWdDIb6CgSwpKr
         /CYdFKNhEUqguG9qXA5JDGPXPhyNNj20ojD/CKvd7p9JFfLePdj0ODvgwCzHk1s7dPU1
         yRQGsKgySkRMWA7ddtdHSkyHqNF+aLjrFvdXQx6ZMkqGnvGUHRdmMXw8b6VH+DFyJhlR
         QOlppQsfGVehT404vQnn92JqxIb1CNC9F9qmIVkOj++BxfBeeAx88c1TWf5eG5TSi4zc
         iWag==
X-Forwarded-Encrypted: i=1; AL+hErF1xGZZrM//DRik/FeRtgE+CUfo4EEOcyKYOL0sI66xUOTbIUi8H4Iwpor/PUPzWNJbSSrNFV2bzaH/@vger.kernel.org
X-Gm-Message-State: APuU4Z+jJiCm6CN3L+Geif4DZFQTbd8zqmikYUdO++X6/297nlI1t0lQ
	DL1qjtq0CGaWwPtLcQTYjgAcsKwy4aSUq32wTPBJdbn3K22I5c3VN/pGAIkMAA5rH2CvAUlXSJw
	jXZPc+eqOMOjtXb170/1aganb/28yvXtQNfVfUBYTyRf6WyXw//41jBqtJ8X1tQpy9SRYcxzEZy
	FFcHkFybb1ohy1k/TRdJBytQCDACxtLjPAW1cNzPRYvl1/EDf3/WtoL1SBSfow78fy+Ob9/lZYW
	4JMYIv/ng4RAw==
X-Gm-Gg: AZFdTZc6C+s/M9DuwRe96mhdPmdQ8t2aAClKikydFPRxa0/Yk3lXbMmtyROAlR8K6MY
	nDp12M17EpQp/OosWH1WauxGb0NfrFo7NjEpN0GQGJ8hpk6X+kdsjUSmx+6ct3m5wWTlkuXUIYG
	J1E5iz0DzhhvdUM0YtXqThfdlppY/GaVXe9d6EpdaEo/PQMwOpJdgzmB6qSnvcVvGm4OjJgBxdq
	LKKJRKqbMK/WgCu84QMCijvyTz7HvuMB85G7GJEohY0N7+1BA79gBYPlc/+Mqlu2T1MrqxyZgWP
	KyD8XrJtjd/NUPLUNOQ2yk/iuPlG+VEcO+18iWB6eln3227Uyys72/lMUt4HlNEexF2GeuSZjyY
	m8deCntQqKlh5/2+nePiBc31YIbDY7nr+8l4IQMJje2PiE6uf2QzgQc9Pt3KW4D3KZE+m8V8gmq
	AabEt2RDhRwbqfGMqwhYjAWpUZ/n00urYmhU8=
X-Received: by 2002:a17:90a:d2c7:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b41c95da5bmr17143045a91.55.1795630865861;
        Wed, 25 Nov 2026 10:21:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm13395067a91.6.2026.11.25.10.21.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92126ecb4b8so102851656d6.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630864; x=1796235664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
        b=awJUvtQGM0c6pL5l/AJeTAnzl2OmqLpFnMz6QVrAUj3HX9VgdbzoOvyHCmyWD+QSba
         qiQCC8eml2y/NpTjpqHUido0lruzvk99oshMhf/eG6cxl29gu+to0qGUxE6cHehkR20O
         raAS0mvOL6VgCSacux5IGjBKNvi8U1tdGXvpo=
X-Forwarded-Encrypted: i=1; AL+hErFfqhbFu7lf8eg5F19mzpb+HkwKKfGcZUqywMBMgE2NqQgSFBkyQAOKkbCijSQXKRmbhbI93OvjIhkR@vger.kernel.org
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr3155416985a.58.1795630864155;
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr3155409985a.58.1795630863580;
        Wed, 25 Nov 2026 10:21:03 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
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
	Shawn Lin <shawn.lin@linux.dev>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v14 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Wed, 25 Nov 2026 13:20:50 -0500
Message-Id: <20261125182053.3915833-4-kamal.dasu@broadcom.com>
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

The DT property keep-power-in-suspend, allows us to specify whether the
platform is capable of keeping the power to the card during system suspend.
Up until now, this has been restricted to be used for SDIO cards only, but
let's add the initial support to allow this for eMMC too.

As the card is neither powered off nor sent a command that would switch off
the command queue engine when the cache flush is skipped, turn CQE off
explicitly if it is active before leaving the card powered on.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index a02b04938e1a..93bd9b44e7d9 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -38,6 +38,7 @@ enum mmc_poweroff_type {
 	MMC_POWEROFF_SHUTDOWN,
 	MMC_POWEROFF_UNDERVOLTAGE,
 	MMC_POWEROFF_UNBIND,
+	MMC_NO_POWEROFF_SUSPEND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2157,6 +2158,17 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
+		if (host->cqe_on)
+			host->cqe_ops->cqe_off(host);
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
@@ -2193,9 +2205,15 @@ static void mmc_remove(struct mmc_host *host)
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
@@ -2260,7 +2278,13 @@ static int mmc_shutdown(struct mmc_host *host)
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
 
