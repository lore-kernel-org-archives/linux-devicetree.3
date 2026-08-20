Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243B340260
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235967; cv=none; b=UO8B1uENeHaNAxQZxLIyeD08STgGOePQn9y/vUOrZubiXd1Z64d1cdKMvSdqDRzZzyI7QH1FQhvqUN2db5W9Z12pG0+fhKpnrZIdaWS2m43QmHGwat+xAHunTzs0P6CrkP1OmJq6gKIRdbOlbAjbk077JpiuhxWwW+S64R2KPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235967; c=relaxed/simple;
	bh=4xe9JdHgCBai0JGH7S0MmxJgvM0Sop7zHwcV6p6Mdp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tGMPZrDBNf5aZaGRkNJM/petwzlNAEYLumMWlbzuoLKPE/19DYhUsbsl0HinNLQtJSZtzNGhsU+0RBMSguz774p8Fpd0n3E/+9fm6haPfeiu0XEF7la9f5/oRrMbFEFRhOqb2z84c+4xNLmLQDa4eeeunAtGUlLQyA+5hxMWe3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i15seNo6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i15seNo6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fd4531020so1471408f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787235964; x=1787840764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPrWoN2v8CC925FSKCBaAsH1PVinm6f1QGFGXJ4kZhM=;
        b=i15seNo60CsmXPzV9241MCrk/AIlerk8JFx5EYeH2imn+LLUyDUG7BzSzuTDI24/co
         FV4PMl4Bs5xWgaz6yWtOKr0hqaNT4OmzgMxyhVD0DSOH1moj4S6rRf5/YSsjJ4b6LRdF
         7OHudEeYw5HtymTxfnjneijP0HbgZ/0SpZ4dTPTCPyaEiKeRjY40eJqlwv9LUQsfAaZ5
         zSji8t5jFJy1FqmwgvCxCBuNUwkBZvUF+Kc2p9+AZW9cIysDZoG7jfxM1ZQ2rJJTlCTJ
         MttKpzhvnmeI/ukX6Hz7DVqUaH1ByP8N2LtMZI67ANwUkwjMusQ7cztu0oockd9cztIi
         SeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235964; x=1787840764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPrWoN2v8CC925FSKCBaAsH1PVinm6f1QGFGXJ4kZhM=;
        b=QouicErrq2hkxnFSSVF9XKYQ87KgjbHGoK00ha9cBGXiXuWsCVAxDQ5qO+Xuc07Q6i
         I46gcCudXljmiHUFgY9opxWuCB/kU2dH1ERJYHaQqQPedjk7Jl+8zKCTpz6w+Vyjx+Kx
         Y/Q2NVC6G5klU6Fhpguy7/4Qt58OjeFmEoXxczSo/jGZDuTNZ3bVy+eou4HqVOL5qWn2
         BlH+dAIy/3S1/ZgeqB3lgSRx1eB2Rqd4xAhRWoRot+6pilZP0O/3j2G2uRnKf0jEsZvA
         PKBVO3YwqObE0yxQBlokKvvNnxw5adlnm5JGAdmtYN6XKyBhadKWlcp3Hnjv0IuHPE7L
         tPsg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi1F9GUSl8XqGUBBKK98aoyMv0kPO+L+iCk+bStiE1COnxfZX1m9W6weSgi7vWjknB4Mel9HnSXgoT@vger.kernel.org
X-Gm-Message-State: AFuF++ndxzRo+DSB8e8MBV0crUrIEB+602gKcAMWzP9O9j8j3+7IpWUa
	EfIs/dldxyXQw+l2I3m+FsjAIHbmCXon+pRPsf3JibcA/xu3KoOn8sZehsY7Qw==
X-Gm-Gg: AR+sD11+IXThjswlncgf+ZyfHFLWN+3DM9O+/FaWqh3IOmEEJtBDqZnSApRxkevyEoM
	9KQ53NSF9fx7fW+4aOW2OG+3m7Mw2ZZXeVaF40TDbp2UtckFFyN4fnkwhCmCkUYV157s6h4M/z7
	lJ/wMluHHQKGkdiaBJJ8Gbq7pC0GzkMGeL3bm5RrUZ4RNkex7SoC7z382G1hz2+TkMR3vw5t3Ay
	hpVJUtmOLYeFzDC46Rn4PhfV+C+hCWT3LB7C7rw7g6HMRt+64xNptYPle9mZRmIaYEZkslZs/36
	HGF7MiqV7kjQay6GvOUa3eP87kDNRuYQOD0IufFy46nAvxyYTP3NBA7Hu12EtKppH9uyKxAn91X
	Y1KHhBefpqaOs6/gdfrY8ju6LHvOc3q21TvMgrBkZCtQihiXt5qilV+sMM3v+KUSEXYkfc20IRm
	OUjHXJB0HDv9mUxY2Ll0l1qp5AycyQkt+NCNlGcNZF/6FpA2E29GGNK8HOW+XbiehNrwuRN1ChS
	l6JYZphTtM6A84LqGAMqnk6Q0hozdrNR7D0jQqfsLKopRqNApD9Z5Yx4kA=
X-Received: by 2002:a05:6000:22ca:b0:481:3db1:a62f with SMTP id ffacd0b85a97d-482b1fe6ea8mr22171478f8f.17.1787235963992;
        Thu, 20 Aug 2026 07:26:03 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145153fsm13594027f8f.12.2026.08.20.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:26:03 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:25:53 +0200
Subject: [PATCH] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHAOh2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3bTMCt3ilPTcxGTdNAtzE7NUYwsj4zRTJaCGgqJUoCzYsOhYCL+
 4NCkrNbkEZIJSbS0AzGDhlW4AAAA=
X-Change-ID: 20260820-fix-sdgmac-f8746e3823f5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787235963; l=931;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=4xe9JdHgCBai0JGH7S0MmxJgvM0Sop7zHwcV6p6Mdp8=;
 b=a0/mk3vw2cDrDCh3N3xb5RpnXZy+PlXS4pMzL5B5MsHyFd5/98OYiE/qHXrJP2oDVRBMDgDeJ
 focdUrojPcfBG0yZEDZIyJ7hrkJoZaLdUz0mN4DF30pUoyrEJEipXIm
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 TRM lists the SDGMAC_GRF register file as 8KB. Adjust the
reg property size accordingly.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..d418bfc04097 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -970,7 +970,7 @@ vo1_grf: syscon@26036000 {
 
 		sdgmac_grf: syscon@26038000 {
 			compatible = "rockchip,rk3576-sdgmac-grf", "syscon";
-			reg = <0x0 0x26038000 0x0 0x1000>;
+			reg = <0x0 0x26038000 0x0 0x2000>;
 		};
 
 		ioc_grf: syscon@26040000 {

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260820-fix-sdgmac-f8746e3823f5

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

