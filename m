Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDDB3A4F30
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525845; cv=none; b=K0UDo1toNBGTcivk+rbU3FtLQA3YCVL2LbPvHH8zIe4hvphs5QCtgEDV/HD3VYHbEqvByTvVDaGKW7ttzHnC0GfWtl52o0/5haHEiIH4+egUzY7CEAlSLZ1aPwYCxvg+ciCTIqr3eZSSn0Il6eiUXKxu16c03NIGf6MyTz4h7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525845; c=relaxed/simple;
	bh=UIJA8tptL+r22YrLQm5pE5mPfFlj4ABDgWrCfL7IYR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyZbqI8WsLKip3+EPBVgUjxe+4FKLLfIqwIBqGpnI77M/t5DBM+ZG3QvcQQYROQ9HGjtGRlNUbPOBNsVBH4WxZ4ydfAP6+ZPejafHVVEzGWRDRSZrY4dW35Mq9oiDZCkkUYGgpX+ZT45AuIrM12cVhmADNpYHw1bXeScghMIiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HO909w+C; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO909w+C"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caea3f742bso116984415ad.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525843; x=1785130643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBC9wGN5WcqQqnbJA19I3YxiEUTegSJ8uL/Ced5d0n8=;
        b=HO909w+CrObituGzsAqKs8DA8tAjuzgyTz3+u9JkeRFYCnyE8T9Gxgr63rvqhKUvDK
         YPUBD4/2KbaIYtX6AyyTHzjjkXUe9yygXms/CZO15WoPLLLCZnOQFAtvLPlQA4lfsZu4
         35C54LGEBkIVqqI+ijCi9jGsmvd5crNU02yf1Yz2QH0UxrI8H2sb028zgcJrIxUPf2hM
         s70GyMVm76RcPPRK9FnUsPrzjAR7FTIzWQTKmeXwnO2LOsS4vODR0+maW6RFCcwermB6
         epqgWG0e7ujqmFaoad4loI0Se7DoqSHfwev87h3BPKFTxm+r7cEBYS1JRvDGH3fenOF7
         i+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525843; x=1785130643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBC9wGN5WcqQqnbJA19I3YxiEUTegSJ8uL/Ced5d0n8=;
        b=eQE2uKZZo5J5AP41gzhGWRoDNSXhE3A/qK8WjSJ+g8fCNbP4aE4NrRHoGzXzdlyL6+
         u1CwWHZ1vgCjs/QAn1Op3uCOuhPdmMZizUZ3JbyC9pxE/P4FV17nRSB87J/YXGIcZCaP
         Y4vuJeiGdYnS1hWy3hAK7WAxNl28phE9flRMlAIbrmvbdhzlQ/sAJqzHpujn8hLE7vob
         bUwbj02fiegFaJkpW1UUhqmg0KDmlRsshk6ETN9/ED8lcyrGmT+qKw1ZJuNLKtu9ghac
         tXVtHzl59eG8S7ng2kPWSWGmfV+dKIa+KLd/2CqyyCZ7hb7bwc/dNyO09SGerkOak1zL
         SJ+w==
X-Gm-Message-State: AOJu0YxMTg7x94LqKmBShiYiEVi33NR2U7OhOhTzLKTGIAFXOGmU89Q6
	RG22gLbSKicQLeihqq3oGUQTfkx89FFF97X5sB0JYjH21YtxApPppJfB
X-Gm-Gg: AfdE7cnKzF9TOD3J4tNX9v1iyKpPTWnr4b2FlOir0sazKwQPXKAyp86tmH/1tx9h6uj
	v4UBNWYQnONkqTMn4xnz4PaRq/Am2w+Yi5OWBP8YVUkAEQlQnO8K8tKVx7bMobWBoW4VPu35qN+
	fhSOhW4tYc6eXILqulXHTu4+WrzRuzabwQbXQP3ZKhl6V4zY1/kbUw7m0JQ/5EJZ7/fxC2ng5x0
	clVLesW0gIWVLlkkuNowdI+PMSIEhwUBt9oCeq0tykWXHVktZylvXTCnvq4FC4K+pTQlCDEwb8D
	IjVm94gVTg9loF76KfXYXaPyRW78lI+KSiJlg1Of6w71AdPdQeweMsquR3TXdSqyiXNUKiQWziC
	7SwH9rBAmqpoxD58cjJpoAGJGxGfopUZqfSo/CINs2juAuAZHuiHVkF/XOPUUpDM+tnKox5lQ3/
	Mpey4uomuXY0vxE5HPV75rDLSiyvd0nhxWJCEbe0l4oc0XsAglQqhj7gFwqD5fHQz6Obx8WEKfQ
	QUA
X-Received: by 2002:a17:903:19c5:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2cf348f88abmr148382425ad.16.1784525843148;
        Sun, 19 Jul 2026 22:37:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:345f:e51b:3d0c:4546])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm34224663eec.30.2026.07.19.22.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:37:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 19 Jul 2026 22:37:16 -0700
Subject: [PATCH v2 1/3] powerpc/dts: mpc5121: Move GPIO controller
 properties to SoC dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-ads7846-pdm360ng-v2-1-1198bd108502@gmail.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
In-Reply-To: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Define gpio@1100 with label gpio_pic as a GPIO controller and
interrupt controller directly in mpc5121.dtsi so all MPC5121 boards
inherit the correct controller capabilities.

Remove the redundant local controller property declaration block from
ac14xx.dts.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/boot/dts/ac14xx.dts   | 13 -------------
 arch/powerpc/boot/dts/mpc5121.dtsi |  6 +++++-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
index 5d8877e1f4ad..05fcf08df1ca 100644
--- a/arch/powerpc/boot/dts/ac14xx.dts
+++ b/arch/powerpc/boot/dts/ac14xx.dts
@@ -148,19 +148,6 @@ clock@f00 {
 			compatible = "fsl,mpc5121rev2-clock", "fsl,mpc5121-clock";
 		};
 
-		/*
-		 * GPIO PIC:
-		 * interrupts cell = <pin nr, sense>
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		gpio_pic: gpio@1100 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
 		sdhc@1500 {
 			cd-gpios = <&gpio_pic 23 0>;	/* card detect */
 			wp-gpios = <&gpio_pic 24 0>;	/* write protect */
diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index a278fb7b9e71..9c5dacb94b92 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -146,10 +146,14 @@ pmc@1000 {
 			interrupts = <83 0x8>;
 		};
 
-		gpio@1100 {
+		gpio_pic: gpio@1100 {
 			compatible = "fsl,mpc5121-gpio";
 			reg = <0x1100 0x100>;
 			interrupts = <78 0x8>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		can@1300 {

-- 
2.55.0.229.g6434b31f56-goog

