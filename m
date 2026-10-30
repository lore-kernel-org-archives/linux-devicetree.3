Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383893;
	b=ePwurLXWSoDDyC7CONWPvdp3wpzUH9xApxWGaOWMKcvukjSGBfmrhfLXxXFLwNj9qXDj
	 vb/u30myjMmD0/3F0vyuOUoexWMoI3rECehzsRyyZwY+auxbnpYwY4mJE9BUsCF/GhER2
	 byamdu+s1eA4TbGPpvazxsaZ8TagmmMWWxqagxCVx7DKAxR8j/gxYL17EDmJJ99Kf+DGf
	 EVUpWaTF5Cet7kOQu8BGlhUExtQ0Fj5NB+9Yvg9l0oh4l2XbJhMKQHznl8wKSDGIKNsl5
	 tm2jqz7xNQBGg/cVHtBJl4Vi9FypuSw36KEkSPxIgmNKpJnwBrTO7Jxj6k51ZqVlF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383893;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
	b=fTaPAqLcbaaGlGYMjOZPxk0mUa0bHnRa7luIygcaKRyGIGkwbT/6rVE4q5VsE0E8aMw9
	 FxONW+IP8vVCNRIxL1+Ulo9W1M39sLEMMvwjqGicEPQ8mC3r3rP9C4B2nS2SrrWqY0vsQ
	 Uybk1g3O3/QUZjuC0Y9F/AmDZabS6cYuVu9NZ4/0FqoD4taGiN+8GZCDltsng0WoV3lvy
	 Tbiz+Zz+aopsg1EdBydFWzGX1H+WBu7Xf3bMtEb2QHlsKaku2vEED0HwnMyCrqmH0pT+b
	 jBP7VSaXa4ccQOGW9AdrtncDPW9O+oGafdiqn3qWGmyLWWR9xiElYoqZVrivfhBbC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f1xbbqKr;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2ED606A32D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f1xbbqKr
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso836925a91.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383880; x=1793988680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
        b=tJ5ABvao6kSJnV781yHXymqYZp3JzvZ5BRVovOm9moMepdGOUb6MCynp/aagWL3ZYz
         LtNZXMdRxYg1qlpXuRBrfh7oyB8s8a57qxg+VS0Ya7+scgDe9Mo3FMvOpviXQGvw81E6
         A0zEjLNA6J+j4DOfFCtORSLuQJdLeLnM6aqjFMq9QROkUmO+p7qVTidajVKg5kiSKlGv
         adf4ZvlYwyaUT890QhSXTog/3WhS4+oCRzy4NoW+GMNUx3wie/cQEHZ00fAC6Fz0P4YN
         TY8p65dkfbjNyzs7PTNt9FbYFaFxqnaHsiJ1HZSU0keO8jmFtQj+UqAvkaubKbAUYGpe
         +vIA==
X-Forwarded-Encrypted: i=1; AKwUvBy1LOv1RohFIWMOzhC+JwPAM+DjPZhkrlKfK/HSNSAntilT6uFVYuHWBJoYvwE3f0Q/n4er75VSY/4r@vger.kernel.org
X-Gm-Message-State: AFq9FYL5aaOj005tqK/GsjJEhSLrkW9nX5TQE0jCWaCFBd3ap5hiTHIZ
	+SIqL+wrAXU15ja7EfryYLcho+PKEwwNc2KsnSxhX4fKvJm1DgTUwV/lngI1qlMkWlE9u+dM/7H
	8PI1OMUbXHnBOXJHxbaEh4jvB3Wrs+DP+5oyltJxXeffoRWTNecXbvh8UlUEQ4VLpvTmexLUyhz
	31baS8jKrvmZpQAJmR0f/vCfvSpN3pbKW46rehGFHU5VHwGd0JW4jXfvpPANFkUGyom0/WRTDMo
	wDuvrVS/at+PA==
X-Gm-Gg: AYBFou1Ak4CxjO6YaYid81cM7Z9XeB2rgDDuwU98QuBEY121tiqXfKNYGvLYOAp6sEk
	+ncu0YEkVYkm//0y0c9zHCVWbES+SHSq1jS4mUDMYThITVbdUTsN+lukBU2QH5NKTpv4Zc1IktP
	+PFvq2L2a5pIGvFFfKZSQe3FDxmg3ga6UjUWuBh30NyQodk1pWHBOEUwLLrBuVKHn3L0nCGlKcm
	wc4faQRFcfeya6pw/r84goulp34GhDoKYdUC6rX8ulgfasMDjWTKzUtz/bApk43Gjpm1/tnkOr2
	qvq8dvGMn2zVx0MgKC5RT006B4PMaz4Rs67HekrdlPwCSOZcqjpP7YEuTa8Cmm4g0iquM38Zz80
	Gb7uKv1JtIWjFAo5pHmjsSXM5/9oyDrPNmZCF7mxISzKbA/k3eSe5aujxvl9D5doDnHNxaSOm2P
	bI+FVd2Cw3fMXzrjo9auranp45ix8Toy50
X-Received: by 2002:a17:90b:5286:b0:3aa:6b5d:a02e with SMTP id 98e67ed59e1d1-3ae89853ad2mr2596518a91.54.1793383879610;
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85d695e3sm1003711a91.0.2026.10.30.11.11.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1ac19c6bc71so952170c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383878; x=1793988678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fmQH2G4+P7KftvrZHK9RuK3II+Le+LmlAkO9aH36u8=;
        b=f1xbbqKrzozmHU/o50WWafFcelqr71majZcEtQY8OBGXLUIQLd/wNgDZlB9xZ1ump9
         NLzQQhGkg58b809MQ5EkxYv6AwxiXF4QY44LL5zm02t+lgB15yQbzjmSATDHTgUKSotJ
         MWQq134951FSrzbh9ij4abDoenkhn+MmM15Xk=
X-Forwarded-Encrypted: i=1; AKwUvBw+Mgw6yNRii+M8EB4V4L0Rg24bUSyuC6iRmCS6ciox1D+TpPP3QvTuZhErJ0UtMB5MLsEmlBbH0Y+w@vger.kernel.org
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr3766299c88.47.1793383876111;
        Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr3766262c88.47.1793383875256;
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:14 -0700 (PDT)
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
Subject: [PATCH v11 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Fri, 30 Oct 2026 14:10:31 -0400
Message-Id: <20261030181034.3811225-5-kamal.dasu@broadcom.com>
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

To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
allowing the second part of it to be used as an internal function for the
core.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
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
 
-- 
2.34.1

