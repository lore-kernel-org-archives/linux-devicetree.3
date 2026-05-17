Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945053D525B
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061290; cv=none; b=ZixVw6y9r+7HPTMMNLMNY8DUMhN1/y5CZ0DcaojSzEmo5mf7bWp/+ell9sY2x9+m/6IpgUrsYEoffGGcu9TpM1W+RGD4pXacqU4mAx+g9xZTbMPmOB/A4lFmMvTxSw63dHWWrb79YEx6/apXafXpHQUMpNA/fyiQbXNA/pMFcPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061290; c=relaxed/simple;
	bh=e3BakOiIkbxUPegUUabz2iD6bSOHgMc97qZrJo9OOrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGLM6tp+f/ZBClCq+2QjLwW3+juQJdNwqCqHL4IaSXtKx4qXz6FOLzY0+X1VPYvve4zGecBzNMsvB8HpKS3oU7Nt53hK7ZPf3alOjgwWYQhpNw21ttGlg3drbhvPqEycmfGUZc9fh1jDP2eLMJqeF02DEfc6S3XkPcQw7tGQuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQiqMZ3j; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQiqMZ3j"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e7c636e74so184642f8f.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061287; x=1779666087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=jQiqMZ3jbGLA+G83urXn3wnbEjBEEBJrdnn72ivgEdYBSuFoYOiaxCf0vpgWtpGJ7b
         XmuryYQrjmWIv4jg/ApswdhGYsTS6Mfrhcpv71lem4CEdKB1I7DzOLwvEIwBywdum+IU
         M+gYfOIQUChHXiOORnsgFkf3WFMpewBb8lC4CfW2zizm6xasX8YYI2J9qhR481pCik7/
         7een85C3QAJa4vHAx3Gwj3nA/JD//aDOwZuUFaa8RwCsNKAEWjFFoc5vu8DAYWx0GjIp
         b+K+0fGRep2NZw+/8xHGTaaM26imjPxPc/mpuDiPR7R5Y4BcEq8LsAejR5a67nxRX3Ls
         e03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061287; x=1779666087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=dX9NtAzQowX6R3ERvCxdAR4B6HxaYwwhVvKdBOspNMKDfb1F0vBpGzfmSx8Ghx4/cP
         U9zh7JieoRtV2M3T4nrECKIBVPEc6FKBUOwMnhlkcHx+hZvKQkpU48GXWFYzOzl9etV/
         U+x1aLzQI9lvkLoVpd12r5NT6s4WwSZevCTRWZGvEv0DQoH9gkUA/fJQC/fkFWt3CUYk
         6TTbM1SDqngFvwOFu3yZKFiClXKMdR716cvESmHM+QaeBr4vfBO8w6bOQ4ukSkCwfJBl
         522OnHv92PBxbrDBAxLbVJN2DtFWJK/QT7nhvw4ecdJHpgGe3r0SZutmQ+fEnMD1ihAx
         ovzg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z33WPB4A9QWm3c+fV+oM6gmJMpdvBAkkuIo4lUX3AQ1Gfzy6wiAI3k+astU1NWJw6PYc/MTnEVsq4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vej9Dyih1h7rzwEKYXFfs/Phdjk5HqddYlF6RPIrE/Cvk45C
	auCKhbJKtPRiuUELAvJ1dFTi/IlrSkGadqXMoaiqBtaY1P7F+B4SMXk3
X-Gm-Gg: Acq92OElcJ6aVxjwjZw9PQGUPm6Z7Yj5a260Sj4pg4B29oXVdgP8+g/YFr3ovuYanQW
	85wRaPCXp2bBm2m/0ysl2CfXaye2Tbe3lCcvuEq8DwwPymunu+QGEgflsc5MdCepwFAXsz9AEaQ
	O9tBWyr4Zg1NM+jwk/7KudB832+2aOJLgr7qXp5GI6gJecXMQBeqqkNqTvuyXui0gbYHbcnLaqH
	YMbQ/+RA9VSa2p3rK0IrsJ7jJgFLMLZ2DPGTGC3oDav3tjeHQTYomk/dyQDFxUeuOWiCJ2Km+/w
	xm4q3Sb3qXV2n+9vI6IXLA9iUXbGKtXyKhGoNxvQ+hcDNVofQynPlQkgC5sZWGCH6BBFj+cA6k/
	70Tv6LFx2VK1bbjAKEeQA9TBqMUgXD6m3JMedIJw8ubkJqykiPG9pwKEFNFYhWkw+Iz1WkX0/5T
	+uxX3Eb74nKo4p64PIbkEXe+jzrB1Sww63trempGW4CXhQNtlxm5ijNpbOgJTdaW1K2RCxiCZn2
	HWr8ywM0qo=
X-Received: by 2002:a05:6000:1b85:b0:45e:739b:2748 with SMTP id ffacd0b85a97d-45e739b2792mr5067481f8f.25.1779061286975;
        Sun, 17 May 2026 16:41:26 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:25 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a100: Add LRADC node
Date: Mon, 18 May 2026 01:41:29 +0200
Message-ID: <20260517234134.2737320-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..2bba13c5d25c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0

