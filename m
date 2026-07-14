Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B23DA7C8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010512; cv=none; b=g4HZRKALEwVFXf8GvgMD65RgMdhnGEzE5sUvsmV2wnH+vH+2n7rd6Ticbfw5EhqYa82BfFq5iFCtvxFcagCoKSUa3mZ7H66yGowAV6dkyW956f2blcwav5x68NWXvHIaAsetRXdzQGUSKLrJOOWxmj8KQTY0o4fHFah+7rXiMV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010512; c=relaxed/simple;
	bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSGlZOXLsfRSHKbVEGTeX9msP5e+8Pj1EhEglfF9eGJQNF9B6EL91MYkIb8zxqWroGt5PVMhqK3Z1xMdv+v4eIcaespDR6kX+CvNNvudWXrmaXEk4fy2rqoFlvDRuXnofx8LOQcTSniz2nylsdyOfEgt0vblYsKgwMZ7svxlYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oN0wdZCs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oN0wdZCs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384c94c9414so537356a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010511; x=1784615311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=oN0wdZCsCdQpMiO461Wol9a++t4tBjTeAfaDCFGHH/m2ZaO2cm7R/qrUtipV6PfhVn
         f6lkyP3DeAGhPx3omDfcA7O86EFkSJAu4KpO9+tiYywZns8CtkYpmvYT4ntgT+2Y9Qth
         e5N1RXeNpKzs8IsMQQxWPeSS+TPv2OXk2+lGafhpvJx8rK+wEkqhS14O+QiqVC0WD/9P
         s9ZUQbVHcivx0lqcPvsfKyTzgOpP3KHkt1GxFqGwU64XMdbq7PXkL1MnDFvx4DOhuzkD
         pk3UJQv/iH3eqIQet1bIqX12CCc5gi1CJhpvdRMaT/09gdoivenYX5+jWgoCmd4o4ybz
         2Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010511; x=1784615311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=mCpCjsR5nTLSi6/v0p1QDKUMPdX4G+NC/hoawTIUtK85KjA2g/5qNz5R9NJoa9O+Kv
         xFCYutv6yTH/sAeGa2OxZziWMvjQGt50xu94mJ8KD80Srck+HinoOr7bawz1aNBQ6Uyk
         soo3BX4ikreOHe+T9+IB9R014V0PLiboh/zWN9/avYGx54FwQxvBBpO6sV77NClGlIqH
         nVVj+kGD12KsFlnvQEQTy0cT3oCCesor+tEMkme25Svsv/9Iv7VlJjmTuSgIaPf3KOeJ
         xJKTZvyhNfRJxqabtwpQi6u+giTsXnT4Q+z0a2hojYg/CYcsq4Hym8eemAuJpg7nyhxS
         qg0w==
X-Forwarded-Encrypted: i=1; AHgh+Ro99/lUOsJPJEDkWUffxGbVTUX9N5Dt28iEh2aeei5b6qDTXvQK8Ch8jF/FpNM6IfZ0apZZNrtf4kd7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80hN+pXK8jbm2uCo4mFnvQMoylObbDAesY1rJlap2BjOY9SpY
	zL7LFNxkcomIOD8pnqISPXK456XfxSUY10Y+rhcunqUg+EQch0/MCucaDDKTNw==
X-Gm-Gg: AfdE7clyEiSiPXe8tkHNa2NIirJSCwkc+CRl1NaNDPCnZMCdSB5U6gzZ57zTfiKrXyb
	RxsKXKyZmDw84U+ZvYDNGkMDaTXgGWi8bspXer34ZNzVUSZi8i/qyUzesM0y0LVS2JZSXZq8awr
	cKdjZIrL7L4EZfDPnBKqhyAV2aE7SzYTmm9TW93i2is7lexX0B6pVPAk/lR4dNfFQUU0JogcXPU
	xBcSnglCtdS1c9t24OampjaZwMCFOey3XQVxpjWZOA9CuMLZYX7R41RRnkzh+Csqd8auqzYcZvn
	0ts6n/TJGXf2CNCGqF7CBarerZkyu/i+TLjqps6bbYHDutoCDc92nw3GUpKA30q0fpWPiza/EQX
	b4LTNt5dr4rFPE4CiSGpHZWOPzVBP+pDJsUTMWEJ2mFn9ZUBQgNQPXRO2jW3/VjVwx22Wy7apjR
	j6uJ3p3cDC9JDYzzY6V4n1Pe93DoErl7/knd2bgIz68IeUpmug8AqgHvfv9SgZ7bM7iBnxkTMSe
	pFqa6VOQKmUWn3sprdtXO70nXbfkXuJlo74FFfavpG93H0TADrHk2otHIbc+biU
X-Received: by 2002:a17:90b:3844:b0:38e:2a4:cffc with SMTP id 98e67ed59e1d1-38e02a4d094mr5277080a91.25.1784010510680;
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:09 +1000
Subject: [PATCH v2 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-2-13fa78873121@gmail.com>
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
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl2bVizuPrUwqnm5vVTFz1aO2fPghT+RyF3tqxT9
 jXY+EH1aMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqHboY/ln4Tlm4uKTh/L6Hy0+I3/ldbmWm/1n550GhuILXrmsdqvIY/kq1HT3
 LK7bntejzROGrPOWv1mXFLUuV0bhwbO030d/vRXkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
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

