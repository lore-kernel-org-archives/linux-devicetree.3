Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8803328B61
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779503444; cv=none; b=JSRYftL/piJ9YenK7Ot7kepYV2wRY1GPh+7J2/qjT5ozBdBAcnu5MmklRp3fG/2l4Ml6LC9pti89tbapO+7BC5PYdpw2NSomJc/M9WszDz4jkJM+NZVnuvFRDjHNaAgggZOdto2TzFvO7LF6LSHagTD6Cwnk2e0P65CYsupwjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779503444; c=relaxed/simple;
	bh=ab75eXWBcB5dHj/FlHKk33zIKemAgVJpWwAxAx7n/ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJ9TzZsGCJFl4JwZGDQQZrn1G7yxY/wd6MNWJ/FrDKS3Tek6i5d790OBaOgm4vBR0sVL47pn6NEjDoWMrJmfJ9oPUOPTvk6y1YM7TO0FPSBpKgstxC9XtVp6K/7JFrnGDlbQ/ZRLHaWeUIhREowHRh1pU8FMPmfe2eCfEvZzD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhkLS9Dj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhkLS9Dj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36a15ed5119so4166738a91.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503442; x=1780108242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uajlJ9IdqCFc/wQs8+7+c85ig5TZGgylUIfMTi3Hupw=;
        b=PhkLS9DjWD2KRfpJUNWzjIB0CpIz0N8yYAX5bJnXbSRquLvMV6VRBAosRXvTGWh3Tr
         2wLnK9CNgBgPyfTpWAEUOk7IcIwNGtYWO+twRiRDEj18heY2N3lw+oF/6r3UaTegShZs
         fjsMLAFVc/SEoRYVLLgKVQYTju6nBz9jeQ53kfyGMxxDZGY9a8EAeLkNVtOz3gldR40d
         Er+zGcSxKKUI4QsAL+kej3Nch+l1DAwV3HBo6NCqSCQ/QYD4hfRknU4ehVZaQxNee+XA
         Y92QCqKgfvrWFPa5MfwZ6n0h+jo/DvJH+jKH9/xZjmFPulRGxjLF4F6P596eDTIDadGJ
         l3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503442; x=1780108242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uajlJ9IdqCFc/wQs8+7+c85ig5TZGgylUIfMTi3Hupw=;
        b=UdXGItE3bGuI8VGjZ2HePA2FOVXTd/kupixtYx1R+KMW1NPGYTZGWjNEtXRyD1J/z8
         xrlMun0v5kzt2I8LO+PVGH7i8TQW9XdtRJoEiQWw9ZfmMs1jXkMpF6R7VT3Bc1HPZ5jm
         rwAqXbEcQwOympCaT9EuZI8+Y6rXRxBsmqkpIwmriPdYLm2ggmnLqTMW1pwZb4XJ6hkj
         f6+0AJltmMZ0DqeMya30KvD7SL2JCGTI758nC65BNoybN0pKeHhP1Uzm2w6d4B649iaX
         Cw8SapXixp5zDqYG0V7Ssptg3vwntGfhdE+LpdmdZaBs1QRsV7PsOrhBqDX7rI1EldxV
         J7Ow==
X-Gm-Message-State: AOJu0YxVkh47vBcwiTx/9dw6fYmO70WSmrrfGzFIxgQI6XwnCYASqcFV
	F1LoB9ixkJg7eBfyEIa6QAFP8vwRx/pAdbyHQJfqIt4d/BtHW4SyhRnj
X-Gm-Gg: Acq92OEdMuwvPODb6SKiaRy78/Anb5qunvel9fGw+oehcw5vaO4OwV1tIgdALcePMZR
	Y1efq7S0LgDg55EY3HdSLpsCtD9mJAYC+kqsTGJOwJasyZav8K+xk3+N9y8fCsxKoSoiy+47ZUw
	Fnl6a2YYkh3O/XzW9UoZF6wa6Kbxn9oxCnt8KecAsa6SzNOtddVzU1RWaBPWEnL6SZ/ENQxA/jp
	0Vm98W/mS0VcejN7wAdB/ncIXSPDdahBheVIoDJJnlw9NZbAA55bsh1MTf5cswmV0kc3ngRsPVb
	8sgryXymaMCnJF4hV+wQp0ARN8whZpv3uGqAmKT9TVg0x/jbArC2uTmX2ntLUOn3o/axCtbvmdA
	STiS4t5YPD07MrS9Nv5morKFPNSgG4/uc8GyhQ7OoZEwmwAePPWLsJp9IHXBELQcuhEpMltRt+L
	BCAyo65YkVxDDUdCoit4fhOukauVtXv+OcFP5QgVbUP+s7fhfwciu86uu4mhnvtnP3HSqGSgF4q
	W7e
X-Received: by 2002:a17:90b:3dcf:b0:367:bafd:9431 with SMTP id 98e67ed59e1d1-36a67448b48mr6109633a91.8.1779503441893;
        Fri, 22 May 2026 19:30:41 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:41 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Sat, 23 May 2026 10:28:07 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin
 settings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-1-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=2395;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=ab75eXWBcB5dHj/FlHKk33zIKemAgVJpWwAxAx7n/ww=;
 b=xF6jdZ4fIdGmdIfPmf8Wo8rovbwKz+ugVULJfctiEEq+ALXfJ/yVbnX1LAQXDR30lhljFcG7k
 9iKOifluoJbCZ/C7YCPnaoo+c2o+DYZKVu7o+61HIs6ONQSJUEevezi
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Kernel dmesg reports IRQ #44 being disabled due to unhandled
interrupts from multiple PCA953x IO expanders:

```
[ 447.047861] irq 44: nobody cared (try booting with the "irqpoll" option)
[ 447.063124] handlers:
[ 447.068176] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.087268] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.106344] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.125421] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.144513] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.163587] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.182663] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.201756] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.220837] Disabling IRQ #44
```

The affected IOEXP nodes are missing interrupt pin configuration in
the device tree, causing the interrupt line to remain asserted and
resulting in repeated unhandled IRQ events.

Add the required interrupt-related properties for the affected IOEXP
devices to ensure proper interrupt handling and prevent the IRQ from
being disabled.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 74c8c1772109..61dbef45f8b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -334,6 +334,8 @@ hmc_ioexp: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"", "", "HMC_EROT_FATAL_ERROR_L-I", "",
@@ -552,6 +554,8 @@ smm_ext_ioexp: gpio@38 {
 		reg = <0x38>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"SSD0_PRSNT_L-I", "E1S_PWR_EN-O",

-- 
2.52.0

