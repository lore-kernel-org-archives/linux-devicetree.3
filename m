Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF63C3F62
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130341; cv=none; b=MVJ7t7PlOuxOQRWZRSEmcxyOJB8U6z/R/RY+QS4mnT87urYiNuqSRnnL/Be/67cJmrOTJw3JnFYPZsdTOmVboCmysG4AXkUV6dArJ2y6XEqF04+hhIGXimEmrrQVbaJGd0l+AwdJEn7BZgReIIDovFEoCkdSNwDS/Yf4YWXtAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130341; c=relaxed/simple;
	bh=Un6VFoUzNIA1zX4fd2jPLpBAFCh31oplfjJyQkX958w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I3sFvCGBtVPffVEdXSiuM13aEvyH+2B2+uXHnCRGyDmCWGllZ1TlqKESQfrPLZD6sHQOvZZyOjxmGHG4I53Ioeo16sPlfoOW+1bC4unD0wYMzjaVXyzzXlIwb0A259SKD5UyFgC59eSnUvG4+HGMZBDPfrcvJAJ/81Q0BVXE9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/lvRLzL; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/lvRLzL"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so293591f8f.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130338; x=1791735138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=b/lvRLzL9wY7KRlaEBGmSDQ+yerfsVZ7JIhMRbaxRg96hEI7dsAAu1+RnN+fHEKFXW
         pYaoDeeVnOqpeZDEij/giTi+B8s8Ics5gg3M5fuORxkdHX6a6f2OkjtQVIta+G+8rCYs
         ORR0IW8THHj9MfeKsJbtpgmXy5/kQppTgQQdXjiJHu5mnXbKg3JbCQMkIHR4x2Hox5m3
         GQbsgsFWiXx4aGgdcNuYBFdObuR75NRsqtPciF7HHePgVXMjevoZWiHLBULWVp+j5+EO
         HILBiFiYa2fSan08ed6zY4MkCflmMKmePZbGJZhAWEVSgyZ3xvuJTvqu67Xw366ESQEn
         pAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130338; x=1791735138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=cH42mxdiLdwe8yuojX26xOEp8aitgALDkCJH/U8EOkzzTjLzCFo51rVR3Uhs28abu0
         JIZ+6ydY2WYt+kR/foNWENEyi6L2JX3ECIZWydhzDCgVcdWf/7ug4RkhPwe6JtWaepiA
         tT3Lag2wWApKyazUZDzYlhgn1aYQq6iqmRWLzvC4LiDm+S8KaqrrQplrG8EMFr313fNk
         jZD7UCTF6YdgFJkfHjXpoH3PHhc19XydgU6TfjFFl8yazae9o0Y6NiVq+QixfQZ21zkP
         H4lCWrKHJiEiPcyiWoY+Q/w02CJok+5Aqm3A4eezbI6uF4XTc4TYpXz6USe+ZFdMCUmZ
         fzsg==
X-Forwarded-Encrypted: i=1; AKwUvBxmt6jAv18tTlrx5louW4+r/MQlDTHd8/Stu55ZtHooBzHjL66lrtaMny3JVnmUiGi01NErxaqxgxKp@vger.kernel.org
X-Gm-Message-State: AFuF++mNLUgkOsxsdb5ZdwJB6uR/uFagfE231YM1/icJofX/eg/2l2H1
	t8YXVruwgMw3euXduQY1gIuP324rsvHvNNccQTY2rUnV7NzxkjaVwPPu
X-Gm-Gg: AYBFou3sNGoeurxdAqVqh3lXoixRvHTvJVAYQs6fwHYpGrR8H3xbX5fFucYSuBKztBz
	RvbhGaDSJ8tTWld30VNBswjgA5SRBHbC3QPY5hksKSfMb+qSN61N3zcPHw2UhfcEEuvX+RctBlq
	5DPx5fFiPxUw6y4O3yjfyg1im8wQHgfloNJ3E1rfRo2Q5a3Ali30sUZCo2c74I269K/wnJ+CxG7
	h4vAeZbKmd0bUxfdUyCnktpxbgNaSbvgLEKg4svNeCY+sO9dgKm44s94V/VGa4xtGeIuVcoXPzd
	2vdKiMtP/4zl2vIZ71Fj2zxZey21RsOubEjVS+XDSvVq+6g4EmbIST2ZL2ANBOnFC3+I9xMN5e5
	2n9RTRkbRLHQX4T5OgLQCPYoBpNZXD48YTneONGHadI72PfGZc+pJc7lzIPKZZhsNPaKprWFfc0
	Sx5kH/MQGdk00dChNiudp6oP7zh6WGenMkGo6d3lvzQt0WavTHUvli7GDz9t7A3xiXDn1Xm6QtC
	IZ2ib+QvxJkXMsX5fxZJRzfj4maYRXu65cleQ==
X-Received: by 2002:a05:600c:474e:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a0275758a2mr164184985e9.17.1791130337513;
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 1/6] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Sun,  4 Oct 2026 19:11:46 +0300
Message-Id: <20261004161151.803563-2-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

The NPCM845 timer0 node references a single clock, but its clock-names
property is not described by the timer binding. Drop the undocumented
name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 35fa206..ab8a01c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

