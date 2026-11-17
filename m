Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936530;
	b=whz6aGDcCXmeseSwCQ61DfsZw36/jhZxCPEXCNvDwuauAtDTh7SaUJa4ZAdBCU/5uCeP
	 HC/rY2ltkNPKy1ioeTkm2KycTq5Lgh79gu47/Snq5PGwsq87y/1rcp0oaC+H8dbSd2Trx
	 O/dP6ULeeYl0TxIaokCPl+D3CfB1lxUhXOhK2OFAClrT4QPpdRQeE4CN2NaBM+k5UNdNl
	 PvXW7JOWtJG/xdz6JKW3O8kZYKj/FrctwxaMzeFhVgVM4qYZKOqR15gTMbodoZZR5fb7p
	 /ucFD0L8s4om0DXLbidDPTL8lUdEEvA8skk2DLwxnCABmqDk9h3Fogdieluir6toPjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
	b=Hq6qr3W0WCU9H8cAbiTlc58SNPlAJRlJ0qbU9VzPmEGOUumQIkJvIqlRBVLa371s57pR
	 fgRFqzo/YRnOtbpI7q0FM71CFH5NC5cmeF6+CKTa3TsxM6P4KP+BB2doWj3x1gG5c6ZaD
	 BIsn9bQY/HdAMkZkZi9G3fKwk5fzS4N8nbRh+C/aqC1m4Lnv6um20QW+LLmZVEM3GdspK
	 mcMzXiytu8elFdjiDFu4yy9VATKhQvpowRwMOraBxGMKR0khd9PLRClN+jvn/JjjmkHw2
	 1YOPpB+XucVzx9hWL2RCwJHyK7SW6DCMWsTFHeK984+CK2xnmt1ZsXSJsBLcEahxdfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PD14KbCb;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C973F606A883
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C973F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PD14KbCb
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a85c656c58so32737fac.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936529; x=1795541329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=PD14KbCb3IBMdSQHnWBJAQaO38QghirT8CO3wdpYoHbiwqYq159qlJp6r7we8D9WF+
         jUXEe1o9zC/0uiLYLkPnhkJXN63z5OgO85F61Dc8uUKo/F+DxS3XVDxBbi0Y8csqppv2
         FHMshgjVEg2oebQOsXoFllnuLRX0eNX52ODnXUoCRSknUsuGxzPZLYZkBqfmnm+i2cVs
         K/RvKhwem5UiBphM+qxmFGiKlBFvd/REVSmleq4j/2PgIWbMTC4GsvqD4bWK9Kra6P0k
         lnIrWCjKj+9IFOHRPwjHQlxeR6I/E9o4IHcJVWCgjpRtmVhMXGgUeNbTqKIRiLoXYIq1
         luTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936529; x=1795541329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=thpNEsipXq6fq87z+Lz28RAfaPxOYDZpks6/S4jbkksnSm39Bf33pcAzlHtFHvc+ye
         B5jsgWz0l1P6Dh/H0zAuUbj+1p4kBaAkxMwM0LqJaXB4iTykL81botRgIbuCt3IjhW+C
         7DF+kBGwG2BzdJvZFuk18ocL/ipAef7xUmEL5aFSxjE1VqtJt+AUhibvqqsYQT/pOols
         494RGYDJ4hYVQkGVk6Ddc16XwGf8DHkWC0FHOKqjmrNiVXEXjY2JhzofabRcp1BykwAK
         PhJwDQcSeG+cLf/PNWHTfnQkLPMUqtOFiKcmNIl7zMYyK6z4LqlqbtGrh4dKJl4I1M5K
         oUyg==
X-Gm-Message-State: APuU4Z+m+yE4QT6OcNGELaC9E5FmRV0CMKgi7KSKqtuM6lbeZLmwWTXv
	5ZQ93LJL6HUk5UcVb9EPUxhnrQp9F9ExFTSoCXruwHvr92YZgbNqmQI9
X-Gm-Gg: AYBFou23KBWYDlUtROyZf8Rvr7T1TD4nspaqr7Npm9ERqPGxNzdGV9FDUy0mJB0mKFb
	8hJFajjOnpsjV0Ux8tXbwAcv+qZceVaI2jtoRrT9Bc0BTiD8gjhq07y6M6En/GjmYrjmqd2AS+C
	3dEKMnhqOP/qC57DB2WSvnDvPclXcF6d8hDexEP/1wHXXxPzhWVg81APmcqkN2vXJbe9BHnCKjU
	Bzl8WLpT7mpC8ibTs9PzPmu9KEXSVvi03pUfmzNt8TBDx6tOjBb2d+xcuZSmKBAP7wN+NEGkZ6i
	qNaIZ6NHt8O0wUsxYLwWAeu5+GI+rft/SJvcw+LpBh4Va01uH1axzQNp3TIaCmhk50P83DJLhiw
	ex6y+TMTdJlvTyU+wUtIwtIj3IwNKvnIOSncyd0PxN16vR/4TOX9i//DpFd4kYg+LiRK/thJ3B2
	uXneJEDjZfSWX5xOqTAqzWDnOT6q4n7rmsW0OC+2NW52QxTaSgQu9cQs5pla3lJ0mFVe5v2yQpe
	RNETKJSK+RGfcY2X+U5mtWaFDOwK+vvQ6t17Z0jYox5Wv7uMSU6PNPYLhi2I4i99JOSlccHKlZ6
	xcsT3SD9vSVAgIa91MMbk5DNQtqJCA==
X-Received: by 2002:a05:6870:1707:b0:4a6:9418:da4e with SMTP id 586e51a60fabf-4afdf7d9f45mr11592986fac.60.1794936528546;
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue, 17 Nov 2026 11:28:42 -0600
Message-ID: <20261117172842.65346-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
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
index 7e23f6983448..3c7178b013a5 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1389,6 +1389,14 @@ i2c5: i2c@fe5e0000 {
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

