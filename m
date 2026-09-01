Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C184469859
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 21:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298961; cv=none; b=EhQfGSce67zvNBNRpkHq4WVk+zLALeffqD7eKPvDYqChPEnHEnYcanY3LyAyPa4xp7S7P03kv2UATZP+d6fF5PqqrA33bXgg5MYvsTPN7lg96OvUlBMvyLYOx1NTVbY00q9L3uXd+x6HkyHbklcwLRLl6VoFH8UPjpCD6de+CEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298961; c=relaxed/simple;
	bh=SsUQNTNv6kHN9VELJ592cUs8KSzWhnVlCcfgO3cKqSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTwm21KIC5crIEuGxkTuXx4CyvTvbQuKoUdHdlh2dAGhF2acJB09Bq9bwd/Jjy8z+vWmrhD2Ue5tqqSovA3eNIkiuqAYJrpNJeA1y3kH7SUixh6/1KcQIXRkJClaWJxUEFrOEjhKeO7aV2zWCDEwhekWv5aLUznEgnx/3ubP+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjOgPHSA; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjOgPHSA"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b0496f4bbcso247342eaf.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298957; x=1788903757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m99J5Fi/T1zvsWEGoRtP+MygE1A2m2xBlRSpWOmMB6k=;
        b=QjOgPHSAtD0gdtxOt8CTOEoGunby68CWn935jT727UDFh5lGnilBC6Xr6UQxPlR/tJ
         w/xPSiUzRpFziXhWc2YqTqBxTN/2SgOXNduCPfc1153zZyW67i/iE85wQeQAWtpy4HJ6
         NFfPAB3SlnrUgbbYJ1qFOmQ+BDfYwz6drJnEkALPBWgylfucGA7qPk5QJ/VEv1APLZda
         JtKIzfb6eYYvqChLViHiXoCCWu8zEpxRDc1pGGggOXJTA6ikB5od6vKMF8Lk16TeDz4i
         CYE+aSB8KZH41qoxtTywAxVL5JANwmgqq155e53o3whrhsvHipV6JJnytja5oVzFZpaY
         bkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298957; x=1788903757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m99J5Fi/T1zvsWEGoRtP+MygE1A2m2xBlRSpWOmMB6k=;
        b=VZVuWvqkGMwBOLLpJbstHpFUkf+RdWKde8P/7BPRH4X+fxaCORGplN/V1tuUZlsdav
         GPzWJuxE+x42SG6V0YspmLAZDinMsyjGOhRos387oqTowJNT3uAxQRUoDKwdvI1THej/
         mSw2ztwwqKemb/x5+asxxG2q8Ag+kvzgLXkomTdIP9s1eHy0Cf/k/zMYOV++FJygGycQ
         fgB/5XVJIUzwuplN4z5lEGcR7hGye6Ef7XbR8B6hTOi536QSj0ESkIuTU6lSEmBRMI+2
         x2JOSv/Liie5hoY7tay+YFiOml5LKL09m0Eh4GboMJYbOkcwbSJuhnAct5Q3iaZ3ASgQ
         eRsg==
X-Forwarded-Encrypted: i=1; AHgh+RqqyrxZnF9NFibjmHjusWaV8Jw9nM/v7KLYwCfQbrli7qJZunl0sZ74yqtIW9Vvzyjk8S3umFg87Wal@vger.kernel.org
X-Gm-Message-State: AFuF++nq/Pttp38yVu0u/fdffJCzfb9NmRxyYnM8KG4GQaLeNJMD4aKz
	WnY+1tXnzsS5AGU9/H4r7aaJmRXSWJ6pdFTYW3MP4cIMB/JgUd49sA7v
X-Gm-Gg: AR+sD13dQ4hTteF5U65y3xqPtBK8PCa4YEk+7nn/ASWSdjL/1KommJFvhZ3AfS0uNQC
	bM0JCEioa1Aho2F5ZpEdAdVdz06SGXZaxz/F4eJSI48BpJyembNvnUL8tOCfCZDLivqoauelX2s
	QaEAmAB3KQuV7YOKI+8QINFq4QOpYoX+w1O24F738vOPGwzjrvblE95InV2cherlkgWcdewfo9C
	aIIumDGP8mEvQrZKBH9m09bLvb5yOWhI5JET1KV98zaEn4Wki8owYJ8gmpJZ5DYu+KB5Q0+/+yA
	eDotmBjKmNuLSeYbyvmCn+ZoS8/F55dZhgHico44rRxW+WI7JTjFSKLEO16OwjGyRspsheIVufc
	1G91kv5gAzWrQqmfS9var5deezyBsujQg7FB93pnWmBDVj2kc63v9onfiOhBFu2sZIsRhXO+PUn
	Un3hFiVrkHYq1nTn7KbRQQZh2dXPbC+13hWZT3JPduGPjvjDtCnw3MAokoGs205Xi5/ELYVDCDb
	wp7w3Oh6lDHzjiAw28GGcQbXeIJXuxrIk2jTHPT2hzKy5+PIVWM78+YcpribB9dI7sKSDbmuGAS
	cFGIqNlsLdEeonXygoBBwJb4ofP9LcnFn1W9kc4u0/bKxA==
X-Received: by 2002:a4a:d749:0:b0:6ae:6484:5f40 with SMTP id 006d021491bc7-6b1c673d01emr27846776eaf.21.1788298956904;
        Tue, 01 Sep 2026 14:42:36 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:36 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 01 Sep 2026 16:42:23 -0500
Subject: [PATCH 3/3] arm: dts: ti: Enable overlays for BeagleBone Black
 RevD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-3-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

Allow overlays to be applied to am335x BeagleBone Black RevD.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 55cab3e8a05c..62de820c9b2a 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -190,6 +190,7 @@ dtb-$(CONFIG_SOC_TI81XX) += \
 # Enable support for device-tree overlays
 DTC_FLAGS_am335x-bone += -@
 DTC_FLAGS_am335x-boneblack += -@
+DTC_FLAGS_am335x-boneblack-revd += -@
 DTC_FLAGS_am335x-boneblack-wireless += -@
 DTC_FLAGS_am335x-bonegreen += -@
 DTC_FLAGS_am335x-bonegreen-wireless += -@

-- 
2.55.0

