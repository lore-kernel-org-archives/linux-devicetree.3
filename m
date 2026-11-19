Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078528;
	b=GODV5mflXcw87r3DHYuTKP7dvyTryNT/5o9dumcInuJ1CW52o05IDsXtg3lImC7AkR1p
	 6/vuPkaRLcXcD6Z7UjT4VNv0C22SrXbXsyNi6Ce0R72PTl8liYwCeXwbyhOWnkQSmhOuf
	 1DOL2LS1x/pYM8JViqKnRY5W9Z1UJBYjMqr9MI76tFLHSJA3Rr7aPjeM5WzJ3ZOzh+QFc
	 SCD1gBVKr3lV1ZRsXHThInK5JIwNO0nwZHFW8LDIUtAhSFbirJOrbYajfUfrUyAmvQq+T
	 C0aZ6oj63AKkBe0Jk+KFVXZeludyqMDRMjVimrQqvc6k3ra6FVHESp0DyqZNq1RLZIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
	b=ifI5C3CV/UYfslucder2j7mFwPWvx8a7KUvBPNmfE8gB0/VUwCBJVFiW0rF0LhhaJ9n9
	 2NB6vOz2AE2o2bnzAUnKhoXGlqP3sOyGhHfqh+J/QID/Dph5/8dEOguKtMAGbCZ1Jz1cW
	 8hGmFUgGUhe+52QEtV7sX4ooeiD+e45XyW+a25Yb7N2uiMa4N0Il/HCnN/uCeAlRU0wLO
	 VSh9AKV2bzi03sO6ioGP4ACQrAk9/qffVzZmPbyZDEZyM4d3tzOZkiDjaRCJb4GIRbiSH
	 LCa7ClQ4iKCO3TZw2yPSFRU0movkbcupYFSfqP2VuwbAjQE1axjORI9VZvTMXw0W2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wbswU/m+";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32B606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE32B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wbswU/m+
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365d26ccbdso23323991cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078527; x=1795683327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=wbswU/m+t5/yBVcZuqoFSSZ6ngUtluKq8o42yl3R6TjW3xkh1loOM2t4zIx/6y5UGJ
         GDFqKMLx/DbPlik3ZDHuHHJn/m5PLkM5CaqnKO307gaL+u7m5ZJ0yDFE3+AUv67SIl+4
         8QiP3T/2rjMnb/90A6ofNfngclBS2RJJuP/Aqr/BdgNnMPcQ/+K/pJ1N+Xw/nRgSYv45
         4UmqyA6mQrzZTV9ypA5p2dXBiqbpAM69mXj0JPjipPLH+Kk0cuUAraqXmCzcB14KyGMF
         i/6yaUdQPN+mlkU2yVFagYeN/dbcwzju6am8AJJElXrjR85hkBUJlm0V3EoYyoQmf/YP
         c4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078527; x=1795683327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=PqOyMsPLHbU/jqTpa1AKIbByJX0/vb3bfdXB5R24zjcaUS24sjg3VEmoqzDqP37X9S
         WjE7PT27gU5kN/A2hJ6hDlN9QYGWdwEx4XQfmJs7bDVhtGavQ5dcWlgF2M14vFcaVptv
         OUjFme9/IWXoq4s84HbrpfrC6VHScpVais+k0flcwi7FP41YRhpxkJkds3Vo+6JeHlIW
         gNxdlcEl0uQiZyd3DO2oIqKhWChCOgwGfJvgXl9gKzqsF4X30pfATRHsP7nM/uC8O4cK
         8rBlqJ0SfmV73RoUbDaSjaUNfexS9N+q+JWr8DdOXAgBmLTD4ypvo+Dlq5kvJyMMw1Pd
         lHZQ==
X-Forwarded-Encrypted: i=1; AL+hErHmp33X1tviLfH8ukClqy6XoxfnHUhnLUerlTvHPHDQmtEkYmdCPTzHG0mFo+G+LAken8I1ZflonCN7@vger.kernel.org
X-Gm-Message-State: APuU4Z9uia/fp3iMI59E0y2FamagbeXFQF/w37fuibocIXeEvqm+5SC7
	nuSogfoTIVw9PVKHMJw+UrapRDZQEfuzndv8+g7NCZUKoEAuZrx+MeBE
X-Gm-Gg: AYBFou1ZGTXPIuFtqoICw+CNTZ2drXA6FvFgeq1ZozEeJqgp666xtKBogElYE2pgvKn
	mTO+OPe8/KVt8tZmJeh9jkeLAzuVBQ84FIFaS5asg0Df3Dy2VsoMVrUBk0kOMc2wC+zL9R0prnL
	IbH9ITO4OVjDR9E4VCBpwbUGyMsvXwx5TDioQT/Si4rpEzHABjpZKNsqol+JRytPgI2FXNu6E+c
	wBjfXiB6LYo+GxDfhycmHxtvAdVWzVmq4q2G8JEaQ1lXc1soATDuruTiYr7dciGqsAeJzHTIT/O
	HKDWWcAskpNC8tZawiELtVUs84J67xDkfRX7qfN5yiBbGS/R2WQTbFa+w0N0sOAFaKWhlJz8KHN
	NfCaRPv8RargY+tL+PhdGhHu0CKptGK4PK4Fq0Dp/0zeONLHVWO5UptEaulltSxv8a7mlOcFdC0
	UT1Z8x05Nbe9GSat2Sqw8vWFbzun8xbLuJpBcpMnt5CaRd4Of5gFy/1AjjVDV1TpZOD/TsYeY9c
	67+wpkPSnn7hzj3DMBiBrstq1v/vCTQUt7tC2j7e52Ggdjq8FAE6cxO6Q6HElvlVBqelEVobaQ+
	yY2wMjHfEZuL6QL6nMOWRFTPNMcOkZXhlYGMiQ6xlX3/0k7o5y0P3GbCQIjVXWJOuqeSE10hBlN
	4CeVDzJSeZTJM1KyKP9FIUc0nK3cwki4S/IkeuiVb9prTLSwLJPhe+CQkGsaEpjxLEDdCblIECM
	S5aG+6BX0Lo/PgnOWMh+Q11KYU
X-Received: by 2002:a05:622a:418a:b0:536:72b4:b84a with SMTP id d75a77b69052e-55d5a5d835bmr88421461cf.42.1795078526913;
        Thu, 19 Nov 2026 00:55:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:26 -0800 (PST)
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
Subject: [PATCH v2 08/22] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Thu, 19 Nov 2026 00:54:38 -0800
Message-ID: <20261119085452.75708-9-rosenp@gmail.com>
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
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
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1

