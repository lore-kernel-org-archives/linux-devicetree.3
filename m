Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691742;
	b=5hq4r9lZ0thQBLiGU6VPHwUVT9sUMDOa1HwKG9LsGJfTvhEufaAkJGhRlET9O2XTCRHk
	 khsB3x4bQstoRpu/CSocwK19Cykw/y4gUDM0j/lizAOoihaDGEf0iVSgykkETqQ8JScLp
	 OveKAUKKHa3MBsg95Xez9SbYiNs2s05nHpFeRqLAKuDqdyATBpvpvnSpO3fEOovwJlySl
	 ACoOurQU9bpIH+CavkLNX46DfueIShwqdsRfYJFAVyOrt20BQ9cqJJCLec3Lx9CgQmvvB
	 UL3SLj2OAf/gi3yxliNqiFAkrunALGc6b1wTTgtsjQDVPdgVqLaUzKvWBlKMwpfrWSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
	b=EA8x9reEv82H7H2ZVHmUrHbyGbX6Tjdg2Z+AYabnWsqQD/7wKpqbb8kV+5vS1blDDHcX
	 2y/0KIOocXvMDMo0oeVIK/w+LUvxbkk5Q60grJpeXFLPSuaO/a05wCN9lhATu6h0M6sYm
	 V1pEz1y1YKbPZWJyzEloFblcWZ4MF1QytNpMPP++FH7REBUy+aQGl9Q4ddSqtLZO1cfVB
	 q3xBGhBd7+0I/AMj2liUPYjqY70bResaDriSd7OFaNNOuN3m5TrMPb6rX1j4tAGakPsMT
	 qOLIT/p3klb4HpFmhK/vfDp7emiBSVqPCQ9/wwXMrQRcYfWeVvtWWYlJaNNZwvbQSAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365C606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A365C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1535131a12.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=yThAhWW0dRG8CWkEVUNCoiDTPtmkgzZstfnG+kQOYR4G5uwPhW5fsUw+rKUiQcbqaE
         rUkdNIJ2vrFDrIKp7o/OQtdcBifdiCnOIJkbSRHLKMGFi29uPp1jyVQqDHVUWbNK1XTZ
         uWrzQTZqRUrWBeNEL4s8ThToNqCwx3WE/w3ynamG2d6Mtli98IwwLtKPUXFlTT0KCy++
         4Lr9SYM2kVxGHm6LSQq/IdXy3kwnSShMlerd5xEo49BA4rgbsDB2zvdQYJx+hpipwYyX
         7wJveVDTWHZlTharPfK6lzHgyfBVWeL9bq8q7b2YDGx212amOK35Hp3uLbwB+Gj1eBN6
         mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=KopXPsNK8epcXJEsTjdc6pkjHNSnbVD3Xj9/jZb4dNOvt3KvEldTElqUzbJljxrMqG
         PzuFqc92CUJtK0iNlN1sEBE2sepIaJYgES4XF50ohrTS/6jYwGi3Klu5AYQtmWE9xerl
         kPO6Qh1qVNDeIZOX7jdOwWMiK1riKw0QlEOr5SyeF2HyyzkAO15JdVpRwZ9UZJMADgvr
         Yzh6t0WaC2vLtCikRfz9XxJrVFNHJ65uhYYTqTGjraGG8+b21kLX6n+V//e9OFIbXKuS
         /79Gc9GR8Dkzc1VV36E4Y1nEB5XLxKz9muoEgYnQJSm/EU5wtFCW85YR0Us9Cpgppy63
         wrhw==
X-Forwarded-Encrypted: i=1; AKwUvBxd5eONqwAjZkNvMgohj7NvBruw3ZXXRXHq8SM7+S4AidvyME+OjyYXfjvmU6V1Gr4VlSQ5itixcc0u@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cuw7wJbCSLcbwELvvXzzONez1EFPTB3sEgBzApx4dsH23GHRn
	7tiRfs2IReWb73to8AVqJZtOBkogjXz/0YT3KParl9FJDQN2rhV9GsN3
X-Gm-Gg: AYBFou033Dd398o32tYr78DOaOMgjgpHo+hifroxarM9XwJLJgi9GtHGrrrcbLD1Q2k
	IxxHEB0zKYCGidC+9Wyl+ZdqLuBDfVfJUKRX9fSsE3gZYKpz92QKsvFX4vlty40ls/hmYKYhBP8
	OMcqXTMPyA5ZaRrskP7BZvOQCiDETFGOBHo/ZnV6JkUdtKFK25QY7wn0CqjMYUerRt05QW5os/I
	yNn/6Hyj1yIqf113WDhDrcAO6vJQ2xX3nEnK58N77FImcRx7Db1fK4DeF/NI7VUjd5MGs1RiB/j
	lv+qDJTGFqrz7eKsfrY06QT5+uzdhs/gNXnKMucYgGlALI2rRGWSO7PNVQn5gPwOV9ArweGkR3z
	GOI8akAGCTyMGZ7juUeH7uvPNGIOtC3BIg4BR0ybIzCvVGUoDIotakOf9+4F11MGs4qvv5TE1ie
	gtvCWo8/1OpImJdZA3NXOoJW5W75Hkn9TumvfWUxvgyWuVp8+wkQewNc0tN0++ld+dDDUb90yiV
	nmymc0N7Lpu+AtULmESQ+ignNIO9/WUIo5wsGBxbZFFfBu/VoIxAOxvO3vr1Pi60g5/UPZKehrn
	mHD9N12amRHI81xlPBktOxT6cj/HsPdAaeq/66voFTfL01GYoXOROdRgtd0dn2rFadWKa+ORZ3o
	B7xJEuplw35+BwuPAEND2AIxV6VhMK3/0oknNxdjOWmCAV00hrnGK55ha9tY2vIvlj6PAoumLvm
	wo8tA=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
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
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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

-- 
2.56.0

