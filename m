Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691724;
	b=y5MyuoZcs+I0NfVJ0g/7HwaqTh4m//PY+nb4jpPy6sGea+oYq7gve2m3MY53ykxzBw0o
	 ZNZis6/w5B6jY4Ke+XzXD1K56opjkGluHzZ4tSZGA4gmqR1+KVqi7pAjf5luRumojKu5t
	 as4aXSbH/inatqJr6C98eDqAlY7b8lyq7EaOVZ4C19sjXdOSQW90QeOsmc2T4Q4TjuL70
	 4Coj/qvwnewOI+UR2bkrAb40SA6wAAJ9wF5cKfC7rt4j+TXxISGb7XK/eg5WsyuRT85BZ
	 ihqcsiADvReukPVmixQotnZd2tLOWggXCwtJ4chsLrQMSGuqzXQHzjS1XPE99If8KMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
	b=QcnVDR+Js7or5Qbv+4LCeHY5OenDlKoab1Q/3iFep/n5veXpLtEQgaXhqn5+YQ5BJGhh
	 uFrmZwY0bGP2qYnTy/RUggVOKZa11PJiIYuzOS4gqhaS+632vLV3fmhWhXxrj/zm1cC5W
	 lDF0of0yqe5rL33ElYO9jSyj3dUBVFx4J8HzNO7ir1EEoqWMKcj6z4wPvKYT1L+LYubNk
	 uVgK+kEqy1uSowngTYohmLtGlEOza7dhgsy9YrSmCx7yrC//FHsmrWIodBUhaWFXbu2v5
	 d2+LiP7vIGaFXk0pqDt+59kvWoMg6BQNqZwIIc3op0GPbqzg5Fu8U5Fq9KZQRyinvDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KbYrDQ/P";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E55606D80D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E55606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbYrDQ/P
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2494342a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=KbYrDQ/PBMHXLAVISOahHHRIDwX+5yVoQZvr8C08QEK20RVp+AdnC3YrJXlWX2WHJU
         ZT0pp+SOEpqFrwCM/2V0V1X9VQG6ZQYd+gLJubsX9eYTzDPqCPFMpzJ69QtIJrAVC421
         uyGvdO4HryWOrdCpDIbZRqdtPtolI8RcyXzfbDY1A9QpJQFj7GEI8IaKGATh8b5dviui
         qxkR1mS98ixd+ShtXBITXtTeK5Y3eY/+FlipaKgCPTYYl7CtCsyLohagAM98sooSi+hQ
         btjUOwLlBkjnJDpnL4kAZCq+cfMNI96akqK1TKhXipwCdojAvH71VnoF55uBZj6BbaY5
         p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=GQ8Ya82EFswp13FeiDagbIJZoh6Zb70DqVVrx/aZ5nFdLMUVR67BlIb/1XuajcOV8x
         VkpzxnWuI3TcS+F9AKfM1FDkrhBy6Wh+ok26vk4QeT5R+t5SC2WKv919IHnttpYWnr+X
         KU6+VbtZiznARf4aNR3I3ehG3Miu2l0RNmiWlt7DVwPLO45VRoXeQEq9Ecxr786emZtl
         RWwG3NxrtOBMLtnd+/3s87v05cF854HIcyyr7tbtlnxfNFKFJ8AduEMmmxOy0u75mDso
         UAz2C/7TFUSsmfY8Szq+t33kyZYjMd46NlGptlX3/I5LFhWemYMgFnYEWZtx9DsUkAWR
         8xgA==
X-Forwarded-Encrypted: i=1; AKwUvBxSbkYJxmoTiqKeTj3pNo7h96S7LqCk4TKni5DdpA52OKbHpFE64R2ezapDrXVmVeJZePiFBphvVwIu@vger.kernel.org
X-Gm-Message-State: APuU4Z8TJHydeZwZ5vdgNqKzpOqS66yI5ajWYA3/TWpeDGMPmO59F6ku
	vca33f/wW9e8TIl4pdjDsb93xLOg5MZoXwKDuVodu3kfxYfF3YxAEXmP
X-Gm-Gg: AYBFou0/HDeE/HqdtIRXEYjlFEk3B3BU5e8NKrG5i+W1GhVTp6shL+8wKbPdjbX8I/m
	XOpwGiEHHqN/8Gycn8cV8yCZT4KfoEIkrwKrhZjqflk/3YNLYL04VeD0r9W2gY70zpKqfpRU+YH
	KrdKLTB/cAH0phOb5b2M53vtd77I5ECENFT1vQ3l9ioZU1hGjA82ysTmdiKCSZljOUKaFTQ2K7x
	vwY5baGfjMu/YLr9CqE2hzl+hfP1JyUv8r87Vj8OAlU9l0uYysOGwsjBFCf8jCFMgjKByCz4D4T
	Kw3Tq7cdknEXVzh8oJUWN30a2a5cvAP2UJY+nGTG3JQNreAGO2bw47T6N0LwYLGnbiCL0/goQmu
	O0ChOrILzg4hpIQx0xVX9K56g2JgwKZmSZdMVoh1eNBgPYzKP+Rc1L72SjwVfil7OVg17Cfs4RF
	N3cZU7QTtljI0iReFXguiGTkFPs8B4tH6Q2XZi/fu3sOE/tOPsXAnURsvGlr4waCwrMThWnkj8Y
	IcA5po+xBEBybWoBNqZlCqWy7xk6BPigoYCdeCDhfTQJoXYgQ6cbPuoQy6ak7kY48fmsCrBmWw7
	4V6VGz5naVZB5FiEAcJJMSeN82U6hZbZsKUIZ2+V8ZAbr3xQEmTqCYczMwtUpjr7nzZ2Xna5pN7
	JOxxDNecgdMvF1UD8LCsmpQvzJ13AUG6Mk39cdmY8cKtA1nJ2haXCCfCEwGZxczf7P1wcgBm/E4
	C6yR0=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
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
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.56.0

