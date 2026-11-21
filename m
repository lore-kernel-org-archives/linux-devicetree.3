Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795240525;
	b=KZc5LgbeeBfAFz7GqaqQN3eukIKeTh40/a1D5Bl3w6LANLZlyMd5pRaBkupf7V0DDTep
	 OxQxcOOIAhHYJXGM6NaR75h4xsQ37jct3iMr3y4GO+6LaTlyWVw/7yBhrvejUpd97RpM3
	 5dmy6CMtDzkKf0gAqL0ktx+1KmSWNS49o8hbTRJcfWiz+UyRopCYg2v2VUeoVA6B24BHT
	 +OoFbJl/agQ1TXd6r3zRqyzBPNQXfM169rnKX3OgHj8921t+UmzMUwDJXuxP69mtnMQol
	 IYTCQY0TDpdIHpIDIaW0YvMVkOaUW8+PPA6x/tgITxHLGot2O1fwgdYPpAGlfFv1wVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
	b=dR1fEq7+kGsfss6zCkLRUliXrJ2Vvu/XjPlqA6J9wpNj3lRUdcq13zZpdJgjnWYPtKhk
	 O4jimHt8YzycM0BFDprPBep4CPyuOak6kwcDYnpH3L2QH1RjnGGEnzTWD1yNzo/0dqGQT
	 jgYOi1/LzW01ZFq6STJZLVnk30yEkDBXAJequ/B67I7fUFlyYUUNjxKiTtlzhijWZWb3f
	 W2NMnA41UNY9ORKK6WuwII21B1kC/ixaSHzSriXYK8uyCp72Kv6skj8POYq/GftM2sp7x
	 WdDp+0pUJwh0PgCD7+ZjSTDNj3KCCkTqkBJFOhISyuBqDFFYY0wgTJEUofrwvu6qj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FMl4lK;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58DD606A6AA
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 05:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58DD606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FMl4lK
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so2623966c88.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795240524; x=1795845324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
        b=z5FMl4lKPo5jDTZak4fyIIWTlt6W2K8PrGOgBBb8aEWjMSRIocc4vo6nRWZHfxm4L7
         Vgu2oKjOnuyXSxGT3D5Rz+YHuulKC+fzS6Tno0D4BI1du5okq/NMQMv7fqeaqG2kUteT
         6XgEvlTuzx8ljPCOd/eZQRIIL53MQkpjEKQzlg5UpJwAb+MaG70OgnXP1I/F07zRylL2
         Wxsn93eQrAesTmNKM7DXtUiXhkRq1kO76tskmDfLeFlIdss4d5gQ8QBWuGncc7rWwtQ/
         dzx0IppAUmcaz/pcwFYhxnRaxAgaH94uMrfZfIoN6NP9xAgPipogFd8mLwMpOjQRcFnN
         ODFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795240524; x=1795845324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPYFuPEgu44jhRwl9AuTqHxhKDURTNdBQkYhdhcmNfk=;
        b=Y3dzfnnVRaQQPsYjT/arPnrIT+c6uZWhkymFqgHJ9TbgVs+li1T9hpeIclCf4TJt4Z
         iMBzaxSGjNvCgzM9hmUon+Jr8knj6y73H2kas2Yf1G+UANejhdTXr8IpZCNcgp6VgJ8j
         bsAbSMPOmWPylUPu2A0UbbeDDjuh3xBQXugf3wcYHrRzWLcizi7gsubaetDJG4vr2pro
         347i+je3gLhB+aBYGBermX+4R+5NXMWYlhSg4+Djvc2VGZnRF39/3l59M+KpE4vgtLQZ
         2rUm+binJkSVIE2P0797XFztL7ft2StCSG1GzC+4XNvjXnuL61aYHDDZTlWhBY1HJ5n2
         3nTQ==
X-Forwarded-Encrypted: i=1; AL+hErFUGsiX+XUybWoUY4z9qwedsSbmDenhtj4GdGDTqIpjkv2arGaxl3hoo8lJcBsiEp1Aqk/YOaPt+aDu@vger.kernel.org
X-Gm-Message-State: APuU4Z8H06ePWbsad28MrQWcUWmdkfwunhfAnf6BgH98YQhvozYa+0ZU
	j07WA/lCaoKND0AA+hKKZPY44uOgRDOlNFSq0PVZY9AMC34VN92ta12O
