Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078530;
	b=ampZEpXXdqIz9qECth2w85aHnVN1wkcRylR4of9HCCZjI9NeORDbL8cqnmVpP4rjkncn
	 +BwqMceEY8harxDF9/WcKeX/raemaKd9t/+zMhDowNJZ1G5YFwVv2S5Hd16n+/zc4HJma
	 8bZfzL+rE3ldNky/ezGpFC10UzaxJGxU7DcqmhwUNdhiA2uUGaAtXDuzSDtmRTqqTwaRI
	 mS4xB6bMdAtmJpfBN3cISlEv5ZZOXFP7ghDAeivsuzsg8ixIaA9+o9lgWWzm9T/L0AI81
	 wXdBATij5XztjD+lhyin8eS9puCG1Fvp6tl+HDnva7gmsr/CvRvNoGZtJaWr+++u33g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
	b=3XxFCPegvRXuVqRyQp2gLpDgobmmW2tKwQ77YTgK3w59QQoSWb33DMWOLdLKs2Oo1wfG
	 /d5AiaSKQz0eoPNB6bsESv8wluLO8iUIsYB0zb+wgXGOLFzHlhp3dCD8W0xejTCkT1JKF
	 aGOBZYo+XxVDKR/UdAov1x/DQlJTX1pAT3jZSJPnw3o+nToOGJ9D0qpeeXShT9LVNxlLI
	 Hou0T+fx5ymVac7Dt1rRrzFs5c8be6/S1PpN+GNqWGWXa2OYheWNaaOgPTvtS1GfsHm0t
	 3qYWtdH4jGdo/paEH0Ass2pJXtzTLE80gjFQwTymCcacHU5zcAfAjL/4/bgtheooj3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkbTDSkS;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A160A2601
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574A160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkbTDSkS
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5363c8de563so21727131cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078529; x=1795683329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=xkbTDSkS0tFc4w0yt4K0F8tDAiirpmo1RsZWXiVAeHyPu+Ox6OY494s0TG/BG+Qtng
         VgL6VuPk+CceOOGrwX5ck+4rvZTF4LzCA27Mq3nUJpJMpmmrqXB70yiQshAt472QLhkk
         ukqta1QtFUffn62BftTwTpFyA4OVvptx1RS1B5XapL5EwqU3DaaQlR3ll1UQvyQKuRcT
         eDGIpvwUm9/lV6AO9GxrxDG4o+2jOuthCYDG6TWlsA2yxQ/V2IAfDDTJ6ZXP29HXDEWv
         chn7YV5Mh7j2o7UzOkHG5yVCxuUFH8j1wkvfRhHT8/HkT2QKcZ2A/mYugEm8p3BX0Pcf
         AVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078529; x=1795683329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=mZboz5cwGzgFMVHxnVcKYeYU7M17bZWPpI6k13AWSbjN6MChP4xTM/XTG54n5NlbiE
         0EGKjK8cLGMitndnnwug7be3FyapDBbYMRTH8VEkIfHeE5pBIB6InwFAEx6Cii7Tosat
         xc9hKH/MOCOEF+mJCSfh/yI6lqVtyxri1LqMWZpqf45LPtTXp2fEIw5H8Vl+cZuFMEtA
         yopJarxfriylYAh2cWlrA5Nqcd9mp6ql3UCxDWutgEa1yPFetYC4m71LFyYRLrcEbX2P
         Vx/iR3aYlARQns2fhxGxrrwePrCnBmnaywBXqzak7urnE5p9Fz2W+nBbsDt8W/YJ7dQ6
         Ni8w==
X-Forwarded-Encrypted: i=1; AL+hErGk9FOuTlqgwYUC0tIwPKttsu0svTskbHwk3BLqf2irOrZPqrMKgJvqVnLhoA6bfH+ClAWv9XKFGMUH@vger.kernel.org
X-Gm-Message-State: APuU4Z8oWeFdsbg+HgZdfxmJDF5LqfyDfyIFwCikmNHhgK7ahvvQvvzc
	rjDtTWSlO2cMNrON222HDqfl9IG3MGRH+n62LrEbbHTlzhDaAU+DnjqD3sfpjQ==
X-Gm-Gg: AYBFou2f7o4p3eEedFXAiRtQx+tUHcnyZ8ZNjuZLnz1ugLekA4poaoQ+wolDXC7KIYM
	m48FYAvnGztXq2vZ5RpRq8wGLgocKWehvVzVhw6KjgbrUniaNCDjDIqAeMbns75gxN41QstDB0o
	fm0RYHkDnIlQxBGrcI/Vkfhz557tZjzXt9WXZnloHiwVFyCPFu1b/lxwYxVoxCgLyPYMAPxr5FY
	F8rR6V+LPYKduihz5RKqvdHmJLH6CTV9f5xv00msEIVPq2csfhLot6g5ydHj6xWXtzVcLRHXm9n
	3w7reHwdIshHK18JdOJPXgis0+YvuZfYxE34Q1aH01vj5p7RssRYQKKkbfhVHanJx5VxF6RMw5g
	UePDwMLH1p8MQ5agPhkJTzgBaCHYXdEBX3xjBYNx68ASMVHTxohZ2N6sXvt5uHoiB11VmUPnQ4Q
	+XrH2UnnnTZwyuHLLaOJciY8fLvYN3/9AwbWS+T4UJLXXC0IgappNE/l1/xJSMPNunA2ttPSnSo
	qhrjIFUVStUp2UOcnn45fMCUFlsFjeYruW9b28YJWY5p9m9WI1VbGU9S1mfn6luu6Uik5iIhXOm
	y5xXZnoqdKZRLWbaCABIcMPjmIgs2Eo/aOHz+mXqvP3SYYEobMXKShC+ApGHRz9VcYjXyHtJmGD
	VI2JBz78eEbqDMlk8fRrZB7Ghs5/a+bEahU4j675M5HwmS8WpGuVqNcFOWe4F4HMQIfmsTqc1rr
	cKig==
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr82703901cf.1.1795078529327;
        Thu, 19 Nov 2026 00:55:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:28 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 09/22] ARM: dts: BCM5301X: R6300 v2: add nvram node
Date: Thu, 19 Nov 2026 00:54:39 -0800
Message-ID: <20261119085452.75708-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

Add it and assign its et0macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the R6250.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..1b99fe442dda 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -90,3 +99,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1

