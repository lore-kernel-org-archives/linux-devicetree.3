Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691785;
	b=Oz1NDr0JfmgFFAhaFisXpgxyWx8j639eWoZiEstmQ18hNirjbxOGw8gPrnE8vvQduH+0
	 qT1cW08OQn5mkqS53nDHDCTRXcjo5+Xu7yGHC2f5qd9MrxK4vGdrgYcMG+YwWLztT4LI/
	 OrCi6kWMfhwInPi8yQD9HooRE37z72Z2frdy3QHY2jrTFw/oNHZttjRBiPdLfKse8PgS+
	 wDI1JF3VDkZxYIsF5lKY86uct2yRuYS+dgYPvEqxlp6ikLkGng6KSCUxFAdfCMu7eNb71
	 YJD1XyFAmfDqmPxdZdESCW6TKRnivZcWObz7o9E2fBJBSMmCWcmJiAvWkMftsdY/eBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
	b=a/QBpU7A4E0WD0kEMDEpfkjEvF2s/H5wfbKQCPHn+kFqSgTfwdLAcgQeynf+ZKLFpu4e
	 C5z+3JpuPU0OoEzHFtyUy4MVfS1RWqL3nnYf1ZiFPxCim7xpPLdP0G+2xyy76Li7Yz1sk
	 oGX/5F2uhDpMetqbxiRmVoRXobvX27Kble7nX9yS9ec4eIgozQIWYo4NOygTm8FWH9pZD
	 HsOuQHS0MdyTmK5/jZMITn/k1njjm0CDQ5KAvmErYy8lbolbeEjCV6oZnyXacEj047gz3
	 tqQlKl90PgQ0cLt/7lZYgGOERR/wrcz8kPJWtoaBT1JiGdMv5Kvd2WhVdlBQZT+HeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAAB606A32E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCAAB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ccca948203aso1460585a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691784; x=1794296584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=HdwKjEeFEH942ZxOGogEM8bpcjna5XKdLHEWZUvR+Qht6XTnOavyuLda+ynqDEE5L+
         D83KhSeN+eV1IPaNK5klaT5e7glto2MLFf29VLNLMAmZInveWV2cWHuw/b1Kl+FYJdU0
         nV2zsVlU+TAx8Jmd7jUEf5eh40kF1Wc8yRyUIHQjYjjjUz/gEWNoTxY1fxAq63lUzzOb
         FVlU3XQTL+pwnSakSr2AE6Z6lvcB5MO9AR5maOlwjWZy2IcVlGKDOL6F8tSWDROyFQYC
         h0mP9NqD4HdxTJUTg6AuVTY6aohgTfHkf8CTs46ctnEK9p+T/zR3CATJYu0gtS8oipew
         Tb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691784; x=1794296584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=A06NpJosK5f8GIgJ6xdUz/k3edCmKwQZ2NGxSwW4YGPDxp8Fjf+aBL+nJRqiv4v1xk
         LstMbIqYrsmAUvI/KBoYBoNV8ugFeNTIMsm8D+99CRalsoaxrNRIpQq+p+b9RlbekKxu
         KIrst4JGG43ulz4VeD3BTjKPYcdPWj8vOKrF1fkPe+OwfJNP2vnVoCD5ZEeQ7G3sVbNY
         ffZ8TOgRovBJaEUhnSyRxrxzFy5RVxnlgJKbSJIzvhhdSNk8VPFX0WT8vEWtO/Srmf/L
         ki4ORL0M5O++7PovUDKxFOqRAkAZyikQNA45dbTjvb/WqKr2cWnekxW926dNaQsXv4Kl
         czCQ==
X-Forwarded-Encrypted: i=1; AKwUvBytgDg5J5EY3yUXNQNxl+ol777GtZT4ICX8ABopQ8KNkVfZwhwlvhUbIYH0cb9YvGqES3Ptli0lae79@vger.kernel.org
X-Gm-Message-State: APuU4Z+V94FQLa3MfNK/mxVWvg5zYESVf3nKsaoS9zBLfc324RAbcYYu
	maR24j6awqwXS39IVyKgpXWxvxNgGxoiFmggPtFHHDZRtuPcnPG9gZB7
X-Gm-Gg: AYBFou0XQjhiStEDTdHPaPJJkiUq3DhMCUkSWuf3jqOHS4sHYw7ctzwFeuWnBZGd7aK
	K3lAzbCqPGqoeMfFjAa39osFKd/x8CE0g0Hlikcj98YEsGWA5s+uLkclw4wvFqyDY1ujLg27GZt
	DocN3t0H/HUYxkGiWc0gSbDLIAdZc7muFr6MsbCXadLre7lvW6m6pZ+MHQCt25YmhbALiobFnka
	yva3TnSbWjZ7fvcVP+8VjddndxWUWBL1p7KWQVb6Q/haMsd2ecJfi0gu9JwLYIucQVuzfeMCBNK
	NKvkV1JivEX0TD2l06HvKsbepuL0ZXyhCV1PmQex93njuyUBJuDzt1lr03LSRAL8js+UGL/gW8E
	FJYMuzOgWuElEwMNGsEvXVbIBmKYlco81bhVs2SDGnOc3DRkBiIvd0b5upnzMQM0Qy+RdW4vX0a
	apFFzWWcdaL20h7ReAuBiQwoQSj5EEAQdj6ZoPc7B3O+NvnnNdgkrmQDBKlOzxHr3XmqPeisDfU
	zynkJmACVBp7qA5JWwHjgE3FQKMrJY46UEoH8d+w/+U5vzDNFQZRLlNb/slu41NDcLLIryULRZD
	Pk/3wkrKZhBxR1Quhk5oYDCdcybGCGBGwrPk2dNjLk8+92sWzOKbZnxYghkWpUZAzLaNxZt9O9C
	URXYGDbAhDesJ6R4oKwalxcj3PAHleJGYzruCCbklu7dHZD/YlK8QmFnj/RwKXUH37CgIcc7k/M
	oE+8E=
X-Received: by 2002:a17:90a:f6d4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ae895362cfmr7683697a91.3.1793691783996;
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:08 +1000
Subject: [PATCH v4 20/22] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-20-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nKyDcyWpWxK4UlDAQg1VAwHp+X0mdPayNaMxBUVyu6A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y8Y//97r25PvzvjpWdJ34WepC2NXJrklmvY5H9/j
 uWRz73zOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtnMnwV0hRfdnZHy+6mZX+8r16pv968468OqV3m646B2XuVvj+5TIjw5Nw/3f
 xm7LLL2+KOrTr6pPtNR2vJr/zvvMpc/tWg+cP5bgB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 61 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..fc45dd9b1a94 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,37 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"

-- 
2.56.0

