Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342689;
	b=CllUNTX08YKfa9RNOTdQo2nhMp0sX4+B+pEYXD0YflkGF8h/YiQgwGzzrxX1NMHTZXJA
	 yBmwsMjB6ROmIdwWil3a4Xc3dMBh1az7r8E8hg7dr03LiT1utobsiUDDc8+qxzrepZtaK
	 3z2T7aiwphdEv+DZtQ81q/K2K3iHMKC7V5JyDcJtCkocWVbPomVEa3JLKBqtURGStNZfo
	 MNcypwf+8Fd1sOFLfn856AHqMCUlUCLMsxVXTM7bfzJ2rP99l6DzkTdYJ5Lt7bisic4UY
	 /QIg9Ij7H4v+kAFyoOGNS0ib7oaQaXuiJ7mNRvzrdIjky3popzxhbJpodVJQ3BhOORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
	b=jW8+mWCg16XLWtFjDq6uabRFRlbxzhPr3Tr9XbtlKpLx4bbJcbfJGPTNV6yr+ozQ+rLN
	 mvJUdrjv9xVpcNDbm2rp/JqEsZk3ZS97MXlL2inQH6REj+WolLFrPZl5dTJ9mnpVCGlhY
	 WCVBYLHGc2VMzCRv1dKpNyn21rDWhBsu6JcfPC1knl2IfpAwdYvtCQ2eUVAD5lZOgWTU1
	 wngFLoXtbTYBN5iQpWW7ptxlZOG6et5/7LT4ssraWap4e4vYgavR/ineFGcXapCWsEMNR
	 Ik8KkPHIWJB/8HPeVhGmTMZ8XwCkRSeo9Y/gB5TKZskTcbH/keEcAjq0BbAMNzseTaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMsJbyIZ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F4606A338
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70F4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMsJbyIZ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1955350a91.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342688; x=1795947488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=zMsJbyIZCUHEcHpZAwVHTDluKJwKBGdzJPPBhb+QcTL86D45cSOV/YULbZSxUNOegU
         Jnu5VtLmCfpHaJbhjwxWnBE6iJK1SVZbgwb7+e5lDNGw9QwiRVWRj/T9Uoe8Ngmcdbeu
         PpFF0A11F3eA+UaDNNYdgAVOoW9Hi2BkLaAb9nQIs3IEDi44GmyAvwBD+eyC/m4SjuwT
         K7Dkqkvqtey82M9j+qJxcZh7kh9EaK12L41EB/bBxlQGnteESbP/r993X/e10VgSJT/t
         EXRPdq9dciXamJek6HMa4xK/AAMfulddQxfRh6kOw9oHXGjL5NdqNcvALMlX40PvAmXO
         +L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342688; x=1795947488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=1vfG2GA7Jl1RDlnq4yJhxlJAFAJ6y2rBPKvlQZMBMAqRsjVJWM4bva0kkP+X1298GD
         AL9wNUaLaBCxtgYf6XiwJ3iCJEot+Dnn/In/d5JqTHkypM2eJNs/hU8hdl4rqvY76br/
         /bL9YirBgA9AltCLC813Rvr9KuCcfy4JtA/pYiEMGK9AQ5x2VKs4iM3v3NdfuLDAPIok
         JqJFxoC08V6zBtypWhSUONl83e5VQ1Fj2pj0JBkTZ9BnvrM9EuULaDJGGbpShpfG9cNu
         REhyicULX8BpCaFBPzhZ+Q9B/k9A+zIhWS6+3Sw0AlhKV0ca8jAUD+TjVQjtvOFeC9/7
         vQjw==
X-Forwarded-Encrypted: i=1; AL+hErFOKLgYivK302uzFl6a1jwjTumsSNHoPCpfqZMd2aie1vb0GslILHROzmvGD+1FSd9JFKfL7m+IfU72@vger.kernel.org
X-Gm-Message-State: APuU4Z9iF0K0UCAxUl9mSbGtD7Vh6/0FuNVG6tYJXOmU6jbv3QmC91Ko
	pEq85IsypG2SclbmpFPrfeVE6zhmaneDkJWXIRg1V5p+tnOcMHI2n8du
X-Gm-Gg: AZFdTZdvVOLrYBnrGayYCf8B5JsY5Wxsjvlh8q2D7KT4J72DZd7Bc9AlaUOaxh7Sk7R
	N2N1yYxvPbXK17fRFS6Nw0Yp1QH3ks13Pxm2g9O+s2WJM8wKaV8qMk+YG6UwPxWM+6DvXsaajyh
	Y5M60/O3moCvty82l1r0+h15+3glmco5IMR31VVMMWUn2wLvvxQwE0ojS+gM4W64NcJTproc2K/
	rEu0lbsPLBIvbqIumY6PGmJOfWKmL/l/7Xd9G73qOBCDezMUeP8G40x1dbNoyFtKchij+Ev3ZkO
	LHVeQdMgi2/eNE4tn07+knp4YX8PTTkagN3WT6l88JLEEePphtxE21gLp4bVVbqXYkJZFNYdkRc
	A8cnmhb8rIQVw/HP3glMvBzRorZw1OC1t6tCwpmQd03XM+h4IF/Pt4l0cLOykNLiKjYaBIaS24v
	Y8GP8XAmfFsNCWYsb9dTQzssjOByN13YXnHWnNDMq3ssKOvHQgxaV0J7PTDACjGlD28OK20f+RU
	6SEORUO8eA0TY4c2G1XRyzdYoblecM4Fx8GiaExdzih/2/nrRyYK/1EqhR80J1C12gi5mrKeWh8
	aWyzeAyfq/3ijlaH8Ax4GOGAn9lFNF/MVO3Qy80Qjjg4T0y2to4=
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr8501493a91.17.1795342687728;
        Sun, 22 Nov 2026 02:18:07 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:06 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 04:17:58 -0600
Message-ID: <20261122101759.206056-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122101759.206056-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
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

Preserve the leds and led_act labels when replacing the deprecated
LED fragment with a board-local gpio-leds node.

These labels are exported as device tree symbols and may be referenced
by overlays.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..e01f668cb9e0 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1

