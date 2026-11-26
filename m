Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660744;
	b=2UMsytr2CB/LFpABoFLp1DB/kb6GB8h8qZgxXSLXxi7zsj7SbPwGyJZJZvIMSmWDw7sq
	 4LP08gxU7fBX9UjTXN7c2Bz1YYukgln6QAV0p/iMTkjG9Lb7uYaI7M8QqNqpVHM/L5FJm
	 YonfuHidWLgZNjKorhDqPxdxIQ1FHa4hVcsXhkhuNWDT7FHM+YT4GgkVvoGe1MrNQDL5Z
	 oQYoc+RverJpyGFBvtontuHRjHIZ7r1aO+6TONiCL5gbZcnZ8N6jp8LXf7i1/PiPJc+HE
	 q3WomFkkKs8I7gZxdSxtVOEJHQxJozjcee4Ts9IyjFJ5ZXFBn5SEcBXB17XtCBAasrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=;
	b=k9NqTtye4sD9HXaqI72NWF0Kc1I5H3xPekk01CwCx87oOuOjxOFBnMwNuGXW2xeiJGUm
	 nXKYzTWqecEVqS8M+UuJEhw3RxFMJd96H789Q2QLQgs5OsEH3UTzl8/JBka0R0kvUZQRK
	 VgxMRJvarFry0tAZ7tQDaRdsQq54K2MCVNK2xQ6d1k0bveuM5CDp0uh6rR6/cG2tyHADu
	 Jmg4e0B7lpHArWHROE1lX+a737zLlXTo/XDniF99YB8+Gk+OgHgTBPT8jotQ2801mEWUi
	 rzgqpZFXX3o0kIYu3MbK2ZusDtlY2BwUhjzQBR2umR9VoZfU77EeEY9x2Y1pFv+Lriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCcm7T1C;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6933606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6933606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCcm7T1C
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3268584b3a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660743; x=1796265543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=;
        b=UCcm7T1C9+dyLnr6D5qZEcx6dLqreNaoj4zfV9fGDVNAaNdmJ+WCXsAgXSED3RG+9n
         zDlA8Hx86UvaakPbJ2cwTLe9K7xc43z+chbngckyXPZ4vcyeypL+tK2sCqCCuMdegbsp
         U3yYE9+o3ZiAYuygI5HvvSv2REujn6HAm+TG6NvFZEile+CVqhnUT3PBh0eZpEUVso4o
         keOdNkFTeI8OeEs80VsOMVRy7bfz2rzxjPSbxXVtbhL5lLE2tRrQGeezHoBzYP2zrbH9
         OItuk0qfWEy8ZWmmzKpEbWcKEzzQKbMBN+z8Mo9CFDgSVW0SLvIzOn9xO3p0eN/eMTe1
         lehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660743; x=1796265543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQaio9L9ug+jKjYJ3hcWUzFKycXEqXxJ+P6cR4tntRU=;
        b=lTMYW4TPPAAkVA5/rEYHqW3RB8S7pHoVPgQ0LbQi5F+o/T2f8OJbEhwdPEc7mi63NN
         niVZ3AjQ+2wbSsRSPb7nVvi2mT06RkXambhysgL+VwdC3kmpOkj54V/jRl2Skk4/cMmT
         8B41tvAfalcF25nsbE6QmWBEHowfVkA68faUdXTU7sgzxxjPLYN5TI9HD8ssJ6WKmN+I
         whnlKPiNL181Bira7rK/qRwNMf9kMnzqzrH9CRtVZy3GBlgvuWujdbhNCLsvGFMsaEim
         1EEdB3F7/AtffmsMkHZAwwujE3HEg9i/U6W6WVQCswV3HiB4UN+cU37FPb+9USqZfJVO
         yKLQ==
X-Gm-Message-State: APuU4Z/hNdfocVlGAxlBNugoKnfBbx4DvOguNvh1tth3BrK/vUdLA1TQ
	h4N+Q2LsAUslw4dlYjC0xgCv+oBTeJj6yt5WKEZg6Hlc22id9p/jL5+l9+4CSA==
