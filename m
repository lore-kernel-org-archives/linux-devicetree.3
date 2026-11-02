Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610452;
	b=ST3olWjj8M7GfTtNqHLkeLq2Z4GP+uS0Spi8szNmG1EkUFgmfbNODI+dHhfz/ztpC5F6
	 mKZ2CwgU/OmNzxf3n+cZpSUO+1PaiScJUu1sgrMpoTB9EDS4unqwIvN8I0lX4CO1lItLa
	 4ofSBDZbw78Ot3VZu0k/lfWhn+2X8oNh2i5XVAigryDjnQmozT6Mmtgm6u7It8/0caLKL
	 a55ERCoDaGbTA6Q+fKf1wYqPP0b/WILh5eMC2+t3Hsr7K8jfwbNRSkbhipMfWLAgHOJUa
	 hnxKt/W+n3sWTb0cD0OUkcOm++9lF8GI3LnNNMwtdtYtr0Fgd8+VDkc9sRq6OgzCjvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
	b=LkHehvPLqSeQK1C7Q40Vf4kSjztjsRCzzaYPbtuVwwSgWTowRmto2SwEdq0ZWjupVYHr
	 J63RSotv8h+VJrhfHUhu4PxnGsNPladxijcwCDcKtcTEd46xZuZYEr+MqLKZuCGin2Fpz
	 pbpJj+eW0kHgkf1Jy9SVoWo8jJM9Kf4dYqDF/oF0vNLzL51VurK1Sn4u9+q7qyydUYfD4
	 BV77WK02RfPhjtXAU0cSXUYSzUIfuKh/frzxtpIO4wq7AOsrfXlN+JnUb7xVr2WpVAOy7
	 U1ZVwNJK4GN67Y5GVuVy6OM8IUvfRpedXRrirvJbRPuYwqROi/T+QN2DEFz4HxJwRuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+5SqkAK;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09952606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09952606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+5SqkAK
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so28591155e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610450; x=1794215250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=g+5SqkAK2Lw6nb1DAvrw0aUpPuXaqrN4EVqrLvgEt8tECV4HZNwk+o82weuVlS+zK6
         smd+vs2aGipLC5ckbzeRJB5zM7iLDUoKx5EBXnjL8gnAjeRI9IgKplqTB7usq7tY6O4V
         ccX1fu/ORXfXVtCOtiIQuRB1ZkDCccWhCseawvcQ5gS2+pr54e9KiPQLu0RTW6i9ABp6
         RFFw7+mgR2+m6kkJ/cGJBdCbRStpvFDI5B3UpGCtC+KQxW8MlEMF33FLcGrcOUWwqewC
         +lA3ICUvajFe6lSIYgacEEO/GzRwWLG+ZRbocPTifUmgJYduOJIU1fW7drlHHJdk6y2s
         ZWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610450; x=1794215250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=JwitK4uv8WspxJ7QXhVzUgC9YFwGc7VvzCcK6+UL7Q5aO2gQUYn5xB0e6FHj8HdnpL
         NETJHjVW98alQShEH74HRe8FFw/UuLGdMU4PNPq03aqvd0P6qjkyoe2m2b1ExjIZxB3F
         F1+38w/UfJqctsOrHlQO6v6n0aGHOStueX97IHf+igMaw/Vh3tNav6p+84ZYdA1UQprx
         KY+bBV4SM00/yqqoPJHxsapUBqpc31OgSeJRvbmAKRi9KSlwvmnjMUQPywjPxasiOv04
         QMJlGZZ4RV0XLJftCgyl6P4U20x07vvyYBaVnxzYc0J2Eq1nbw3UEnZNSJUFZXa1TQhP
         n8Lg==
X-Forwarded-Encrypted: i=1; AKwUvBx8Kuhpq6kehzxwUu71b8IJl+dXMKHzG2digl3LFapkQ0ge7LSPdFTZBthKvWybxFPaMHupQVjVRYiG@vger.kernel.org
X-Gm-Message-State: AFq9FYJYxHjPSoxeMzVwKYzYxSsEl7X4HmBCAQe6QnkpMNnNgiyA2mPB
	Rgj9rA80dJhezVqu+nSaxbKq0z6o5LXSM5fHLF3eGxgYpxgtJI01/5lI
X-Gm-Gg: AYBFou2v2l6/tvy74swPDjss5DWj233URp/gJIVPBVC8u3DqJhfAo+T4mtiKk3bD+Gx
	K94ZesAffGpkFlRGKrGIgPaaLuV/KsQHIAmfwts8crjv8M4sRJP0V45thDnc5Mkzgv8Hwi0vbaM
	5ZwP27wcW+DPSFrmkjrUm0SshrZtgi0kdS0MSh5duODULkN3aSM+iikFI6Rq1wUv0TWZxUK30lu
	Hk9c8z+wLLRnJyv/nnipDNM2LYmwpPidz7jJVMBtStNNaC5i8YMdUbYS+ks3O+YDNg1ttSGLVZP
	V9W1v/QRM2Upc+UxJOYLtZRsEZI3sh8Nqlk6j6pSO76Y+msFZUJqpMIHSTk33GQBwoQf7lHZSb2
	CyOboWzuj/Sgj9FNgHeQP2iNWv2PZGtXtBUFBjIw0770gIVGcY0BxdXMglfkS1SVkGnkqIvXYcS
	/9XtTaYyoIAOehrveIuNNkxIYRLuS98VBCIedKqOrjqzPSiAQHiMad2ynTgGa1kYBQZUEAyhPzr
	KDNWSB5TtZwJekF4uqqh/NxnETmM5AZO2kfOoQNg3/wIVRbkUdULfM0w+9NltG+hY6djByoGxys
	fKeHGMmtFfDM5f7zBSYfUraoaB0Y4FRRZloBrSoDrMLuhk6J4EWgLwtKWs7lTwjDQZIk/+ltt0m
	Xw0q6q0XPT7xQRG1k8bB0SHXAZDo4HZlRpfqCG+LXUxhBTWBoMBIHIWh0Y8Hs1iHZh89zt2jFbZ
	0/9D4Pa4u9x8sy
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr192107805e9.29.1793610450362;
        Mon, 02 Nov 2026 01:07:30 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:29 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 7/9] ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
Date: Mon,  2 Nov 2026 09:06:57 +0000
Message-ID: <20261102090713.896324-8-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Enable the dma40 controller on the Raspberry Pi 4, ch 11
is reserved for the VPU firmware for VCHIQ communication,
and add the DMA channels for HDMI audio.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 1eb6406449d19..a49a732d3f64e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -42,6 +42,12 @@ i2c0_1: i2c@1 {
 	};
 };
 
+&dma40 {
+	/* The VPU firmware uses DMA channel 11 for VCHIQ */
+	brcm,dma-channel-mask = <0x7000>;
+	status = "okay";
+};
+
 &firmware {
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
@@ -59,12 +65,14 @@ reset: reset {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 10>;
 	wifi-2.4ghz-coexistence;
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 17>;
 	wifi-2.4ghz-coexistence;
 };
 
-- 
2.56.0

