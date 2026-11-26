Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660745;
	b=UgOdLVWb2b3pIgZUhgLweno0m476+bgfQa1fOC0GiBqp7QVtOIWX/ycGT/StpfQf4Ix0
	 6JnCmtlnU1PsN4hs3joGghcQa5lRr3ImdP5ErBaFnb9T3em4jO4OF862BzLBTX9uZvHts
	 qngnu4wiC/cWPGXikvo6/pGmr+Yb1d7wiHTkxEDEI/SYneMXBx9nIYdlsB/mKJeOaLN6X
	 1T9I9ijMpRkmbjYmLYf3IgwDx6JOneBpNFBPeMfCPpL/ansGd3rTRUutuA8vNruhmu0IW
	 CAIZK0CD8d5H75z2NN9STwJsfjWWy5gHNAGj/9e3kN7I30zlrM6fbI5UX/f3GNbopyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=;
	b=IKlULX2fwb+24VQSCGodsdWSTtM4C4K2tNo9Zsg9w8RtyZQOV47XZnxD/mj4AJ9vDOm9
	 XEbO9zRErdHoc6xWm2rJfBOZhiEbXceiaHYMuwWwufCEmS28qqfQF8AIs0VlZxSrhe6t2
	 GxSV+3Hoq3Jj0ddf//waIBmKKWbxGq0GksYYk2VG9syrEqoi1RCVbx20qIEACwQZar5cu
	 b62Gqp9+ZWqgmTQ9FqaogcAFLgLwyC8eqgzWIxlJBdlhjdAGCwqw3bNMrYcI9NtYI0t1h
	 Cic3qPP+eBM3d3tQZ0TKvvqNVUUqmU1k66qN5RflQxn4fOsWRBjok/edU/xUFXRjIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTN3RbyC;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B7606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTN3RbyC
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2682585a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660744; x=1796265544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=;
        b=iTN3RbyCYyrpjiGbaG+FmSJTFz9PrqQpX+yQ2IIj4j7/Z0wdR0Gn3my/lsIeA5j2Nf
         I0fDfQHe9ncE0bwl3NdcGEG+BP3bPeYn4awYV0jMbETHnCQwypFFA3IQvfOOP5Jdh8wC
         4uCV9hQfhs8ALja+wtoqgAkPe0vD8rrgKA8R2YOKo70kT9ExO2ijuXDzx2cJtzLJR4Of
         SwgDlPchS/Em2MGoJhqkLYSroCbI8IdEclGulWxKzCIda28kc2MZ3NTTik2+WCPVfv+Q
         hEJkt6adSQDPunUw0qMZdxhjjM0w9rkW94Gunztx7mHJIU1GnSauSquwKkZpmWwSCvyu
         +MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660744; x=1796265544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=;
        b=fst6EsWtEykt3Lf48yf/51ufIciEj4IXnQBHwRUrMteX+vtONmo0Y852JAhQkXCFqJ
         9S7rvP5FWVcebWJOY4xKik6rGrmYHn7m7sFinRa0LkqE6DGk2b13YlU8De0JZw4TH938
         67fquV5BrRmMgMEnkmQIuMix9GNjg07agU3R4HxQRLKiArYeK+djAD98suzWUnX+4Bkf
         +GGWRdFOD6tpChJ2tYwLWJSUoDs/gdLX8485SLaAnPvhSb02tHrG0ljOsO1G5dnRohxd
         uj+war4mP3dNcHH9qSjtlrgciA40uqyiooJQpedu9sio8PwfN1kplKoj4uF6WHNnAwEq
         I4sQ==
X-Gm-Message-State: APuU4Z8+YqnicbIYTYVwEuk4FORjjym7DOZFuvhZZiYBzd0xyWtBM20T
	16fvVDVu67kS4d8BaI3NqZHDP38tp/nqMIFRyY8MN4GoI75boLIgyi4Dtn7lCg==
X-Gm-Gg: AZFdTZd0jdeCgTa2EHfZgwvyRv2wH55tbW+xn2iyps4oVQvRkTftKK8vQYOMNXmpJG1
	I4G7NRQQGcaEgeLlaJAsg94BW7sEGB3uSJkZ606VxdPGwgbX0tI8UidP8UjpZqjU9cmDnSQitbX
	UmLTUzNT4xdu7/MCImpv4pbmO7hu7EgkCf0UC2rRhm1g1gSGS2epoyvcY1JtwbONrsnF2clqkz4
	CyRLXQnn2d4xkeGOIOL60cQNLWpXj+/SuujgkN257xI0t0neECNHTN+ac+Z0jwoTRBB4tBG1EQG
	oVduqGcDwXWsLjd2IQp5m76uMfdrvcVN4LdsScvrTDMf/QlHOUHpWOhMs6zG0Q+VTChJpWxn/4r
	jxAtD2KVIhuFSCPDe5NYNinmRtKw93oI4q5Yyagvqp/rjIHS+9Kyyhy3PVMxmMz5W/zWb7a30MD
	rsNtJM77ldySpXkyJMHIHjcKGJwP3Sv7mGYVXCDmCyp2Oux4Hw/85pfgpv2/8q5LI8UAPNhQVXB
	RB2BBTLWGytMyw38CZ/+Sm1syOwc2RJDcSCk/+36P0CP8/dnfzkiAkYLdOX/ugcQvECSswNbM1m
	GRqU2wumAQM+b/ghM0E96dfujOC4387UZe/DrpzrjSOoyRkjzKI94PzeBs2EXx6PWHe5mmX6Pkb
	qDyiTAFBeTQNl9nKCifHpD5s8g3BjMfPiWSQOKx2SwVvVr0XIvr3rlgAf566dGANtLcN6ZhFAbw
	3WnA==
X-Received: by 2002:a17:90b:4483:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b41c92f8f9mr17662599a91.34.1795660744178;
        Wed, 25 Nov 2026 18:39:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:03 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 4/7] ARM: dts: helios4: describe the fan tachometer inputs
Date: Wed, 25 Nov 2026 18:38:53 -0800
Message-ID: <20261126023856.767961-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
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

Each 4-pin fan header has its SENSE line divided down and buffered by
an open-drain NLX2G07 (U5 for J10, U6 for J17), pulled up to 3V3 and
fed to an MPP: MPP43 for J10 and MPP48 for J17. The pinctrl groups of
both fans already mux these pins as GPIOs, but the pwm-fan nodes never
reference them, so fan speed cannot be read back.

Add the tachometer interrupts so pwm-fan exposes fanN_input. The
default of two pulses per revolution matches standard PC fans.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b86b85e9d0ab..f8ac74d7935e 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -127,6 +127,7 @@ usb-led {
 	fan1: j10-pwm {
 		compatible = "pwm-fan";
 		pwms = <&gpio1 9 40000>;	/* Target freq:25 kHz */
+		interrupts-extended = <&gpio1 11 IRQ_TYPE_EDGE_FALLING>; /* MPP43 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan1_pins>;
 	};
@@ -134,6 +135,7 @@ fan1: j10-pwm {
 	fan2: j17-pwm {
 		compatible = "pwm-fan";
 		pwms = <&gpio1 23 40000>;	/* Target freq:25 kHz */
+		interrupts-extended = <&gpio1 16 IRQ_TYPE_EDGE_FALLING>; /* MPP48 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan2_pins>;
 	};
-- 
2.56.1

