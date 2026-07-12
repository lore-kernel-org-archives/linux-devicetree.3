Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41B39B959
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849471; cv=none; b=TDAhBWVwBGxjbhd+laW2Y3t5KoQNeygre1r2n2aKYN1yy74yTOgQVISz9RMjpr+8q4c7sNUhZZNhn/V9MTupKXLfOyHZJRurLhICDvkxxarW238OgxbZ5V9m8zOZo8kTZFg2pkJeUumze3UOzTf+/QTEuUeh0IWjlePwbEOE91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849471; c=relaxed/simple;
	bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=roem8FM+Wx5PSblskIEWLNe/rQ2QEsi+5Ow7H02obbUavCZP98l6RrwHT7hPReomtLqNIl1/eQvv0JhCHHvj7cB4SkZ2T2vdavGqupRL0v9+XMQAQbWS1kv7Yi+hGPBBmZvpL8O+FtAxowuvZKJZd5F5STeT1U6o4avLv7Yn+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvwC5Jt7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvwC5Jt7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1868321a91.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849468; x=1784454268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=AvwC5Jt7qSlvUuqBXYmOBi/C1+snIoJqoyiwkJ+IiteMaetcs9tzvJL1Jeg56TJ00v
         mhzrB2srvGqlXsNDPz/jW658TstyDabqE3gPUKfyBntj0m+SJ7vbhqcR9rIGrI1HEccL
         OZ9Tp02Rsxhe640nTh/k6f7rR44Tzco/PRHe6wiKtvDQab9KyqIfY8ZYAd/qH1CPfwCk
         lsE7sAElTGsSPuz9DL3/ZkZWlpJl4PH3CwqjJshm98PNhFr4pbethjLcSCpMiRMPeQzX
         JDA1dTxYKneDi3dT0i/8VYigWjNILiPBd6/dtQ7bbZeXTlOOmQL5OG5JhL/ch2AUFyW/
         5Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849468; x=1784454268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=Z3Obi2K/y1tazhzy5WCRmO2zQHDH8ngefmwn79KHnc4LObIXl5krkpyadCPbOxhGLJ
         Sv+31GgVE7Itf6E/B6BGmm4IE5yxw/atNMu6RMnQrhuPHoPbUVJZ6W8KF1voSjZRjxc7
         IMtrQPyX7TrZSp7VyLru3xa0Blj1aLBDenaw4yZkTDKAdlXd56FpMuY1A9X+WbUcf8rb
         xF49euhD2C3/JAu/T5n9jvCQknjV8kicvdHNvH+FIk/X6oO26eqYfX+095K99bRRLP4Z
         tD+XsogLGmQWPudS+al9xXGdesxq7wPWD6vhlN1KDvDe9zFn/PxHR2WT4AWEGdGsgljy
         EpgQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi/eXEUVrJLS1Jb0IWaANDW8xolnbpFIEdLfq/OmR/V0jBxddw1c0Q3NdhaQWVz3mQ5ebGVcMDK0Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YyabOgOCWMBmDV4nO/kNF9bK1/Hti2uBdHvTStvNl+nLPJCCEay
	U+qkH+tVgzlhuEKVih5/C5Ri8ZUqd17BIR74i62fMP/jgEGgO4HG59rQ
X-Gm-Gg: AfdE7cm7awJcOvbxiFP3JqaNuumIDhOerkxAiNwKWlBUrFfokftcdZQoqQ0xgnPL02r
	klMkI6TNQoDnZ/mv0FR0OT9PcdZqcE5EkrHBwxHUZtyias63+OJFiQvKHBsQgHK1+i1ExlnUJPp
	uqYEzW2wd2RcFnusw5oorr2XV7kkpQLViQoVGHm2vrRoVl2VV23S/ct2XH/Of492d/hpspLKEge
	GxcZRYrRl11W3PVwH6q/t5OIWUiqUUtDkG1NiFh2sdAaZlrurXTEtzWUNJv/JtnnMlyqK8Ii4nL
	v898zyow05cAAHo0fkYLsqkuqUE3J4x9VZdUFR5I5cxNwOrhhSjmBp5Y+/SLaEckBfKDYt0e5V4
	OYgjY8E7l1PDi2BH3XEmFjrPoayOh1SeTgSt0FpsazaVfiq+wUpYMDWujYOdSL6xlMbCwl/vKqY
	JMvLozcEgplmgax7iMS26UeQs/PZ7oLpT5B9UAoRtMDHHsa0pGQivU8kmMQGDWxtHCKzFfnPzNc
	+0Z2PrKBHqR7gjhDuSYeShiNi4+HVIab5a9gu+c9yAo9Lvu2r8UOrdve1vgvJNhnsrkTJVT/bw=
X-Received: by 2002:a17:90b:3502:b0:387:e0db:bc32 with SMTP id 98e67ed59e1d1-38dc7bbdb04mr4779557a91.40.1783849468005;
        Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:23 +1000
Subject: [PATCH 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-4-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+mfV5bauIwu7yV8fCN4JyDc1hirrLe0jI8frDq9
 DkHv3nzOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtOY3hf8ghVrl2+a3Oe645SzQH3DNbclJpwbJ9Dx1ru5L63v3+zsTwP7jj3no
 JqSq+xUnuM+MFdL78tpmW6bok4coUgbK7nb5/mAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..301df2f006a0 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -122,6 +122,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0

