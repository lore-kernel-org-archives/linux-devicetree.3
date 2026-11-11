Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426288;
	b=MfDXMSkTQEVYfzYHprFhzeO5XU944Sq2xbUrAMpxz3jj9ItJENE9DJdKqJHIeZCDMpBR
	 jXPWRrJFLxicd9pcSwxoUBKn8scnDP1UkXlwfYOFZY3tzikLxG3ryYB7IlX9EnDsjrNgt
	 r2496DVM+ksJzxhmoNHFh770OMA5qWNtAzq0xND1HBI694mgRR6NvHk9I/li1F8wBXaKo
	 UWy9t5am7Oe8PHxWhV17CdMbvy6U4MCKDFnHc1KBP6NO33i+3m2xQYX4fODqv9wHrTyF0
	 KWt74q8ZqH8Jy8ARd1bUJRXq2jwK1JaqVtNzD/fv2ixfVk3GB/B654UHwcq7MHK6F0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426288;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
	b=K40sZ2YX1tCEqV20NkfK/CU8xWDpX8zokzCr/4ll0zO13nHQ6KJRoOmA8LWDUBh7u64T
	 1Xzd82Fk9tB+8CupQHIOqITqpy4Q47LRj7KxWwHQ5Ks1X3pNaCWvloZyEL1pNnP/Uvf9G
	 T1jgCL2rHhC5bsNG42Rznk7XAuAt0ZQWPMdKh57ykHCvbCGuw8HLNOVjdNXTntzeikMJn
	 J6KXEdQmR5exAntj20iHf2hhQ+ty8bMjKDsf/zNcZYsWCkLHfwfuwcrj69utUL28u4EWF
	 TxJEnNzzrZUMQ6UqwYjJhVRbPQM+F6BBhnBn8WQVaMcdYZ6+0EhUiYzvGSuWHi/dAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UZkPfKGu;
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FA606A8B8
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292FA606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UZkPfKGu
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-554c0d47d17so28056071cf.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426287; x=1795031087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=oDrMDExALwd/AgEPm1xh2BdHlXXSE9fX+QEr1LPTZI/CncJY6HPO3MusOiFQ/LrWI2
         KTEW4n+EhZ/T5ZMcgTCKZbA0orQllaU238ez/vNmaPP9xLfV2IyYXNxZyzsokF1tRTjt
         KtNQrNrWv4jqtKNplztiYcq/ZcKsHQ412iphJ8ZNFcLPw6+AKNbGiiHdhIZGtxaA5are
         qto//Nu9JWvw5X2Qki7DFyavf5qxOZYqP7OAl7jmr+5pk+wQrq0oFpySDBtmbA6F/TGJ
         9lPODd/GEKfOuTSbrApt8V2hBI74P+sPHPeaiW1A31oiBb+jVWJBk3AcOdavZ5UC5Gpl
         /7Jg==
X-Forwarded-Encrypted: i=1; AL+hErFVGsdYFyVOOAuJMURbioCgDWd42tJxxcZrUseaEBanoAsKF3kLjFYApeCDAat4Nd1OP99jONSg5plA@vger.kernel.org
X-Gm-Message-State: APuU4Z/sYs1p5FR3l2z6dUzO5KBrC2f1W1+gYOR9pFVmgtkCJzxuDFD6
	6KE8buWhvT/kAGmLHbUCjYD/nBAm5H1UB2GUbht2Kmzb+2xwShRRxucqA/Bggg93VHyO9el5hiy
	z4y7jcZ2j/7Fb2VftOpAC86wQwIFmAbl3ThQrq+MFwJiBK68Jn/fU2pskBlB3K5pKVyx2GI8Yfh
	C4vOoV1hSGDz/WPbVkeI050pmowe+jSNsimf80y6bVNCAmvr0sszN2DPauGi71Z8qOIpu5cl2+n
	TRLXCjtpecIMw==
