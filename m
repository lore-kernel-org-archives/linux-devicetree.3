Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035188;
	b=JOuViUB33mB/bu2eH4V0iXauC3jGpuz48GJc7CsjqSKIWC7JcE4kGHAiyAA3SyCCgypZ
	 hS4zmgdMZA9Uz7YTn3HyGnLTLO5STUynrAkpRiCOhOR6CofoBWqPMERoNvdcBaYcesCBX
	 7DRHz9g/JoSMJNlgjW6yaUrxAvo/Fy+pBDB0rV0sNO2tHHrFFpyF3RhXKc3xFVPJlDOK7
	 3yRmzYr9OCBnel9ezcnDXklB/hs7eahjb2XZwh2OB1RboAWM+W+ghGg59pWwLNzFdRTBG
	 Nw3UfnB3dgZ5Kq7CyDmYqoMY4tX2Y48tZtf3T4UVgor52SJRvq2Qc0VXQwjNsqPIziA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=tV4mPNYw+RTymbNrf5IgjOcGC28+6eT63pP5dujlo+teaeMGb5zOqlFeyHXk1VnfwGhN
	 VCRWwd9HGt9cfz2QI+uGsQaZggICJ+A8KsUDwzUJLk9agSkALDGna5frkMclAVWiIYkx0
	 k6AztRWFaqH+pUOkYhPG5z83BcRLrZULWJclBVsiLv5/z2XR9EDbdo9p1cMEuj54gtZpT
	 OaoBjEcsPfVhBU2HWh9CWybEHM4VaLdYpYZ/OKCVS40tm2XqMPSCuSUkENE96rSGQN04N
	 vNq/ISIhAFIkRI2HLWQGN8m8u4gTx7lJTOx0iMfPod0fpzARQSrNcGIQtefMkb/5YvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD13606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD13606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mnuOCiw+
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5127c7abd5so25060666b.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035187; x=1795639987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=mnuOCiw+XVWApfJrSVasj2ZwbRaCZD5TnFi3wMHnkk89jysXAwnStHMDwJduYhvMWM
         Q2PvQAilIlElLPf/ESHCmtguPGq6fcjQYD80EbW5p6p0h9w58qWo0WoNsgOv87jk2XBu
         /6WscvhGjJen+7AUTwNMx5B6jyDT3P35kUvp6+OsGBq9ckOPsugUbOhRIAiTbbo1yvHz
         wNA72pMm0g/h4/82Wy7xLDShzDOW8g2rwWHflod5hXoYXdjbsupIWjr48douNVW96rIp
         +LuAqYmahyoe/zpNI7SmwNshZxmL0DXh/aB86mxWTk2jaz3aYAfN2sO2aQ9Kc/bzhEZt
         dADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035187; x=1795639987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=cybgqhO3GweQkDh3J9t6A53qrsyo4DOVInasu8wClSvmX05S2ZGzokSNWGwlfJtl21
         ChmJ8DeKz2xmT74qoFfdH9HJCUNYtu9kH3esPGoOlGZT6ezIyZ6ogEt1e4Wa/qoWrdbT
         10GDpwU08S57PA/UeLvbqIcE1d9n2Czk6xOA/XjAD73g1vHRVeWeRdAlr/e8rAJIWHbY
         T5dEshqpGHn0G+GqMAO4V+CawICTbSb2+J1/yqjlvZzrWX1T3+bSx7x0ZdVV0EFEl09y
         S7ypj5SzwB/iP8xzluKCqGokESkVUrcmjwPqc+l1v6PoM1KwpWuLM6DhSnrnl36/el5Q
         xWNg==
X-Forwarded-Encrypted: i=1; AL+hErGYT/tC5N6pzj7cp2opNrhY9d9Otq/nfnlmsvbmXLA2zvdsD6Y+lbXEre+YZ8nYESrq7QHl84EwGtM4@vger.kernel.org
X-Gm-Message-State: APuU4Z/mfmXTpJnN4RYvnew7wBBBgAc0PAZvAMYBA2giMfHijovEfoMZ
	o/AMSHQGiOELxj5Ndf4/dlsAthuL02K/7TPx0VqJWVhXKmlMf2LGrxwm
X-Gm-Gg: AYBFou1KVTute3SukeuR9dllo9qy5gm2P5Rx5ojEyj1bBx2NH3olP3aGMYVxoZKnvbZ
	Do3cRgK6/3V9EKkFf6/RGeeryHcXHQmJejEYJje8ksnhDnc5EQ+XZ5dRbLWtg2SP0xl4Mfm6Wtu
	xCsdI/hsl5JwW9anAifN59v7PPzmw1+W6ISo8m/P40Kke9kV4oO2qGN2/9qbPNGmDxlnvZlpEpF
	irA1GZAvA5Zr1EJrbUHZEHbq+ZZesU5XY+93wvlPC0sdlFM0OhJX2W4Pkfy1jTMofC7yiCDI5qH
	eC/Be3SKGcyp0lSQgcRKmgxUC4okxc847Bu2VJfbQHVjEWUoCOwszjPA0/awXD2wDS4Ryd/qxg3
	xTrkHHv672eRU9b1JwAB/0MLILYHIV96HosVaHrr9xs0Y1Eb5eGo7+fHu48vrxBIcfcDCNtEq41
	jRJ+3whgdB5p58ivp4k+mr2cT/MCRwla/CAY2abULqAm1WKCgPZae4MuHw7VqoLaVpXTijdoa+U
	Uzq9Y/uIorIg4z3oSCKlsvIhf2y902KL9/P9Dosoc8XG6YAjMRfXIhlafT2/ImtY2LYzoqRXNcH
	fjDjyS6Nvuv0iC5lv9o18jBzWgipWErvi3yBl7nxD5sdi6IXx0WEXvXbyAX8yA==
X-Received: by 2002:a17:907:6d1b:b0:c51:691:c76e with SMTP id a640c23a62f3a-c510e35c6camr355946066b.36.1795035186781;
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:06 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 2/4] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 18 Nov 2026 21:52:05 +0100
Message-ID: <20261118205213.88778-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.1

