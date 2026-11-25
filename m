Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630873;
	b=rHC8vZtRoumu5gQYLjgSqFuHT1x4ukpxKRZGNmW0moj39EhxMwUzZ/gvKMCs0oOSVgvk
	 Y39+KIClR2809EGYLu3N3QxCF4DqQjKVgeZEl4KYZvln4ZaKxBiLPpGHuKlHgQV7W5ldL
	 wSWA/rJnhj5nnKiU0Mez/Edcs5K+1gwdhWanWFYKtkBB5jVA4zECdBO7uH5CBn2cXuVTb
	 YWW6RBMOHrEJscQdbQcUaYmAOBeLY143FyREgr1TKWX2mZsQy5DrsvY1ELuURgYUmMCKJ
	 fIr930lndMrLUNSEUUI9OpRiBWpyj/H6V00AISHddg7vYJ/eH5rTQeP7wI14NWFfs0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
	b=dBb3zz9r1dyujCTKVTWyHfowBrKORz1oI+amZnGFwvHV+clEnlnIWGbcG/WREuV7wPID
	 UATAfFZUk1PWDArnfFTkVOXDIDkndnuIrE7j8SFBjAaBDjfwh4KHFSKcxrDO3Y1DUEBOR
	 doFrM6XFCHQvx57i9aP/YFEea9nGL61YiuDsdU04oWe5imHUE/iJG2vaYiTvV3vJR5MEu
	 m5gIssv+HrtwMyrKI1SyHkArCEiVwD5BKLYpaeOkmwJAR9sMJRUUztZ1RFHdXMPLjX5Cs
	 yXaabfPk2nOiRouUKdTdTBJUrkHrcIDUBgv3B3MPqde/SQ/jwd0vdv9kdVivem5AbBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uj0GcKVj;
	arc=none smtp.remote-ip=209.85.128.227
Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3A606A685
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A3A606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uj0GcKVj
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-8b4fb5d96b3so95140847b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630871; x=1796235671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=ZcXyOkj44F4ZfMxoW4AkrspdtpiMfRfKYQV3EEoF5CDfuTCrLgWtetJLXQxz4AvMac
         aP9Macit0QcFnA3nuKkYmKLiyjpT13jE4wTAYw/qeAQgCH6J1A5WvHygCFEI4tv/XGBI
         rn8+jLScvb3Atu78/9+y8YJhfaOO3z+EJLXmQw/VFoz7ogEKP4jkZSDVZ+/d+ipQ/oMF
         f4vkTqORBSF4aWDKSVAh2TtlxxuPK8zeYNdvE7veX5aXkps8ghZ/nS3gPq4QIGk/fEwe
         jdPxG8qgAcjIRKnziJTAe79zFRcdu6+yul2Ke128LSRIW3DcnZbZbKE1JA9Foj3OC2T0
         Mi0Q==
X-Forwarded-Encrypted: i=1; AL+hErHS+h4VCh/gOdL7aeCyiX0j3psEBXQ98676uIbjBWLSZ6yQ2frABAjkkgCyASPG0VtoCYVXFFBQ9fSv@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZEY3KFZ9n6c03gw7JI+Doikzdo3puZxHy+58iMG1YqYubaejy
	jacyV5Br78VfkZaZWcW+MEG8nIdeYZGwvYQvVjKG9l3Y985znY/6HeU5K++OXkkK1ICZyfGuzOf
	GC+a+baqYarnIlRvano5WMYCLnJggCZOmaTQ7GELQuP2OQf2bf3aF/D9QbLLweUfJgerP4X/4z4
	ptZbsU5U4QYEtQKOa5Yin1eZ08lgdfyPnfQ+RKgvEenuALTrfSCCx4SGTGh71zcwr1mIg96BU+v
	/MjtNG75wzUQw==
X-Gm-Gg: AZFdTZeD9zpxTW4KWMeKI+zTdQZxfRIufeA6hVWK5kbixShTlzgcLp0kcerAlyczmwo
	UzQEx2HWQtNCY3YSDThPS9bVlmnYdh02QiobEJqIWsLHbedbr/hsLrk+SQjdmSBc0QF1HEGnwVD
	gnKPJ3EEe4P0bk0mdKpuD1FyxGoqeDSJDMk4tmjs9VcmJbRFK58UEcQauB8MXOsUBHNOMrSO2Rl
	w9VShrbmgwPwELNB+Zm/8WTbtqRgU6THjhKTHCh3WKpSDuEpg69dCudJioXHmL8TPzZMrj8xqUM
	j3HNK2YqzfRDN+V5ZpA+EMUvStuMvw9c1h2cyz+m5QKCjlzpW8yGc9sCocnAVdmDHqD/0GgguwG
	hfY/do9TGReK57hQ4YJaD1CfEA384LqPPNrO3H1Ei1QK+s/oLBHyutbn35QLyK9UEY1GKqx33CD
	8O8ZU83hB0X0uorM+9DGoUo4uYpzUi0fRn
X-Received: by 2002:a05:690c:a90:b0:8b3:4729:aa00 with SMTP id 00721157ae682-8b52048dda2mr73547627b3.18.1795630871157;
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b52034cf29sm1243097b3.50.2026.11.25.10.21.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so1051043485a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630870; x=1796235670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=Uj0GcKVj1kydRE6V9xgAcU/WoRE9v88Us8RI3YRc6Lx/Et1tD5IuUkMcAqf4ufOdmL
         OZV5nEldxLGUdU7LdlKKOC4fmv8KXXXM40KV68i2EgpQJlI0KjIPvNMy3cYBb3vnWWMM
         aitJaap3SMZm/Jvm0inIbBgEQ7HfQziCAkKnM=
X-Forwarded-Encrypted: i=1; AL+hErFZvw9NC5X2ZgmBvpBloAEN6SupBuCGodMQnylOcYCNW6EX+KRCJFJNB6qL+c2oUPCTJ6n+tZXgVi7l@vger.kernel.org
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr3447622185a.6.1795630869434;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr3447581885a.6.1795630865589;
        Wed, 25 Nov 2026 10:21:05 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
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
Subject: [PATCH v14 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Wed, 25 Nov 2026 13:20:51 -0500
Message-Id: <20261125182053.3915833-5-kamal.dasu@broadcom.com>
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
 
