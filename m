Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203595;
	b=J7RwPkToBiVXe9JfmwkolK3cUHRxF2uP7B7RkvuubCkvboHrqD87kg95x34Rg+4nu8WK
	 EKdEzp3PnEh/aHD4mxBoGM2qth1IwMdutma23yktDBYmhInEN+vUI5ncWMRPwGRcrnSU0
	 575S5AsjpeGULiFuuuahg1dscef+aDvryl9x0oSw1Hp68iVQyIJedqFUbdJgmU9K0cxUx
	 /qgASNtJ+/X/j2QoKdOVNZpRs22qpGhP/Mt+f1MTHHKWFB3hGqKSs6XaBQaaYNUY7IrKv
	 afpL6HRJDub6GGrhQyRl387CQU3SSi+S8zP0lxZcmMP41mL5NhhZm6TVOoU/mbRkcEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
	b=pJoQcugYet6RNGrf+d9Igc44eQdFZFm63eYPJpXt/MaLX+DWXOAswzJEesdXys+YOW4f
	 kdZxUe/y4JmRrIkPL50cLk2Ta4i74qQz4DOh01nr33JhUGZQmuK4Z7I5koYRtiTc0W8R9
	 YatC9y4PNLQ76bEnCb/uYvWTGo4lBtPMDYNYCNCFqkNVG73SL/9nmTtxr8zq2gDFhAnFs
	 +FahG1nUlIkKIJLO6mFMr3cxwc21oP+NSg+O1Dsta1uOOmzpX6vyDUdFhJq+YY+dhkIIH
	 qQGB+UH3rDFVrPfOrilYo0+38oHJgPlzKd4Qph+XFCKVg9Thu27NbYbtaO+mwHSFPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXdFDHGP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D960A3831
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4D960A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXdFDHGP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so10092385e9.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203594; x=1793808394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=hXdFDHGPmWU6mP6G5/xCluPbuMXxOiHWgSJSzoRor1apnhZ6GTaV0JsBTeQAFZjLWT
         hXcoaD6o+zXFzj60fF3YWL2Kol39gLchltQ0UMKtPhiHx8FMyVSx57FyzMPDeSp6sQWy
         AvncDceFrVgtuxOsJrJyauVhsBJFWKl9AMV2wfux+vaQgF5pVI9Jvsr2gcxCqK6WJ/6m
         JdE53dSwwfhbvdl7m+b0xsy2HHcOz8PaaKZKa/Q4X2f9jbCK+tMlk8KbxVMImq6QmZx7
         89F37MTUWm1MU5KU5fWm3Uty0yFUrx7dPNLw/DGbdPUgjzYpSQfV3i914kW+QqeyBauh
         oD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203594; x=1793808394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=t1VELegjmN3XNWPfbr3Y8MtmUE0sjxFEXHUMopjmgj5un8loTbOi9Pr1/vxfsb67WS
         Ue67ObEkPUaX4hDrX6sdLuIl7YMJYcuez/5rjw4ica++PtX4uXysVx5U1lBEa56vrCyg
         XljZpjKtM/5/F3O6l/awvhfXCSy+y8b8+8zrc4PXgj7NLbxPXr4iv40TUXUfymjmoxpy
         3z3Y2X0YpJrAYmdImffMb/15zlqKsrJFLvK8K6ADD3tgB51GHM9x/740TFICzYEkuR75
         08WQ51+AyWuoBz1cjxhCgNqtPn6czP6xYyHS2+n34s+H7y67aJbGo07QJBFNLkarFGsv
         W4Tg==
X-Forwarded-Encrypted: i=1; AKwUvByvnXGM4VSN5L9L1aVCw3V5KYCSLUO55FSAP5ExkVO6GIHrgwyhjfBOnPY/Xn4TPpbDE8G5l/7M9Ng7@vger.kernel.org
X-Gm-Message-State: AFq9FYIVX19hDDRKqqQsx1hCM0KbJR65M9NBdF/NURGSYCNFqK6TlnUh
	yYxUJFtn8du0mViPqtO1WDTFkrgVgjsuDJCF9d2iWsW5ACP8npAFz9CU3FwDhbeTnnWJbPawCIs
	T0C6gzIKEoA==
X-Gm-Gg: AYBFou370x6AWczZ9aJqOcFDRabzbtYzox8zQ/DpxGGmiJ12euNywk9PoAniT4KpN1u
	IUneAGy+UI8q+SkSs3EOyyonKLyKsvctNIXXvBQwF8OFuqkVFMpsHu35OmnTcAIK1sjgHXpdfP6
	rZYC68QKRxxGVf6VsV5aPJEI3sHEsuHevh8SnJGkvcOsDrxS1ut5+DHS7D5fXLI46bE50xot9nx
	ISMA5gh5rj9L56g0QICB1+hDdJJGnkVWsWsd0pOCCgNj4Atx15Vneh6AUEd4wjQuYjuTmPX/CqI
	0LNboll6BdtWAphl0GyPid1x2FPdWc+oJpvRCRvCFUcKIFb6vZyf89wSrlbJSWsagjuF9Hn8JBM
	G6sj0qmL2nKYrUstFe2JE6oN/1pK5I5XdL/y4LGYiw4TQ6BS4KFZv6DQpvTYa32Ewd5DUS5FP+x
	EbilVoJXa5s+oGLXIcY2EkGOFA0LHR0S3iENaugr7m54wwQEsDWa7m644T05dUpZU+E//wHL4xw
	LZl9XftgNXi/1dY7OZfzMTLB6IFyEgdut3NyBM0stdhsiiuWuQV9f933qNK723wkr3EZ6qi/mlN
	DoAj1rvLmqkD4rESTGWaS9Xa3KqDup5t7D+tFt+ikzjT+2tyrw6HZB5DC6vrPK6R3sWs1Wn6b9K
	rtuhwZTnVJXG+x99Y4jAqSNpQljgJca//VrICw7uB5CTonTI=
X-Received: by 2002:a05:600c:348f:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4a9643d380dmr62293675e9.4.1793203593792;
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:10 +0100
Subject: [PATCH v2 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-9-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1428;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=T/OTFeU/v/eoDvotZ5j14Er/J0T6ty7EyR4RK8RPU/Y=;
 b=tNkgUp3nDaJHGL2hMsaJN+z8EhlSjiujuDHYAdAC3akJpa5TYYAUeQyN7Hs7ubj5f3GxEPgs1
 rlFx3lwxv9SDGeA63+/JqJUP3QwhstYNTZkSLFqa1KBjtDWJh1fPc6D
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0

