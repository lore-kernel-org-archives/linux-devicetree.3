Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377449;
	b=sd09t5DPltbgCmz18+fTCnhDKf3RC0fXBu5gUib10ATPR8RgZIhapv3v6hjYzJ+0OzIc
	 1AbV3xHZoXhPgcMITluSqQ9ajEwOR2+gfeSkRr9fPMlhqLgbctNCHJ1tgkz+XZeAcWO9f
	 ENDBa29LJDs56TEtX+6/ZO4v+4je1cc15cDAOCQLESq/ExKna4k59U60qbdjYlaLqFiM/
	 NvfndITyJM95ILnBYQZ4k12CMJ5bvhrfylkORouUGJ6TBtbCdq5XBIV1SigBMCseXqz3u
	 MDCNp4h6eNLY8eJ2Fdi6TM4p5SlVJvrCLQLwNVwU5ztI7hQ7haZx7dS+ekb9YNg0LZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
	b=NyEXmuYvouRL55J+9pPfCgqRXK4XjjqFoTrzeVNGkdJhW8FMIOX4jO4P7/dYb/TomV5U
	 6d1B8WG45E2CTwdLhW/DzwPwe74dPhVR50PZZjc5hb7FRPMZfHvYwMeW7fhZ6gJlE0u0j
	 3FWAZydRNd4y6yRCzo5UhxvKhNQ2okNFdFDmTFqRu95n0CQch8V2avKD5cvTddRV+athy
	 +hsTaFq1NQ3buMdGuOAZdjMXpi6gW7FJC8PyAn1fqhKNe1HPtkRBwvPiF4Err+AcYzGt0
	 lkWBquYp5NyvZyRdnhkHNoqAK/l/kMapS5HhhmiAgPZWFGRdp6jb/LKLBEQOWCKqrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qo4coEr/";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DCE606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DCE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qo4coEr/
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b147e06befso1319664a91.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377448; x=1794982248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=qo4coEr/vEoEXydNRIWgKyfV/wRA37lgCP3ILAeuz8bydCwAWdykUU62x3znrusKed
         CXgNXiChBSnHZ1/+Z1DzPfv3wMwMCgGwskw24ec4D9Csll518g96Odl5MeT5/bzqsW1D
         bfu5llvPHoNNPoLE9VhXGQsVsKAncBCgQhWGzLUSRQYN17gEyhzmNpW+6U3a2k/Z8deq
         xBrgMJh7JEGBtHAiZNt50HajrONBsRe1g6D68iZq5JBparjR6i4LBJn/SJ9HAbuBOyzo
         0WKlJsp7nqHhpleNvthhZrFVDLdxrC5SixgCT5DlJ/Y0C1dteq4ccT/A9QTLDJQG6OhK
         Bdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377448; x=1794982248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=knYoCzXWU66KJyUF4BZznXdzI8erhglF5x26HrCRhN69IRhb1c1THNEclrUKYII9cb
         V0OdnZqmRBpHzL4c9lTMQ1GbXGR2x9wRLE14METrjD0iysjZ8FdAmbNffLejXqvd5hdA
         5ukR8uQmw2JG+UdVS9mK1uUSOjo9l+9NmKWuUEj4O5tpgxPnowEKkTQf1VJcgYa9hVCE
         81EmV3sclyPbFzjGYvItiv1zaBsigUuPybzZNjnMjX7YMzboOZ2tXxyxeLtoRSyUuifG
         yyipPt59HbCmabrrKZ9vyv1EWWO/PvDjuJA7xm9wWLAZfo8n5hXBLQ5IyejQNQObShF4
         pM9A==
X-Gm-Message-State: APuU4Z9hi/glN1fYXOcpE7JZRjUp+eMY9MPIAJGa35wjeC7cMJEwHpsr
	6IDLTv7XLtpZXkB+Ivqh0CBJDHHFwB6SvixzV4/oDijDZ56eckPUWzL5
X-Gm-Gg: AYBFou2BypS5bOaZ+ZSViQfceFEEQI1aWkFW4R55tdGvqPZ5poSWerBSfro2jTpJ92H
	hu/Xo4N9PpcSDh4aKbmom5eaP0kHlgDegwdZ2ISniUxhm33Ge2+5S5oPHXW5TMrAp5/QdOVQQ1H
	cKXnw41IJi7yIaKEb6E+oBEVBUVDwt6jJ5YGcEleyaDWiWt+u3AMnJV3Yd8tacS0u1niaMMAjzK
	j7PUgOvfSrmbnQszT9l1vVHSWzkZ0pXG2XSlFCTR5MfrRuVmDmH0KWS75FrG2wWp1mmFrBiAAkL
	Gij3Jz0GW91tSP6hG0hRQkj9hIEfgHJXd4ku8S0B80BNjP0Fp8l3vs6h6/3cYdwgvo3/KD4AzHQ
	+r9MzRwCaYU57UlriAUzcYLSDHDtbeGRMt9TaewsBSrqeavCcNENiC3xucNkk7IH6oJSTOVDzZm
	MG3ZSIWc5YnXx449wwJvrotYzt83BADfsaGvK7bxFnrGNF7/Uq53dtrihjsQRiKjiAC/+QS2ORW
	j+0Cg1pzjIy6H9xdCriVLYp+naXFs2YjCoWSi8HqjbL/N89EB9+bxGvJWm/62NamfmJon0w7PR5
	E2VlmZCUWFyeRX448HJoymCtfqvYEU98OuztVxqLaVi4Rc0pUfvLKFLOB4Fgoyd4axJ8
X-Received: by 2002:a17:90b:1f87:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3b182f0d1e4mr1310292a91.43.1794377448229;
        Tue, 10 Nov 2026 22:10:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:47 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:43 +0800
Subject: [PATCH v2 2/5] ARM: dts: aspeed: ventura2: Add ADS1015 ADC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-2-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xPQqV3YI1Vbg3zoEBrsSwuLJ278Wah93Qbu60OSxVxs=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1GDj92rCYara8OWnsCKcFq76imAFe5qamq
 9/KCtbUobSJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVo7B/0ZynYot9Je1040D/lbTGvzkWrbY4vtT8cQRJTXAHiAE6QNwPWG2ALgj+BrhuQRGEc0xVb
 6kw1vL3VB7rbF6TWstqa0zhqev/6glQe4IzGMqn5+HHEHAcVy3SrLRFt8V5YSHpu4ONibR/N3mZ
 U+n44kXd6Djn08M+YX/uIYdFa7gGUZhxd7xVVU5+qa7CxxQnqxPS4NcEvTL93/z0qgVuY0ZjCmq
 0/p93zt3zAiWvPAfAcG0XYdYqraRVFFb0f/XvEBtrRWihLAUR8Vz9tiK8tSrkKEcWx2kFO4aNHj
 LorR0ty1dA80hB0TVYarsdspFdZ7wYGtqSUpIMPimhCkZXUu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Ventura2 has a TI ADS1015 4-channel 12-bit ADC at address 0x48 on I2C
bus 10.

Describe the ADC so it is instantiated by the ti-ads1015 driver.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..21c40dd4bb84 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2405,6 +2405,13 @@ power-monitor@44 {
 		shunt-resistor-micro-ohms = <500>;
 	};
 
+	adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	gpio@64 {
 		compatible = "nxp,pca9555";
 		reg = <0x64>;

-- 
2.34.1

