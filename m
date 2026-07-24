Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4283DF59
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926947; cv=none; b=AohcdajqeWwkTGbMorto2R+2hn2AEpG8/UuPIrP4bhG2Zc+xbJXpY0+DBK3zfuyy3ewWwJpqyeOBxLIVO2Ljrb6D1bK1aRwXHT9CxD/14fl6fbHVN/h4QGDM19gMkY9Q85UioRBdEU410R9NShudkrjCn1+bJtf1DL6rxIWgn58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926947; c=relaxed/simple;
	bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRWtO0CaCygAjazKc91U+V+s9Dh/YmgYRlWzReSJc7jBNw3WpKEPd0pP+VXMBkikYo5W1bzAwi7/jO3QyevKpTRBVv3TX5ojFjEUB9nH309icTQ2CgQYaMO+ZpAkGofzmXGGSTqV9ePBLe3Sx7WR93Pxa5+smd95to7pv2J77GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAaQkehJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAaQkehJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9423so115534a91.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784926944; x=1785531744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=KAaQkehJ3bkez/cewHZmwzD3268RHAuXVh9QTKDgq6ggmeJnSg/AjhRGVdpKFlMtdt
         i6oGaWtWN8zHxggfAVomNLYYh+A30lEq8rd452cNNdYEk9elCnW2AhsIbLug8tyLQWYx
         p164558eFWoDvz/JEr7cguAiBVcsILazPVX1gIHfm0G0VyugqMs89cF3m6XAJ321foBI
         qouPnX8VclQBJXhUvZYG2pcCZQmuy2JW3N48zvWIbF1B4X3f2j+X896LLBflTY5mnnRS
         h3KrjYrAMP88LyvVJJE5XMv6YuMPDIYWzRVSyld9o6Yrzq60mpY6zwpDUv6mYKsga5Rp
         5ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784926944; x=1785531744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=JCRYwu8473w3FYXkkT1+BGK6nLhF5nfve/eyNU79YHoPax9WAShmW5IQLRvDBIPTzl
         bBdr0zDqKs/SYVmxrGz4nQSnClir7ylRVPdl1tXWJ4NtDN8iStnl30csBzD2qzFqMjmB
         4krtXDKYOGOvtBGo0CCF9o/mZvDynpXfoi24GSyKkziJLMDBrUHaRwZHUkCjW0TMSEIN
         pghRFBnkKX+5xJxRE+L09BKBH302nm9udqGXEb40zJPk6z4/iWpfG1ROYfwwjv5rA64B
         hjjKAh77J36DdQvbfrgb1iAtZdoJu7tBF0a479u4JeD7vSbAL4LpTs6vQi3G2KxBe2Dz
         Xx5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqgiZLThd0jSw0Mj3ByvlmyByHGFCwP2FX1bJs0O1juN33AoQt355eH0TzoXlpYJVPGf/hAKuxlg78a@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiWJmLSU6HRqBmiYo7xoHp+DKseRxwnBAgive6juqjukdHuAJ
	EI3zaSKZadmUAO9fCBJofqAR2HRZHAhLqQvPoEwSD1MXTff0q1GHgLWm
X-Gm-Gg: AR+sD10t5pn9ygmaAuLJTBvJ1upl3pmgZesN5/Rm+8U0VIMGBhd+tQczhXwLyMCHAzo
	Bn6duzugy6ZMmVgAxgjkb2NcHd5QD6dom0lt96cwDcDMNAbggSyk1doCk6yLBPys/FNeLyFpUWT
	pnyaSlkitebUR0Saykijr7JRJeeGZ/Fq6EvisyM9qXLs2zCyHtVAPHvLsEditw5PEoqn/ouAZzV
	unymBuGPR74UXTjkbIRYNeHQpOGGk+HL5JXdvdaq5dL0irybm9KSvTlULL+Gx2wXheyBomaB8x7
	Obr32zZe7CFPBUe1OmzxAo3GY4GQYBGSr+eUS6C6g0VuhgDGypF3gWLQDYLZV7rVVvGXW5+4xTw
	0p6mQO+8OMvrpQWCImMnv4XLYvyGv8PUs/pxdoZRQMZUzmiUFqY/NouWvJ2WfMvxRqmM9IObcGA
	ndGlec+PYqdo8KwL0=
X-Received: by 2002:a17:90b:5707:b0:38d:90c1:2485 with SMTP id 98e67ed59e1d1-38f2963f507mr38503a91.5.1784926944335;
        Fri, 24 Jul 2026 14:02:24 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:505f:3320:3d54:c6f0:368a:d94b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm2485324eec.19.2026.07.24.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:02:23 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 25 Jul 2026 02:31:56 +0530
Subject: [PATCH v2 1/3] ARM: dts: ti: am57xx-idk-common: Remove unused
 ext-clk-src property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-ti-omap-rtc-v2-1-13f765ca96b3@gmail.com>
References: <20260725-ti-omap-rtc-v2-0-13f765ca96b3@gmail.com>
In-Reply-To: <20260725-ti-omap-rtc-v2-0-13f765ca96b3@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784926923; l=818;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
 b=GZPjhTALNqNqEfqW7quMWgJj2Rh1x7yZRa6ZgyLobMt9wQ45rj6S/AMJuNBFY0uPEXflzMmHC
 MO5HSWxDxNbAVzCaPd/+kBztjYa5zlH0RyLkbkVIyWoItqadOrd4R2S
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The 'ext-clk-src' property is a legacy, undocumented boolean property
that is entirely unhandled by the rtc-omap driver. The driver instead
determines the clock source natively by checking the presence of the
"ext-clk" clock via devm_clk_get().

Remove this unnecessary property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
index 43e3623f079c..ef4bd554e92b 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -445,7 +445,6 @@ &uart3 {
 
 &rtc {
 	status = "okay";
-	ext-clk-src;
 };
 
 &mac_sw {

-- 
2.55.0

