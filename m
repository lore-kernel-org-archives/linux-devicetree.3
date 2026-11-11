Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426285;
	b=U/k6izptzI8ZwPszppYftMmmsdxk2xQ1/ttyLZBGDkEPdaVlUunT+FePPpolBGyrLw4y
	 Fwmz94oaUczgERuUMlIxppqXq5TfYkx9HZVCbt0UgE2pcM59YTOzrFuesvzzyvICf5EHY
	 tyFPXbZ3bL+vKodBTth/U/wLUwkb0UMY4JIbD297HSRIRodzySBY9W8Lclmzb02DcwXbc
	 rOBbWWTUNv0TgoShmeIQlVwyaePuRJ7+H1Ln6HNswKlGATaxzyFD8flGNRbIugaRAmij/
	 7huaXYO4OaW7M72ulAYs8R0mqlhaaeigNldn4CCWogyNXoBzNA+WV0+PvKNDKa5R98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426285;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
	b=wAw/z8w2VPsWnBIYH6QoyRnjWMRHR6Jc3Lk1JIcV68RVm8k9J4s/wcHYr0QXjHr4bF/x
	 13MylTrhlJbgh++JMQ5Gf+NajBbUHAx+RvbxUTA2RGyh1siHSMMalCG7AzNyKVzU76WLu
	 ukHp5fPINFRhSo5ogbD9N/19qDRv8Kje92itKJTTxXwfqYekms7X3d0gXHJGYgjfJ9zEd
	 2T6VX3WCRjK0IdGx/2ZG3THcqJXxy6mYxOzIJTuYxxDO+2ziRiyLgcgOhMxOrhKJfqaRg
	 0Er71sG+WimBdjeOTSaidXu+MDBLm6i6GSAGq69y+T8luaIfViQrU6wXHbj36lb+ipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SqWRsp7M;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B0606A89B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0B0606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SqWRsp7M
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so107759a91.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426284; x=1795031084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
        b=D7zb6TuG9ozKwVu3fw0iiJbLzpbXk1dDfTACp92MBzYBCTPvw33J6vzCl8UpupVbp1
         WYVhll39IYjpVpOSSxR2Zl/MwPW8kqh6BmWODHiO1Iut/2mR2caUdU8FLdaNFBgdz9eN
         3+6cEqu60wt5bFec17w9mD90CfakA0G7CGjmh0nSbZFqofsAhUI85k+c5lJhR1OheybB
         /R3UdreQfvS++hOIbLGr2MGwSWWFVgw0/3cIpK+uj1zJwEJvnBxMCuJ4zWL6DTNMhAAQ
         dnMliyTqsVSz+689oNzXX+RGz9KaMqRSxcJqbcjDLg4WkOLZPE64K2GXrBPjWW5Ac1ls
         daqA==
X-Forwarded-Encrypted: i=1; AL+hErH4aKp1ANc5shOD0SEatSzeu8L/We50w3TOybOqGM1wL8/2mbCktueCrlxyyQCw40Lb88r/+n8En32H@vger.kernel.org
X-Gm-Message-State: APuU4Z/Os296AjHcJOYYyCcVaqw32s2wG17k9/sbBdTx1TmHRWDu0CBU
	Y7VFOYKDEuFxFmj//y+xqD8rLLmIsl2E/NpZ6lk1Q3ktID2mn0UK+aQQVfwaqX4VHkIsAymtedH
	bSIHtZp3ysSeAnOuDBkPcGBPbN5qA3FqRJaEXVoT0xyvXBOM+gAwHe4YD5BcuMYIvM1nZ2n1ctG
	bltZSc/kKUY/I2eenr2WxUlIhlzHLNrgs+LcThCF8UIS5UCpF89ltCp/SdAZl5Oa9Kmyb7r795S
	et/MsR+IUucpA==
X-Gm-Gg: AYBFou3aZdELLNZYwT4bNWwcATgWIhvyrI9NcSqJrzxLXvXgCkzhtbfS+g9cP1cUa/K
	CEjbsV+YzDBuaRJNqp1a9Y5b2Xgb9NBTGZqrBihI61GdtAEuVnkkGJHjLZQfz8VvaRB+zYnnxBJ
	8+j9SBL24EBj3u+C0tnBlO697I9ADzpF54GHxnL/i9DNqGZ+gC9OR2JvJm3RShBs/57sQtPgXJH
	2jqtCnUfVmyb+YE0H0ZvtPrSIY55OziHFkFs7VNJa6pyP4XirlwpgH5sCH+pZeVr8aW8XxbLxED
	U3xwcLOR7Ch7TH9E9X+t+gvs+9/GzCSF7nRaMlaAppo6AjsPDkXpZnflZNuPG5YLr5oDmhI3qBn
	uJMw+vTTgY9qXUgyE2R0BD/XC9s77BvDwQsj0eaq8SJPEyBrmoyRi0I60G/bZHErHY+p698bqA/
	O1gYraqT7FPancVjdzW7gSY+dS5vtZqO+v
X-Received: by 2002:a17:90b:4b09:b0:3ac:9ed8:f30e with SMTP id 98e67ed59e1d1-3b197cce653mr268283a91.35.1794426284422;
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181c01e80sm1045341a91.0.2026.11.11.11.44.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so114384eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426282; x=1795031082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfKZgcPVQuoQTMyJJaxHXbeJusNdz3UeR9BUP/GfHdU=;
        b=SqWRsp7MaMdHWnk7sLziaHk33Lv/GcBK/g7nvA9anoUqe7Bk5umaiY1KiAQjvt8u5E
         B6GHdrKED7JkWzAbpNKnounKd5PWu7BK8oLinnQv+FOpRckP0ZK9WjeSbJNKP002XmBZ
         isrZA+sXn6y4qtZjqotQUZ2kide1UuDJ7VyQc=
X-Forwarded-Encrypted: i=1; AL+hErGwNPJUG6ad2ENeiM/XAhPYvhOHiZ6arYFlWeV3nmA5K6NTWF37YMVskwzKdwkCP7iRnMAwCPORoNRc@vger.kernel.org
X-Received: by 2002:a05:7301:d183:b0:371:32df:5ee2 with SMTP id 5a478bee46e88-377e15f0744mr486477eec.16.1794426282174;
        Wed, 11 Nov 2026 11:44:42 -0800 (PST)
X-Received: by 2002:a05:7301:d183:b0:371:32df:5ee2 with SMTP id 5a478bee46e88-377e15f0744mr486429eec.16.1794426281449;
        Wed, 11 Nov 2026 11:44:41 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:40 -0800 (PST)
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
Subject: [PATCH v12 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Wed, 11 Nov 2026 14:44:23 -0500
Message-Id: <20261111194426.1652644-4-kamal.dasu@broadcom.com>
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
 
