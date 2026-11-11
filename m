Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377452;
	b=lY9vroBhe5hWuqNtfPgZt8C8/4NROfiimaOcxN5ykppiP7K5xi3pthZKF0nAnlb8DyaJ
	 2OyBjIyfcS0AGomJIAfIihEWX36Wq/GlllUXUQNHKVQrYdeqvs90aQHPu3mpm/Anx0iXA
	 N6fAAbcSeIA6mAUA8uU3Ixn/pAphIFSA+msn7QON4yVw4qK0/ROeOvCb7EvpdSwfSnKId
	 XCIRB3BHaGX4Gc/OUSMvL6YeVusA7HaxRafM2JEMkCKKqUfR8bOz51N/zXlro93eWR+lU
	 TjA6uWYllQCTOXCUxUpkRr0b3p5Z++R2xLO9QVWzEybzWsTHGSC1EvXbvvTON9oxEPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
	b=il8+YM3ZFV4TZCm0ELPRJY+PK9KhsQP8D+HAuUZ+OfFploHMaDzjKf8l9b7oyms6KXl/
	 zWop5qiDz4eGbnTTARkjyD5Vxl8Mq5XNf0WVCgSjJzqw25OWucVOWDGFPg9mNRavGQ5EG
	 cLdn2zpikYBpaSZKh7pq0tLn/RaXBQOLPT2EwONL1Nv1njBhYyZapKavOmJWEbM5ojk9Q
	 EezTCy0ouHBTvUU6K+HRCEKPKca9/KVMAinmid5iJmMwAU8BGUOv72CjJJjXnAtfvAmBY
	 GhF1w7QYGY9w3wlZ2OsMYSzMDX/fgTZ6oaqXuVMLCnAF/32Ybhm5mwGEyI5/bGVhKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u4vCs+J;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F860A261C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407F860A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u4vCs+J
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed06b725fdso21145215ad.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377451; x=1794982251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=0u4vCs+JCzyr8wiUZvILWNHoTkZXbBfvQXbweey8CcFtdSsW4P8nSI9I8K7Cut71as
         z6vz6jSNd0M+x+kp6PoZmARLNZljGXOB7Ez0EzCQPllHfjVv7LtIfAAFP+pjgwy0WW7e
         R6L6oifOYOupThXs8qUKBZLghGoxzUdtsH2r6oXBKmV+oaofWaUNGjxytGg3x4/9y0zN
         ki4Oc4MaIBxGnuYGht3j12RLkKM30/qJ8Td7aSOp6I+l4UksqAKjMPMBGACGOTnCE655
         T4ajkca6L/AqWj+Vr+34qTTEnL07z/6t3fApMgZls4THz0advR0yccanzn2eAAD+i+qt
         ZDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377451; x=1794982251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=xP6e1mtzSeDPY2n/hsGwciorLHn/uC7gevT0zmf3qsDBPXuRFc8CyAWJoCuCt8oC/M
         V0p00bDpJsQv8ye/WYtOpHlYnw9aVcret6ZcwIYlLsDMLSdr0Htmb2bMkgrKRohOBx7t
         0Af6W1rst24gMFBoZgxEib87yUXU3m6PjWRbcXOto6JkC7DSVEueeM7IqL1byfgo4YaJ
         vE03+p1SCMm/BH5TQpPjZLNza80kXfYUJqQ4ytEglfX9kpDroc9Jb0KHNvraQfh8GWPC
         OGnXxPNwrENSPsdcDRQUkO5ErFPwHKfnGHzH0BGxZds6KRpp0JZ0OOZMk6lwsRLkRp3O
         hpag==
X-Gm-Message-State: APuU4Z/sNP3j2RXyBMcAEoCzRkXhI+C999lLPWeR0TGw+9xVs2BZN6Gr
	P7AuRcbPT0SAZ/yFSNbkUwjGDa7meKdViJmNmRfpQZdnGAIIEJccfeoz
X-Gm-Gg: AYBFou105X9858rz/a70ox6D7WDho9S4TdQ059EOCe7klghHHvUN7muUdO3wDMB8g8f
	V1PMeCibnU2ClWiLdnRIDBhBiTEW1RbImr/l23Sah4ani/x+1q9iDv7wMkQk1bhyZ1PqpGFvUe6
	EmJU7sXpnafK2ulp5/U0Y3YyubPfyTBAYIMYdWD88shNCPkRSSJBMArm6wgziE7aPTjwk1xX6Ou
	p3P700PSUGxaEeDB12QehfJG41ccwTNVoxwlYLE4VVYG6yO0o+vd1YPgoWtPfnIZqfhHTbkqg5B
	gUMDumMYHYMjJCPE32mfHHou/OxttNpC2GCZ4C4ORH8A5Ay1trYGWVBqr3wS2R4ZLpVdUeofRD/
	FdX3g4MZ4fS4st5VLfsQ2WK7Wfvs7zIAjAFuVOb+bKyuCM+JnIJWIdDPWJn/71oPGICTUg7852f
	ahbQpFEtbTzvc/P+CmumMMsWHPyGFdN2p/b3ln2kYqgrYLQotzbhTNS295em/zChAHpZXN+T06+
	I8pf3/BYtx4hEa6Z7xsflQw+veebr551APGWFK06nOT0g5dFKAmkZwYTgvMDM7HOl2gJ7OP5GlB
	sOXKkbfMUFazm9JngyhVZW/KtgT9R1R+x/aIH3JPj8YYGBfTMGznIkkn6MI+e4iUE9j6
X-Received: by 2002:a17:90b:3e85:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b182f91c63mr1169003a91.37.1794377451297;
        Tue, 10 Nov 2026 22:10:51 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:50 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:44 +0800
Subject: [PATCH v2 3/5] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
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
Message-Id: <20261111-ventura2-dts-update-v2-3-bce5b5dafc1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JUNGHAUf0IQHmc6IEwFOoWoV3n/zRCC0p3wp8n0F++I=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1293/fjBxZT8qUQ7Ck1LzVeXz+XG4VA8iq
 w/9bLeZK7aJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gd/HCAC29OQHvHu3hEGDxLtfZftWnVo9wSObeWfAYbo8H0gxB9xNgPeWCZdlnrbWJaoQW8iLJeJ
 nPbdsyxL3kL2h5sYjLFrZnPBxHUwI+LfYDHG6DgjdoKan1x0CxAWR72tkxv0/IVQBNmPl6DQajn
 KKjvIhtdPdU881ZSuBaOyTGfRpRImiTZbyqsZxsiAxhZMFWIAn/H1qOgkwVwnMWwJSBGMeW8j6E
 J1ox//pkKu2LZFkjIBRIC+LvdPkEd6r/wWDSJz7gcync1njgf3+fn/IfKkjVahhjIYguBFTnmY/
 eCea8i+6hU5+CkSU+JgM7oINoUxLzE4XfqQxXTyYAWnErhL3
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 21c40dd4bb84..c683ac19aba3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1