X-Gm-Gg: AYBFou3zuPqxXHtXqaPILciDlpPdM8TTEGJS8AvY0gqsToVS+JRd1z/Mcv9XsUzpS40
	2eSeiMJBCbOWdlFX+WL+gdW5nWlTX0cA8r0ChgfXVQkXA5M495UEBsbs3xTYFewxejhGwOz0nNR
	3JWXfdE0QJzEcD/6ryfo6jybL9Uo4gRW3nDktK9tGz5DIQ4Xzx+VO9lSF+fjIDAjMg/Tzbczjnh
	JHf5S89uV5EWoVmulbTCsekL+TcwCGuMg1/ysyos+es0prjq/6zwoRE7iqwAAVxpSNgIVRj/cKR
	u4L5dg8NyPLMIZKVGj23a27EshId8+ctZ+lBST1KyuVsCSxZwMsbbQxVVXoiICbh+Bvwg1zc8uc
	jvkpcP1eFdwjTQn47KjH/YKP33t4lhsrRtCjmyeBVXNGY71IIpNbudPHiuocNxL1f9a8bAp3u1h
	woUzAH5rHG3BqTpJJWWoAvvhDjnyycp37f
X-Received: by 2002:a05:622a:1247:b0:536:6701:213b with SMTP id d75a77b69052e-556c1b5dc0emr57708351cf.75.1794426286790;
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5550c215f56sm1074761cf.52.2026.11.11.11.44.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so6952057eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426285; x=1795031085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=UZkPfKGuAF9BGRlxMTV+L6PI1sKR61LRtXcPSu8flR/Jvm3MDS568MH4MQPTcrJgd/
         /+ekArU0IDsRPF62EW2vrx7HwOKRT8Mi+CqcwUln5AoDiJwmKfG7IUZqJUAa4HL2S83G
         AYKkyfNkhHYNIrnaIU1me0nFrqgXQfzgQSu90=
X-Forwarded-Encrypted: i=1; AL+hErGBflR6kHsPL9FY1AZV+d9mcpHtysilUFiZFctjKAntT2QtgTJ6M016pwIvzrHoCrZYvzyTKrSKGrJT@vger.kernel.org
X-Received: by 2002:a05:7300:51d3:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3768385dbcemr4144897eec.4.1794426284996;
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
X-Received: by 2002:a05:7300:51d3:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3768385dbcemr4144865eec.4.1794426284141;
        Wed, 11 Nov 2026 11:44:44 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:43 -0800 (PST)
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
Subject: [PATCH v12 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Wed, 11 Nov 2026 14:44:24 -0500
Message-Id: <20261111194426.1652644-5-kamal.dasu@broadcom.com>
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

To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
allowing the second part of it to be used as an internal function for the
core.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/core.c    | 10 ++++++++++
 drivers/mmc/core/core.h    |  1 +
 drivers/mmc/core/sdio_io.c |  7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 677e445dc48c..6cbb5ee6200c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1422,6 +1422,16 @@ int mmc_handle_undervoltage(struct mmc_host *host)
 	return host->bus_ops->handle_undervoltage(host);
 }
 
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
+{
+	if (flags & ~host->pm_caps)
+		return -EINVAL;
+
+	/* function suspend methods are serialized, hence no lock needed */
+	host->pm_flags |= flags;
+	return 0;
+}
+
 /*
  * Assign a mmc bus handler to a host. Only one bus handler may control a
  * host at any given time.
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 9be2875608ce..d3a2ff00b18f 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
 void mmc_regulator_register_undervoltage_notifier(struct mmc_host *host);
 void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *host);
 void mmc_undervoltage_workfn(struct work_struct *work);
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
 
 static inline void mmc_delay(unsigned int ms)
 {
diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
index 12716ec0e35d..99f857514b63 100644
--- a/drivers/mmc/core/sdio_io.c
+++ b/drivers/mmc/core/sdio_io.c
@@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func, mmc_pm_flag_t flags)
 
 	host = func->card->host;
 
-	if (flags & ~host->pm_caps)
-		return -EINVAL;
-
-	/* function suspend methods are serialized, hence no lock needed */
-	host->pm_flags |= flags;
-	return 0;
+	return mmc_set_host_pm_flags(host, flags);
 }
 EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
 
