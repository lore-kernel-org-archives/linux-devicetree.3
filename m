Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B53AFCEB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743685; cv=none; b=IMk1e4Vrg9DmrE8lp0F2WEmBUepmpy3GY/iucPBX1NeEMuMYKeLtWSdRzcjwTM4t3YIcHKITuv8IyGl/2aT8kzhI5r1tIhGaYGq2Z/q2ezH756XHdeS4hkamF4fhEoHCQC/PUVAXYLma/RIfwwWrx1W+qbwSgVg30lHAUBDqAxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743685; c=relaxed/simple;
	bh=Sif3RbT6irqG9XkQFOWP9DWyVli2Q+eQ/Lo/LxsmoD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8vzcQwJz047o1ZAazs0dRPergu9g893soniU/YCWHJALrEa19E9qT/KqcDdumCXQ7sjnFybCoqTd7/GHBdWehxVjsYJLSkozvPNpA0i57EZYep4sZx/uxIOMmnOYif028r2rkrb5IW8pG/+/vL32Zh/IbU4eIVqZMygqIGpH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TJ0G4LvG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TJ0G4LvG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fdd674e17so603262f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743681; x=1786348481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXf3pmqi0LuFkHaGKT6fPlR/31eLp6/vBKgBsz2saXQ=;
        b=TJ0G4LvG9ndK+kAc0zqa5PaqCXQN1yTmzY4bD4nQT7+xs8wKsP57Ke1UzQt1kVu69j
         VGBHga9GUis3utTmNbknGsL/xsQ9zMlOHpeLwyzwl/yw5ZDJsrD604VBcEa9XZYVSHJk
         6pSy4kJ4+/+LFP3X37oMeC3JdEI2Q9ZkJFsgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743681; x=1786348481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXf3pmqi0LuFkHaGKT6fPlR/31eLp6/vBKgBsz2saXQ=;
        b=UlBozx/BStO/mCJxJwmC7CB02NZabT2evQPLbaKpR18f50KPcCqS3hAhKameOFRDGO
         DATPJIC9m55zfpQQg0Wb3P/5g/ZAfSs40oX12Og82oJ5TUdony3EVEh1PqOKb/mZuYUV
         jFSe4kSAEUx/ZTmCfF88Rn/uFsZw5uek87e8rNsnedtBNeI8oE28ZTLJJuIJ9q8EJlDp
         67baFezKAnTo+zYpTGFdYJVpAEp30eJQ+lTStcwlOsUDR96z4REtImO8Spftr6sEZ+Cm
         Cs02KQ9pQmHEbTq85BbPt/i6aPBwIJdfnUoclWJ0KOU4QTtjyVx7aEnlE8rWKKKuMyKc
         ZlKA==
X-Forwarded-Encrypted: i=1; AHgh+RpznmEGanzg9oIjovPRP/ax+NaKwJFcDM/dFjaWK/u1dLVD9JSgPC0fmWZsyWB/1qLnEpjVnsTDc19k@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTjMvwbEC9VeW53vBgRryKVXJESeqGB7QQwAg9AcMRLtawASG
	3ZRResgdu32mwQPNx7DA0m59wxv6i/rb9EkZaNMbhxT6jan9rKXDMtdm7S5uRYArt9I=
X-Gm-Gg: AR+sD10U/DyLcPm5BNUwZod6aEhnlTa5a0ifCLw3/viHtf0FKyFWPZGhfsKpr2oO5ko
	Yz0WHygXKDoGZo0rTcwSrYr6XdAn1rm6kSpGINNumzSAirwMNVp7sm6vhSNeXqKubfdi7h7N9vZ
	e/wCA87r2mcqp3yG9j3Gpr3pkpnk052jhhydtIkqWW5mVkAJVD3CMj454VXGmA+ZCNYtrZERiFg
	Nzm5jhCwB9DEVj6UFYFDR7KbiybKLnwey5hLJsZVY1lE7eZPOplU2WNlY+Nc9OL7Ic2j+MWj8vS
	9wjTx+knFziajvf4FSPHVKEnpNa0bYXllmG+ZFD2D4pyHM6M32LhV5XgP5wIw1y/x+/JvhReUKZ
	VvUmUrwmlJCqtehdap3F51W1VPDB4Xkjl8cl1h6+gZgagZeWoho8ByVe07qDE9bQXkb0LJgxUnR
	ixE26LptO9O7oJl6UPx/5+uaVgvlh6T6GnyJ4ZCp1XgTgF/uvtv9hC0SEAVL63GKThgbmV93bsx
	kiadodSVfDF879OqpMURyYb/UcdM1lRb4eqLtsgVTCEk9wwf7fPXYrYuIzOGiGH+JuniYi4l1CB
	SXbmG1KllAbAfer2yAUVsOwi7kPUWCuV2utyVrR9OFN45F6kJ8uW0Dm+4IYiXaRi
X-Received: by 2002:a05:6000:26d3:b0:47f:93e4:5389 with SMTP id ffacd0b85a97d-47fd72d4a39mr20707280f8f.20.1785743680715;
        Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Mon,  3 Aug 2026 09:54:28 +0200
Message-ID: <20260803075435.3825122-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
References: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32h747i-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..845d13c61da8 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -732,6 +732,10 @@ gpiok: gpio@58022800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clock-frequency = <250000000>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

