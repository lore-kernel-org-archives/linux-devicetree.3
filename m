Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505905;
	b=4MtOEwmt06g7hUxoxWPWh8Jm1y5sso3SdevsFU9i2viFB6DYGIUlaAmtRpYFATjoNTMB
	 fxB4WLyxlCvjo4y0FGcZDEh42vBBwS8zGaArsqohvBjCFAk4eIyf6aw0EWOBQYpFDLR9Q
	 KIn/l8R14XKFvIui7YWBXP2Ddy/7TEEAlIsZ2IQ566xnF+uRNP7Io/CyQ5vYxbPxJFwnz
	 mTKGixg9rXzxBRKiynrX1N8ezTDF99qbTCITqqfgdNxiKS6qEvAvuyxe/Yv8J40+aAwCM
	 y9vz3HstrPfhCmDFKyo8Eoiukb+9dwRipid2/ufYzknf7yqCv8rmjBuvtXjM3uhbwZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=2Z9h3FS7vjQrlOEvfJuvxj4e96KYikWhHE08OPRViFo3SCNm30/QhT/3xHqtwoqsFJeE
	 Z5U/hkUqdgxIjwOrKxoO+Khgqs2MrDTo0glnThkQ7ZDvmYnt1Junkc0KeTZR8SECOHLhN
	 VhKvSE0MUqzPO3MYVbH4VcoSC04wORfBEikTZl9lsIPM/kZV+BhNWeKtIGpWSKYHYxfai
	 s1uNtHBKsV3PAoipiG9BN7TMCFLjg5O2LbjcJ0byBIS/Rr42LYI3+PAk7JfRVTEdW281r
	 gYTHkPvsLRy6sfeyDZW1rwEwHsadIs9rrPsbTH0nTE0xGME6CaO8sEKYOJoJGFKIuJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMkdfEd;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEFE606A334
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEFE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuMkdfEd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e90071735so23620eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505904; x=1795110704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=FuMkdfEdlT1P3ev4PXKojTkMlNnor+zR4f51g4QXzaiybAr3MJuD2VEwcHXwMRzkpB
         IpPNuAoLeKgkVngpP8BEayNI11G07++miWdVFE92eJONoz33xhxqDcUv3CLM6a4rumGU
         23Bwj13+8MvpX4SA4s/gw8Arg8rxYUQIOb2PcxkpVmzEEM/I16PEmkUiD7qKtbuFt1Gc
         TkDg6PwMExUNpMY84GPEXCTyT059IZL+OSHLHm33wKWRK368ltivq7eoqGhWYm07dMsd
         1xiR/FwcP8m9+c96Hc1IGnNpAg3ieVFKT7S2zUSccoYVmYWoYHh3eG4J3BcJ44lP7dZf
         1Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505904; x=1795110704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=oDIKoBbAUihtGlI8g3kaKil8zBPxiqA+1ttHh+xuDy4S+73aZox3uOwcKKIcaAcbeW
         zrfZEB9FDxSYT+gW3JOV2VDzQmBELK9ped26EZ0+QPYWpQ0AiZhUKdfyJLrBG5j+oMz3
         ggKHSy7ynYZZfiGOx5vaK18JgW28iFhk7FoA6Js49T9Vbsmmkt0Erohe+lxHKedc7miW
         utZKMyUQi4txXuVV7XLr1jLfo6/erNdTy5JODE/kDWfOIkQd5rXajsp5cCdAYkrhGpFC
         RaJi2nIjhR49ht1TWpXk4y5bl+qZOINlUhy9MoAfevoyan31aEgFd1SGhorgsZguRI7K
         vU4Q==
X-Gm-Message-State: APuU4Z85K2lPJRNZejb9Efm61xr653dW/wKTtcVPBgdVwSmlPRCelKYd
	GUI2vpr+TydbFic3mOnea1+J18Xrsp7eLtuYNO2oC5OKiNZLiqD6nIW6
X-Gm-Gg: AYBFou3LSjVtdiig75radIMHmM7UQKJ/j0t5oSIeBm1wOEqz0xZpExkPySNOk1C3iOj
	PZB/1NxNJFdGpzP11VkS4zmPwIG1U+Y4T2uCW93JZ7HNJ36WHKk/1PlitTG5+KXAzo8qwszQ+Nn
	+R8gl83e1q4MP2jJdsbVvXZMElGZypUZ4uBUkzrYboRhjWrb83hpxP/9D2CI7mQKMUoPl8zzsVH
	t4j+VrbEB7hHdhFjHlncZlI4u8nx44BBu/z7cQ1iZ1foPtlYNa3K2YHkwD6VOjDAUapjKg8u+Ex
	Z82cJsnTgsP6GqNgSTWO+KAHFQS3kD9jQ/CZg7xpg3z7w8KeJQyH4pq3lKLhYIBeG48mOuuvaj6
	tvk2pGAb8KhwAMkXXGV0MCOP1U0JdI8zbdBcSGnrQA5vr/23xwel0HKwg2eNDoBNFieSal550q1
	xESq+4q2CWBjgOeOSuLC6j32k6NcPmal87qKVN3DNLmg7dgZ5/FqUXaY17EXhYjZaFPq6j8Tcvk
	+gS6gEBOZuHCoCHwkjIU/ARfP9iIuSauB9SWAE/kt9w7f1mwyhlZe7g2sfrqOIy7FfsT9U6odW4
	bl7bkrokYe1Qf/7nQv45d55Il3RY05n19CVCTg==
X-Received: by 2002:a05:693c:26c5:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-3768460b9dbmr8682787eec.1.1794505904425;
        Thu, 12 Nov 2026 09:51:44 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:43 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 12 Nov 2026 23:21:21 +0530
Subject: [PATCH v3 1/3] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261112-ti-l3-noc-v3-1-7281b1af8030@gmail.com>
References: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
In-Reply-To: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=73oBRMlA0aezchojrsi8CDd4YUWZTmGd3KfiThi3FVMNXut3eaeP4Vpx7Iiqnm8AEN+HkOgzQ
 z3fo53GUh2uA7OlcdF3z/Tp27siGOYFxTa3YVcqCwgICd1lne2/bdsO
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

