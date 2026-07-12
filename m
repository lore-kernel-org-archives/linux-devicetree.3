Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD783988FB
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849483; cv=none; b=blGaXFJuKaQuBV3kaknNUPDUO92L1DINhG+DNb7VDkNiGg61e1BiN4M9Y7kK/IO+YsIjDTa5X9+0kmO89luhfZllltZwInizhQGyV1+cq9OcdQ2SPvrcHWxIz04SHgFB/sDD0m/ju2RJ9mKoQkoLep1AaW9wdfda7QWres4zW4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849483; c=relaxed/simple;
	bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaKl5a1C1SOaF6Ek7gCcoAljPfsgPbIdiUnIDRuwQQ2JlZUgTXxJiylBwiFFY17nyVaKCmfpWVWqKr7Pjfw1NmlRAL+C/TpGXhR6n2PC6Haxwz0VOhHLNRWATzkVuCg382589hfFj8nxnffr7PeXovtajVHknF5RJQ56Ell4bMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTlfFdET; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTlfFdET"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38df0038497so99877a91.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849481; x=1784454281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=iTlfFdETI0tD7JBlU06pp9TzE1mymbAdwrdbu6dcOgTAK+HNKgthFIKF00yDlkodwX
         gjyD7wDTxkHhybWJJRjJHBuzgXhIPnAj9q/ixdP5YbEnp3bijICGaiEXTkAEw4h4HMEZ
         QEl1PfHVTsDxtKmgr4JzfHeYDTXki6BEBoks1ZpxIOfOxKXhnohuL0qFsxABFRCDp+zK
         Q90gyBsBmc4qDjFEh0rqUfZQBn452fVEyFdvwZRoSYMeUKYtv+pE1EmOxZmxatCTYxl9
         1T2ZPkzodQ+7YRGoGg/U3Qklkqz04JSWj1rsQqFlFJJmS5eDQ7rlEfxYTFZcSNlgJ6bW
         xmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849481; x=1784454281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=LqeqlpQjeTDLZvBw/e+n8bQ5N8yPvAUYNn4KFIP8h4jzFfLSLMYC2VqjREWe1SlX51
         lL3bOnRQv1lH8562k/y8ThPhneQjSKhUg3dHrWm4gDJ7ZFrQo0yh9q5JlrJd2cWgPcfb
         hnAzOyC31iw4U9cZKEpFnBWZbjDrbHXpf9GpDlT845UsVVXghInwTTuxOmcHHN6v6HLO
         BSJ04nQgq6jmwexPcFqy9N06QFZBqpMI9jpyVvi0Fcr/lm4F5/gmitz8rayJRZsqybsB
         YTurmYCgH/K/EsJRUE4EgjTQdp8WVvIEIPrTFKZJFxTkCZclz937c9s1ufh/4Zwfgo0r
         cm+w==
X-Forwarded-Encrypted: i=1; AHgh+RpS4axtYhK5PLwxgziAth7EawKqIE4bwU7cBCNjyZheSPtT6nAtqfpheWeNORDyPlzzKuBUuoz/oFXC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+rxxQ3HUg3uJntqj9x4PQsHc3Ba6atUItdUds1DimQriR0ZI
	TcRbVcroIyeMTGEhpzFywrMQTani+D9gx6J/3impXngQ3b5I28XTbC8d
X-Gm-Gg: AfdE7clnwP+K/7tN+BpJ06F6qOarE3l8WpST17t4SkIDUyGPpq3lyUJTP2LYr5BQdZv
	B+nIBacvZJOiZbO2B5obQEXSbxsUw9mFu0JXEPfm8slJ/zc9FE59DwFn4WrYzdHAkuGDrAPJ5TF
	GHNsbmk1GC5icLu8/txnx1nv+9Gyi5j3jvg2uVMyiTD1+ebclE1kWTetRblkyF+wu0WyL8WPVDj
	RpwrpAMU9BUMF+R5tiSeR0akeL9jo3Kz4ZurT6kGqeJM4KpC/aB9CHOfa90PGGwc8IB/jVyrkd0
	MhOHQSVU74drFFaSBK0ekkwIq6vl0zW4bb3cjXY0xCqyfFN1yb6qIkQVNpQWoZT3I5cmvJyXwoO
	PHxME3fLbPmSYyMUqhcwwdSaxt4OvuUFY3PSvUk74ZeimYofvLf7yksdGLzfvcSjlOm+j5qC91E
	FC5VxvPBiH6rO9dREUqAtGfK/j6xmZKERfTrlxm3oF7ORRUV55p1erd1zv7TDil8G8BO9IL+1q2
	0v/hKopIEtQEUkhOa29eO65t+OoCgG3DrV1duy+pobleazUI8itpZQGpZMeumlZ7DWk/uDnNmQ=
X-Received: by 2002:a17:90b:4c49:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-38dc7746cc8mr4828993a91.16.1783849481403;
        Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:26 +1000
Subject: [PATCH 07/12] arm64: dts: apple: t8112: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-7-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU83XUyxXtrjffrOH4blFz3+dJ5itpSIbfHf774jK
 N62Ib++YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUN2YwM16bLi4su1ty1Ni9+9pLDthrMhvNd9qctL29X2lXz6ofZNYb/odfNpv9
 gnC2TskDzzcKgr5c1p+3ddSrM4g8r84KUne9vcwAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index a3241c816c26..ec248ca052cb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1289,3 +1289,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

