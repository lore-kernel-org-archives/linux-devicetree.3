Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341157;
	b=LdWvMUB04ito+a308xKdN4pWqtxk7G7WDPNXhhIf3/+wACXuy/wT1KBZWPqYRYZ5X9O3
	 iZxGyIVR75qTsaGYRODVAJc9Dvzh+WtlfLoIL+lMaVzDt9w99POSXAtklISh+bHitXWSS
	 0fr+eej78o+QTcOP143fXEcy/fq4t010eONwG+HJWp07HCBi2Z1FAbvjfIKV2HBatPq8x
	 w3rMEJ1B5npMDAOD4zXrxLcwZxrQbb9xgV8Ej8AxrdtacEuAAYgEiIq0MJ4C7y5BVEnOI
	 U2+AynNa8MLH79b0ee4AMZ3qhjT3OVNtGf21wSKjzdyQfYTLpFEXlAPrvrGt7UnBeLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
	b=WdJ9DCEk0OXUQqah4BinDfY/VWkMgJCML/ELdPoI98KanPhqC9uiXveqwW++Mdkwg0nM
	 HRKZSaLmHoeGexCgiOZvrRLTyRFTEIRjdIDaajl0V/m0Ie8BIiU4Be29WynECL3x7mfoe
	 iG5HKUb1mCpWYTk/U1M8/FmWQkcyaRxZkDNb5AOpqgkPJ4/UFTN1cWbkgTwRj0GRmBqgT
	 PCSLSXqQsDRyEtSTWtoltjPDubIPi2EkgrFrn9YgBI6fDSeoy4gIqqn0XHI96pt083Kxq
	 ERgcJ360i4WxWwZXaxhlKa1e7GgUFdBi/x3XlqWpXMtJrQ5nTd4voPvYk7EJa0zxisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc6jAil9;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69543606A335
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69543606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc6jAil9
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1461298a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341157; x=1795945957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=jc6jAil9z2zvZbxO4xGlpYKIJ8urF87mVF1dLL66/t+8qftxuzdOmfygxVPIQp8kx+
         o6cEKdjm+LwXNiBkQnS+dQiOF4pFBF5r47Y7Hs5Pm3Vetzjo38ugwkP+p+ag2GXJYB5W
         wxLknGQNRDr1aruFnn3fdgekO1gtkg4PRQ1hG1UfE+l0az80x1vCd1dIIGUDLUMGXmw+
         Ed1FK24DtH3koPynxUZC6IaQ/08DPEjq9qvfq0z6A6mhbo68wPep5Zo3dwqiT9tayX+q
         QWQ1qVuQss5xmRXXujiTMbT5gbwxlOXWC9C0ATwBoO2mTrJH7nVci3U1BUG6XDql9DzN
         Z/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341157; x=1795945957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hkM21HuHsoo/xKTtTZspcbr8ShtbfKXKLIxiD4q2iM=;
        b=cyzOHhLPQW3lUVwy9rZP4ajcudAUFroHi4vjyFIVp1WruUkJP0FWj4YcgUimGTlrL4
         m5jX5HuOyjf4MrL5EPaq6NWLReiYIgLx+rxum6nhvh/1PI2BsoEWArel6dZk14950LGu
         OnAqrO/T+N7JK6ofdaLuJtHXsSdbuiKkkOwFUmh9NkrPsCAegQHlUr5gHqyWHROhyVVg
         LiQSU/y58pVXCmFAO4Dn2ziRINuBIuod/qEyAQ+B6g71uNftgKPeuIKFvceZvGPAyc1F
         DidkYekvJ3mLuwQKpenwF3BbBWAT1FZc/2wOIvG/oekp7ZzDec0zeWzE4IqAOMMYfYd0
         qG6Q==
X-Forwarded-Encrypted: i=1; AL+hErFbQh46zkkv9ETSS5k9uq6nTT74gCjD1pdu/3+upuivsoClVZ6VBAsH0D7RHSSU7UtBh4QfZzRkLvE0@vger.kernel.org
X-Gm-Message-State: APuU4Z+8XF60CrA6Aa6KdtjtS/j6jW7HOinuPwu9oj5wB2VlIWUGcd1S
	CuVqjinulFrIbE7xRfbxsmwyW3npZh57JFuQrhxhIPxWAiMu8PMVyXs9
X-Gm-Gg: AZFdTZdrBf89wDGDoO+9isNxUlWzac2nOLokzmR6cNGg+0HEHQevoabiWbVMvBy6kY5
	zvTLQXi22kacELI5QP4wXBtVH7+IDhNELxdoLg+/onejSpbz5bba8u27K3d8iB+Aqw4HejDBfVU
	3e9+3wY/PiErXVr2z6g2rAi311SkNo1bJCQhQmyJkHGrqZ2EVvO8DkCy0eS6TPDxhhR8O08TKLq
	miWblkuavb+l47pGDEhjdF1bChHpWeh9iT9VNBOPbjELwU3reDPSx9PHytrV6Ar4qCUVWDVWGm8
	wbORNXyaMGEkiolXpAHR3lCkvJ1/Qt4743HPVSnLZmKO8OsIVL3TiBAV0bv5PHNK/pmXlakeSEf
	hYEapAuOE4G9xbt8iIsuP+dSkYgpS0TRPMz7EDUsiag5WDjqFnp1vWjcMNfyJVtR84L8rGkgKMT
	yuIqcpkUJmJwgz0LZzLeCFBXU/vdMhnkEYwRxZVTAGZFM/QkR1ugigi26Zt50glg4ouzuciH5HM
	1xKDRrHDkGlhl7wvXxdEHePw4qXLsAgYfF39haznNmeHiO4ZTeLNeb8DD5LKUqZ/m7nTKcmcdrB
	+QmZ/s6ks91uGYhSF1mmbgsI/IoJP7omGkx/eUOTTadeRFyoWVY=
X-Received: by 2002:a05:6a20:cc0b:b0:400:a999:d213 with SMTP id adf61e73a8af0-4014c25005fmr8350276637.23.1795341156757;
        Sun, 22 Nov 2026 01:52:36 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:35 -0800 (PST)
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
Subject: [PATCH 2/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Model B
Date: Sun, 22 Nov 2026 03:52:25 -0600
Message-ID: <20261122095225.200916-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

Replace the deprecated LED fragment with a board-local gpio-leds
node, preserving the ACT LED GPIO assignment and configuration.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..040ba7f45216 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
@@ -3,7 +3,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-smsc9512.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
@@ -93,8 +92,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
+			label = "ACT";
+			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &pwm {
-- 
2.56.1

