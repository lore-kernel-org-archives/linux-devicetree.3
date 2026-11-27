Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807418;
	b=30jObt+m37kWrzEGYfzTjoEtMxtj1t4PpzQmDfdYsYecifPxI1QCX43sE+vBXv08QAse
	 oCW29siWESiyQWIFsmgkipx3OhrJbZQYhiT+3LEYVPxanLmshfdqm//MC56k9zBswNxNM
	 XVhqnFzcE2kbnQ6XJBwNIPTXhRhaFYljHMjPI2VNTIzl6WnNAKbOMMSW6RpO3+yBwlnHo
	 mTPr6Yw9yrTY0RW/bIHXj6Y+UsV8KtxT/Y/AyIK+dlkkSAXFODxsJbPa43wTSCWONt54A
	 fRsLiJ3IBjWJBC+zmJEotVimksguMY33LaPW6gQGUsERNy39gcJ9EAFBxxBARNTOJSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JmMbAru76i3/EAV08D1zHQqIy9AdABlMufjy77cw/JQ=;
	b=JGZ0oUudBuxSyWozlTHcoq97pyJ1OfrwXT9h2ROHjFeIV4/xs3OTAwotLpZS5PFRld20
	 eEc5iVSoQt0wNSw/z0k5y88ghdQwXspkPJ6emK9y21TcIZRZWIB2r25PbVuHQ3ODTucwY
	 rGtazSN/70lEOuAB5VYe6HTu8EWdtSilOaDzBkGH9CJl/LU35FJZZttUNbiLSF87FEYlS
	 D0Ni/4pmBGXPJ44Sb9sINfx7ENQ1/6Ft/abUGpse1S02XcifyCJdImxXh4snaMeWs1cT9
	 jir1e12MGqjIQP0QztLyW6f+jw9UpevYwdYjWp/1DXBXWrfgBpdgaS16hsL034nOEdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6THYbIo;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A22606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A22606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6THYbIo
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48e9476e26aso2938300fac.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807417; x=1796412217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmMbAru76i3/EAV08D1zHQqIy9AdABlMufjy77cw/JQ=;
        b=h6THYbIoz1ldUtaSzNkK7DX7MkS0vJY7RdqAIndbb5cuQfcjZc510dXWDAfDv9Vda0
         bTG1v32cE7HQIQCAaADfkNyepIZ5ttcVcIsxfDR0NsM4qRdOqlN6pPWMLFjV7jdirrE2
         s73Mqy89uFAE4hR4IRpu1oF+G+ehC5Cf3ZcT0OGpgsNTLKZllhygOZ6N1E7vY0cHXqwz
         gV1jNezLhnrA6xiic09urrMPYw07zRCgdH3F1JE9bW7dwolXpHukJoYyEBFI8XagvwnE
         RfG6X+CBIesTysncSZAeEydiR0EJGh60kfLS18bHXaube9zKUkBHizNvS41UnloOuGKP
         fS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807417; x=1796412217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmMbAru76i3/EAV08D1zHQqIy9AdABlMufjy77cw/JQ=;
        b=24p3sxluhWTVUL90oY12HY0UVgJSXtLNU+xV0GOmFW5YLcRknUmHQbhoWbZpzPLbbt
         0mmrB9fSElrU2FzqphjIVTFxIvR0am9iZKV4d/w8C+Fzdf+jfu+piL0nsMX8qo8B89iK
         x0AI1fQyVGIUIuMt74otplqhpqOnLR1GY4UNKnCDUHiFD9daVZzIxJeZLL4XKB4/8A7m
         L5hzNnNe3b4/M5LcwlEusRb4W4ZRuG2fH9AZKn8t6eUTU8nMKboDUMrWRr7KmmxzytsM
         1GedcxrodK1zNRNMg+S6U1dn38OhqcSKUy6w/H6kTa/qJZ+3/F5V/UeLfZZVuNuRXc0h
         7Vsw==
