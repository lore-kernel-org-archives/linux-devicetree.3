Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649219;
	b=OKoe1ks27ukA0FhW5UDQ/EpWCQBcuBzxxN4RiZKQWTDPbf/38rnItTJhVZKF4PbnOA0u
	 Ze+DZcyqsa/LmCADCu0nB4ztqBXa7QAHDah5HG3Glpmxf6oq0tuQSamp0gPl0+4bVk08h
	 zmY8Za/4I7MkVvlDtk174ca7LOQtAJHfvZDtYd/FchwmtCvcFEzO50iqYT/3HPhPQzio7
	 z+8E/EH23zo2sxXZ8eb4Cxxi2agkTR+eqd38GJEnhD9DRCQYGH2GtyZlgF4Zse1bUQpr4
	 60tuVVQm9Wvu5fyOBxeo6QsUxLEX6UnBHrt+k8oU//WbP46tYDqJt1fvaLw/EldGiJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
	b=xyriQaiLdDC1hCHWekiOUEZHjqICVg7cBYtHejU4vjROEUtuommyjjfnB+66vxdXztGE
	 ZKctvdPgp+3Hljg0J5jJr9jHN0dIsGQc20EGR7lvx019e5XnggOPfIFX42aWbxGAd2LRh
	 XhcQSUsNM0ienAOa6fM1C7aw2C+K3QRG8mAk1ulrU5fyYholJV27Q8U8Jx9thfgHzz4IZ
	 hscYjeZlj/LdAcbSvNIexmfgNB5WKNYbKoij8sonelxUek1cUBcahoHUt9ptSp6pu2og6
	 QBlHks/AglXlSH7gTec5MNSk95bYJMAVUbbZH2EuvbcGkpFlHRah+RC2l20r0d4WXqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihhePW6n;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FCD606EEAE
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FCD606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihhePW6n
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so22707125e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649218; x=1794254018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=ihhePW6nG5aQKA6k0s6mG8ZXxjGO7JitLw3yRxzPxncDkZfGWQNI6++JrLCSd48y0U
         0M1QprzxL6xmcd8TADdM9AFoTElRw7DqZYAbfii1uG1c995ilrV6LPWOZTpBA3RTvfIR
         wlsH/fpoq7FkEO812jxLGv6TPyvzbsQwosGjHaHSCQaPdPImC7kKNbG7uurXZC92FciV
         /n0mkpaDJ+pe1Z1ysqwpgXHrd1E/cmEeHxoxKVWy3oqk0p5mIWOlxhh4PbgoDvbEF5mz
         bmxdZPndCtpm8K5Oh3lAjQ5LE1E+LM/F24EHRYFMrcE8v2s+olmr2914wxAYtd4ME6Xq
         59pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649218; x=1794254018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=Zcl5I+/O469dWChgg4mGGTklzFVLhsuBE0BUFyBAco+ecvu3rX1J/L9PqKAwhIt3ml
         lJOvq0bkFl2yHo0GXP6muBLJc2KigCD/436uXPM+RGRgAsgcV9DNJUnq6bSQjYjG4Nfh
         dCbqic7AUq5VJwcH4IG1911EEapPHCd/3OUKQ1GdlIt5H9za9CNuN3lCa8xbb6NbEIWE
         oOsVxoQYSTUJjyky+eht0gjIWxnlZrjovqoFLJTTkK68GVmM7LsjMWD/kvAXLn5XeJCq
         MpPteebgZ09DrKXTUzjRkTYAugmhzNNH06ypC9wCZzFmRGIntVYkNTEFkPVLIrF7FMsu
         mQXw==
X-Forwarded-Encrypted: i=1; AKwUvBwWgfkgmQIR0id7i8qDqKoro4PYkhKBPnwnXJwVKE3vOvF1MN83Ky7Mj90fiJ+gkttVJtmva8e1y3+o@vger.kernel.org
X-Gm-Message-State: AFq9FYLw7+nYH+u95/AS7eY7VIU5rcjb5E7/W5okcPyqPxlPgFlgiMxz
	ZUhmak4bqCY8WqiPUejllgHpN8Hcsli2bsL+LCmuAewQ+ISICCUC1WPWkDil90DCUbE=
X-Gm-Gg: AYBFou2eilBeWDe800v+3Qq0hBAbh5/UVxZfrpt8I31JhK0kaMilG4QYvoSRxUwS8+X
	kbsc3jPfGToPhpWq+8y5JXcokxnBKX5OdHzeKvako+pxvVWTUo20BEt+EZJsMv7wj3Jclu81AFg
	PtBx2LSqh4Qe7l5oMMTA4FrfpibcRxBfHpFWLxYXOD4w3Ey6bOZd0E60AVlX2/A3kgrA9aA5VKo
	h8+xiIr+NXUufOXIXgnXbjPPi8nGcotXkkNKZ0kObM6w377pwjOB2rBr5mCkKF3szaRE6WpxW9t
	iwIN26D3r4WcPAzNW3oz8xjUGVGeKrJMwEBy9tOJDVi/iE5YFzw4z98vfjtA5q0bnRZBeLZvI8N
	HFOuoHy327gpzZBZlVMpMSIuHMNVQ7XJhq992Rq2tccg3wCG2BU01Opl1h8ArT50ubNOZs23hyG
	OwedYwDgxJk/EUrpzxCBSdfYSyJFDwWE3QNQpe+/cx7VHJaxD+fE223F+BLECs/l+lpxG1wpZEY
	/0z0ie7Lzf49Pu66WImF6HYF/ckdq6mkaP2O18uoChP0WHco5lIrxNcE/58KnSC4dTmhQRtIY1x
	MWtotcFS0u+hcjr1J7VoWXRyc0Dd0bE6OXeT+kTdmJlM7fDyTSKh0MCrGShTYwhAF5r2ZjY/Jjj
	y84PBVvNcKOeOdqMW/x2G828TbNE=
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr33884285e9.23.1793649217703;
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:53 +0100
Subject: [PATCH v3 7/9] ARM: OMAP2+: ti816x: Remove hwmod code for USB
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-7-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1624;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=k71BaTXmePgSJ8uhTSNGLd6YddqmO25ujKt3OAYRrbI=;
 b=P8AE5PbmCCLuy/Ppxw3PTz0WUPfmfz1xHkFqfzmjk7Pc+my/DThex7cRdc8Cv30Fio8oEhxUz
 1kdtOJibLGlA1JLTSPIVWpwfXfCOB886FOvJubPpva5dvZEc7OZGYtR
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the TI Sitara DM816x deprecated hwmod code from the hwmod data
file in favour of the ti-sysc implementation. Tested on DM8168-EVM.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index bdd04fed8034..8ca492ada179 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1225,7 +1205,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0

