Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573193CBE84
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438733; cv=none; b=AJiax3CDqNgA8oKcNy/46EBIQAWByCnLDVRGOLZP9iSUhzPGV6wl4fuDbSnfw6AIXx1ez8t9UuY/4/BIrZw4DeqGB0bfExYPmKULn3Pwvybgu9inBGpGB/w9DPz0tJIW7SkAAxpL7YUBGU2ObBUreDgPIyIinRoogc0ng8fiZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438733; c=relaxed/simple;
	bh=MJzTscokaYVjaUenKSLbKoiovLeIQbNEzqwhkopLKGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lopilK251/ijR8qFCeW3ZX87qjQisc+BQdkcpu/jiol6sJMbxGN7eFV2eikC/AFKLgpGXeg5I5z1MIn/by9V51axWVUYPXeUC5zrUB1ARgl/sx5hVRx47Dm3ln5QtoPa9cTsAbXmKrJ+gTItGLPwd1+V+vZH+s2PCVt9SCh3gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=1vObfbSC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="1vObfbSC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so10240435e9.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438731; x=1777043531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=1vObfbSCKpsl6PnOHTD7JXnMHgIHpiMj6lvufrwLhxUxCjoLg1nnpF/lcyS1Z+wK/7
         rylYi5u4SOWkJPaw+UvVuNKoatRoTbeTQ9BiZIhRh4AdJMyNF8a6REeac3+YgyQoR2I5
         uvp0SVOdogm9OUyP4sFlV1o3eGSvGBZfbrvzb8Ko1ee3MfXfzj9ilviIX997ONe4T+Ai
         0jeO0VlYN55uP5Iqh9WtxjRZTD7wnNGfKj/BuEkVh9eeoyOt7AvfA5N5H9u44IPuM7q1
         hR/s3ePfTNKEbM1G/sno1j0Z1t2IYxgL+KHETiwu+W0cQctFE+SqydCrf1DNtoN9/dH6
         c6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438731; x=1777043531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=M8wOdibUYXvSbDgSxAmrJS8WzaXqOKV3c+dQyqSlBmDLgdAXzG6PquCa22yJ6gzpFe
         yvtep/+vshO7zRYnlHRSNmAC8aVqS342eYj4yxdMAwMtD4vGEh+G74zpoKvdXZALvrIX
         BSlPPaowZNQW1nQMB2OqMVxABK2H0+zW9YHyczy5Mx6y9bIVrYNuB2umK4ccmGd+ZVzU
         NqIz431A66JwA1wxLEotMX/5AZhfw/+kQMuXeBQvBeD+ZtmFXXRG9rxiGZPBM2MFrwct
         SgzeoFep++TcKacER+9Iyj4KgajDPGFb9rEpx0ypMSCB2dPgrtDLJGVAvDd2BRHk8OOA
         XM9g==
X-Forwarded-Encrypted: i=1; AFNElJ9AtdOkZuiKNE01lCfGvLW4LpGUTk+hwZKZqcCP9nYzhDVT3kJJbvLWtsx+TOdepNgfyykxa8Ta53XM@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVYNn158ZDf1YH+KQrGUdUOuqhj/Fv9wg3EOMg+E5C0++UTO/
	H1DikrmeXj8fbZWzFU5D1hVCcuyEB5/m74Ngl9LuxD/9K0wVzRWxIgYhhRBAV+GXqvE=
X-Gm-Gg: AeBDievKIde3AN+7RTeGMeOB3qnlcoFFcyxPhW6Vqs6KBJtzwOYY5m1LWQJiU3uLF2U
	pYeXgBxBvEc88GFcsOh3fV/Q8LdT+ogXStvioz0/MeNjHYFvtyViFIjaTXK2LUySuGv2EdoByiG
	pBcoXcfyE2315Ix0Q201+gRd5e5okAQpAaRstOZIyUNWS3AEYk9KQFlO6YydFocWSQqqCc5LuJD
	0jUECynodtoVJWGHyZsfHBI9ozuXCvmzjftZtVk6slx3BEAupWvmi0wzCsj8Yzye9VPyVlrZzYT
	YEElIstw2RqHpsNXGHvFv/6mJM8oGPD+hQ4BFa0rs4r52VGP+aZjYB4elE6atKq0Glp0eIBXOLl
	DQPbWGQsNT91qvsu69qrU6t4K/VybKYt7Gmle0XQr7cRZi5JPCkfrqa6qX7gFjZGGxe97umM3aF
	kLDmvAzFehgh75J6tP+Xmd1CgWFjAZlPuDUkybOQiBr/niGioLUhloauqe9Lz88BRCneSyl0hMR
	Eoxd47vQUyaXrLs
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr48839705e9.23.1776438730645;
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:47 +0400
Subject: [PATCH RFC 4/4] clk: rockchip: rk3576: add ROUND_CLOSEST to
 dclk_vp1_src divider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-4-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=alchark@flipper.net;
 h=from:subject:message-id; bh=MJzTscokaYVjaUenKSLbKoiovLeIQbNEzqwhkopLKGI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2+8RTP4gqLYob2DNVSvTrzxQ82/a7SW+3xNOBIi
 PINS76WjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb67UtGho4P594u/vp4E6vSzw6BvvkfkrjvvHc1nO7fp1LJ5CvF9IPhn8bhnO2
 79F2iasptjeP2Blz4f7J5xZTLyz353lo8+H2fnwsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Without CLK_DIVIDER_ROUND_CLOSEST, the divider's _is_best_div() only
considers candidates where now <= target, rejecting any rate above the
target even when it is closer. Combined with the PLL round-nearest fix,
this causes the divider to still pick a suboptimal rate: with PLL
round-nearest alone, div=8 produces 249.0 MHz (0.048% over) but is
rejected because it exceeds the target, and div=3/248.0 MHz wins
(-0.354% error).

Add CLK_DIVIDER_ROUND_CLOSEST to dclk_vp1_src's div_flags so the
divider picks the rate closest to the target regardless of direction.
Together with the PLL round-nearest change, this yields:

  VPLL 1992 MHz / 8 = 249.0 MHz (+0.048% error)

instead of the previous:

  VPLL 1488 MHz / 6 = 248.0 MHz (-0.354% error)

This small difference appears to enable more monitors to lock to the VP1
clock when driving output at 2560x1440@60Hz via DisplayPort.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 28eb5a802e83..9fc3264ef322 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1106,7 +1106,7 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKSEL_CON(145), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 10, GFLAGS),
 	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
-			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS,
+			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS | CLK_DIVIDER_ROUND_CLOSEST,
 			RK3576_CLKGATE_CON(61), 11, GFLAGS),
 	COMPOSITE(DCLK_VP2_SRC, "dclk_vp2_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3576_CLKSEL_CON(147), 8, 3, MFLAGS, 0, 8, DFLAGS,

-- 
2.52.0

