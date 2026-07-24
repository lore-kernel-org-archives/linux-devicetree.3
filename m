Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B663E2767
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884617; cv=none; b=qHethyeEFO70Pulficr8JeVApcFsBcqK78McnLNFO/pGUuDHQ0tlgeYrTuhLrJHh7CfbPd9ae/N/k+NpLrAhYwUWGs3uscYhTqTBhxGOAl/lIDdhAVu2PzSnSHR1RKOir/B6jtmfxwwJ9Jd+oTCxSwtk4tIQFNNVD7ZxW7sfZGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884617; c=relaxed/simple;
	bh=U+tsQLnWyDRDHVr0CTIeZd5q+U3+1+j8XgyYVIUKJgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuuzVHYGfcOgjObcWTEGfYmpEhVfGR23padEJL1ih+Phpmode5KWXZQFG+JdPQeRzrI4DgckaJkrkmXOWWHnReAaVVBB/hIFyB2mKyZpFM80VcYq0rdW3g5MoWmYyyfu+PKelNndqn4b5rvNFM1vmp5aC+szdBoN79O5XWRXdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiHKqu4E; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiHKqu4E"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7a269ca1so465455ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884612; x=1785489412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9LXkLmF0QQK9cYGRfMDJlE9q0WVIrmOfOlOL01nvng=;
        b=fiHKqu4EJGgMHXnXp6L184mZxNrGM529+npVMBSwneTqJs3z5ODgKim4QbW3zL/J+Q
         fLu5DSa/BY1tYyp4/ewjN7zLbhNefqQAoeVT0YaA6Y5z2qa0J1D2teCn6ugkHO8IGibn
         XfVKtQTQc/Zw4oVuE/DA1OpZHcaxo0anDP7rjPOu4rx4+AsvYiMecd5uGHYfmvwRM/Bt
         gW8QJJaxe3b2qbIKJ1JUH7HiD2tpSOkkNC+mPOWX9k6jEqi0LFrLhznGhEwAUFncWAJp
         6g5eap/lOkveQyAZXo8K3O03onKmCwjBR3bhVbR0324oSeO5YAh/5kbGlsnhJ1VsDVQ3
         a5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884612; x=1785489412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9LXkLmF0QQK9cYGRfMDJlE9q0WVIrmOfOlOL01nvng=;
        b=h9lI5uAi90nqTQnvbI0kLyox/RVr6qFp5ItwJdKeZBFYw1MgO7d7dhSvrSJYeXtDuK
         NJGIq0UPOJ4PPzkeeGuSIQerrrBUcDpLUgxrBm0Z4QW1NnOGEeDQO9pIiZuIVKCd3DEc
         jtYKOPlZ1ePhkPbDYLiM+0s/6S2Ci8LkbSi5L/lTokbwnFqV+Sh6vEL/qF1JHGw8cpto
         Oo/13ACTkEezuvUBTIxpvtMnf0gNR7ikv8/nVQ1yLKFvnPNkJE/hec1CYQ3zvxbCt6hm
         mg4eryOzbHF2BG+LjB1A8u0VYv9c0h3Z/ObVH10zIs7VrKN3fjS/rGRRkFnO7OvdTzKn
         cSuw==
X-Forwarded-Encrypted: i=1; AHgh+RrDDTvzspVNe4Vnl1jkN6n74dZmavozoyoYtlqjAEvDaJDluBcDbFEFwu9/d5ggeyiyzAqiabiRDiXd@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6n4IwvBMghCpZBaVR8UVPxtvVRp67wiBoAibbE+Ijj62ZxDx
	Uj37aVW/L+pQRGynXTpbQ7mqOx1JQ4rwUKQJZQljUmcXJwsT6iBsc7uV
X-Gm-Gg: AR+sD10R4qOfFS3AS0N0jj/KnMzUiiOQD/p5/OaP4OgQAMfox1ut3OCoR2plJ6pc43n
	fqr6scw8ttgU360i+8nnLjk2w5DO5WWAD3jTKnn/QjwuVmRx6Hx5PDJPaMq1qsXtFP2oUkFTU5o
	dnnnxJ80SYMIjkREHSWMMdWKhy1VA7oj+M01EuZCTDRYGgt2fIWUkd77jH6Li0b6VMLOnsOy/Ta
	AluKlP8BgvpNdquxAF4s/1U4zmD4iIYMdFerqYy+nJjvUh4/VSM+q5LDuR3BefA3aGf6gtA7CGr
	GiEMW5eB6w8RDHq8gMjm2P6DB+bLJH6EIVlRfuikT2dUbhFKOOzuNlRoyoej5UxzKlMWtg4rbXd
	WBtRioL/cpLLTLDjulg1UzPAn9/c037uIGqJcqYQNQmeCfWFvj3FJLNXt4TAzefSuOd9dO6WNlG
	jh0ndb2zIR/qDXWSs=
X-Received: by 2002:a17:902:c407:b0:2cc:9d9:b8df with SMTP id d9443c01a7336-2cfbd6c2190mr26012725ad.5.1784884612321;
        Fri, 24 Jul 2026 02:16:52 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5420:f772:24a9:f23f:ed43:a5ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df097e0sm29005610eec.17.2026.07.24.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:16:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 24 Jul 2026 14:45:53 +0530
Subject: [PATCH 2/3] ARM: dts: ti: am335x-shc: Remove unused ti,no-init
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ti-omap-rtc-v1-2-ffef78853cd6@gmail.com>
References: <20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com>
In-Reply-To: <20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884567; l=689;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=U+tsQLnWyDRDHVr0CTIeZd5q+U3+1+j8XgyYVIUKJgY=;
 b=qgIljkvJo8Pw538QpYi38SdB2bfoEKRFcMhduFDIDBZgFEnXbar8/uhoB9qVZXaWC4gEZQ4bS
 9/A5kB5cGYjCb4pI0AgRPXoaGYRJCRcr/1P7JoTKap1wx1zm0tqUH62
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The 'ti,no-init' property is a legacy, undocumented boolean property
that is entirely unhandled by the rtc-omap driver.
Remove this unnecessary property from dts.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 597482822608..2b946823928f 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -241,10 +241,6 @@ &mmc3 {
 	status = "okay";
 };
 
-&rtc {
-	ti,no-init;
-};
-
 &sham {
 	status = "okay";
 };

-- 
2.55.0

