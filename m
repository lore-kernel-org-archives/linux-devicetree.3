Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF840A944
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358019; cv=none; b=WMuuC3tW2z/2gVyH7ZYrnhGRR9arH7JYP3Ak9pec2U+KoXUX9zRbWtOZd0z8UuNnkEJigTsfDx3l9op5aUuAMr71Q6HzOoqKLeH/d2Vc0XpJDzNpkCXszvKXDPP6Gs9+TvM+EM5B6ZOyRaGdkW9WfnnfvU4AZW7Grekc9sM/aIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358019; c=relaxed/simple;
	bh=DXStapEraLOmGWAMAjcOUlN1MfJftHIHR/FhyYDyQjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f0dWuFr79TVdSKtyPfw65wYswCqr3eB0O5u4ttqnYJseb39c8u1wGnQd3CTuEOmTQTXhtebtsjZsfYqD1NT779R1Q6jcM8DqX+dofT3+0i1VakyJpi7uyL5B2y81wPMHMIjRw9W1lx5pJ4TtQQvDUnpvTWvwK1vzpQqtDNO5jrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkseLG30; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkseLG30"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so35373135e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358016; x=1791962816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=gkseLG300dcwevru4jPgok1FSzWT3fGfFgUvXfqCxHlSzEAUWrGiyI1VRAObVLK5V6
         4PUv6Lam3BUnqFplNs/m/vKxTlafOY4JSmvLUNRKGwmgS9MHnfLMxJcpCZvONL/t1zJu
         QNvg1VCKcX2Wp8ae4ePLle2rH9TDsf9qT3joFbB7EDskNIXzzmWeK9qVWi3jr/gWVynt
         rANWaB1shJ+hwwSRA+shrHMCjkGifptpTC3uR1Vo6MqV3tCCyzl9UjAJMOHU+PkC+bf5
         bxIphYbqFWDn8/23oQTPupaAQ5bgYCrruioYjK+3ELmW6iWgVJGu3eLXaiJRa9Q0ofm0
         iHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358016; x=1791962816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYhBBjceMtpyI2573/JFlRc3Cnsa/4jGbMr6umzIX/k=;
        b=hzJ87yO3gfJhqhKKL9rLMXr8NMFibNE3WiYtfeyw/ftsh877YO6MnpT74jweB5XrD2
         ZkOuIExS7IZJmjVcws7ozV+n3kHI42OAbsE1ZUhrQr9tB813qxiON/oYzt+IssmjJml7
         vdX+UzW9vB6e+k1ZWL62Bv7qx2qI9fFHpifaSKWdYD6rx2ik8/Th8Bw5zpH4laGPVPkD
         b2R0E6ptGahRo/gW6n7re4Vl3VJQY9K3h+cxKU8GIkOZtK//t+ZsI5GcIdZvmFkH//w3
         NjrzDObzijS3kE/TEXeADuuTlhKspPNqATK6UyKA2CdWskpLGBtMKYRekbq8ZOJdvxaw
         slFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcONPopqohWC5JLex3hllSR2PnIFfE0ceIK5Kl6JJjZIE+B1yb5g8VnHhYyjGOg63EQUpWC0X+l/d3@vger.kernel.org
X-Gm-Message-State: AFuF++kuWFNSEsxsINgQmQddDUryia5dL+AVQYY5acKBmthQgmse48yp
	p2SMclhzQzMa2e4hSisLyp3v25f+um4izG72pCLjMuhKJ1G/WLDpCnqm
X-Gm-Gg: AYBFou0mxxMk53AEdXRuI44OQSkSpZqkRla7AwkAkwlXk1cxi+x17TQw5tD7vlfi/3d
	94yy7Q1nggv6at6sdrZJPd5Pge6g64XInxqHrWo3+Gi3kMnaFkZLsLe/+xFZhkk6Q1i9aD1ozpO
	3dLN2XQt77YKXiPFOO5S1cmMYWDQWJqfoWjrmeUBhAGpyu78hun/tuAu4Vfzm06QF7DnexzpgUt
	vXY5QG+TToN0IO7xNXNWVJgGVzlccUNJLiDOR+zdpQbuup3uyj1gvxJYgCP7MvVf3bTLXxfmolv
	Ppnxfn3nyJHDxqDjVZdLUFw/0HdW9t/zZz2u2/O+RNmcSA+3tsp/OQnytFpURywdkJ06iRjEreJ
	jHG3SgIi7GKokbwiLGbU2rkih8qQp0P9YtyYWvjaFsNttn9jLqMVT7T2TpGLqwb/JbCBhfCuW0a
	F86AHKCNoTMuyUy3DDQDrKNRKf+tQ3LJpn6MI4FskofpdWVN8unat3NChEfdR4YgVoSt3EdnplS
	6wqEemU1zsPeiPx2bU=
X-Received: by 2002:a05:600c:4687:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18065e235mr18138445e9.25.1791358016421;
        Wed, 07 Oct 2026 00:26:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:55 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
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
Subject: [PATCH RESEND v10 2/6] arm64: dts: nuvoton: npcm845: Split APB address ranges
Date: Wed,  7 Oct 2026 10:26:41 +0300
Message-Id: <20261007072645.1618147-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the F0000000 and FFF00000 APB windows as separate bus
nodes. This lets each bus use child unit addresses relative to its
own range.

Keep this structural APB update before the peripheral additions so
nodes can be added directly under the correct bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ab8a01c..a92fbd3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -51,13 +51,12 @@
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
-		apb {
+		apb@f0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
 			interrupt-parent = <&gic>;
-			ranges = <0x0 0x0 0xf0000000 0x00300000>,
-				<0xfff00000 0x0 0xfff00000 0x00016000>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
 			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
@@ -164,6 +163,13 @@
 
 		};
 
+		apb@fff00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0xfff00000 0x0 0xfff00000 0x00016000>;
+		};
 	};
 
 	pinctrl: pinctrl@f0010000 {
-- 
2.34.1

