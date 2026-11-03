Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691707;
	b=N+WvKDDZLTvOns/d7hcQQQoG8FwMQZSeer1Vh1A9mdo5fb0mpNL3LaXhUSsLbAEqBjAp
	 RApJpddyAbDbSPvFLxSStJPdQgzRWKhvZVsJ51W1vAXS8aCnoHOCarQx6Qf+8PkZ/wHNF
	 kWgTKHt9Zh6BUC8LvGlrZ1Bj2O29Q491rx0iN2y2595quci282asn50jRQh7iE5AOvJRH
	 5hM4gh4nYpV7YCg0XJ+5lqdtXL+nzOC+w7MB3iX5V6LQLcEOgrX/MwZLNBEhM+BIdwX7H
	 lWCC8lFK6znS/tLl9g1kp8jPRTbf2Wv0b4C2za1gC7RKWhLG3FCewmDBHOheyXG8lOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
	b=5QRx25idduAYfHmQZ0TmOITS6y2hxOjRpX3jn+6rKayytC/d2//49AFFTuCZ062ExNs9
	 H9uKyTuPsXJCPQyLaBFOMK/KLRt8iOervfJOLYadZOPfpYPtXb4HaeUn2TViVX4cfkzEL
	 e5zxLhlwSL9/YsJEuY3Z4D2kKlU1QmjnSNjeCDm8PaDnLEWtps+v6Ay+8Q+g3mzItgdTl
	 yX0fGDho9cP0xDVNAg4JRldAlBMvlZbVzs+wTYHmo6jZKVoZLcCvs9/SQJBL+ZiEBX8ON
	 DNJzvhcIwGMkJcyjQ7VJ9n0NFievDQ8LJ+gJz2WNkszi3QhB8jXzg5j/N8SPvU7fhhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AD606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8b20a899fso26236085ad.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=FPBPtoN9j/4seq6gAf4RWywkPx3uJ//miA2/BnYi98KKl/HpeGvOt6Hr2aEnr4nMhQ
         flMLzJUbqm3wj22MTX5v+9Oz98MnOd3zEg4keTJE7wR+o9lvH2W/s7Okd/xxlylSkitG
         Om9pA5owP3kJ9I+8fFBjfrZ7Mh7K2DwNEWLfU3XjMp82U0zKvp2hU5rfxCpnHzP7SE9O
         yDI2+vbU95Cr2vRhLGxEWQp0gL1lIo/3I41Qxr3LeHakdUYLSA5UC2cRqEQeRbXvy3JM
         jvRywffmlvN7K2FGJzm8h8Hw28Qd/MI4f3u3vG0DyIbTrDWmJAfG25hsM7gDIxPKo5nX
         YElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=IBB+3f8jJBhKBRaKjEnlyQPqtgXQYLJnfgnzb2J9j+QmiBBd0YOQsRZ4C/DEvsY4Xd
         ycoamADdPr+e0l944xvr8Lxydr8pdCQ8WH61sZimgE8hqo9q9t+DoyqMscV2/5xi1UOT
         FXXbnPcsR4gl0Et+JmTGJZxWn6GKBHrZjj/oSHwqIeZjk2x+i3SoPVe0EaCiLdyxIGLT
         1VOgzmeVJGNjHWXYWCFYWOHiIWTmv4LBijg2+V+uYK8tV3NTVwAdKlVFB1ZvWeIb5rR5
         B01LalFTBJo7A1ozdCSHzFne5OD+5qPHE4qTjsXKF8Tn4ioZRFoX0hqWb365ANa0aFKi
         u+5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwol+WeAVnJh7OqRSDHt7Y7veL+swp7NotRxqSwn+0K1/0fIoPslABxgoT4vx+yEREnrMHvkST2syCD@vger.kernel.org
X-Gm-Message-State: APuU4Z+xMDfueG/YofSdBVg6AMMBZWHlIoMvV2sAzOKatBbNJpJAahLQ
	JG4TDsJ6KBSXHWYebuuVyfuFKUawp+Qd89y6HWDdoT2A9nO8P314Ve75
X-Gm-Gg: AYBFou2ZdFHKduHYU438LSrmjHAZkFEYkbyFdKWgFySCNgJv/BZOD5YmlZQmCrXUtLT
	69RKiPC/fquOcNUmkJDD62XZKrgizlJzvBXIOzkqsxk0+7pSlhW3PrLJzOuCOtzjJsQ6+0jsjmQ
	k/Z3NS0kI9uKsRbJfyi9YH1Hngroy5ABTFKe7yyApDy0V6YCVw+h4ypwX/OtNnEWgxF6gKzsJAE
	l4rq2eILDFiCkUtXOtDr5gRBhTo6xWCzKh1GnLknRN3dhHcocCd5k+d/i+GdJSfEJDUs5DliVkx
	UIwi2CXr3T7vPk0gPMrChJftD2E3GPeC2C2AtJllIHBwAkyfHxWc51BQFhpWiDGov+MjuZi0QB1
	wRK+dLJN83QOiPeyG0hk3QOUNw1BoYWYHIZOG1lLOL4bEwNRgtyPGPZUdYhxQf3Du2PFXVqXdmD
	rdmqa6ImRc3BpWBLVBYmAoczz23BkI5nQ2BuWK1iRPV7XpFj3mHul+o/tXSIkokbqvSuUb0wJF+
	cJbH3odLuRwEkqvE1SWChF7jj1BiMGH3DroPnnA1dTeMHjQ2MuwKTkVt9u+k61Q7jsu3UO+8jAt
	5pvYYZQBsrLJgFohmqSp8mPo1zUFKObJXX506XqaC9LaNT2g1CJ/Q4boM3h4x8sDM8IKrwCp4Ip
	odNB1QNDr16DtwJcTdvwjlHYIlXtjEjTFmFcdZvX2fcsmhx6aRmFtRewD5YuoRa6Nr1Col1z5I6
	DrjxxE
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
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
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
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
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0

