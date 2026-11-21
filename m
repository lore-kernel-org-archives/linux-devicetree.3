Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220802;
	b=autZpnKxQsVE4ZHw0GuL6VH6FniiTvzOMIfOLgEmRepPBiktox2lNxazQH7BvSRDb6Yt
	 ZuLZzuuCqkwHo/LG3IJPia0WZmlQbFCeeZFho3vfYu2fB3LN/agNOawdK77nADMUa0EOw
	 zE2W2vDRExTpLpqFrggfohaHGQmBTJaDBwIPyJTvQyQmWp6pZrni53Lzpl5+6CohFh2P3
	 bGQU1dgIMfx9j85qnrbs/zogx5q+bKa/hKObOVfVJ12BBjSRUVI8bIZCCvUBObtg4ARa9
	 ZDJzboMsXfsKyb0X/FwTKAtp141IPKilA5csLNt83TUpavr8hCkbac8BssuCiDJBfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
	b=OkyKsJCVCeJ/K5CVH1o3CCEgoB+CmThBF9hiQyPJVG59Ij/ZRGVd5mpMriW/AR9oH+qd
	 6Ztd4tBmoSSHaIvnnL3FkDVOMj5OpeFVnRwLySOnS+YGJqMTVGRNWUlOp1eYKuUsc0E7N
	 5HMi0PedfiBKjrRDx1q86U3bSi9XdifKtou6yok0UaSzKNcHKMkB6NNf4FjTYPuRN4SXm
	 7VjmblQG/9P/fLCcN5r/0y5PyeDAJLNPiKtSv4KRMMK5pIa1+G+WGiH5BYP1uJ0lW81Hw
	 GEGetP67mIr83UOl/pU9GBKNjHU6lQyii0WifhIkfkGdK4gaTQhig5bigIo/umRz35Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5NCf4MT;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D3606A699
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7D3606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5NCf4MT
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2279872a91.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220800; x=1795825600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=Q5NCf4MTLaJOQfMGVFHWgPLkICc6OdUZYIVZ+6L+Voj0t1FGn2ArvttBv+Ac7LoJKL
         f2jODgq3Pm+d0wIcfLVqEydohbDOuOEA+JkZywvTzjbiPYKFNBP5Deqm1sNZq9D8FC0a
         7wRy/GsYzyrj7mlNTm92d43/51QSs+KbX672L8OEqh0+e0DAiSXuhKHUv3H4xNgMTmk0
         /nkzcD5Z5i5aHiFROtJfQ+7ou0qTlzllIR+uIIOUpHa5fRlMLSGz/7F4BWoehH3BU8oe
         7vvSsf8+i1LPKBeED09FU009w19VzrRpSSGAdX9LsKy/oEuN4EzWANTKN3Gseq1eZ5GY
         EUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220800; x=1795825600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2HdtJ+XqX5lO5ERYLerHM0E2jrL7YBGV9T/0hIoeKbQ=;
        b=G7aRtXyd4Vu715qhr83tieNmG4lBD2T2faeDhZk20ZFFElSIfqfXvNhs+Y4Zq5mxYw
         cVoyA4udAp62rO3Bx30kage+3/8NLIr7QUWjAx0lwqbgqLOSYxoVm2bepFsse2grB1mD
         /CrPfQ6ZmWaNzhrQv6Y3aW9E94IjVXzbmqIGafAzQWZeBdxwcc9THtrceG6N507K8uLA
         xjorzUhnpVcXEpnPtSfX8fRy+lxGGFjLjF+VocoDYNI0qaJGvoo/0vGDQYCrV0B3bbYE
         I2vxzktmv0VdQ/fg1rv/l088xURZJrN86JOBowDL0tcsDQtnTNBIpscZbPLbPtHc/O0Q
         Fmpw==
X-Forwarded-Encrypted: i=1; AL+hErHI5pVPKrZe7seAMq87EpbpMfOHCwchOtiY0H8Apss+hDjB0LgbJl02DA9dm1wZe8F50VqELPJtG9Az@vger.kernel.org
X-Gm-Message-State: APuU4Z9DAhnQYExU7ByxRdNATOtI1iMVPb9qYctDE0KuVsuPoNBGOLJu
	JFxdKfhgEH6BlaM0vX2OxZ7uiHd7Yfqu+EGZEFdzZzPy+gR+M+KmskHA
X-Gm-Gg: AZFdTZfG7JCSiO4mK2XA4cY5TcWa8AQ9x1I197P13oBmBpChML8j+WJKnMtHYaQ+4mi
	m+puedKzRvAZJBLL4k46wMxGlQGSNrz08Sh87T990eEUFt+Y4a46UFRo4X7dmy9ARcMefNFM1Mg
	waD07wBgf8RxhWfEF/ePG5BASGzhmgD98ppfW4/nkDPRTaXrCUvZw2hTXbxGvSgn/CU0LTOtgSU
	L12QdjZNAzADA8VnzLOV6ZxKbuV3gQZQ6quuFDU/AeztQGhMEmA43M87RljrBHu1dJ5tU7tK+lb
	0VqG3QG590Sp0G5vOTYUNd82lLCgv3/lEcsFt9NJ53ijaExRd5VTUaNZidrsiOMyndd5UrQOSsP
	O53DWjyte1uVBoUeO8HYbaLKGa0Um50MywIpNg+mc8xcaQleYBaYXpcLLTO9n291Xs/ksHoXXh6
	USNffWA4pXWi4rFXy5DclBWaZvR3VziOTGe+D2tD6xaSUUP1qCBG7LsVkNEAN5UDgom4ozNu0Ww
	Jha2BC4na9N4gDuIYKXJIjYXEsQEyDLL9qvvahu+bICH2xClUvbw4N8y4Rq4oSheONqakNUfNYg
	uGP2sYtny7zJDQMvpzyQjqx3X+VH+5cBLbIgu9UZWi41slvZr6MOs1m5VStXPXND6799V5E6yi6
	gnTNH7yOv62VSDHbUkc93/AL/X/hm9zYZj3Y9x9h1ZHsiRjcWs1aB9qM0crE+KWUWVMs4tMvrzS
	TGKf9vMARiNgizanN8uXa4U6M=
X-Received: by 2002:a17:90b:388b:b0:3b3:b8dc:5e0b with SMTP id 98e67ed59e1d1-3b40a5a4cffmr4844165a91.14.1795220799842;
        Fri, 20 Nov 2026 16:26:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:39 -0800 (PST)
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
Subject: [PATCH v3 09/22] ARM: dts: BCM5301X: R6300 v2: add nvram node
Date: Fri, 20 Nov 2026 16:25:49 -0800
Message-ID: <20261121002603.25254-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

