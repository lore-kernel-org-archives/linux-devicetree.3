Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781950;
	b=cKeVkaGg9sOHlCsS1k66JpoKZMOMVVvCNQxAT3owHXApTaTASkpW9tGWhVzsqC9f3f8F
	 lyHmgOhuA8THkWiSp8tNnz0yHXefJRuceO6EzzutvX1P++Y3tU3Sq4mvN5nEhUbFYSJgJ
	 +r8Xc5ZW60tjjmx8QKPe4tZ+Rh+rfhqzcrPdpgOJrSNBDGxeYS1MmvRByRwjq0OSbtv2S
	 6zLz8msrawPSWelKEUrBfe/5dWE9efv4aRvghis3vFtzbHdBU2lVUpWbviYJipjq1qiLy
	 iWMrob7TQIN5gEG7nwUMBUVtBKAZo+8mdm1+9Uun63kLtRZ0kM8iAt+ptbBfMk/b7JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
	b=vXTv7WvFvVdONUXG9c56cex4WmTfZNN9Jt2pBhpUb7qjzgz3UR99t8DvyDqlD4dZL+Za
	 ZHk7XDXUqbnMdsRInlm/n4xaUPTF/j7TNaqnCHQkbvQJwddZNH3hca30hNJgZcjWrfReZ
	 Wr/n9md4c1FI9nQWjlyAahQaaiTStkvIjbY1Dto93FXmzMjZ221nv45sQc2/f/esbfExw
	 Mpzl9B9txUu7p7XrM2tTaor3lCcRKf+hAp1v5bY6Kkrz3NPzXSHZ+n6uCZrIie7A1uQlE
	 88rw5onDWHdHQFu629DzAG2724ZIJtCWS0N0ASuMMRtxfm9hRMDelHUgn6SXLbmnzuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Getvt7G8;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF277606A697
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF277606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Getvt7G8
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4778673f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781948; x=1796386748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=Getvt7G8eSb1RZwibv5o6nlKIuLl1gXVHyInFEKgrdAJ6qq3zNyopzCvxUWXIpXhm4
         xFFWCfUdr11s0yKnQpNP6qNVchSShrzhF1QJ2FN68h97Gp+dYJyboN6QMUNy/489N7NB
         FqOQh4kB11N7qhxxgGe3VPKsqPZ4eHWitUDQLYhv/Z9fl1nKg3p17LRRwPV48RLfl6N7
         Fwga9PhbLkSIOK395H7PsiENgdgBobIq1nEzg6zzwuU8OJFS2Vm/fG1vfuvnnOpRrCXl
         YX5F5OhLU85nyqa7B1rSvMZmlYyfmaMpSif+weHnNiSZ/lsZv0sGxpBrclxKpTb5VY9c
         noMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781948; x=1796386748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=vzLxz1Hp+pUCWSK8QZe+ci2lV4Av57FYuXMBcD7nbeh1t61T5OawoTg4jZWoZx4bbC
         K0RalylEZ53IJqDghjj9fIVbpbTyeWZI4OaI5GZsr1qgo5X6Y/Tt5KWO+Fk7oFS0kw8A
         Ni72tWSAM+TLMrEEClpZfOBhtXXzEHJ4w8REHr26Ssry2qnV+NjpDOzFoaRNaMVCl0lA
         lcmjhjL7EcJxkBfLMRginW3SU7OZBY0noq6OFDsbD8L9SnAMZhAe869kTuWkaZ1lN3Wl
         3QaGC/FcpejhE23hhIGnqKSwvCjz1KKKpEPqHpFAXpTYkwkfCt0mQSu+yNQs718tkjaX
         WMPg==
X-Forwarded-Encrypted: i=1; AL+hErFcVW+0XZBOSqzm2JLgKOqaJNXpzFx4dtV6DXiCkhSmT+kMGQdzCtaJVy6Ydvyb2RXXFQtpHkcs/m6k@vger.kernel.org
X-Gm-Message-State: APuU4Z+LQJ1dC2mJ6qBslPEXBlJqROyIrD0O0PchYe6ddSeLq9ZbD6rL
	Vn0P1J3cso2rijmxXhysfAB78S1s5DSAoDgGAwQkG6Cv/MwvVWYTkmaRg9GkzUd5oxU=
X-Gm-Gg: AZFdTZd9BM8ri32nXNd8SWr62GAB/Tq0ZXSJlGWSC+RQuUUMy6WdZ9iTt7x9xQpt7M9
	OerJsia33eTEbaJ1RHxz69aYrxHul47exPFI45dTu4sUL5ONxu6lojXvLsvPW3oajiZAZ7CqSQF
	22YWU64GYv25NkgASIaVypZg9pLthX5CW1MSOzrhwvlnqPppHmjBqjPrq85y7eEFqLbID2MIOf4
	D7Zp8q9dF25DtsJ43b6fMYCFVg91IYqthFS1zV0vdg9XK4bLsR56LGslTyCLyhxcWrRpB5T8xDk
	Hx6/UVI8BQG+Rstbpdtpt/AlJGQGL7LBku712q3Tt1aQiAYdvgCH1QqNiw4imP/EGR1TixG0y+z
	Y022TXgcp+Pl+fW23f/ycKw6Wa7IZ/s3yA4+uwXtIfDvZ2ugGpSDhnDVuJtKnIK6/YYEVFZwnD9
	vtVo5GmHRsCHwRzET3GArqKxhPIi+HSagdDIXWDMN25PI0s1PJwr//ZZK7B2EkakUK8ykTPJnxU
	fzBwhP0ZE8q+uER8uUxZz6+QGP37IGTWnH/IME8gT3JxASUNM4BkPw9cjKsCY5qzX6EKNZ682Zv
	u/D9NWZs1Yp6oogK53sTYOUpbr7p
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr54504811f8f.51.1795781948269;
        Fri, 27 Nov 2026 04:19:08 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47947814f8f.3.2026.11.27.04.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:07 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Fri, 27 Nov 2026 13:22:09 +0100
Message-ID: <20261127122236.4976-20-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The DMA controllers of the BCM283x family see the peripherals at their
VideoCore bus addresses, i.e. at the child addresses of the soc bus.
This translation is not described by the dma-ranges property, which only
covers the RAM, so that the DMA engine driver cannot translate the CPU
physical addresses of the peripheral FIFOs and had to rely on its
clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it. On BCM2836/BCM2837 the highest CPU address covered by
dma-ranges grows from 0x3effffff to 0x3fffffff, which does not affect the
size of ZONE_DMA as there is no RAM above 0x3f000000.

BCM2711 is deliberately left alone: its peripherals sit at 0xfc000000 and
above, so describing them in the dma-ranges of the soc bus would raise
the highest CPU address reachable through it from 1 GiB to almost 4 GiB.
On arm64, of_dma_get_max_cpu_address() would then no longer be limited
by the soc bus, growing ZONE_DMA and the SWIOTLB buffer beyond the RAM
the legacy DMA masters can reach. The legacy DMA controller of BCM2711
keeps using the ranges fallback of the DMA engine driver, which yields
the same addresses.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..3a9719e2fadc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x40000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index c281697142b1..ba44cfb07668 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.51.0

