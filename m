Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980901;
	b=2QjXQmbdQs1JcdJHCGfMdLR7F4/+/slpOQTbJsoaY1NeXLtXCQOdbaCCw03bd8ybMHko
	 0XRvwwnYqFzLOopVKb8ZhhMgx33MjNu2T8jWzE2SeJRoMo0nGkQ5DCc6YzcozGssDpyGq
	 Jr8mysea7nuYLgUsuWjUJVdP6yV/0hsLG9xxeg5sF6KBw1itrundS1PzDbE87HcFZM9iY
	 iCfPEKwSU5Dsz/WeG/9Rg6quUT9g97VEhjb4+HBb66VRWardFGRMPeUe9ESrpbTH5PZGM
	 YlUn1HYaaoh0begLXjs8WJa7l21SGAmnk3Hr9M2dHGH1hXAv4sCupPlfQqhpSxGwj7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
	b=yE673SYFlSWZr9v6oSt1sIeiuGtUbpWgM8C9z71U0rKMZ1QIBFjD3qDrVuPOjv43WoEA
	 JMI0hW8op33qmjnyj8/7lUVWcBhMCGS5DPwCoNb7c+axzc3Ywgr3OLjaBrDBvNA5hg8/F
	 ybgytyAmQY0sBOVJfM2OI0yw9QYuj2PBkk0Uwjf2YEYnvKiLybUJmEPvfhtGwayxmyJK9
	 0xG7BrgvNk/NDP5Ur2YM9U8c0fXHWZSPGw4a+A/yyEBZH9KgypCKjgvxCKxQHDhVbu1cB
	 +qbdDTqUlff7fVXpikC3JlH5uJ8mEy64XmnR053sEkS8P3b69mNxbICY0qQTzPveoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L+hTrey/";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C3606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0C3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+hTrey/
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3712b6d9843so734365eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980901; x=1795585701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=L+hTrey/pFPBQoDR3LzeStlUKOIUyACobSgbXtLuCnjiWevhALBSwT2Op3iX/6hLbS
         hAhoqFf48VGBNypObYo9bmjZsKCs+VNAyVteQZ27Qfx59S/4fPBrH5F3NfSX2f3W7XAa
         St8b1hdFVKQtCD4kiT9MnhaGLqs/hjkI4B9L7xq6fT9O2NE8pwhTcJIh5g9rtMmOSSEb
         TVLdOfzc4N2n/GdYC0f9UT3G0JeWRyjyVLn608QU0lh+BxHcurerCjRgVSqBnlSRTera
         NcokI/hXT7HCuh1cJRoYdbpsk+ecmjeneWxeCjIhE4rsWQQuL8n+5A2U1Q/nYiZji5+P
         k6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980901; x=1795585701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=sSuTGXP/3nlNTNrmNcX3VHggJm3QG3CVM+Ut0PaXbVWECVE042XeMzswaBOZOJcQrM
         uLEZijaqX0nKQmpwKLenjP15M7N2YV/5PjNkKLA9vtwDIh9RKeGMfl3PMVKGzfJDAuI+
         OCFpra9LLibeXoRU0bvDPzKjtMWFr1U7RdFGXFOOxunNyNA7jvJ5/U6SJSpygZnO7iBS
         tExf6X9Hbu5QC9F9E+8jFgkK9wHinbI7i/FfYtnze0bmu1BAHJkrHvoIoGDmaGa+8zCM
         wuM9TIfGMjIy3/FpfbEq5zB4O/FE3/Gu8P6ogrZ3sNPzFIrvwOuyOzIFS8xfeoOmuz3c
         kOFg==
X-Forwarded-Encrypted: i=1; AL+hErEBgTsRVjEf4Ws1HoKws43ru8cZO64/flIKt7RI7O09v7YV2DyxW0B5makVU2mYQtC6JDsVSj0YDoDC@vger.kernel.org
X-Gm-Message-State: APuU4Z+TopctOH8IjMzXl9GbNYwThawUnwCRbnZDWtmlIBCRjed7TOyo
	yyBynUcCEyn/k1klCm1LHuCNtbKeuQmoVf1jiTeBevMuicSV8RemMbCT
X-Gm-Gg: AZFdTZcsS3Fqbv6n5RY2uZFDCXGcf3nixHmDgFFD+QLw8rTdRx/r0/Dw8taP1ernH0G
	ItqZ6KMzDrU6Jn33TYFzMqO0ar3PJmatgXtxLAD5QeAtKj2k2DBJsWO3AiyvobOQN+5Pdg9AbD/
	f37UEVCp6w7KhAl6Geekevv8UwfngPNlSxG7/6ReYW7dsZ7YdUbF7l0i4A6GvX+4k2JguasTUmE
	zfltW8cGK/Gy/p611TPR9eEqDhMfA9wUGbEGChcnvGZ0gJFc+AQia12s+vjOJ2kmXayeb4tBfF/
	uIGqAFtwuitwd2h39XneEZu/+LGlucy/86lcKR/7RhJOPPE940WvUyvUyuAaX8QFTNK+HXYiReI
	J0VUZCToAZFZdpRLrwjg380myPuyjcfjs0RcmmfO8aifZfY7z4BxnXWI9GUb8xLsZ/BHlJQaFk1
	R4t+3l0Wmm6hH6Elcsfpxzc3zAgSBz+C9oLd3okaxSpkQgqM01G0r4LwOukDuvrwgtLolPLjrjm
	Ls1tJrUovJ25UX56ef8LKW4PhpFVmAKbfpEva1birdDLfBAHqu6lPFvsspEMe/KKMbFw86QUjmw
	2Ewff0zNuGMpMAsW00BO2qAzfbQArpyD48iYXEIfZQdnk8fZUHnGotuxMYqBwOX11dlNKBVMvy8
	AciwvZBU7E6tUyi+bYM4/Oim7z9WSj8RlSKHnutEfZMsCMmH9zhoq4R2xrmJQ721g14Tck5kp/I
	zAAYwSJcVAP1l+6ikxx+/fx0Q=
X-Received: by 2002:a05:7300:d08c:b0:381:edba:caba with SMTP id 5a478bee46e88-38280a385e5mr1633979eec.17.1794980900726;
        Tue, 17 Nov 2026 21:48:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:20 -0800 (PST)
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
Subject: [PATCH 02/17] ARM: dts: BCM5301X: AC68U: specify switch
Date: Tue, 17 Nov 2026 21:47:43 -0800
Message-ID: <20261118054758.132233-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 6e82d2af9f1c..0f369c5d6a5c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -97,3 +97,40 @@ &gmac2 {
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

