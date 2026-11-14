Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699758;
	b=A0NRUPcTJLPkLW7gUonVEi29Ui/ua0xAynQGos0FL6M3mCzCNyzK/w3nl+t14yK9lMrC
	 xlVPCDNdeRj3RPtXAMoVx9iVRYCHH4xedtCWc2SHS0qCeyvCJKsax6E28aPqRz+nrGffp
	 3HpVx1ZxblQF/HCp16a5jJyBr/UElKHuE7SyjhLwgcK+kEgBGwfUxX6oX4lqevvX24T3k
	 h49uZMV/3C4r9bumSXo02UoYTEq3A1L5M885+ySp2atfAd57qNPTKMkc4LCEO8hrl1d+l
	 6lNcdHVhjY4oW5SxxQTdyd1ZJl1/LfGbKjcm9YwcpW/TK2SjtgV02PGpi3Asf2g7fJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
	b=imuSGESSGl9GDs9nF/uP27ZLDInI3KyyqTIOwoKWZqL+2qF2odlvywzdfoS9Gt9IR1D5
	 zlXg+S3/NKzMNraRLl4tIqcBVGX1eWO0KJR2oZT3f4qBpdFT3MDnvfIQnyghdcTSE0YTS
	 W27072ynTpa6RTSwvr41wdoU30xXmBRATV0fv2ApYmycrvJVptcctS2oBvnvX5cTbi49P
	 1rKMQn9C2UEAbn+CvgMyuYvOzp+B6D0s3EXgbDXb6zYgPu1Bgtrdi6yn+92iUiRYRc8Oo
	 EZ8TKYa/OP/FHU7LdrsTK+Fshq1ezSZBw4kmCVkdxevfq0E20Ku1a3X2eBMbePccoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41865606A8A1
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41865606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b6b22be970so737470b3a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699758; x=1795304558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=DG9s3d33XVxFHN9OdMlrQizyH32SS28Z0pjRS/Vx64SZvizFw6a98TZcj6jr/GpZyO
         8uPe/AWMPFNzKqXlD5TITgeGVM+O+sIWE3iqRgVgg0S67t6iwcRsGaqtqEcZ5FguqgA7
         Wt12nhYnQ4MbDAljt0rcO72ySodvZep5pIIbMTHWiXTGImaxQX/tj0//q76hbSqEg9Ei
         UQv+2N78i4sR4DCryexyX1Of+9VvuZak0/t2moqY7KxYLpGPUbj0v9H0PNoG8vDs6I2V
         lyS2V4pPgb3Xfi4ccuaKjDUEpY01+FNK8teUEXpRE9bntEZe1uYg6UNTJcJAr8rfzj+X
         oPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699758; x=1795304558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=Z/IpZeTlrOi2AWn2NGtKRNh6/htcitHPY02PmZIm6EXBaOCHIgGCf0GiReMNsqXlr5
         ZLiKWpECPUWH68NMdfosAfA4efH2ryX7wtTQlIC1pnS0gqAEi5GZfDB2zOLEZuAg1w72
         De3U3u6Cwhx1XfTBPUvEiidE0rx2WWZtlwhmvR6gDFNjmsnK9LZHoBT3vU53GEN+kTsS
         o9rOIdLy29uHhxrlIhslO6ktVsDEFyW6dHfoqZmTqS5/LSNBU1fvbN1MOO5ILhPYZRAX
         RS5+ab1FMD0vifwqbUDwHAp13Q6mEPvXyfUucSQ2BxRECbT0YM5iup7v/gQlKNjnK15S
         O+4Q==
X-Forwarded-Encrypted: i=1; AL+hErEHrucCOuZ6JUo2uvUYSEcNfVtkBMy5JEyUMlQPiSkRGD1gv5RKXTjUw98pu1Pn8o74aF0Ion+e75/v@vger.kernel.org
X-Gm-Message-State: APuU4Z9sQQ1JO+LI6kS5Jgg7WvZyrBZI7Zb9lxIKMJNQsj4VzYze37Rn
	QPUIwgsMDznbJyZNDJY4JjnyJKfuVU9iqsK2O3XWPb9bg32VaBBsEEaN
X-Gm-Gg: AYBFou3+GQd7t8Giyot68SHdka/z/CzIWR4nQqpxtYS3+2sRFSGtOYz/R7MZQ3h5fuO
	1x2OyhCberDPN14Ax8XnhInJx676U2z7QmDNe4UwBvZYrwFuQIHIYV4VgBMVL1trADYSrf9ICOk
	LrRiwj/G1mqMuzK/XwoeCpGDBukn4uxHjkHlpplhKBS1itXKibFDHBj6ubpHwJSCV0Upyi9R+Uh
	IUNykFw2x+w3v5TBJSxFpkvyr1+VRYRHSTd1m8TXglfxvWjpMGANNoNXqH1FYnZdwaUbQ+XUqDw
	fon9mcCC478Kz1s8Me0nb4fIUcXzsnjEpoIrrAH0CNy6J/aahteBir3DVHNE+re5bIJbAslsHKp
	aP5nHvQAlP7OhUxQygHlqLpRGD0lqgJTzVNbnTgVxm0IuETNmhaixJg3/Ea59ycVBt2FlRywbOB
	nuJHFNn5W2xhbUbPZgJVXgOknbpZ8EhCT0zYKp+u37hYPizwZHywYd+VinUySKKGBwPlbwuinmP
	acSQeE4QKltDmXVbStBAuzwf1tZS0J3RwjLy26mPCF2geuvuq/QAchuatbJO+qHO4H0tEPC4nc0
	6QPKfAnmG0fxvXV0GcbQJlWUO+OGuGjTIe81gIc4vIE1mW3ngmSGDZHGkK2yTEKKKj15WOG4IMh
	in89H8i7Emx59uO76rnZCi5jUZy1Hci4JVPaej9RzVNrLvH303FoUgyid1A5PDrztejWoTVGDte
	CwFg==
X-Received: by 2002:a17:90b:39ab:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3b1b0a1eec0mr6608862a91.22.1794699757612;
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:18 -0800
Message-ID: <20261114234222.88337-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.1

