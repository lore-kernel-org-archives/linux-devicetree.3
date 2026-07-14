Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A013DE44D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010538; cv=none; b=Q5O6YnhqmivzMBHVkHknHhfs+8lPdpLpGU/2/E2Bh/8+DC73akSEEhrOyPwreHvkXKfnnR4DJ2gOKZDIqxcHZQe+anWELRW3ZQkm1ud7D+bwyAuqs15QiFLt5wdT3u59QZd5pgb1YC/ASElqiRu5asXWgGZ+7HaTEumuiMjmAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010538; c=relaxed/simple;
	bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7hEXKkNfaW5Uo455M386MZRThuSQLTU31PqVNUIS4EOZJcKOaXsHvjfuccUxyWmsBoSVrwOYhJdfMGBYWyNT1oli3yys4YarCHrvKiNEDd+vejkf5O3jC8KC5BUwF0tqat8jB5baC+AaPlWO02VUsHdKQNLBGxftaXQ651f2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emSFDM9p; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emSFDM9p"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so5759835ad.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010536; x=1784615336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=emSFDM9pPM9mOv8T2zOFvbnlK3mR9qBgC50qV3eM1I6UWEXghO3g/ktqQ7XGECUpJe
         +B1wWVxh0XUmSqng7sS1zDQ0m+NtEaLdaA0dElnP9MhhnNHDj7TTkZVWrQY78BoJVDDE
         Po8n/b0qwHPSDFcCWuQy3YRxAzIhmccbEYRbF273C7pNaaobzWY8HCAdY85ooajMNOcS
         Gvzay8GTDqtWtdeYMeMIn6b6WG4eXctXNg3xty3IBObS604kE+aleEFggokQyDtktePK
         WW6K9UxXp46cIVXtCo7hEhve3ptX7W4/orzsLglAWEDOXGTtOKy+Hp/9BbYQJbnDefOA
         86gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010536; x=1784615336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=rs6r3XDxx6/SIkO8LQ6i2rw2AzkRnH1UBGJh7Jhl0rajDIs7mwgc2lHpAZ8AHFJZtu
         Sb7AoDrFk5gAhAU2ZdWHoh8It176aIg7oCeSgAtJ/y/PoNgy2xgPLeZG1gfABpWXVN1L
         KTiHJOvnPku8FHsPY7cddxylf6ioF47ZJf3oOViUjAFOwyNba7hLVSOkoJcSJ+KfDUm2
         YskAHbA3EHMWvnJRiV6YUWLEhFGRLi5nkODYB557U1oCtxKtDt8tZLp4CeQQpuIgev6R
         hEmRz63cEgEYvv5Gw3ust1Pwc1NwJQ6TXcpVd8MONLg6Bcee82bE/CVyFNK6Feefn+X8
         JEdg==
X-Forwarded-Encrypted: i=1; AHgh+RpNAvw7Tq0utpf576FIyVJdmVjwDfBOOTRVNE6i6Ic5f4j0Pty7kYmAfv9FTs/GvOi4rXWppuzf8GIe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt5QI9oU+yhUN67F8lnghIto4a11JbtFBlbWPFU9cK7tc47F1K
	Zs7waTWP9SHe+bv3ZKlK3J1wvAbyTFIasSETnRA7Q0RLKcofqB8cG91TPe4mnA==
X-Gm-Gg: AfdE7ck/hNaYBVJeZslbVgouH3u5d4cI0CiTJB/73Sn5JS37SmxDD62LSDZrHKm82I8
	XDIpd5VcqskXeYI7eZcyXyJGpxxi9RxVrGp/ntj1UbGT6+qzjdFM8MnyG4cH0MibvzC6CROT/Hf
	dCg4tKcqT1AeGge/0BGoWTX/0/pJQVhPv/2INTY4h20AAwfro6YeMsWRIGeYf9QPVb5AnwgAi1D
	jsZ9/0Td7vzeuLqiCmYSKCUIppSQMJxvKWQQaIrcZLc861Auda4gnEfQco1IxxK0r22jD1g9/pg
	OO7vb5DPCdzHPTeDKO8+1riESbINvpl143QtMAwxeVuz9OtisJkwI0ampmcSXfFj5ilqzymS43L
	BxEk3sEl5sloOpAoKgbQfKyUf5XqX0t7zZn9CWRhg9egK8Eo3t9ec6Ek7PT11B0LQ2AWnWcD8ci
	BIEW4Avbi9aguqWLNZNUS1QEVnT6bQtuBIG6KZGAQQcbI2g97xSNGhB26ER9BpTLIfj+VS3ifNb
	jvC+RDfqxcbhR0+wegK2rAafBQTqGJD3R1a9fqWqxIVgVPwnkIt5XPe5fqPHs57
X-Received: by 2002:a17:903:b4f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ce9eae29c0mr123749945ad.9.1784010536065;
        Mon, 13 Jul 2026 23:28:56 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:15 +1000
Subject: [PATCH v2 08/12] arm64: dts: apple: t600x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-8-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xlFnAxDa7pW5PYsjBK9Y2uTcDjovdya+zbN+YdXn
 Jbz/36yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU38xn+e674tCBa0vCiu9z24NabgidN4qQdXebeK3Dcqcm76vHPYIbfLCw/Orv
 eiW/nTDKRPZz8Nevu9TprtdDLvDzCr6ccVnFmBAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 6dcb71a1d65a..4fb934d7e71f 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a532e5401c4e..0f81fc612a2a 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -305,3 +305,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g13d", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

