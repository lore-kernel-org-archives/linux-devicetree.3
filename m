Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3743DA7ED
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010508; cv=none; b=GudXj3ZcoV+ZEwuA2VX5mZXGNRNx4JVy8KNLD0Ovtv5SXeiSpDAKrwqsZXr0uUHdMhEbWKla7MmoKYiuQ1YuPVgtXB/bke3SWQUJJNP0sNW67lbNWoUhfjoGkNS5oMlSP/gYk6AfY1ipglleQbRqZfdXEV/Us32SjwQc4PRWYcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010508; c=relaxed/simple;
	bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tK/5xtLcmF2FKwoOjTUA8X/gQUfzZaOhQvEUwFuCWeZpXgfnVg2O7oEQ/RYWvROc1l0N/OKLDjYqY98vsGP4uIbNwkf57xKPo4imi5sj4idVLhkL9iUzm0Kp2KAqRQg30LtXa8onb9Y9wHcukHnfCBHNf8HrNZa8s6ZaO/qT6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjsqNOmA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjsqNOmA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so63648145ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010506; x=1784615306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=YjsqNOmARLaKiPPFZBvw9fRqYAMzdaNqRrxBYTDqdT+R28/7u8zrsBtntPMjN/JX8d
         l9pYcFK64l9b808o2kj7yGBI+lvsGUiP/R0rEmuIFDD4+HulDGGbwQflux8QnWVmqYb5
         YIcOeo0n1AQbkhvI/2L17M/UJlYdWb9QL2J1hobIUH11x1SVVX0WuI02cVJ45oTL/SaT
         5LHH5CBn26TFVArFHUZK3QFF4XHr2nMGGIJu6tGzwDONRaHXxyYKf0ousqAIGOmjGnR2
         UbQi1saTkf6Enhdk4FVyBxcVRBRTn+BdXpyf/VcrQmJmnmQnKz4bMpEcNz0rqvU/tWGM
         1h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010506; x=1784615306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=RwiwgVilVX2SdrCj7IkLYKBwHYMTaWfgz06lIkCMBh920JnlHQXRh+4hHDMRQ7rLwb
         /3DE4ZllpmBwke/8JO7Q9o9v+nt+r8IK5qklH3ixQvrfZ5TBKRQ6J/7p03QktBLR3PYQ
         9nYirNSk25JBeYLyM2lZR+W7Xh0jbnGjKwMdvBqEQkWOkbvqZYqIiyZAoEBZGYBZoaHh
         mUW+9y9RBaIkDy1haQCimS8I5MW0xx/AISbylMaeatBezg7Y3V3/AEtFyU/Y+gAWtbyJ
         KGRdVsS+W5FsHOXurNuwMl/s0GPwXKgvU1hDCxfECSbF/dM0371spw5Rlqh3VKRbpr09
         ZArQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI3Ept/ZNLxcJslygi7S3tgTiBmTYKSH3EYnArz+Un6AAVJod9IlY8DvGBMT0rm1IVQlkbBHUtGNso@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7hdDZtXzDNURxI0+DFoBHKQyL4iQIezIOpa2PeGeVanF6idjq
	lH2zNpFzqS2k55k0gxCLdnj/ERWjE7T6qSuhyjS9sEHnQ0ECogwKEkssh7PpKQ==
X-Gm-Gg: AfdE7cnibsJ62gpTjwOp4ZRCYXD6h1wD2Y2NP21vgaFxLLLQtJyGvuCZfGWjIfW6fZn
	tstZxpRaEt510Xtl3nVyHsmdoX8Thu3sjqIb4rJubPzNWwXRnec/fEzzvOFPKU/TKCSUSYmGwQ8
	KXJKveCVub/SJsUcq7hYvOwUpS31liYOV53swB32ZlV8SgxS4VJFmlYRBWkNug7t8XsnRksexlo
	U1oLcgd5rFCEvlkpNLQmKy7e052QGWwPBem+gAPRlRs0UQoc2loxYLUjVUXG2Z08xhRVDGIpvcU
	QIfQSmS2A9PdcwdWlMeG4xt4rbhAZ8tMcOZdUe+SkwjWxvK4e9haIat1D0aY5HsjPtfaEIbekvJ
	qtMXrxh0uX3xOTAaEQ1KiaGr54ITbI10SthXa3jS7GtozTVezMLDJYe6i5dlaQbxY4UN45b/54B
	D01AZQmKeNSsyJoL5eMrzZgAQ2KqXaU2ZQy9QFjZdwTLdoKAvwrLwAhZwd4VPOPX5y+9pIcwAc6
	DvjfO8tKW63jXwGnWQ/SreGqS/Ecjybwi+IE9LFlkhgslfriCVrVqsed4ul2I7g
X-Received: by 2002:a17:903:19c8:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cef143a620mr16315085ad.25.1784010506454;
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:08 +1000
Subject: [PATCH v2 01/12] arm64: dts: apple: t8112: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-1-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkutbk/FTnXe+Tgng1itbe3P5t1Y8/BwC8b2qqtD
 vAvaw7a2jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqXglGhuMhX8uW+zLN2dF8VGnDs9yCx9/LjRXXaFydLneQe9KqS+qMDJeXTRT
 9o5fgYH68pe24scHiyhvcxYdzd249UzrfjaNcnxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 85c47422d4e8..a3241c816c26 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -921,6 +921,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0

