Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733821;
	b=UHSMTnKuL2a7mugB/uNzhL+tiXJf0J2618yNZ6wflKa/cqmlZvu0IF/0PYQJ1H992Gh+
	 wiYoUMj1yga3Wkk9s2Wf9/uPPCQK0T7W6eITc3PhOBE7IK4xmuF7fKaF1W/4wP65MZ1zZ
	 Fgohb7iX9b4gbzu671Oc/x5fcujwTZub1ccRwkz0RcclW5mF/v42Cu0PLmB0E72PKM+DW
	 n5wadbKLxt2amBCFc/owy2iBmQOJDQoR9uKIohhaxQk4Ynmqert/VHwYAS3Q8qB67SqyB
	 fqQDRiUHaaHFKfTdFxVybzR1LekWDq1ICyBGOBMdXQSP9rMQT498RKQ9rwrm05uzATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
	b=hoKHUGT/UntRENUqfyE8W5OXeJtqaU109wv/YeqN95lQANjyRFpbEwF2k0gqibflyIWf
	 WRCJdE4nOM6WXJNkMbLmVXPugY6M6+soAKaNeW2tLnRWiGJDmbYcOUsHJraKMntaWWgiJ
	 9Sw4mrJkRAG4wswwz6ZtNOIY+vbSN1N1moMbdDFgVrcX2MVU+m8VnimzBl95vE2Rcy92o
	 18AFOYGfv/BsEn6PG61GB2MI3jVRTO/bKG+kPdLYcYkSpDPrfl4kuGoNCiyJiWVj2FXty
	 OqmS7hB9ggvgH/7EIOg8CZVNqO+wwyUPhUL1zWIf0+TGtrWxQX3Q9tUNZHz5TieySMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuVY1uYK;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74226606D802
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74226606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuVY1uYK
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845f3fa7f38so1974843a34.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733820; x=1794338620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=UuVY1uYKWCAEpdR5KDEqV2VJYoWh2HxSRrJvYXyC998J4n5Ckcrdy6MYHXQLlsrDOl
         AobIfLO3alLOa8vSZ53ykyQy9F++ayFlu/YIark/bPOiW9ElPy+Zy4WCqaqq+QBZzmar
         ij/PCSHMUB3YYFymnImP4RN55EWxPiKFtHw4WyNZ0QKlxNUoaJ97v5g3vOQ2FllUd2yE
         tJOM8AqL4LGEvwq6an/8fymCFTD+jktLe0yvBPtIMcnWsj6NpehQlnrv34QJUlG0/a8n
         yxnTzJeynPGYOy3IJH30XR5Y+TZXY+1Rjfr4LcR+I5rZmx8Ec+3Qk95o2BVP9Yj1UHXU
         xk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733820; x=1794338620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=KiHfEeYgtJpUvb/FFqc93dJ8j+7vlJvHV+N6/nDuYm5Ln+MtoW2kSLhADpXpI+eUFj
         elKkDVzA8O44nwEz75P5z579M3J5O43NsPlxRSBYrmr6gDE1aV5UgoQeoagamKu0iRTY
         P3RpO5UcRLQSlZkTGj0XdhCZ7awr/epYQ8kOJj9jtIRSkDBITXj3epvDAF2i9frgzi+r
         h6S23Shq6Yock6otF5+PUgND6VJZDMrspVJ5fNoJFWrTu2xmAnageoG0Jf03KXwp3UXk
         C1WfERA9mT96PB+1EQYKSQfzKEtt+Hi8tR23iNaHD+1aPBsZC9WBGBjnxMGqttRUQEqw
         h6+A==
X-Forwarded-Encrypted: i=1; AKwUvBy8WrhAhoRN139RReslRuvmYxk5nJeKYShUH0dfN4NvPesOQ029TFLrt0ViWSdns5wYlqgevj1W0xFe@vger.kernel.org
X-Gm-Message-State: APuU4Z+rdWPBqIKGmtV/ah90uyA2nwzp+hzF9IC87W+VOMIurNLA4afr
	uGolCgxv5YwfrVmWdEZIqditJvxmxTt3PM4MUtOPeIE64OP6Ucd59yMC
X-Gm-Gg: AYBFou3wCFKaiKJsOqFWt1ioI+EmUF+R+MfrP1wK5B7aQN3NWl4GlCp5qQ/YtWeQZxv
	f1CmCrfv9d1jYd1Ic1UJ50kBw5ZGOSzqnoGo4gTvI8ZafUUN3lG+HJdyD3x3WXHaFV7xyPW3s9l
	2TLbq1R899HcMDsJSQGNfZngC7lUsmHQJCLf8JLX9MaZVEK0vtNAzheLScRWB5Gf5TaJzJ7h0is
	l8hPoroKO40U0PfWSr1Iko2ixxxMY/nZ0vWCO5CoDhoXn8DIYKPbHXwn4gr+8nf1FVyoLaHRKxO
	+D3QihzkSlQCXwu2CZZMv2NjkzPgLS8W1HxsBsOXJVQBojQqZ9NYGvI+lPtWo2AlKmQiS4s74gv
	EP4Suv7L9gw9qJ8IsqD9X/IzWY1vLSiuxM4EYJhzmGbM2YkJ3z7Frnxbt1B+3toql6JQPZS/R3b
	KPOuYt+j/Mr+20SyPX+Z8o2AFz71FWvh2Dpm4CAw+Iol9RU//ucLqYwsqwujTYr9/YZjPV5FBC9
	T0KbEqBuqxfBuvRJbouagflQtYLB/lybQSFCw3Li1GvBlT9vWdKw2cOT5SGLDP08C04J+nuX9Vk
	pj1HFKw+iyQ44Klk9d/goW8pEcE72A==
X-Received: by 2002:a05:6830:680b:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-85d3651d32dmr9328662a34.6.1793733820420;
        Tue, 03 Nov 2026 11:23:40 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue,  3 Nov 2026 13:23:31 -0600
Message-ID: <20261103192331.394489-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the timer node for the rk356x. The timer is present at the SoC
level and is register compatible with the rk3288 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..cc3faeb9a86d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1373,6 +1373,14 @@ i2c5: i2c@fe5e0000 {
 		status = "disabled";
 	};
 
+	timer0: timer@fe5f0000 {
+		compatible = "rockchip,rk3568-timer", "rockchip,rk3288-timer";
+		reg = <0x0 0xfe5f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru CLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
 	wdt: watchdog@fe600000 {
 		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
 		reg = <0x0 0xfe600000 0x0 0x100>;
-- 
2.53.0

