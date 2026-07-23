Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4613BF676
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784786911; cv=none; b=PkOCnenZvQpOOCDT6R4ZD339piqUt9CATB81D+lBn/wIWKG/WQYioN+PgDUdSLMp+e1y98p/nXAVgxt1NrMQqa6TwoJaumLe1XPMFOOazTCpAdgK3FVE9h4PxsfE0CTgDRrxpINFQoRYMYLJ8X1tkGfDBMtofED8KC0Ds7+N4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784786911; c=relaxed/simple;
	bh=yKkOBIWDLVzZbrFG3yiQLyXNfyi/iupP2ISmcl3yvxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N0YaNaIlNkj9rXpwgLSW3TS9dfXlNOqYuuk0BIkIXYAjk8FgyLRa9YmqtVme2gC0GjqVFKGks8j1fH8Trq+upzrnSn+vAAV9A5yv5/mtKchTg/pdC8jOKIp9AT8OblVwyphTanH2T7JEfjo4m1DhMFr0QlD/CL5Rd5UXwKzuiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIAeSBEy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIAeSBEy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cea3004256so3505985ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786909; x=1785391709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=jIAeSBEyIv6zcH+gH+U6/tv0Dc1Hy4ZmiER8FjFdQR0OxPwF2HpGxiBKG1JYKS6o29
         J+EYFg+o24vlZdt40WFCfGrW2bc8btnREe1B66GqlH0dz/iGdwS73CUTbQvMib2C9Vo3
         uo3um9rfvtjh7pBZhu4HoAvLW7KBB2+JOrM23n98BPudzbNsOCxVdUnvSjGetbZI1kBi
         bPWtMu5KNCU6gILo4brGqfIxqkUkOLTcXyv9pQrVt6BEH7gqz0NSgqxQ6xTTiYkr4Bgn
         LMy2p/XIryx2Cs7aWmmvGxZUoK13vzScNtxqF2AX4GWDfYUTVEWnQZZ0WavOQsGFll/n
         i5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786909; x=1785391709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=HrOEKSLRZcvTZPZkPFyj+KxUu88vAnZSLx+7kIRqUy8zjPSbMF6ftGTV7n4qc+9Zsi
         IYSnUYTePkfHiBocNorlJKQJX8YL7ICle6u4kvSYgOvGpTu/6Acwnf7o9YSeMKNIAtP0
         Vl/1SotGfuMtvdKw+fZfAXdA8ZCujb2C24UhrYRCOs8PuoHgeVovmIrQkbcb2mAiVcI5
         Iix1UUBLCw0WIcqzrGzQnH23o1hblZmgOWCQvqjm5Ddmg1Ot6sJyBQGU3a8ToZy0j/JE
         Mecn6WsUHv0SoY9bvKV8+2Bp2Dx1xM+BWMuYPDZOaHWR/2WVlTFuNMANly4MgoISkYcm
         0B1g==
X-Forwarded-Encrypted: i=1; AHgh+RoF1twRVJQckVQ5NYLWTrf4hhQ2etm60YDhSu0VnUEq4Jpyux8omVRF2ezntYvS62ZJLkKXvpW3L+al@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPh0n2m/q8znXOzQKu+DHyCRU3yOh5ZN9gzorTkhjP3VCzzQM
	GUFjDODFgJEJ+8zUp9hazoJlSw8EGKxo1vU5JJx/u0Gy6OQLOE+e8K09
X-Gm-Gg: AR+sD13h3GMoWcA8ZAghlmB3DPC82s2VB7M0g2E5isfW8JCiVgkiIwFxZsUAV9XBfnZ
	atEdj8GS5OTuBlb6yE95t2axgsO2RfRLlcFNVnU8DK6wMUIADHHzKqMohNMvYNWNYrZ1R0qy97K
	m5pDP5dMXrWiVKz9uZKaRVPeNHYtNcvLFDh8VEIxzb9t+28vLB9WD7/rnrQsBsQ1+c++SnLhXnc
	4RbE/bfo0QgZWADsNaLjK//mfu3M+U6FUqLnZWxLZ+EN0i6dLtiZp6IGZ9zsWzlaz5HfvPsGwXO
	wS/C1f8AHYUnmvGfWq3aMy4OJ8sVOSMccka6zD7hpr4frFNYJ9NK4GX6OcGFav9bNqskPxCORRJ
	A0oG/ZQmWONKG+sp7eeOFXX+pJC547c5wfVkjIqX4VTq94WdMlU5D6btMkzP1+Sm4LFtxzi/wMu
	QS6TQ2XR3KV/toL2pSLETKyjZnLRWiIHqEl/0TLaN8xcqBRPFA3q7j0lVkklUG
X-Received: by 2002:a17:903:2444:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cfa6c7206emr21250435ad.36.1784786909424;
        Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 3/3] arm64: dts: nuvoton: Add WDT node for MA35D1 SoC
Date: Thu, 23 Jul 2026 14:07:54 +0800
Message-Id: <20260723060755.1596858-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723060755.1596858-1-zychennvt@gmail.com>
References: <20260723060755.1596858-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Watchdog Timer (WDT) device node to ma35d1.dtsi.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..14fd17cfdc5a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -82,6 +82,13 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		wdt1: watchdog@40440000 {
+			compatible = "nuvoton,ma35d1-wdt";
+			reg = <0x0 0x40440000 0x0 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk WDT1_GATE>;
+		};
+
 		sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
-- 
2.34.1

