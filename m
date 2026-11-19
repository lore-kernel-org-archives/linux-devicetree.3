Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078534;
	b=SB2nkgb2ky0H7lQesMscDtOndOYc69TMu1NrF1fWKvWxngCM8YL+848+nTF6wLKFIg/4
	 ThgKmr0C4k5TzKVYnqgSU3kt7C26+p0hZO9fKalcjh3Vxcc3dKa0xJfDpVwMPHHAIw6LE
	 xCp8FgGvn+G9rvb+CnWgupMIGPVOzpaCW8PVoeCm2eN0RT+oKKEW4F8iAEqIB3U8WLOHn
	 qTU6MKfbQBxX+uUhedZPyIauzRgFHAxOmrp73D6ARceG5lye/judaFigeYzEql07WuE90
	 87YvfLWCxfJhaI/6yUDHQuq5o+xFB66An+/pKNf/yo0LRKq/XAGsFimhddVhlJMtdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
	b=myEfW3tJ1EHY+5YIlyvZXkKZ3tXOjpSrE3PPIGlD6swsMTv/K9gIl6xvTDbpw2Hs4Mkm
	 Snuhm2qQjs10z8jOkM/smnorOFyNVEqw65HHrleuZAznMtQzcZueiDK70YpgPpIxEzkAm
	 HQngrldsPg4aZB3GZQY0DBEqmmdwu1SajDXvWD9BkF6v5xFYyoUQyIT8gjYRsCePjv8bV
	 r/lBNzOlZhVvFqQ5goc1zLDm6oxLoR3gtL9h3ONziGokgc6jNuOPCNrDywybdNwOpwcvJ
	 LTnVoL7IqkO1CHZWKBHsZN7YRveO9XaWaR8qVyU+c/3gX7o82ZuQh9Qg4vKpF3PqnfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT4qcRh5;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52263606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52263606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hT4qcRh5
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-536717a4d83so16353541cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078533; x=1795683333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=hT4qcRh5JN17plpZlPf6du6HxDExNJVEqcOr2dEIZtZnEoplQtfW2Q9OiHlWQo/PL+
         0V++WIpddvL08ij3kytb4F5/022rmQbzUqwc8JZJGQ18vKktUyXZKyllQxZihEcH3f15
         xuNc7JTML5pwg37SVj6ymmSczWj/2eWFhmMqudbtV4Lvc4zmRaIDzeyCOU4dTJNmnw0r
         hgFjiBumXfUcpOdwDEkO/VBXTknTobI29RhIOViQNVGrWSA6+6QI4CGFzW18gWoFVNzY
         GL+x44D1/hpIq+s39RaCPRuEuPxTRz7g69u0zjfcjm3QUTViBalbh7o07301IdLQBRR7
         SN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078533; x=1795683333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=O5Rt0EkGns6UqmPQiqA4mopdwc8AUYnVWdfeV0jIDh7ZNurjFFtMreZ1uRnSybgupo
         QhTV80zU5WV6CAYWvHUyYMc64XrubLQKqXUsl+SAGneVVzWJKgmMNdy1tCYQy1JQP6AH
         jJVTDaZ8Y8rbWwjJro4M369w1hlRGSPIbUdbqZg9Y/Su39tH6ymfMsWmbxVd22iS+/UH
         ld5DcqqXiKlyYYoQq4x5Ng50VQxXzMmOx22zUizsCbzcBnL8hJbOMu8yiJHf8zVfugyh
         KjthWT5O/JqT6a48qBu88MhfnT4GXH8eiYHGgVu3LHddf78Pbcf0r1L34n2pBZyU9zHE
         KDHQ==
X-Forwarded-Encrypted: i=1; AL+hErEUfj7hADGAic8M2aQoViAC3E+J24N8unO4V4a1a7DUClr+3vK7HfbRwgHI9sF2hUimpZSbUkCZoSXk@vger.kernel.org
X-Gm-Message-State: APuU4Z/bntNkwV6iq9dATn72CcjX32HXJSyVwKc7SSwqMcc2/6pieZMd
	Rx9xILc+HGH29ROGnBo7i9HXUOZYlHmg//88rMZz+q61C+R/JoEsXDC+
X-Gm-Gg: AYBFou1XkPq6UWgdUfG4hcBAmfxvNHo2U5WlPEj3UXTtp/vxph7QK1SkDDRY/g2mirj
	a/wxk8PAZbucMIR4kwZ1HHC8W3wQc7Aw5MbxEx+kaeisfnY6eaka62CEkIONJbeUjruQqaHXHQT
	g8KHPUixCMGh/aEdy+BYXkiEfVQlfEXd+2nvM1KIevfUzhL/Q/mL+ilo3T1L2lfk5djBaU6N+lq
	6rzZkK5gnvayrSpMrfE5PZuFiaxmX9vYd8mTiNdS/UyRo8uk4XPlbQWTpeeKGz1lde/p4sQrqmS
	uyYGcbe/5VS3MWQIYvtPLutOmuRoWkjigMuw/B/w4WEpRh63ZG6C/JQ7gyqIYmXGzTGqdLtMtt0
	gLMRUYXt/vtwlmQagEutrFPfuRZrrEwdcMUJf1p7e4/h/q1DsgUctKW7IYwQ+0tbq8jBz15otM1
	kQuBBe10jKUfjmG59xN5QWPJ9gkOsrE7FE48RdzfNcz6YpeJ/wGR0MUjVqi9SmpdJR2WobFLgAX
	ZxCalSQUqhIUcmE9eQGfX5sEJz1k77MPmTHTrVyirzehUjpTlzwGEzUIjDTsfNIrYQaXteGM2k8
	yc1Ho3D/0SOKeHjb/xPsJwd6g/xFeNl7pIpCxQSGYL2OyaGkGnByBWGxFtmY2UhhLwubCiGh73H
	8/Je0Cl4Vq6mXQEn5iq7Wpi45MMiWlJcMuowtfhdpHtHvbBD/9Fq4LVoGCC9kFULi4lPM2TN5ad
	u3lpY=
X-Received: by 2002:ac8:5cc3:0:b0:536:98da:f790 with SMTP id d75a77b69052e-55d5a322240mr76503571cf.6.1795078533317;
        Thu, 19 Nov 2026 00:55:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:32 -0800 (PST)
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
Subject: [PATCH v2 11/22] ARM: dts: BCM5301X: EA6500 v2: add nvram node
Date: Thu, 19 Nov 2026 00:54:41 -0800
Message-ID: <20261119085452.75708-12-rosenp@gmail.com>
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

The nvram partition layout is the same as on the EA6300 v1.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-linksys-ea6500-v2.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..d9e4f84058e3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -23,6 +23,15 @@ memory@0 {
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
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -47,3 +56,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1