X-Gm-Gg: AZFdTZc7RtEl7TXPf/6JHye1PNLk5xHqzyPshrVc4v8TIiSYnh+7YOevYZHV7Jwi6UX
	OnLOs+F6pw/DQ8bBQGBN8/PyIaHbS37et0O1Psd7NIJGOCTJ3TdCSQxuYm3RqKMn/wdvMYRVRBR
	F1vCdFSsb8x7e7LK2pMGMPk75CNjsmGi29SqPnlmaJKFkgHMYidqxytVMoQTWOxexGZOpMM1TUp
	4oKnupGM/qSFkAVW6HWfrlsyQrxBi0boMMu/kVdTT1NWiRE5mJynWv0qMOYHFAxJSHX9HkmgtqN
	ERFFnrD1sqfaqwSRA6sqbclFa/hccRYF+ANGyJjZwBHXal9DN228xpGCph67NMSv0ySnmQlRdAb
	OX6CXqHGzvaPH2kjX+hr6W8su946Eo2nFJT1HX4BDyrcHjA2Y5PYHA1A0TgIPBnK1qwuTGZWoAX
	O7/Iv6kol8Zm7LKkTQ8mTPDAPwzPP3iKayWaQcuSPxZlb/jJR+akDJRxhLsYkqbfjspSBlXOPP9
	3dYnhiYuI8+uTy/qSAsb8xDBeJocrFVN3xqwd1RtmzOAf6ue8uGNS7OEeRxxXrUqy9vyyV4BgxO
	q9YLyHoVo/qJ6sI12SOiiLHaTgsKxP8=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id 5a478bee46e88-38570f27a56mr5280716eec.32.1795240523983;
        Fri, 20 Nov 2026 21:55:23 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:8863:a72d:7d80:d674:e22b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm14423662eec.21.2026.11.20.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:55:23 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Date: Sat, 21 Nov 2026 11:25:10 +0530
Subject: [PATCH v2 1/2] dt-bindings: iio: magnetometer:
 infineon,tlv493d-a1b6: add TLE493D-W2B6
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-tle493d-v2-1-92d7e57cec89@gmail.com>
References: <20261121-tle493d-v2-0-92d7e57cec89@gmail.com>
In-Reply-To: <20261121-tle493d-v2-0-92d7e57cec89@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dixit Parmar <dixitparmar19@gmail.com>
Cc: Victor Chernyakin <chernyakin.victor.j@outlook.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795240513; l=2626;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=Pve1oOphWw1Q9mky6K/7lRz/7nV3rjbiYSeFFIY8C8Y=;
 b=J8EEItayLygRxFy9STgBbIyjsITUuMWIJso9ogNh4CKPbukNCbAccJU8+yftE3Vsfi+Y6hc4o
 hSYCLL1HvMxDTho2NS1PE4hwBu4nq4kctiybNI5ekR9sPV9xvVxzBk0
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

Add the Infineon TLE493D-W2B6, a 3D Hall effect magnetic sensor with
12-bit resolution per axis and an integrated temperature sensor,
accessed over I2C. It is a second-generation sibling of the
TLV493D-A1B6 with a different register interface, so it gets its own
compatible, but it has the same supply range and the same /INT output
sharing the SCL pin, so it fits the existing binding.

The A0 to A3 variants of the part only differ in their default I2C
address, so a single compatible covers all of them.

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
 .../bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml   | 14 ++++++++++++--
 MAINTAINERS                                                |  6 ++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
index dd23a9370a71..3f0058cbf538 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
+++ b/Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
@@ -4,17 +4,27 @@
 $id: http://devicetree.org/schemas/iio/magnetometer/infineon,tlv493d-a1b6.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Infineon Technologies TLV493D Low-Power 3D Magnetic Sensor
+title: Infineon Technologies TLV493D and TLE493D 3D Magnetic Sensors
 
 maintainers:
   - Dixit Parmar <dixitparmar19@gmail.com>
+  - Viral Patel <viral8854@gmail.com>
+
+description: |
+  3D Hall effect magnetic sensors with an I2C interface. The /INT output
+  shares a pin with SCL.
+
+  The A0 to A3 variants of the TLE493D-W2B6 only differ in their default
+  I2C address (0x35, 0x22, 0x78 and 0x44).
 
 properties:
   $nodename:
     pattern: '^magnetometer@[0-9a-f]+$'
 
   compatible:
-    const: infineon,tlv493d-a1b6
+    enum:
+      - infineon,tle493d-w2b6
+      - infineon,tlv493d-a1b6
 
   reg:
     maxItems: 1
diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..c3004f683e78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13117,6 +13117,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
 F:	sound/soc/codecs/peb2466.c
 
+INFINEON TLE493D-W2B6 DRIVER
+M:	Viral Patel <viral8854@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
+
 INFINEON TLV493D Driver
 M:	Dixit Parmar <dixitparmar19@gmail.com>
 L:	linux-iio@vger.kernel.org

-- 
2.43.0

