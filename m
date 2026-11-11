Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377455;
	b=JbLo5N2bX++ZKq5O+hniPUumfK46yta2MJ6WnwDk9Q/NAUNps3lgB/tbq57m8YnwwQ4y
	 D1belo0uS/1/KTDjcruS1VRzCk0FQECAGr6BZHF0ntK5kl61tbdRblGZgBMDsyvCReyaw
	 dEVmXainQHDa2tZFWoWdbbt1Hm96zo96MX3SZGQ9+dIr3hNC+UPt/DfCJ9xe4eCW0gKog
	 HMfcwmoyFkrXPwePkEL004Bh/sOyoCBnv+jUVqkVpBI9gyTPrgPCTEsi5NV2gtpQElwNf
	 L343tU/6BWuofSzT1JRbJLDZGs+Pie9BTQ77thsX+r4LnEVzEn7cf5bE5frneKJ2cUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
	b=4QdiTeyzSe0IvCN4zlJOsC+NJWHIWx6f+oZnCEH43uD1CV+S7TXHkxj2EcHNmzVF6qa3
	 /UnsOBAm97afPpe5dtiPMy4UILV6LqQbngx/tk71H4u7qTvWehGZHEaYaSgkZYQWOMxD4
	 LJOi3OUaIsQDt1JSIeyGqqZIqfLnX4x2nM1RpWBuD0yHZPl3IfotftoIFVp4Zuw2Cvya8
	 KbV4p7WTEg6q+k1m7dt0mJ/Mup+d/GyxfsjTQOnnLKFjsvdBrKigLlArQ7SV3+Q+Q7F5f
	 N64rfpw3dXoYv2rSU+TuHcPwpM1VIBD+PT7Ckz5c1RRDmdh6Tuw1ZFYYobdpdnUosDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6e40DwZ;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0975360A2625
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0975360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6e40DwZ
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1111361a12.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377454; x=1794982254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=S6e40DwZvBCO0GbODW1XBQuJZ/WBGA3yYbGNklf+dwxcqnKhdg0NvTCzlAKhoEqFA4
         ogE+xzPC6h6ENz3xFYpdYRMqSNF6TXW8UP0l5DlKOssRfdzZvpw6Mz3kHIvEsT0OIJdg
         OByZW8qeQxjwdqcGBRwQJgm3kpKAiuuIXmzghOG+00Zjxp5YG/CUc9KsAMSHbAwQF/a8
         LCPYgi8XVEZZazWGDtzRswF7fzBRR4BatWZ7f72eI94e8SBWEAIxtZUgckGqNWzlQmUg
         BisVZQ05drgoOQewG76GRY7L9hdluqqfsJXOpeMjeVIaYVznPxEbm0JTAceJYYSRgwaI
         pQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377454; x=1794982254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=BMAtGCkZNM06RWhVshvEfXvmGGVp7aO+yny+cb1JAqERe92YkWLarObobYgTryU2pT
         GOaq8DauD0phMIGd5kYO4r8Vl1hiMilH6is76jG3HaSxSvwh8mqr7YOVrh4teUN+WnVH
         jo6a8TEjoOtEc5Bvcru4vZx3qeEcCZedaoKwxSC3NwXJSm3keLnX004fD4QGfguNkDa8
         EpROnHWNKg+3T6sSwTPtSCRlksr47SH3IsITGe+7UrPUq62/LSziHHB676gbIHYDyTCa
         oymMuiD1noETuuZSNej3+rpDagxZPYd9khDIX4hSHjMNHtUIMVxsszTXBxhwdwoVC6iT
         ewnw==
X-Gm-Message-State: APuU4Z8TrmumhbBTlMOLMES6RrL1vgE5ZVXaztm/19+hm1+glCgghn52
	Z6wlSn9+pzoh+sIpbLQDsYmm9WIEvbcVdV99kaKAM/J1EQsn2/3vKgkK
X-Gm-Gg: AYBFou2Uzj1aYqIkXlpXPMuSGs1qvV4ffjVpDF5e5aNUP52L8my+0WPmhm33wdFlfYj
	QqW6GizDaedf1QQj2qpGlFlC1WFEnnsxsflZmXnFczewgba1PHj2u8glEDmNGfzMvRbbe8YptMe
	f1edgsu+Uy7RWw4spnTU+Hu7hyI26/RkEKOxLFAatDhZp24/gdowgaEO5gshtpdKcoISwepun1I
	7MfD+4EZpsU/LIAQ8o3SsQBRwg+JMOAsjZsAQF+Qh2sW5zmj0XRVQoMouQo3qJLFocPQ1E6Q/ns
	/0tH356Bw8WLuwNYxqTTyaVSWq8sqVWL5mYBUl04zrSHz2HvNjfYcyamauytvmO/2IjXI1M7BVk
	ONbTcIlGimeo5GIngTqMOlKR6MLUhJUhyUEqAILf9awkqr3TGFNS7HVlXJfNkWZ+mInHPtIt2Ak
	Gm2YNr4VUJ512ZKcg4Oi7WYMBZTTsNZp399CJp6tUJsn9MnzqeTaMgSGqlbcIRiKyEUVqBaMkYa
	cIG/nALeoAHQEahEgzMgTRN6k6R1YhFcPiaEK8gQlz1qFSZWOcA56Ff9EHY+99lFypIhF3PaljV
	QV/nGmzfxDaYzzYJFsmAmBm+2XiRfSbL+uV2yIM8wnbwFAJFBUIu01HaiW/HKreWcSJX
X-Received: by 2002:a17:90b:5910:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b182e12787mr1641552a91.3.1794377454347;
        Tue, 10 Nov 2026 22:10:54 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:53 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:45 +0800
Subject: [PATCH v2 4/5] ARM: dts: aspeed: ventura2: Name the USB-UART
 bridge reset GPIOs
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
Message-Id: <20261111-ventura2-dts-update-v2-4-bce5b5dafc1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=uxlzFpBewTlOUpIvaHC+sQHRHy1iC/2nchos0sKDaSA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1Y75M000yKvj+EmMiYb+D2UqM+Gjo5QTY+
 aYZCRbqbnKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVrfCACO+o3U98bHLfj9ft+SUDV7IbCt3mftqCSoznSCfIaMiRMu1dIttWlQN2p/TX6BzUrsEcK
 ax4g91upkLZ/tHwX0pDAHawfcgNbviAQsmglRgvCNxhlk5ZvzQgAYqrDAzZkj/oxX4hx8yrPimE
 UJTsTTFHDLqBAVOGQ5pcPvnnW/j7NM+lOctLzK6kdFPWb7fedDRM10xaj9es9NJLMrx5LNONiD8
 TRq/DBbh4x2C5EOhPo9nfdKuvOsl1JqZo4i7J84arpRwXTVzAMGjlyQgpr6vr5mqd0RPCSd8CaL
 8xUw8eJFejqLyk0H2J2K0Hd4AtvI/XZknibcG3HHZD9vUdNz
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index c683ac19aba3..a5e6cc94b280 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1

