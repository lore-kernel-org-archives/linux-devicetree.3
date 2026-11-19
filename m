Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078522;
	b=NFyjIOgw1gzpSv2m31s1joIrgk3RNmeIuNRuigcS3JmmS6soYK3B18O/ClrtbegAauUH
	 B5DE8QgEvg1iz+Ms0JzrlCDs7xk/kAOwx2JGSKqGJ5Wn8elo+0ALN6tdL+3iOeC8Hqd7B
	 e3YizS1RnpDdQ+JSOOnuxDF5BpI0mdJOhGh3wlkERlz5TtXbLlPwKpJCp9XGeP1tlOwqN
	 UTgxZO/133UGQv/Z8MT9ObrM7S62BJwh5NaIdP3iMiVDg0es1QajzTeriHnn4dHoPrBn/
	 PZyZyputXpYCIUyYjZnfcDIozzArWLWma73vzMqw/8N0XuK5S1fdrQvjvPGnreTn/Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
	b=FExcUzbA+jT3gONrX1XFjauP6mPBaECRNXL3791I2q9/FIA3lr590WsEfMefRppnLZDk
	 tMsOjeBIsOdaNK09EOVn/CXgM0ktQm+//lso6A/MuX6TMMoD5Ns7F0hFHSFFd86rZ6oPJ
	 h41OwTUfGf1pRppN9zGkVSCzyFK8oozPlrsm0T8Npb9eZQhlXSt7F8kPRpZYM8aIpFOJt
	 qxfwxjSoLOFb8Pz1I64z3hMRH6lm44av9CMVEDscm4rtQ3Mcvsqu8jUY78/hIEQbPbd9Q
	 Vl700HUYGDeyOGZbh30b6Op9btnEODskSZwBSfz/z4wM8WlQsIvjLfwU0UyoPJ7ksFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDy7PzXS;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E74606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDy7PzXS
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365f9a04c5so26193001cf.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078521; x=1795683321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=dDy7PzXStOg6pD2PZPkm70zJFKNubJSwMFZqmR7f8bKzzLzumPy/8SnHpqo+8MYlrw
         ewBj5JvAzlCdE/g7wtn9XHdXDSVtHIBsMoKgcy45jmShrEyf7IzePIXotmM5cLHrjzJ0
         Bwbx7OVfiTBwT77HebTWIBY22QQCU9/8bXCsOJcjXOrrJ0WbHzGBKXaSajz1IN1o8TG5
         nnpDMcQdUOmm4z8RfOQyvIcoCibgdNhGY+TVHgMxr5Zuw7uHK1e6Edgn2LJFbwcjvLcC
         wanHGBfILOxiEp10z35mXm9Fn8zXacVfyULMzTzx1SqtdKBNpfRJUvfXstp8ysJ6KTFy
         fnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078521; x=1795683321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=o4eQ9b5vSpasB5dAMoujLavMJcAThQpPc5bcGKjHyWHg7oAfUCpTDzD9fTk5UwAo7y
         oVcAcJSKLtw8/lUuX9YwweeRq1LcP3kXg5/04NQ8hwd4lqRDE0f8qqfle4PUApgFp050
         GE4l4bI3tLzHVcGZ+qtJJuhzicrNDJqd3wNRl08cfoGd8YJsHu5Bnp32Tog7G4kKkZKb
         /hcMzSIfqWQqy9UexaldnseOPuj4wL/YtalZzHo4M/FW8qKX41W82O4kYkU+86hA4a/Q
         MU3A1DRSUCLWyZJJotyRQfGUi2fkuci4dulUX/H9fbYYPdHMRw+iLGvd0cxY/uYEdr4g
         Wc/w==
X-Forwarded-Encrypted: i=1; AL+hErEwWU8LVGk3vEt25K3PHh2oZ1fN92M0AF9gX1h4LzeStimDd0rA7Kn2qvMRkAy6Qmb4WAW4+Rs2VeeX@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQJrvLARcY2531lvIzLEfuIwi0vgrtUM0PfjfWUAJuegkMUWb
	CPlAHubfdB/4VuPIAIGxYHe0G9vPoS8473o7tVed6LATqKY8xjogvEyJ
X-Gm-Gg: AYBFou2FSJlpzMRFwxg+vbSL7mboZO/j/5GNRB0pc+CMY0bXDdStJTu7lGfdqHjaU2q
	cnL9rNhOARL7Wm8BHx0Zn1oTPWkt7UCGlCsc9r3mNJKElfqovfBn0gGWLOFcL27WJ8Ryb7XmCj0
	niS4UNZpItEwpbYctBa3UT0B/3ttboPKB03GSPeU4Kd4DBazX7TYjwHRbjYUz5H7tjxwklSRT9H
	ip+c8rEj6NtwVcuQ9yDRqOoC3NIJH442F8MSsDrm5Cx4yZ0/tgVyxmZhzaMtDpkXT8x8VZQLt6C
	mVBuhUeSXHatpXGm4BSxAAro6K9GMU6uUizuEWnqhQefrsmz+1q52lHqsMmnSIfp9QKAPd+Zzhu
	aMAkotW7ioDPrsF+eFgBZt031VrFYJUAPZyUfXtIxVz11Y+PIrq4NgXEHF7MXkqowv7XLMjHolI
	u1SjO6KAekvzoVA9dD7ZDJv+f/9z2ubanNFtCm53hqvEjy+lGfCJjE0P/E524ox5oc2s12+S/Vx
	YRwyNsS2HcrdZF/RKTCd5EvHnGHyqP9dFr66XEAQvCweqR/z/SbSOrzklfZpXfLY4pj576/5UOn
	/+pXJRu4jrZm6SfhdmcQoZyhlqHPzdauxDXw4iBFxy6h0aYYHvXZ/1o4zAkeIwedXK7IVhUtqDU
	ExO6GDC/9EnRQCUj4rImjTyGKHAq08EWXjTYlHOA4hAe/J/sUZqgfkzP+funMI42JJrJMx+Q/g7
	W1tNQ0iLE7UeKRIxwKmWTyclki
X-Received: by 2002:a05:622a:991:b0:536:8e69:8fe6 with SMTP id d75a77b69052e-55d5a572c53mr89110101cf.14.1795078521191;
        Thu, 19 Nov 2026 00:55:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:20 -0800 (PST)
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
Subject: [PATCH v2 05/22] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Thu, 19 Nov 2026 00:54:35 -0800
Message-ID: <20261119085452.75708-6-rosenp@gmail.com>
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

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
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

