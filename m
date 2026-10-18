Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F4430CCE
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302973; cv=none; b=D23Rt9URj1DIoqZrKHm3EgbhE0xnqtNOw3+h+1qyseV/qRIFK4UwvntX480rFinYokrJU0Ok+4+ux7uzG21UP6bEYp0D7DYwk0myZX5nQPjMYjRlWOjCYzahQdDybO4fsywkalQUn7ldfyeRUpl62Yn9STyWHCR3sKV6LBtPJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302973; c=relaxed/simple;
	bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtQDeDhZ9kaXUA/cYW7EPPw0bL9y4O9YV8pjbSa8jQIgKK6MWmaCWTliQFdaRT9twV7NoTjyHr+025IZ3jYMBVnTAUpMsYg/P7vHp/27XY4nMODQfLNQeyy2zrBag1exFmVXhbnWkBjXAFUravh7nRq/YngAYf0ypq47K5FuxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZgkE2UG; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZgkE2UG"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1101816a91.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=OZgkE2UGSYCmkKP90iFfrB/IVNMt6wGV6c0EohJ8rGRSwCDGPwxwGXUque42Hawrz5
         +5T0h0GBILlBssgxHDKcm9cfBG5IzPRY0RPzo6LxirRUannx3pockcjhHq+kYUOqIRNT
         zmN6QNPJSSFL3Fxkozwmjc7CHGpk2nJ8Z6trqgSRXzqnU+HiOmYsA8URNuuo7yGLPc/J
         sAX/uV22uVzWCcK4L9NCpt582aNdyvA6NhXO3uSfCKlwl5KXccldnYXP6M66b8LDkEqD
         qYiDKZiKCBzwsmnZKxwp+VTWWI0tSPE4Gq3D2/g9RDU6dC4hr9Z3QP+1Qeq/e58pns7i
         oqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=OFZW6V+nIcj2pf6hgZVpkFuqmWxL3wRRkxX9ODPM2QEAV6w2Px+W2VfCywphTa0LkK
         nAPrMamOvPa4jIpZLMN/nfveV8eWlwGSw3cycv8Mg3LU5ofIAYTNnRZKdUa4b/2mn+ha
         q4DLOrf9JIagjxphidUkXTyunItfgtdg+l3fGX6U9vEp9bTXWDvTjiGH0Tyj9Qpd9o4o
         dZtCg0gl0SDw9HvdZyrbIm/GXrAiOwwj85G0uhbAIoXo056zc8+b4SjRVcVdLeePiRZ4
         3hGxNQZ/NfwEJDIEZdMyfaS9Zo+4EdnjlJRNT+c7Aif3SDovDdwrHmiZD8bhYMcL7ecr
         s2+w==
X-Forwarded-Encrypted: i=1; AKwUvByQdVB8nI0D0KFZI06VIc/8lYFUYDOnjK/5t+5tUPC6Rn7KyDzXet9BA0VtcbQ6zvW005AfCsdJrH24@vger.kernel.org
X-Gm-Message-State: AFq9FYJZQgzLO1CMIyH5sojszjSa3x6JvRXo6U24UQK0Z2p8CjHBV89O
	h/zq0CCnsVo64acKBk1L/5L2UNp3iQQSgar2DVtu0ZxxOJ6g9tay74Ma
X-Gm-Gg: AYBFou0uQ+k7uyIMT8DgC8RzgtObnFa64C59FL7VV9HWfbX/nZN1KMLnNGUBEBh1+qU
	4uyEHusGZaF4OI/A8Abut2O3nDqowiVG3ma7eH/CBAKgvuR3XCCZsZMeL+lZomAfKCKTGVBBiLL
	2ZLcZKWLBk8AjJaajpETKcmeEJASsROHxscaAgcoNaozDnBrvUhXCF0Os5CeNxEbddQlnv1k7qB
	2Sb/YZSYYgdB6ZvDy4e3oqznQfq60NpuF7rc06+ZQH0Hq+15tA4+7ob3zjLY+Jc95G8kQ3HMs8k
	PqKq571IBNai1HwG8CTNVGcmcyj6ksLprI7qSRHOIK1TAfYp2UvCNrOG9bkIZMa4CFYn++U1IJE
	UsNs+dSTVM3Qg8w5EXT/lH9W76ReEcnawWAYEQtYns8IvNXzQYe2VtpMnSaWdYCKjfZVPEJDRLH
	P6/dsEheps4ho1RKj43ulx/QT2kgA6+YBpWM2xPotF5ikugyikfgJ0hnf3Q7Z1Y0qfRehQFeCNe
	YkunagUiOYJdV2/TD0mLc8h1JDKXHLw9TaL//jOEuixAxz+8QXg96a+NCyoDzp3ipv3fQo2FWYM
	Lua6CVWZG0i6FiKB0mXh3RjFMit6ZTHZ7WpoSSvGSbIoolGpwnzgUnin
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr3948159a91.58.1792302970047;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:04 +1000
Subject: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnv5xU5ifpW3Y8/1tgrVHjA1jpI9H2itEec0gq5j
 cLG1eIdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqdafychw6fvlqiSXi6yOnRG7j4qU8a7tZ3v0/xjfpoCN0V+n9UyRZ2RYk7e4/Dy
 XRAJ37yHxqKNftsdpXTjstlGpi+NdoK04pwMnAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..150d778565f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,76 @@ &i2c2 {
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
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
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
+		dai-link@0 {
+			reg = <0>;
+
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
+
+		dai-link@1 {
+			reg = <1>;
+
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0

