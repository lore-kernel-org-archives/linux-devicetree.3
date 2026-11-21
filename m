Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220811;
	b=hLscCUVWkvdxHnPtD3aZEUwvO5hjHU+gDEQOlC+0PaUiZ5n3GSvsZfSk1n4hU3RgE5Sr
	 mAPvJb6NuTydFl+ZBmyNjIQeSOjf4Cx93y+b65PSNZzSEAmP8XSJkn2Vk6ITmK+EgmyCO
	 7hWWPAKHAgNz9BKbvejbnMcsJg27Ue27VSlbkBjI2kukCUqIUZ8T32LMTHD5XGUzF3lWL
	 a630cKBlXtQxNKtW9wcdG4mKnauLWMe7mDD1MPgP7O3SQjrPR/pIcniDDXE6a6D5bgwIi
	 L7kGbr9kJ/6AnU8Mqv/ubZe2p1po4UA3znRSsQnnqIVK3gQ/87wbOfKX27qvmJFvjWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
	b=usHduJPD5IQShUEIHX1UqfhdkWkmQhypXNJRC7RLr1QUXMaTAkDJs8NsV4h3gX5SW822
	 F2QLSuW22ScZeVUUkW1bl7y91iAMPTEhR8X0RmKAwy/18z58GTq7TlZ+iuPwHSoP408M6
	 4tM8IjHXVlGZAwqWTOH5MmJR1s7gk+tf5KpmoD28bcyYy/hUAJ4qz+NQOcK05YjRYWgeY
	 We5mTVxTF4T7gtxGHw7jHZ6qCu7tE8OT5sZtSBS1PvLxW+SmwHw40SksAX7O/bwrWYfMp
	 u/StwY3IzAuuMtKj/DJpHGZAonRN3QtpIS9fFHgHtEkoo6okl1kjmz2mRgYRaFA+vJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSDD2kgU;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B773D606A69E
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B773D606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSDD2kgU
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b271e573adso704436b3a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220807; x=1795825607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=HSDD2kgUSoniuMesX5EtD/7iVWHRY1+XIPrdKG39vjZFNZk48WCkY3/eLhWBwnwYI4
         i82xfuZtaqosPnWQf9vsYkpXvOi2odBUcgLH7gmNaerrPUXpq0m+An9nlIpwHcZCV9UU
         DT/3pct47JyunMVHlpa9Jk8Cw+fgQ8BzmvOJgPORioCH5ILIBlOUL+BEM/ulpV+IZre0
         cCED9qgPdNpsbDOsjnlpamAEyFDBUAWvPhMro1JgtVC598/Cz4q0XLwkwu5vf+QR7fmj
         pImHbj0Aqsbduruz/X9QLUVfGl+TFWVm5cVKp1pbA5z9pR9ngJ4oc+mVmadf9PQHgbs0
         D/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220807; x=1795825607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=m/MMrKop3SKX1qtaFVmsmKFZBK2eyhW0LXS5Ql1HLaQyXR6kzNEbBQDb1AOwDFSD+V
         VJ4bGFub49qFoyz2Cb2LkkRoBydjkM1KI6I2cT81mtNzX9TrgiaOBmV6HHfDFo52LMB0
         mg8hb9pphZ8itfkRZDh1+X8jLt5ssjrAkVGEO4Qnb6b76u/PRWxMqyD3wQnGJBT0HnPA
         ManYu5ooaWu3VwLQXW86+HL7svAUnsfgLw8AjYUtXTBZbc8M+XuYYcdj90E40KOzaeRU
         cmcA2/BhGo+eFQhdBNAMjwV5vXeWySYz4EtrqW8Xj+3BVBxIhDoGjLZhbG8szZPwB9o/
         8muA==
X-Forwarded-Encrypted: i=1; AL+hErFuSaK4a4dbDA6wpH/MtDByPwby0FVZDc866VT+uqDeRGjBpW/WHZe3tjZwPTG5GOintJ8cIFM6/azS@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wggy/XNcwesDZlLtBPirPmj5kNNLQ/04V66SLbl1nJpGQIU9G
	e2P4wacLUiz/Gdw34ZUbkoClmXNpPN3lz0/SqsF6z2ytbFSray07+q+Q
X-Gm-Gg: AYBFou2rZGJ1yYdYZiNjNT/cyWNc71E2ZVTKXTTLL/D+BDab9vnl83qLM2rzHe2Ijff
	lZtTcqsUkyzHyNCVYnlUuLvOHXMqA7FQUEBNDrw2KPqhqXhVAM5doirc7H+MJiQwVDYvSQ5W7Gz
	/fl4pvZnIrzmicq3jKjC04SIJIGBPEQTBMd/BbQlIJz01tTMjysF4bkq0DMoW5KWMr20xLHuPsr
	KNC3q+rNxquFEhIOIPNaH3Qbu+vET5d0AZK1dF7bTxMg8IP+dByKD6L+TDaqNHiGedyfQ02nVzP
	HzKYTVWkN3u99ZNjWLvkl52TdvyTS2lhjqCHiWHtGG+DEePqRC3h859mQGlCAzBD+xVB8dXHim6
	opzjEeR//f8ijRz5Kneo14uVsFosoT+7m8HEcaVU3EIzh2nMZ6lOcLGYH2Z1n+1yOT4ahF/iP0Z
	JKItPft96xc++yjmhX/3j6Y8TEs2p6ZufTN5ZIpgEkwqo6TrmCmDOm8Y6m+rEdUYAocxBDC98JU
	boMJ16rZ8ff8uVTkpIuKawvGcX6HC+yz8FBeA8bhwNRs9L0gbuGHaPS1q8HXDFEoMi9xWy+w8t3
	DzQWbMwHjAlIkqJH2ozf5VxhoiJYdUn5YokRsPOODnKdIsunBomfdWpf56i9s542a4DS4nPvjsD
	r/SdzxQx33EIvurXzYH2Cb/Tze0mKr1cmSIb+BHgZPpmP8kJ4/62ugoAbwlx16DLkAUO46Zm/H2
	7+kg==
X-Received: by 2002:a05:6a21:3b8d:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-4014b564525mr5328137637.23.1795220806943;
        Fri, 20 Nov 2026 16:26:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:46 -0800 (PST)
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
Subject: [PATCH v3 14/22] ARM: dts: BCM5301X: R8500: specify switch
Date: Fri, 20 Nov 2026 16:25:54 -0800
Message-ID: <20261121002603.25254-15-rosenp@gmail.com>
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

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index d312afdb750f..2518f25b0eaa 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -108,3 +108,40 @@ &gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
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
+			nvmem-cells = <&et2macaddr 1>;
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