X-Gm-Gg: AZFdTZe80TZsERxx7FcH1Z/7p7aC6/V8WAX1vBS98SsAUlu2ySCXiWZtGGOyI46SkOH
	ExDlFhfS1Dy+ExnNixI6fs/niPU5xKIaGr0qpp0o+wANhnyc7I9b2o+5gcpQRL/NZd8XX2m/1mD
	hSr7akaUzo0Hg2Hf6KlIuZx9c/YMggI6ILx0Rc37AeuasQrBPgjml63xhCeI8tnKJNaaQTydAFx
	+fiSpONzdN4+7kwb2sYNCWgWwowF31G33XzoHRg6suQtcBtvMFurtZI0h5+LggDcUcgDLb36YTM
	LHARsdvyQMH0WhMUrDDH5VL/kPipf5R9KpLPGvqr6fsrpVVXzxLEcIghi+tZzbvVXdx/E6W9FGQ
	GWxnzZjB53K23zTAJ5uS4k9ToeQlC19V/Q3l/M6SLcZrGKGtHn8LUFO62GyvzUJUg+tlK+VBcet
	IG+192lJUVU3HuTqMf23q9zzOlCVPwz1LOOVbvZtBkCm1jbRMDa7QrqSLI+QGC0tw/cUKP2UemT
	dXBIn5S5grZJ9JZty6ffO18Jg5WRiu3aGjaP1skl1dF/Abgx87eKo3KapDz7Hu482z9EZm8bPcX
	tHtBruVGiBe/HxiDNlWHZs3MdalysHqKLaP5S1X6leU1dCgW9ALgRR/ugI3E7cLNUoqPvyW34+6
	lbcJXClIKeFgvzvZEX4CYM94Zha9EINGx/4jewFSWdaVMiDwa/w06jt9/r7Da5ednf5KBEPjm/2
	UEYw==
X-Received: by 2002:a05:6a21:3983:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-4014e74c103mr22772772637.65.1795660742975;
        Wed, 25 Nov 2026 18:39:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 3/7] ARM: dts: helios4: drop the unconnected EHCI controller
Date: Wed, 25 Nov 2026 18:38:52 -0800
Message-ID: <20261126023856.767961-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both USB 3.0 Type-A ports (U4) are wired to the xHCI controllers: port
1 uses USB2 UTMI 1 and SerDes lane 1, port 2 uses USB2 UTMI 2 and
SerDes lane 5. USB2 UTMI 0, the port of the EHCI controller at 0x58000,
only reaches the microSoM B2B connector ("for mPCIe0") and is not
routed anywhere on the Helios4 carrier.

Enabling usb@58000 therefore registers a host controller with nothing
behind it, and the VBUS regulator was attached to its usb-nop-xceiv
PHY rather than to the ports it actually powers. That regulator (U18,
RT2875) feeds both Type-A ports, is enabled by PCA9655 I/O0_6 and
reports power good on I/O0_5. It is already marked always-on, so it
keeps working without a consumer.

Disable the EHCI controller by no longer enabling it, drop the two
usb-nop-xceiv nodes (the usb3 one was never referenced), and correct
the expander pin descriptions.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 20 ++-----------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b87e3f8fd12d..b86b85e9d0ab 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -138,17 +138,6 @@ fan2: j17-pwm {
 		pinctrl-0 = <&helios_fan2_pins>;
 	};
 
-	usb2_phy: usb2-phy {
-		compatible = "usb-nop-xceiv";
-		vbus-supply = <&reg_5p0v_usb>;
-		#phy-cells = <0>;
-	};
-
-	usb3_phy: usb3-phy {
-		compatible = "usb-nop-xceiv";
-		#phy-cells = <0>;
-	};
-
 	soc {
 		internal-regs {
 			i2c@11000 {
@@ -156,8 +145,8 @@ i2c@11000 {
 				 * PCA9655 GPIO expander, up to 1MHz clock.
 				 *  0-Board Revision bit 0 #
 				 *  1-Board Revision bit 1 #
-				 *  5-USB3 overcurrent
-				 *  6-USB3 power
+				 *  5-USB3 VBUS power good
+				 *  6-USB3 enable
 				 */
 				expander0: gpio-expander@20 {
 					/*
@@ -268,11 +257,6 @@ sdhci@d8000 {
 				wp-inverted;
 			};
 
-			usb@58000 {
-				usb-phy = <&usb2_phy>;
-				status = "okay";
-			};
-
 			usb3@f0000 {
 				status = "okay";
 			};
-- 
2.56.1

