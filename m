Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818189;
	b=BuQgZrRyyniWdzNacd+aqUPh5/OwRd+FaJgOM/FJRCx889mOx1likdLKUwWREmN0+rIU
	 ji86bbGRk/+JpU/a1V9PBtp6Drmb0TvQX9OAGhHv5HWbnzuNFi3UtS1nFViQxUq9HKhU8
	 /zC8qylxv4S2QMFbsbmdluAld/a6OyxZhLzS16FiX38w6J4XShqIRYZu4OejZJrp4nFZW
	 7RmpnwbWJ24DHRXGLr8bY3xBvGCmlIRN7ObXDgzysLavekkV8p1RAQ4aPv5+fijFmqeuD
	 qRnfKgmNBr5AmprSLlzozrH9Edj3aJbEAd7+yjU/zpW/zuYWgzU4FbCvTAoqJPg5Gvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
	b=LwH6dFFijBh2IGNINdGqkUuvQKLbCF3jcTG1moHKaw8rR2VdlNCAUvorwYbne1IejoQF
	 ktIj70FHNNAOFzIFJL+ysE6FDsEtIMtQoIxgrqyM2KfDzrjqBoCpAvj86ETboDGiu1OWs
	 k5LAytb03uDESt+5M9Lw/61TpSwYzRnqfC6W2GBKJTnTra2eeKrZNgreblGCsmf7Y2Iz5
	 NLVCdjXoc+hSXCAG6U1gS8JoDBwtywFJNz0AhmEaWS+PZQ0IOAj8q6OqtQ8qJSMmPcqRZ
	 Byee1tDkXvwOAl86wwFvMcSFQijjkUrI6DrDQ6FRtYkpuP6MJrStmDw4pH6obPjg1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzTLr8mR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3860A2611
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB3860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzTLr8mR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9458065e9.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818187; x=1794422987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=TzTLr8mRllWr3Kr+KwsijkKD1sXTeYrZ5cfA2uwqEltp+EpAzowUY12ffRxDKzcuzY
         2LqeQrSe++Qrdwmm46icHLvpmmTnuOjq2sQVfuEiDxC6b2SviRy+yRF5SOOkoJ/Sqtoc
         LX9/SOWwuDcKFuLoUdDwQEGQEdhe0+kDFJod3y34mhHi+0Zy60sJvAwOGd1MdCVx6OUX
         nbhdR41quh9fBpcimOG00U7NQP29cFBgSdhjgem1ZDQnmDGY91pemu9azr6nzudr+jkr
         ygICUe3qLx1slRIjCPCVSL+XorTZjsyk/iUFg89a+uUhihqQNesceckrAbe+siw76kvD
         vt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818187; x=1794422987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=zBDeecMxX4chHXbwZc20s3CJo/pXjoHCWeEas6YFF2X7816FCcTHEGWfUnjp1534cJ
         2u/V/uTPCTYWBWMwFKApLnzLhM7A2UfSl6PJ+4PqTPsjW2mtQQV/3QiY3ZB/M8f/U7Kr
         QDWMS0762aRw3oRhi5M8Aacxgwt1lTonGhYL1hKiw/eTg05gNEMOeKxpXqpEVKzOkl0E
         8Yg9UwGYNmBlTJmdSO7U165i7xYH7D5q0xY5mK/9culrgm0y8FUpooRJBdZ6YSGKTfmT
         wr+QeGbmodWmxe+NKvR7ZVlWGResu3cWO3DqZdOCt+coW7lmYhR90Op69ywowBEMoWz+
         B8vg==
X-Gm-Message-State: APuU4Z8MtEc8+z+M4hCY+lGZgtboxXF7EW8kAW+u+WbX53eH53w9IzO+
	beI/6z3XGWW/QiNt/AGD0pBRW6XFPPYvfCe+XkiXdGDs6e3PzvEKHGDL
X-Gm-Gg: AYBFou34xt7toTlN6P/35TfzxWYSLxDPmivdLUXoNefxZQcWJ3TgwzgWO4nb3rXcM8R
	X35+gkUDUbsMCX3QVTvJzst9URX2Z2tJgIC2eez4XW7ASHZ7kwPPCKB+xvO2K5NMVVVZMW1vsyF
	Ww8+HO3UrrQwDyWjAcloL//5yvzOErEoIOiE5YxfYm2rt0S9ggVz2F16HqlhmU+jLlIInYQLeYc
	Rqijrz8kLrI2KhCYGl6KcveLzpSW98x6EN3C6vAvN0KrxVHu+woi8F1Wm4PH9mnw+cgXQCfC4LY
	Rkq6WbPV2DWxpdU+7ajRNIjUG8vks/HC/XWDurkZl70Mw85aO1CLn8hokJfHGFe78wOSPcRZBMa
	/LBdvLvo96JEF5FULIDysrDqHKmRYgBhg0bMjtT99XzAzCPzQXE6LyrAYAx08q/mEC7PxL8RieG
	cw+qFcbUyH3S9sNzpB0fcwnHJfy0q8p6EtZQ+2CU628T4RV2kY92UWNSaFptlc7qMaxuUqJL2os
	AFOtzGNeYIcHxgB7deBvuY6bc5QJ7cqGD0FmiWpFQMfapDuMFzOwWOrZ3SdxPnbz82m0nyzqaVi
	Sr9rCCYQk2oI8Eia3SLpnDa0AisQx9kWKnKeQIqwFmf9H9ElI9GKDUmNTzQSB4w2G9oFr5yCq0c
	sGN0mnsgUDW3MHZcuNBCNj4vOYs1p1raNuMCD/bIpi11BnmvEIfM0kl/9F3B7Idhkrwr3pyY2Z/
	UwSK9OstVGU8YGS0rgwPH+JK2Ala8M6Da7TuIX96/DGLW6m5oLMugdaN5j2bLURNInduC2AAdmm
	dGrOq+d2FF1eY+pO5CQ4bNBU6EyvfStBiWN7X0b5AJZbdYaK/NOuN+w4xXu+CJV1g==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr364814095e9.0.1793818187271;
        Wed, 04 Nov 2026 10:49:47 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Wed,  4 Nov 2026 19:49:39 +0100
Message-ID: <20261104184940.882833-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..2948369cd659 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0

