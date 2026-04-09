Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C137A488
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719288; cv=none; b=hmDRo6J8tcjIrAvGIEZ8tRSijaefAQlmf7GG8BulBNS+s6FDJUYeJ5NYZEzZKDZD7HAulMKZznFQgePIz6zDq2hwq2NboytQTDAxkCBQfaMZsg7ZzRzFGHH6gxwIYOZQK2/205xHUihkSekQtQd39wJxQyV6+Q8sfCiWrKCHrE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719288; c=relaxed/simple;
	bh=0eF03ygD0g7fltmtQMp8ITT42LD+7kNJV2yGpXwCzrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WS+9GxxDm3DF04rSrUthFKwc1/uOKqUQ/Z3S/jzKoB4D/8PcjKsCkh7Az0p7J4NU0yRsf7pMZPUQxIZi08SQKV5I5+Vwvnj1j7Fa84dt4PVc71y6ozWxaHNaV9T4MfZEe/ft5aXJ5IexJxNiT6f8rTvICkCyVywhMwgArELMaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBCuDOLx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBCuDOLx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so169004a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719287; x=1776324087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=NBCuDOLxXxRVtieI3YukM8lMcrobmOOYW7vY2FHR90sQrG7rbvh4s3XLy8pD4kU8nr
         +Biu0lYV3UnM55PZTtJ89Ovb+mDwjmSWli+H4oU7+iEFgnnF4aSS77p7zJv3v5cAg2JL
         xY0QDuOQ17iihZpt6dVIW+hmJ1nv7Ju+tRMUZLEWUdQ53DC0xVQAZ3gv8nY2ICUjdKI3
         LvkQVg2JlpCWfeg9uFPk1WIVkE4X/VqoXXPo5q6XEwiGaesyqbfuRdMAht5mebFQarDd
         u2fMwkZorjPDXvoKx5YWsV2QiMd5rKvqDHkzoprmEJdJ69EyRI3BtsX550t+gmbqvmJB
         VbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719287; x=1776324087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=VXHO3kX4w1LA+rlDrHY8oTafp1Wk+oqBePMjE5vv0Qe0mJw06Ucl1apYGKqllzkZac
         KfzeGTr48V9QbXN92jB1strd6hb47GoWZro4imZMSbjJ5YIiZd0G7R8ocGQwTHLPo+vL
         /VHyP9D1YsMSxmvQsmdeA9MF/IwwIKUVc7oa2ZU0pEp1tpZuKfcrMK1VwbtSSYJp1l7V
         Dsh8eyXbzifp9VigTVwIqoJGUIAcMQBUURCPGHpgHEGag7+9pMb1hyVPI6mnsK4fE25C
         CtYxLT+EAtHQPeORumyixK5EKow1wBSKTIEHsaCPg1PrVSSCwV+bk82ynMezAaa8yN/3
         o6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU4US1oMmLI0yZIya1xmFNmhXTpZBCt0NM/HeZNP8I3S0gTRmIA8Q0AS3a1Eg7DHF4kmUwZTCW/Yc2O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gt5aa/nyqatQ5iIvI6FhscvBjShkk6i3ZZ9mPdsZEuqQ55TF
	f+QNyYCQqRoh2bBF2wcn/9sz398GQ1/m773vAhJr+S5aK6E9Pm74dI1Z
X-Gm-Gg: AeBDietXaYIIutwHRdkFr2BqD2m8yI9S0oSLekOjODF0IAdJdD/HdCSOke6ipIwChmh
	abifj3yKUGXb1u+MNt49RLIJbpJP9xjhiwl+/uFzbgnBq2KPHPD/aCy0+8cQRrAO/A1iX57gexl
	vhCVK//0g3QufaXc16KaCLywatn0vkMDEQTVYnExu1OFC5RNvxRQ0oH3iK/B7XXOXCD+KswhWZf
	j6AdM6P5v6etcK8sTYmFSHtEWCNJVTT1finsGNIUYX1HaoPRS0IB0vGIU0TXgFu6Ci0BTChyFPQ
	lpae5KH/BKhS/9EKzKClN3GEXawsd7Uf1hRIIzEpixyZsamroxEuMGVYClF4O0q5u31GkAC0p33
	LTl68QWRBYMxS3soBUPHCBpvHqF8ULiXoEMHBJr74wSZZAsEepZ9/FrIcFvpbYJges4FDfE3ZWi
	ZKc7/5MFiOEmrNoKh/87PHkfBfiX2//Sj6UwzhVrGywQtPqM7hspXXuqbw7kOZl0k/RR9dsA==
X-Received: by 2002:a05:6a20:9191:b0:39f:1f92:28e with SMTP id adf61e73a8af0-39fc81d208fmr3244860637.27.1775719286684;
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 0/2] rtc: nct3018y: add support for control register initialization
Date: Thu,  9 Apr 2026 15:21:03 +0800
Message-Id: <cover.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for an optional Device Tree property
"nuvoton,ctrl-reg-val" to initialize the RTC control register (0x0A).

This provides flexibility for different platforms (especially in
server environments) to configure behaviors such as 24h mode and
write ownership without driver source modifications.

David Wang (2):
  dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
  rtc: nct3018y: add optional control register initialization

 .../devicetree/bindings/rtc/nuvoton,nct3018y.yaml        | 5 +++++
 drivers/rtc/rtc-nct3018y.c                               | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1

