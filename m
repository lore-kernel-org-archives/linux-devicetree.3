Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A44C6517
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767153; cv=none; b=NITeClvibyXsYuPrWkdnPS8BSi241iUXQ1Y/Ooys2BhqkLNBLZqFgxrUee4B3VK/UUIobr3PfGJAvrMysHsDt+dwySwqgjCITkA6Saelayz70PsO7Wy6JFsQe4HOycl23Zzw5J6CNB39cWy7r2P017J9LjxEL5Ff6jqD5ibcR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767153; c=relaxed/simple;
	bh=b8orlYB+Eqxk223Z48vvATiAePqnM1YqQUV8EDg5+qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNw40Vpuyx9mQVcPCvZBAQwxL1JVD2Kbbv8bXFGkDuCymMMscwL87DB6REM3l2ALRPSLuBJ+wSrtckWke3u08V9Cx7i3tnE2qlzK/sDtqanNO9MCQ7QGw485CSECXxF6D9nfOfmWKr48uSd8rOx0a0S2S7dlSYm2D5msU2Rg2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4C8nLCM; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4C8nLCM"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4038764b3a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767151; x=1791371951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=E4C8nLCMIOrqntMaXDIBTUH7NCy3Cv6Ui4TXNZDN1qi0zGQjw4+4w1h+bCY28rU10k
         XrOFmnild13OOWP4e9/YVt3XpymOBDFUK6hNj/NC5v57Kers4aJ8ATATosRq6N9uYWIR
         E2e3CNYL3bD9l5LKijxJnkzwlGFQio9nSo1mqeY96n1zbF+8JDQHZOHZKGa4uP+AWb58
         H7wRTB5Qz3d7K9OeCuAr5QLZOUGQBIbwywHV1oratcRzG8iFCQQdzhgKcniseO/oMRyc
         S0PYQnz2pFHr97d99rNx1+Y0xk1nfA70eaeOeC87d05SiUiOt72WOtuuocVraggo905u
         I3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767151; x=1791371951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=kBEk8Elr4O4NaNo6sxNuE+t8mKVjrtQQmrMwF/DtzV6fiF+Rfcd4jgV+cBk/Zjqa8i
         w/gaRBPyqh+qmCv0ma4ce/SbEni9CedvvrcRpBiyVMVyo12yL7PvGg34ozse0fpeZB6v
         WQHOUOnSdMDhPRNsBgefe+tCfTeNN6wlUKeH0JD1FdQ4NxDQm4ThU2QmPrxdZqMIcrNO
         SsSiwRO7W+4MPnvLzhlRRSPgxpxt9AsiNWFANUjwSW6K5/nihVgnBO5M4AJsd+BijhFs
         8n8N9ntxT5QIOJwSz73XGPSx4cYOX3xVsH9PiU3gH1xIwQD8H95xTDOQYT3UQOWegWIg
         RkoA==
X-Gm-Message-State: AFuF++nqxOhOX7VABY+zA2j1j5ZDzluRh90IRYDhuHmWwHJC/kYhm7AK
	ybcq/cArTaws1OgtFWs+otzJp0GsGgvd4W6DYx7Z0EY+1AkBXPRbguTB
X-Gm-Gg: AYBFou1tiEtE9rOBhviXxNwNMPikTsAwEXmEdwuCoD5hdeU6JVOwJ628c15ElRGzZQV
	TfN6Jn1qYFpiCmSbXWRNzbY6zl1HP6mVJ3nscWHPimTq2GJIxCQdZ1JIP0GTTm84y04W/XZY+Ub
	IBP3JAZRY9oB68cb/HjbkXt6yKZ8iAszCY/XWdPGosbg2lhzxO2nYBSmwT9HaYtRkGN3IqI5SIu
	Pn81b54WHYnNchqAomY4HQb+whPIS5+mXBqIRA4ZXLNu1nNUVAcnENbU3ESWat60XsShUSOdSFG
	CzebrDcXV2y8nbjh8FYoPRSfR+3LW+ish5NgFvLM9hByYKOnRMSGEe1De6vwDaZ19hida5M1qdL
	P2FMjM9YdLptiJQJVY5rogtFkTLUTR+zsgEcuDrnQN0N+qCz/nYMFlCfKJPSfCFl8hLVnGAGepM
	F7hGbQpoXii2Fte4/wA/tSTRqMm0MExaJcOt5pH+5Gpy/wsVs25bYJnxWfXlvinzCt8fRCFu24a
	jktnwoSgXKx/ogCG6kVyaHk0Z2sBJQ0G0RlpQ1FvK9K
X-Received: by 2002:a05:6a00:124c:b0:874:706d:8572 with SMTP id d2e1a72fcca58-8874d979000mr800957b3a.35.1790767150679;
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 4/4] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Wed, 30 Sep 2026 19:18:13 +0800
Message-ID: <20260930111813.52396-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 1883bfb850fb..76b7117344de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1269,6 +1269,11 @@ eeprom@56 {
 		compatible = "atmel,24c64";
 		reg = <0x56>;
 	};
+
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0

