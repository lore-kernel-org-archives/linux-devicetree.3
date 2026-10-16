Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071C38DC49
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161687; cv=none; b=kYhpVhdD0fECEpYKUvEWvEe9dVm4da+5xscH/5BXS8cvjKxbBHiSR+UvRMUroBGQOT0b3WlVJY58AJlKXIPGDHzXGgIULNr1ABYT8V+5YnNI6lldEPkEPQmFvtx2pYk4tEWqsE91BM99I60VUyFmzo/KhFtAZ87u5aCyvp+KC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161687; c=relaxed/simple;
	bh=WZNjPntmTxKB6PnwoW9tTwXddGro5Tl2X0NnzaRRwkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8o4Garh3+UpgVKkWduZpwLg8qAiGeIjiFdrvphIasZl7+/8VlazAWT0qcgH4rttxz7/w/9MUaf4HApmEnTU2K20sx4+jwFT/GGGIZ35L4tOImdrdx2UGXgzyw5GfHza5AZnkB04Q+CRKRBgwLeYr6LHKiUjYxTKTcwb1TDMDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYQzrg49; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYQzrg49"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso454942f8f.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161684; x=1792766484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=cYQzrg49KxtoRa2SpNsqWpA7mWhzdK3jNsyFAZ5a5HYlkwkS2lki5iXSrNVbf+K73q
         yy4HkNO/Bjf525rDShpAepKuHTKFUjRNpaTLcDqAYyEr6/RWsCCrBPAGdGYbZb1Y0M9R
         4jtQkkwjmVNv973zJ2jxxLOsM1LLd8NrbdOKyKX9qQq/gTMp3nYP170LLDm2+c+gNvbw
         0tXlFjLb0QCU43VWjJC87/cN5IqYusw4M9ukoQoa1QqYaYpsGqGubgicd3yM4Qb7tdDv
         zE3HiR2M6apgpcqIiZy1iCURA9fTNTc7Cug9AEBieaa/fL5uy4BELhw+qnazyHcL9W5Q
         Pt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161684; x=1792766484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=N1XtYmOMAOhU9pQtpoz7mX9VAlhZEh7BVdiM//v03wmeB3DVgBNBWQlXtkWqDmuw+q
         MD5QU6GW3A5lgAs1Q/ei64AY1x83vzFneMdfUwUz3guWWWNMWWnVN2ErFjmoTq7MSdo+
         jiWFiTmD9ar3XtAj639venLZELIQWtEeBATZjEMv1HCpmIjrIzfJaNdzaFMZlkMgXumo
         DC30aWknAkXEoaf9efBgVjXQu2SBLBGwA2qrv/DBPIdpvrPysNmBFLwy9mGonE+UVLBw
         gelJgi61S8Q2DfaQXbkQOSqcq/eQYMoDGyU/zc8gnvFWWYTbzH1LjEm1LzYlFhgY1eVV
         ktYw==
X-Forwarded-Encrypted: i=1; AKwUvBxI2VAOfaYbgx6eGomKPMRU2AkYwrUpyLZzWNZDg07UiBePllTQHBr9APjc9SL0Zih8yB1tujyTxgnC@vger.kernel.org
X-Gm-Message-State: AFq9FYKHJtJHvbSEe1jkBbZm9ImLkiGvdZHhy8vzS64OvWaXq/L2KZ7Q
	N68wDfSsKVKf0ym80dyIgFV+JvNcPMGqPFJWepksrNsjffOWPn2IeXqZ0Eu+XizgGGA=
X-Gm-Gg: AYBFou085Hlv/29ZLxkVElFourFCm0PCwWN7vnXMsOpj144ZEb6tqeQ9b1N4BHN6J4D
	xHBAdDgVyAnzTltiIOofzO5ByLx5Tmr6XvoE/fjPVzBT+fXm+7+4XR2Lf6Vfo3v4qAt21b7MfpJ
	akv0nyIZeC7YBdkV9/4HGVXXOJQb04r3L89KsXYKtsxsmSW7Knmn9586pnSWajidroNEYTTcgS+
	Uh+smwJT2offfSjubU5i8NJ/GazAxqkjgJdCfa8wwGsXbDnM5I+uXUAZS5Dj4Ea5CgDEar3hRBO
	iW2io7G8wBm+epTSMenhD/qfJGI4OljDRRPLLX1kb1CEREDSDZGsu5c6K3tCa15yN06MVGVB3j3
	KgyXgFFeRfPmrRjlm7tlvP1+M5beVCk6SWDxsK/VB3x0/xdUmrbH/gSeV3rE+jzNxeiAVHxrhzS
	VL8DKcr73ID1R7aoL6dMlfKd086rpbK1ohWtnGlDtCwpJf1blFeoOkJVtxHjHlN1SxjL0vFR4CJ
	3jtn9UItZ84YlsB3kzqB3lohZcvDSdLgsFOtqE9rBtyeOtZ60vyDoteStZWB15v0NIPtNw=
X-Received: by 2002:adf:edd1:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48dfae1ee24mr6334662f8f.16.1792161682381;
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:16 +0200
Subject: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1058;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=vkbGDt2t9O3PEQmqq3WpWoBfMDyf2l0F94OzzH0Lqck=;
 b=G/D+U2sPat3Xx8BIZaPIsfhCX1A7J15eqsyRChroWg78s4J3EXHdoTbuWHyx0L7PknTnAfqwn
 IH65RPB9BFLAvsjLEHx+wXWjp9HH1vccFQxAVZoS1qKHUm/WAA8zm1l
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

There is an issue with USB being put into idle with DMA enabled and that
is mostly prevented with usbcore.autosuspend=-1 on the kernel command
line. Stop the ti,hwmod code from putting it into idle by setting the
appropriate flag. This stops the log entry 'clk:0058:0: failed to
disable' being generated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..2f55dc32e150 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
 	.name		= "usb_otg_hs",
 	.clkdm_name	= "default_l3_slow_clkdm",
 	.main_clk	= "sysclk6_ck",
+	.flags		= HWMOD_NO_IDLE,
 	.prcm		= {
 		.omap4 = {
 			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,

-- 
2.56.0

