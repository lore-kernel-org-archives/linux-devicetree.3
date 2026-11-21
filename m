Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220793;
	b=xc6as2emp33b7HMoy44HfHDklkKcOIqmuXwVw1Mq08khVNZTG0fpj4RgyUCamS9xL3Ab
	 7ButUnI5hKj2fNhqxd7hgYzBJ/VHdrscfVi06gh1dBQUywS7a3zrDzvOpU8lCd6xz6lRr
	 lkih/fKAk4xTqEnykhtLOABM+x1eUYJ8lQerAuv+nAbHMO+jUXUSMdeWbklOJmMWXd9Mv
	 XKPVnDn4hR0GNoKP2riK7K2/5ZVLVy43to2tO6JbMpOutmlfssiLsaQwByr0LyYGc2C4z
	 42BD9hOiCIZz4Uyr6EIl4o1jyOGEuvUfBI8sp7qxQn1HlSHZLgNgdVir0XkM7D2xeEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
	b=H+BOH97B0xftqR5f3qogvK6TcfuTkS/zS2vTGG9gljbcLCOkKFOEgJYE1ysdhyU4ltI8
	 9e29FZboW8K0rgXJiqkmtF8FRD6dpasGjABkHh/zQ4TpZUbqEXhPyBzmUfiY3TkxkwKAa
	 6ZlQLqlpD4KIEsGt988/knWrEnjfaFWYVnjhB+iURmPWqwRyulfosvZ/luxz3qfmnKV1i
	 7cO8eRevBgm2VvE9s6Q0qwx8hfIJTeDmVRqGkSiDXRWfRZmLRph9ZCfEQr25tBbC64Kb5
	 FltxYUnKK6OSy8ugRQ5jvwzwc7uUO9l8RiN1ansLv6cqiat2H2ARb7FvUOILxJfKmzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PH4d+QPa;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A32606A692
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A32606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PH4d+QPa
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1423891a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220790; x=1795825590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=PH4d+QPatWYzW9o/r+gfWgiQDsHYEKP68qm+R+I6pBfp2IE4BLaMdvXBfZmRLhWjga
         0qMMBx20ELtzihgvizH6K1KAgA5waW/ODaFWiJ0jNedRyvJPiL/fl6/K8ndfKq2VF0EX
         A9XB5w9s1sYPi7FqFl1sq/PiQNGmxls+ikBIMo3k7DuewMtbc89ZRYcm98OzMJqki6yH
         VlwUbazhqZujDHJCFTDh59RwzIltHs103HduDiFr6kXRXLaH35c1tX0RTp+bstnWXGne
         JuHtQNEfQcezjqMBxFtvB7xPq0/ajkKS6zzmobAiXlq1RDt03wLDESdFL+pH9PW+MxGl
         HnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220790; x=1795825590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=KrVI8SjPiSc2qBVD3EGoOYOjnEZZ4fDnesRT/VrJhfGCrqfTCf8ZZZAcQQ0mfJEqWm
         9jdQJKApXXBVQZmKlLI9JSBh4PRWOJ9EPO5dKvWYh791P8vxrHEq4dH3ImKTsdwv4qya
         MNl3m+Feg0BqXfwn/ySvF/9Fb1GDSbq9LAeoK1b67G5Jh9Ah87MTveWMwy2UerBsfBAy
         GGHksHn3YAf1CobtHkmRoB2YvPsFwitq5JGcqWAg5xTdqGOduPfvd3M1gpaDrQRq961a
         TG6hTW2fKIYEINsvqo2YjVNnuIoeeCkR4yNreZ1EMaVVTF1zvlUCWTUsHJwE7tPsZ/Ih
         Uz2Q==
X-Forwarded-Encrypted: i=1; AL+hErEL1esC3HWCa3zeJ8y/+j6uI2zpeKpHEVzn55cbHmMN9xPkKRqLqMlN6dvXcPaMGHbjI4lzljhoAyne@vger.kernel.org
X-Gm-Message-State: APuU4Z8wYXsk5lcRSD/X2ygpbg31JgbomFDd42lvmQ3h7rPBJdtaf4Yg
	p5gkgqjc7+Hb2XOfyuAhx70GANQcbhCoblM6QZ4dHNKPGl2BUjxrPeSN
X-Gm-Gg: AZFdTZfjVKs2zuI+MuRbehUp47BpNY328686G0q6f9XjDCCvV5EeRFA1OPZPorisIB4
	rwqqiby3g5QX1amvqIYuQJE+c+/zTYHPwFQRe/9LlsWtzcozsXr9ate2xSugB/GWJtVbetWMVCx
	mT67USu05ocLFb4aSDt2xmi3rPR+BcQ6WjA9+yKunUYQypZG7yKDExlA2KZ4ts9q919ApUgsUZw
	FTew2xihmEtd/3Enl73BVRpDE91ZQfdn7Eq2J35PhUcU2NWYdhY27RJp8hfr63ClW1TNouHUx4r
	aJfKRhfhmJYYIaBgJUWPncbxk5KyZKD9swSUIdhkcf0qgq+Wh4y7lw6pY/R7HJinJs8sFOKUSCO
	+xgte3U0SDrWuC2N9faNXw7GozbN+srawabSiUq5AnLLhUioUS6RSdzGn64qLHamJF1aEUloKqc
	EgxvPjcJ8F3ynWP7H3UPn4OmQ6XpPeBmpj1E0Y33lOFR/ffRm4T+nbab9LvnBSvHhdeH66XvBqT
	JkGcwgHaI32narv/xD/GZv9U95+YmEDD85r1NkdPL+DvbECum8cQsesvYcELUomy49nN9brfPZf
	F584WlCFC8sMBAY+e7y7uKlv4CVccDNRx0rxfs6/bA6zYpXduyTDK0Mqlkg8ycNqNYhXbPYOwwG
	XIZNt9KIoL7ctVjtdCWkuNji9e0G3YLHLwTFtDHALl1qweviFXJ0MpApQ/mjQl9oCuedqEkvS83
	JW0G0=
X-Received: by 2002:a17:90b:164d:b0:3b3:a575:846a with SMTP id 98e67ed59e1d1-3b40a5de1bcmr4439665a91.22.1795220789943;
        Fri, 20 Nov 2026 16:26:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:29 -0800 (PST)
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
Subject: [PATCH v3 04/22] ARM: dts: BCM5301X: R7000: specify switch
Date: Fri, 20 Nov 2026 16:25:44 -0800
Message-ID: <20261121002603.25254-5-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 6ea845f3ac1d..65affe615bb8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -118,3 +118,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

