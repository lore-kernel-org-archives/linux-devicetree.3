Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45882322C6D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261002; cv=none; b=ay4dRGIjgefpDdORjkia8grwiQILWoSBK9Hvcze0PpbKAUxNbfR1dB9pClhxBskhi+cPLUNOeK+4b7xjUgagS0E1eR0igoWNPs/fJyfTrzIck9xTP5jBtP3pRhUOFSroDDXAPmHRfzGcVTkkF0wkIJH8m27Qg/aNwBDAzUXVbSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261002; c=relaxed/simple;
	bh=ER0AC/Xnj+ibEkD0vpGT/fnWFxVKVDSlU3bLlFczBTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVgIXLqNOXqIwI6sJnQieohii/3NNp3/ra1yX9MheHIV6Z908aRJvIccWHyBQOz5xAy/s+x2mUyaa9aITJIHYf2NTNZnIuoG29iUqTMNp75vSWWs6Dl9CEB1T94Q8L527v/HV2k1rJQ6ziSNnKpMXhrOW/d0fdoweUK1E36wElc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AihoeGQc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AihoeGQc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba21d32776so16571325ad.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261000; x=1778865800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=AihoeGQc9YJ2rEJK9zTLH519qkSLs2xQxAjGolcqvmJDz1zBvIGuXozAPEYEwFPjBO
         uaExtNWD2jMTucPb5TXmcMdXo1L1fiJzJQG1cK9dIt2ra6jLGYZf9LfWAJm7TCo7JOJ3
         v9mwsRI83TV0SFAHx8WzWmOqnlsBKmJrYUBT6t8d+fvQ0m33AOn/N/xBbQi06Fsp8q0t
         Ef2+N8c21wC8aoXZvQWeLndgghkTg9Bb8CP8o/69FC4L7lvxZc6Nz5smCLrXCuwmz7jR
         Rs03dd5oohTf3t/2g94nRcWDGpc4kwsLUtJlDCSSMmlWNOvdKEti7j/lsS12PtTLFcPU
         a1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261000; x=1778865800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=FR3DDD0lZiTIdMXGZlzlI5duTTk0KRBoX27GiSAbVJ8klIgJ9FpXRvP3rSIuFvYnvC
         pQx3De2YyLld0i4sLqSq8gp18u9u/P9BxwdxqDDFLkBOwuVl+hjaXXfBysHZJwR+tV6k
         Y+jeB3xZE71/15D0+y2mBEk6sLCkedbtDm6sT+zHtXXNkr+QDEm2FkMisvMtRC5JDr6Z
         LQJRsRog+cMN+m2l7U5f+PiQ1BqqQx2B2+rlW1vCn92HuI5kVfuZsW2mUsn56deHgzAD
         Dafi2HUYZLs/SaEUspJ7V061Rjd/CO+5zB0kHyTSCPUATmkZAib4h/nC1I8bVYzgmXrS
         /I6A==
X-Forwarded-Encrypted: i=1; AFNElJ/TOJjL/cVYIDJnOUY6tfaaZV+cc/e7o0BOEXbjvalp0brBnKLGRcOtRh2WENeGgO1NW2M4vv7oKzpO@vger.kernel.org
X-Gm-Message-State: AOJu0YyhgkBOD7vKfq0mV1iUcbQuoNo3+nhTJyf4SAPOaR5OCBL7Qv9Y
	XOgI30qJzY013RCHG2hgnYMCI/55L81Dd3JvSkbeB5QfSND2sr6gBNf+mOdY6w==
X-Gm-Gg: Acq92OGbnHjdpYvpE5ddIcHtkHlLSJI565oxFW6EbK1X81iGvAH5DH/ZTbiXwR25/eY
	Gu3OAUvF1SFLehij1XsbzVRcErPeXiYiRafTHOJyhXdgApR76DFvdXm2aKQQtQE/XxXbJ9DzqAm
	jN1VOrjIC7W/8kOX0DfmVi9n2PMbd8ZgWLGjYwrYuTw4DWWCJAnx/z0njnQbfwfvEbiDfmHJKZt
	hnLfKDpDj1ZKbzYYf9croU0poAE8TMCK0fbprq0SzcuApMu+a/m06gN8MWu5z14Lqt94k/UuTp2
	MQWBiImXxvcwrx84IslJ/IKd2ZIMGx/O98M4iYfhgfKmX/qOzpwSFSWFMAo+jxPdjd7aOSoZjm+
	oO/+rRrOReM7Diy91m1LrI0Ms3ch/nN6EyX5rl+bFHA2GzrkjBFryFV73GJ9nJJY7nUqF4aQ3oP
	szQ58w05j7QwH2K9ifHhC/zIeBb54PizgXl9CqM5wytpkf
X-Received: by 2002:a17:903:181:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2ba79287515mr137856355ad.20.1778261000634;
        Fri, 08 May 2026 10:23:20 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2baf1e35487sm24907985ad.46.2026.05.08.10.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:23:20 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 08 May 2026 17:23:06 +0000
Subject: [PATCH v3 1/2] arm: dts: st: align node patterns with established
 convention
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-st-mmc-v3-1-81c329ed28e8@gmail.com>
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Update ST MMC DTS node patterns to match established convention.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;

-- 
2.54.0

