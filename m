Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220804;
	b=qG2qKcgmiTdINFkSjDzANKrDXAGDcPRtDNCewluCye1zSfptsgr9LqhCKMmWilrncoF4
	 R4S6EReTqfwS5k+GaHKQSJDQzq/zHFSAmCe87nx7UsZ7L42fDkdN4c3M7YccaPVSpUHzE
	 nKo38ePZWe/de9BjDC85mq2BzEpyI+z7staCFs6IPmZ6fMdvEPIVdPfSPG9YIpHJ9GA81
	 O93MzM53VbUFPonMJc0Q/hH1wUOokam7O1tnQqmkM3h8tL+kr+ryg5A5QGYoeUSaGLZRA
	 6au4NAQLGW/2ZV50l9h7n32b+MdSwS7l/cojyo4XkIK7/1w6ONw52mTYMDfkmY5RKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
	b=rFw5YETNecgfu0es7skCeu0WHQUG31N2YBBJUq50GvP1tE9ByXo6OO94OZ6Aa0w/dw5o
	 jPVScFQ0V3PYzcPiCuax9CPNiDhve8qdVrrSFmYCRXv+255S+4HIA9wUaNJsBAFvUezvC
	 om401+MOyS+8MQgZrJT5HWUnbimDppVp7RLfKbuh+vJVCnXBzY3NjXze+uk4/dcOMeOF3
	 nRJlVd20nf0tAmQ7IUzkJXTpk7DFZIM4XWDdSruj3lPJdn3CZhBp4vpzhNAAoAL5578Sb
	 KGm6RfXswiuFEjWNewUsd5JtSaRnXkZdMPYzQzmTbpDIod/sHlf/mpE8BmSsXkOV0UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fnwz2T+;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DFF606A6BD
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DFF606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fnwz2T+
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso809246a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220803; x=1795825603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=0fnwz2T+09Jpam9RYsrcWaJ05M7TXgh42ZIkumyAGyE6e5JFRoXTOnwWppCRF18TZl
         50gBKzJjwAhjrnEMEW/FA4oPlCkiVmlGNAkD1iS0oZTJ1HYZ6r6m7Vt+p+GpkG9uXxLc
         rxd3xiapfChYYFSAgqbHQbln0Xww+T/Fgc2vglI6VYQyLKoauinU5Uq/wHZR5x9ooXvG
         KRb2gWmtMYelOZug+PBlLQm+efT6VZ1YjfTptkNBFd+arKg6hkf1zu0DGcXMH7oxb/uC
         fo1/5F8tB4nqcTUPiLSpcho9SIEDcUR38vr8r1rFyA6pIQ5ukbDpA5pqFkQoGL3s4UKz
         Xw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220803; x=1795825603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=hgbzYgYqoPSXLZ8k4XdbMvZkw1COuTRPWIoyuV8aQQdgDHyh6nzf3EqIGYeV4S6Ne0
         AlZ0krJck5P+K+fcOJcIgOFwGTqPbBUKyiAImd5AJrDBsQi2+ASHRhyh1GuuaKqTR8xt
         fB4LuJ9Rd32piE5K8TzHoBhjJiAssXh5+y/BcAQE+IOuJMFa0VC/xHrBC7yAer99PjxT
         VCqTDvEJUDLNiIuBVHsm+ktYJJo815NztJoZRa+YSfZnBm6yWYDKpYQIL4CUVVhRijz5
         VL7LHn/Lx1mZSGt2aVeKb3yVq/SNUV1RZkb9o4IMcdhpmJI8iPJhPsTuUCaAcMsatsye
         t5cg==
X-Forwarded-Encrypted: i=1; AL+hErHJsvzG//aHgf74/soxHTkGosAYQbToINiJKNnz8viySXdebzT8SpK8p1ZB7ZFix2fGvCnAF/h2aP/u@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZjZeguNi3yTGwh0VjCxPZrlhy/ERB9eMw1r+F9smm95796AfA
	lXY6xyqSzoAEL9xVm+nu9WXIe13wkO/vRnnItwl82kwEATxbue7O3dzo
X-Gm-Gg: AYBFou34uSFiabOY8T7gk8pSnWtyVrUKTOYd639jSk5RHrQ3u/YQhaVH6THLgg7ppuS
	YXqRonE21To4+EIv6isiN1x6AOc8lCbAs4acAjGsNG0728dHDOIHNz8CR/c6E5ovv86c4huh/jA
	allJPtiHVeSBqFqbQogwZGokZ76Pwyq/aVNTSpoP7+JDzOSS359OFJ7M8qTXmiNvMEbfwoG2Ita
	G74GT0zq51H0PDx/1fL5oSsNI731Sizeze3w8kjP0XAqbkDnP3XcnpiI4CsWUxBgIFoKwOaJBj2
	r7w/VBZ88IUBeAr/8o6OJuWfmxCsKkgDxOFaZHhIEzlk++roPEAjGrXpfh5Z+fSyfu7BY6FGGBp
	UPYCctp2juj22PNhVodN3znnXRS5nbUU1C0844/B5F9vViUuMRATVAkspNC7SvdMbSb+gBGnBnb
	PL0znRHiyK1PF1GEiEzXkLKimyFhvXKWYNlD0fBJuYVyU7JHgvYdpbcgHqE4Hzit7EtasYPISoo
	RyPWP2a5L9u7mwuqxKxdrIAkXHN7cTvcuVW/IuW+9tAPYawmrWaTKZKeN28H+gBmlqWlx5k/ZKC
	keW9KvNfUKaWWh6FmWBtIKWLtKWib6bklkqEGUQF8LQzZzhJYORgNyWQhQzTGrtTmHR0D7CW8ig
	lx56nwvDi4LJPqq21/OnjrzQKB+9RII3XKwfWsGO/uAY6ugMGIPSJF6etaLKpfEDT2TGEICBuCk
	tDsA==
X-Received: by 2002:a05:6a20:258d:b0:3e2:26a2:794 with SMTP id adf61e73a8af0-400ae7231c7mr4940330637.38.1795220802790;
        Fri, 20 Nov 2026 16:26:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:42 -0800 (PST)
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
Subject: [PATCH v3 11/22] ARM: dts: BCM5301X: EA6500 v2: add nvram node
Date: Fri, 20 Nov 2026 16:25:51 -0800
Message-ID: <20261121002603.25254-12-rosenp@gmail.com>
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