X-Gm-Message-State: APuU4Z+7+ZTNyQ5Pg+Rkf486F4wjnuby1z4pz3sDvD3tTH31orBZMWl/
	g5NkwrtArAAuOjnTIkuYEZXc0O54NTYM8YNS/vMg2tMJB7UDv8suxQNA
X-Gm-Gg: AZFdTZeqcXaqdtYpawMUmj+78vvh9EyhcY1zdn+yuzsFUtPq8A/SvDN2eBL/HR58YXw
	v7L0bYh2omWGE470IsuJ5LgqcXDzOnV9tm759qq4JRYmBpSSLDsxs0AG7ULC4U3ZaeTuRgCoLqE
	Jd7X0ydT2QBrY4D62PzhfMSwwttmEBt+VEw4GSAYkn2H12dWsviIL+TiKSnv3hGuZsarM7TI/tB
	AzeWTn1rlgVKp4a1MGxwftbm8qPrsP3gOrTO5tPe4gv4mE46Y5iBoaolOHKFu7jG4BKVPExbl6L
	OVuxMfrXIvADheIK/+MwvPk6znIQfYnXV8+abBbcIkBAc1T/GVGKoGVmIUlr88Prf8dxvlLPJOP
	xR3XnsDk4Z7eX6YTNw6VTMJLNednSOoDDfpyz8LcZsHuhTW/XJQIGNHUl5vrGScIC1SP7LtUF/g
	pVfGB7kL4GNBEedSU1jg4Iwel/o4Fyg3Olcf6XDDPQFs2qsRjViJXjlBJJ+vbA7KlSxUMwkI9NJ
	oJO0Xci+wzP+VVyHwy2/+NPQEuFILs92IRvJcsnEHEXPWFD8LGgZnMl/Aw51F7ztsZ+gvUk3Iwk
	/tZrF6p3aNR1Ub6zvNvCUfob9ErFVg==
X-Received: by 2002:a05:6870:e06c:b0:4b3:fa20:cafe with SMTP id 586e51a60fabf-4c739d49cf3mr14683763fac.48.1795807416715;
        Fri, 27 Nov 2026 11:23:36 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm24044850fac.13.2026.11.27.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:23:36 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro
Date: Fri, 27 Nov 2026 13:23:30 -0600
Message-ID: <20261127192330.610452-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127192330.610452-1-macroalpha82@gmail.com>
References: <20261127192330.610452-1-macroalpha82@gmail.com>
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

Add support for the Cellwise cw2217 battery gauge to the Anbernic
Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index e66803b5399c..d4abd497f355 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -954,7 +954,25 @@ hym8563: rtc@51 {
 		wakeup-source;
 	};
 
-	/* cellwise,cw221X battery manager at 0x64 */
+	cw2217: fuel-gauge@64 {
+		compatible = "cellwise,cw2217";
+		reg = <0x64>;
+		cellwise,battery-profile = /bits/ 8 <
+			0x5a 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+			0xab 0xb5 0xae 0xc0 0xa9 0xa4 0xcf 0xaf
+			0x96 0xff 0xff 0xd7 0x9a 0x83 0x70 0x69
+			0x65 0x65 0x65 0xb8 0x81 0xd9 0xaf 0xd9
+			0xd2 0xce 0xcd 0xcb 0xca 0xc7 0xc8 0xc5
+			0xc2 0xba 0xa8 0x96 0x8a 0x85 0x7d 0x7a
+			0x7f 0x88 0x92 0x93 0x94 0xd3 0xff 0x5f
+			0x20 0x00 0xab 0x10 0x00 0x91 0x68 0x00
+			0x00 0x00 0x64 0x3c 0xa0 0x89 0x00 0x00
+			0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xb2
+		>;
+		monitored-battery = <&battery>;
+		power-supplies = <&sgm41542>;
+		shunt-resistor-micro-ohms = <2000>;
+	};
 };
 
 &mipidcphy {
-- 
2.53.0

