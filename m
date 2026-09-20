Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044A3D0914
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880276; cv=none; b=iDrmcl4K4AmPAnWdpSvNGQS62+8TDULWeboOGzAO3qSuV/Uh0pw0UxflP9dXuBSa1QmAAZlP1K8K+EAyHWZXdWGaEKItjBtkTDrpshsArjM32JhWu63W/xVU44ncEn1h/EOHM+otznTLFCpcd2dJ4Lc+uWoHeA7pVymbCKjANYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880276; c=relaxed/simple;
	bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYWJUe1Wpv71HiRptDcoqzqsHuhGfZquGg1w0IwcfIk4dxaPhPyxk2TxIQ1QZ2EEGOfXm2oc3Kva7gokyuHiOUnCFrhKBYUrOWnnOj9fl0xf7kjzTX7b+AgoTd1dY/i0c3swmjzk4Qk5QRjqLtVEJ9gLAVF9RvtjnsGf0VCYql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT47P8Zd; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT47P8Zd"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df36461d63so4081665ad.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880274; x=1790485074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=FT47P8ZdXqNLrA1/YaDL7kkmG7C6kBgTfcwFi561e98X7/F8ENMY1CZBbiqWMILDkL
         eKL2X3Zbd3vCcFAFN3+sVpj/cthPDj1hF9jRZo6q2z4HpeLF0sir7IxoWE1KbdYCSV2L
         hoiyUWt+nxijYVqTtTHjLQ/PHVcYPN2Q0XkzhQnDUHvyj+KV0EW6nu/tQZ1Y2fV+o8pM
         WmKM++7kEEZndFj29XYQv84xFHVmzFbb85cWhMVUFapcUn8u4Of10xeg6sPjteSnuH5g
         TLBt89vwCBinyTTmxRge5C5/FibdKFJNhU67CeID44AkhT2o3Ga46imaBXPf/yFp+wRr
         LPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880274; x=1790485074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=EjE/4qAX32QB/Q8ixgNCCtgq8KmOPuyS5kBfte6GgV0PB7hwL+1+h5WcQN57CTC2/Q
         rqAv2oux1QaaG4OlBveZuZlEjtDMHJJGktKkkh1XXXsZve7t6+dJfTCNq7w3ccTE4/yY
         0FkkQJqirUj547frqoIloDqbcfTZopXcT1uq5mYKT8hIwNLC+s/KDZiz9yVNKfjGUlhm
         nd13hkgsSrZhoXqKAF1rsrerrnvkUA3vPJbYvBuCqIpm44OFkNsPOY464xnUvFO0TGRs
         kG3Hc3SBrI6jdpRBTTkqCl2wq7jHeJb1nJrWv9bhu9l8phkPu4oWR3Zn7yf0ZVOXnBK6
         JG6A==
X-Forwarded-Encrypted: i=1; AKwUvByjKBduVPcwCcl7xlR2XTkTJgdIbVZ5NxJD5yKSf4FolzHZffg1yrRqlPFxtLr0DBEihbRXbaaJRg6K@vger.kernel.org
X-Gm-Message-State: AFuF++lY340I3IIPIz6Ez3OEL2Cj3/uMmjvB67asYmPPMzzu/OL1AGyW
	kv3RipJVLqg9lbnep1Zo8VDBbKseiJioOrGzKAzqU5zsGBDAhb6Q4EG6
X-Gm-Gg: AYBFou0+Inp69GI7pTOz9DJntzuBxuMkvBUuVkPztXGRYi1XRQ/J26QxoicYWzR8/s9
	/dqP19ShqGGI4C48miWWG+jtYcmM+wD7OpLRDREwicjwC+h4aWVxAyXV0zher22gTUV0KQpO6F+
	wfA6KJYdeTrpJyeyvaCxjfUANLmVUouJhhyh6lA51+tfTYGd6JBvXd9rhjDBZfjr5WJ6DFY3H6x
	iSvTXfNgPJ6f0f4TjhUGmfzzzYn83egLrosob1MU8bcugxH9jw7BWf1peMnP5vZNuQZnXHjz9QE
	DOtArCh/wNsZJXVrPUIez0DdJ1whgjdGV7nMO4rpC22O2RVIGF2e+4OWL5bBXKP7eZTw4VzYk4J
	fo/fBBIPltctwZYgPW+uX2KZndOyVUneUu8cY/C37xwUGChb20Ahl6OW5yiHmEZU8rRPV1bKiYY
	Rws52u/YC+D+FY/6XjMNDjXgGiT8pH8neSJWlKX3frxCpEnwIL/e6bhB1dY6nffOgVShpOi3cgE
	tGNj41XzfPoVpDV2aDQ7B1wbW2iW51JlJC+oBwMXGvhTNxpRyNTtFlWedlJdFJuw9hzjPqlw7W6
	kVz4Hhe4/Bww1Z2MNGzmWWIPn7PiDjO7mos/WKX025A7oDc=
X-Received: by 2002:a17:903:1a0f:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2ddc0538401mr56050135ad.38.1789880274403;
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:57 +1000
Subject: [PATCH 18/28] arm64: dts: apple: t8103-j313: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-18-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWb21c66G3M4JvHv35y8tKklc9PTDVZ/u9cp9Se1
 TM7LBnEOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPNLMTIMOnKCZnG5Qc/2M6KzS1409PptySZccGOP+mzG6/GRCytbmVk2J6X9P9
 4R3Mos7D4tdcO8pv3FzRPULvT+sC76gqvaqwXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..514dd56bc9f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,79 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio", "apple,macaudio";
+		model = "MacBook Air J313";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

