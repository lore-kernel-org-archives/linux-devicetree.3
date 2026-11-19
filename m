Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078517;
	b=Ob9wHtBGCywX6/iagBCMxqDHGFYRipNrpPOghSeif6IiTJEM8ID61CUK649fyqK/6Rsj
	 ZZ/9ESfFf3nN1YjjE3Df42EAFVxHSdLe2LQfpRTj6ti5ELbxLs3Ds5jfFnboOy23emZTv
	 4tWhSqRIn7V/sMRBmY2vLthcjJ4ycIGMX7/AzUnz5ZdhDASh0yGoloFFO9X9tt36XXwmR
	 vtWexppoqrdcnufUyaSZcAA41ov35YG/Oaj6+gcqaTPrHHmeGRjX6UzL5xWJVoFcBb3NR
	 hUE0NZ1okrQlEnkQaawz/avw7OJrAl+LyJOnob84MDeD2CZ5pGLXXNFfJR8Fst9DD1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
	b=4Su5NlPWAUfsrJ4O1+jMkF4H6d7mJyZGUmSaYndcVJ0uL4lHeIXj5JQcYFn+8lB94M2Y
	 6sdCSq/jDRp6nB2xRgBOcnB1C++RTzf23uVJxHwQd9pekPSO3HRBbCaXqKvaS0d8SPPOC
	 bFWPTkG6ihDQeVd/Tethnghh77fzo/QU2xyvzVqQvFtiBDPpCpyrr86Xe6zKUIr+L6uey
	 GHi4Pd56A2tKsDNDKLZgcFfkDntp5ESvDWp2FvR4g/UiYuDySWBX6FmwJAUEvj53EUb/T
	 +laRUTbzXHk8EnxXeviHM/hg4olAcZ6JNgDF+IusVryDnVhb2sx1VhMteLfQ7DoILeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yt6z1ghO;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7F606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C7F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yt6z1ghO
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5495d549924so21769981cf.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078515; x=1795683315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=Yt6z1ghOExocefwtC03PDIobYWxNMbeq3KChIYaFWypD9JH82S90uGj7LuiAcgJhXB
         xekxZ4GcZAtd2b2auMxS4why9wIXqlqCoNVpNUyKRFJzQ82pUVLgGb3afVibkmpv4iJB
         0Vc8FxKp7XSLb4cYI5ypqNZesEKvdGzxmN7ICTlJElr/dky7HY4niJ9uqLfkAVOaLwTx
         45YfaxvN57WO3w+frqwJbzVyIa3/MkaqE3vPwJ+nuTw41dv32cB1QXViOeomiy5DFTH7
         VEVQKxHNgFuNldezuw7miqXx2UF3mb2X8oIWPRlheN388LyEyqhAkXBDeWLkKX3h8R4r
         y/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078515; x=1795683315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=TPlu6obgjzz9PsPtGOVs3B1ZTM47Ixsa6ladN2O3edtjPzXn39ivxP4w7dfaFc/1qO
         8SZZVF0L+bw+z9Io22+5GDrMcnwUsGlDxCeIjPc/V4X3X5d5WO046uq555NSvCtkY/zX
         6SeY20GBvgq3qfO4mV5TOlNOYpcljZuO94BIha9FQALbD6qsAViWt5Dt4HbS2KDdarvK
         BAmG+h6iY4tmreqNfgLDe1jvkQ2FCDblv6P+tN9aYdOs6Kk7H3qBXLOLnd/2RmlwFNKh
         BMIKoQtBYVEClEwOYHa/nrUXl5PGTf+MJ8bJVkoTVFjuxuavIrk9gzBhb/JWhsQ8u3AB
         iIzg==
X-Forwarded-Encrypted: i=1; AL+hErERH+xju2jvLsWZBn2+SQiO6hUi+HQn+veWElbqciu+TMGdr9RYz73hcMegoNE5AALiSVZy62r4XAah@vger.kernel.org
X-Gm-Message-State: APuU4Z/loO6L1hnrSWG5u5xEFYIUDNtP25WRl3nB8SLqhyaTbxlXI19p
	fak2xManelmJuzDULzw424uM92BTR1TTf++x/CAwKJC+eqLpIuk9Nmdm
X-Gm-Gg: AYBFou0M7IBAsKBIVWPSltyNoW3K2yBhQxkAhbAWFERkwcUwi2K6YetVHuwLa1mhpLi
	ULXnRIJbYlchNhrPvf/OJiPe+P9lGapQ/I8EC4G2jbEGkAv7hk0KDqR2dc+0zlXmipuuzykXtnv
	qSgpelu7wN5Cykh5zyV4vlw++ziAy3kxq/8maWZhQzZXO2hjNxa+NGO4EV6zaZhlDqV8poXCHkZ
	fZT9sSPio6B2UmfhdssVCEaxX0YvFR7iGnyH4tvswCmvPyXi4hrGFci/BxCD2YbmTSh2pMUn2yz
	9h/ps3u4fvb8XxKjm0oMW14MskWYLScYIxgGRXc2qC2uAXygJXnd0bF8xBEW75rsz2Lm5AhnLlD
	ixktW2Dv+cY981f09OrOcgEHpU+OyI57hXfMRyFMLGh8+1FNUrpm4g5c5b22/iAmRnN/Af3vWzg
	SXdONKQ7HYXUKeJxIZ7gN0hMDTUhTtiCYPsnI6EcKynVJoTGiediEB+332Kkd+vkr28/RIPBlJI
	DFj5b/xqfllM7jGGx9MsG7TK9K6F4tis9gM3WIVYxWu1hIU851h4tppSweDunMqTYMkMuDYpg1W
	6K03TH0mDdXVhKe+vksUyqGFXZo0obN6ygqKmR/1q/vx4IIVAgcZhedzYZNtMXmEWOULsYnZubu
	vnhfTL9QhpoIfKb1WCYw1uH6bn9ygbYZM7y4/IWYyqXarxgOqI4AI7ddPS7/wcL1W5PPZXaOKCh
	Fjeg==
X-Received: by 2002:ac8:598f:0:b0:55a:5056:d3c1 with SMTP id d75a77b69052e-55d5a57db2dmr88309061cf.13.1795078515418;
        Thu, 19 Nov 2026 00:55:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:15 -0800 (PST)
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
Subject: [PATCH v2 02/22] ARM: dts: BCM5301X: AC68U: specify switch
Date: Thu, 19 Nov 2026 00:54:32 -0800
Message-ID: <20261119085452.75708-3-rosenp@gmail.com>
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

